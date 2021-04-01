Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646E350E25
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCBA6EC69;
	Thu,  1 Apr 2021 04:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C366EC67;
 Thu,  1 Apr 2021 04:36:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9cmFbIHdoW21Bz+4VnFYoyyeOw5khGSKj7ulWjH2BtswhMY7Omkqy7dIHBjVinGvYG3oED6h9k5A6C08Hyr6JZs7c4nsS9XfiVcwDcBNPssAhSnpAY7PjgJCFnSgShpGZYdPVvHLzGMXtS4rvzPKths2wRr7eMXPFB1vX9WxXCPEIj27xjgJbjxhzsUxPoCUJEK05DYJcp91LLkB3nRiGpiwqudkIclomPSb2XyO+OBo9iSZprYry9ua7Ux9YtrYdeOmi/pyE6Fc/BXzYrtpOKkDHcMPuVJISru0zlMR0s/z7KGnYSyAlj271QnoGFmQV9PH6vCygTQjFDefoXvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejMgJ8fnXEwlcixRqq3KQUF2aU9d3sahyhUW+pk3duA=;
 b=EzZxvEMCFhOMI8YZp2OxvvwhL61Ee0xtWZtAYWIzy1wrBvW+aZ5LzXkUhrpZE++G4zucdChL8JOO8iR+4/XG1PVS9nBL4Ednm8hK/VWZ363D0epmVJkn3AlZm3UXDEUV0LAowfZWQ1GI7uFcFQAB4JDdMbMyYpWyI0t2VxRMpvezzop5MeaRsbr/9Vplr3CJw2nUre8tlNO7NzfRDIZXtf1vd0MrQxEZAY9PmDKyz6GLVnaHxXVIBw7Jy2HVxbdf6bZ+PubHuyyKHgiNhn14Owabb9mapnziTXY1dwn3MsGSrp/HiwYQ8OVU0RBwjS1K6ANmb9YPE6Ny2yadUw85+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejMgJ8fnXEwlcixRqq3KQUF2aU9d3sahyhUW+pk3duA=;
 b=HCGR4wE9MDn3IkyiY9NZG+c95xYLrf0K2Cco5F3VAH5ZYEtwNDSd7OjFE9Pn0iY18jvq5LZgMJNo6tCOzEG6PZiQj0ySfXJNnIXr4lq5gUDAJ+32FLEhQ3oQB/hiDQSUpjiuflteOE/eJEwezkFfLoursYPs313wsNmFEVxDQ/1Bs7JJtJfv4DR9lOyCnoyig812QwO8IFV2pyrYrneRCZUyn+hUt3N37kcLUOFMcT8YW/DXNGMctnm4w744U/UJ2a18NhZINlsfqMJ1lY+Q6zAZQIbHlJgEDp/VhAlYJT5G29Um+4SF969gm20a0TiY9PaV2TLBQlLA+262lG5x2w==
