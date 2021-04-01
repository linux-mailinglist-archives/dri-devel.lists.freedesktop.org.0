Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B445A350C80
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 04:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16386EC08;
	Thu,  1 Apr 2021 02:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90D06EC08;
 Thu,  1 Apr 2021 02:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVSADsP6DW/jAr7SFkhPix1dVgyG2G1OB0PqiIv0HX5onIJC5WdSYbRI37a+F1mlULunW66qa99Av1b9cK7T9JixZyPYIKQE+OyNtyh1EpuHWKnMr6J0Tw4KWPGAFgpjxbnbET31a7Rofi5bfbPgEDcmyefeWMNFkOlJebBVbFbh3jdp43Cs/DTjJEytfN9rL2aLBLm7Y3Q+xyfnwqxtd1BXCNHXGM6cKI8YYF7UvzV1LpSoTfxGdLk0gbBQnGjXHjNcxCvOZ9OzrMixmR+70b+GdUV8ojHOLp305QIen6sZvfyKOnnqKW1n7pILKRKoiC9Snmm4gmAhScV8ey/6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOFCOgGFpcvEA/6h9xKdt0ew9/qD4+9DHYTGQEOdaiE=;
 b=I5dlCYifMByg/e6bMSfc9fAqGGdGBa3TyTo8SGQSuCu/LhPVrgEzqO34KS9XCRxmIoZ5RviokLmBtLcUOWZ10cGWfFC+ibkK+dFUarF4Uvnr0RGWZgr/jH+YcaXzkYWCAwZKpSfuwOi+zi54DUpa3U/gROpcqoih0le7I7YSoRtu59QSifhG1Nf2GHM9v/qDpnUdoD4UcHOg5TTwNlwCvL3cRMQyyHjwvb5wBfwoNOkp8aOFD4sAkvK2SPYiYnLYV0ckNCifMi88QTgTDFPQeZiqlI5WDHpv8bB1wToyV8UCb1z/rzga0p9OSI6B/5zlgXsAOT15cNdtUDGpfEZuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOFCOgGFpcvEA/6h9xKdt0ew9/qD4+9DHYTGQEOdaiE=;
 b=LSSxLofq4hbuv9BIgWrB0Ut7D4FQ/7qmytUUJj+xompWB8Cvn8o9/DtzK+LsQpm3YNzKef7Hk3jWY6i0s/7vLVbXaDgQEDZJQq/qpyyzFthPdCwx7kgWpBIpHcIjwRSTo3dG/Ngx8wjwVvNrBbZXQN0JDuR4HeYxw++Hpfj8aUT+genwyxP6p/Tb7ij7Q79+yryUV1wogst5BJeT0os1Twuzj8M8tjaSiiTAZHq6zEYCSMd/4QdEI47sGAr+ZElyHvn5YnkqoYuwqfCDeBZlnhGlLdGKOuYDDZBBI6gjkbw8ncMNcDASOFJgH3/MxTrHjAUfQql4rZUJ7zFxDjvrTA==
