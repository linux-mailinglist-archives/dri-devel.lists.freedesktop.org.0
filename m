Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9F84865E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 13:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BEC10EED9;
	Sat,  3 Feb 2024 12:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSfglw5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F010EE2D;
 Sat,  3 Feb 2024 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706964915; x=1738500915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vyJ5hhjOpFvVIqOq5lbkWG6pTutqv/soxCjv32aKKZ0=;
 b=JSfglw5uGGLKXTfEIdDuTRX3i6iSHHduq40om9K6SCiagn9nKXQTU7Rk
 b7Z7nj175+cWuF7ubvFK3P1DwukE0qz0BXnp5b45ChKxmSEF1uF6w6qHS
 k8vmD/kqCNbhq8kbIdt+lawf/LsaeFBt7MLhzbk3Ms9WjBFvrabICV34v
 k4naX1G1BtScxxVYwZsFRjsq5gmWcPjQsOKwAtAmv6SgcwrYGUIgZLjpt
 G/+G0gj0gQjosL7F6ve+Y89vM1F9Q/WhOEMxdY6/fBUHUfc5BQZ/w0xrH
 JD1z5t1C8AmGgBy+YrEjUt6k8Bg4c0EHc8rwUXDLGvKdnsKTIb/ccIzBD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="479362"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="479362"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2024 04:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932741882"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; d="scan'208";a="932741882"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2024 04:55:10 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rWFXe-00053o-0x;
 Sat, 03 Feb 2024 12:54:50 +0000
Date: Sat, 3 Feb 2024 20:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 3/5] drm/amd: Fetch the EDID from _DDC if available
 for eDP
Message-ID: <202402032030.IBEf5Cme-lkp@intel.com>
References: <20240201221119.42564-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201221119.42564-4-mario.limonciello@amd.com>
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

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.8-rc2 next-20240202]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-video-Handle-fetching-EDID-that-is-longer-than-256-bytes/20240202-061301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240201221119.42564-4-mario.limonciello%40amd.com
patch subject: [PATCH v3 3/5] drm/amd: Fetch the EDID from _DDC if available for eDP
config: i386-randconfig-004-20240203 (https://download.01.org/0day-ci/archive/20240203/202402032030.IBEf5Cme-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032030.IBEf5Cme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032030.IBEf5Cme-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'create_eml_sink':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:5: warning: 'edid' is used uninitialized in this function [-Wuninitialized]
    6599 |  if (!edid)
         |     ^


vim +/edid +6599 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6582	
  6583	static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
  6584	{
  6585		struct drm_connector *connector = &aconnector->base;
  6586		struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(&aconnector->base);
  6587		struct dc_sink_init_data init_params = {
  6588				.link = aconnector->dc_link,
  6589				.sink_signal = SIGNAL_TYPE_VIRTUAL
  6590		};
  6591		struct edid *edid;
  6592	
  6593		/*
  6594		 * Note: drm_get_edid gets edid in the following order:
  6595		 * 1) override EDID if set via edid_override debugfs,
  6596		 * 2) firmware EDID if set via edid_firmware module parameter
  6597		 * 3) regular DDC read.
  6598		 */
> 6599		if (!edid)
  6600			edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
  6601	
  6602		if (!edid) {
  6603			DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
  6604			return;
  6605		}
  6606	
  6607		if (drm_detect_hdmi_monitor(edid))
  6608			init_params.sink_signal = SIGNAL_TYPE_HDMI_TYPE_A;
  6609	
  6610		aconnector->edid = edid;
  6611	
  6612		aconnector->dc_em_sink = dc_link_add_remote_sink(
  6613			aconnector->dc_link,
  6614			(uint8_t *)edid,
  6615			(edid->extensions + 1) * EDID_LENGTH,
  6616			&init_params);
  6617	
  6618		if (aconnector->base.force == DRM_FORCE_ON) {
  6619			aconnector->dc_sink = aconnector->dc_link->local_sink ?
  6620			aconnector->dc_link->local_sink :
  6621			aconnector->dc_em_sink;
  6622			dc_sink_retain(aconnector->dc_sink);
  6623		}
  6624	}
  6625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
