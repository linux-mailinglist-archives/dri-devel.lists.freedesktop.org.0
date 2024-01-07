Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263428265D0
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jan 2024 20:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49BD10E0DF;
	Sun,  7 Jan 2024 19:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC65510E0DC;
 Sun,  7 Jan 2024 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704656512; x=1736192512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k6T1t+jqUOcqGHUG5Fk3o3bHj/5BhPk54YIbKawj9AU=;
 b=kNuLpt97vD/3gy+m7vFpI4Y9ILAyS/F1XGa6WVAnruCM4MxzJ6JTVNYQ
 Bz1B1muyOswjFZgAggE8AlSAzntBOdD79FiFb+tVCon/HqWyRY029FolP
 VO9JpdEwk7un9SVpIn3lt+NB6RWbqmuln1rxtViadkjQpLybE/nvAFORC
 s6Oc8BM6M5o8CJkxSz+dgSk3cDElFU3S0VchtmwtI21Nb95x1TUwgf8ZJ
 zvdnFQGvMHxZy+gZhdtIUlqQbr7VJtiIYk6+GRl2/eUuPYDnCaws4gsdI
 KfUH2zbwXouyA+E5/4+Z6rBh0Vvo9G5wYeR/DNLpLzrm4gVPs34sPMhJk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="483934141"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; d="scan'208";a="483934141"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 11:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="900170415"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; d="scan'208";a="900170415"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2024 11:41:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rMZ1m-00044Y-1g;
 Sun, 07 Jan 2024 19:41:46 +0000
Date: Mon, 8 Jan 2024 03:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>, alexander.deucher@amd.com
Subject: Re: [PATCH 1/1] Refactor radeon driver to use
 drm_gem_create_map_offset() instead of its custom implementation for
 associating GEM object with a fake offset. Since, we already have a generic
 implementation, we don't need the custom function and it is better to
 standardize the code.
Message-ID: <202401080333.6PSOtuIK-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dipam Turkar <dipamt1729@gmail.com>,
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401080333.6PSOtuIK-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080333.6PSOtuIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080333.6PSOtuIK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_gem.c:34:10: fatal error: 'drm/dem_gem.h' file not found
      34 | #include <drm/dem_gem.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.


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
