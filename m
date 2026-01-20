Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AED3C3F4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7986610E1C3;
	Tue, 20 Jan 2026 09:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvRJECaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D71910E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768902298; x=1800438298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v0RFn+aeplivZPtgfIIgbIKvsTCAKIJUwHe87L3xUAM=;
 b=cvRJECaFex4naWCKyeulbbk1cQt1cPhBcsn1XtZD0R7bCMq5Og+/lml2
 kOcYeqig4h9ZQyw9whDKYUWOXg5jpifEIdKk4L1Di1sqpW5HkzHP2MY3T
 vYuAf2ulsIx0KJM7P3hhcFPSrhK3EkXFem3F8f7AtsBgl/FvUWpH1tfVp
 +WIaRyAh0qBfh0lzOm1bITTBqK3fKJLLSZkXxUfDQxt62EuOZsqkjl5N3
 8d1GNxWJ+kcDH70RFeCt6drL/j1Vq28fAo4tCSv1lkkEZ6S5QdLjS69wK
 jDPOUFkhbTm0EJi4RQJxQp6FQawIog3mR/akZuFoYm2C2J170jwv6qbWd A==;
X-CSE-ConnectionGUID: XvOnXFxVTL6b1XQCbBmNUQ==
X-CSE-MsgGUID: V7Y5NUKHTFqw8AztwaPUzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87520470"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="87520470"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:44:56 -0800
X-CSE-ConnectionGUID: DOicduV7RkGhYus6tJZeyQ==
X-CSE-MsgGUID: PPAMHC8wS4is1E1AZy5DPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="236763006"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 01:44:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vi8I5-00000000Omf-17jm;
 Tue, 20 Jan 2026 09:44:49 +0000
Date: Tue, 20 Jan 2026 17:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v3 04/15] drm/bridge: Switch private_obj initialization
 to atomic_create_state
Message-ID: <202601201722.632RZYWZ-lkp@intel.com>
References: <20260119-drm-private-obj-reset-v3-4-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-drm-private-obj-reset-v3-4-b931abe3a5e3@redhat.com>
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

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on b36178488d479e9a53bbef2b01280378b5586e60]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-atomic-Make-drm_atomic_private_obj_init-fallible/20260119-205337
base:   b36178488d479e9a53bbef2b01280378b5586e60
patch link:    https://lore.kernel.org/r/20260119-drm-private-obj-reset-v3-4-b931abe3a5e3%40redhat.com
patch subject: [PATCH v3 04/15] drm/bridge: Switch private_obj initialization to atomic_create_state
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260120/202601201722.632RZYWZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201722.632RZYWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201722.632RZYWZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:132: depmod] Error 1
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1960: modules_install] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
