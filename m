Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7183BC08A96
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 05:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B26810E244;
	Sat, 25 Oct 2025 03:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XjXn0nkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6D10E244
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Oct 2025 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761364668; x=1792900668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zdY7TECA95G1snEXpjR0jev+kdjPGHGKfzCPjDCGUTM=;
 b=XjXn0nkGX4RrrYzOwfV74NTsinGmtlUjhk6o2tbl57BVp7Vxaf2HzwuL
 8gjI4IgWNA97Wkx+3hBX29L1WBHtMi5J2Ku8AgFZxIrw1SjyCoEKYJomn
 GTzsMOBjguI+/5f6tXQlqG41O6NPFMmHVICkRztE2wbpJUHcKEeQMzBLp
 k1uwKlyS4DECnkRloFu7YIqnXEDFFptyiKO+dKPk6B0pbQ4WE6lwyuc3O
 C3QI3rn54rJXS7Lx2SiihphZ/jlAh+PCjJ4fPJaDd3PwZ5WflSLQgCRx6
 c9gJQriHWG6lK9oIB83bVMCLoREZFg2NtFivz4Vhwg+gCScP8+b3Uk0Oi w==;
X-CSE-ConnectionGUID: 9rDV9CaTSyS7wvui6V52Vw==
X-CSE-MsgGUID: eM5Qf00XQfiJLJivZz6W7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51116163"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="51116163"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 20:57:48 -0700
X-CSE-ConnectionGUID: zeiL05zFRYOibm3bN9b6TA==
X-CSE-MsgGUID: GJg2D4PwS8W3UGjX1XeAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="184489554"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2025 20:57:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vCVPT-000F6f-2R;
 Sat, 25 Oct 2025 03:57:43 +0000
Date: Sat, 25 Oct 2025 11:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 5/6] drm/sitronix/st7571: split up the driver into a
 common and an i2c part
Message-ID: <202510251116.5wpReHRY-lkp@intel.com>
References: <20251024-st7571-split-v1-5-d3092b98130f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-st7571-split-v1-5-d3092b98130f@gmail.com>
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

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-5-d3092b98130f%40gmail.com
patch subject: [PATCH 5/6] drm/sitronix/st7571: split up the driver into a common and an i2c part
config: x86_64-randconfig-005-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251116.5wpReHRY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251116.5wpReHRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251116.5wpReHRY-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module st7571-i2c uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
>> WARNING: modpost: module st7571-i2c uses symbol st7571_config from namespace DRM_ST7571, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
