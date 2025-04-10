Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47162A84FF2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 00:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E155D10E1A1;
	Thu, 10 Apr 2025 22:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ci+TVmu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1F10E056;
 Thu, 10 Apr 2025 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325986; x=1775861986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DWJekeEHlQAOSl0I7z6BkwhKrpd4DubG/ZtfhB1ru+s=;
 b=ci+TVmu5KgYoXWWeik7Aj2Z6oFYPrX4uaamHtnCJJd4cJT7xlbbCYRif
 v7+FOvgvQYjP0km9xR07zkUriDt+CHN7pGVgydG8ANHqjavq16OC7ABDz
 rc0t9IJIY8NEbza5YxHmiSKuZKX30FjJDd4Jbas9xHbQWPGA+WHhyGkfO
 1OVT1cYb5hsvilwIZhve/da2cYYLU7RPtPtJdpLVK5YN5ecGJT11e1kv8
 T+D9mX3VfJUz2shzyS6TtTim4TTONgC5Dj2DecwFUohYTMB9OrcjRSfuw
 5WlN5GOUaDgAOPW02zBjFyxahqhpcpKf8uXGlWmAD+HDO584ykaD/O061 w==;
X-CSE-ConnectionGUID: TUwlb6DvQ8ekufTS4U38fg==
X-CSE-MsgGUID: Pabehw2wRPyCgzGSlCN+SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46008478"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46008478"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:59:45 -0700
X-CSE-ConnectionGUID: iSUdInfrSHms2h/GEpPRYg==
X-CSE-MsgGUID: eJyZzWQHSNCXfgnD+HfgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129998138"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 15:59:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u30ry-000AcF-2h;
 Thu, 10 Apr 2025 22:59:38 +0000
