Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730AAC69409
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C44E10E48C;
	Tue, 18 Nov 2025 12:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdlwuK/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F61810E096;
 Tue, 18 Nov 2025 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763467591; x=1795003591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+DBrnd0XnZ/3Kg4ybg+n7skOvNHN+05c3Za6EBwWRJ4=;
 b=mdlwuK/FXO/k6I/QMpZfmxjw6bSzOX2rpco0NLQ3+J0Twr02FfJYNjrF
 POVN6cZ0EIRFuszqSgUyvgUnLReYmG4p9rFreJWAMT7KPnfzKal1q6zwz
 TgFmxFeoLv4RktRvD2bVOZcARAfY/2X5VRYLRsgc8pfSLgTvbeXfn4iIT
 HvgOchuCTafy49xKq1KI5NmmmSygOsSNZzb6YBEawu6SLgdIPhu2XB7Oi
 v0FWthzCAPRp7iX65xVbkf82bzV5c+SI/KRzMgsClUW1nZkgfHKubK8Xa
 wDgM+3AJnw05ryq06zhNOA0jrzvQwE7bwSF0RI/8Z5Mjcu1M7AmkFtLRs Q==;
X-CSE-ConnectionGUID: nrMCcJS0Sgm+JNTPX2gsdg==
X-CSE-MsgGUID: fEq3LmpMTN2JbZZUQJvtLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="88137036"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="88137036"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:06:30 -0800
X-CSE-ConnectionGUID: L4c+hRHQRGGzK2KKCLDfyA==
X-CSE-MsgGUID: NrQ8Oj1vTh6ywIF05IjymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195655072"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2025 04:06:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vLKTV-0001hf-11;
 Tue, 18 Nov 2025 12:06:21 +0000
Date: Tue, 18 Nov 2025 20:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 02/10] drm: Add new general DRM property "color format"
Message-ID: <202511181958.eS8Ctiow-lkp@intel.com>
References: <20251117-color-format-v4-2-0ded72bd1b00@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-color-format-v4-2-0ded72bd1b00@collabora.com>
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

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d1d18879e01e4c9efcb85a96d188a8e4326136dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/drm-amd-display-Remove-unnecessary-SIGNAL_TYPE_HDMI_TYPE_A-check/20251118-031440
base:   d1d18879e01e4c9efcb85a96d188a8e4326136dd
patch link:    https://lore.kernel.org/r/20251117-color-format-v4-2-0ded72bd1b00%40collabora.com
patch subject: [PATCH v4 02/10] drm: Add new general DRM property "color format"
config: arm-randconfig-001-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181958.eS8Ctiow-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181958.eS8Ctiow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511181958.eS8Ctiow-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_connector.c:1392 function parameter 'color_fmt' not described in 'drm_get_color_format_name'
>> Warning: drivers/gpu/drm/drm_connector.c:1392 function parameter 'color_fmt' not described in 'drm_get_color_format_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
