Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88419A70E21
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 01:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40C10E002;
	Wed, 26 Mar 2025 00:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOOPphk3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9610E002
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 00:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742948343; x=1774484343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DIa5JrphLzDLlq69xQ2Orirc4rhT7kxJMGAQJFzZ9FA=;
 b=BOOPphk3IeMk5mSMWA5KLeqW7kiH+QgPHMDyJE9+fgm239ukSSB38teT
 pBd2Wb4u2XOV0JgLIKY296e3xO5Ur6BugcOxoa0Wu61xJO/zOJzK5q3wg
 BgmNPfP1/V5Dy70DFTBZFPRvTXD6ULKq0YShlNLXYnnHcvb42dgP81k0p
 RD3QdU+C3u/y/0BE5fU+TthQf/3uHxmK+fmU6t3eE9Mhd1UzaKVWjp6Xb
 ToQkStZfEFYrTAQSagtZoBK+vhpEcdvkQSSD+ra8BDocl7ZxJYdlcrpio
 tMZCLYPpgApuAU5DA/3kWQrfilApFH+2g96/l5BLco+bqSCeM85Ng2fX0 g==;
X-CSE-ConnectionGUID: Sl9FPQmgRwqi0o8u+GrZ9g==
X-CSE-MsgGUID: lR14TCnfTyqy6lz2vTC2AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43946407"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="43946407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 17:19:03 -0700
X-CSE-ConnectionGUID: KmClavU2Sl+wLvV8+URyzw==
X-CSE-MsgGUID: W+aDdoV1SJKzO+z7ytAZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="147719246"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2025 17:18:59 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1txETq-0005KN-3D;
 Wed, 26 Mar 2025 00:18:52 +0000
Date: Wed, 26 Mar 2025 08:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 3/5] drm/panel: get/put panel reference in
 drm_panel_add/remove()
Message-ID: <202503260710.gDo7vXVR-lkp@intel.com>
References: <20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d@redhat.com>
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

[auto build test ERROR on c8ba07caaecc622a9922cda49f24790821af8a71]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-panel-Add-new-helpers-for-refcounted-panel-allocatons/20250326-012651
base:   c8ba07caaecc622a9922cda49f24790821af8a71
patch link:    https://lore.kernel.org/r/20250325-b4-panel-refcounting-v1-3-4e2bf5d19c5d%40redhat.com
patch subject: [PATCH 3/5] drm/panel: get/put panel reference in drm_panel_add/remove()
config: xtensa-randconfig-001-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260710.gDo7vXVR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260710.gDo7vXVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260710.gDo7vXVR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/xtensa/platforms/iss/simdisk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "drm_panel_put" [drivers/gpu/drm/drm.ko] undefined!
>> ERROR: modpost: "drm_panel_get" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
