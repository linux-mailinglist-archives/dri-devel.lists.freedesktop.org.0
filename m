Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC68C908C
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 13:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DAB10E1AA;
	Sat, 18 May 2024 11:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3YxrpQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116EF10E1AA
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 11:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716030661; x=1747566661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=40mRhQwl4ZDwZhzvOgGimjyfxJzi04d95tIq3H/adOQ=;
 b=I3YxrpQ0Z4Iy6/8jTDsULf1QkkJuyH/0EgEMAhPzOIvO/Q+MV5zTPI1+
 dynWWL/tLpBWgqRvdB7Sp03AiuIgweqCbYtai/H95qXsjbd3qHciFdpZo
 m2j+lTfaRXCXXuP79vy4BMorTi+E4g7jg7+iR1VQOqepSAIXSaq/buGhA
 NkrJIYGpFhXlIGAq6jUOfgWYj+lXijuYlPpz6kxHsNrz7uwUhZIz3HsMj
 UPYuCSxCBPipUrjcfvzXItnmku4FKfnJq8XdIuFIn+tGcWs51nG7C9afd
 aY+0P5EW2RHplAcIPvjGnv/UDbATGwiaP8PiInrJAXnxxFj0/8Zllc90r A==;
X-CSE-ConnectionGUID: oF7lv3wXQQytRbABbHDodA==
X-CSE-MsgGUID: R0mE5wSBRFaec2W37fp3zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23353423"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; d="scan'208";a="23353423"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2024 04:11:01 -0700
X-CSE-ConnectionGUID: Ea2wK3hkTs6Wjxta3b8qnA==
X-CSE-MsgGUID: N5gRCf5VRKO7qQgnuoctfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; d="scan'208";a="55274792"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 04:10:59 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s8Hxo-00027u-2y;
 Sat, 18 May 2024 11:10:56 +0000
Date: Sat, 18 May 2024 19:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 1/4] drm/vmwgfx: Filter modes which exceed graphics
 memory
Message-ID: <202405181844.pA39DlHd-lkp@intel.com>
References: <20240517184811.25807-2-ian.forbes@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517184811.25807-2-ian.forbes@broadcom.com>
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

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Forbes/drm-vmwgfx-Filter-modes-which-exceed-graphics-memory/20240518-024955
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240517184811.25807-2-ian.forbes%40broadcom.com
patch subject: [PATCH v2 1/4] drm/vmwgfx: Filter modes which exceed graphics memory
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181844.pA39DlHd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181844.pA39DlHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181844.pA39DlHd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:47: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * llvmpipe will align the width and height of its buffers to match its


vim +47 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

    38	
    39	#define vmw_crtc_to_stdu(x) \
    40		container_of(x, struct vmw_screen_target_display_unit, base.crtc)
    41	#define vmw_encoder_to_stdu(x) \
    42		container_of(x, struct vmw_screen_target_display_unit, base.encoder)
    43	#define vmw_connector_to_stdu(x) \
    44		container_of(x, struct vmw_screen_target_display_unit, base.connector)
    45	
    46	/**
  > 47	 * llvmpipe will align the width and height of its buffers to match its
    48	 * tile size. We need to keep this in mind when exposing modes to userspace
    49	 * so that this possible over-allocation will not exceed graphics memory.
    50	 */
    51	#define LLVM_PIPE_TILE_SIZE 64
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
