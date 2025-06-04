Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602CACE1B8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9D810E0CA;
	Wed,  4 Jun 2025 15:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNTiqNd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062E10E0CA;
 Wed,  4 Jun 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749051971; x=1780587971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pr0OVmmeB47DppS0yiNdRfseyj+W6OMs4zzLQfe7lDE=;
 b=RNTiqNd5aSXLkIQkbRHvpwvoAe0ShvQdrCVKnV6gavOoeAPF2eapK9GD
 VWyYrqnVKX2yOiVwECJ5H6dmumSeWyEkP9XYY6n1ObINnRbGaBHxKgjr1
 tusJN9CbJMLgRZK9UAkd7XcejTaNkfI3k8i6QAEGRmTDCAKIKThsUtPFH
 w11ixqLD8zUniMtgvEsuHr7VoTymdBGuVus779exfMNOxGn4J2sSQqol3
 J4x6YzOLAtyskHk5ghEqc0U6+cCqY9gbr9LtM33faKunRtZCY2DWQZ3jG
 UFIOdkMrU7V+OCl1YFhWiQO+ZAO+XLZPoBd052zn7FAY7WcLdzPd7WiMs g==;
X-CSE-ConnectionGUID: Ub0pq66KRkeRI17NH2L+Kw==
X-CSE-MsgGUID: uM0CBuUFRx2HlXwQpr7VAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68693595"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68693595"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:46:09 -0700
X-CSE-ConnectionGUID: gnnxKTmVQtWmDDUzeVNuAw==
X-CSE-MsgGUID: KykRIhL+SyK9QHBdS+c6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145246506"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 04 Jun 2025 08:46:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uMqJX-0003GF-2E;
 Wed, 04 Jun 2025 15:46:03 +0000
Date: Wed, 4 Jun 2025 23:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
Message-ID: <202506042352.xDT1ySBT-lkp@intel.com>
References: <20250604093536.95982-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604093536.95982-2-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250604]
[cannot apply to linus/master v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-gpusvm-drm-pagemap-Move-migration-functionality-to-drm_pagemap/20250604-173757
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250604093536.95982-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v2 1/3] drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250604/202506042352.xDT1ySBT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042352.xDT1ySBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042352.xDT1ySBT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   loongarch64-linux-ld: arch/loongarch/kernel/head.o: relocation R_LARCH_B26 overflow 0xffffffffef55fa70
   arch/loongarch/kernel/head.o: in function `smpboot_entry':
>> (.ref.text+0x160): relocation truncated to fit: R_LARCH_B26 against symbol `start_secondary' defined in .text section in arch/loongarch/kernel/smp.o
   loongarch64-linux-ld: final link failed: bad value
--
>> drivers/gpu/drm/drm_pagemap.c:314: warning: Function parameter or struct member 'timeslice_ms' not described in 'drm_pagemap_migrate_to_devmem'


