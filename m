Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB73A213B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 02:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700A289CF6;
	Thu, 10 Jun 2021 00:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D4589CBC;
 Thu, 10 Jun 2021 00:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDc6wGRBcSe9Iin+n20QfZ4cOYfFkcv5HbBO6DevawgC/SnXp+uQqwnMyPyMu3dHAun2BC8lNfw9wiiiaZGbxr6XpPTYRNj3nkvIxKNt9hcBIMTE70Z9n7/8jPaosXWltu9oZ3BMtUT/4UB+WomWmTWgXUg6QntYyOF1YGJI1bJOMiFV5Eq8ft0YnYI61nOt0SxOK4nDI/EinVxdpT03zrBmVEXnb0N7bB+dirx5yPGTM5has86geS6HLtSK1MynJAkkDFFqyAyvgTgCSZwKpLzX8DwIX10WjRhCJmu8l/yXQ6TRLHNH4YHlaK4wImxOKgDdRK40GHseYIhr9oX0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqQgHpdtvWbU7rRWihL+swNvcuWMGwKR0xDyAz4+zq0=;
 b=XsE0OZzxmhZqgVcOJ2P7F8Hrrp5gJHOd1dTtu42JweX0VXj+ebxu1d3NzdBTinOAcip4S3/Rw37ltpeAu/CTkwZWb+qUhs7UrhtBdKRORdtBZv0VAfBBHqOwokQJNXwYybPCciZS2ugahF1OUPam57KqOJCfpmGwINRRc/LLzX/LmOpTQs12PfolEwJwhLwytnYm+J4LAH2N8Jgy/K4/u0vMn+deNMGwnpIxGcFjoVQJXSrNeP4V7Muf1lfsiqrPMAAPCJ94JySKU61MWuJ3Q1QwATgq6xDO59UhUUUO3+fphyL4r6tPI4CrqS67Ck/w0ZFjYcJdMDrDyUAfwtrlyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqQgHpdtvWbU7rRWihL+swNvcuWMGwKR0xDyAz4+zq0=;
 b=Sg3qFjcVbjVAbtzSsWU43dovnXZrWeiUn/GLc9tyxqxJLcECeGDsv5LU0ohSBXur4AxxBZdlEewwGPlIYVeV135IhCG0m3Hq+Jl8Zd6U3/YDNBCq84abRJ0Iyux4MjbZCuxTZ1HVkMTCAsZTz1gQgxJNMh5FMT7q9xFfd2AKHjZD8ZgfjD33G95rrlVbJd3ITBdqfG21gzyt8xN+63svik2hWHQCugLP/gFTz6TY+IX7+9nfBOZbhdU5VQP+P7UoKafXtWwA0sX1PsEJ39sdMDhgNJ8twTNP9Pi5fZGYOowUE1mBj3rBCY0J+TuXT09QszFfJvsxsfTHBg8cALm1kQ==
