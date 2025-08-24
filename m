Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B9B32F70
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 13:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78CA10E214;
	Sun, 24 Aug 2025 11:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL2E4MEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3410E078;
 Sun, 24 Aug 2025 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756035013; x=1787571013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6G5mPAtsFaXXL0ExPX41cT4TX9upffLJYDpuVfS9Gmc=;
 b=FL2E4MEFAPDcu/PrqyGwODpx99BBUlS7+uxB48lVWgP3CBm8xVA6C27h
 Wbcbauh91jLOJYC2ZS+xNeBUoA8aACRCQa9oV5pFaN77c71uc28cZNKyz
 QaMpcPR6eGHxm+Cz3R1eKkVfcA9nqOxYpXs8QovKrhrX0QXpPZp4eMS1A
 05uZV0CYKcj45GeNYnSk/8H+R3K0MOoqMyYP09JWGXKZwxu71q/skIg8/
 Do7eEIlTualhnVlHxjNR6isVXv5WVwM3HeyV53mFRtKu369fjw+8JPyV3
 9VNKqJgEErzNHSTjqJQFr9yaBUs+sV7QFkHv8K8DvdG8GdbN0EapsU96A w==;
X-CSE-ConnectionGUID: J8rYmtEzSEuYKsJjyvsACA==
X-CSE-MsgGUID: pVbTLw3yQYOCJDzvVX0rIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75724094"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75724094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 04:30:13 -0700
X-CSE-ConnectionGUID: qwh2lp8ZQci4E0oyDQb0JA==
X-CSE-MsgGUID: SduyHKJuRhmvP2iETSthtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="192736209"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2025 04:30:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uq8ur-000Mxr-05;
 Sun, 24 Aug 2025 11:29:53 +0000
Date: Sun, 24 Aug 2025 19:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Peyton Lee <peytolee@amd.com>, Lang Yu <lang.yu@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v1 2/2] drm/amd/display: Adjust AUX brightness to be a
 granularity of 100
Message-ID: <202508241901.DJ851kiv-lkp@intel.com>
References: <20250824085351.454619-2-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824085351.454619-2-lkml@antheas.dev>
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

Hi Antheas,

kernel test robot noticed the following build errors:

[auto build test ERROR on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/drm-amd-display-Adjust-AUX-brightness-to-be-a-granularity-of-100/20250824-165633
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250824085351.454619-2-lkml%40antheas.dev
patch subject: [PATCH v1 2/2] drm/amd/display: Adjust AUX brightness to be a granularity of 100
config: i386-buildonly-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241901.DJ851kiv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241901.DJ851kiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241901.DJ851kiv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.o: in function `amdgpu_dm_backlight_set_level':
>> amdgpu_dm.c:(.text+0x8b89): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
