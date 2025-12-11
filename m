Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC08CB4A34
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 04:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188DB10E6A6;
	Thu, 11 Dec 2025 03:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFKpNa0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432EF10E6A6;
 Thu, 11 Dec 2025 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765424375; x=1796960375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9iFkj9fmwXAiOWzmsonuaEiNWfOnTU8YW2LHDNjWfMk=;
 b=ZFKpNa0Vp310QXfUWlvMfNsfupu6Jvmn0cHQaF4Zav0DXjOP/Ak5Xl9L
 COa81dVx47kcieSo+Oc3lhtMXLBb4L+mnBmuEktnZXolM0GNEhPkUd/+K
 ziuNpZ9E6yKGGWoyNc5SuWY8RBJ9wyFgIJgtBOu9XLJEJUQTy7OS9+FIB
 tgtykoWxCSxsTMqSqZWbGjZw3TmdsnZSqdEHxYQlq+tfVeYCMuPofha2f
 +8CwvWcQN6sO0f623Fv4aMSXSc89MnruAOjztmAtmzBKT+maG/P1FF658
 nmNL6Ef1cfnGpfr922E1XO7KN6ogXe0J4qPZKtcsU0ZHbek4HTXCUJ2S8 g==;
X-CSE-ConnectionGUID: WoKZR8CsTBmOLFcR3nvouA==
X-CSE-MsgGUID: Q/oOTlXjTpixdyOy+eP5uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78768451"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="78768451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 19:39:35 -0800
X-CSE-ConnectionGUID: cVuFd+0CS0CKH3ZuLmmJAw==
X-CSE-MsgGUID: TIOzoKyrQU+wSxyz6qkpfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="227344222"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 19:39:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vTXWa-0000000046j-0awK;
 Thu, 11 Dec 2025 03:39:28 +0000
Date: Thu, 11 Dec 2025 11:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 21/22] drm/pagemap, drm/xe: Support destination
 migration over interconnect
Message-ID: <202512111107.hyCaihdX-lkp@intel.com>
References: <20251210110742.107575-22-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210110742.107575-22-thomas.hellstrom@linux.intel.com>
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

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-xe/drm-xe-next drm-misc/drm-misc-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master daeinki-drm-exynos/exynos-drm-next v6.18 next-20251210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-xe-svm-Fix-a-debug-printout/20251210-191243
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251210110742.107575-22-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 21/22] drm/pagemap, drm/xe: Support destination migration over interconnect
config: arm-randconfig-004-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111107.hyCaihdX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111107.hyCaihdX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111107.hyCaihdX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_migrate.c:2052:34: error: use of undeclared identifier 'XE_INTERCONNECT_P2P'
    2052 |                                        sram_addr[i].proto == XE_INTERCONNECT_P2P);
         |                                                              ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/XE_INTERCONNECT_P2P +2052 drivers/gpu/drm/xe/xe_migrate.c

  2019	
  2020	static void build_pt_update_batch_sram(struct xe_migrate *m,
  2021					       struct xe_bb *bb, u32 pt_offset,
  2022					       struct drm_pagemap_addr *sram_addr,
  2023					       u32 size, int level)
  2024	{
  2025		u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
  2026		u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
  2027		u32 ptes;
  2028		int i = 0;
  2029	
  2030		xe_tile_assert(m->tile, PAGE_ALIGNED(size));
  2031	
  2032		ptes = DIV_ROUND_UP(size, gpu_page_size);
  2033		while (ptes) {
  2034			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
  2035	
  2036			if (!level)
  2037				chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
  2038	
  2039			bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
  2040			bb->cs[bb->len++] = pt_offset;
  2041			bb->cs[bb->len++] = 0;
  2042	
  2043			pt_offset += chunk * 8;
  2044			ptes -= chunk;
  2045	
  2046			while (chunk--) {
  2047				u64 addr = sram_addr[i].addr;
  2048				u64 pte;
  2049	
  2050				xe_tile_assert(m->tile, sram_addr[i].proto ==
  2051					       DRM_INTERCONNECT_SYSTEM ||
> 2052					       sram_addr[i].proto == XE_INTERCONNECT_P2P);
  2053				xe_tile_assert(m->tile, addr);
  2054				xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
  2055	
  2056	again:
  2057				pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
  2058									addr, pat_index,
  2059									level, false, 0);
  2060				bb->cs[bb->len++] = lower_32_bits(pte);
  2061				bb->cs[bb->len++] = upper_32_bits(pte);
  2062	
  2063				if (gpu_page_size < PAGE_SIZE) {
  2064					addr += XE_PAGE_SIZE;
  2065					if (!PAGE_ALIGNED(addr)) {
  2066						chunk--;
  2067						goto again;
  2068					}
  2069					i++;
  2070				} else {
  2071					i += gpu_page_size / PAGE_SIZE;
  2072				}
  2073			}
  2074		}
  2075	}
  2076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
