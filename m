Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4E678C1D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305E310E5D7;
	Mon, 23 Jan 2023 23:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6856310E5CE;
 Mon, 23 Jan 2023 23:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674517112; x=1706053112;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BL0KE40ebJXBQ5wLEALwSAqTSiRgt9HETelmZgjk12M=;
 b=NKhhtI3P+EZFUx38fYRCie0mPKEg828ZuEFlxNrynBNf6k48wf45KY14
 An9SvSNfmgMxgzGdNlEI3s6eY/uJhjUwE7joS7aw1E+nyuHs31rWlvMl7
 J1ol4RsjTpiHRab4FZhh3PED5l3mlU1ZLcF4ctuyj0hB9QGOR/j9KQ8CI
 qHXLl8mQkdM9BwpgpmkdmY+ElIROwwnT/djpc8K+Tfni2q9tAcMoSyDi8
 NJMEj//14rBiIHvfig0h90ERLIDaPI+U4U+p3Otpq7ILE2reyCmuYSAn1
 ocPUfjv+HTCpjVWVOusQSBaM4YCL8b6AYdcxdweBOn0/4l9IMQCvtGoVP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323881149"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="323881149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639380552"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="639380552"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 15:38:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pK6OQ-0005xC-1T;
 Mon, 23 Jan 2023 23:38:26 +0000
Date: Tue, 24 Jan 2023 07:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v1 02/14] drm/msm/dp: add dsc factor into calculation of
 supported bpp
Message-ID: <202301240748.RCxiAZH1-lkp@intel.com>
References: <1674498274-6010-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674498274-6010-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20230123]
[also build test WARNING on linus/master v6.2-rc5]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.2-rc5 v6.2-rc4 v6.2-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dp-add-dpcd-read-of-both-dsc-and-fec-capability/20230124-022759
patch link:    https://lore.kernel.org/r/1674498274-6010-3-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v1 02/14] drm/msm/dp: add dsc factor into calculation of supported bpp
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301240748.RCxiAZH1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/745d7acf9ef8affe996fce2f0658a6d95ac151fd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dp-add-dpcd-read-of-both-dsc-and-fec-capability/20230124-022759
        git checkout 745d7acf9ef8affe996fce2f0658a6d95ac151fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_panel.c: In function 'dp_panel_get_supported_bpp':
>> drivers/gpu/drm/msm/dp/dp_panel.c:125:34: warning: variable 'panel' set but not used [-Wunused-but-set-variable]
     125 |         struct dp_panel_private *panel;
         |                                  ^~~~~


vim +/panel +125 drivers/gpu/drm/msm/dp/dp_panel.c

   120	
   121	static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
   122			u32 mode_edid_bpp, u32 mode_pclk_khz)
   123	{
   124		struct dp_link_info *link_info;
 > 125		struct dp_panel_private *panel;
   126		const u32 max_supported_bpp = 30;
   127		u32 min_supported_bpp = 18;
   128		u32 bpp = 0, link_bitrate = 0, mode_bitrate;
   129		s64 rate_fp = 0;
   130	
   131		panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
   132	
   133		if (dp_panel->dsc_en)
   134			min_supported_bpp = 24;
   135	
   136		bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
   137	
   138		link_info = &dp_panel->link_info;
   139	
   140		rate_fp = drm_int2fixp(link_info->num_lanes * link_info->rate * 8);
   141	
   142		if (dp_panel->fec_en)
   143			rate_fp = drm_fixp_div(rate_fp, dp_panel->fec_overhead_fp);
   144	
   145		link_bitrate = drm_fixp2int(rate_fp);
   146	
   147		for (; bpp > min_supported_bpp; bpp -= 6) {
   148			if (dp_panel->dsc_en) {
   149				if (bpp == 30 && !(dp_panel->sink_dsc_caps.color_depth & DP_DSC_10_BPC))
   150					continue;
   151				else if (bpp == 24 && !(dp_panel->sink_dsc_caps.color_depth & DP_DSC_8_BPC))
   152					continue;
   153	
   154				mode_bitrate = mode_pclk_khz * DSC_TGT_BPP;
   155			} else {
   156				mode_bitrate = mode_pclk_khz * bpp;
   157			}
   158	
   159			if (mode_bitrate <= link_bitrate)
   160				break;
   161		}
   162	
   163		if (bpp < min_supported_bpp)
   164			DRM_ERROR("bpp %d is below minimum supported bpp %d\n", bpp,
   165					min_supported_bpp);
   166	
   167		if (dp_panel->dsc_en && bpp != 24 && bpp != 30 && bpp != 36)
   168			DRM_ERROR("bpp %d is not supported when dsc is enabled\n", bpp);
   169	
   170		return bpp;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
