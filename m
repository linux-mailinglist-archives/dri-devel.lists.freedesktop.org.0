Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223BF39D431
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 06:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EC46E03E;
	Mon,  7 Jun 2021 04:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6636E03E;
 Mon,  7 Jun 2021 04:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQIAKrDMg9F/cv4rktTy9bixv10rHQ7scgIPm0sl5RUuv6Lpf15gqYWRdMjNn9ADDZbMdXgem+CAVFZ2tp2WLY9xG37zANnf1yj9tGiIJ7DaQGn0MQcnHkV/5aY1w5j/+XxJS39/m1I+lewNu06c6eleXPkVXiZQCkmJM9FERsJAleLyU2ZfGWdWKmePAY/cxM/WjCB1+dMfyZivzMgUR28hbTIvuIq1N7Ya1EVMJjHBQuUb0ng+PM5iqZ7cnAlcMVXTvU2jFBg2u7mAg4D9tL7gbFyFHJ0U9GHt5Nh1+G+SkBtBaUi+GKy64EL0ndcuybUZ7/9HM2KmceoGLjam3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2/byoBwdC2h9pNW6zbZQbdza3bZBkthu/VEq8LzkX4=;
 b=G5oO7JViANOkN+uxYMC72kagfs8Vt2D+9vyWWu0A35gN9CQReyES6yW6a5Oqxk6YoncNOJYQD1OACAb7BIdeZHgyitriZpbEI/sVDDwxx1K8qnOu/8AAAjXO3JFf6zQdlLfauQTBD8w1se2DFFH8xHYW633jO9xq1QH3jXSVerRPIyXw33kQrO427vsTt887OD48V/DjYVFPDWpY6TPi/xwzeAh+tF/EGtSUdgk/jx84xdaNOnIeMy03UanXGVMpswaAw0L3/+ckNF6GcYlx3aEI4tUVja8TiSfwKO9VCuWsqS5wMhTdc07jBV3vuKOJ99c2CHv1JNL9nYNAZ5TnAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2/byoBwdC2h9pNW6zbZQbdza3bZBkthu/VEq8LzkX4=;
 b=srlvSOuBseddjcVtVAXFw6r9Ee/dXRytjWUGMBVsUcq86wHvr7QT4Ln1N2BWZH8X9liq3omN2Q5cO45WNvGssVeXb7B5nLQo/g3pQjZp6YM4lfelg3isVPZhReLTqNtuWU/exg9Mc3ZCw1gfxqnqa7X2BtCxHfa51e+kMa2QLuvYdPwmXZVI5/FZ7CUD/I1GICRhtR+hD7eySgLiYPVFhHIW7n0N2ZHck9+q+ZV1jEUX7L9SLknVl4Khtp/aF6AtljRRyk5TpciaSPGTg9C+FJiDaJBNEgrGwFGOqyePSUQqVr9Knbm0x7X3ybeDHphpV1lHN+wWIGspJzztrKUcxw==
