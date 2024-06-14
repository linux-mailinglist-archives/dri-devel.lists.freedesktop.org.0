Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF969084D5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085C410EC6A;
	Fri, 14 Jun 2024 07:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0+NBMFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D296110EC73;
 Fri, 14 Jun 2024 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718350127; x=1749886127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0BWvOiSEx29uPnXKNvRZm08d4PO/OZEmvPGS6vF3An8=;
 b=n0+NBMFJbhZmgmezdCHtVOpOVv/DTjNOVb+I0JTbS9b1G0APB8KIhEOP
 3Jbv6P86KpOegtF6eHefNtCfreZQLQWSG+joAsdu9pyfN8/tr4TP9wYCj
 6nBBTlsxy/yIhW7Wy38Sf5UE/n1yuXubVR/+wlyG4dYN6a4NmDElD5ctf
 YbD2zHBWqc8+0G6/MeMG8rKo6F7JdsFSRH2FOukVYz2GSB9vqL2zSCD9w
 av9kt7GbNhpNwMxS31u0bEOczw5FCMYYqd2Cz9s0ZzJit5UDMi8TBwdox
 gKqY4BICeFfACBGQTXNcLz1KMDj/NOLzQcIaggWM6erxTbmnpvPM1OUXU w==;
X-CSE-ConnectionGUID: S9xhI2GRS/O8sl+qmCSaLQ==
X-CSE-MsgGUID: s6NADn8nTEGzEHVjOFaR3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15452536"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15452536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 00:28:46 -0700
X-CSE-ConnectionGUID: LGuqLpu+T2eERVzKhty47Q==
X-CSE-MsgGUID: VWKNX+soR5mvpXkuGIXnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="71618472"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2024 00:28:43 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sI1MX-0000yV-0E;
 Fri, 14 Jun 2024 07:28:41 +0000
Date: Fri, 14 Jun 2024 15:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: Re: [PATCH v3] drm/fb-helper: Detect when lid is closed during
 initialization
Message-ID: <202406141545.9xBa6XY4-lkp@intel.com>
References: <20240613051700.1112-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613051700.1112-1-mario.limonciello@amd.com>
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

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-fb-helper-Detect-when-lid-is-closed-during-initialization/20240613-132009
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240613051700.1112-1-mario.limonciello%40amd.com
patch subject: [PATCH v3] drm/fb-helper: Detect when lid is closed during initialization
config: sparc-randconfig-001-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141545.9xBa6XY4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141545.9xBa6XY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141545.9xBa6XY4-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_lid_disconnect':
>> drm_fb_helper.c:(.text+0x76c): undefined reference to `input_close_device'
>> sparc64-linux-ld: drm_fb_helper.c:(.text+0x774): undefined reference to `input_unregister_handle'
   sparc64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_lid_connect':
>> drm_fb_helper.c:(.text+0xed8): undefined reference to `input_register_handle'
>> sparc64-linux-ld: drm_fb_helper.c:(.text+0xf24): undefined reference to `input_open_device'
   sparc64-linux-ld: drm_fb_helper.c:(.text+0xf9c): undefined reference to `input_unregister_handle'
   sparc64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
>> drm_fb_helper.c:(.text+0x1d2c): undefined reference to `input_register_handler'
   sparc64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_fini':
>> drm_fb_helper.c:(.text+0x2ce4): undefined reference to `input_unregister_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
