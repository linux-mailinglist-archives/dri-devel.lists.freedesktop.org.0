Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB16393B2F
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 03:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364FB6F540;
	Fri, 28 May 2021 01:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D816F53D;
 Fri, 28 May 2021 01:48:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/Qo9mMN5PpohtpptF7LGyXdcEWDK1i5FT8EhABMnLLfjIGO2PFzTVdlOIzzm9anonR8ienOVsV59wn30uOK4hK3b+TnB1PFN3u9D5GJ345ox6JAHZEFIXg6EXQ6CRQHWP58Tt+jirpVFIlVG4RDJdCilIPiidCnyfSh5wKAeCVZtDU2qdY4dqpCqchn1L9YykQcEr/HYxoe4Yg3Q8j25wlkAqUGKLfanydHZPRPUsmfA4DKGe85vNU/tRgBh6Me8ewJIeWq0VxwCPJDLaI8F1euJtxmaDFpyneNPSCqk5rfub0VK8MZwhYMoDpD3tgE9Ebkqw2jlZgJ49d8Wx3Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGIHlcbYrsWjL1is05NTGx49EuTkXXx5XuvJD/43IPQ=;
 b=iTC0i9EOVkIx8M7y9fWjEmtwoa9C33AVnEnqUznd0RRHFQb7qbw1cbgpJ2F40+ne7f1WmfJ+RmpWeeQTbj0LP9yOW8Y7XFAvc7mB3EvTyZFSDlViP1Zl4TaiWDMefxDyAi1eU4L+ThlJeobUmbZmpgUX7X+tkiTgrZL/JFUtw22MKg/YE8QzvjIOejojjDoJRowCCqKXDZJn7Sk7ULzZn59guBi4QDCrW3RrxZx0hUS8RHcGOmqVRjZH7BZksTeMPceSAWX5MkkunIR0Jj1cPrssmeM4okhCQz4ziq/YYRXFWmUmu0J6Vc802ndgmio72EN1qF9uSQUpA94DVH6Nbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGIHlcbYrsWjL1is05NTGx49EuTkXXx5XuvJD/43IPQ=;
 b=ZlhZRwi+KvAc3Nua5a3LlwGq8Cte5PuYIA9nORScS224CIzx459ecuYO5fsb8xTuKg5+X+dr5h8OGJYUXrxVphpEGJ5ySdFtR5klrHs5vKjVYY/152VcDVRiZKGObm/TOzkWpJzo5eVB5UtF7L43s36adDpXZywjQCbmSFImgcGBRH1Vrv7egRZqrjxWcc2mD/xWbYf8Gk3hD8XHJl5LAG0Mwm8lXBysU6zUr4OyQeT5YFAyQAy3aoVUSl09jp/LBzZpcfS0+8BqOYtVfddacAbmyIYXW1D6J5eAnf+iottVlyPmybnSq56m9S2KuBN/VxL0l46M14N2aDwTlK5XUg==
