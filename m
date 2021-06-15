Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE923A74A8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 05:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92726E0E5;
	Tue, 15 Jun 2021 03:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904FA6E0E5;
 Tue, 15 Jun 2021 03:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HypgfkzTV7smPrhiiCIth7IBoOGyfUnDaPK8X7ltJ1iVUIiVRxCc4KIxiLI2jr9NTxXrPEaDEllLz1Tla6G+6ke/aoilwbJHcRer6tC8MOiGmTVkckMdVUAxV1pfAEd6o9BqqxlCLCoduCF/8orDy69i/FkNG2VZeXplh4Uz5rZ9C/Bpvaadevt1ZI/N3j5dYLgE1YYOQ6TH68/8hpewpjcrJsWUwIv9bLDWpXzvEMep+rT1KnIQkjSAZ+LHeUpNubCPQ3ZP5EkTZer2Eje8LoEHb+vsBYsj2GHX5v52iBRsG4bD53NGGX5C4BR34eZHbaqMONV85744n+KbMgCc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/fraDyM5DpaPexJE+Rmqm4rVeI2y5160cuPtVZQ0ao=;
 b=lXhHYDkmm0Ni5BrcyhIpfE17MIh8Z1gr+YxfCLdCuVy7qQx+lR1+5KxtO22tWRbHrRwFAR7y8WH+1ukbzJ3M1L9bRY9LgIoX7Hg97PcuByt4/cwrwPLQGkm1FJT98bEtPYkr+kkPA3WwEUBvRH6N+8MgFDIgX/nVn2c09LlK45PqNGBLFAUPUeh/kB6ehYi8l+zBciyIAVX0YAIZfoInKvok/1T/Hu1dbjyFWndoKzdTjlVUe6cKyFg8vsJ6Y+3cVUUTgcepo27VTgVZx2nrPPbptqK0kzgY3Fq13/24V+1w+4kU120i8+DmNKbz4kWqZnA3zTCMpyCyAC8eTwDQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/fraDyM5DpaPexJE+Rmqm4rVeI2y5160cuPtVZQ0ao=;
 b=pSd/kqiiL/mQ9W/t+AGOuIFEdx9HcbxM+49/9YzuXKxwVBts7hFxJPT+D9agkDuktHZlOhJl5/GU/iw+QBCoygQkUyxouUYyd8Y8a9heiaX1i1JZVOEl7DMseWsfHcQvAfARR6apcHv0cEVBHdTHfsytal3lg+Ppbf4fw9OhkwnV6ZC+wZAEzRvtajXKiD+WUxSroa8r/78GigEyh7si+NJjzFGwPusMUuwyu+LMh18uDglqDIpkbNS4E8Tb+KbayR+Qjx2A0bhvvsKTn3QpfsUR5tbeYA1lYrIwntlnkhzr9hMapknhbKW7rRYcZxP5EzhLrP+DBgdvsjs6VjX/Ug==
