Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD1826566
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jan 2024 18:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439D10E0CE;
	Sun,  7 Jan 2024 17:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B94910E0CE;
 Sun,  7 Jan 2024 17:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704650198; x=1736186198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ugHrpFBnKf/CLc1I/2bD5evFi4fe42YoHYlgKnnI6E=;
 b=Okdu1KCbyeb9aLLYWZfFgKdo2p90HMa1hKbtmirJFlmas1JDltYovaz7
 l96rOW0/SiUmr10XfEvEAt4RZwMovemcD0o0IbDyERXLC6NEY8gDrM4RQ
 4BD/MantR676iorz6L1nu1LY9GyZNTcgdWvac+09OIK9ZXGxOlZyxAXST
 Bpc/YZyNEgx6H4xtJmfHj7vCqbgjOcsHXeZ67fHYMAXg3yW7r3O7SIZ5v
 y9kTDULTZdXeoswsq5IVCBi7qPP1sf4it0bZxB3PkBq+AHwcMKX8WlDUa
 ljCqYh7Nddnji3jM/yAlQFMjAY8AJ7REVIqjFpBqqAXH8PKweh65QXbLN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="397467899"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; d="scan'208";a="397467899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 09:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; d="scan'208";a="22951534"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 07 Jan 2024 09:56:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rMXNw-000408-0N;
 Sun, 07 Jan 2024 17:56:32 +0000
Date: Mon, 8 Jan 2024 01:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>, alexander.deucher@amd.com
Subject: Re: [PATCH 1/1] Refactor radeon driver to use
 drm_gem_create_map_offset() instead of its custom implementation for
 associating GEM object with a fake offset. Since, we already have a generic
 implementation, we don't need the custom function and it is better to
 standardize the code.
Message-ID: <202401080151.JsIVh6p0-lkp@intel.com>
References: <20240106141422.10734-1-dipamt1729@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106141422.10734-1-dipamt1729@gmail.com>
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dipam,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dipam-Turkar/Refactor-radeon-driver-to-use-drm_gem_create_map_offset-instead-of-its-custom-implementation-for-associating-GEM-object-/20240106-221755
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240106141422.10734-1-dipamt1729%40gmail.com
patch subject: [PATCH 1/1] Refactor radeon driver to use drm_gem_create_map_offset() instead of its custom implementation for associating GEM object with a fake offset. Since, we already have a generic implementation, we don't need the custom function and it is better to standardize the code.
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401080151.JsIVh6p0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080151.JsIVh6p0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080151.JsIVh6p0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_gem.c:34:10: fatal error: drm/dem_gem.h: No such file or directory
      34 | #include <drm/dem_gem.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +34 drivers/gpu/drm/radeon/radeon_gem.c

    31	
    32	#include <drm/drm_device.h>
    33	#include <drm/drm_file.h>
  > 34	#include <drm/dem_gem.h>
    35	#include <drm/drm_gem_ttm_helper.h>
    36	#include <drm/radeon_drm.h>
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
