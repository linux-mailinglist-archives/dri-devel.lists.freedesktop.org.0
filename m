Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F065B67A9BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5D810E65A;
	Wed, 25 Jan 2023 04:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8434E10E65A;
 Wed, 25 Jan 2023 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674622308; x=1706158308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KD4JMgqxwED5gr4VrmwBvzAy0O3wbRpFXRdRP7EMoe0=;
 b=FEmgoNLWyBgjAyPlTsiv+aLs/9XXJtHbBIyAFsk7d5g6QpLykFjpZxcx
 V6TTlOqHrNaexg/SOq8jWsuSm1Fbe98PN6DWJCEB0ls7/hs86/vvI1cfK
 37ObPlwEAIn0rm09S3wOBmNAyaFfwTeYjBUPsV/KtWxgsdymxrTWHsfEb
 S1Zqp7Yi/1Cy2FzwUmFAC21ogl5YCYndkVWcF1xMSCgVtGbRjnRkrpdc2
 bGL+JEjUQUbrwtoWoRKAwL5iG4BSQpIS6VlYP1O7Ecz1BWYNvbLSSI1C0
 3XWsnwwaJwDzkLnKFK2Zsp5ojFdDDodt58TqAHds9+LVwPpkZjCD+jT/2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310057101"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310057101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 20:51:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="725743677"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="725743677"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 20:51:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKXl7-00072i-39;
 Wed, 25 Jan 2023 04:51:41 +0000
Date: Wed, 25 Jan 2023 12:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: Re: [Intel-gfx] [PATCH v2 06/10] drm/fb-helper: Initialize
 fb-helper's preferred BPP in prepare function
Message-ID: <202301251250.eyIn4zjn-lkp@intel.com>
References: <20230124134010.30263-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Yet something to improve:

