Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AF680F08C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 16:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0369C10E611;
	Tue, 12 Dec 2023 15:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A5C10E611
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702394877; x=1733930877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J5cBlnY1Ze/CWvlCx8CRGQ0t3RzxDZTAr16nqiZAwP4=;
 b=cEfpeiwR+iSrosEUGMGPwpYNTgyhMmHZ/NUQCm9i/8atirkL4a2L/gqP
 GYp/JizLUwdzF3Yja1xhb1xF3Dmv8UPIqH/UDTmuTvxugAzUdMCJZzhi8
 Ju7Fr1W5x8qH7KDxb7czTgF/baXWknIUdMOxxKwrzKu49S05t+Siot/u6
 saJgYlO0NKgux2+9KT41J/rncSOM6bXcemYLhHQkUGfhofcFe8mLmNR8i
 fSIQLXbHLjXHXd/r6MvBJq7voHaoCpnp37lizL9i2ckOuXTqU8nzqNwkh
 CRT29BRsAHlEAmlwF54tnelpunoWzNfAyyCqHJTFGiToAfwzMeaU93Yyy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398665663"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="398665663"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 07:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="807801491"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="807801491"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 12 Dec 2023 07:27:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rD4fm-000JJz-0e;
 Tue, 12 Dec 2023 15:27:50 +0000
Date: Tue, 12 Dec 2023 23:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
Message-ID: <202312122339.viQUjwIW-lkp@intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Hugh Dickins <hughd@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Junxiao Chang <junxiao.chang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, oe-kbuild-all@lists.linux.dev,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231212-160312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231212073803.3233055-4-vivek.kasireddy%40intel.com
patch subject: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning memfd folios (v7)
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231212/202312122339.viQUjwIW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312122339.viQUjwIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122339.viQUjwIW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/gup.c:3543:11: error: incompatible pointer types assigning to 'struct folio *' from 'struct page *' [-Werror,-Wincompatible-pointer-types]
                                   folio = memfd_alloc_folio(memfd, start_idx);
                                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


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
