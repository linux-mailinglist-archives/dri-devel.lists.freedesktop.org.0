Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E818C440A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EFE10E306;
	Mon, 13 May 2024 15:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzGU7IS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1417110E306;
 Mon, 13 May 2024 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715613533; x=1747149533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=56FIH33ASa4B4yIKs3CG1FH5+Gkw0BL/r+GY/ouYjDk=;
 b=MzGU7IS/eBXWlbZEoSLOnGNxBnbFEOeHSRz25Mdvv7l7lApz6P4UECrO
 UBmADZ54WkIbN9YTFlpx6asi2KtHejWlJUPSTA68rayhlYkOb4HhYfzw6
 p2h50+49kjWNqJCoTf0BQYj6sJ1+g06jcWFe5p8pqp+1NR6zJjsZHv+AD
 BT+8Odc0709fowcirAr61AlFaU1gZfYysomQewDUf19NrvqFSPvZwaFPQ
 vA+5V4adae6a7ju/Pzjqg3+T0feXlyNK9jDl/glY1xKXOJam5QGkJ+iYk
 YOX+OjDbAnhB6rt2h5nEiYpldwgywVUEiOfYnQiC8ryg2ZEr/RS+Q/mtM A==;
X-CSE-ConnectionGUID: Y8s1j/L0Q2qRGq8WA01cWA==
X-CSE-MsgGUID: ViuI8/krQfiukp5TuKlwMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15373287"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15373287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:17:43 -0700
X-CSE-ConnectionGUID: ogWHM4urS4awQp3N7pB5BQ==
X-CSE-MsgGUID: 7+g/1Bs0SwKy35Wa2zFAWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35240082"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2024 08:17:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s6XQn-000APT-36;
 Mon, 13 May 2024 15:17:37 +0000
Date: Mon, 13 May 2024 23:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 nouveau@lists.freedesktop.org, dakr@redhat.com
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading.
Message-ID: <202405132205.FVKltMCq-lkp@intel.com>
References: <20240513064350.1050994-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513064350.1050994-1-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.9 next-20240513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-firmware-using-dma-non-coherent-interfaces-for-fw-loading/20240513-144435
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240513064350.1050994-1-airlied%40gmail.com
patch subject: [PATCH] nouveau/firmware: using dma non-coherent interfaces for fw loading.
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240513/202405132205.FVKltMCq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405132205.FVKltMCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405132205.FVKltMCq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/core/firmware.c:242:12: error: incompatible pointer types passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
                                                   len, &fw->phys,
                                                        ^~~~~~~~~
   include/linux/dma-mapping.h:321:15: note: passing argument to parameter 'dma_handle' here
                   dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
                               ^
   1 error generated.


vim +242 drivers/gpu/drm/nouveau/nvkm/core/firmware.c

   224	
   225	int
   226	nvkm_firmware_ctor(const struct nvkm_firmware_func *func, const char *name,
   227			   struct nvkm_device *device, const void *src, int len, struct nvkm_firmware *fw)
   228	{
   229		fw->func = func;
   230		fw->name = name;
   231		fw->device = device;
   232		fw->len = len;
   233	
   234		switch (fw->func->type) {
   235		case NVKM_FIRMWARE_IMG_RAM:
   236			fw->img = kmemdup(src, fw->len, GFP_KERNEL);
   237			break;
   238		case NVKM_FIRMWARE_IMG_DMA: {
   239			len = ALIGN(fw->len, PAGE_SIZE);
   240	
   241			fw->img = dma_alloc_noncoherent(fw->device->dev,
 > 242							len, &fw->phys,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
