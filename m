Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215FD3A17D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B62410E395;
	Mon, 19 Jan 2026 08:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEz1UfHR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7215B10E102;
 Mon, 19 Jan 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768811062; x=1800347062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FdJqB24QzJiFq06iM4nVmUAnIN7Ftjoc9PN19SL7PVA=;
 b=OEz1UfHRlQhZBHN1zOBYxx2cPgujVAeCyT5lx5Cg5jJKOJJAL0pw4baY
 vVJaRPDtXyXGN47OT412jt8mRSsAsTg9yy2lL4FVV+2HEBlfj/++MHtsy
 R4kZWrihxvf+FWZxRHhW+ePxOt2wyFIi6YC1nZ0KASL9CL832soyZt0bQ
 H1FCQwzb+4IAmMsZv1Zcoo0qPdeoeXgRzG1T7jOGFC11jcMghM9dTnXM0
 1RAt74v+boCXVN4bSX3GeMQsfxWKCVlbq0Yfd1TgVNt/wMOlTQxRT16Pr
 HqYOK71vWWqZmbZWb9xFdNhASNBzDW2j8/j8e0oLNffdj0SBumFN0yvRj w==;
X-CSE-ConnectionGUID: ovdFrRbDT2e11K83WL4Ceg==
X-CSE-MsgGUID: LGUVse8kTO6fHOHinix4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81130928"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="81130928"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 00:24:22 -0800
X-CSE-ConnectionGUID: ahAP74soS2WwLGqHg1c9RQ==
X-CSE-MsgGUID: sA33wVKrTFSXxkR+xu0xiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205601779"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 19 Jan 2026 00:24:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vhkYZ-00000000Nav-453O;
 Mon, 19 Jan 2026 08:24:15 +0000
Date: Mon, 19 Jan 2026 16:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com
Cc: oe-kbuild-all@lists.linux.dev, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: Re: [PATCH 02/17] drm/amd/display: Refactor
 amdgpu_dm_update_freesync_caps()
Message-ID: <202601191507.cZ9ZcocL-lkp@intel.com>
References: <20260119011146.62302-3-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119011146.62302-3-tomasz.pakula.oficjalny@gmail.com>
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

Hi Tomasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260116]
[also build test WARNING on linus/master v6.19-rc6]
[cannot apply to drm-misc/drm-misc-next v6.19-rc5 v6.19-rc4 v6.19-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Paku-a/drm-amd-display-Return-if-DisplayID-not-found-in-parse_amd_vsdb/20260119-091453
base:   next-20260116
patch link:    https://lore.kernel.org/r/20260119011146.62302-3-tomasz.pakula.oficjalny%40gmail.com
patch subject: [PATCH 02/17] drm/amd/display: Refactor amdgpu_dm_update_freesync_caps()
config: i386-buildonly-randconfig-001-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191507.cZ9ZcocL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191507.cZ9ZcocL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191507.cZ9ZcocL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:13200 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Returns true if (max_vfreq - min_vfreq) > 10
   Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:13217 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Returns true if connector is capable of freesync

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [m]:
   - AMD_XGBE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=y] || PCI [=y]) && HAS_IOMEM [=y] && (X86 [=y] || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
