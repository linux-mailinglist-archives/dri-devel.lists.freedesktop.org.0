Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878F67F8F6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 16:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BB610E1E1;
	Sat, 28 Jan 2023 15:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859E810E1E1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jan 2023 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674918580; x=1706454580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sz/oOMsdjPZPIOSXT9noSLRbwktYPl9DzEblX23lJmw=;
 b=ekGIOb0lXWrbzIM7Or07vch+6FgMOzVz2hFtY9zJmz+6Qy5chP7Emk3l
 UyU+JI0/4B7WsjcW5ajR9f+lW0jeqO24630eizkaZPGEq1B8mxIzRAHRc
 //o/me7aUTeFzIpUIpVDTZfHkuc7nrpL3mN9JUzECFyRj1C7Vomv2afzf
 BFxttu6/I6egmeLeRIaKoJ+KOkrSto7PPo5gDMcLF9Omt34gGShCE+ORE
 Ifvv4jC/YzsQ3+jJciCgXaMUuv3JAAPqoQyFdpa1rbSl+GVdTRy/7o7S+
 98igEm6IxZtd3WqqjUq9vTQ/dCHkdmPLuvZe/6pT+YffHAhVwGZfLE0bz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="315252662"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="315252662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 07:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="727004058"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="727004058"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2023 07:09:37 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pLmpk-0000pR-21;
 Sat, 28 Jan 2023 15:09:36 +0000
Date: Sat, 28 Jan 2023 23:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/vmwgfx: Abstract placement selection
Message-ID: <202301282318.DOogLmvQ-lkp@intel.com>
References: <20230126173813.602748-7-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126173813.602748-7-zack@kde.org>
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
Cc: krastevm@vmware.com, llvm@lists.linux.dev, mombasawalam@vmware.com,
 banackm@vmware.com, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on linus/master v6.2-rc5]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Use-the-common-gem-mmap-instead-of-the-custom-code/20230128-112136
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230126173813.602748-7-zack%40kde.org
patch subject: [PATCH 6/7] drm/vmwgfx: Abstract placement selection
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230128/202301282318.DOogLmvQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9083af8be713dc1052ca4bd2b39579979345e47b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-Use-the-common-gem-mmap-instead-of-the-custom-code/20230128-112136
        git checkout 9083af8be713dc1052ca4bd2b39579979345e47b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/ drivers/gpu/drm/vmwgfx/ kernel/entry/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:509:29: warning: variable 'dst_pitch' is uninitialized when used here [-Wuninitialized]
           src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
                                      ^~~~~~~~~
   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:492:26: note: initialize the variable 'dst_pitch' to silence this warning
           s32 src_pitch, dst_pitch;
                                   ^
                                    = 0
   1 warning generated.


vim +/dst_pitch +509 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c

   475	
   476	
   477	/**
   478	 * vmw_stdu_bo_cpu_commit - Callback to do a CPU blit from buffer object
   479	 *
   480	 * @dirty: The closure structure.
   481	 *
   482	 * For the special case when we cannot create a proxy surface in a
   483	 * 2D VM, we have to do a CPU blit ourselves.
   484	 */
   485	static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
   486	{
   487		struct vmw_stdu_dirty *ddirty =
   488			container_of(dirty, struct vmw_stdu_dirty, base);
   489		struct vmw_screen_target_display_unit *stdu =
   490			container_of(dirty->unit, typeof(*stdu), base);
   491		s32 width, height;
   492		s32 src_pitch, dst_pitch;
   493		struct ttm_buffer_object *src_bo, *dst_bo;
   494		u32 src_offset, dst_offset;
   495		struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(stdu->cpp);
   496	
   497		if (!dirty->num_hits)
   498			return;
   499	
   500		width = ddirty->right - ddirty->left;
   501		height = ddirty->bottom - ddirty->top;
   502	
   503		if (width == 0 || height == 0)
   504			return;
   505	
   506		/* Assume we are blitting from Guest (bo) to Host (display_srf) */
   507		src_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
   508		src_bo = &stdu->display_srf->res.backup->base;
 > 509		src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
   510	
   511		dst_pitch = ddirty->pitch;
   512		dst_bo = &ddirty->buf->base;
   513		dst_offset = ddirty->fb_top * src_pitch + ddirty->fb_left * stdu->cpp;
   514	
   515		(void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
   516				       src_bo, src_offset, src_pitch,
   517				       width * stdu->cpp, height, &diff);
   518	}
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
