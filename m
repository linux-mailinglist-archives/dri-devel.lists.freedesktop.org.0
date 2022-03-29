Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B1D4EA4CD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 03:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4F210E19C;
	Tue, 29 Mar 2022 01:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151610E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 01:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648518944; x=1680054944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hbjvEAb+w4JWMW/dGinhrbIpob3XHNtn25Pso40+nP0=;
 b=MZMXqtu7sg9mshficZOOvqK+nYSSg9+5H8jU7g4HViQ7wHJX6fQ8hQsv
 Reuy/7cCoaVqhdTdpoTwB9EG+/BZBS7K6TnP1r7fRJ7jkhMmgm5ztAiU7
 7ifEuP0GicV5FmVdGlBq5WDM6nvYCPO/RTjfYvruhQ31GbEvCgAcXILT+
 Zhzh4FA93+Kq+zkaj1az9hrzcZ1ZHnFLLPd9DParrg3HP1gC+no3rHDwU
 +H8nDhAJV1TojPBsLi1cQd3CPXSGCL7OJmOp+nizMAqMrYDOzoxFMHnAl
 vl8UqXFoedlO7YXByAGHA1Yru6+q5jImDYhy28C7/gUuT2Wtt6AOuEl/M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="284034301"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="284034301"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 18:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="604450928"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2022 18:55:42 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZ15B-0002VV-DM; Tue, 29 Mar 2022 01:55:41 +0000
Date: Tue, 29 Mar 2022 09:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 10/11] drm/bridge: tc358767: Split tc_set_video_mode()
 into common and (e)DP part
Message-ID: <202203290927.vwyJHoKX-lkp@intel.com>
References: <20220328214324.252472-11-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328214324.252472-11-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Marek Vasut <marex@denx.de>, kbuild-all@lists.01.org,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17 next-20220328]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-bridge-tc358767-Add-DSI-to-DPI-mode-support/20220329-054627
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20220329/202203290927.vwyJHoKX-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/294c331d772539772ae87613ae1990860bbbc6ff
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marek-Vasut/drm-bridge-tc358767-Add-DSI-to-DPI-mode-support/20220329-054627
        git checkout 294c331d772539772ae87613ae1990860bbbc6ff
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/gpu/drm/bridge/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/tc358767.c: In function 'tc_set_common_video_mode':
>> drivers/gpu/drm/bridge/tc358767.c:741:13: warning: variable 'max_tu_symbol' set but not used [-Wunused-but-set-variable]
     741 |         int max_tu_symbol;
         |             ^~~~~~~~~~~~~


vim +/max_tu_symbol +741 drivers/gpu/drm/bridge/tc358767.c

