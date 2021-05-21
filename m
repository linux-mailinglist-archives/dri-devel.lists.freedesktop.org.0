Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC4E38C018
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 08:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE16EA88;
	Fri, 21 May 2021 06:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509B26EA80;
 Fri, 21 May 2021 06:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwWpNtOHEawZVPA25H/MqSJ0BKWXj+DpCsIpQXlSQp+l77yPaZNxv6oFKx7eoqdK+E9oviyom0htAfee1cLT15RFgMpm5cI8H+yV3DpJU/EmfFmYBGhqmOSkDQcAN0Y7GNaMVZm8pxhYwVJWzhwpNJpg8uVBBRRedaLQgu/x0Wqq4ZYNvZjE3Yjta2e2xy/Ez/2JayuVimCauVdWrAhfaBwmljfSxt8fH237vA5WRzQ0gpeVpwDvmGePOKNCLj6ii7OrXsYsR9Tv5+QElwqfZEvyEe+7jC/3oZ52hgf/wRyfl9uEOXBHbsKpweigLRSzQEzy6/VI34bmHQkVcVzlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxW8dl0Z1Y3G+EtPy5LMABASUkP42yEBIuHZP1ChjMU=;
 b=Tmjb7utFvV0P668YFy87YBzIKhd952BVEU5+vWTBGP2CJKXDE/+bqN/TeTPX2GL0mofswKfTr0LH9dVLPKMg6DCg3eDceGew7DC/dlXgJhnaDV3MKOtymSj1bWlSHBbu5e7im3jgJ7e3C4WRo4ZSFCx7byFKETEkQrMP7uggFbYorQuUGiAecAg81VtMInpo5h1oRUZDq0b+2OCvRnlpY7AC2tR63McHYTy4E1mchJb3xoxKVMM/IAhkNW6z1VOtGhw/GB++FrTuSZO5EW7NrlFO4A8vLX2m80M6bU9D8IXTG0CnpmpfH8Zmc3nL445PECCRNc1VUsmKzIQ1zpXoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxW8dl0Z1Y3G+EtPy5LMABASUkP42yEBIuHZP1ChjMU=;
 b=takfdyALiMWj5FfVlYHThYL83LX50kGKMdaaLrTVxubUsE/KVjPF44oXD+nLHo85Gwv50OQ8jyRT4NEXsYNEG3D8PvngLvCMb0rbhxs8JLd63G/22aAY9KbrUeLx6gLyId1HehaIGBg7g5vzIcUjDuXZiM1k28V0HEWrTi/168hvjdqu4px17IPxwr/l+aLgedCZZo3eq4pXGTsUIdejcdujj4bZQk3vrNrswQjnbJnxphKsAsdeO5xyfbjqbBOvK/9Z6EmyJOXqzKt2zsf/CPG4RCPhbljti7FOK+M3Yp3xby1LXjcbHSNCKBB3RNgEyWfh7qro16a80WrTa4xVEA==
