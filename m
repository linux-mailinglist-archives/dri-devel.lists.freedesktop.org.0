Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0F2E82CC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jan 2021 03:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3889E26;
	Fri,  1 Jan 2021 02:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E289E26;
 Fri,  1 Jan 2021 02:30:55 +0000 (UTC)
IronPort-SDR: J+BkqDeEjfSS1LCkOn+Y+tLVlqmd5yG2xmeLsw7Q7JAYToxOE/zu0dzzpPiTd4GG463WZpvBWc
 yXieQ30Fxa3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9851"; a="176853049"
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="176853049"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 18:30:54 -0800
IronPort-SDR: 0ttWh63mT3/KfwFyB0rU8Vh925P2Akuj0Q2a0DDnoHcPfx3qnOBdGwiyHCLMnFnD1/mwJiTaOd
 93XHmfHRULUg==
X-IronPort-AV: E=Sophos;i="5.78,464,1599548400"; d="scan'208";a="348522055"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.117])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2020 18:30:52 -0800
Date: Fri, 1 Jan 2021 10:30:05 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [drm-intel:topic/dp-hdmi-2.1-pcon 9/15]
 drivers/gpu/drm/i915/display/intel_dp.c:4053:10: warning: Suspicious
 condition (assignment + comparison); Clarify expression with parentheses.
Message-ID: <20210101023005.GD399595@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm-intel topic/dp-hdmi-2.1-pcon
head:   522508b665df3bbfdf40381d4e61777844b1703f
commit: ced42f2df5fd8621c896faeafe7ecc0ea8b2ea81 [9/15] drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <rong.a.chen@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/intel_dp.c:4053:10: warning: Suspicious condition (assignment + comparison); Clarify expression with parentheses. [clarifyCondition]
    wait_for(is_active = drm_dp_pcon_is_frl_ready(&intel_dp->aux) == true, TIMEOUT_FRL_READY_MS);
            ^
   drivers/gpu/drm/i915/display/intel_dp.c:4072:10: warning: Suspicious condition (assignment + comparison); Clarify expression with parentheses. [clarifyCondition]
    wait_for(is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux) == true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
            ^

vim +4053 drivers/gpu/drm/i915/display/intel_dp.c

ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4028  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4029  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4030  	int max_frl_bw, max_pcon_frl_bw, max_edid_frl_bw, ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4031  	u8 max_frl_bw_mask = 0, frl_trained_mask;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4032  	bool is_active;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4033  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4034  	ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4035  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4036  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4037  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4038  	max_pcon_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4039  	drm_dbg(&i915->drm, "PCON max rate = %d Gbps\n", max_pcon_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4040  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4041  	max_edid_frl_bw = intel_dp_hdmi_sink_max_frl(intel_dp);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4042  	drm_dbg(&i915->drm, "Sink max rate from EDID = %d Gbps\n", max_edid_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4043  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4044  	max_frl_bw = min(max_edid_frl_bw, max_pcon_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4045  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4046  	if (max_frl_bw <= 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4047  		return -EINVAL;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4048  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4049  	ret = drm_dp_pcon_frl_prepare(&intel_dp->aux, false);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4050  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4051  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4052  	/* Wait for PCON to be FRL Ready */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18 @4053  	wait_for(is_active = drm_dp_pcon_is_frl_ready(&intel_dp->aux) == true, TIMEOUT_FRL_READY_MS);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4054  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4055  	if (!is_active)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4056  		return -ETIMEDOUT;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4057  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4058  	max_frl_bw_mask = intel_dp_pcon_set_frl_mask(max_frl_bw);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4059  	ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw, PCON_SEQUENTIAL_MODE);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4060  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4061  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4062  	ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask, PCON_NORMAL_TRAIN_MODE);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4063  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4064  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4065  	ret = drm_dp_pcon_frl_enable(&intel_dp->aux);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4066  	if (ret < 0)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4067  		return ret;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4068  	/*
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4069  	 * Wait for FRL to be completed
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4070  	 * Check if the HDMI Link is up and active.
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4071  	 */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4072  	wait_for(is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux) == true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4073  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4074  	if (!is_active)
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4075  		return -ETIMEDOUT;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4076  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4077  	/* Verify HDMI Link configuration shows FRL Mode */
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4078  	if (drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, &frl_trained_mask) !=
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4079  	    DP_PCON_HDMI_MODE_FRL) {
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4080  		drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL Mode\n");
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4081  		return -EINVAL;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4082  	}
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4083  	drm_dbg(&i915->drm, "MAX_FRL_MASK = %u, FRL_TRAINED_MASK = %u\n", max_frl_bw_mask, frl_trained_mask);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4084  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4085  	intel_dp->frl.trained_rate_gbps = intel_dp_pcon_get_frl_mask(frl_trained_mask);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4086  	intel_dp->frl.is_trained = true;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4087  	drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n", intel_dp->frl.trained_rate_gbps);
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4088  
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4089  	return 0;
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4090  }
ced42f2df5fd8621 Ankit Nautiyal 2020-12-18  4091  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
