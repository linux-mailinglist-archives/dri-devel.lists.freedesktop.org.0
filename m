Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F36D330A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 20:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9C10E06D;
	Sat,  1 Apr 2023 18:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821BA10E06D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680372401; x=1711908401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pvuGDb5qZZbm+CoP02fOtr1tXOcAWHzA/yMJZs4TKxQ=;
 b=MRxB/UfPjsfS2b5CKi9TNnSBf40TFRGxeMjzuuvVVFrmZDEvTezlpNQH
 pK5aRp0wdNwuv2eWwBVp+IJSsgG9csTS0geC5Oy3mhUU0tU6wOnJ99pzf
 BQt38J7OODc8/vPvMs1i+y/Upf3nzlKXCmZLqUUILGpFnxLQ7rlEV0SGv
 jjoiCBEAeMZZSuK50oIOAsKNnM1r3UciJjK8gtp3ntGuCof/aHJCaG4Xv
 tTCbzBXS7Drs/oBoKHr4A7bM2aDH6hN26xc4KmpCd3oqU9FhKD1sb4keu
 8N54j9vZ+XyvcEYWcqHQFpgDL48anrmPcQPQ5ld6qEHfwTvwZCxVJLPUm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="340400198"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="340400198"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 11:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="635642118"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="635642118"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2023 11:06:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pifcZ-000MxF-1B;
 Sat, 01 Apr 2023 18:06:35 +0000
Date: Sun, 2 Apr 2023 02:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tomba@kernel.org,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
Message-ID: <202304020128.ePL6D3ZL-lkp@intel.com>
References: <20230330083205.12621-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330083205.12621-7-tzimmermann@suse.de>
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230330083205.12621-7-tzimmermann%40suse.de
patch subject: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel client
config: arm-randconfig-r046-20230401 (https://download.01.org/0day-ci/archive/20230402/202304020128.ePL6D3ZL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-omapdrm-Include-linux-of-h/20230330-163453
        git checkout 5b54095ec3eaa71a5cc6b433dfbbf58e26c44e38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/omapdrm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020128.ePL6D3ZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fbdev.c:306:6: warning: no previous prototype for function 'omap_fbdev_setup' [-Wmissing-prototypes]
   void omap_fbdev_setup(struct drm_device *dev)
        ^
   drivers/gpu/drm/omapdrm/omap_fbdev.c:306:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void omap_fbdev_setup(struct drm_device *dev)
   ^
   static 
   1 warning generated.


vim +/omap_fbdev_setup +306 drivers/gpu/drm/omapdrm/omap_fbdev.c

   305	
 > 306	void omap_fbdev_setup(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