Received: from MWHPR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:301:4a::33) by MN2PR12MB4535.namprd12.prod.outlook.com
 (2603:10b6:208:267::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 01:48:46 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::e1) by MWHPR1201CA0023.outlook.office365.com
 (2603:10b6:301:4a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Fri, 28 May 2021 01:48:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 01:48:46 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 01:48:42 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Fri, 28 May 2021 11:48:40 +1000
Message-ID: <2243324.CkbYuGXDfH@nvdebian>
In-Reply-To: <YK+Y+aAZHDv8+w+Q@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <37725705.JvxlXkkoz5@nvdebian> <YK+Y+aAZHDv8+w+Q@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c671728b-147f-41ae-8998-08d9217abb6d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4535:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4535C59616571BD81D6AAEEDDF229@MN2PR12MB4535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaIRNW/k3vLgDwVna8QMec8vivPuGQfcN1D5q9V7N/OZQMjwXaSDUt0/uFBDucY7Drkpfbt0vrT4g8rJZ/ZjPeEfJin0/Hw8CST4dsvyTl68iN109R0r7JUB+FzI0rdzKsaGkCIqO8l+PA1ZJFjzLR/3PWRjRDWBW0qB+vVAVkNBmZ7usZ030BUbjyzW4HwbOJK4Tpj4mF+uNlwL6zHvLKTiQdrM8v5a3uDhON/5pFt4YQc4SMhUl7ZjvNBAYMrvY3JmXD7Vuj5yB8Wy3jgMIJz3cY7X/fBrK0qbfKL3TPUbSDAHjTWLz/yQvJqbMXHWObMt9ymUazlJ9Zu1jglf/jqNOBYZXlrJgXZNI325THR1g+GAwcfemWjEz3J4gNLj/ZpCks5DLK+CXJl2ZcTxZG2VYEnNjq0c2wmP6o8veZoQul96hY0ik9uF4c1TpYU3DP4rGJNeqoEVy4ZErcqOGsKX0j5okNC+3PbZ/8u9N18EQ4QfWzWdPUlwYJbuxuRCnxbwt5h62U/UQX/5UhPUxhEn+oW73pK/361u0JcyNVvtsq6ZXNJZ5mvddgM8kH5oGYoc4cGjGopx5JRdglFG3AJ8M97GcbqNLpBUxLLm1ibJLZjDhIbxx8OAAphrCnIzN6GbjeMVtrx6USCF1CHrZQwTKbpul0nyQ06lqGOuDO8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(2906002)(82740400003)(8676002)(478600001)(83380400001)(7416002)(26005)(54906003)(36860700001)(36906005)(4326008)(316002)(33716001)(82310400003)(9576002)(47076005)(8936002)(9686003)(7636003)(5660300002)(70206006)(70586007)(426003)(356005)(16526019)(336012)(186003)(86362001)(6916009);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 01:48:46.2811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c671728b-147f-41ae-8998-08d9217abb6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 May 2021 11:04:57 PM AEST Peter Xu wrote:
> On Thu, May 27, 2021 at 01:35:39PM +1000, Alistair Popple wrote:
> > > > + *
> > > > + * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device
> > > > will
> > > > no + * longer have exclusive access to the page. May ignore the
> > > > invalidation that's + * part of make_device_exclusive_range() if the
> > > > owner field
> > > > + * matches the value passed to make_device_exclusive_range().
> > > 
> > > Perhaps s/matches/does not match/?
> > 
> > No, "matches" is correct. The MMU_NOTIFY_EXCLUSIVE notifier is to notify a
> > listener that a range is being invalidated for the purpose of making the
> > range available for some device to have exclusive access to. Which does
> > also mean a device getting the notification no longer has exclusive
> > access if it already did.
> > 
> > A unique type is needed because when creating the range a driver needs to
> > form a mmu critical section (with mmu_interval_read_begin()/
> > mmu_interval_read_end()) to ensure the entry remains valid long enough to
> > program the device pte and hasn't been invalidated.
> > 
> > However without a way of filtering any invalidations will result in a
> > retry, but make_device_exclusive_range() needs to do an invalidation
> > during installation of the entry. To avoid this causing infinite retries
> > the driver ignores specific invalidation events that it knows don't
> > apply, ie. the invalidations that are a result of that driver asking for
> > device exclusive entries.
> 
> OK I think I get it now.. so the driver checks both EXCLUSIVE and owner, if
> all match it skips the notify, otherwise it's treated like all the rest. 
> Thanks.
> 
> However then it's still confusing (as I raised it too in previous comment)
> that we use CLEAR when re-installing the valid pte.  It's merely against
> what CLEAR means.

Oh, thanks. I understand where you are coming from now - the pte is already 
invalid so ordinarily wouldn't need clearing.

> How about sending EXCLUSIVE for both mark/restore?  Just that when restore
> we notify with owner==NULL telling that no one is owning it anymore so
> driver needs to drop the ownership.  I assume your driver patch does not
> need change too.  Would that be much cleaner than CLEAR?  I bet it also
> makes commenting the new notify easier.
> 
> What do you think?

That seems like a good and avoids adding another type. And as you say they 
driver patch shouldn't need changing either (will need to confirm though).
 
> [...]
> 
> > > > +                                   vma->vm_mm, address,
> > > > min(vma->vm_end,
> > > > +                                   address + page_size(page)),
> > > > args->owner); +     mmu_notifier_invalidate_range_start(&range);
> > > > +
> > > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > > +             /* Unexpected PMD-mapped THP? */
> > > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > > > +
> > > > +             if (!pte_present(*pvmw.pte)) {
> > > > +                     ret = false;
> > > > +                     page_vma_mapped_walk_done(&pvmw);
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > > 
> > > I see that all pages passed in should be done after FOLL_SPLIT_PMD, so
> > > is
> > > this needed?  Or say, should subpage==page always be true?
> > 
> > Not always, in the case of a thp there are small ptes which will get
> > device
> > exclusive entries.
> 
> FOLL_SPLIT_PMD will first split the huge thp into smaller pages, then do
> follow_page_pte() on them (in follow_pmd_mask):
> 
>         if (flags & FOLL_SPLIT_PMD) {
>                 int ret;
>                 page = pmd_page(*pmd);
>                 if (is_huge_zero_page(page)) {
>                         spin_unlock(ptl);
>                         ret = 0;
>                         split_huge_pmd(vma, pmd, address);
>                         if (pmd_trans_unstable(pmd))
>                                 ret = -EBUSY;
>                 } else {
>                         spin_unlock(ptl);
>                         split_huge_pmd(vma, pmd, address);
>                         ret = pte_alloc(mm, pmd) ? -ENOMEM : 0;
>                 }
> 
>                 return ret ? ERR_PTR(ret) :
>                         follow_page_pte(vma, address, pmd, flags,
> &ctx->pgmap); }
> 
> So I thought all pages are small pages?

The page will remain as a transparent huge page though (at least as I 
understand things). FOLL_SPLIT_PMD turns it into a pte mapped thp by splitting 
the pmd and creating pte's mapping the subpages but doesn't split the page 
itself. For comparison FOLL_SPLIT (which has been removed in v5.13 due to lack 
of use) is what would be used to split the page in the above GUP code by 
calling split_huge_page() rather than split_huge_pmd().

This was done to avoid adding code for handling device exclusive entries at 
the pmd level as well which would have made the changes more complicated and 
seems unnecessary at least for now.

> --
> Peter Xu




