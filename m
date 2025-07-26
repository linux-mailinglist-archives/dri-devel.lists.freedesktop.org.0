Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD4B129E6
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 11:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E24410E484;
	Sat, 26 Jul 2025 09:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M52CqRVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9910E470
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753522524; x=1785058524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KQ3txyy3YUW77dQq7TyYbTrF1SrO05+NIgynyFTKF+E=;
 b=M52CqRVw6Pf+zjPqz1ya6C3M2erlg3xNV9K0JxKzwWbfTfD/d025KnNf
 iE51/Hf3rTWGaC1xf/zT0CtFBaElwJddwCySNSbJvBMejAhgvdhCtzUN6
 i4IqTSsR3iIpoMcvDjijxpjsNuattcrD4G5wR4hr9xVWompCDQuPmwLNm
 /Y/5T4Y0VXTLApoWXbXPS0lRm4U0IVlxJYJRlsTASK0w0NDIpQaJMHh2n
 g2zaB92L3kfxbicyJWcIKM3hTgSz1izlozKmBPe/lZzRW4COJQ0NaXrVT
 zH5DWT+fK1Y4qjXy0Og1Vn34DyevNvzTYCRrCB0TQgZ2LAV88R5+tMWEy w==;
X-CSE-ConnectionGUID: MIsduqodS6KgZo9fMqWUjA==
X-CSE-MsgGUID: 11XrEWn2TdCUWV/i7vrw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="59644501"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59644501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 02:35:23 -0700
X-CSE-ConnectionGUID: Pt9d/288Saqm6crfNeloDQ==
X-CSE-MsgGUID: ViYr2/H5SwSCtIEMBAV7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161836535"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 26 Jul 2025 02:35:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufbJF-000LqR-2D;
 Sat, 26 Jul 2025 09:35:17 +0000
Date: Sat, 26 Jul 2025 17:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v5 4/7] drm/panthor: Introduce sampling sessions to
 handle userspace clients
Message-ID: <202507261719.EKOvj9uv-lkp@intel.com>
References: <1a56b67cf8849bc3a6140d2163a0206d03bb9a60.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a56b67cf8849bc3a6140d2163a0206d03bb9a60.1753449448.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e48123c607a0db8b9ad02f83c8c3d39918dbda06]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20250725-230250
base:   e48123c607a0db8b9ad02f83c8c3d39918dbda06
patch link:    https://lore.kernel.org/r/1a56b67cf8849bc3a6140d2163a0206d03bb9a60.1753449448.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v5 4/7] drm/panthor: Introduce sampling sessions to handle userspace clients
config: x86_64-buildonly-randconfig-005-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261719.EKOvj9uv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261719.EKOvj9uv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261719.EKOvj9uv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/panthor/panthor_perf.c:420 function parameter 'file' not described in 'panthor_perf_session_setup'
>> Warning: drivers/gpu/drm/panthor/panthor_perf.c:420 Excess function parameter 'ptdev' description in 'panthor_perf_session_setup'
>> Warning: drivers/gpu/drm/panthor/panthor_perf.c:420 Excess function parameter 'pfile' description in 'panthor_perf_session_setup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
