Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 257133A8EFF
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 04:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF456E0CF;
	Wed, 16 Jun 2021 02:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9F6E0CF;
 Wed, 16 Jun 2021 02:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsfA4wN40cj16hFU02uV3tP+rZNkneh3Q0FZ2UgwLnvkVJlUEFYk24a7PbUkbsZLD8KdzDQ+YC87bcFX781BtTIc+HjzcjeWPB7ffPIRNvelGtcuyyryLRJWOaMTfy8ZwkB1RVc6oerrWqwkMX6VOAJVY5c3kgXMZ5Ky4tBcR+YYc0LmPXPxq2uPKKj6hCUi8JlvmVGN6p/IjJYcHgufiN3MMfWF7bCLNZBefMBiEwQTO5oY9YQiX9DDX7I6jCRx6RnULJzLNFHNLd+FroXoIIWaETYSCWLM4T0XRzrgSrNwUt77gjC3Z1aYF+wLOfe5aPkPBcGAfKfZYbXrD1qHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJl6gAnl6/WcEpv5curWcUlYd0ynnlQpemmN9T7KH6M=;
 b=fm8xUL2M6m1YsxNBaozboKFh8zEmTNgfwdHXuaFt2XBbVRr0ZrodGLEJhyvmp6KrtiCWL+qAxD/f4nonWYLbJaC2m8CApay9IBYran/zBEwttvd8XRkGK5a3aVxsuz+h0PwMulvqulDYeMxhHigqy0SlrPAuNg0sICkOJ22qEr/ed5GT8vrLD88WBPJCyUYUDumXyWycaicQt69rFKAMwA1LEidqiSm6njrBE15HISblI8s9on8VSPQPS6XnzECljCXLnc0YlrwonoL8kwAPPTCXTF9XTH92ehe/50AK5yS/fNlbZW5ZpWrSAkmfYO85ynpMolSqQbWe4YJCDcegnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJl6gAnl6/WcEpv5curWcUlYd0ynnlQpemmN9T7KH6M=;
 b=hS8byUOtfH1SU01suh9L6yAYW242p1QR0v+VD+bsI22QC7bUKDJXWpg28wzoOeHmsDjd+nYH4bLsydfCY5QUJQLEjeh2Nj2cDygB7ltEoPFsxHBSGgfBB0NMaMwJ/9QhUXNt3dO7ha2BFMebTLfQY3SeSBjzj+OA8yRcZA1PyoTR/mLyYduii8V4BZzT0ZeUwRmxjsDzznrFShSLMbpilqj2UvvArTLgUMKdVWxM3ZhJrXYOd95zjcQyoyc4630mIqz9So8cbIZ6OIY2DI1G1sQhlEHewT2DNQjCCE5B8gwGx4YxJse1NW+Dm5Pgba5hf90qh3l+69ZdL8lgPZyhwQ==