vim +314 drivers/gpu/drm/drm_pagemap.c

   271	
   272	
   273	/**
   274	 * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct range to device memory
   275	 * @devmem_allocation: The device memory allocation to migrate to.
   276	 * The caller should hold a reference to the device memory allocation,
   277	 * and the reference is consumed by this function unless it returns with
   278	 * an error.
   279	 * @mm: Pointer to the struct mm_struct.
   280	 * @start: Start of the virtual address range to migrate.
   281	 * @end: End of the virtual address range to migrate.
   282	 * @pgmap_owner: Not used currently, since only system memory is considered.
   283	 *
   284	 * This function migrates the specified virtual address range to device memory.
   285	 * It performs the necessary setup and invokes the driver-specific operations for
   286	 * migration to device memory. Expected to be called while holding the mmap lock in
   287	 * at least read mode.
   288	 *
   289	 * Return: %0 on success, negative error code on failure.
   290	 */
   291	
   292	/*
   293	 * @range: Pointer to the GPU SVM range structure
   294	 * @devmem_allocation: Pointer to the device memory allocation. The caller
   295	 *                     should hold a reference to the device memory allocation,
   296	 *                     which should be dropped via ops->devmem_release or upon
   297	 *                     the failure of this function.
   298	 * @ctx: GPU SVM context
   299	 *
   300	 * This function migrates the specified GPU SVM range to device memory. It
   301	 * performs the necessary setup and invokes the driver-specific operations for
   302	 * migration to device memory. Upon successful return, @devmem_allocation can
   303	 * safely reference @range until ops->devmem_release is called which only upon
   304	 * successful return. Expected to be called while holding the mmap lock in read
   305	 * mode.
   306	 *
   307	 * Return: 0 on success, negative error code on failure.
   308	 */
   309	int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
   310					  struct mm_struct *mm,
   311					  unsigned long start, unsigned long end,
   312					  unsigned long timeslice_ms,
   313					  void *pgmap_owner)
 > 314	{
   315		const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
   316		struct migrate_vma migrate = {
   317			.start		= start,
   318			.end		= end,
   319			.pgmap_owner	= pgmap_owner,
   320			.flags		= MIGRATE_VMA_SELECT_SYSTEM,
   321		};
   322		unsigned long i, npages = npages_in_range(start, end);
   323		struct vm_area_struct *vas;
   324		struct drm_pagemap_zdd *zdd = NULL;
   325		struct page **pages;
   326		dma_addr_t *dma_addr;
   327		void *buf;
   328		int err;
   329	
   330		mmap_assert_locked(mm);
   331	
   332		if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
   333		    !ops->copy_to_ram)
   334			return -EOPNOTSUPP;
   335	
   336		vas = vma_lookup(mm, start);
   337		if (!vas) {
   338			err = -ENOENT;
   339			goto err_out;
   340		}
   341	
   342		if (end > vas->vm_end || start < vas->vm_start) {
   343			err = -EINVAL;
   344			goto err_out;
   345		}
   346	
   347		if (!vma_is_anonymous(vas)) {
   348			err = -EBUSY;
   349			goto err_out;
   350		}
   351	
   352		buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
   353			       sizeof(*pages), GFP_KERNEL);
   354		if (!buf) {
   355			err = -ENOMEM;
   356			goto err_out;
   357		}
   358		dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
   359		pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
   360	
   361		zdd = drm_pagemap_zdd_alloc(pgmap_owner);
   362		if (!zdd) {
   363			err = -ENOMEM;
   364			goto err_free;
   365		}
   366	
   367		migrate.vma = vas;
   368		migrate.src = buf;
   369		migrate.dst = migrate.src + npages;
   370	
   371		err = migrate_vma_setup(&migrate);
   372		if (err)
   373			goto err_free;
   374	
   375		if (!migrate.cpages) {
   376			err = -EFAULT;
   377			goto err_free;
   378		}
   379	
   380		if (migrate.cpages != npages) {
   381			err = -EBUSY;
   382			goto err_finalize;
   383		}
   384	
   385		err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
   386		if (err)
   387			goto err_finalize;
   388	
   389		err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, dma_addr,
   390						   migrate.src, npages, DMA_TO_DEVICE);
   391		if (err)
   392			goto err_finalize;
   393	
   394		for (i = 0; i < npages; ++i) {
   395			struct page *page = pfn_to_page(migrate.dst[i]);
   396	
   397			pages[i] = page;
   398			migrate.dst[i] = migrate_pfn(migrate.dst[i]);
   399			drm_pagemap_get_devmem_page(page, zdd);
   400		}
   401	
   402		err = ops->copy_to_devmem(pages, dma_addr, npages);
   403		if (err)
   404			goto err_finalize;
   405	
   406		/* Upon success bind devmem allocation to range and zdd */
   407		devmem_allocation->timeslice_expiration = get_jiffies_64() +
   408			msecs_to_jiffies(timeslice_ms);
   409		zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
   410	
   411	err_finalize:
   412		if (err)
   413			drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
   414		migrate_vma_pages(&migrate);
   415		migrate_vma_finalize(&migrate);
   416		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, dma_addr, npages,
   417					       DMA_TO_DEVICE);
   418	err_free:
   419		if (zdd)
   420			drm_pagemap_zdd_put(zdd);
   421		kvfree(buf);
   422	err_out:
   423		return err;
   424	}
   425	EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
