Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD5A56665
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 12:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB4E10E10D;
	Fri,  7 Mar 2025 11:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXHspWmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E1A10E10D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741346160; x=1772882160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wX3Vymz4l/O54rkneO1+uXiJSTDlFRpOfGqjpyqnGHM=;
 b=QXHspWmOBlxOTL4eJI2TPsuayMktBzRO+i4SFqtG/rQFudRW7KgqdsMD
 DG71+bIL4w2M4kAELK6+NyJ9gQf6Qgtn50Jy4r+4BucY2zO68JfeW1orw
 cp3fYA9exWMAedVClSCE9IwiAXRAeiMTCPg60a0hKyMmcboRiBbjmqXJe
 rnmI2U5kFxkSITRooy3eiMxVKlyFSrAymXPyz8hgAYVZSiv3xm1+/Di2W
 pnuU8iH0Ny3d2HvfuiXzEuN7WlwmBuC39R3JoShu+upPWZQB0FcfmeA5H
 voK7vWblo2ampT/n3Z5sU1b1Mk3yEhZaBXB5/SUMDr6M4cwFeuiyb/Jhp w==;
X-CSE-ConnectionGUID: TyuewTQuQg+kvlUZl2h4Mw==
X-CSE-MsgGUID: iaLo2w/RTsWUqyhjp8rFhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41560189"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="41560189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 03:15:59 -0800
X-CSE-ConnectionGUID: OnTP3sMcQ/CFi8nptCb35g==
X-CSE-MsgGUID: yITXQzeOS+eDl/3dkBI/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="123890543"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2025 03:15:58 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqVgJ-0000Mb-2a;
 Fri, 07 Mar 2025 11:15:55 +0000
Date: Fri, 7 Mar 2025 19:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: Refactor cursor handling
Message-ID: <202503071951.dBYmEILU-lkp@intel.com>
References: <20250306041222.2776379-2-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306041222.2776379-2-zack.rusin@broadcom.com>
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

Hi Zack,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Refactor-cursor-handling/20250306-121451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250306041222.2776379-2-zack.rusin%40broadcom.com
patch subject: [PATCH v2 1/2] drm/vmwgfx: Refactor cursor handling
config: arm64-randconfig-003-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071951.dBYmEILU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071951.dBYmEILU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071951.dBYmEILU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c:19:10: fatal error: asm/page_types.h: No such file or directory
      19 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +19 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c

    15	
    16	#include "drm/drm_atomic.h"
    17	#include "drm/drm_atomic_helper.h"
    18	#include "drm/drm_plane.h"
  > 19	#include <asm/page_types.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
