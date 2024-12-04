Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201019E3A4B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 13:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2CF10E07F;
	Wed,  4 Dec 2024 12:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJ/YsQVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EA710E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733316570; x=1764852570;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6RdyS6rQi6HSm5hdOEW2RdWv0FYXX5MAP73uG4z69M8=;
 b=cJ/YsQVVyFILMyyhBiVW+rukp4zWBdkCFmX0ZvmueFRHD6Ng7I/BBxhd
 l+0ZAU2I1kWYJsmQhiJLQu79Nl9RmeEclhobiHbFHAZErpKg6wMubNFEC
 +JzEEgA8xPSoqLbDjO9MlNCmssiua6u5FkGOp+jmE2yk3yMU6vPjZR9Pm
 qZtkWOvCtZxq83YxHEZKz64eOw5WrLFoRS9KgpR2ztWfxRDf2u+9dCIrh
 V/8f1KuKbfKlzqK3Rq9kHYzEQCM3SYnzGvuM/OaeYNkSpmyytpXrNLyHd
 C31auVhNT/JWxZ2u/rjbdglDPLZ98DBKTkQboiAfzk4+Dr5K2DmulyoTu A==;
X-CSE-ConnectionGUID: A5veRpE4RMeZuNNWA2wI/w==
X-CSE-MsgGUID: b0BHcb9dSAGeO/ecKWwgeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44244726"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44244726"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 04:49:30 -0800
X-CSE-ConnectionGUID: rmifMeztTJu8VWydzNTOuA==
X-CSE-MsgGUID: 0d0rjvzHS06nxW5aiZeqpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94213756"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2024 04:49:25 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tIooJ-00031v-1D;
 Wed, 04 Dec 2024 12:49:07 +0000
Date: Wed, 4 Dec 2024 20:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolaus Voss <nv@vosn.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 miquel.raynal@bootlin.com, nikolaus.voss@haag-streit.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
Message-ID: <202412042024.4mJmO3sM-lkp@intel.com>
References: <20241203191111.47B56F7@mail.steuer-voss.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203191111.47B56F7@mail.steuer-voss.de>
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

Hi Nikolaus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikolaus-Voss/drm-bridge-fsl-ldb-fixup-mode-on-freq-mismatch/20241204-115306
base:   linus/master
patch link:    https://lore.kernel.org/r/20241203191111.47B56F7%40mail.steuer-voss.de
patch subject: [PATCH v2] drm: bridge: fsl-ldb: fixup mode on freq mismatch
config: arm-randconfig-003-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042024.4mJmO3sM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042024.4mJmO3sM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042024.4mJmO3sM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/fsl-ldb.c:125:30: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                   struct drm_bridge_state *,
                                                            ^
   drivers/gpu/drm/bridge/fsl-ldb.c:127:33: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                   struct drm_connector_state *)
                                                               ^
   2 warnings generated.


vim +125 drivers/gpu/drm/bridge/fsl-ldb.c

   123	
   124	static int fsl_ldb_atomic_check(struct drm_bridge *bridge,
 > 125					struct drm_bridge_state *,
   126					struct drm_crtc_state *crtc_state,
   127					struct drm_connector_state *)
   128	{
   129		struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
   130		const struct drm_display_mode *mode = &crtc_state->mode;
   131		unsigned long requested_link_freq =
   132			fsl_ldb_link_frequency(fsl_ldb, mode->clock);
   133		unsigned long freq = clk_round_rate(fsl_ldb->clk, requested_link_freq);
   134	
   135		if (freq != requested_link_freq) {
   136			/*
   137			 * this will lead to flicker and incomplete lines on
   138			 * the attached display, adjust the CRTC clock
   139			 * accordingly.
   140			 */
   141			struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
   142			int pclk = freq / fsl_ldb_link_frequency(fsl_ldb, 1);
   143	
   144			if (adjusted_mode->clock != pclk) {
   145				dev_warn(fsl_ldb->dev, "Adjusted pixel clk to match LDB clk (%d kHz -> %d kHz)!\n",
   146					 adjusted_mode->clock, pclk);
   147	
   148				adjusted_mode->clock = pclk;
   149				adjusted_mode->crtc_clock = pclk;
   150			}
   151		}
   152	
   153		return 0;
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