7caff0fc4296eba Andrey Gusakov   2016-07-13  736  
294c331d7725397 Marek Vasut      2022-03-28  737  static int tc_set_common_video_mode(struct tc_data *tc,
63f8f3badf799c8 Laurent Pinchart 2018-04-06  738  				    const struct drm_display_mode *mode)
7caff0fc4296eba Andrey Gusakov   2016-07-13  739  {
7caff0fc4296eba Andrey Gusakov   2016-07-13  740  	int ret;
7caff0fc4296eba Andrey Gusakov   2016-07-13 @741  	int max_tu_symbol;
7caff0fc4296eba Andrey Gusakov   2016-07-13  742  
7caff0fc4296eba Andrey Gusakov   2016-07-13  743  	int left_margin = mode->htotal - mode->hsync_end;
7caff0fc4296eba Andrey Gusakov   2016-07-13  744  	int right_margin = mode->hsync_start - mode->hdisplay;
7caff0fc4296eba Andrey Gusakov   2016-07-13  745  	int hsync_len = mode->hsync_end - mode->hsync_start;
7caff0fc4296eba Andrey Gusakov   2016-07-13  746  	int upper_margin = mode->vtotal - mode->vsync_end;
7caff0fc4296eba Andrey Gusakov   2016-07-13  747  	int lower_margin = mode->vsync_start - mode->vdisplay;
7caff0fc4296eba Andrey Gusakov   2016-07-13  748  	int vsync_len = mode->vsync_end - mode->vsync_start;
fd70c7755bf0172 Tomi Valkeinen   2019-09-24  749  	u32 bits_per_pixel = 24;
fd70c7755bf0172 Tomi Valkeinen   2019-09-24  750  	u32 in_bw, out_bw;
7caff0fc4296eba Andrey Gusakov   2016-07-13  751  
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  752  	/*
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  753  	 * Recommended maximum number of symbols transferred in a transfer unit:
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  754  	 * DIV_ROUND_UP((input active video bandwidth in bytes) * tu_size,
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  755  	 *              (output active video bandwidth in bytes))
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  756  	 * Must be less than tu_size.
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  757  	 */
fd70c7755bf0172 Tomi Valkeinen   2019-09-24  758  
fd70c7755bf0172 Tomi Valkeinen   2019-09-24  759  	in_bw = mode->clock * bits_per_pixel / 8;
e7dc8d40eea400d Thierry Reding   2019-10-21  760  	out_bw = tc->link.num_lanes * tc->link.rate;
fd70c7755bf0172 Tomi Valkeinen   2019-09-24  761  	max_tu_symbol = DIV_ROUND_UP(in_bw * TU_SIZE_RECOMMENDED, out_bw);
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  762  
7caff0fc4296eba Andrey Gusakov   2016-07-13  763  	dev_dbg(tc->dev, "set mode %dx%d\n",
7caff0fc4296eba Andrey Gusakov   2016-07-13  764  		mode->hdisplay, mode->vdisplay);
7caff0fc4296eba Andrey Gusakov   2016-07-13  765  	dev_dbg(tc->dev, "H margin %d,%d sync %d\n",
7caff0fc4296eba Andrey Gusakov   2016-07-13  766  		left_margin, right_margin, hsync_len);
7caff0fc4296eba Andrey Gusakov   2016-07-13  767  	dev_dbg(tc->dev, "V margin %d,%d sync %d\n",
7caff0fc4296eba Andrey Gusakov   2016-07-13  768  		upper_margin, lower_margin, vsync_len);
7caff0fc4296eba Andrey Gusakov   2016-07-13  769  	dev_dbg(tc->dev, "total: %dx%d\n", mode->htotal, mode->vtotal);
7caff0fc4296eba Andrey Gusakov   2016-07-13  770  
7caff0fc4296eba Andrey Gusakov   2016-07-13  771  
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  772  	/*
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  773  	 * LCD Ctl Frame Size
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  774  	 * datasheet is not clear of vsdelay in case of DPI
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  775  	 * assume we do not need any delay when DPI is a source of
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  776  	 * sync signals
66d1c3b94d5d59e Andrey Gusakov   2017-11-07  777  	 */
6d0c38315915d49 Andrey Smirnov   2019-06-18  778  	ret = regmap_write(tc->regmap, VPCTRL0,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  779  			   FIELD_PREP(VSDELAY, 0) |
7caff0fc4296eba Andrey Gusakov   2016-07-13  780  			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
6d0c38315915d49 Andrey Smirnov   2019-06-18  781  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  782  		return ret;
6d0c38315915d49 Andrey Smirnov   2019-06-18  783  
6d0c38315915d49 Andrey Smirnov   2019-06-18  784  	ret = regmap_write(tc->regmap, HTIM01,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  785  			   FIELD_PREP(HBPR, ALIGN(left_margin, 2)) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  786  			   FIELD_PREP(HPW, ALIGN(hsync_len, 2)));
6d0c38315915d49 Andrey Smirnov   2019-06-18  787  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  788  		return ret;
6d0c38315915d49 Andrey Smirnov   2019-06-18  789  
6d0c38315915d49 Andrey Smirnov   2019-06-18  790  	ret = regmap_write(tc->regmap, HTIM02,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  791  			   FIELD_PREP(HDISPR, ALIGN(mode->hdisplay, 2)) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  792  			   FIELD_PREP(HFPR, ALIGN(right_margin, 2)));
6d0c38315915d49 Andrey Smirnov   2019-06-18  793  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  794  		return ret;
6d0c38315915d49 Andrey Smirnov   2019-06-18  795  
6d0c38315915d49 Andrey Smirnov   2019-06-18  796  	ret = regmap_write(tc->regmap, VTIM01,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  797  			   FIELD_PREP(VBPR, upper_margin) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  798  			   FIELD_PREP(VSPR, vsync_len));
6d0c38315915d49 Andrey Smirnov   2019-06-18  799  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  800  		return ret;
6d0c38315915d49 Andrey Smirnov   2019-06-18  801  
6d0c38315915d49 Andrey Smirnov   2019-06-18  802  	ret = regmap_write(tc->regmap, VTIM02,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  803  			   FIELD_PREP(VFPR, lower_margin) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  804  			   FIELD_PREP(VDISPR, mode->vdisplay));
6d0c38315915d49 Andrey Smirnov   2019-06-18  805  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  806  		return ret;
6d0c38315915d49 Andrey Smirnov   2019-06-18  807  
6d0c38315915d49 Andrey Smirnov   2019-06-18  808  	ret = regmap_write(tc->regmap, VFUEN0, VFUEN); /* update settings */
6d0c38315915d49 Andrey Smirnov   2019-06-18  809  	if (ret)
6d0c38315915d49 Andrey Smirnov   2019-06-18  810  		return ret;
7caff0fc4296eba Andrey Gusakov   2016-07-13  811  
7caff0fc4296eba Andrey Gusakov   2016-07-13  812  	/* Test pattern settings */
6d0c38315915d49 Andrey Smirnov   2019-06-18  813  	ret = regmap_write(tc->regmap, TSTCTL,
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  814  			   FIELD_PREP(COLOR_R, 120) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  815  			   FIELD_PREP(COLOR_G, 20) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  816  			   FIELD_PREP(COLOR_B, 99) |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  817  			   ENI2CFILTER |
3f072c304c0a7e1 Andrey Smirnov   2019-06-18  818  			   FIELD_PREP(COLOR_BAR_MODE, COLOR_BAR_MODE_BARS));
294c331d7725397 Marek Vasut      2022-03-28  819  
6d0c38315915d49 Andrey Smirnov   2019-06-18  820  	return ret;
294c331d7725397 Marek Vasut      2022-03-28  821  }
294c331d7725397 Marek Vasut      2022-03-28  822  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
