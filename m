Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C1678C97
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD48E10E5DC;
	Tue, 24 Jan 2023 00:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320D10E5DB;
 Tue, 24 Jan 2023 00:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674518979; x=1706054979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2lYJ2FzXDDNTR04FHN+LTc4RzQpUQbtmj+HhVlbc2Jg=;
 b=nk5pDVrXPJlCyGM48VcSzAxXGsgB3n5a32e2/fMoDmbHuReCmeRHJ+tw
 jp3YcdNRKfR35PWjImuLz0eLXXYW3ydbeyQv7VJeZK3vHkyk7Kis+IgKg
 I+oByj3WZ14nNtV3MmQPpv3Zg3yulLamBGPwyu8pgmgTJrj6kO6hY7p1x
 LFlxYlSJbfWTm1cOPQ4G3wq0qLH/fmZRfHM3zKqLoHoxR1/JWgDG7U8sq
 8eEDsmYyBxougWvRzXkMKIIZGOXURzfmyIXjYchFKeKDNKoWonBcBQNRd
 ZPIenGtakzfwjfctut2cQccsHcOt5ymyWAIXfPJ7UOQKYnrZrRzTXndJj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412424215"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="412424215"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 16:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804384325"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="804384325"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 16:09:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pK6sR-0005y0-10;
 Tue, 24 Jan 2023 00:09:27 +0000
Date: Tue, 24 Jan 2023 08:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v1 05/14] drm/msm/dp: upgrade tu calculation base on
 newest algorithm
Message-ID: <202301240854.5yJVG3RR-lkp@intel.com>
References: <1674498274-6010-6-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674498274-6010-6-git-send-email-quic_khsieh@quicinc.com>
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
patch link:    https://lore.kernel.org/r/1674498274-6010-6-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v1 05/14] drm/msm/dp: upgrade tu calculation base on newest algorithm
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230124/202301240854.5yJVG3RR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/286a3dd6028ada56b471b5cb977f5ed461b094e4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dp-add-dpcd-read-of-both-dsc-and-fec-capability/20230124-022759
        git checkout 286a3dd6028ada56b471b5cb977f5ed461b094e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_ctrl.c: In function '_tu_param_compare':
   drivers/gpu/drm/msm/dp/dp_ctrl.c:282:20: warning: variable 'b_frac' set but not used [-Wunused-but-set-variable]
     282 |         u32 b_int, b_frac, b_sign;
         |                    ^~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:282:13: warning: variable 'b_int' set but not used [-Wunused-but-set-variable]
     282 |         u32 b_int, b_frac, b_sign;
         |             ^~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:281:20: warning: variable 'a_frac' set but not used [-Wunused-but-set-variable]
     281 |         u32 a_int, a_frac, a_sign;
         |                    ^~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:281:13: warning: variable 'a_int' set but not used [-Wunused-but-set-variable]
     281 |         u32 a_int, a_frac, a_sign;
         |             ^~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c: In function 'dp_panel_update_tu_timings':
   drivers/gpu/drm/msm/dp/dp_ctrl.c:344:13: warning: variable 'overhead_dsc' set but not used [-Wunused-but-set-variable]
     344 |         s64 overhead_dsc;
         |             ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/dp/dp_ctrl.c:18:
   drivers/gpu/drm/msm/dp/dp_ctrl.c: In function '_dp_ctrl_calc_tu':
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:27: warning: format '%d' expects argument of type 'int', but argument 4 has type 's64' {aka 'long long int'} [-Wformat=]
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~
         |                                                                             |
         |                                                                             s64 {aka long long int}
   include/drm/drm_print.h:524:65: note: in definition of macro '__drm_dbg'
     524 | #define __drm_dbg(fmt, ...)             ___drm_dbg(NULL, fmt, ##__VA_ARGS__)
         |                                                                 ^~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:17: note: in expansion of macro 'DRM_DEBUG'
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                 ^~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:61: note: format string is defined here
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                                                            ~^
         |                                                             |
         |                                                             int
         |                                                            %lld
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:27: warning: format '%d' expects argument of type 'int', but argument 5 has type 's64' {aka 'long long int'} [-Wformat=]
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     824 |                         HBLANK_MARGIN_EXTRA);
         |                         ~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         s64 {aka long long int}
   include/drm/drm_print.h:524:65: note: in definition of macro '__drm_dbg'
     524 | #define __drm_dbg(fmt, ...)             ___drm_dbg(NULL, fmt, ##__VA_ARGS__)
         |                                                                 ^~~~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:17: note: in expansion of macro 'DRM_DEBUG'
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                 ^~~~~~~~~
   drivers/gpu/drm/msm/dp/dp_ctrl.c:823:70: note: format string is defined here
     823 |                 DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
         |                                                                     ~^
         |                                                                      |
         |                                                                      int
         |                                                                     %lld
   drivers/gpu/drm/msm/dp/dp_ctrl.c: In function '_dp_ctrl_calc_tu.constprop':
