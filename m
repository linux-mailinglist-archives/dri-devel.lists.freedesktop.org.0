Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4F7FBD89
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 15:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C21810E564;
	Tue, 28 Nov 2023 14:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E996210E560
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701183534; x=1732719534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MmtHq2AXw3e0z60hXa4rJ0joKeClbwyrFO4/JVmK7So=;
 b=PccI+YI3N1mm44qQU+wycSimB5raUL8a6nQHFpBJ17RI+hjkbalBMmuN
 ipVudIaI9K9FbZ3YBnfYx2ZKPOVPoarHuT7fiutXBtakj5EzUgEZFdfbk
 8E25CI4PtFF53SfdavibM73fPVioPr7SFt7Top4v4R5nQf2Nv4s0BHfiL
 B7fLsoJQcN2u0E9rLvE0JtbEQSUHDglyUWqtmTQcvTw/70LttrayZn4+N
 mExHmTa7F/SBWFCC47wJIisEvchqQb3zXyIEHuxuvl0vc1L71asZraR+m
 +bGlYHKpWGwEx3J12bhnavhj/BVDRgZ7I7v85gCu0XsBcYPHpw4VZTV7z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459442640"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="459442640"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 06:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="9971128"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 28 Nov 2023 06:58:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r7zXy-0007eq-14;
 Tue, 28 Nov 2023 14:58:46 +0000
Date: Tue, 28 Nov 2023 22:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 03/45] drm/tests: Add helper to create mock plane
Message-ID: <202311282223.mefGp1S5-lkp@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-3-c7602158306e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-3-c7602158306e@kernel.org>
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
Cc: linux-doc@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on sunxi/sunxi/for-next drm/drm-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Add-atomic-helpers/20231128-193409
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231128-kms-hdmi-connector-state-v4-3-c7602158306e%40kernel.org
patch subject: [PATCH v4 03/45] drm/tests: Add helper to create mock plane
config: i386-buildonly-randconfig-002-20231128 (https://download.01.org/0day-ci/archive/20231128/202311282223.mefGp1S5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311282223.mefGp1S5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311282223.mefGp1S5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:290: warning: Function parameter or member 'num_formats' not described in 'drm_kunit_helper_create_primary_plane'
>> drivers/gpu/drm/tests/drm_kunit_helpers.c:290: warning: Excess function parameter 'format_count' description in 'drm_kunit_helper_create_primary_plane'


vim +290 drivers/gpu/drm/tests/drm_kunit_helpers.c

   257	
   258	/**
   259	 * drm_kunit_helper_create_primary_plane - Creates a mock primary plane for a KUnit test
   260	 * @test: The test context object
   261	 * @drm: The device to alloc the plane for
   262	 * @funcs: Callbacks for the new plane. Optional.
   263	 * @helper_funcs: Helpers callbacks for the new plane. Optional.
   264	 * @formats: array of supported formats (DRM_FORMAT\_\*). Optional.
   265	 * @format_count: number of elements in @formats
   266	 * @modifiers: array of struct drm_format modifiers terminated by
   267	 *             DRM_FORMAT_MOD_INVALID. Optional.
   268	 *
   269	 * This allocates and initializes a mock struct &drm_plane meant to be
   270	 * part of a mock device for a KUnit test.
   271	 *
   272	 * Resources will be cleaned up automatically.
   273	 *
   274	 * @funcs will default to the default helpers implementations.
   275	 * @helper_funcs will default to an empty implementation. @formats will
   276	 * default to XRGB8888 only. @modifiers will default to a linear
   277	 * modifier only.
   278	 *
   279	 * Returns:
   280	 * A pointer to the new plane, or an ERR_PTR() otherwise.
   281	 */
   282	struct drm_plane *
   283	drm_kunit_helper_create_primary_plane(struct kunit *test,
   284					      struct drm_device *drm,
   285					      const struct drm_plane_funcs *funcs,
   286					      const struct drm_plane_helper_funcs *helper_funcs,
   287					      const uint32_t *formats,
   288					      unsigned int num_formats,
   289					      const uint64_t *modifiers)
 > 290	{
   291		struct drm_plane *plane;
   292	
   293		if (!funcs)
   294			funcs = &default_plane_funcs;
   295	
   296		if (!helper_funcs)
   297			helper_funcs = &default_plane_helper_funcs;
   298	
   299		if (!formats || !num_formats) {
   300			formats = default_plane_formats;
   301			num_formats = ARRAY_SIZE(default_plane_formats);
   302		}
   303	
   304		if (!modifiers)
   305			modifiers = default_plane_modifiers;
   306	
   307		plane = __drmm_universal_plane_alloc(drm,
   308						     sizeof(struct drm_plane), 0,
   309						     0,
   310						     funcs,
   311						     formats,
   312						     num_formats,
   313						     default_plane_modifiers,
   314						     DRM_PLANE_TYPE_PRIMARY,
   315						     NULL);
   316		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, plane);
   317	
   318		drm_plane_helper_add(plane, helper_funcs);
   319	
   320		return plane;
   321	}
   322	EXPORT_SYMBOL_GPL(drm_kunit_helper_create_primary_plane);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
