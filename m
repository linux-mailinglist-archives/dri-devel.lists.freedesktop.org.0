Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D356DC93F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 18:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2A010E103;
	Mon, 10 Apr 2023 16:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA310E103
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681143940; x=1712679940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lbhk0L0CrBS6dQ4+A5wBYzm+KcA4M5qf6qZwh3rIz+E=;
 b=kobcw9UfNSYNQs3T8siPir9Ea6RxbZew4I4gIo+1wC6P6ZayGOvzsuha
 GlZnA3g1MLdGLP7LAIbWI2NPQabzNZoXWIR7fcWJIH8dDjh3Jt+ynI1Rb
 2zA2ZO0l4vNYdA6eXuDhkC5gjN3f0AasK45IlhuWr2PBMQsVOpQ1/et8K
 DbsBkgZC4ykNBWqFTCYDdguMcsf15lr5XO/sTFAZIOnaw+xuHXBeyqRU7
 2tlXyTOQSMhC7+yRmwRNOAUbA2O+TMc+PFLynDaa8Ns2NNErfP8clJRId
 dAwNuHDg6CrPUMlB5W2mAX21j+vyU+2zg2CbfSvOFCILODme+CDAV4PqF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323755194"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323755194"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 09:25:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="720886084"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="720886084"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 10 Apr 2023 09:25:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pluKf-000VUL-0b;
 Mon, 10 Apr 2023 16:25:29 +0000
Date: Tue, 11 Apr 2023 00:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>, maxime@cerno.tech
Subject: Re: [PATCH 1/2] drm: sun4i/dsi: factor out DSI PHY poweron and
 poweroff
Message-ID: <202304110053.n5nu03YZ-lkp@intel.com>
References: <20230410084750.164016-2-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410084750.164016-2-fusibrandon13@gmail.com>
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
Cc: krzysztof.kozlowski+dt@linaro.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com, sam@ravnborg.org,
 marex@denx.de, rfoss@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com,
 wens@csie.org, jagan@amarulasolutions.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, robh+dt@kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, dave.stevenson@raspberrypi.com,
 tzimmermann@suse.de, linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brandon,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v6.3-rc6 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Cheo-Fusi/drm-sun4i-dsi-factor-out-DSI-PHY-poweron-and-poweroff/20230410-165257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20230410084750.164016-2-fusibrandon13%40gmail.com
patch subject: [PATCH 1/2] drm: sun4i/dsi: factor out DSI PHY poweron and poweroff
config: arm64-randconfig-r002-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110053.n5nu03YZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/afa9cb6821e4527f07c10a777ea44e380b524858
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Brandon-Cheo-Fusi/drm-sun4i-dsi-factor-out-DSI-PHY-poweron-and-poweroff/20230410-165257
        git checkout afa9cb6821e4527f07c10a777ea44e380b524858
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/sun4i/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110053.n5nu03YZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:843:13: error: incompatible function pointer types initializing 'void (*)(struct drm_encoder *)' with an expression of type 'void (struct drm_encoder *, struct drm_atomic_state *)' [-Wincompatible-function-pointer-types]
           .enable         = sun6i_dsi_encoder_enable,
                             ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +843 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c

133add5b5ad42b Maxime Ripard 2018-04-04  841  
133add5b5ad42b Maxime Ripard 2018-04-04  842  static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
133add5b5ad42b Maxime Ripard 2018-04-04 @843  	.enable		= sun6i_dsi_encoder_enable,
133add5b5ad42b Maxime Ripard 2018-04-04  844  };
133add5b5ad42b Maxime Ripard 2018-04-04  845  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
