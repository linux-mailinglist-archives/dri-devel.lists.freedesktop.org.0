Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A58C3E0E
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 11:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71910E558;
	Mon, 13 May 2024 09:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGA9LnWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9DD10E558;
 Mon, 13 May 2024 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715592270; x=1747128270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J5cAD1c2dKYqVqNzS7rC6uInUn5qXdgtIdX9/3QDl08=;
 b=JGA9LnWhUBwBytmOXMVPu8WVGpHVeqSRisA3dReIfNhFQ0vZy9o+/c41
 9sm5n7z2kOuKuz0wi/uRE0EDVO3D98Rs1kB7Tjqa7svQJ1EKQHmUWeDOo
 2ba0g2j2/HfLGcsUx+RXvpGj31wIXEM0fU+secoQ4zx5EsV84IoDhpzpG
 OinGavnMy42Iqs46wk/m/2RTfzdV+0pwdcBdDmhAiZKS9Yz2H5G7pEET2
 kdym1Fk2hy0U+wffQA3jaSpCzO0/Cxt9qjNnX9LmXFcHzUTBFtkPG0NCR
 yI5WDwa9XFmJb/Jd17NLQdXT3YT2fhRjuI0yOLKGR45XwlDQM6rTQvAvv A==;
X-CSE-ConnectionGUID: VpzMWZ2rRYCCiwoHVGL66g==
X-CSE-MsgGUID: pR6O9acLSdaj+Dnx48o8jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11339126"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11339126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:24:29 -0700
X-CSE-ConnectionGUID: joNydMbdRNu7zZAnZp8+8A==
X-CSE-MsgGUID: jw73td0CQkKXUpdFJwDqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34789983"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 13 May 2024 02:24:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s6Rum-0009p5-2A;
 Mon, 13 May 2024 09:24:12 +0000
Date: Mon, 13 May 2024 17:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, nouveau@lists.freedesktop.org,
 dakr@redhat.com
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading.
Message-ID: <202405131724.YtoCSRmy-lkp@intel.com>
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
[also build test ERROR on linus/master v6.9 next-20240513]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-firmware-using-dma-non-coherent-interfaces-for-fw-loading/20240513-144435
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240513064350.1050994-1-airlied%40gmail.com
patch subject: [PATCH] nouveau/firmware: using dma non-coherent interfaces for fw loading.
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240513/202405131724.YtoCSRmy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131724.YtoCSRmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131724.YtoCSRmy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/core/firmware.c: In function 'nvkm_firmware_ctor':
>> drivers/gpu/drm/nouveau/nvkm/core/firmware.c:242:54: error: passing argument 3 of 'dma_alloc_noncoherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
     242 |                                                 len, &fw->phys,
         |                                                      ^~~~~~~~~
         |                                                      |
         |                                                      u64 * {aka long long unsigned int *}
   In file included from include/linux/pci.h:2693,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:8,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/core/firmware.c:22:
   include/linux/dma-mapping.h:321:29: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
     321 |                 dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
         |                 ~~~~~~~~~~~~^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_alloc_noncoherent +242 drivers/gpu/drm/nouveau/nvkm/core/firmware.c

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
