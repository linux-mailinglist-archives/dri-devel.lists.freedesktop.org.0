Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE3700CDA
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 18:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052810E6E8;
	Fri, 12 May 2023 16:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353B610E6DA;
 Fri, 12 May 2023 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683908456; x=1715444456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6JMhlSI8AcK3kUbPJJDnaUnKRbv4q1hmlIrs1v8cDOE=;
 b=ii4uAWHUUQ751wxQmLA5UUsHNKSG5A6PFI3EU3gO3xb53Ym/N4wmvSbH
 YUYPZderL3Sc3AZde87ePdV5EhFI0lgielsnPAfQgP5gtCdqnRz0kkgqP
 +4NczElbrdRfys0Hap7ui3+r8Tzoo7XJjuQIrpf6EH9hjVxhj0JOLl86z
 gEsKSvQ/eOIfDto8m3OuncWYMu7XHRzRosm/ytVpHBJ7wt7p3hT2+55Og
 FgW5MRXUHPdqYHQfF0iwX5kUU01U4cSIsfvr4dJ6rxXx4unxXksaWRlVW
 DiJuIqBA1e1X+fNIcY/VGiKs85r6dHNCEqwiCG+GgNTnz6HX2bZ3/02hI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353077823"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="353077823"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 09:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="765219552"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="765219552"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 12 May 2023 09:20:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pxVVi-0004y2-2B;
 Fri, 12 May 2023 16:20:50 +0000
Date: Sat, 13 May 2023 00:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/omapdrm: Use regular fbdev I/O
 helpers
Message-ID: <202305130058.VuW3nBPS-lkp@intel.com>
References: <20230512084152.31233-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512084152.31233-8-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 451e49cfbaa90720149e63f4fa9c7824013c783d]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-armada-Use-regular-fbdev-I-O-helpers/20230512-164432
base:   451e49cfbaa90720149e63f4fa9c7824013c783d
patch link:    https://lore.kernel.org/r/20230512084152.31233-8-tzimmermann%40suse.de
patch subject: [Intel-gfx] [PATCH 07/11] drm/omapdrm: Use regular fbdev I/O helpers
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230513/202305130058.VuW3nBPS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f9113ec6815b748d0b917f78527582b8b08deb40
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-armada-Use-regular-fbdev-I-O-helpers/20230512-164432
        git checkout f9113ec6815b748d0b917f78527582b8b08deb40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/omapdrm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130058.VuW3nBPS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/omap_fbdev.c:306:6: error: redefinition of 'omap_fbdev_setup'
     306 | void omap_fbdev_setup(struct drm_device *dev)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/omapdrm/omap_fbdev.c:19:
   drivers/gpu/drm/omapdrm/omap_fbdev.h:17:20: note: previous definition of 'omap_fbdev_setup' with type 'void(struct drm_device *)'
      17 | static inline void omap_fbdev_setup(struct drm_device *dev)
         |                    ^~~~~~~~~~~~~~~~


vim +/omap_fbdev_setup +306 drivers/gpu/drm/omapdrm/omap_fbdev.c

9e69bcd88e4593 Thomas Zimmermann 2023-04-03  305  
9e69bcd88e4593 Thomas Zimmermann 2023-04-03 @306  void omap_fbdev_setup(struct drm_device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
