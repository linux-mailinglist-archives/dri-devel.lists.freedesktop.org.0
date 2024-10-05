Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648699148D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 07:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7CF10E02C;
	Sat,  5 Oct 2024 05:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaWbPoFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C0010E02C;
 Sat,  5 Oct 2024 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728106318; x=1759642318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MSJQcu09NhgVlBg6t+sthjOcXlDsuEHCViJDn1NkpFA=;
 b=iaWbPoFByO6KCnfx4OVE8nzkcV5MDJeHeWLTSDGOBYeLflfCL6wj8/7I
 BnB3FmO+p1sil8VbVrUZTvJxhZHYe/AiyzTf8yalEOfTf3hAFr4jCeczQ
 rIelpVjtC+nVnsFUMa/Yfjl+Oi4cXeh0Xm9nWy6TDLziRUGXQivlHW+eA
 RuBOJT8qXpVptcLUgO94cRuiA27sU7CdXcPKDgbZdvIrINg1k39t2WHZ4
 eHUbvjC+6Lm6baeDfmdPFL219cHutuMHwsGqJ5nqOyzlRNRNK5kh5isNk
 sJ38f4CPmrecR7dcjrHQ/516bJpFrvweWK3A53EMoTBp8DL1eI11DqPgo A==;
X-CSE-ConnectionGUID: 1ZCmx3y1Sk+rMaY4DJ9xNQ==
X-CSE-MsgGUID: y1SdfJxXQY2rdhJFPbQLQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27275067"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="27275067"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 22:31:58 -0700
X-CSE-ConnectionGUID: xFugop3XQFKr3U/7Rp/YLA==
X-CSE-MsgGUID: fKI2lYG+S1+H+ngLXHe8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; d="scan'208";a="79486525"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2024 22:31:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swxOU-0002bS-0u;
 Sat, 05 Oct 2024 05:31:54 +0000
Date: Sat, 5 Oct 2024 13:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB
 LUTs
Message-ID: <202410051303.Vy1EjQPJ-lkp@intel.com>
References: <20241003200129.1732122-16-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-16-harry.wentland@amd.com>
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

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20241004-040629
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241003200129.1732122-16-harry.wentland%40amd.com
patch subject: [PATCH v6 15/44] drm/vkms: Add kunit tests for linear and sRGB LUTs
config: x86_64-randconfig-101-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051303.Vy1EjQPJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051303.Vy1EjQPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051303.Vy1EjQPJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/vkms/tests/vkms_color_test.o
>> ERROR: modpost: "srgb_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "srgb_inv_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!
>> ERROR: modpost: "linear_eotf" [drivers/gpu/drm/vkms/tests/vkms_color_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