Received: from BN6PR11CA0035.namprd11.prod.outlook.com (2603:10b6:404:4b::21)
 by DM6PR12MB4793.namprd12.prod.outlook.com (2603:10b6:5:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Thu, 10 Jun
 2021 00:18:32 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:4b:cafe::ba) by BN6PR11CA0035.outlook.office365.com
 (2603:10b6:404:4b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 00:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 00:18:32 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 00:18:28 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Thu, 10 Jun 2021 10:18:25 +1000
Message-ID: <2773835.D95cIkl9rl@nvdebian>
In-Reply-To: <YMDmsha6GDtUf3Vs@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <270551728.uXnuCZxQlr@nvdebian> <YMDmsha6GDtUf3Vs@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95ea4e46-dad4-4300-059e-08d92ba547bd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4793:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4793F1F6B0C06BC28FB8A60EDF359@DM6PR12MB4793.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdh2iPHY6MT0D78EhtGbzPbcjwPORjs8Cakn1CRk6BE9RPLe/lS+wI/if9YU4o+k77t1oqxLZb/CoslK+4t3K1laOKt58jKBq19q9u+NvtG/kgrzuh3gt3L0ois4Lzqb0kOmedF7OfQN++WDTwIg0LoZgSVmmmkPHf/vihf/s0UJKz3/B5z7GkHHOSwK5d2myj87si7ox+forCZ3n2DulnbK9qEfJboMaEERU5Kqju/+3qWcKKfdar4jHTUugnP9M0sbRhQYEKHkrIfDuKepbrQ0BmjJyfwvnv2ASbNfg/tUnGUKjKdADqxe5CLuytxyMFRW5dpMPCrhDt/Q8O77Etm7LQHlCkr/EcDnzuoE7cZy6FhRzOLk+h5jG4C1mS1lPkPhym/L/EkjNw67+pcoeQMWbMGi7/w/Z7e1qyP2VU/nxsRLRmKlJKTW2UQ16OC9bbjoFPoQbAcm5hGejHWsz7SKyVmL3wAhbg9p7scCQ8hU0Vn06mSoFX8GkTS8UbiWLmLAoymx68U8Y1w7h2fxxAnTWuGMegySJHcTbXJm/usErOqtXQQhUyn3xg+n/eOYp3SwpRhM2qet78tD89u1QFoWkoQRQJz8gTHg4dPRpK+4BNisayBDpWYknv/gC5yE5Fzt4IHYKDi3CZpZEjkTZlvfHSQUw95g0n8V+luRE0RAD+7CknTBC+OPKHaLWeA/
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(36840700001)(46966006)(478600001)(54906003)(70586007)(83380400001)(47076005)(6916009)(33716001)(5660300002)(86362001)(7416002)(6666004)(4326008)(316002)(8676002)(26005)(70206006)(426003)(36906005)(8936002)(82740400003)(7636003)(356005)(336012)(82310400003)(2906002)(36860700001)(9576002)(16526019)(9686003)(186003)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 00:18:32.1055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ea4e46-dad4-4300-059e-08d92ba547bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4793
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

On Thursday, 10 June 2021 2:05:06 AM AEST Peter Xu wrote:
> On Wed, Jun 09, 2021 at 07:38:04PM +1000, Alistair Popple wrote:
> > On Wednesday, 9 June 2021 4:33:52 AM AEST Peter Xu wrote:
> > > On Mon, Jun 07, 2021 at 05:58:52PM +1000, Alistair Popple wrote:

[...]

> > For thp this means we could end up passing
> > tail pages to rmap_walk(), however it doesn't actually walk them.
> >
> > Based on the results of previous testing I had done I assumed rmap_walk()
> > filtered out tail pages. It does, and I didn't hit the BUG_ON above, but the
> > filtering was not as deliberate as assumed.
> >
> > I've gone back and looked at what was happening in my earlier tests and the
> > tail pages get filtered because the VMA is not getting locked in
> > page_lock_anon_vma_read() due to failing this check:
> >
> >       anon_mapping = (unsigned long)READ_ONCE(page->mapping);
> >       if ((anon_mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
> >               goto out;
> >
> > And now I'm not sure it makes sense to read page->mapping of a tail page. So
> > it might be best if we explicitly ignore any tail pages returned from GUP, at
> > least for now (a future series will improve thp support such as adding a pmd
> > version for exclusive entries).
> 
> I feel like it's illegal to access page->mapping of tail pages; I looked at
> what happens if we call page_anon_vma() on a tail page:
> 
> struct anon_vma *page_anon_vma(struct page *page)
> {
>         unsigned long mapping;
> 
>         page = compound_head(page);
>         mapping = (unsigned long)page->mapping;
>         if ((mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
>                 return NULL;
>         return __page_rmapping(page);
> }
> 
> It'll just take the head's mapping instead.  It makes sense since the tail page
> shouldn't have a different value against the head page, afaiu.

Right, it makes no sense to look at ->mapping on a tail page because the field
is used for something else. On the 1st tail page it is ->compound_nr and on the
2nd tail page it is ->deferred_list. See the definitions of compound_nr() and
page_deferred_list() respectively. I suppose on the rest of the pages it could
be anything.

I think in practice it is probably ok - iuc bit 0 won't be set for compound_nr
and certainly not for deferred_list->next (a pointer). But none of that seems
intentional, so it would be better to be explicit and not walk the tail pages.

> It would be great if thp experts could chim in.  Before that happens, I agree
> with you that a safer approach is to explicitly not walk a tail page for its
> rmap (and I think the rmap of a tail page will be the same of the head
> anyways.. since they seem to share the anon_vma as quoted).
> >
> > > So... for thp mappings, wondering whether we should do normal GUP (without
> > > SPLIT), pass in always normal or head pages into rmap_walk(), but then
> > > unconditionally split_huge_pmd_address() in page_make_device_exclusive_one()?
> >
> > That could work (although I think GUP will still return tail pages - see
> > follow_trans_huge_pmd() which is called from follow_pmd_mask() in gup).
> 
> Agreed.
> 
> > The main problem is split_huge_pmd_address() unconditionally calls a mmu
> > notifier so I would need to plumb in passing an owner everywhere which could
> > get messy.
> 
> Could I ask why?  split_huge_pmd_address() will notify with CLEAR, so I'm a bit
> confused why we need to pass over the owner.

Sure, it is the same reason we need to pass it for the exclusive notifier.
Any invalidation during the make exclusive operation will break the mmu read
side critical section forcing a retry of the operation. The owner field is what
is used to filter out invalidations (such as the exclusive invalidation) that
don't need to be retried.
 
> I thought plumb it right before your EXCLUSIVE notifier init would work?

I did try this just to double check and it doesn't work due to the unconditional
notifier.

> ---8<---
> diff --git a/mm/rmap.c b/mm/rmap.c
> index a94d9aed9d95..360ce86f3822 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2042,6 +2042,12 @@ static bool page_make_device_exclusive_one(struct page *page,
>         swp_entry_t entry;
>         pte_t swp_pte;
> 
> +       /*
> +        * Make sure thps split as device exclusive entries only support pte
> +        * level for now.
> +        */
> +       split_huge_pmd_address(vma, address, false, page);
> +
>         mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
>                                       vma->vm_mm, address, min(vma->vm_end,
>                                       address + page_size(page)), args->owner);
> ---8<---
> 
> Thanks,
> 
> --
> Peter Xu
> 




