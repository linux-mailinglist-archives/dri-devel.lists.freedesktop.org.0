Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30792BA5F3A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 14:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF7410E14F;
	Sat, 27 Sep 2025 12:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqOj/vhM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A8310E14F;
 Sat, 27 Sep 2025 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758977326; x=1790513326;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0W45DesrwvOL7dwAbK4Wk7k7PmMheNSI1z8Zd+4XNIw=;
 b=gqOj/vhMaq2Bpp8r2n75owTTNezZp9WAsc+xIGYA2S4SdGveR/XomhJh
 tmWqSNYxgHWgTNGFPKWKS/RaLnrpp370wl6p9oV2rd5mAEVzKh/Gs/28d
 LJgAq2GSo9Qwz2jxzOhnAE7pM1pT3IF3blNtoFlA5E2j85XnUNje6HXXs
 Z/wJHnl7IzDolr/oegQyuy/RyoR53ZBL4pgrW/LbQNc4cqFK9EGNS3qHw
 wFg4zVa6OtgNKd6ab6cpJ3bIbkHLV5msXOz9iY5d9+3AlFfXHccs3ODtP
 8OyJ8g+boIy3bzxI6WSl4ZMpeseo7+OJBlqcHi4w9MIyBno2RGaN+7NVj A==;
X-CSE-ConnectionGUID: aLQPeY7fSliDV36Zm3wyxw==
X-CSE-MsgGUID: e0JNFeMZRW+XVvpTNoC8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="86734728"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="86734728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 05:48:45 -0700
X-CSE-ConnectionGUID: EtxiiekZTFm3ZEexcFIrlg==
X-CSE-MsgGUID: PAlpPQWsRdGdV4Lp7P0oNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208";a="208568713"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 27 Sep 2025 05:48:38 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v2ULr-00073X-2Y;
 Sat, 27 Sep 2025 12:48:35 +0000
Date: Sat, 27 Sep 2025 20:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported
 InfoFrame types
Message-ID: <202509272013.GAc17rsa-lkp@intel.com>
References: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
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

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on bf2602a3cb2381fb1a04bf1c39a290518d2538d1]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-state-helpers-warn-on-unsupported-InfoFrame-types/20250927-090630
base:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
patch link:    https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-1-697511bd050b%40oss.qualcomm.com
patch subject: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
config: x86_64-buildonly-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272013.GAc17rsa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272013.GAc17rsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272013.GAc17rsa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdmi_state_helper.c:924:17: error: use of undeclared identifier 'it'
     924 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                               ^
>> drivers/gpu/drm/display/drm_hdmi_state_helper.c:924:63: error: use of undeclared identifier 'frame'
     924 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                                                                             ^
   drivers/gpu/drm/display/drm_hdmi_state_helper.c:953:17: error: use of undeclared identifier 'it'
     953 |                 dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
         |                               ^
   3 errors generated.


vim +/it +924 drivers/gpu/drm/display/drm_hdmi_state_helper.c

   916	
   917	static int clear_infoframe(struct drm_connector *connector,
   918				   struct drm_connector_hdmi_infoframe *old_frame)
   919	{
   920		int ret;
   921	
   922		ret = clear_device_infoframe(connector, old_frame->data.any.type);
   923		if (ret == -EOPNOTSUPP)
 > 924			dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
   925		if (ret)
   926			return ret;
   927	
   928		return 0;
   929	}
   930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
