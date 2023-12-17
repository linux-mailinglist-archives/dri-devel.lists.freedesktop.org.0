Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A014C8179F7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334AC10E3A0;
	Mon, 18 Dec 2023 18:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005910E29D;
 Mon, 18 Dec 2023 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702924991; x=1734460991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2vkJ9UdkhUfc3Fyby+XZ9UErCG79JcAlyG3GkbzZWro=;
 b=X+T4s/otdF4gIwAHv5Sh4kqWtXJuUKFCSnCAbxfU5i6terInGZWc35o/
 bj43FtwX8yDoNt6CP2E2QWI1+DxPuxSVMIApAXvgOD0YiMeJ+QGOawVlR
 M2QUcsnSCgYOxmu/PywhBe/iP8IwreaJOT4Xk2xYkkVx7A19+JztxPlqr
 CyxD407dVKfHP29qcfMWDPnH+yR8RZuOTjDS2J6NpQIcOpYC1O8Cdpeg/
 q/oFxVkc4IFqaK5HdxmNh+rY/HwOSoCh29Ry6Oy7Raknj2Wn0sglSlQLs
 nx3xg9GlcUy+o667A17tv+vBPLp2jDjYLDVZ0rA8XbiC4d8gvOyMOqTFe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="16984800"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="16984800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 11:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1106708317"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="1106708317"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 17 Dec 2023 11:13:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rEwa6-0003M2-0y;
 Sun, 17 Dec 2023 19:13:42 +0000
Date: Mon, 18 Dec 2023 03:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
Message-ID: <202312180258.cty6XurG-lkp@intel.com>
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 felix.kuehling@amd.com, matthew.auld@intel.com, oe-kbuild-all@lists.linux.dev,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arunpravin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-tip/drm-tip linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arunpravin-Paneer-Selvam/drm-amdgpu-Enable-clear-page-functionality/20231214-214811
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231214134240.3183-1-Arunpravin.PaneerSelvam%40amd.com
patch subject: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
config: arc-randconfig-001-20231215 (https://download.01.org/0day-ci/archive/20231218/202312180258.cty6XurG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312180258.cty6XurG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312180258.cty6XurG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/gpu/drm/drm_buddy.c:337: warning: Function parameter or struct member 'flags' not described in 'drm_buddy_free_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
