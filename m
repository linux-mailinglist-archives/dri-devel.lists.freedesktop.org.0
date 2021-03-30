Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B634F4A8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1226E0E7;
	Tue, 30 Mar 2021 22:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BD96E0E7;
 Tue, 30 Mar 2021 22:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPvSdKzPlv1nJJzpFE8HhQvT+t5TOjpX43WwnRifFGNVSmPbdO67AvesS2QAcRqqy+WcyiR4V50tN8c2GZt/GxC/VJCTIXJHtUHeYX1TXechY10LAvpmQRtr9ojSib93/0eoNQVMwyYSTC2GUOCDz6GoUjCB6XlTiLXt1JpSKvp5BJpXpe7w0wi8C5q5sBL5a64pn6nrzfwK7v6CgWM2+UiIB+t71GiVNGhefh7zVoyQ2PMicy1ZG314+mviYcavMvInlXmRhotJxkhanRy8fH1awHERRSl4IzpWNzKXHMsa/6nNcH94OY2gTR1F7JVz0LbXEHqSEe85PuAn2ksSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpi7+2Q3W8AlMH/coytc85wXVzRatzANM0nrEySTwVk=;
 b=cLcy1oxLqy0H/emsHxpqZPZZPeempy1kPxBqERUiVVr94ZeYAxiNoGxopb1VBMO7iQv+rT6rSkwymyXvDYRaqkL4Aa/GQnF2nCkCkTYZ02oukIItfxUjsuKGu1nNJ7j7kSQdH+VW8yyV5t8wpJl/EPSGLV+Urk1f5+T9tcyONhj62drv696crRqMoZwOworWbqK0IsOluOzMNPwzPwgYUfDaG/Zrt3K421hTf+bk4zLd1OlZeZqOy1ZuNJTgFbIWZzgSMo9N8H4KlvTUzP6b+QMgMSlSHSVOdFnShm/KIMbOBuwCeYz9vbqsjWR90QFrDiltvoSr+B4B+pdYFHtjxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpi7+2Q3W8AlMH/coytc85wXVzRatzANM0nrEySTwVk=;
 b=D/u8EzOEf8VjPjS1cxTUs8IYcjL+Xx35S/BpOyFiChErDbHZ1CSG2F2Qs/PC8ynmZODbs/FAvTBrDRao+k7dHY+4EwNyokiZ9L7lqMMAHyCWn6lZi50WrBOUiisx2vX8SmialSNIgJGj5EZu8n6yAjTL4WEsoOZiVK9mNgYNNR4H8nVGxTfB7Sgdxr0C2kVQE8RXJeLTrmxib56mXR0vy8ki4WmKS5TmEZbyoJtm5kgpHldp74gaLvH5cO/RtYKICv/7okwFp9wptwek33X+Pz3eKhvN8Ps+Bzidi3wYZ84ZONAShNL33njeva+Pl8Ds7W2PLjUo03/7oqIkSvnTcQ==
