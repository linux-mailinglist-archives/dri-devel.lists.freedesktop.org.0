Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F2497C33F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 06:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD44110E13E;
	Thu, 19 Sep 2024 04:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFA+K4mU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061F10E095;
 Thu, 19 Sep 2024 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726718712; x=1758254712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wTHnD7Gvi9qJW3/ug+em7TPU7wZwVhLkr75aYfMV7Rk=;
 b=GFA+K4mUju5BuqRY/aAQLYrJs8D2KOZWaYf8LyrOyZtdmLZYzTo014Ol
 kaelAlwSCVCIbW+3alb3D8EmFOUHjRefMdZUPUU43fWG9p0+MRRNUBBCJ
 xho+N6/iL5FRTxjQd1mXo1/aHGl5EZXuc5ekZ4l0/xN8Oi2Oq77a3EdBN
 O8u1S0VJ42GXgavtsurvrZ+/s/Wpx58bDmYrGcSTt2XM8X91ni+GHDhKh
 X06/YwsVO4NYCf1WmcC5aKcSLLGkn7dlYbb51Wh7iGVAPg4zKbZKBDOHI
 4REU5wkaYGc6/qZsKGAqa0jbjUP/KAfHQgRfAcWs98ISp0PjOEz5CVpGG w==;
X-CSE-ConnectionGUID: 9ZmQkEDtSceXtT1bQb11cQ==
X-CSE-MsgGUID: tlnQr11qRB2oJ5jUBrFK0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36244160"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="36244160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:05:12 -0700
X-CSE-ConnectionGUID: 5uXZqJYzTTmTcNytw/lJug==
X-CSE-MsgGUID: pUI1d4+OTH6lOJ+7aFuhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69401890"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2024 21:05:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sr8Pi-000CsG-24;
 Thu, 19 Sep 2024 04:05:06 +0000
Date: Thu, 19 Sep 2024 12:05:06 +0800
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
Message-ID: <202409191128.4bvJysve-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on amd-pstate/linux-next]
[also build test ERROR on amd-pstate/bleeding-edge linus/master v6.11]
[cannot apply to next-20240918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-amd-display-switch-amdgpu_dm_connector-to-use-struct-drm_edid/20240912-093827
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20240911213537.2338164-11-superm1%40kernel.org
patch subject: [PATCH v6 10/10] drm/amd/display: Fetch the EDID from _DDC if available for eDP
config: arm64-randconfig-003-20240918 (https://download.01.org/0day-ci/archive/20240919/202409191128.4bvJysve-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409191128.4bvJysve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409191128.4bvJysve-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c: In function 'dm_helpers_probe_acpi_edid':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:883:28: error: unused variable 'ddev' [-Werror=unused-variable]
     883 |         struct drm_device *ddev = connector->dev;
         |                            ^~~~
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]


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
