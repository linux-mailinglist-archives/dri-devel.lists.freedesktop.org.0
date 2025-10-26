Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC1C0B759
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 00:43:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC310E311;
	Sun, 26 Oct 2025 23:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9xlPDCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB69110E0EF;
 Sun, 26 Oct 2025 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761522191; x=1793058191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4CjfzhsTDxD9DRcK2ivVlUezVMzZMKQloqNF5Aic2pI=;
 b=d9xlPDCnT5ybRWKHA/BBKjgQQhzaT3LswYMRlA0U+nM8FJsyXnHu/z3n
 0L4xo5l6cAgw84W3dbdzAGvxKGh0JOXJ7Oa8qCz4NYPngiTP5c28NPIwQ
 PHs3cha6+Trkr7yWBUaKyd5s3f9ZiJzSqe5FU2x+tb0R0WhYejUJEpuSC
 OlprKkCB6ghd7+0R7wwa/fT7Eok+dRH8fEroeYDLAe6Y7pT5dtwa6AZyV
 hPqnfg6fpZHPynpWsEn9+OiUMNnRjQ2AxNv6aEbtZSCCDic1PDeoen9l0
 YF6KjnSmRA1tChN1jEcnClHACcuVFfjGLgoWPwy8wsHAL8obW38B0ztXK Q==;
X-CSE-ConnectionGUID: xftJ88USQvKMK+Uwh0P7TQ==
X-CSE-MsgGUID: RZLans9vSK+FurnQtOR73Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74205086"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="74205086"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 16:43:11 -0700
X-CSE-ConnectionGUID: vX1q8uVaRhS55w7q3l3fXg==
X-CSE-MsgGUID: pS5jORfYRXCS2zR88DafoA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 16:43:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vDANk-000GOz-05;
 Sun, 26 Oct 2025 23:42:50 +0000
