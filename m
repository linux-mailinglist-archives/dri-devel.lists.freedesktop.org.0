Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EDBC7550D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1275D10E77E;
	Thu, 20 Nov 2025 16:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YiLNKzrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F210E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CEFA14167E;
 Thu, 20 Nov 2025 16:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97884C4CEF1;
 Thu, 20 Nov 2025 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763655715;
 bh=NZKGOfpHm1+oI2EFNHX4s7/pBTvqhugD71XFSvGZD1A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YiLNKzrLmFvvyKW12ItCD0e9K8K/Bt/UXrcOtHd4kC5Rn5L2X+jvujiPQWWfLuSag
 wYOdQxeQgrA6o3riKZyzaLVi1WGOD6j/AswJ9H0Fmr4uFm/bBij2aJ6+jF7nUXJACI
 Ddb5YTxdvpmmat72DvvbiUfCrmoL+cOpaLqxDCMQvkvK//QNAOymY0SJ/gWntdw2jI
 KJ1h0KoIBCMLX/2RXZlHyCxsrQosgqMHx9HwWnItExwZtPXlVRhzhYCsnCs0Yb/xmp
 FGxqBeSdI2pJf2F3OpzcMiyrUaN76KscFGrSS16j4WvLB4ZDqGV5iA1G2+zLDtN6M2
 mK1Wjr6+5c5mA==
Message-ID: <779100ad-a012-49ab-b2ba-b67335947481@kernel.org>
Date: Thu, 20 Nov 2025 17:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fixup: mm/huge_memory.c: introduce folio_split_unmapped
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251120134232.3588203-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251120134232.3588203-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/20/25 14:42, Balbir Singh wrote:
> Code refactoring of __folio_split() via helper
> __folio_freeze_and_split_unmapped() caused a regression with clang-20
> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
> call to shmem_uncharge() due to changes in nr_shmem_dropped.
> Fix this by adding a stub function for shmem_uncharge when
> CONFIG_SHMEM is not defined.
> 
> smatch also complained about parameter end being used without
> initialization, which is a false positive, but keep the tool happy
> by sending in initialized parameters. end is initialized to 0.
> smatch still complains about mapping being NULL and nr_shmem_dropped
> may not be 0, but that is not true prior to or after the changes.
> 
> Add detailed documentation comments for folio_split_unmapped()
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
> This fixup should be squashed into the patch "mm/huge_memory.c:
> introduce folio_split_unmapped" in mm/mm-unstable
> 
>   include/linux/shmem_fs.h |  6 +++++-
>   mm/huge_memory.c         | 30 +++++++++++++++++++++---------
>   2 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 5b368f9549d6..7a412dd6eb4f 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -136,11 +136,16 @@ static inline bool shmem_hpage_pmd_enabled(void)
>   
>   #ifdef CONFIG_SHMEM
>   extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
> +extern void shmem_uncharge(struct inode *inode, long pages);

I forgot to add, we drop the "extern" on functions whenever we move them.

>   #else
>   static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>   {
>   	return 0;
>   }
> +
> +static void shmem_uncharge(struct inode *inode, long pages)

"static inline void" should resolve the compilation issue.



-- 
Cheers

David
