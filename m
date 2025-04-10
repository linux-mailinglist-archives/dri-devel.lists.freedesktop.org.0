Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BBAA84D5F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C228D10E13B;
	Thu, 10 Apr 2025 19:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="km2+W3BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA7010E13B;
 Thu, 10 Apr 2025 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744314259; x=1775850259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bm3/8PF4xnmSSQgO/SPKCn9ZQH9WFMWfGuG8LCM47eI=;
 b=km2+W3BRfj7eb6W/dOhhdnPUwZ/qV5tmNi2EXUrwNACrAn8WBJ7W8aCt
 aBZlFuvufQQxurIeooGWLZdbJ3vwSs1kDUksMbx/jDF2k1OfxW9bnxSMQ
 9L4Z85S0kC0DXttjTus8iEbG/FNC93U1yqhkiKInHBHYyBA6DSuMnQywV
 yqYHEfgqqkLM+Ro7FLTO1mAgQQ/Wd8xih1ldNdR/sIAKDIJUSeXd6afY/
 g5uURzrI/d2dDgVsyxqrV23W7Mi4S+y2I9pHOkuhOZIxQQtnh1qTlOQMg
 nnP5vK+Xz4kkLNkaVdcndCnAHgvIRMoiGlOOLl159MghBabO00a44PvF8 Q==;
X-CSE-ConnectionGUID: He5cgpe9QCaHZlHim96vqA==
X-CSE-MsgGUID: eMKz47DXSdiC7UTrhchzuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="68341408"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="68341408"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 12:44:19 -0700
X-CSE-ConnectionGUID: ZJEymzmWQ+eyCd/EYrTOwQ==
X-CSE-MsgGUID: G9cjUPyTRoyBY9bje9kCOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129960821"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 10 Apr 2025 12:44:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u2xon-000ATj-0b;
 Thu, 10 Apr 2025 19:44:09 +0000
Date: Fri, 11 Apr 2025 03:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 02/19] drm: Pass pixel_format+modifier directly to
 drm_get_format_info()
Message-ID: <202504110343.FEc4bNDr-lkp@intel.com>
References: <20250410163218.15130-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-3-ville.syrjala@linux.intel.com>
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
patch link:    https://lore.kernel.org/r/20250410163218.15130-3-ville.syrjala%40linux.intel.com
patch subject: [PATCH 02/19] drm: Pass pixel_format+modifier directly to drm_get_format_info()
config: hexagon-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504110343.FEc4bNDr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504110343.FEc4bNDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504110343.FEc4bNDr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_fourcc.c:394: warning: Function parameter or struct member 'pixel_format' not described in 'drm_get_format_info'
>> drivers/gpu/drm/drm_fourcc.c:394: warning: Function parameter or struct member 'modifier' not described in 'drm_get_format_info'
>> drivers/gpu/drm/drm_fourcc.c:394: warning: Excess function parameter 'mode_cmd' description in 'drm_get_format_info'


vim +394 drivers/gpu/drm/drm_fourcc.c

84770cc24f3a51 Laurent Pinchart 2016-10-18  381  
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  382  /**
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  383   * drm_get_format_info - query information for a given framebuffer configuration
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  384   * @dev: DRM device
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  385   * @mode_cmd: metadata from the userspace fb creation request
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  386   *
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  387   * Returns:
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  388   * The instance of struct drm_format_info that describes the pixel format, or
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  389   * NULL if the format is unsupported.
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  390   */
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  391  const struct drm_format_info *
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  392  drm_get_format_info(struct drm_device *dev,
9a77ad08811ab1 Ville Syrjälä    2025-04-10  393  		    u32 pixel_format, u64 modifier)
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21 @394  {
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  395  	const struct drm_format_info *info = NULL;
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  396  
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  397  	if (dev->mode_config.funcs->get_format_info)
9a77ad08811ab1 Ville Syrjälä    2025-04-10  398  		info = dev->mode_config.funcs->get_format_info(pixel_format,
9a77ad08811ab1 Ville Syrjälä    2025-04-10  399  							       modifier);
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  400  
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  401  	if (!info)
9a77ad08811ab1 Ville Syrjälä    2025-04-10  402  		info = drm_format_info(pixel_format);
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  403  
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  404  	return info;
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  405  }
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  406  EXPORT_SYMBOL(drm_get_format_info);
6a0f9ebfc5e753 Ville Syrjälä    2017-03-21  407  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