Date: Mon, 27 Oct 2025 07:41:55 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <202510270728.dixqTvyI-lkp@intel.com>
References: <20251026173944.219373-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
config: x86_64-buildonly-randconfig-003-20251027 (https://download.01.org/0day-ci/archive/20251027/202510270728.dixqTvyI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270728.dixqTvyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270728.dixqTvyI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/radeon/radeon_fbdev.c: In function 'radeon_fbdev_driver_fbdev_probe':
>> drivers/gpu/drm/radeon/radeon_fbdev.c:275:1: warning: label 'err_drm_framebuffer_unregister_private' defined but not used [-Wunused-label]
     275 | err_drm_framebuffer_unregister_private:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/gma500/fbdev.c: In function 'psb_fbdev_driver_fbdev_probe':
>> drivers/gpu/drm/gma500/fbdev.c:239:1: warning: label 'err_drm_framebuffer_unregister_private' defined but not used [-Wunused-label]
     239 | err_drm_framebuffer_unregister_private:
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/err_drm_framebuffer_unregister_private +275 drivers/gpu/drm/radeon/radeon_fbdev.c

041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  202  
41d48e557e01582 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2024-09-24  203  int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  204  				    struct drm_fb_helper_surface_size *sizes)
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  205  {
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  206  	struct radeon_device *rdev = fb_helper->dev->dev_private;
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  207  	const struct drm_format_info *format_info;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  208  	struct drm_mode_fb_cmd2 mode_cmd = { };
da786b90bcbd1c5 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2025-10-26  209  	struct fb_info *info = fb_helper->info;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  210  	struct drm_gem_object *gobj;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  211  	struct radeon_bo *rbo;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  212  	struct drm_framebuffer *fb;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  213  	int ret;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  214  	unsigned long tmp;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  215  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  216  	mode_cmd.width = sizes->surface_width;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  217  	mode_cmd.height = sizes->surface_height;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  218  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  219  	/* avivo can't scanout real 24bpp */
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  220  	if ((sizes->surface_bpp == 24) && ASIC_IS_AVIVO(rdev))
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  221  		sizes->surface_bpp = 32;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  222  
308e5bcbdb10452 drivers/gpu/drm/radeon/radeon_fb.c    Jesse Barnes      2011-11-14  223  	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
308e5bcbdb10452 drivers/gpu/drm/radeon/radeon_fb.c    Jesse Barnes      2011-11-14  224  							  sizes->surface_depth);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  225  
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  226  	format_info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd.pixel_format,
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  227  					  mode_cmd.modifier[0]);
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  228  	ret = radeon_fbdev_create_pinned_object(fb_helper, format_info, &mode_cmd, &gobj);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  229  	if (ret) {
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  230  		DRM_ERROR("failed to create fbcon object %d\n", ret);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  231  		return ret;
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  232  	}
7e4d15d90afe46d drivers/gpu/drm/radeon/radeon_fb.c    Simona Vetter     2011-02-18  233  	rbo = gem_to_radeon_bo(gobj);
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  234  
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  235  	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  236  	if (!fb) {
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  237  		ret = -ENOMEM;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  238  		goto err_radeon_fbdev_destroy_pinned_object;
c4aab3499be2abd drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  239  	}
c0a8e4443d768e5 drivers/gpu/drm/radeon/radeon_fbdev.c Imre Deak         2025-08-05  240  	ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, format_info, &mode_cmd, gobj);
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  241  	if (ret) {
8b513d0cf603c0a drivers/gpu/drm/radeon/radeon_fb.c    Masanari Iida     2013-05-21  242  		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  243  		goto err_kfree;
aaefcd4284a5399 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2012-03-06  244  	}
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  245  
386516744ba45d5 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  246  	/* setup helper */
41d48e557e01582 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2024-09-24  247  	fb_helper->funcs = &radeon_fbdev_fb_helper_funcs;
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  248  	fb_helper->fb = fb;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  249  
041f5c416217e37 drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  250  	info->fbops = &radeon_fbdev_fb_ops;
40e324e0d859d76 drivers/gpu/drm/radeon/radeon_fbdev.c Thomas Zimmermann 2023-07-15  251  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  252  	/* radeon resume is fragile and needs a vt switch to help it along */
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  253  	info->skip_vt_switch = false;
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  254  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  255  	drm_fb_helper_fill_info(info, fb_helper, sizes);
785b93ef8c30973 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-08-28  256  
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  257  	tmp = radeon_bo_gpu_offset(rbo) - rdev->mc.vram_start;
f92e93eb5f4d56d drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-22  258  	info->fix.smem_start = rdev->mc.aper_base + tmp;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  259  	info->fix.smem_len = radeon_bo_size(rbo);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  260  	info->screen_base = (__force void __iomem *)rbo->kptr;
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  261  	info->screen_size = radeon_bo_size(rbo);
785b93ef8c30973 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-08-28  262  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  263  	memset_io(info->screen_base, 0, info->screen_size);
ed8f0d9e708a1a7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2009-07-29  264  
fb2a99e15ff0d34 drivers/gpu/drm/radeon/radeon_fb.c    Sascha Hauer      2012-02-06  265  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
4abe35204af82a0 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  266  
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  267  	DRM_INFO("fb mappable at 0x%lX\n",  info->fix.smem_start);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  268  	DRM_INFO("vram apper at 0x%lX\n",  (unsigned long)rdev->mc.aper_base);
8be48d924c307e7 drivers/gpu/drm/radeon/radeon_fb.c    Dave Airlie       2010-03-30  269  	DRM_INFO("size %lu\n", (unsigned long)radeon_bo_size(rbo));
b00c600e91531df drivers/gpu/drm/radeon/radeon_fb.c    Ville Syrjälä     2016-12-14  270  	DRM_INFO("fb depth is %d\n", fb->format->depth);
01f2c7730e18807 drivers/gpu/drm/radeon/radeon_fb.c    Ville Syrjälä     2011-12-20  271  	DRM_INFO("   pitch is %d\n", fb->pitches[0]);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  272  
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  273  	return 0;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  274  
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16 @275  err_drm_framebuffer_unregister_private:
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  276  	fb_helper->fb = NULL;
362063619cf67c2 drivers/gpu/drm/radeon/radeon_fb.c    Simona Vetter     2012-12-10  277  	drm_framebuffer_unregister_private(fb);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  278  	drm_framebuffer_cleanup(fb);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  279  err_kfree:
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  280  	kfree(fb);
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  281  err_radeon_fbdev_destroy_pinned_object:
3a745f6ac13216f drivers/gpu/drm/radeon/radeon_fb.c    Thomas Zimmermann 2023-03-16  282  	radeon_fbdev_destroy_pinned_object(gobj);
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  283  	return ret;
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  284  }
771fe6b912fca54 drivers/gpu/drm/radeon/radeon_fb.c    Jerome Glisse     2009-06-05  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
