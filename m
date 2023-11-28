Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFC7FBE49
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DE910E573;
	Tue, 28 Nov 2023 15:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAD110E573
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701186047; x=1732722047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8nepXDDKpUSmzaNbaV5Vy4HTg1gPIixShnpwMbGkYOo=;
 b=IgeKUq8RpYD3nUhjRTsGJZl/o2N0Egvw7mTY4CyEAhFBstvwH2AC4tfL
 WsGMQsFC2+VbpEtyRtB+80tC9DfcxirA96nZImypopab2WaMxS9Izt1ud
 eE4ZgBw9NHWPGka+fpKpS7VqC2Lo4dSOSRGVRIztY1bYtjKX+TU5jSqZC
 T/bgmUOMDGRF+aByDiSpI/Xme/3ZWkqtgW0aRZxPssfJceoMbpA0yyNBX
 eE3QD1tdObHcPMiWc8Hlo/0C924/6jgJLEfVBmC/bYSYhO4yEKEXDJL73
 zwJv1l3/SOtVF6j9Pa00UiodHDlYZqjY0lPyfJ/+V25YtMMKO/Zov92z4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6205958"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6205958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="9985751"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 28 Nov 2023 07:40:28 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r80CH-0007gS-0j;
 Tue, 28 Nov 2023 15:40:25 +0000
Date: Tue, 28 Nov 2023 23:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, hi@alyssa.is, daniel@ffwll.ch, javierm@redhat.com
Subject: Re: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
Message-ID: <202311282308.nZrBqKpT-lkp@intel.com>
References: <20231128090158.15564-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128090158.15564-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-atomic-helpers-Invoke-end_fb_access-while-owning-plane-state/20231128-170429
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128090158.15564-1-tzimmermann%40suse.de
patch subject: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while owning plane state
config: i386-buildonly-randconfig-002-20231128 (https://download.01.org/0day-ci/archive/20231128/202311282308.nZrBqKpT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311282308.nZrBqKpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311282308.nZrBqKpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_helper.c:2665: warning: Function parameter or member 'state' not described in 'drm_atomic_helper_unprepare_planes'
>> drivers/gpu/drm/drm_atomic_helper.c:2665: warning: Excess function parameter 'old_state' description in 'drm_atomic_helper_unprepare_planes'


vim +2665 drivers/gpu/drm/drm_atomic_helper.c

  2652	
  2653	/**
  2654	 * drm_atomic_helper_unprepare_planes - release plane resources on aborts
  2655	 * @dev: DRM device
  2656	 * @old_state: atomic state object with old state structures
  2657	 *
  2658	 * This function cleans up plane state, specifically framebuffers, from the
  2659	 * atomic state. It undoes the effects of drm_atomic_helper_prepare_planes()
  2660	 * when aborting an atomic commit. For cleaning up after a successful commit
  2661	 * use drm_atomic_helper_cleanup_planes().
  2662	 */
  2663	void drm_atomic_helper_unprepare_planes(struct drm_device *dev,
  2664						struct drm_atomic_state *state)
> 2665	{
  2666		struct drm_plane *plane;
  2667		struct drm_plane_state *new_plane_state;
  2668		int i;
  2669	
  2670		for_each_new_plane_in_state(state, plane, new_plane_state, i) {
  2671			const struct drm_plane_helper_funcs *funcs = plane->helper_private;
  2672	
  2673			if (funcs->end_fb_access)
  2674				funcs->end_fb_access(plane, new_plane_state);
  2675		}
  2676	
  2677		for_each_new_plane_in_state(state, plane, new_plane_state, i) {
  2678			const struct drm_plane_helper_funcs *funcs = plane->helper_private;
  2679	
  2680			if (funcs->cleanup_fb)
  2681				funcs->cleanup_fb(plane, new_plane_state);
  2682		}
  2683	}
  2684	EXPORT_SYMBOL(drm_atomic_helper_unprepare_planes);
  2685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
