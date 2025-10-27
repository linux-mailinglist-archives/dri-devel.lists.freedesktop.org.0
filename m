Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B139C0B8D0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 01:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C5310E314;
	Mon, 27 Oct 2025 00:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyk2sXYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC8710E05E;
 Mon, 27 Oct 2025 00:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761526025; x=1793062025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BKuHZdiShtlLZykFF20DStnoeO6azXfPEP/FBMGF618=;
 b=iyk2sXYPtVwvSAdyi6GIylZgJoiExow5whxnA4zRmobPEn1CirnEZb38
 nuzeFUgzSzdmip7hovy1RaidjpBVXpsHzwunB1gdT94S+RotM8y7GGaq7
 ebQ36jdb3fzj1BZ+csEUAiCDY4UhEGg95dFBL6XQBj8diF3i4wZocPQGs
 QFhmZcK/gVtxIT7Io0bDEU2qkTiBg3dx/JV7LM2WIzIKEpT+G6q/LK9A1
 2SyWoSCB5TdlByuDOAA+peGknBE/w4k+Q40zRT4rWZrChTTW7XolQedDd
 ihqgv5PPC7B7coRdMeQqVFEHw5ath+2feeztpsRsIr95TZWst+DeGNyvl w==;
X-CSE-ConnectionGUID: XAZIxdFRQ2KXI5EhO8mvvg==
X-CSE-MsgGUID: 5NxssI1DTwC15RnLTSDSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81235964"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="81235964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 17:47:04 -0700
X-CSE-ConnectionGUID: QXGTwE9ITj+wqgMQm5xR5A==
X-CSE-MsgGUID: 7dUtEu9cQBeKCn61xts60w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 17:46:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vDBNt-000GQL-2h;
 Mon, 27 Oct 2025 00:46:53 +0000
Date: Mon, 27 Oct 2025 08:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <202510270856.L1iU6js4-lkp@intel.com>
References: <20251026173944.219373-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026173944.219373-1-tzimmermann@suse.de>
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

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-i915/for-linux-next drm-i915/for-linux-next-fixes tegra/for-next linus/master v6.18-rc2 next-20251024]
[cannot apply to rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fb-helper-Allocate-and-release-fb_info-in-single-place/20251027-014054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20251026173944.219373-1-tzimmermann%40suse.de
patch subject: [PATCH] drm/fb-helper: Allocate and release fb_info in single place
config: arm-randconfig-002-20251027 (https://download.01.org/0day-ci/archive/20251027/202510270856.L1iU6js4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270856.L1iU6js4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270856.L1iU6js4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_fbdev_ttm.c:208:26: warning: variable 'info' is uninitialized when used here [-Wuninitialized]
     208 |         drm_fb_helper_fill_info(info, fb_helper, sizes);
         |                                 ^~~~
   drivers/gpu/drm/drm_fbdev_ttm.c:180:22: note: initialize the variable 'info' to silence this warning
     180 |         struct fb_info *info;
         |                             ^
         |                              = NULL
   1 warning generated.
--
>> drivers/gpu/drm/armada/armada_fbdev.c:111:2: warning: unused label 'err_fballoc' [-Wunused-label]
     111 |  err_fballoc:
         |  ^~~~~~~~~~~~
   1 warning generated.
--
>> drivers/gpu/drm/radeon/radeon_fbdev.c:275:1: warning: unused label 'err_drm_framebuffer_unregister_private' [-Wunused-label]
     275 | err_drm_framebuffer_unregister_private:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/info +208 drivers/gpu/drm/drm_fbdev_ttm.c

8ab59da26bc0ae drivers/gpu/drm/drm_fbdev_generic.c Thomas Zimmermann 2022-11-03  169  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  170  /*
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  171   * struct drm_driver
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  172   */
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  173  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  174  int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  175  				     struct drm_fb_helper_surface_size *sizes)
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  176  {
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  177  	struct drm_client_dev *client = &fb_helper->client;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  178  	struct drm_device *dev = fb_helper->dev;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  179  	struct drm_client_buffer *buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  180  	struct fb_info *info;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  181  	size_t screen_size;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  182  	void *screen_buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  183  	u32 format;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  184  	int ret;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  185  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  186  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  187  		    sizes->surface_width, sizes->surface_height,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  188  		    sizes->surface_bpp);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  189  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  190  	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  191  					     sizes->surface_depth);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  192  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  193  					       sizes->surface_height, format);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  194  	if (IS_ERR(buffer))
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  195  		return PTR_ERR(buffer);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  196  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  197  	fb_helper->funcs = &drm_fbdev_ttm_helper_funcs;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  198  	fb_helper->buffer = buffer;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  199  	fb_helper->fb = buffer->fb;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  200  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  201  	screen_size = buffer->gem->size;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  202  	screen_buffer = vzalloc(screen_size);
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  203  	if (!screen_buffer) {
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  204  		ret = -ENOMEM;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  205  		goto err_drm_client_framebuffer_delete;
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  206  	}
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24  207  
c7c1b9e1d52b0a drivers/gpu/drm/drm_fbdev_ttm.c     Thomas Zimmermann 2024-09-24 @208  	drm_fb_helper_fill_info(info, fb_helper, sizes);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
