Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C863B10FD2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88A10E3F6;
	Thu, 24 Jul 2025 16:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfbWfc6b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B510E3F6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753375309; x=1784911309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GJ7oPGiI/+5Cg12azq2uSL0OHujgc0U//kiVeas2jMI=;
 b=nfbWfc6b+HnfmK7/vAo0iFfBvcRGvkxJajwK9mK65YpnFTzTmcpv60dX
 35GRWW+nSFb+dfDLRguwbPptrsqc0zCRZGGWBLmaGNDYplcarLonKUjoM
 P7h2eV6B0JO2koc1reaBOYIKg6QPc9CTSMzuEQcefxMetapUwsWfp48NF
 5Vs/+D6Df7mI+LTfyWgGL75fcAGwOJw7KT1OvXtt1E3qqM5rt+jMmj4jO
 blJ7cB8E6MmvnW7jxRbH+pAKDt9C5xlVnNn8bXSnF8RYZF7k9wpbzZQ0i
 WtqtWTgx2wY48W/tLGpWI1WKangdCD6UQ0dBQoybCrvkAEZpdaMdmtmX+ A==;
X-CSE-ConnectionGUID: jkoXrr6WRK+Yk7csTDfDeA==
X-CSE-MsgGUID: 2h9TTNjwTcqVIMTXHHmYyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58322796"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="58322796"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:41:49 -0700
X-CSE-ConnectionGUID: kbR/YZUgRpGnkRP9NRGpww==
X-CSE-MsgGUID: 7yCD/4uhRS+IRX2C8Brupg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164860147"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 24 Jul 2025 09:41:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uez0o-000Kdd-0x;
 Thu, 24 Jul 2025 16:41:42 +0000
Date: Fri, 25 Jul 2025 00:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Henrik Grimler <henrik@grimler.se>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maciej Purski <m.purski@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
Subject: Re: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <202507250036.RXWSmKW2-lkp@intel.com>
References: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
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

Hi Henrik,

kernel test robot noticed the following build errors:

[auto build test ERROR on ca2a6abdaee43808034cdb218428d2ed85fd3db8]

url:    https://github.com/intel-lab-lkp/linux/commits/Henrik-Grimler/drm-bridge-sii9234-fix-some-typos-in-comments-and-messages/20250721-174814
base:   ca2a6abdaee43808034cdb218428d2ed85fd3db8
patch link:    https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677%40grimler.se
patch subject: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection logic to detect MHL
config: arm64-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250036.RXWSmKW2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250036.RXWSmKW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250036.RXWSmKW2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: extcon_register_notifier
   >>> referenced by sii9234.c:928 (drivers/gpu/drm/bridge/sii9234.c:928)
   >>>               drivers/gpu/drm/bridge/sii9234.o:(sii9234_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: extcon_unregister_notifier
   >>> referenced by sii9234.c:1009 (drivers/gpu/drm/bridge/sii9234.c:1009)
   >>>               drivers/gpu/drm/bridge/sii9234.o:(sii9234_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
