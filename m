Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A1A7C753
	for <lists+dri-devel@lfdr.de>; Sat,  5 Apr 2025 04:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9149D10E35C;
	Sat,  5 Apr 2025 02:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVyaifjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAA110E35C
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743818555; x=1775354555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=giulut+PrxF/O0P30CwxI5j9ksQr3ldBC5eDinXEP3c=;
 b=NVyaifjAKpJZkQaeP+LjfMcxMJl3YmZz2xpCd69XtnrKeHxiucP9EE9k
 UFXI1e9IP1O96l0SGegn/mTtYEhglIB1fteeBZ0jolVsfury6TC+kDppr
 AhvMlxkIF740rNE4gjKqlxA4+r6u+3Mv6ogpGCxrE1bjqBgs9zaXHcvTW
 1hpuessl6k4q+uIXPZSVWRPsfwQEB09LsleA96mCKKAPyRwPRNGNz4vYt
 Dzk8g47dbmnc9wmTdHazjrXW+Qg7L1Uj6UyqzTWMLeGCZHHtYGXG4uprl
 1ta8hhwBzfpDsscikCSPMycDKhC11W7AuBuK0WEXdG8QTLCXdoKc9OkGG A==;
X-CSE-ConnectionGUID: vCQLqzrhQ4G+THeGR4u14A==
X-CSE-MsgGUID: 1vQQ2N2CTlONnhA85HF1/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49064530"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="49064530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 19:02:33 -0700
X-CSE-ConnectionGUID: phdwfIJuQnmfaBYBelhYdw==
X-CSE-MsgGUID: RtJF8pFtRCWo8Pibg7DFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; d="scan'208";a="127954061"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2025 19:02:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u0srZ-0001jY-2G;
 Sat, 05 Apr 2025 02:02:25 +0000
Date: Sat, 5 Apr 2025 10:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation
 in place of devm_kzalloc()
Message-ID: <202504050913.gq6yJY4f-lkp@intel.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e@redhat.com>
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

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on de04bb0089a96cc00d13b12cbf66a088befe3057]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/panel-orisetech-otm8009a-Use-refcounted-allocation-in-place-of-devm_kzalloc/20250404-052751
base:   de04bb0089a96cc00d13b12cbf66a088befe3057
patch link:    https://lore.kernel.org/r/20250403-b4-drm_panel_mass_driver_convert_part3-v1-41-965b15ad5b8e%40redhat.com
patch subject: [PATCH 41/46] panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
config: x86_64-buildonly-randconfig-004-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050913.gq6yJY4f-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050913.gq6yJY4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050913.gq6yJY4f-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-widechips-ws2401.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
