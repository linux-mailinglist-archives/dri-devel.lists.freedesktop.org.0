Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A879097C6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 12:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6610E042;
	Sat, 15 Jun 2024 10:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N44//1DG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDC910E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718448931; x=1749984931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6sc6UeLkrXtEOeC/FTzXDCN8LG7dWL3ulYP0wIu6vZ0=;
 b=N44//1DGGogywSDez2KhksG+hJBbCjIpg8lFKjgzBBocpDXxi6221esz
 lZ6X6/rg28usyjonj68ADTl4N7iTpNGlYpv3DYQ+fkDnc1nIKnmnbruy3
 j20kDhy6P54uFSGxnWN1ZwTk/NeCWomjQ0DLGmWqDEwmEadtcgUmxKSdM
 wwMaLEIxhaO+GutaNish1fTqkw4qMDBhjqNm3t84AfO8BHiHModhGdKM8
 QVuG7nFyOwLqGHZN04QpIT85Cm0QBA8fL2eOzSl/s81zOS1GiTJ0QmFSo
 oqXPEKb3dbN+G3ypXG6JlHSWwPP+jOexHzPQkyAmdVWm76lQ1H29M7NT7 g==;
X-CSE-ConnectionGUID: 6A7jGLUzTX2otJuYYVeCqA==
X-CSE-MsgGUID: o4KwcMKAT327fyhMuuf2/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19124937"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="19124937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2024 03:55:27 -0700
X-CSE-ConnectionGUID: EAYn0QGgQDefQP3fhan7aw==
X-CSE-MsgGUID: vPQ339AjSkif/0HvYowWyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; d="scan'208";a="78234068"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 03:55:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIR45-00006C-2k;
 Sat, 15 Jun 2024 10:55:21 +0000
Date: Sat, 15 Jun 2024 18:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
Message-ID: <202406151811.yEIZ6203-lkp@intel.com>
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
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

Hi Geert,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-032053
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp@intel.com/

All errors (new ones prefixed by >>):

>> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
   depmod: ERROR: Found 2 modules in dependency cycles!
   make[3]: *** [scripts/Makefile.modinst:128: depmod] Error 1 shuffle=844234264
   make[3]: Target '__modinst' not remade because of errors.
   make[2]: *** [Makefile:1842: modules_install] Error 2 shuffle=844234264
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=844234264
   make[1]: Target 'modules_install' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=844234264
   make: Target 'modules_install' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
