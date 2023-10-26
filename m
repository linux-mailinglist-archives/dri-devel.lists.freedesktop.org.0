Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF27D81CE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 13:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF810E0A5;
	Thu, 26 Oct 2023 11:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFC310E0A5;
 Thu, 26 Oct 2023 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698319882; x=1729855882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hocvURNRVGMko0eLbel4gjvaPDXA/uayLf4WPzDZtNY=;
 b=SwK9DJ52OkOx13JAHpuZfC+w7CgNVluYezEL/EMR8qzmL+/aQrk0gQuz
 192bA7FIMJkz72hZs1GbMG7pOSZIgkXOMON/MPKH8zIsOh9tNBDWjXueI
 lBbxpjW9l/jCHIKKi8mJx85V4R39RRMzkpE02IHIyvY6SbzDWyBNZlOpi
 xubMWey7CnE6Zs0gB3go47pq2qcdLZhn1KAhD8UERqE9oT9yBDpZNNuta
 FpA0jnr5ci7q1E2L0amv3yA+podjZbeZ/J5S8Aph0xMKZcPKjKapM5djB
 XISCI9ITG6v4gI45LkDISbn341rk1qCFs0QJPdwlJfbfhdW6397vgnbCk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367741128"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="367741128"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 04:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849890467"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="849890467"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2023 04:31:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qvya3-0009jr-13;
 Thu, 26 Oct 2023 11:31:15 +0000
Date: Thu, 26 Oct 2023 19:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 4/6] drm/bridge: implement generic DP HPD bridge
Message-ID: <202310261906.C62L4fc2-lkp@intel.com>
References: <20231025223027.943563-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025223027.943563-5-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231025]
[also build test ERROR on v6.6-rc7]
[cannot apply to drm-misc/drm-misc-next usb/usb-testing usb/usb-next usb/usb-linus drm/drm-next linus/master v6.6-rc7 v6.6-rc6 v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-bridge-add-transparent-bridge-helper/20231026-063135
base:   next-20231025
patch link:    https://lore.kernel.org/r/20231025223027.943563-5-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v5 4/6] drm/bridge: implement generic DP HPD bridge
config: csky-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261906.C62L4fc2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261906.C62L4fc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261906.C62L4fc2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/phy/qualcomm/phy-qcom-qmp-combo.c:24:
>> include/drm/bridge/aux-bridge.h:28:1: error: expected identifier or '(' before '{' token
      28 | {
         | ^
>> include/drm/bridge/aux-bridge.h:26:30: warning: 'drm_dp_hpd_bridge_register' declared 'static' but never defined [-Wunused-function]
      26 | static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +28 include/drm/bridge/aux-bridge.h

    20	
    21	#if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
    22	struct device *drm_dp_hpd_bridge_register(struct device *parent,
    23						  struct device_node *np);
    24	void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
    25	#else
  > 26	static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
    27								struct device_node *np);
  > 28	{
    29		return 0;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