>> drivers/gpu/drm/msm/dp/dp_ctrl.c:1072:1: warning: the frame size of 1084 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1072 | }
         | ^


vim +1072 drivers/gpu/drm/msm/dp/dp_ctrl.c

286a3dd6028ada Kuogee Hsieh     2023-01-23   743  
286a3dd6028ada Kuogee Hsieh     2023-01-23   744  
202aceac8bb3ae Kuogee Hsieh     2022-02-17   745  static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
202aceac8bb3ae Kuogee Hsieh     2022-02-17   746  				struct dp_tu_calc_input *in,
c943b4948b5848 Chandan Uddaraju 2020-08-27   747  				struct dp_vc_tu_mapping_table *tu_table)
c943b4948b5848 Chandan Uddaraju 2020-08-27   748  {
286a3dd6028ada Kuogee Hsieh     2023-01-23   749  	struct tu_algo_data tu;
c943b4948b5848 Chandan Uddaraju 2020-08-27   750  	int compare_result_1, compare_result_2;
286a3dd6028ada Kuogee Hsieh     2023-01-23   751  	u64 temp = 0, temp1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   752  	s64 temp_fp = 0, temp1_fp = 0, temp2_fp = 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27   753  
c943b4948b5848 Chandan Uddaraju 2020-08-27   754  	s64 LCLK_FAST_SKEW_fp = drm_fixp_from_fraction(6, 10000); /* 0.0006 */
c943b4948b5848 Chandan Uddaraju 2020-08-27   755  	s64 RATIO_SCALE_fp = drm_fixp_from_fraction(1001, 1000);
c943b4948b5848 Chandan Uddaraju 2020-08-27   756  
c943b4948b5848 Chandan Uddaraju 2020-08-27   757  	u8 DP_BRUTE_FORCE = 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   758  	s64 BRUTE_FORCE_THRESHOLD_fp = drm_fixp_from_fraction(1, 10); /* 0.1 */
c943b4948b5848 Chandan Uddaraju 2020-08-27   759  	uint EXTRA_PIXCLK_CYCLE_DELAY = 4;
286a3dd6028ada Kuogee Hsieh     2023-01-23   760  	s64 HBLANK_MARGIN = drm_fixp_from_fraction(4, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   761  	s64 HBLANK_MARGIN_EXTRA = 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27   762  
c943b4948b5848 Chandan Uddaraju 2020-08-27   763  
286a3dd6028ada Kuogee Hsieh     2023-01-23   764  	memset(&tu, 0, sizeof(tu));
c943b4948b5848 Chandan Uddaraju 2020-08-27   765  
286a3dd6028ada Kuogee Hsieh     2023-01-23   766  	dp_panel_update_tu_timings(in, &tu);
c943b4948b5848 Chandan Uddaraju 2020-08-27   767  
286a3dd6028ada Kuogee Hsieh     2023-01-23   768  	tu.err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
c943b4948b5848 Chandan Uddaraju 2020-08-27   769  
286a3dd6028ada Kuogee Hsieh     2023-01-23   770  	temp1_fp = drm_fixp_from_fraction(4, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   771  	temp2_fp = drm_fixp_mul(temp1_fp, tu.lclk_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   772  	temp_fp = drm_fixp_div(temp2_fp, tu.pclk_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   773  	tu.extra_buffer_margin = fixp2int_ceil(temp_fp);
cc9014bf63a4d8 Lee Jones        2020-11-24   774  
286a3dd6028ada Kuogee Hsieh     2023-01-23   775  	if (in->compress_ratio == 375 && tu.bpp == 30)
286a3dd6028ada Kuogee Hsieh     2023-01-23   776  		temp1_fp = drm_fixp_from_fraction(24, 8);
286a3dd6028ada Kuogee Hsieh     2023-01-23   777  	else
286a3dd6028ada Kuogee Hsieh     2023-01-23   778  		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
cc9014bf63a4d8 Lee Jones        2020-11-24   779  
286a3dd6028ada Kuogee Hsieh     2023-01-23   780  	temp2_fp = drm_fixp_mul(tu.pclk_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   781  	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   782  	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   783  	tu.ratio_fp = drm_fixp_div(temp2_fp, tu.lclk_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   784  
286a3dd6028ada Kuogee Hsieh     2023-01-23   785  	tu.original_ratio_fp = tu.ratio_fp;
286a3dd6028ada Kuogee Hsieh     2023-01-23   786  	tu.boundary_moderation_en = false;
286a3dd6028ada Kuogee Hsieh     2023-01-23   787  	tu.upper_boundary_count = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   788  	tu.lower_boundary_count = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   789  	tu.i_upper_boundary_count = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   790  	tu.i_lower_boundary_count = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   791  	tu.valid_lower_boundary_link = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   792  	tu.even_distribution_BF = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   793  	tu.even_distribution_legacy = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   794  	tu.even_distribution = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   795  	tu.hbp_delayStartCheck = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   796  	tu.pre_tu_hw_pipe_delay = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   797  	tu.post_tu_hw_pipe_delay = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   798  	tu.link_config_hactive_time = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   799  	tu.delay_start_link_lclk = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   800  	tu.tu_active_cycles = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   801  	tu.resolution_line_time = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   802  	tu.last_partial_lclk = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   803  	tu.delay_start_time_fp = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   804  	tu.second_loop_set = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   805  
286a3dd6028ada Kuogee Hsieh     2023-01-23   806  	tu.err_fp = drm_fixp_from_fraction(1000, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   807  	tu.n_err_fp = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   808  	tu.n_n_err_fp = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   809  
286a3dd6028ada Kuogee Hsieh     2023-01-23   810  	temp = drm_fixp2int(tu.lwidth_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   811  	if ((((u32)temp % tu.nlanes) != 0) && (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 2)
286a3dd6028ada Kuogee Hsieh     2023-01-23   812  			&& (tu.dsc_en == 0)) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   813  		tu.ratio_fp = drm_fixp_mul(tu.ratio_fp, RATIO_SCALE_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   814  		if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
286a3dd6028ada Kuogee Hsieh     2023-01-23   815  			tu.ratio_fp = DRM_FIXED_ONE;
c943b4948b5848 Chandan Uddaraju 2020-08-27   816  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27   817  
286a3dd6028ada Kuogee Hsieh     2023-01-23   818  	if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
286a3dd6028ada Kuogee Hsieh     2023-01-23   819  		tu.ratio_fp = DRM_FIXED_ONE;
c943b4948b5848 Chandan Uddaraju 2020-08-27   820  
286a3dd6028ada Kuogee Hsieh     2023-01-23   821  	if (HBLANK_MARGIN_EXTRA != 0) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   822  		HBLANK_MARGIN += HBLANK_MARGIN_EXTRA;
286a3dd6028ada Kuogee Hsieh     2023-01-23   823  		DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
286a3dd6028ada Kuogee Hsieh     2023-01-23   824  			HBLANK_MARGIN_EXTRA);
c943b4948b5848 Chandan Uddaraju 2020-08-27   825  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27   826  
286a3dd6028ada Kuogee Hsieh     2023-01-23   827  	for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   828  		temp1_fp = drm_fixp_from_fraction(tu.tu_size, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   829  		temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   830  		temp = fixp2int_ceil(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   831  		temp1_fp = drm_fixp_from_fraction(temp, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   832  		tu.n_err_fp = temp1_fp - temp2_fp;
c943b4948b5848 Chandan Uddaraju 2020-08-27   833  
286a3dd6028ada Kuogee Hsieh     2023-01-23   834  		if (tu.n_err_fp < tu.err_fp) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   835  			tu.err_fp = tu.n_err_fp;
286a3dd6028ada Kuogee Hsieh     2023-01-23   836  			tu.tu_size_desired = tu.tu_size;
c943b4948b5848 Chandan Uddaraju 2020-08-27   837  		}
c943b4948b5848 Chandan Uddaraju 2020-08-27   838  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27   839  
286a3dd6028ada Kuogee Hsieh     2023-01-23   840  	tu.tu_size_minus1 = tu.tu_size_desired - 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   841  
286a3dd6028ada Kuogee Hsieh     2023-01-23   842  	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   843  	temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   844  	tu.valid_boundary_link = fixp2int_ceil(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   845  
286a3dd6028ada Kuogee Hsieh     2023-01-23   846  	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
286a3dd6028ada Kuogee Hsieh     2023-01-23   847  	temp2_fp = tu.lwidth_fp;
c943b4948b5848 Chandan Uddaraju 2020-08-27   848  	temp2_fp = drm_fixp_mul(temp2_fp, temp1_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   849  
286a3dd6028ada Kuogee Hsieh     2023-01-23   850  	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
c943b4948b5848 Chandan Uddaraju 2020-08-27   851  	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   852  	tu.n_tus = drm_fixp2int(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   853  	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
286a3dd6028ada Kuogee Hsieh     2023-01-23   854  		tu.n_tus += 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   855  
286a3dd6028ada Kuogee Hsieh     2023-01-23   856  	tu.even_distribution_legacy = tu.n_tus % tu.nlanes == 0 ? 1 : 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   857  	DRM_DEBUG("Info: n_sym = %d, num_of_tus = %d\n",
286a3dd6028ada Kuogee Hsieh     2023-01-23   858  		tu.valid_boundary_link, tu.n_tus);
202aceac8bb3ae Kuogee Hsieh     2022-02-17   859  
286a3dd6028ada Kuogee Hsieh     2023-01-23   860  	_dp_calc_extra_bytes(&tu);
c943b4948b5848 Chandan Uddaraju 2020-08-27   861  
286a3dd6028ada Kuogee Hsieh     2023-01-23   862  	tu.filler_size = tu.tu_size_desired - tu.valid_boundary_link;
c943b4948b5848 Chandan Uddaraju 2020-08-27   863  
286a3dd6028ada Kuogee Hsieh     2023-01-23   864  	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   865  	tu.ratio_by_tu_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   866  
286a3dd6028ada Kuogee Hsieh     2023-01-23   867  	tu.delay_start_link = tu.extra_pclk_cycles_in_link_clk +
286a3dd6028ada Kuogee Hsieh     2023-01-23   868  				tu.filler_size + tu.extra_buffer_margin;
c943b4948b5848 Chandan Uddaraju 2020-08-27   869  
286a3dd6028ada Kuogee Hsieh     2023-01-23   870  	tu.resulting_valid_fp =
286a3dd6028ada Kuogee Hsieh     2023-01-23   871  			drm_fixp_from_fraction(tu.valid_boundary_link, 1);
c943b4948b5848 Chandan Uddaraju 2020-08-27   872  
286a3dd6028ada Kuogee Hsieh     2023-01-23   873  	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   874  	temp2_fp = drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   875  	tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
c943b4948b5848 Chandan Uddaraju 2020-08-27   876  
286a3dd6028ada Kuogee Hsieh     2023-01-23   877  	temp1_fp = drm_fixp_from_fraction((tu.hbp_relative_to_pclk - HBLANK_MARGIN), 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   878  	tu.hbp_time_fp = drm_fixp_div(temp1_fp, tu.pclk_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   879  
286a3dd6028ada Kuogee Hsieh     2023-01-23   880  	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   881  	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   882  
286a3dd6028ada Kuogee Hsieh     2023-01-23   883  	compare_result_1 = _tu_param_compare(tu.hbp_time_fp,
286a3dd6028ada Kuogee Hsieh     2023-01-23   884  					tu.delay_start_time_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   885  	if (compare_result_1 == 2) /* hbp_time_fp < delay_start_time_fp */
286a3dd6028ada Kuogee Hsieh     2023-01-23   886  		tu.min_hblank_violated = 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   887  
286a3dd6028ada Kuogee Hsieh     2023-01-23   888  	tu.hactive_time_fp = drm_fixp_div(tu.lwidth_fp, tu.pclk_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   889  
286a3dd6028ada Kuogee Hsieh     2023-01-23   890  	compare_result_2 = _tu_param_compare(tu.hactive_time_fp,
286a3dd6028ada Kuogee Hsieh     2023-01-23   891  						tu.delay_start_time_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   892  	if (compare_result_2 == 2)
286a3dd6028ada Kuogee Hsieh     2023-01-23   893  		tu.min_hblank_violated = 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   894  
c943b4948b5848 Chandan Uddaraju 2020-08-27   895  	/* brute force */
c943b4948b5848 Chandan Uddaraju 2020-08-27   896  
286a3dd6028ada Kuogee Hsieh     2023-01-23   897  	tu.delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
286a3dd6028ada Kuogee Hsieh     2023-01-23   898  	tu.diff_abs_fp = tu.resulting_valid_fp - tu.ratio_by_tu_fp;
c943b4948b5848 Chandan Uddaraju 2020-08-27   899  
286a3dd6028ada Kuogee Hsieh     2023-01-23   900  	temp = drm_fixp2int(tu.diff_abs_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   901  	if (!temp && tu.diff_abs_fp <= 0xffff)
286a3dd6028ada Kuogee Hsieh     2023-01-23   902  		tu.diff_abs_fp = 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27   903  
c943b4948b5848 Chandan Uddaraju 2020-08-27   904  	/* if(diff_abs < 0) diff_abs *= -1 */
286a3dd6028ada Kuogee Hsieh     2023-01-23   905  	if (tu.diff_abs_fp < 0)
286a3dd6028ada Kuogee Hsieh     2023-01-23   906  		tu.diff_abs_fp = drm_fixp_mul(tu.diff_abs_fp, -1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   907  
286a3dd6028ada Kuogee Hsieh     2023-01-23   908  	tu.boundary_mod_lower_err = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   909  
286a3dd6028ada Kuogee Hsieh     2023-01-23   910  	temp1_fp = drm_fixp_div(tu.orig_lclk_fp, tu.orig_pclk_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   911  
286a3dd6028ada Kuogee Hsieh     2023-01-23   912  	temp2_fp = drm_fixp_from_fraction(tu.orig_lwidth + tu.orig_hbp, 2);
286a3dd6028ada Kuogee Hsieh     2023-01-23   913  	temp_fp = drm_fixp_mul(temp1_fp, temp2_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   914  	tu.resolution_line_time = drm_fixp2int(temp_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   915  	tu.pre_tu_hw_pipe_delay = fixp2int_ceil(temp1_fp) + 2 /*cdc fifo write jitter+2*/
286a3dd6028ada Kuogee Hsieh     2023-01-23   916  				+ 3 /*pre-delay start cycles*/
286a3dd6028ada Kuogee Hsieh     2023-01-23   917  				+ 3 /*post-delay start cycles*/ + 1 /*BE on the link*/;
286a3dd6028ada Kuogee Hsieh     2023-01-23   918  	tu.post_tu_hw_pipe_delay = 4 /*BS_on_the_link*/ + 1 /*BE_next_ren*/;
286a3dd6028ada Kuogee Hsieh     2023-01-23   919  
286a3dd6028ada Kuogee Hsieh     2023-01-23   920  	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
286a3dd6028ada Kuogee Hsieh     2023-01-23   921  	temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   922  	tu.n_symbols = fixp2int_ceil(temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   923  
286a3dd6028ada Kuogee Hsieh     2023-01-23   924  	if (tu.rb2) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   925  		temp1_fp = drm_fixp_mul(tu.delay_start_time_fp, tu.lclk_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   926  		tu.delay_start_link_lclk = fixp2int_ceil(temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   927  
286a3dd6028ada Kuogee Hsieh     2023-01-23   928  		tu.new_valid_boundary_link = tu.valid_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23   929  		tu.i_upper_boundary_count = 1;
286a3dd6028ada Kuogee Hsieh     2023-01-23   930  		tu.i_lower_boundary_count = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   931  
286a3dd6028ada Kuogee Hsieh     2023-01-23   932  		temp1 = tu.i_upper_boundary_count * tu.new_valid_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23   933  		temp1 += tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   934  		tu.average_valid2_fp = drm_fixp_from_fraction(temp1,
286a3dd6028ada Kuogee Hsieh     2023-01-23   935  				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
286a3dd6028ada Kuogee Hsieh     2023-01-23   936  
286a3dd6028ada Kuogee Hsieh     2023-01-23   937  		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
286a3dd6028ada Kuogee Hsieh     2023-01-23   938  		temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   939  		temp2_fp = drm_fixp_div(temp1_fp, tu.average_valid2_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   940  		tu.n_tus = drm_fixp2int(temp2_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23   941  
286a3dd6028ada Kuogee Hsieh     2023-01-23   942  		tu.n_tus_per_lane = tu.n_tus / tu.nlanes;
286a3dd6028ada Kuogee Hsieh     2023-01-23   943  		tu.paired_tus = (int)((tu.n_tus_per_lane) /
286a3dd6028ada Kuogee Hsieh     2023-01-23   944  				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
286a3dd6028ada Kuogee Hsieh     2023-01-23   945  
286a3dd6028ada Kuogee Hsieh     2023-01-23   946  		tu.remainder_tus = tu.n_tus_per_lane - tu.paired_tus *
286a3dd6028ada Kuogee Hsieh     2023-01-23   947  				(tu.i_upper_boundary_count + tu.i_lower_boundary_count);
286a3dd6028ada Kuogee Hsieh     2023-01-23   948  
286a3dd6028ada Kuogee Hsieh     2023-01-23   949  		if (tu.remainder_tus > tu.i_upper_boundary_count) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   950  			temp = (tu.remainder_tus - tu.i_upper_boundary_count) *
286a3dd6028ada Kuogee Hsieh     2023-01-23   951  							(tu.new_valid_boundary_link - 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   952  			temp += (tu.i_upper_boundary_count * tu.new_valid_boundary_link);
286a3dd6028ada Kuogee Hsieh     2023-01-23   953  			temp *= tu.nlanes;
286a3dd6028ada Kuogee Hsieh     2023-01-23   954  		} else {
286a3dd6028ada Kuogee Hsieh     2023-01-23   955  			temp = tu.nlanes * tu.remainder_tus * tu.new_valid_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23   956  		}
c943b4948b5848 Chandan Uddaraju 2020-08-27   957  
286a3dd6028ada Kuogee Hsieh     2023-01-23   958  		temp1 = tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23   959  		temp1 += tu.i_upper_boundary_count * tu.new_valid_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23   960  		temp1 *= tu.paired_tus * tu.nlanes;
286a3dd6028ada Kuogee Hsieh     2023-01-23   961  		temp1_fp = drm_fixp_from_fraction(tu.n_symbols - temp1 - temp, tu.nlanes);
286a3dd6028ada Kuogee Hsieh     2023-01-23   962  		tu.last_partial_lclk = fixp2int_ceil(temp1_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27   963  
286a3dd6028ada Kuogee Hsieh     2023-01-23   964  		tu.tu_active_cycles = (int)((tu.n_tus_per_lane * tu.tu_size) +
286a3dd6028ada Kuogee Hsieh     2023-01-23   965  								tu.last_partial_lclk);
c943b4948b5848 Chandan Uddaraju 2020-08-27   966  
286a3dd6028ada Kuogee Hsieh     2023-01-23   967  		temp = tu.pre_tu_hw_pipe_delay + tu.delay_start_link_lclk +
286a3dd6028ada Kuogee Hsieh     2023-01-23   968  						tu.tu_active_cycles + tu.post_tu_hw_pipe_delay;
cc9014bf63a4d8 Lee Jones        2020-11-24   969  
286a3dd6028ada Kuogee Hsieh     2023-01-23   970  		if (tu.fec_en == 1) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   971  			if (tu.nlanes == 1) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   972  				temp1_fp = drm_fixp_from_fraction(temp, 500);
286a3dd6028ada Kuogee Hsieh     2023-01-23   973  				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 12 + 1;
286a3dd6028ada Kuogee Hsieh     2023-01-23   974  			} else {
286a3dd6028ada Kuogee Hsieh     2023-01-23   975  				temp1_fp = drm_fixp_from_fraction(temp, 250);
286a3dd6028ada Kuogee Hsieh     2023-01-23   976  				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 6 + 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   977  			}
286a3dd6028ada Kuogee Hsieh     2023-01-23   978  		} else { //no fec BW impact
286a3dd6028ada Kuogee Hsieh     2023-01-23   979  			tu.parity_symbols = 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27   980  		}
286a3dd6028ada Kuogee Hsieh     2023-01-23   981  
286a3dd6028ada Kuogee Hsieh     2023-01-23   982  		tu.link_config_hactive_time = temp + tu.parity_symbols;
286a3dd6028ada Kuogee Hsieh     2023-01-23   983  
286a3dd6028ada Kuogee Hsieh     2023-01-23   984  		if (tu.link_config_hactive_time + 1 /*margin*/ >= tu.resolution_line_time)
286a3dd6028ada Kuogee Hsieh     2023-01-23   985  			tu.min_hblank_violated = 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27   986  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27   987  
286a3dd6028ada Kuogee Hsieh     2023-01-23   988  	tu.delay_start_time_fp = 0;
286a3dd6028ada Kuogee Hsieh     2023-01-23   989  
286a3dd6028ada Kuogee Hsieh     2023-01-23   990  	if ((tu.diff_abs_fp != 0 &&
286a3dd6028ada Kuogee Hsieh     2023-01-23   991  			((tu.diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
286a3dd6028ada Kuogee Hsieh     2023-01-23   992  			 (tu.even_distribution_legacy == 0) ||
286a3dd6028ada Kuogee Hsieh     2023-01-23   993  			 (DP_BRUTE_FORCE == 1))) ||
286a3dd6028ada Kuogee Hsieh     2023-01-23   994  			(tu.min_hblank_violated == 1)) {
286a3dd6028ada Kuogee Hsieh     2023-01-23   995  		_dp_calc_boundary(&tu);
286a3dd6028ada Kuogee Hsieh     2023-01-23   996  
286a3dd6028ada Kuogee Hsieh     2023-01-23   997  		if (tu.boundary_moderation_en) {
c943b4948b5848 Chandan Uddaraju 2020-08-27   998  			temp1_fp = drm_fixp_from_fraction(
286a3dd6028ada Kuogee Hsieh     2023-01-23   999  					(tu.upper_boundary_count *
286a3dd6028ada Kuogee Hsieh     2023-01-23  1000  					tu.valid_boundary_link +
286a3dd6028ada Kuogee Hsieh     2023-01-23  1001  					tu.lower_boundary_count *
286a3dd6028ada Kuogee Hsieh     2023-01-23  1002  					(tu.valid_boundary_link - 1)), 1);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1003  			temp2_fp = drm_fixp_from_fraction(
286a3dd6028ada Kuogee Hsieh     2023-01-23  1004  					(tu.upper_boundary_count +
286a3dd6028ada Kuogee Hsieh     2023-01-23  1005  					tu.lower_boundary_count), 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1006  			tu.resulting_valid_fp =
c943b4948b5848 Chandan Uddaraju 2020-08-27  1007  					drm_fixp_div(temp1_fp, temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1008  
c943b4948b5848 Chandan Uddaraju 2020-08-27  1009  			temp1_fp = drm_fixp_from_fraction(
286a3dd6028ada Kuogee Hsieh     2023-01-23  1010  					tu.tu_size_desired, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1011  			tu.ratio_by_tu_fp =
286a3dd6028ada Kuogee Hsieh     2023-01-23  1012  				drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1013  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1014  			tu.valid_lower_boundary_link =
286a3dd6028ada Kuogee Hsieh     2023-01-23  1015  				tu.valid_boundary_link - 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27  1016  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1017  			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1018  			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1019  			temp2_fp = drm_fixp_div(temp1_fp,
286a3dd6028ada Kuogee Hsieh     2023-01-23  1020  						tu.resulting_valid_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1021  			tu.n_tus = drm_fixp2int(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1022  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1023  			tu.tu_size_minus1 = tu.tu_size_desired - 1;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1024  			tu.even_distribution_BF = 1;
c943b4948b5848 Chandan Uddaraju 2020-08-27  1025  
c943b4948b5848 Chandan Uddaraju 2020-08-27  1026  			temp1_fp =
286a3dd6028ada Kuogee Hsieh     2023-01-23  1027  				drm_fixp_from_fraction(tu.tu_size_desired, 1);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1028  			temp2_fp =
286a3dd6028ada Kuogee Hsieh     2023-01-23  1029  				drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1030  			tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
c943b4948b5848 Chandan Uddaraju 2020-08-27  1031  		}
c943b4948b5848 Chandan Uddaraju 2020-08-27  1032  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  1033  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1034  	if (tu.async_en) {
286a3dd6028ada Kuogee Hsieh     2023-01-23  1035  		temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu.lwidth_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1036  		temp = fixp2int_ceil(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1037  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1038  		temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1039  		temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1040  		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1041  		temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1042  		temp1_fp = drm_fixp_from_fraction(temp, 1);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1043  		temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1044  		temp = drm_fixp2int(temp2_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1045  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1046  		tu.delay_start_link += (int)temp;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1047  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  1048  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1049  	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1050  	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
c943b4948b5848 Chandan Uddaraju 2020-08-27  1051  
c943b4948b5848 Chandan Uddaraju 2020-08-27  1052  	/* OUTPUTS */
286a3dd6028ada Kuogee Hsieh     2023-01-23  1053  	tu_table->valid_boundary_link       = tu.valid_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1054  	tu_table->delay_start_link          = tu.delay_start_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1055  	tu_table->boundary_moderation_en    = tu.boundary_moderation_en;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1056  	tu_table->valid_lower_boundary_link = tu.valid_lower_boundary_link;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1057  	tu_table->upper_boundary_count      = tu.upper_boundary_count;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1058  	tu_table->lower_boundary_count      = tu.lower_boundary_count;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1059  	tu_table->tu_size_minus1            = tu.tu_size_minus1;
286a3dd6028ada Kuogee Hsieh     2023-01-23  1060  
286a3dd6028ada Kuogee Hsieh     2023-01-23  1061  	DRM_DEBUG("TU: valid_boundary_link: %d\n", tu_table->valid_boundary_link);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1062  	DRM_DEBUG("TU: delay_start_link: %d\n", tu_table->delay_start_link);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1063  	DRM_DEBUG("TU: boundary_moderation_en: %d\n",
c943b4948b5848 Chandan Uddaraju 2020-08-27  1064  			tu_table->boundary_moderation_en);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1065  	DRM_DEBUG("TU: valid_lower_boundary_link: %d\n",
c943b4948b5848 Chandan Uddaraju 2020-08-27  1066  			tu_table->valid_lower_boundary_link);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1067  	DRM_DEBUG("TU: upper_boundary_count: %d\n",
c943b4948b5848 Chandan Uddaraju 2020-08-27  1068  			tu_table->upper_boundary_count);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1069  	DRM_DEBUG("TU: lower_boundary_count: %d\n",
c943b4948b5848 Chandan Uddaraju 2020-08-27  1070  			tu_table->lower_boundary_count);
286a3dd6028ada Kuogee Hsieh     2023-01-23  1071  	DRM_DEBUG("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
c943b4948b5848 Chandan Uddaraju 2020-08-27 @1072  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  1073  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
