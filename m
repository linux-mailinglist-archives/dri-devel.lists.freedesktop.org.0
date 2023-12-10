Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168F80BAAC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 13:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4823010E173;
	Sun, 10 Dec 2023 12:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033F610E170;
 Sun, 10 Dec 2023 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702211410; x=1733747410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1hFKZaaYa0isYOfuRccRS7bdXdTSP+jzodb5aJcq+Mo=;
 b=RUG1I/muz6cT8eihjn9A6NXShrQdHopGDqrQDWcvGUy8jc0+O8DUzMsd
 yqeW7ZM0Yht9iyzxqaT+MxGgC5boiGoYvTeqxuz1Vs5FbcqKF0xI7QLgj
 xbBoALEXVpVjUQfAXCcqV9MOPXJVBBaEJDceiErtH/CuWNppx0jyYFbAi
 d3erj4NKyos1xsUzI5hYK9KE6tfoGTqgUt/ITtnAn3is8wxsre9LNHalS
 i22QJQDE3NW6Ge+//TQIXG7tNfyP8v2JwC0cF5Q0rvyWsuBM+TdrbaKqt
 +CdbrVvWdSUjBcmocKk2hQDZcos+m4uLoUFib7G0ukLCWqeWneBOfSTlY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="7910831"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="7910831"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 04:30:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1104116213"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; d="scan'208";a="1104116213"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2023 04:30:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rCIwd-000Gp8-0G;
 Sun, 10 Dec 2023 12:30:03 +0000
Date: Sun, 10 Dec 2023 20:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: add CDM related logic to
 dpu_hw_ctl layer
Message-ID: <202312102047.S0I69pCs-lkp@intel.com>
References: <20231208050641.32582-11-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208050641.32582-11-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, oe-kbuild-all@lists.linux.dev,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231207]
[also build test WARNING on v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc4 v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-dpu-add-formats-check-for-writeback-encoder/20231208-130820
base:   next-20231207
patch link:    https://lore.kernel.org/r/20231208050641.32582-11-quic_abhinavk%40quicinc.com
patch subject: [PATCH v2 10/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231210/202312102047.S0I69pCs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102047.S0I69pCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102047.S0I69pCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:537:6: warning: variable 'cdm_active' set but not used [-Wunused-but-set-variable]
           u32 cdm_active = 0;
               ^
   1 warning generated.


vim +/cdm_active +537 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c

   528	
   529	
   530	static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
   531			struct dpu_hw_intf_cfg *cfg)
   532	{
   533		struct dpu_hw_blk_reg_map *c = &ctx->hw;
   534		u32 intf_active = 0;
   535		u32 wb_active = 0;
   536		u32 mode_sel = 0;
 > 537		u32 cdm_active = 0;
   538	
   539		/* CTL_TOP[31:28] carries group_id to collate CTL paths
   540		 * per VM. Explicitly disable it until VM support is
   541		 * added in SW. Power on reset value is not disable.
   542		 */
   543		if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
   544			mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
   545	
   546		if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
   547			mode_sel |= BIT(17);
   548	
   549		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
   550		wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
   551		cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
   552	
   553		if (cfg->intf)
   554			intf_active |= BIT(cfg->intf - INTF_0);
   555	
   556		if (cfg->wb)
   557			wb_active |= BIT(cfg->wb - WB_0);
   558	
   559		DPU_REG_WRITE(c, CTL_TOP, mode_sel);
   560		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
   561		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
   562	
   563		if (cfg->merge_3d)
   564			DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
   565				      BIT(cfg->merge_3d - MERGE_3D_0));
   566	
   567		if (cfg->dsc)
   568			DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
   569	
   570		if (cfg->cdm)
   571			DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