Received: from BN1PR13CA0004.namprd13.prod.outlook.com (2603:10b6:408:e2::9)
 by BN8PR12MB3602.namprd12.prod.outlook.com (2603:10b6:408:49::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Thu, 1 Apr
 2021 02:20:11 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::76) by BN1PR13CA0004.outlook.office365.com
 (2603:10b6:408:e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Thu, 1 Apr 2021 02:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 02:20:11 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 02:20:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Date: Thu, 1 Apr 2021 13:20:05 +1100
Message-ID: <9244031.kThbcIvB84@nvdebian>
In-Reply-To: <20210401004813.GT1463678@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <35941260.J9UuDlmC3F@nvdebian> <20210401004813.GT1463678@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3d6adb8-72bf-43b7-bc36-08d8f4b4ada6
X-MS-TrafficTypeDiagnostic: BN8PR12MB3602:
X-Microsoft-Antispam-PRVS: <BN8PR12MB36023EDF7966A137C45555E0DF7B9@BN8PR12MB3602.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsprRQ3jTY0qy+Wz0c5bC/QEh5DuLdNbGufQf6X34v0/J40Fi8rxBqfP5sGXl1bHK+GsFUQyAOZR5zYsL84oRkrpXO1pNSlb4Ejc1ChyKCHlKKgXCW8SYLHkyRHxhcnSXkC+JFSxUDzUkDIVCL5NmSWZZaqzQMxX0jkGPFs/0jNy0BlI0Zm1sFSdOcOLHkO6QYQoKKB3TqPMR6vdRNpJMdTjg09MtNuxbHG2b6UZw+H5uUN+qvARTTun9kh9I+Ml95pjzjKMkDEskeQFNlDQeFbQxD22Xh3y+4gU4TthEnfv4FkFGQRKpT1Yg6qPeuaO96UkvurJOkgB3k0dVHGJbLS0nGbIQ9UxzpV55+MPrdtSr8AZJfj+QhcKCT7djcK9t+ijVRHvIoDcLHQvg9jArXLBvDMfSzaK74iAv9wyeh6PttXlubZJF5joERNW62bL9u4i7Dc9oas145c/3UP+LNWTk+4VrR3tSIQLI+YP6ig23xVHxDJ93bYcT26Ilu+gEILVpVmr+hn4bIva1oj1+tnVloTXcYx/Oh5RSX8u8XC/2UWlCSZwHLvcspZnfPhr0vjKK+qijjxKAewfy2uGLlGInO0JgOGJ70qNlwwNX2kis/2Vd+9guldS8uE5ov2DA6x92NjhoWbthrRrqq7qOrg+P6WzwDaN4f7ilw9p1L7NDEtqg3SqE4llo63yzSWZ
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(8936002)(36906005)(86362001)(47076005)(7636003)(356005)(186003)(426003)(9686003)(2906002)(4326008)(6636002)(316002)(9576002)(26005)(336012)(7416002)(36860700001)(70206006)(5660300002)(8676002)(6862004)(478600001)(82310400003)(83380400001)(70586007)(54906003)(16526019)(82740400003)(33716001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 02:20:11.5112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d6adb8-72bf-43b7-bc36-08d8f4b4ada6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3602
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
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 1 April 2021 11:48:13 AM AEDT Jason Gunthorpe wrote:
> On Thu, Apr 01, 2021 at 11:45:57AM +1100, Alistair Popple wrote:
> > On Thursday, 1 April 2021 12:46:04 AM AEDT Jason Gunthorpe wrote:
> > > On Thu, Apr 01, 2021 at 12:27:52AM +1100, Alistair Popple wrote:
> > > > On Thursday, 1 April 2021 12:18:54 AM AEDT Jason Gunthorpe wrote:
> > > > > On Wed, Mar 31, 2021 at 11:59:28PM +1100, Alistair Popple wrote:
> > > > > 
> > > > > > I guess that makes sense as the split could go either way at the
> > > > > > moment but I should add a check to make sure this isn't used with
> > > > > > pinned pages anyway.
> > > > > 
> > > > > Is it possible to have a pinned page under one of these things? If I
> > > > > pin it before you migrate it then it remains pinned but hidden under
> > > > > the swap entry?
> > > > 
> > > > At the moment yes. But I had planned (and this reminded me) to add a 
check 
> > to 
> > > > prevent marking pinned pages for exclusive access. 
> > > 
> > > How do you even do that without races with GUP fast?
> > 
> > Unless I've missed something I think I've convinced myself it should be 
safe 
> > to do the pin check after make_device_exclusive() has replaced all the 
PTEs 
> > with exclusive entries.
> > 
> > GUP fast sequence:
> > 1. Read PTE
> > 2. Pin page
> > 3. Check PTE
> > 4. if PTE changed -> unpin and fallback
> > 
> > If make_device_exclusive() runs after (1) it will either succeed or see 
the 
> > pin from (2) and fail (as desired). GUP should always see the PTE change 
and 
> > fallback which will revoke the exclusive access.
> 
> AFAICT the user can trigger fork at that instant and fork will try to
> copy the desposited migration entry before it has been checked

In that case the child will get a read-only exclusive entry and eventually a 
page copy via do_wp_page() and GUP will fallback (or fail in the case of fast 
only) so the parent's exclusive entry will get removed before the page can be 
pinned and therefore shouldn't split the wrong way.

But that is sounding rather complex, and I am not convinced I haven't missed a 
corner case. It also seems like it shouldn't be necessary to copy exclusive 
entries anyway. I could just remove them and restore the original entry, which 
would be far simpler.

> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
