Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A3AAE030
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1033510E7D5;
	Wed,  7 May 2025 13:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wrf2cE3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A46C10E087;
 Wed,  7 May 2025 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746623321; x=1778159321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BWlsrVWi9tqUB9AsRruvwMCXBBv42ZvEG/xOgb6pQ5U=;
 b=Wrf2cE3z6e1VdLWSgGvY/0NzSRhZSrICISDEeDJqicjcJNPKF4TNn1Gg
 aDQigYGbNL2X5CE3kY4gLG2ZdAKgsZyeBhEn9seV8UPZmO5jTEkuv6aYL
 JvjZOa2PxREOBRwrK8/yrKwYitvRz6lrstkCLLCR5n7a4hPYFbkM1XS15
 LZS77UZ0qtRVT3qDEJD5PHtoRylXV28mXvTtCfn7D+V+iErTwIKikqp/g
 6SjVnNN8TPzBnN9jXljXEEZkZO/Upg+7SYGwsssCzw95P2vqhiAEROkqF
 zrQMb2ZK1zti034SvzYMOQKnJ+n422w+aOn2GTh/GCCvgfSb5FfO4YRBJ A==;
X-CSE-ConnectionGUID: EQgDyshpQ/OGIqB+6OaARw==
X-CSE-MsgGUID: n8V8+uhFSsCTzVZhsKoekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="70857362"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="70857362"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:08:40 -0700
X-CSE-ConnectionGUID: 6L2c996mTs2qEYraSTNyIg==
X-CSE-MsgGUID: kf3L4qhkRUKV4eIqF4KmSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="140701672"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 07 May 2025 06:08:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCeVm-0007q4-2V;
 Wed, 07 May 2025 13:08:34 +0000
Date: Wed, 7 May 2025 21:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com,
 airlied@gmail.com, Simona Vetter <simona.vetter@ffwll.ch>,
 felix.kuehling@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
Message-ID: <202505072016.4HmSIZT8-lkp@intel.com>
References: <20250417105113.48831-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417105113.48831-2-thomas.hellstrom@linux.intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250417]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes v6.15-rc2 v6.15-rc1 v6.14 v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-gpusvm-drm-pagemap-Move-migration-functionality-to-drm_pagemap/20250417-193413
base:   next-20250417
patch link:    https://lore.kernel.org/r/20250417105113.48831-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 1/3] drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072016.4HmSIZT8-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072016.4HmSIZT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072016.4HmSIZT8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_pagemap.c:653:7: warning: variable 'dev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     653 |                 if (!page)
         |                     ^~~~~
   drivers/gpu/drm/drm_pagemap.c:683:34: note: uninitialized use occurs here
     683 |         drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
         |                                         ^~~
   drivers/gpu/drm/drm_pagemap.c:653:3: note: remove the 'if' if its condition is always false
     653 |                 if (!page)
         |                 ^~~~~~~~~~
     654 |                         goto err_finalize;
         |                         ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_pagemap.c:602:20: note: initialize the variable 'dev' to silence this warning
     602 |         struct device *dev;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +653 drivers/gpu/drm/drm_pagemap.c

   571	
   572	/**
   573	 * __drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM (internal)
   574	 * @vas: Pointer to the VM area structure
   575	 * @device_private_page_owner: Device private pages owner
   576	 * @page: Pointer to the page for fault handling (can be NULL)
   577	 * @fault_addr: Fault address
   578	 * @size: Size of migration
   579	 *
   580	 * This internal function performs the migration of the specified GPU SVM range
   581	 * to RAM. It sets up the migration, populates + dma maps RAM PFNs, and
   582	 * invokes the driver-specific operations for migration to RAM.
   583	 *
   584	 * Returns:
   585	 * 0 on success, negative error code on failure.
   586	 */
   587	static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
   588						void *device_private_page_owner,
   589						struct page *page,
   590						unsigned long fault_addr,
   591						unsigned long size)
   592	{
   593		struct migrate_vma migrate = {
   594			.vma		= vas,
   595			.pgmap_owner	= device_private_page_owner,
   596			.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
   597			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
   598			.fault_page	= page,
   599		};
   600		struct drm_pagemap_zdd *zdd;
   601		const struct drm_pagemap_devmem_ops *ops;
   602		struct device *dev;
   603		unsigned long npages, mpages = 0;
   604		struct page **pages;
   605		dma_addr_t *dma_addr;
   606		unsigned long start, end;
   607		void *buf;
   608		int i, err = 0;
   609	
   610		start = ALIGN_DOWN(fault_addr, size);
   611		end = ALIGN(fault_addr + 1, size);
   612	
   613		/* Corner where VMA area struct has been partially unmapped */
   614		if (start < vas->vm_start)
   615			start = vas->vm_start;
   616		if (end > vas->vm_end)
   617			end = vas->vm_end;
   618	
   619		migrate.start = start;
   620		migrate.end = end;
   621		npages = npages_in_range(start, end);
   622	
   623		buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
   624			       sizeof(*pages), GFP_KERNEL);
   625		if (!buf) {
   626			err = -ENOMEM;
   627			goto err_out;
   628		}
   629		dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
   630		pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
   631	
   632		migrate.vma = vas;
   633		migrate.src = buf;
   634		migrate.dst = migrate.src + npages;
   635	
   636		err = migrate_vma_setup(&migrate);
   637		if (err)
   638			goto err_free;
   639	
   640		/* Raced with another CPU fault, nothing to do */
   641		if (!migrate.cpages)
   642			goto err_free;
   643	
   644		if (!page) {
   645			for (i = 0; i < npages; ++i) {
   646				if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
   647					continue;
   648	
   649				page = migrate_pfn_to_page(migrate.src[i]);
   650				break;
   651			}
   652	
 > 653			if (!page)
   654				goto err_finalize;
   655		}
   656		zdd = page->zone_device_data;
   657		ops = zdd->devmem_allocation->ops;
   658		dev = zdd->devmem_allocation->dev;
   659	
   660		err = drm_pagemap_migrate_populate_ram_pfn(vas, page, npages, &mpages,
   661							   migrate.src, migrate.dst,
   662							   start);
   663		if (err)
   664			goto err_finalize;
   665	
   666		err = drm_pagemap_migrate_map_pages(dev, dma_addr, migrate.dst, npages,
   667						    DMA_FROM_DEVICE);
   668		if (err)
   669			goto err_finalize;
   670	
   671		for (i = 0; i < npages; ++i)
   672			pages[i] = migrate_pfn_to_page(migrate.src[i]);
   673	
   674		err = ops->copy_to_ram(pages, dma_addr, npages);
   675		if (err)
   676			goto err_finalize;
   677	
   678	err_finalize:
   679		if (err)
   680			drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
   681		migrate_vma_pages(&migrate);
   682		migrate_vma_finalize(&migrate);
   683		drm_pagemap_migrate_unmap_pages(dev, dma_addr, npages,
   684						DMA_FROM_DEVICE);
   685	err_free:
   686		kvfree(buf);
   687	err_out:
   688	
   689		return err;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