Received: from MWHPR12CA0059.namprd12.prod.outlook.com (2603:10b6:300:103::21)
 by DM6PR12MB4634.namprd12.prod.outlook.com (2603:10b6:5:165::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 06:53:36 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::51) by MWHPR12CA0059.outlook.office365.com
 (2603:10b6:300:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Fri, 21 May 2021 06:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 21 May 2021 06:53:35 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 21 May
 2021 06:53:31 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Fri, 21 May 2021 16:53:29 +1000
Message-ID: <1959488.yZHLR0KveG@nvdebian>
In-Reply-To: <47694715.suB6H4Uo8R@nvdebian>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 797b2161-51d0-440e-cddb-08d91c25278a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4634:
X-Microsoft-Antispam-PRVS: <DM6PR12MB463410D90098CAA3CFBD528BDF299@DM6PR12MB4634.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SxCG/fXmOdExXw2TVx0E9xIMmIAPW+0xUghaPcU14apTmkB5GveWfGS6kQhoVrI+wA6Z6EBbDFAX0Q6aEJMZvffnp9Xv9caK9mEotS/ERtonyHVYGS+8iCFP80wQuR8J2rtrLN7sM0Q4k8iZpS9C2dtgUP7w/eaV+ithek2HJrDL+PRLilPhtNVN2cAkCX37wL7RxsJ7hXRhX1RQEX4dxkFXpQjfg26+ZTH1iwHEr2/SauNNmGJYB32GQY7noyJHEzOZiwftxWBGFRwR0dmVklSyzip3Xf6wy+mJbFLvXNX6Dfq0YNfMzcbvj0F12DdakvAqmJ0im9/Xwbxd2ye5dQ7W4QrWax1Ro/x2neqlE7X94sQzaOAYWEBDm/HRv+QVaBH8GXyY1BpGtBFhEYdaMSL8v6sMfxLZgXtg1QlABMtb75T+0/Ps9fHeSvss4SY2tRLjuKpVTmzFGgbLHafO+aWjOGn2Cx2fFJJfC6BU2cDklgfdA8u7zIZhp3K2L8/ystKQCqBHaxdJCwsgO+NfpTGjXmeGw45Et3yDIwz9OH24aNmkjrfLhYQp/oD0cQDjy8A8MUuUEOHcMCfsebN72peIwzKlvns13zGDtpDgO4W8ZQ8L4kGosTGiJqAgpjy7Es4O7LB+ja/fhpCzv5qu/uN7tVdqMLavWJi4vibq+ujWM0PBfMZ13g56yr7HRfX7
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(47076005)(86362001)(7416002)(8676002)(2906002)(356005)(186003)(82310400003)(6916009)(83380400001)(26005)(82740400003)(316002)(36906005)(33716001)(36860700001)(336012)(4326008)(7636003)(9576002)(8936002)(70586007)(478600001)(70206006)(54906003)(16526019)(426003)(9686003)(5660300002)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 06:53:35.1791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 797b2161-51d0-440e-cddb-08d91c25278a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4634
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 18 May 2021 11:19:05 PM AEST Alistair Popple wrote:

[...]

> > > +/*
> > > + * Restore a potential device exclusive pte to a working pte entry
> > > + */
> > > +static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
> > > +{
> > > +     struct page *page = vmf->page;
> > > +     struct vm_area_struct *vma = vmf->vma;
> > > +     struct page_vma_mapped_walk pvmw = {
> > > +             .page = page,
> > > +             .vma = vma,
> > > +             .address = vmf->address,
> > > +             .flags = PVMW_SYNC,
> > > +     };
> > > +     vm_fault_t ret = 0;
> > > +     struct mmu_notifier_range range;
> > > +
> > > +     if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
> > > +             return VM_FAULT_RETRY;
> > > +     mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma,
> > > vma->vm_mm,
> > > +                             vmf->address & PAGE_MASK,
> > > +                             (vmf->address & PAGE_MASK) + PAGE_SIZE);
> > > +     mmu_notifier_invalidate_range_start(&range);
> > 
> > I looked at MMU_NOTIFIER_CLEAR document and it tells me:
> > 
> > * @MMU_NOTIFY_CLEAR: clear page table entry (many reasons for this like
> > * madvise() or replacing a page by another one, ...).
> > 
> > Does MMU_NOTIFIER_CLEAR suite for this case?  Normally I think for such a
> > case (existing pte is invalid) we don't need to notify at all.  However
> > from what I read from the whole series, this seems to be a critical point
> > where we'd like to kick the owner/driver to synchronously stop doing
> > atomic
> > operations from the device.  Not sure whether we'd like a new notifier
> > type, or maybe at least comment on why to use CLEAR?
> 
> Right, notifying the owner/driver when it no longer has exclusive access to
> the page and allowing it to stop atomic operations is the critical point and
> why it notifies when we ordinarily wouldn't (ie. invalid -> valid).
> 
> I did consider adding a new type, but in the driver implementation it ends
> up
> being treated the same as a CLEAR notification anyway so didn't think it was
> necessary. But I suppose adding a different type would allow other listening
> notifiers to filter these which might be worthwhile.
>
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > 
> > IIUC a while loop of page_vma_mapped_walk() handles thps, however here
> > it's
> > already in do_swap_page() so it's small pte only?  Meanwhile...
> > 
> > > +             if (unlikely(!pte_same(*pvmw.pte, vmf->orig_pte))) {
> > > +                     page_vma_mapped_walk_done(&pvmw);
> > > +                     break;
> > > +             }
> > > +
> > > +             restore_exclusive_pte(vma, page, pvmw.address, pvmw.pte);
> > 
> > ... I'm not sure whether passing in page would work for thp after all, as
> > iiuc we may need to pass in the subpage rather than the head page if so.
> 
> Hmm, I need to check this and follow up.

Thanks Peter for pointing that out. I needed to follow this up because I had 
slightly misunderstood page_vma_mapped_walk(). As you say this is actually a 
small pte and restore_exclusive_pte() needs the actual page from the fault. So 
I should be able to drop the page_vma_mapped_walk() and use 
pte_offset_map_lock() to call restore_exclusive_pte directly.

 - Alistair



