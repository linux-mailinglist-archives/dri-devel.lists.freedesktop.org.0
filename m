Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A9A50A38
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 19:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E488981D;
	Wed,  5 Mar 2025 18:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGM5hdRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A128981D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741200524; x=1772736524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=868+/Ff9d2q4wznenD1/aaHMIXsUV2hgGgPWgSB1+G4=;
 b=aGM5hdRLka5fK8DBP9YAMM49IB/1Mcq2viyd9DAQlXkykRxf/pF92fn7
 IlaLIw7pPTrtyZ80xoo6vmfGiyPAb2FJy5hluF4BriN4RcVojd/l4qhMe
 Ks1DMzmJ4aKyYmIfrgp+IMW9O7/Y0J3mKZkOhe97EMkm7V4k3ESA7H/kR
 oCRegXp6g2Bd3nr/D7MnWpRRikiHsowbuH1vk0HL+HMmr4UxLGD29jaUp
 z2nm/N6f6kgabwhL2gi6jogSEU1bAiUwgZ+zGnz212HfK/Mi4cw1f+P+a
 sAclndf7mZd6Y7jeLVWBz/y6zbT6ZUKApX3E3FOdoKPKp+ANwQBvoUm/E g==;
X-CSE-ConnectionGUID: 4gcAXXeZTMKbj1rIEOYm3g==
X-CSE-MsgGUID: rtJIWtBmT+28A/iX59v3pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52829291"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52829291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 10:48:44 -0800
X-CSE-ConnectionGUID: V55DJKrMT6avW18LVHi6MA==
X-CSE-MsgGUID: z/n1uqBgS1S47x4ePazlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118576666"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 10:48:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tptnM-000M3m-0y;
 Wed, 05 Mar 2025 18:48:40 +0000
Date: Thu, 6 Mar 2025 02:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH] drm/vmwgfx: Make sure the dirty tracker is released on
 surfaces
Message-ID: <202503060226.Y7UvsIZE-lkp@intel.com>
References: <20250304184942.2127704-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304184942.2127704-1-zack.rusin@broadcom.com>
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
[also build test ERROR on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-vmwgfx-Make-sure-the-dirty-tracker-is-released-on-surfaces/20250305-025105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250304184942.2127704-1-zack.rusin%40broadcom.com
patch subject: [PATCH] drm/vmwgfx: Make sure the dirty tracker is released on surfaces
config: arm64-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060226.Y7UvsIZE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060226.Y7UvsIZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060226.Y7UvsIZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c: In function 'vmw_framebuffer_surface_destroy':
>> drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:1236:39: error: invalid use of undefined type 'const struct vmw_res_func'
    1236 |                         surf->res.func->dirty_free(&surf->res);
         |                                       ^~


vim +1236 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c

  1196	
  1197	
  1198	/**
  1199	 * vmw_du_connector_destroy_state - destroy connector state
  1200	 * @connector: DRM connector
  1201	 * @state: state object to destroy
  1202	 *
  1203	 * Destroys the connector state (both common and vmw-specific) for the
  1204	 * specified plane.
  1205	 */
  1206	void
  1207	vmw_du_connector_destroy_state(struct drm_connector *connector,
  1208				  struct drm_connector_state *state)
  1209	{
  1210		drm_atomic_helper_connector_destroy_state(connector, state);
  1211	}
  1212	/*
  1213	 * Generic framebuffer code
  1214	 */
  1215	
  1216	/*
  1217	 * Surface framebuffer code
  1218	 */
  1219	
  1220	static void vmw_framebuffer_surface_destroy(struct drm_framebuffer *framebuffer)
  1221	{
  1222		struct vmw_framebuffer_surface *vfbs =
  1223			vmw_framebuffer_to_vfbs(framebuffer);
  1224		struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
  1225		struct vmw_surface *surf = vmw_user_object_surface(&vfbs->uo);
  1226	
  1227		if (bo) {
  1228			vmw_bo_dirty_release(bo);
  1229			/*
  1230			 * bo->dirty is reference counted so it being NULL
  1231			 * means that the surface wasn't coherent to begin
  1232			 * with and so we have to free the dirty tracker
  1233			 * in the vmw_resource
  1234			 */
  1235			if (!bo->dirty && surf && surf->res.dirty)
> 1236				surf->res.func->dirty_free(&surf->res);
  1237		}
  1238		drm_framebuffer_cleanup(framebuffer);
  1239		vmw_user_object_unref(&vfbs->uo);
  1240	
  1241		kfree(vfbs);
  1242	}
  1243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
