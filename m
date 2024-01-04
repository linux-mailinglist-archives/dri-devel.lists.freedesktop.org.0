Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D9823BD9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 06:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11EA10E390;
	Thu,  4 Jan 2024 05:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA8F10E390
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704347084; x=1735883084;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WCQl4HHwjWumQMxOLxbnfx18djvT1HdWFGR04jg8I2I=;
 b=VXOD+NOLchaL5bSifV/G/xUFmB3iXiCxpGCQhkrw/gdhz3Fp5t5Bx4fL
 1tzeJ3UzKBhGei8CXhNRrRVFAaQmpDbTszZioum6611DIItn7BsnZseP8
 qtfk71K0yBR4aeSd1XjTJx/xy2G4Lg6c5UVHx+bR1R6Tssb71jf3sr3l+
 9m9OpcPMlQq7sRF+304lwOisOjvCGrT6pVjiJw3h8gODBYDcl5Jd0Opyl
 /Re9yGS91wRHcfJdLmnl/3Yz9/9EQ9MFV0WPplai4XCmSOpn4aJUXPGt1
 utInK7n8wlfxCsVl1ykXGE23RWSUdpsIWqP3H8y9uGpBw8rnWQf+uuLJr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="396854551"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="396854551"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 21:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="850665483"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208";a="850665483"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2024 21:44:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rLGX1-000MwK-05;
 Thu, 04 Jan 2024 05:44:39 +0000
Date: Thu, 4 Jan 2024 13:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 34/39] drm: bridge: dw_hdmi: switch to ->edid_read
 callback
Message-ID: <202401041305.NcTmAmOJ-lkp@intel.com>
References: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc8 next-20240103]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-bridge-add-edid_read-hook-and-drm_bridge_edid_read/20240103-181513
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula%40intel.com
patch subject: [PATCH v2 34/39] drm: bridge: dw_hdmi: switch to ->edid_read callback
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240104/202401041305.NcTmAmOJ-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401041305.NcTmAmOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041305.NcTmAmOJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2473:3: warning: variable 'edid' is uninitialized when used here [-Wuninitialized]
    2473 |                 edid->width_cm, edid->height_cm);
         |                 ^~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2461:25: note: initialize the variable 'edid' to silence this warning
    2461 |         const struct edid *edid;
         |                                ^
         |                                 = NULL
   1 warning generated.


vim +/edid +2473 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2456  
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2457  static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2458  						struct drm_connector *connector)
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2459  {
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2460  	const struct drm_edid *drm_edid;
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2461  	const struct edid *edid;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2462  
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2463  	if (!hdmi->ddc)
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2464  		return NULL;
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2465  
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2466  	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2467  	if (!drm_edid) {
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2468  		dev_dbg(hdmi->dev, "failed to get edid\n");
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2469  		return NULL;
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2470  	}
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2471  
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2472  	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29 @2473  		edid->width_cm, edid->height_cm);
9aaf880ed4ee3c drivers/staging/imx-drm/imx-hdmi.c        Fabio Estevam    2013-11-29  2474  
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2475  	/*
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2476  	 * FIXME: This should use connector->display_info.is_hdmi and
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2477  	 * connector->display_info.has_audio from a path that has read the EDID
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2478  	 * and called drm_edid_connector_update().
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2479  	 */
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2480  	edid = drm_edid_raw(drm_edid);
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2481  
05b1342f5014b7 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-07-21  2482  	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
f709ec07e38a71 drivers/gpu/drm/bridge/dw_hdmi.c          Russell King     2015-07-21  2483  	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2484  
fcb55de55cf341 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Jani Nikula      2024-01-03  2485  	return drm_edid;
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2486  }
ec971aaa6775cf drivers/gpu/drm/bridge/synopsys/dw-hdmi.c Laurent Pinchart 2020-05-26  2487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