Received: from DM5PR07CA0146.namprd07.prod.outlook.com (2603:10b6:3:ee::12) by
 MN2PR12MB3423.namprd12.prod.outlook.com (2603:10b6:208:cb::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32; Thu, 1 Apr 2021 04:36:25 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::51) by DM5PR07CA0146.outlook.office365.com
 (2603:10b6:3:ee::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Thu, 1 Apr 2021 04:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 04:36:24 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 04:36:21 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Thu, 1 Apr 2021 15:36:18 +1100
Message-ID: <2557539.O4bb4zRkYN@nvdebian>
In-Reply-To: <20210331115746.GA1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <23784464.epyy5R1Yul@nvdebian> <20210331115746.GA1463678@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1264ed60-3a17-48b1-b9ff-08d8f4c7b521
X-MS-TrafficTypeDiagnostic: MN2PR12MB3423:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3423AFB56055441731B16C6BDF7B9@MN2PR12MB3423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBEyfSipODEUemj9wwuGyttOvJYD+qd5wB0ChBkkqJ5klKFgfqd1Eu02lXguupfXsmWrrplH4Nvpt656k515PaVvczrHNfZaYDjVVCqVwaHjioimpuXGGxftM7o0Z3kvraxFtHr1xX7JJeE5pnoINRt8ebF4ukhX4eBSmLGBJSqXQ42HzHzp9HcIpXsZ47SYtWz5Mpby706wLEuGIGtWmCh/m341XnO3ug34JU8moAiZyVPVGoUVPiqJOLRx6tohHrfuWkGcikE22NkenAHNfG6u+Lsx8Vd3k6rng5HXWlOtPoUVOlc58btGNVvVFvXUiewGYWyzX/hy11ANh6uf7hWd6/+szs7sbtQx01BWUVW4S/SsIqJ6xx4vKsKGy5qReYtsGbd+Jb5bHp3VTot6aHnx4mXeqOcnfh7/G+IwEOjqBDVphuUXBGUKnBuBAYGn7C6Joe8UnCxnSMgs1IEs5sxJxaVj42QIA+QUcsVP1uBszPfBIg8+cgx223rP8q/Ms0tszUMK2+rPksIZOcPbxs3w3O9nwrhsMe4oIQjupqCILU+0NxGy3zKIanmAUsM2m560QxHQpXcLkJfMpdEL8gxHvM0P0Ddfarnh2IphyBu5K5GoxreBmA0ZfqLl1EE3TqwzflcevOtecO84o6138DbVo7EIXppmok67yWCSsXRQV8jb6mlmzOVzWHFnGJlq
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(82310400003)(9686003)(9576002)(70206006)(6666004)(2906002)(478600001)(316002)(7636003)(5660300002)(36860700001)(47076005)(336012)(33716001)(8936002)(86362001)(36906005)(70586007)(8676002)(16526019)(4326008)(53546011)(7416002)(426003)(82740400003)(6862004)(26005)(356005)(186003)(6636002)(83380400001)(54906003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:36:24.6441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1264ed60-3a17-48b1-b9ff-08d8f4c7b521
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3423
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 John Hubbard <jhubbard@nvidia.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 10:57:46 PM AEDT Jason Gunthorpe wrote:
> On Wed, Mar 31, 2021 at 03:15:47PM +1100, Alistair Popple wrote:
> > On Wednesday, 31 March 2021 2:56:38 PM AEDT John Hubbard wrote:
> > > On 3/30/21 3:56 PM, Alistair Popple wrote:
> > > ...
> > > >> +1 for renaming "munlock*" items to "mlock*", where applicable. good 
> > grief.
> > > > 
> > > > At least the situation was weird enough to prompt further 
investigation :)
> > > > 
> > > > Renaming to mlock* doesn't feel like the right solution to me either 
> > though. I
> > > > am not sure if you saw me responding to myself earlier but I am 
thinking
> > > > renaming try_to_munlock() -> page_mlocked() and try_to_munlock_one() -
>
> > > > page_mlock_one() might be better. Thoughts?
> > > > 
> > > 
> > > Quite confused by this naming idea. Because: try_to_munlock() returns
> > > void, so a boolean-style name such as "page_mlocked()" is already not a
> > > good fit.
> > > 
> > > Even more important, though, is that try_to_munlock() is mlock-ing the
> > > page, right? Is there some subtle point I'm missing? It really is doing
> > > an mlock to the best of my knowledge here. Although the kerneldoc
> > > comment for try_to_munlock() seems questionable too:
> > 
> > It's mlocking the page if it turns out it still needs to be locked after 
> > unlocking it. But I don't think you're missing anything.
> 
> It is really searching all VMA's to see if the VMA flag is set and if
> any are found then it mlocks the page.
> 
> But presenting this rountine in its simplified form raises lots of
> questions:
> 
>  - What locking is being used to read the VMA flag?
>  - Why do we need to manipulate global struct page flags under the
>    page table locks of a single VMA?

I was wondering that and questioned it in an earlier version of this series. I 
have done some digging and the commit log for b87537d9e2fe ("mm: rmap use pte 
lock not mmap_sem to set PageMlocked") provides the original justification.

It's fairly long so I won't quote it here but the summary seems to be that 
among other things the combination of page lock and ptl makes this safe. I 
have yet to verify if everything there still holds and is sensible, but the 
last paragraph certainly is :-)

"Stopped short of separating try_to_munlock_one() from try_to_munmap_one()
on this occasion, but that's probably the sensible next step - with a
rename, given that try_to_munlock()'s business is to try to set Mlocked."

>  - Why do we need to check for huge pages inside the VMA loop, not
>    before going to the rmap? PageTransCompoundHead() is not sensitive to
>    the PTEs. (and what happens if the huge page breaks up concurrently?)
>  - Why do we clear the mlock bit then run around to try and set it?

I don't have an answer for that as I'm not (yet) across all the mlock code 
paths, but I'm hoping this patch at least won't change anything.

>    Feels racey.
>
> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
