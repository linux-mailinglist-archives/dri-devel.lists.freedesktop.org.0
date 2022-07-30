Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE0585823
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 05:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BBE10E498;
	Sat, 30 Jul 2022 03:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2738510E498
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 03:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659150221; x=1690686221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yWLJrWfiYOhP2GrDM/RfY8uWpLUU1KeC3w9W08D9/Mk=;
 b=Djq0FE8KtglwuqDbGNk0+VT++5mjY0XcdgadsKW5SxeJ09Dw4C+XOzmx
 ZBxWJOrrTevzlBbSuTVdWRhU4dwNs08s4JaQ8cg4wakLziHlFbqTJSI+0
 XzOE+zl6TF3EYM+r7e8TiPhFxNB5IWjWT+EHzucbZtRwzP7R0bmF2Lraa
 AScNyme+vOch944HaB4MSNvvMtYvAlzJOR/eYfKGR/iLZ4aMiXGtK+zcf
 C/hro4oaFOZrUIQHy8pXVNspJ7OYWgZ/qUZfZUzkYhR0/qLXvArku/ZM5
 vEgI1a9aJhpXCP5nMamikmo6oDs3jV0HfyI6X5D67vh1zPZlMGXoKgpG8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="288898457"
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="288898457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 20:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,203,1654585200"; d="scan'208";a="704389955"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2022 20:03:35 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oHclK-000CJh-1P;
 Sat, 30 Jul 2022 03:03:34 +0000
Date: Sat, 30 Jul 2022 11:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 22/35] drm/vc4: vec: Use TV Reset implementation
Message-ID: <202207301024.h3rifgQO-lkp@intel.com>
References: <20220728-rpi-analog-tv-properties-v1-22-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-22-3d53ae722097@cerno.tech>
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
Cc: kbuild-all@lists.01.org, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
base:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220730/202207301024.h3rifgQO-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f380bf85052b89ae0ffc6cfdf2dc91cdcde5a75
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-Analog-TV-Improvements/20220730-004859
        git checkout 2f380bf85052b89ae0ffc6cfdf2dc91cdcde5a75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/vc4/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_vec.c:257:6: warning: no previous prototype for 'vc4_vec_connector_reset' [-Wmissing-prototypes]
     257 | void vc4_vec_connector_reset(struct drm_connector *connector)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/vc4_vec_connector_reset +257 drivers/gpu/drm/vc4/vc4_vec.c

   256	
 > 257	void vc4_vec_connector_reset(struct drm_connector *connector)
   258	{
   259		drm_atomic_helper_connector_reset(connector);
   260		drm_atomic_helper_connector_tv_reset(connector);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