Date: Fri, 11 Apr 2025 06:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org
Subject: Re: [PATCH 07/19] drm/gem: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <202504110656.rvb8s8fd-lkp@intel.com>
References: <20250410163218.15130-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-8-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc1 next-20250410]
[cannot apply to drm-exynos/exynos-drm-next tegra/for-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-Pass-pixel_format-modifier-to-get_format_info/20250411-005845
base:   linus/master
patch link:    https://lore.kernel.org/r/20250410163218.15130-8-ville.syrjala%40linux.intel.com
patch subject: [PATCH 07/19] drm/gem: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
config: hexagon-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504110656.rvb8s8fd-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110656.rvb8s8fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110656.rvb8s8fd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:158: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_init_with_funcs'
>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:233: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_create_with_funcs'
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:282: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_create'
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:321: warning: Function parameter or struct member 'info' not described in 'drm_gem_fb_create_with_dirty'


vim +158 drivers/gpu/drm/drm_gem_framebuffer_helper.c

4c3dbb2c312c9f Noralf Trønnes        2017-08-13  129  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  130  /**
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  131   * drm_gem_fb_init_with_funcs() - Helper function for implementing
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  132   *				  &drm_mode_config_funcs.fb_create
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  133   *				  callback in cases when the driver
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  134   *				  allocates a subclass of
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  135   *				  struct drm_framebuffer
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  136   * @dev: DRM device
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  137   * @fb: framebuffer object
2e187b2099034a Noralf Trønnes        2017-09-22  138   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
2e187b2099034a Noralf Trønnes        2017-09-22  139   * @mode_cmd: Metadata from the userspace framebuffer creation request
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  140   * @funcs: vtable to be used for the new framebuffer object
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  141   *
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  142   * This function can be used to set &drm_framebuffer_funcs for drivers that need
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  143   * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
dbd62e16fd53d3 Noralf Trønnes        2019-01-15  144   * change &drm_framebuffer_funcs. The function does buffer size validation.
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  145   * The buffer size validation is for a general case, though, so users should
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  146   * pay attention to the checks being appropriate for them or, at least,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  147   * non-conflicting.
2e187b2099034a Noralf Trønnes        2017-09-22  148   *
2e187b2099034a Noralf Trønnes        2017-09-22  149   * Returns:
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  150   * Zero or a negative error code.
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  151   */
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  152  int drm_gem_fb_init_with_funcs(struct drm_device *dev,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  153  			       struct drm_framebuffer *fb,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  154  			       struct drm_file *file,
18613f4711126b Ville Syrjälä         2025-04-10  155  			       const struct drm_format_info *info,
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  156  			       const struct drm_mode_fb_cmd2 *mode_cmd,
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  157  			       const struct drm_framebuffer_funcs *funcs)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13 @158  {
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  159  	struct drm_gem_object *objs[DRM_FORMAT_MAX_PLANES];
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  160  	unsigned int i;
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  161  	int ret;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  162  
c91acda3a380bc Maíra Canal           2023-04-12  163  	if (drm_drv_uses_atomic_modeset(dev) &&
c91acda3a380bc Maíra Canal           2023-04-12  164  	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
c91acda3a380bc Maíra Canal           2023-04-12  165  				      mode_cmd->modifier[0])) {
a8b0a7fd535fae Geert Uytterhoeven    2023-07-28  166  		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
c91acda3a380bc Maíra Canal           2023-04-12  167  			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
c91acda3a380bc Maíra Canal           2023-04-12  168  		return -EINVAL;
c91acda3a380bc Maíra Canal           2023-04-12  169  	}
c91acda3a380bc Maíra Canal           2023-04-12  170  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  171  	for (i = 0; i < info->num_planes; i++) {
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  172  		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  173  		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  174  		unsigned int min_size;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  175  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  176  		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  177  		if (!objs[i]) {
24f03be4aa7922 Jani Nikula           2019-12-10  178  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  179  			ret = -ENOENT;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  180  			goto err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  181  		}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  182  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  183  		min_size = (height - 1) * mode_cmd->pitches[i]
042bf753842ddb Alexandru Gheorghe    2018-11-01  184  			 + drm_format_info_min_pitch(info, i, width)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  185  			 + mode_cmd->offsets[i];
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  186  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  187  		if (objs[i]->size < min_size) {
f7f525030854b1 Simon Ser             2021-05-03  188  			drm_dbg_kms(dev,
f7f525030854b1 Simon Ser             2021-05-03  189  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
f7f525030854b1 Simon Ser             2021-05-03  190  				    objs[i]->size, min_size, i);
be6ee102341bc4 Emil Velikov          2020-05-15  191  			drm_gem_object_put(objs[i]);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  192  			ret = -EINVAL;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  193  			goto err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  194  		}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  195  	}
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  196  
18613f4711126b Ville Syrjälä         2025-04-10  197  	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  198  	if (ret)
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  199  		goto err_gem_object_put;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  200  
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  201  	return 0;
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  202  
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  203  err_gem_object_put:
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  204  	while (i > 0) {
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  205  		--i;
be6ee102341bc4 Emil Velikov          2020-05-15  206  		drm_gem_object_put(objs[i]);
279cc2e9543eb3 Thomas Zimmermann     2021-07-30  207  	}
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  208  	return ret;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  209  }
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  210  EXPORT_SYMBOL_GPL(drm_gem_fb_init_with_funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  211  
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  212  /**
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  213   * drm_gem_fb_create_with_funcs() - Helper function for the
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  214   *                                  &drm_mode_config_funcs.fb_create
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  215   *                                  callback
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  216   * @dev: DRM device
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  217   * @file: DRM file that holds the GEM handle(s) backing the framebuffer
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  218   * @mode_cmd: Metadata from the userspace framebuffer creation request
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  219   * @funcs: vtable to be used for the new framebuffer object
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  220   *
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  221   * This function can be used to set &drm_framebuffer_funcs for drivers that need
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  222   * custom framebuffer callbacks. Use drm_gem_fb_create() if you don't need to
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  223   * change &drm_framebuffer_funcs. The function does buffer size validation.
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  224   *
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  225   * Returns:
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  226   * Pointer to a &drm_framebuffer on success or an error pointer on failure.
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  227   */
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  228  struct drm_framebuffer *
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  229  drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
18613f4711126b Ville Syrjälä         2025-04-10  230  			     const struct drm_format_info *info,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  231  			     const struct drm_mode_fb_cmd2 *mode_cmd,
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  232  			     const struct drm_framebuffer_funcs *funcs)
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11 @233  {
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  234  	struct drm_framebuffer *fb;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  235  	int ret;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  236  
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  237  	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  238  	if (!fb)
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  239  		return ERR_PTR(-ENOMEM);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  240  
18613f4711126b Ville Syrjälä         2025-04-10  241  	ret = drm_gem_fb_init_with_funcs(dev, fb, file, info, mode_cmd, funcs);
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  242  	if (ret) {
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  243  		kfree(fb);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  244  		return ERR_PTR(ret);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  245  	}
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  246  
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  247  	return fb;
f2b816d78a9431 Andrzej Pietrasiewicz 2020-03-11  248  }
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  249  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_funcs);
4c3dbb2c312c9f Noralf Trønnes        2017-08-13  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