[auto build test ERROR on 7d3e7f64a42d66ba8da6e7b66a8d85457ef84570]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Test-for-connectors-before-sending-hotplug-event/20230124-214220
base:   7d3e7f64a42d66ba8da6e7b66a8d85457ef84570
patch link:    https://lore.kernel.org/r/20230124134010.30263-7-tzimmermann%40suse.de
patch subject: [Intel-gfx] [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred BPP in prepare function
config: riscv-randconfig-r042-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251250.eyIn4zjn-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/70e38534e74e4d12bb02b3b352bba2aed417f541
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-client-Test-for-connectors-before-sending-hotplug-event/20230124-214220
        git checkout 70e38534e74e4d12bb02b3b352bba2aed417f541
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/radeon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_fb.c:352:10: error: too many arguments to function call, expected 3, have 4
                                 &radeon_fb_helper_funcs);
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_fb_helper.h:295:20: note: 'drm_fb_helper_prepare' declared here
   static inline void drm_fb_helper_prepare(struct drm_device *dev,
                      ^
>> drivers/gpu/drm/radeon/radeon_fb.c:361:52: error: too few arguments to function call, expected 2, have 1
           ret = drm_fb_helper_initial_config(&rfbdev->helper);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
   include/drm/drm_fb_helper.h:459:19: note: 'drm_fb_helper_initial_config' declared here
   static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper,
                     ^
   2 errors generated.


vim +352 drivers/gpu/drm/radeon/radeon_fb.c

386516744ba45d Dave Airlie       2010-03-30  326  
386516744ba45d Dave Airlie       2010-03-30  327  int radeon_fbdev_init(struct radeon_device *rdev)
386516744ba45d Dave Airlie       2010-03-30  328  {
8be48d924c307e Dave Airlie       2010-03-30  329  	struct radeon_fbdev *rfbdev;
4abe35204af82a Dave Airlie       2010-03-30  330  	int bpp_sel = 32;
5a79395b2791cc Chris Wilson      2010-06-06  331  	int ret;
4abe35204af82a Dave Airlie       2010-03-30  332  
e5f243bd2edd95 Alex Deucher      2016-03-10  333  	/* don't enable fbdev if no connectors */
e5f243bd2edd95 Alex Deucher      2016-03-10  334  	if (list_empty(&rdev->ddev->mode_config.connector_list))
e5f243bd2edd95 Alex Deucher      2016-03-10  335  		return 0;
e5f243bd2edd95 Alex Deucher      2016-03-10  336  
7b8bd6bb4298ac Egbert Eich       2017-07-18  337  	/* select 8 bpp console on 8MB cards, or 16 bpp on RN50 or 32MB */
7b8bd6bb4298ac Egbert Eich       2017-07-18  338  	if (rdev->mc.real_vram_size <= (8*1024*1024))
4abe35204af82a Dave Airlie       2010-03-30  339  		bpp_sel = 8;
7b8bd6bb4298ac Egbert Eich       2017-07-18  340  	else if (ASIC_IS_RN50(rdev) ||
7b8bd6bb4298ac Egbert Eich       2017-07-18  341  		 rdev->mc.real_vram_size <= (32*1024*1024))
7b8bd6bb4298ac Egbert Eich       2017-07-18  342  		bpp_sel = 16;
8be48d924c307e Dave Airlie       2010-03-30  343  
8be48d924c307e Dave Airlie       2010-03-30  344  	rfbdev = kzalloc(sizeof(struct radeon_fbdev), GFP_KERNEL);
8be48d924c307e Dave Airlie       2010-03-30  345  	if (!rfbdev)
8be48d924c307e Dave Airlie       2010-03-30  346  		return -ENOMEM;
771fe6b912fca5 Jerome Glisse     2009-06-05  347  
8be48d924c307e Dave Airlie       2010-03-30  348  	rfbdev->rdev = rdev;
8be48d924c307e Dave Airlie       2010-03-30  349  	rdev->mode_info.rfbdev = rfbdev;
10a231026574f9 Thierry Reding    2014-06-27  350  
70e38534e74e4d Thomas Zimmermann 2023-01-24  351  	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper, bpp_sel,
10a231026574f9 Thierry Reding    2014-06-27 @352  			      &radeon_fb_helper_funcs);
785b93ef8c3097 Dave Airlie       2009-08-28  353  
2dea2d1182179e Pankaj Bharadiya  2020-03-05  354  	ret = drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
01934c2a691882 Thierry Reding    2014-12-19  355  	if (ret)
01934c2a691882 Thierry Reding    2014-12-19  356  		goto free;
5a79395b2791cc Chris Wilson      2010-06-06  357  
76a39dbfb2d1bc Daniel Vetter     2013-01-20  358  	/* disable all the possible outputs/crtcs before entering KMS mode */
76a39dbfb2d1bc Daniel Vetter     2013-01-20  359  	drm_helper_disable_unused_functions(rdev->ddev);
76a39dbfb2d1bc Daniel Vetter     2013-01-20  360  
70e38534e74e4d Thomas Zimmermann 2023-01-24 @361  	ret = drm_fb_helper_initial_config(&rfbdev->helper);
01934c2a691882 Thierry Reding    2014-12-19  362  	if (ret)
01934c2a691882 Thierry Reding    2014-12-19  363  		goto fini;
01934c2a691882 Thierry Reding    2014-12-19  364  
771fe6b912fca5 Jerome Glisse     2009-06-05  365  	return 0;
01934c2a691882 Thierry Reding    2014-12-19  366  
01934c2a691882 Thierry Reding    2014-12-19  367  fini:
01934c2a691882 Thierry Reding    2014-12-19  368  	drm_fb_helper_fini(&rfbdev->helper);
01934c2a691882 Thierry Reding    2014-12-19  369  free:
01934c2a691882 Thierry Reding    2014-12-19  370  	kfree(rfbdev);
01934c2a691882 Thierry Reding    2014-12-19  371  	return ret;
386516744ba45d Dave Airlie       2010-03-30  372  }
386516744ba45d Dave Airlie       2010-03-30  373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