Received: from BN6PR13CA0018.namprd13.prod.outlook.com (2603:10b6:404:10a::28)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 22:56:27 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::f6) by BN6PR13CA0018.outlook.office365.com
 (2603:10b6:404:10a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Tue, 30 Mar 2021 22:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 30 Mar 2021 22:56:26 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar
 2021 22:56:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 31 Mar 2021 09:56:20 +1100
Message-ID: <12636584.zsJ0Sx4KLp@nvdebian>
In-Reply-To: <bce0605a-336f-99ba-5b65-a8e5a7e49e00@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210330222440.GC2356281@nvidia.com>
 <bce0605a-336f-99ba-5b65-a8e5a7e49e00@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a22db820-06fd-4788-658d-08d8f3cf0c8b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4139:
X-Microsoft-Antispam-PRVS: <DM6PR12MB41394768A8A0A783BD70C9A7DF7D9@DM6PR12MB4139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HRjVnFfdanjDSrRKE1YZnq3AN3oh7bHoCbPyLEjC33HeMz8iJH9GgBlCzCIsoW1Z3/24HHckunGGkXZheJ10XsskLx9RRIu71gP7MtA8B4Bm96oBuRyg7J5p7Ux0qvZzBfbm/bbjwWqmqTWnHW13iZ5DWMiLVbZ7saZVphP1Zt1EUcyomsRA6/rIs7D39ZDk92B9cvmyLdDSRsypgYdJVm1uyrXQa2oRqEQUjlCp1yhB8J+Oo2+y8WXsc+e1GG2q+3YLY3hXClc6VqASixRzKy4bzzEryQ5Uu2wGMd/ZocPHZGGEGmOZ8hXvLh/LGErfsXIgv0kbY+Y/jMXmK4mDLx8OP5WKUEyHv7U2Fa9ClqVBUSE2cSTmoUhj9mluZ8ng7RU649vZ19wDkpWFsDpYmcPkZAj+vf1kuvTGY4bV7NMJwicxdjfD/RJ59Q1C7pfJwNQ3gi0wEgw3k2j3lckUBil5bLoog8g2aQEk8jwsSHZwB58R8foAac1hcgQQAydy7yYDfGOcEE2tcY3zesd9GpgI6MDsgbzXe9Px61o0Frj/FFAVaMvgcnrOLcrhfoXQlyUVLb91+fKBxe/+W1PNYqCH0zzA9WEPlF/aECe/bL16yBZRFOzEESdjn1oioYyZqFM5J1pfjOAA1B7EOMh9bz6JV7YQRrPuXGoqCqW6dCE++q9TnpuPHVrrHeJzPPV0
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(83380400001)(336012)(8936002)(36860700001)(6862004)(8676002)(478600001)(33716001)(16526019)(26005)(356005)(54906003)(426003)(186003)(47076005)(70206006)(9576002)(2906002)(7416002)(4326008)(316002)(53546011)(82740400003)(5660300002)(7636003)(9686003)(86362001)(70586007)(82310400003)(6636002)(36906005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:56:26.5438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a22db820-06fd-4788-658d-08d8f3cf0c8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
 Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 9:43:19 AM AEDT John Hubbard wrote:
> On 3/30/21 3:24 PM, Jason Gunthorpe wrote:
> ...
> >> As far as I can tell this has always been called try_to_munlock() even 
though
> >> it appears to do the opposite.
> > 
> > Maybe we should change it then?
> > 
> >>> /**
> >>>   * try_to_munlock - try to munlock a page
> >>>   * @page: the page to be munlocked
> >>>   *
> >>>   * Called from munlock code.  Checks all of the VMAs mapping the page
> >>>   * to make sure nobody else has this page mlocked. The page will be
> >>>   * returned with PG_mlocked cleared if no other vmas have it mlocked.
> >>>   */
> >>
> >> In other words it sets PG_mlocked if one or more vmas has it mlocked. So
> >> try_to_mlock() might be a better name, except that seems to have the 
potential
> >> for confusion as well because it's only called from the munlock code path 
and
> >> never for mlock.
> > 
> > That explanation makes more sense.. This function looks like it is
> > 'set PG_mlocked of the page if any vm->flags has VM_LOCKED'
> > 
> > Maybe call it check_vm_locked or something then and reword the above
> > comment?
> > 
> > (and why is it OK to read vm->flags for this without any locking?)
> > 
> >>> Something needs attention here..
> >>
> >> I think the code is correct, but perhaps the naming could be better. 
Would be
> >> interested hearing any thoughts on renaming try_to_munlock() to 
try_to_mlock()
> >> as the current name appears based on the context it is called from 
(munlock)
> >> rather than what it does (mlock).
> > 
> > The point of this patch is to make it clearer, after all, so I'd
> > change something and maybe slightly clarify the comment.
> > 

Yep, agree with that.
 
> I'd add that, after looking around the calling code, this is a really 
unhappy
> pre-existing situation. Anyone reading this has to remember at which point 
in the
> call stack the naming transitions from "do the opposite of what the name 
says",
> to "do what the name says".
>
> +1 for renaming "munlock*" items to "mlock*", where applicable. good grief.

At least the situation was weird enough to prompt further investigation :) 

Renaming to mlock* doesn't feel like the right solution to me either though. I 
am not sure if you saw me responding to myself earlier but I am thinking 
renaming try_to_munlock() -> page_mlocked() and try_to_munlock_one() -> 
page_mlock_one() might be better. Thoughts?

This is actually inspired from a suggestion in Documentation/vm/unevictable-
lru.rst which warns about this problem:

try_to_munlock() Reverse Map Scan
---------------------------------

.. warning::
   [!] TODO/FIXME: a better name might be page_mlocked() - analogous to the
   page_referenced() reverse map walker.

> Although, it seems reasonable to tack such renaming patches onto the tail 
end
> of this series. But whatever works.

Unless anyone objects strongly I will roll the rename into this patch as there 
is only one caller of try_to_munlock.

 - Alistair

> thanks,
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