Received: from BN6PR13CA0051.namprd13.prod.outlook.com (2603:10b6:404:11::13)
 by MN2PR12MB3070.namprd12.prod.outlook.com (2603:10b6:208:c1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 03:08:17 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::a0) by BN6PR13CA0051.outlook.office365.com
 (2603:10b6:404:11::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.10 via Frontend
 Transport; Tue, 15 Jun 2021 03:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 03:08:17 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Jun
 2021 03:08:13 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Tue, 15 Jun 2021 13:08:11 +1000
Message-ID: <7383392.6iZ9WBDLDo@nvdebian>
In-Reply-To: <YMN61r0wdg88OM8r@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2683185.ETRjo6vMkr@nvdebian> <YMN61r0wdg88OM8r@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e2e454-8ffb-4533-4b41-08d92faad281
X-MS-TrafficTypeDiagnostic: MN2PR12MB3070:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3070FC6C4E9F6A839C0797D3DF309@MN2PR12MB3070.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86NaWAP5dBbkzvK3BPYpipZBgAwSz/9czQxIFer+rirUh801SJ8HCWr5yMluhIcMwloOqmfDbJBnK2fpKuarYWdyplpJTUhMfG4LWqfd/1A8wgYeknTzOG9vRagqyd9eTy3zvB1QNUexMSIByOaYJN8XAac52ZsngOZ4XIZsWwUHMmn5grcqpOGq7iqLrAcvvy7fm1r/JuhHr+TyM9PU+4wvwfJuQfxWOjtD2b6X8bfPfnaDAhvZSsm2O2ogCV5bSQ/gruBuw55eW3Lqxe/jdGVbIXJprqIymK14y4t9cYgIRdHHAQmpOB4cj+/FZQEbBgnzx4Zm2geHymVRzqvosqYuE8GVNNyKketgobGxfRPUy4AaF1BR9UiburTPuz8Ry+Gl1T/cj9bkGZDCBG+rAT8Lr1UKK8hPZBNoZrmPFCFraaaoPUamnE50l+lGm7xbc31Ir+pMibXC2WwRqLhZ1I1mavvaXpg9+X5BtZmu/Lm4fJQT0SBg9DJSAGi9WUqb6AoQekJfseLo2zO5zQmG9On/EHZskiiPtoLpNRnZDRqB5WkurukpdQWHUO7XKjLRY/4fHVsCJftdZS9xLG51j+vWkKAVOhvxmNOF+zZaQZNYYXllPR4Ivd3m0JAw2k/FtjhCaMDQ7X4rGTzrrGaA0NfqXQILO6i/1caCjdYAyfSD0wcLgREYSucKBXRfydbC
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(33716001)(83380400001)(36906005)(478600001)(336012)(5660300002)(316002)(9686003)(82310400003)(8676002)(54906003)(9576002)(8936002)(2906002)(7416002)(47076005)(36860700001)(82740400003)(356005)(70586007)(70206006)(16526019)(186003)(7636003)(26005)(6916009)(426003)(4326008)(86362001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 03:08:17.0411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e2e454-8ffb-4533-4b41-08d92faad281
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3070
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

On Saturday, 12 June 2021 1:01:42 AM AEST Peter Xu wrote:
> On Fri, Jun 11, 2021 at 01:43:20PM +1000, Alistair Popple wrote:
> > On Friday, 11 June 2021 11:00:34 AM AEST Peter Xu wrote:
> > > On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> > > > On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > > > > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > > > > internally which will generate that unwanted CLEAR notify.
> > > > > >
> > > > > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > > > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > > > > finds a thp pmd. In follow_pmd_mask() we have:
> > > > > >
> > > > > >       if (likely(!pmd_trans_huge(pmdval)))
> > > > > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > > > > >
> > > > > > So I don't think we have a problem here.
> > > > >
> > > > > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > > > > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > > > > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > > > > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> > > >
> > > > That seems correct - if the thp is not mapped with a pmd we won't split and we
> > > > won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> > > > is fine - we will retry, but the retry will won't CLEAR because the pmd has
> > > > already been split.
> > >
> > > Aha!
> > >
> > > >
> > > > The issue arises with doing it unconditionally in make device exclusive is that
> > > > you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> > > > understanding, please let me know if it doesn't make sense.
> > >
> > > Exactly.  But if you see what I meant here, even if it can work like this, it
> > > sounds still fragile, isn't it?  I just feel something is slightly off there..
> > >
> > > IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
> > > performance, afaict, because if it's not a thp even without locking, then it
> > > won't be, so further __split_huge_pmd() is not necessary.
> > >
> > > IOW, it's very legal if someday we'd like to let split_huge_pmd() call
> > > __split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
> > > one to be broken with that seems-to-be-irrelevant change I'm afraid..
> >
> > Well I would argue the performance of memory notifiers is becoming increasingly
> > important, and a change that causes them to be called unnecessarily is
> > therefore not very legal. Likely the correct fix here is to optimise
> > __split_huge_pmd() to only call the notifier if it's actually going to split a
> > pmd. As you said though that's a completely different story which I think would
> > be best done as a separate series.
> 
> Right, maybe I can look a bit more into that later; but my whole point was to
> express that one functionality shouldn't depend on such a trivial detail of
> implementation of other modules (thp split in this case).
> 
> >
> > > This lets me goes back a step to think about why do we need this notifier at
> > > all to cover this whole range of make_device_exclusive() procedure..
> > >
> > > What I am thinking is, we're afraid some CPU accesses this page so the pte got
> > > quickly restored when device atomic operation is carrying on.  Then with this
> > > notifier we'll be able to cancel it.  Makes perfect sense.
> > >
> > > However do we really need to register this notifier so early?  The thing is the
> > > GPU driver still has all the page locks, so even if there's a race to restore
> > > the ptes, they'll block at taking the page lock until the driver releases it.
> > >
> > > IOW, I'm wondering whether the "non-fragile" way to do this is not do
> > > mmu_interval_notifier_insert() that early: what if we register that notifier
> > > after make_device_exclusive_range() returns but before page_unlock() somehow?
> > > So before page_unlock(), race is protected fully by the lock itself; after
> > > that, it's done by mmu notifier.  Then maybe we don't need to worry about all
> > > these notifications during marking exclusive (while we shouldn't)?
> >
> > The notifier is needed to protect against races with pte changes. Once a page
> > has been marked for exclusive access the driver will update it's page tables to
> > allow atomic access to the page. However in the meantime the page could become
> > unmapped entirely or write protected.
> >
> > As I understand things the page lock won't protect against these kind of pte
> > changes, hence the need for mmu_interval_read_begin/retry which allows the
> > driver to hold a mutex protecting against invalidations via blocking the
> > notifier until the device page tables have been updated.
> 
> Indeed, I suppose you mean change_pte_range() and zap_pte_range()
> correspondingly.

Right.

> Do you think we can restore pte right before wr-protect or zap?  Then all
> things serializes with page lock (btw: it's already an insane userspace to
> either unmap a page or wr-protect a page if it knows the device is using it!).
> If these are the only two cases, it still sounds a cleaner approach to me than
> the current approach.

Perhaps we could but it would make {zap|change}_pte_range() much more complex as
we can't sleep taking the page lock whilst holding the ptl, so we'd have to
implement a retry scheme similar to copy_pte_range() in both those functions as
well. Given mmu_interval_read_begin/retry was IMHO added to solve this type of
problem (freezing pte's to safely program device pte's) it seems like the
better option rather than adding more complex code to generic mm paths.

It's also worth noting i915 seems to use mmu_interval_read_begin/retry() with
gup to sync mappings so this isn't an entirely new concept. I'm not an expert
in that driver but I imagine changing gup to generate unconditional mmu notifier
invalidates would also cause issues there. So I think overall this is the
cleanest solution as it reduces the amount of code (particularly in generic mm
paths).

> This also reminded me that right now the cpu pgtable recovery is lazy - it
> happens either from fork() or a cpu page fault.  Even after device finished
> using it, swap ptes keep there.
> 
> What if the device tries to do atomic op on the same page twice?  I am not sure
> whether it means we may also want to teach both GUP (majorly follow_page_pte()
> for now before pmd support) and process of page_make_device_exclusive() with
> understanding the device exclusive entries too?  Another option seems to be
> restoring pte after device finish using it, as long as the device knows when.

I don't think we need to complicate follow_page_pte() with knowledge of
exclusive entries. GUP will just restore the original pte via the normal
fault path - follow_page_pte() will return NULL for an exclusive entry,
resulting in handle_mm_path() getting called via faultin_page(). Therefore
a driver calling make_device_exclusive() twice on the same page won't cause an
issue. Also the device shouldn't fault on subsequent accesses if the exclusive
entry is still in place anyway.

We can't restore the pte when the device is finished with it because there is
no way of knowing when a device is done using an exclusive entry - device
pte's work much the same as cpu pte's in that regard.

 - Alistair

> --
> Peter Xu
> 




