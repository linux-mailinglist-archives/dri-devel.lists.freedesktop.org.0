Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116B987D9B1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 10:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CD210E630;
	Sat, 16 Mar 2024 09:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXmWPe4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D4A10E630
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710582826; x=1742118826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IW65+QI0+a1WUEatSc+JAnWzSCQrAFiTc1KFALWvzxg=;
 b=TXmWPe4gcrrXEjZHJTAJyViOueFfsnsVk55rn5pBjU8pnZxrvM3D1QiT
 o5OvFJxF2CN49Ynl2Wj84dU3eS5uPyDDapBIwr7Z7E9TQogkbxQhRF69E
 v44P8uDlcg2z7qH1T8ma4deRM0rFZ4BamfmcPxTTy6KtpK6ObgKSYfg+x
 MB23erI0e90tYXYMFLMm5SoCIjb91K13gqIyeBsQVui+Kes75hctdFNwG
 AKdIIi2S6fmGK3kRPnpAj0gwOwrQpywRnjguKGfVP6uia2OZMx7qTN/vo
 rTF4K50em5/5U5PxRwM61pNlmf6L2ECk1R038ogUyWjgWIVeihKUDUUTt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5331057"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5331057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2024 02:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="50372441"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 16 Mar 2024 02:53:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rlQjT-000FIN-31;
 Sat, 16 Mar 2024 09:53:39 +0000
Date: Sat, 16 Mar 2024 17:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH 3/6] drm: zynqmp_dp: Add locking
Message-ID: <202403161747.TRmfawhM-lkp@intel.com>
References: <20240315230916.1759060-4-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315230916.1759060-4-sean.anderson@linux.dev>
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8]
[also build test WARNING on linus/master next-20240315]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
base:   v6.8
patch link:    https://lore.kernel.org/r/20240315230916.1759060-4-sean.anderson%40linux.dev
patch subject: [PATCH 3/6] drm: zynqmp_dp: Add locking
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161747.TRmfawhM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161747.TRmfawhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161747.TRmfawhM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/zynqmp_dp.c:321: warning: Function parameter or struct member 'hpd_irq_work' not described in 'zynqmp_dp'


vim +321 drivers/gpu/drm/xlnx/zynqmp_dp.c

d76271d22694e8 Hyun Kwon        2018-07-07  275  
d76271d22694e8 Hyun Kwon        2018-07-07  276  /**
d76271d22694e8 Hyun Kwon        2018-07-07  277   * struct zynqmp_dp - Xilinx DisplayPort core
d76271d22694e8 Hyun Kwon        2018-07-07  278   * @dev: device structure
d76271d22694e8 Hyun Kwon        2018-07-07  279   * @dpsub: Display subsystem
d76271d22694e8 Hyun Kwon        2018-07-07  280   * @iomem: device I/O memory for register access
d76271d22694e8 Hyun Kwon        2018-07-07  281   * @reset: reset controller
8ce380e6568015 Sean Anderson    2024-03-15  282   * @lock: Mutex protecting this struct and register access (but not AUX)
d76271d22694e8 Hyun Kwon        2018-07-07  283   * @irq: irq
47e801bd0749f0 Laurent Pinchart 2021-08-04  284   * @bridge: DRM bridge for the DP encoder
bd68b9b3cb2e0d Laurent Pinchart 2021-08-04  285   * @next_bridge: The downstream bridge
d76271d22694e8 Hyun Kwon        2018-07-07  286   * @config: IP core configuration from DTS
d76271d22694e8 Hyun Kwon        2018-07-07  287   * @aux: aux channel
d76271d22694e8 Hyun Kwon        2018-07-07  288   * @phy: PHY handles for DP lanes
d76271d22694e8 Hyun Kwon        2018-07-07  289   * @num_lanes: number of enabled phy lanes
d76271d22694e8 Hyun Kwon        2018-07-07  290   * @hpd_work: hot plug detection worker
d76271d22694e8 Hyun Kwon        2018-07-07  291   * @status: connection status
d76271d22694e8 Hyun Kwon        2018-07-07  292   * @enabled: flag to indicate if the device is enabled
d76271d22694e8 Hyun Kwon        2018-07-07  293   * @dpcd: DP configuration data from currently connected sink device
d76271d22694e8 Hyun Kwon        2018-07-07  294   * @link_config: common link configuration between IP core and sink device
d76271d22694e8 Hyun Kwon        2018-07-07  295   * @mode: current mode between IP core and sink device
d76271d22694e8 Hyun Kwon        2018-07-07  296   * @train_set: set of training data
d76271d22694e8 Hyun Kwon        2018-07-07  297   */
d76271d22694e8 Hyun Kwon        2018-07-07  298  struct zynqmp_dp {
d76271d22694e8 Hyun Kwon        2018-07-07  299  	struct device *dev;
d76271d22694e8 Hyun Kwon        2018-07-07  300  	struct zynqmp_dpsub *dpsub;
d76271d22694e8 Hyun Kwon        2018-07-07  301  	void __iomem *iomem;
d76271d22694e8 Hyun Kwon        2018-07-07  302  	struct reset_control *reset;
8ce380e6568015 Sean Anderson    2024-03-15  303  	struct mutex lock;
d76271d22694e8 Hyun Kwon        2018-07-07  304  	int irq;
d76271d22694e8 Hyun Kwon        2018-07-07  305  
47e801bd0749f0 Laurent Pinchart 2021-08-04  306  	struct drm_bridge bridge;
bd68b9b3cb2e0d Laurent Pinchart 2021-08-04  307  	struct drm_bridge *next_bridge;
47e801bd0749f0 Laurent Pinchart 2021-08-04  308  
d76271d22694e8 Hyun Kwon        2018-07-07  309  	struct zynqmp_dp_config config;
d76271d22694e8 Hyun Kwon        2018-07-07  310  	struct drm_dp_aux aux;
d76271d22694e8 Hyun Kwon        2018-07-07  311  	struct phy *phy[ZYNQMP_DP_MAX_LANES];
d76271d22694e8 Hyun Kwon        2018-07-07  312  	u8 num_lanes;
8ce380e6568015 Sean Anderson    2024-03-15  313  	struct delayed_work hpd_work, hpd_irq_work;
d76271d22694e8 Hyun Kwon        2018-07-07  314  	enum drm_connector_status status;
d76271d22694e8 Hyun Kwon        2018-07-07  315  	bool enabled;
d76271d22694e8 Hyun Kwon        2018-07-07  316  
d76271d22694e8 Hyun Kwon        2018-07-07  317  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
d76271d22694e8 Hyun Kwon        2018-07-07  318  	struct zynqmp_dp_link_config link_config;
d76271d22694e8 Hyun Kwon        2018-07-07  319  	struct zynqmp_dp_mode mode;
d76271d22694e8 Hyun Kwon        2018-07-07  320  	u8 train_set[ZYNQMP_DP_MAX_LANES];
d76271d22694e8 Hyun Kwon        2018-07-07 @321  };
d76271d22694e8 Hyun Kwon        2018-07-07  322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
