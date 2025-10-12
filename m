Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A1BCFF3D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 05:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7442E10E0A0;
	Sun, 12 Oct 2025 03:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3ckW8Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715A10E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 03:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760238788; x=1791774788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LgCBazIKENUMWDtTVXVJ1949c/UQTOe/HuPTUIj7gzU=;
 b=K3ckW8YpRXW8qx4PP+jFzFf7fzLhCIuZMcfhRn5D2Oo1WBJWdBcsUurN
 fU/DxUuKlBvpNLcMyCfWwE/donmKlO4Wjo+j9EzMR5Qkxj/jTYIxyo0NS
 mCcW5mbzZBnmJuyrJpl1zcAChryGZyhk0Me2EqX8Q+OPzujzeMbcy8ybz
 V7yfvqjhujRYeYOQezgOOdTnrKbrZgnU+0IDIey6wf5WIeG5WpaQdSe7H
 CTYenHgqrTxI7JIjl0hTHJ08FxvAmH9uyNfff7WDYm4yHBGdEfcuP1qWX
 1BADd/C9xC5RwHEFB11O+wKzWGkqD+vQoyVsQWP2dzESeCi8jGubmyZQV w==;
X-CSE-ConnectionGUID: nFSVbNgmQy2v8iqCVkFHNA==
X-CSE-MsgGUID: RT7RrYBMTYSy4vvOnBZRzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62510336"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; d="scan'208";a="62510336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 20:13:07 -0700
X-CSE-ConnectionGUID: QdHrMtJ9SPmASB0zARVHzA==
X-CSE-MsgGUID: mgmTFntXSbm6mXD79aJaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; d="scan'208";a="186583057"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 11 Oct 2025 20:13:03 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v7mW5-0004AR-0j;
 Sun, 12 Oct 2025 03:13:01 +0000
Date: Sun, 12 Oct 2025 11:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, michael.riesch@wolfvision.net,
 robh@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: vop2: use correct destination rectangle
 height check
Message-ID: <202510121013.tqU2DAEC-lkp@intel.com>
References: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
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

Hi Alok,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alok-Tiwari/drm-rockchip-vop2-use-correct-destination-rectangle-height-check/20251011-210653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20251011130450.123444-1-alok.a.tiwari%40oracle.com
patch subject: [PATCH] drm/rockchip: vop2: use correct destination rectangle height check
config: sparc64-randconfig-001-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121013.tqU2DAEC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121013.tqU2DAEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121013.tqU2DAEC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1034:34: error: call to undeclared function 'drm_rect_heigh'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1034 |             drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
         |                                         ^
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1034:34: note: did you mean 'drm_rect_height'?
   include/drm/drm_rect.h:196:19: note: 'drm_rect_height' declared here
     196 | static inline int drm_rect_height(const struct drm_rect *r)
         |                   ^
   1 error generated.


vim +/drm_rect_heigh +1034 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

   991	
   992	static int vop2_plane_atomic_check(struct drm_plane *plane,
   993					   struct drm_atomic_state *astate)
   994	{
   995		struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(astate, plane);
   996		struct drm_framebuffer *fb = pstate->fb;
   997		struct drm_crtc *crtc = pstate->crtc;
   998		struct drm_crtc_state *cstate;
   999		struct vop2_video_port *vp;
  1000		struct vop2 *vop2;
  1001		const struct vop2_data *vop2_data;
  1002		struct drm_rect *dest = &pstate->dst;
  1003		struct drm_rect *src = &pstate->src;
  1004		int min_scale = FRAC_16_16(1, 8);
  1005		int max_scale = FRAC_16_16(8, 1);
  1006		int format;
  1007		int ret;
  1008	
  1009		if (!crtc)
  1010			return 0;
  1011	
  1012		vp = to_vop2_video_port(crtc);
  1013		vop2 = vp->vop2;
  1014		vop2_data = vop2->data;
  1015	
  1016		cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
  1017		if (WARN_ON(!cstate))
  1018			return -EINVAL;
  1019	
  1020		ret = drm_atomic_helper_check_plane_state(pstate, cstate,
  1021							  min_scale, max_scale,
  1022							  true, true);
  1023		if (ret)
  1024			return ret;
  1025	
  1026		if (!pstate->visible)
  1027			return 0;
  1028	
  1029		format = vop2_convert_format(fb->format->format);
  1030		if (format < 0)
  1031			return format;
  1032	
  1033		if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
> 1034		    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
  1035			drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
  1036				drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
  1037				drm_rect_width(dest), drm_rect_height(dest));
  1038			pstate->visible = false;
  1039			return 0;
  1040		}
  1041	
  1042		if (drm_rect_width(src) >> 16 > vop2_data->max_input.width ||
  1043		    drm_rect_height(src) >> 16 > vop2_data->max_input.height) {
  1044			drm_err(vop2->drm, "Invalid source: %dx%d. max input: %dx%d\n",
  1045				drm_rect_width(src) >> 16,
  1046				drm_rect_height(src) >> 16,
  1047				vop2_data->max_input.width,
  1048				vop2_data->max_input.height);
  1049			return -EINVAL;
  1050		}
  1051	
  1052		/*
  1053		 * Src.x1 can be odd when do clip, but yuv plane start point
  1054		 * need align with 2 pixel.
  1055		 */
  1056		if (fb->format->is_yuv && ((pstate->src.x1 >> 16) % 2)) {
  1057			drm_err(vop2->drm, "Invalid Source: Yuv format not support odd xpos\n");
  1058			return -EINVAL;
  1059		}
  1060	
  1061		return 0;
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