Received: from DM3PR14CA0149.namprd14.prod.outlook.com (2603:10b6:0:53::33) by
 SN1PR12MB2446.namprd12.prod.outlook.com (2603:10b6:802:26::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24; Mon, 7 Jun 2021 04:51:56 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::a2) by DM3PR14CA0149.outlook.office365.com
 (2603:10b6:0:53::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Mon, 7 Jun 2021 04:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 04:51:56 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 04:51:52 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Mon, 7 Jun 2021 14:51:50 +1000
Message-ID: <6621654.gmDyfcmpjF@nvdebian>
In-Reply-To: <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver>
 <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2661580d-df10-4089-c88b-08d9296ffa4b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2446:
X-Microsoft-Antispam-PRVS: <SN1PR12MB244686FA0BB22340547058AFDF389@SN1PR12MB2446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bREJYlVucOR5VgWvBpAdYok/RHT2qWR4CCmcKv4a3vkpQJcNZihPl5AYeHXS1XbL4gDpP4DHtxqsDqJQoEcPY+90HVyiBxCwYSn3fsWdclIYSAdR5g8RBvwwa5vd4e2/oYW0iNMe3e/KcfRixNwp4ctvFW49q+5k6gDkvdwPG3qcY99WfmxgVApwNlpe0UjPH6rph5q2eobrTBubPf8/qRcfvRI0AiWUrlev/e+1/cgYmu0CvFog6GCMhDw34rMEWStpVD0j32sRbdb3o0vkLAElORFfWSyctaIPS3uCIaS3Xl7H/7oZbRMGkUHtNMy8ATuEVQBYTIDNhfTWOrSWnjV3/dxszpnE7SM44zy2Sj/J6Y6XDY8vsWC4SF0Y/ZH6eMUb/MgPbD6rioknOON9hps/FietFCPSCYYvNG0mlxXIdcYE1LECrUpKESgtJn0BnGoAFWaSCuKPji4P8flzxUXv9D73IhAEaXxwdaoh+quFxnKfRT6SUXZwT2wMYDmP+fHxiyauhOoIo3pGQRu+PF6YFnidAdG/Le7xYn8bDFfNFPs7kENjNkhXU2pBMgeCPv6pFT1m9rRm+sfp3eypAs6CA3j+u/7XNTWEX89TEp/CUyiVYcUnquKiP+IGtdVOXluj69BMiA/SnRqkZlkx2M1R1rzVzZA/jszWVkoMxAo=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(7636003)(426003)(26005)(6916009)(9686003)(336012)(2906002)(7416002)(8936002)(9576002)(36860700001)(83380400001)(8676002)(186003)(70586007)(316002)(70206006)(478600001)(54906003)(47076005)(4326008)(82740400003)(53546011)(36906005)(33716001)(82310400003)(356005)(16526019)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 04:51:56.5965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2661580d-df10-4089-c88b-08d9296ffa4b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2446
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Howlett <liam.howlett@oracle.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, 5 June 2021 10:41:03 AM AEST Shakeel Butt wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Jun 4, 2021 at 1:49 PM Liam Howlett <liam.howlett@oracle.com> wrote:
> >
> > * Shakeel Butt <shakeelb@google.com> [210525 19:45]:
> > > On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> 
wrote:
> > > >
> > > [...]
> > > > >
> > > > > +/*
> > > > > + * Walks the vma's mapping a page and mlocks the page if any locked 
vma's are
> > > > > + * found. Once one is found the page is locked and the scan can be 
terminated.
> > > > > + */
> > > >
> > > > Can you please add that this requires the mmap_sem() lock to the
> > > > comments?
> > > >
> > >
> > > Why does this require mmap_sem() lock? Also mmap_sem() lock of which 
mm_struct?
> >
> >
> > Doesn't the mlock_vma_page() require the mmap_sem() for reading?  The
> > mm_struct in vma->vm_mm;
> >
> 
> We are traversing all the vmas where this page is mapped of possibly
> different mm_structs. I don't think we want to take mmap_sem() of all
> those mm_structs. The commit b87537d9e2fe ("mm: rmap use pte lock not
> mmap_sem to set PageMlocked") removed exactly that.
> 
> >
> > From what I can see, at least the following paths have mmap_lock held
> > for writing:
> >
> > munlock_vma_pages_range() from __do_munmap()
> > munlokc_vma_pages_range() from remap_file_pages()
> >
> 
> The following path does not hold mmap_sem:
> 
> exit_mmap() -> munlock_vma_pages_all() -> munlock_vma_pages_range().
> 
> I would really suggest all to carefully read the commit message of
> b87537d9e2fe ("mm: rmap use pte lock not mmap_sem to set
> PageMlocked").
> 
> Particularly the following paragraph:
> ...
>     Vlastimil Babka points out another race which this patch protects 
against.
>      try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlocked 
a
>     moment after munlock_vma_pages_all() did its Phase 1 
TestClearPageMlocked:
>     leaving PageMlocked and unevictable when it should be evictable.  
mmap_sem
>     is ineffective because exit_mmap() does not hold it; page lock 
ineffective
>     because __munlock_pagevec() only takes it afterwards, in Phase 2; pte 
lock
>     is effective because __munlock_pagevec_fill() takes it to get the page,
>     after VM_LOCKED was cleared from vm_flags, so visible to 
try_to_unmap_one.
> ...
>
> Alistair, please bring back the VM_LOCKED check with pte lock held and
> the comment "Holding pte lock, we do *not* need mmap_lock here".

Actually thanks for highlighting that paragraph. I have gone back through the 
code again in munlock_vma_pages_range() and think I have a better 
understanding of it now. So now I agree - the check of VM_LOCKED under the PTL 
is important to ensure mlock_vma_page() does not run after VM_LOCKED has been 
cleared and __munlock_pagevec_fill() has run.

Will post v10 to fix this and the try_to_munlock reference pointed out by Liam 
which I missed for v9. Thanks Shakeel for taking the time to point this out.

> One positive outcome of this cleanup patch is the removal of
> unnecessary invalidation (unmapping for kvm case) of secondary mmus.



