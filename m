Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45C979A62
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 06:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2020A10E074;
	Mon, 16 Sep 2024 04:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMfmKDI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108A10E074;
 Mon, 16 Sep 2024 04:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726461056; x=1757997056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kGKwQsa5LY7zTU/w6kahcoUb6uO4yOJn+ssgNH3DOqA=;
 b=UMfmKDI914ApbDK/JCzCRofoZUaI1v4S8sedP0j+FpRr3XANWciEXda/
 dDOeBpo8LkEIM60diLmvQX2uYDEY4dV7QQDZhi22ETCLVTlDs6Vm3aX1p
 Pw/TnYqoc66djaUfoFUlOOPmO2kv6A8MT1MAFM2vu3TH/EFQWeLN1wSci
 cMJcoMyqgBy+SXbUk2EK98ES2ZQOLRmw9CySfqn8Z/umZr3u5MBEAgIdW
 TpLnaEBIVXVde9qJDF38OgJD4FmZX1e1U3FrJhOaM9Uhan9OpsUKIx5xL
 Ky24qWJjdLNOxv/khb1TVtb7XQbnFe8ym1d1CZgoM5rED7nrSc7P4qrWf Q==;
X-CSE-ConnectionGUID: 5uuDaU+0RPCzgpCYmntH3Q==
X-CSE-MsgGUID: OH2/uQgLRL+QAXSneuQc7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25408619"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="25408619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2024 21:30:54 -0700
X-CSE-ConnectionGUID: HX9MfthFQUe7lhJiZsCfPg==
X-CSE-MsgGUID: xhk4qz6rTWiCFPYmrYmGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="68860743"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2024 21:30:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sq3Nx-0009O0-1N;
 Mon, 16 Sep 2024 04:30:49 +0000
Date: Mon, 16 Sep 2024 12:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v6 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
Message-ID: <202409161225.xuQVKkoR-lkp@intel.com>
References: <20240911213537.2338164-11-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911213537.2338164-11-superm1@kernel.org>
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

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v6.11]
[cannot apply to next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-amd-display-switch-amdgpu_dm_connector-to-use-struct-drm_edid/20240912-093827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20240911213537.2338164-11-superm1%40kernel.org
patch subject: [PATCH v6 10/10] drm/amd/display: Fetch the EDID from _DDC if available for eDP
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240916/202409161225.xuQVKkoR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161225.xuQVKkoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161225.xuQVKkoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c: In function 'dm_helpers_probe_acpi_edid':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:883:28: warning: unused variable 'ddev' [-Wunused-variable]
     883 |         struct drm_device *ddev = connector->dev;
         |                            ^~~~


vim +/ddev +883 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

   878	
   879	static int
   880	dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
   881	{
   882		struct drm_connector *connector = data;
 > 883		struct drm_device *ddev = connector->dev;
   884		struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
   885		unsigned char start = block * EDID_LENGTH;
   886		void *edid;
   887		int r;
   888	
   889		if (!acpidev)
   890			return -ENODEV;
   891	
   892		/* fetch the entire edid from BIOS */
   893		r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
   894		if (r < 0) {
   895			DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
   896			return r;
   897		}
   898		if (len > r || start > r || start + len > r) {
   899			r = -EINVAL;
   900			goto cleanup;
   901		}
   902	
   903		memcpy(buf, edid + start, len);
   904		r = 0;
   905	
   906	cleanup:
   907		kfree(edid);
   908	
   909		return r;
   910	}
   911	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
