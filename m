Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D270B7EA6AB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 00:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102DF10E234;
	Mon, 13 Nov 2023 23:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DBA10E22F;
 Mon, 13 Nov 2023 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699916751; x=1731452751;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JLJpPP5b421FtLhZQiLRXD5PJTk/L/mHzvuUUiCdMsY=;
 b=Ur4bQwRYANrUnHH1A4q5NcSUNPCmwA3yZ3kXPhrGgYRb4pJiE4/6lH15
 Ete26vZL3OWM9rD3tEChy9CPF3LBo3MIWiBDpPD4fayzLq/R6I59QxSuS
 6g1tkYiQVis7F40ymAxUAaEtrItFoVY8aG/ZoSY761Qi3Tnx51irUm3Tb
 chNlMVLBZNklxk3KoTexYGAp7b6sXUxeplQ0a//P1i5QnmpgQO2FF1HQX
 qylOQTWfdgPF8RYIl1PfAxh2g1nnO9gmg2jTB/htjtPCHTLB9itJ6aRzJ
 XpArD4Ad2FWpVoAM3D2yvK//jpHf2XmhFKBNRB2WdtFGCewsqIUL+9/Zb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454821553"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="454821553"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 15:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="757961503"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="757961503"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 13 Nov 2023 15:05:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r2fzv-000Cas-1K;
 Mon, 13 Nov 2023 23:05:39 +0000
Date: Tue, 14 Nov 2023 07:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/dp_mst: Fix PBN divider calculation for UHBR rates
Message-ID: <202311140621.sw31vG8M-lkp@intel.com>
References: <20231113201110.510724-4-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113201110.510724-4-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Imre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp-Fix-UHBR-link-M-N-values/20231114-043135
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231113201110.510724-4-imre.deak%40intel.com
patch subject: [PATCH 4/4] drm/dp_mst: Fix PBN divider calculation for UHBR rates
config: i386-randconfig-002-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140621.sw31vG8M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140621.sw31vG8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140621.sw31vG8M-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `drm_dp_get_vc_payload_bw':
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:3598: undefined reference to `__udivdi3'


vim +3598 drivers/gpu/drm/display/drm_dp_mst_topology.c

  3570	
  3571	/**
  3572	 * drm_dp_get_vc_payload_bw - get the VC payload BW for an MST link
  3573	 * @mgr: The &drm_dp_mst_topology_mgr to use
  3574	 * @link_rate: link rate in 10kbits/s units
  3575	 * @link_lane_count: lane count
  3576	 *
  3577	 * Calculate the total bandwidth of a MultiStream Transport link. The returned
  3578	 * value is in units of PBNs/(timeslots/1 MTP). This value can be used to
  3579	 * convert the number of PBNs required for a given stream to the number of
  3580	 * timeslots this stream requires in each MTP.
  3581	 */
  3582	int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
  3583				     int link_rate, int link_lane_count)
  3584	{
  3585		int ret;
  3586	
  3587		if (link_rate == 0 || link_lane_count == 0)
  3588			drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
  3589				    link_rate, link_lane_count);
  3590	
  3591		/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
  3592		/*
  3593		 * TODO: Return the value with a higher precision, allowing a better
  3594		 * slots per MTP allocation granularity. With the current returned
  3595		 * value +1 slot/MTP can get allocated on UHBR links.
  3596		 */
  3597		ret = mul_u32_u32(link_rate * link_lane_count,
> 3598				  drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate))) /
  3599		      (1000000ULL * 8 * 5400);
  3600	
  3601		return ret;
  3602	}
  3603	EXPORT_SYMBOL(drm_dp_get_vc_payload_bw);
  3604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
