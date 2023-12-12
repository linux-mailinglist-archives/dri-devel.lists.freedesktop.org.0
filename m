Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995180ED4E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEFB10E063;
	Tue, 12 Dec 2023 13:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7954B10E063
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702387324; x=1733923324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NUlCEaUcnMX8/zgqVwn1hHgBCfWfo3HFuIwcqsf9flQ=;
 b=UAL3tndF4H9SyT+z+Fwezs2xXJSO1+lMVrxiX53Ew+gT/bUO+U8Yfj/5
 YJEIoy+J7YORLfrc1smAC75yV+a/ojEUSPf0GcepCE0Zcdn7feQ1OV32g
 Gqj5t0UVMg9sa1LkVHxfGkIvwjCRV3tedd+GRwBZB2ij0bfswND1FcUjb
 tz6yiQOST3IMh3N/arDbYFXt+KYU/TThUUwM6xVfrnUfz8+bWpU35okcK
 eLX/3tMt+TK/Z9+ADN/p77mAUrZS6kAH28s0B1MybkYHOc8AtD9Kktf3T
 iZsfxA9EjE32lRO+Crffdzz14MPfm1NQb2uJVUZU0v6RgvBFO66mkY9HF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1624018"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1624018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104906555"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="1104906555"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2023 05:21:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rD2hx-000JD8-1i;
 Tue, 12 Dec 2023 13:21:57 +0000
Date: Tue, 12 Dec 2023 21:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
Message-ID: <202312122109.SxDFnBaq-lkp@intel.com>
References: <20231212073803.3233055-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212073803.3233055-4-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, Junxiao Chang <junxiao.chang@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 oe-kbuild-all@lists.linux.dev, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231212-160312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231212073803.3233055-4-vivek.kasireddy%40intel.com
patch subject: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd folios (v7)
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231212/202312122109.SxDFnBaq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312122109.SxDFnBaq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122109.SxDFnBaq-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'memfd_pin_folios':
>> mm/gup.c:3543:39: error: assignment to 'struct folio *' from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
    3543 |                                 folio = memfd_alloc_folio(memfd, start_idx);
         |                                       ^
   cc1: some warnings being treated as errors


vim +3543 mm/gup.c

  3417	
  3418	/**
  3419	 * memfd_pin_folios() - pin folios associated with a memfd
  3420	 * @memfd:      the memfd whose folios are to be pinned
  3421	 * @start:      starting memfd offset
  3422	 * @nr_pages:   number of pages from start to pin
  3423	 * @folios:     array that receives pointers to the folios pinned.
  3424	 *              Should be at-least nr_pages long.
  3425	 * @offsets:    array that receives offsets of pages in their folios.
  3426	 *              Should be at-least nr_pages long.
  3427	 *
  3428	 * Attempt to pin folios associated with a memfd; given that a memfd is
  3429	 * either backed by shmem or hugetlb, the folios can either be found in
  3430	 * the page cache or need to be allocated if necessary. Once the folios
  3431	 * are located, they are all pinned via FOLL_PIN and the @offsets array
  3432	 * is populated with offsets of the pages in their respective folios.
  3433	 * Therefore, for each page the caller requested, there will be a
  3434	 * corresponding entry in both @folios and @offsets. And, eventually,
  3435	 * these pinned folios need to be released either using unpin_user_pages()
  3436	 * or unpin_user_page().
  3437	 *
  3438	 * It must be noted that the folios may be pinned for an indefinite amount
  3439	 * of time. And, in most cases, the duration of time they may stay pinned
  3440	 * would be controlled by the userspace. This behavior is effectively the
  3441	 * same as using FOLL_LONGTERM with other GUP APIs.
  3442	 *
  3443	 * Returns number of folios pinned. This would be equal to the number of
  3444	 * pages requested. If no folios were pinned, it returns -errno.
  3445	 */
  3446	long memfd_pin_folios(struct file *memfd, unsigned long start,
  3447			      unsigned long nr_pages, struct folio **folios,
  3448			      pgoff_t *offsets)
  3449	{
  3450		unsigned long end = start + (nr_pages << PAGE_SHIFT) - 1;
  3451		unsigned int max_pgs, pgoff, pgshift = PAGE_SHIFT;
  3452		pgoff_t start_idx, end_idx, next_idx;
  3453		unsigned int flags, nr_folios, i, j;
  3454		struct folio *folio = NULL;
  3455		struct folio_batch fbatch;
  3456		struct page **pages;
  3457		struct hstate *h;
  3458		long ret;
  3459	
  3460		if (!nr_pages)
  3461			return -EINVAL;
  3462	
  3463		if (!memfd)
  3464			return -EINVAL;
  3465	
  3466		if (!shmem_file(memfd) && !is_file_hugepages(memfd))
  3467			return -EINVAL;
  3468	
  3469		pages = kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
  3470		if (!pages)
  3471			return -ENOMEM;
  3472	
  3473		if (is_file_hugepages(memfd)) {
  3474			h = hstate_file(memfd);
  3475			pgshift = huge_page_shift(h);
  3476		}
  3477	
  3478		flags = memalloc_pin_save();
  3479		do {
  3480			i = 0;
  3481			start_idx = start >> pgshift;
  3482			end_idx = end >> pgshift;
  3483			if (is_file_hugepages(memfd)) {
  3484				start_idx <<= huge_page_order(h);
  3485				end_idx <<= huge_page_order(h);
  3486			}
  3487	
  3488			folio_batch_init(&fbatch);
  3489			while (start_idx <= end_idx) {
  3490				/*
  3491				 * In most cases, we should be able to find the folios
  3492				 * in the page cache. If we cannot find them for some
  3493				 * reason, we try to allocate them and add them to the
  3494				 * page cache.
  3495				 */
  3496				nr_folios = filemap_get_folios_contig(memfd->f_mapping,
  3497								      &start_idx,
  3498								      end_idx,
  3499								      &fbatch);
  3500				if (folio) {
  3501					folio_put(folio);
  3502					folio = NULL;
  3503				}
  3504	
  3505				next_idx = 0;
  3506				for (j = 0; j < nr_folios; j++) {
  3507					if (next_idx &&
  3508					    next_idx != folio_index(fbatch.folios[j]))
  3509						continue;
  3510	
  3511					folio = try_grab_folio(&fbatch.folios[j]->page,
  3512							       1, FOLL_PIN);
  3513					if (!folio) {
  3514						folio_batch_release(&fbatch);
  3515						kfree(pages);
  3516						goto err;
  3517					}
  3518	
  3519					max_pgs = folio_nr_pages(folio);
  3520					if (i == 0) {
  3521						pgoff = offset_in_folio(folio, start);
  3522						pgoff >>= PAGE_SHIFT;
  3523					}
  3524	
  3525					do {
  3526						folios[i] = folio;
  3527						offsets[i] = pgoff << PAGE_SHIFT;
  3528						pages[i] = folio_page(folio, 0);
  3529						folio_add_pin(folio);
  3530	
  3531						pgoff++;
  3532						i++;
  3533					} while (pgoff < max_pgs && i < nr_pages);
  3534	
  3535					pgoff = 0;
  3536					next_idx = folio_next_index(folio);
  3537					gup_put_folio(folio, 1, FOLL_PIN);
  3538				}
  3539	
  3540				folio = NULL;
  3541				folio_batch_release(&fbatch);
  3542				if (!nr_folios) {
> 3543					folio = memfd_alloc_folio(memfd, start_idx);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
