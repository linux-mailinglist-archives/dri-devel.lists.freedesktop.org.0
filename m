Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A6A588A9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 22:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E710E0A5;
	Sun,  9 Mar 2025 21:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4SZu6jd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1810E06A;
 Sun,  9 Mar 2025 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741557330; x=1773093330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XV4TFGJPOwdEuo+Uu6vVn9rLCbiRTLhhS72SB0Cnyxo=;
 b=C4SZu6jdPS5NRnpt8LsE7pK1Dy6x83hSAfD6WBfw2OpYIa7PHjw9l+e9
 Zn6cUFMONT0bsZcj7QDfXDiyelK8Z2V00R3JlQgJps4CWJOaEtaY+gE13
 Kr+5oOpKneSnbpS5EtCzWKcW9wIqS4IRhPf/UAXd8KTt/Xn0+a1rJRK9e
 9F56+eg4510yRViHkxkTT89t5SRSpkGxgq0setekkYkk+xKV6mlBGtJGP
 TRhg2neBDGJseJc/UmNKjVVGHVMWJjmvhDwdJQQrDR8aeJSE6gdLDWewA
 KaJHyT/heXdr3j2GL/50w4bYNLC/OcPHAtAbBFZgMC0T96MpgZcp4dfbS w==;
X-CSE-ConnectionGUID: GYVbc2zzTVK1F308FYnBwQ==
X-CSE-MsgGUID: pZFYX0+kSliIOPbYcq81sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42657020"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42657020"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 14:55:30 -0700
X-CSE-ConnectionGUID: KmuazXWsTQuQ/12EcYE7Ug==
X-CSE-MsgGUID: dX7NmjAVR0eX9IkEFZMktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119668697"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2025 14:55:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1trOcD-0003VI-2o;
 Sun, 09 Mar 2025 21:55:21 +0000
Date: Mon, 10 Mar 2025 05:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm: bridge: dw-hdmi: use new helper to get ACR values
Message-ID: <202503100501.SlwYOb9U-lkp@intel.com>
References: <20250309-drm-hdmi-acr-v1-4-bb9c242f4d4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309-drm-hdmi-acr-v1-4-bb9c242f4d4b@linaro.org>
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

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-hdmi-provide-central-data-authority-for-ACR-params/20250309-161610
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250309-drm-hdmi-acr-v1-4-bb9c242f4d4b%40linaro.org
patch subject: [PATCH 4/4] drm: bridge: dw-hdmi: use new helper to get ACR values
config: arm64-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503100501.SlwYOb9U-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100501.SlwYOb9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100501.SlwYOb9U-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_hdmi_acr_get_n_cts" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