Received: from DM5PR2001CA0019.namprd20.prod.outlook.com (2603:10b6:4:16::29)
 by MWHPR12MB1872.namprd12.prod.outlook.com (2603:10b6:300:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 16 Jun
 2021 02:47:42 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::28) by DM5PR2001CA0019.outlook.office365.com
 (2603:10b6:4:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Wed, 16 Jun 2021 02:47:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 02:47:42 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 02:47:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Wed, 16 Jun 2021 12:47:36 +1000
Message-ID: <3687765.3f4LTt0jjm@nvdebian>
In-Reply-To: <YMjUZX8Sy0PuPt6j@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <7383392.6iZ9WBDLDo@nvdebian> <YMjUZX8Sy0PuPt6j@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9057e9-1b0a-4371-d089-08d930711cd0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1872:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1872B95E9A7D6770325A1692DF0F9@MWHPR12MB1872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXzN03t3rW01rjh3ZACEgqeFapjyTuiUiSfJ9tM1Pko1oExQJ2ij2DZTctIsG7EMT5H8a2ZmIeLx9imcHY9ExqdU3R52v9ZVQqW98f+WdbrcGokkjCit4ttiCvdqrq5uhaMFk0imUtuxuJ30YZFVwENHT98Q3lXryeav3IqETaFV813O3K74oPl2NFmvgyYv/soA2NJsYLlvSyqaU8HcSUDZUB4TB0yby/s41bZ7by92RiV06yHg+grWC5Iocs9EXQB3tcF9DkT0SMjlvHFYpJgjH91Q4J7e+kINX6bzVa3nEmcoqMzcJ4094ob8/ASuKASqSNSnUegDiE+6a8lY7D4Xz6KV8VC1tWSYyEK+/0NAncFGBLw7GldDptAQsZJfuDkLoBR9XtFM8NbUvbk6NhEpXrhDsXxSNoA73nxynBpTFog9Cu6apOtwxdGGZ3HT/Zm0URwHB70SqScb3QyXYU19gAtDt309K9d6OjV5qY8YGaBM543PBHtxhtMzrajOwsZmnYPWestAOCmUjwI2TTdyj4fvoQ1SLUE48AurBRS0yD2DJvBPFxX2En3r4a6F2lOXI4JANLlUOuKvyXxoV8PRalhNL3XKnhsqdRhMDzvMFnaGGkocDW9ZFLSxk5D9tmkt/jf5CSF48t1scyh2LziY7RjP+K0uu25vQnVw6nMXpoAGQWWWva4clwG647Tl
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(86362001)(316002)(336012)(186003)(356005)(70206006)(9686003)(16526019)(82740400003)(426003)(82310400003)(8676002)(2906002)(9576002)(8936002)(5660300002)(83380400001)(70586007)(36860700001)(6916009)(4326008)(47076005)(26005)(54906003)(7416002)(33716001)(478600001)(36906005)(7636003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 02:47:42.0211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9057e9-1b0a-4371-d089-08d930711cd0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 16 June 2021 2:25:09 AM AEST Peter Xu wrote:
> On Tue, Jun 15, 2021 at 01:08:11PM +1000, Alistair Popple wrote:
> > On Saturday, 12 June 2021 1:01:42 AM AEST Peter Xu wrote:
> > > On Fri, Jun 11, 2021 at 01:43:20PM +1000, Alistair Popple wrote:

[...]

> > > Do you think we can restore pte right before wr-protect or zap?  Then all
> > > things serializes with page lock (btw: it's already an insane userspace to
> > > either unmap a page or wr-protect a page if it knows the device is using it!).
> > > If these are the only two cases, it still sounds a cleaner approach to me than
> > > the current approach.
> >
> > Perhaps we could but it would make {zap|change}_pte_range() much more complex as
> > we can't sleep taking the page lock whilst holding the ptl, so we'd have to
> > implement a retry scheme similar to copy_pte_range() in both those functions as
> > well.
> 
> Yes, but shouldn't be hard to do so, imho. E.g., see when __tlb_remove_page()
> returns true in zap_pte_range(), so we already did something like that.  IMHO
> it's not uncommon to have such facilities as we do have requirements to sleep
> during a spinlock critical section for a lot of places in mm, so we release
> them when needed and retake.

Agreed, it's not hard to do and it's a common enough pattern. However we decided
that for such a specific application this (trying to take the lock or drop locks
and retry) was too complex for copy_pte_range() so it seems like the same should
apply here.

Admittedly copy_pte_range() already had several other retry paths so perhaps
it was adding yet another that made it relatively more complex. Overall I have
been trying to minimise the impact on core mm code for this feature, and adding
this pattern to zap_pte_range(), etc. would make it more complex for any future
addition that requires locks to be dropped and retried so I guess in that sense
it is no different.

> > Given mmu_interval_read_begin/retry was IMHO added to solve this type of
> > problem (freezing pte's to safely program device pte's) it seems like the
> > better option rather than adding more complex code to generic mm paths.
> >
> > It's also worth noting i915 seems to use mmu_interval_read_begin/retry() with
> > gup to sync mappings so this isn't an entirely new concept. I'm not an expert
> > in that driver but I imagine changing gup to generate unconditional mmu notifier
> > invalidates would also cause issues there. So I think overall this is the
> > cleanest solution as it reduces the amount of code (particularly in generic mm
> > paths).
> 
> I could be wrong somewhere, but to me depending on mmu notifiers being
> "accurate" in general is fragile..
> 
> Take an example of change_pte_range(), which will generate PROTECTION_VMA
> notifies.  Let's imaging an userspace calls mprotect() e.g. twice or even more
> times with the same PROT_* and upon the same region, we know very possibly the
> 2nd,3rd,... calls will generate those notifies with totally no change to the
> pgtable at all as they're all done on the 1st shot.  However we'll generate mmu
> notifies anyways for the 2nd,3rd,... calls.  It means mmu notifiers should
> really be tolerant of false positives as it does happen, and such thing can be
> triggered even from userspace system calls very easily like this.  That's why I
> think any kernel facility that depends on mmu notifiers being accurate is
> probably not the right approach..

Argh, thanks. I was focused on the specifics of this series but I think I
understand your point better now - that as a more general principle we can't
assume notifiers are accurate.

> But yeah as you said I think it's working as is with the series (I think the
> follow_pmd_mask() checking pmd_trans_huge before calling split_huge_pmd is a
> double safety-net for it, so even if the GUP split_huge_pmd got replaced with
> __split_huge_pmd it should still work with the one-retry logic), not sure
> whether it matters a lot, as it's not common mm path; I think I'll step back so
> Andrew could still pick it up as wish, I'm just still not fully convinced it's
> the best solution to have for a long term to depend on that..

Ok, thanks. I guess you have somewhat convinced me - depending on it for the
long term might be a bit fragile. However as you say the current implementation
does work and I am starting to look at support for PMD and file backed pages
which require changes here anyway. So I am hoping Andrew can still take this
(once rebased) as it would be easier for me to do those changes if the basic
support and clean ups were already in place.

> > > This also reminded me that right now the cpu pgtable recovery is lazy - it
> > > happens either from fork() or a cpu page fault.  Even after device finished
> > > using it, swap ptes keep there.
> > >
> > > What if the device tries to do atomic op on the same page twice?  I am not sure
> > > whether it means we may also want to teach both GUP (majorly follow_page_pte()
> > > for now before pmd support) and process of page_make_device_exclusive() with
> > > understanding the device exclusive entries too?  Another option seems to be
> > > restoring pte after device finish using it, as long as the device knows when.
> >
> > I don't think we need to complicate follow_page_pte() with knowledge of
> > exclusive entries. GUP will just restore the original pte via the normal
> > fault path - follow_page_pte() will return NULL for an exclusive entry,
> > resulting in handle_mm_path() getting called via faultin_page(). Therefore
> > a driver calling make_device_exclusive() twice on the same page won't cause an
> > issue. Also the device shouldn't fault on subsequent accesses if the exclusive
> > entry is still in place anyway.
> 
> Right, looks good then.
> 
> >
> > We can't restore the pte when the device is finished with it because there is
> > no way of knowing when a device is done using an exclusive entry - device
> > pte's work much the same as cpu pte's in that regard.
> 
> I see, I feel like I understand how it works slightly better now, thanks.

Feel free to ask if there are any more details you want, but there's nothing too
magical going on here.

> One last pure question: I see nouveau_atomic_range_fault() will call the other
> nvif_object_ioctl() which seems to do the device pgtable mapping, am I right?

Correct - that installs the page table mapping on the GPU.

> Then I see the notifier is quickly removed before nouveau_atomic_range_fault()
> returns.  What happens if CPU access happens after mmu notifier removed?  Or is
> it not possible to happen?

So there are two notifiers registered - this one and a process wide notifier
(see nouveau_mn_ops). In this case the process wide notifier will get called
to invalidate the access when the CPU fault removes the device exclusive
entries.

 - Alistair

> --
> Peter Xu
> 



