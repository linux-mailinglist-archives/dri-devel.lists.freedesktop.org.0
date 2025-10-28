Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047CC15065
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988D510E3FE;
	Tue, 28 Oct 2025 14:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcOh40Wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBC410E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761660080; x=1793196080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q+JKkHpI7G2bnBrn++zkM52PKJ8LvFbwXnn+LgOzPvI=;
 b=FcOh40WjLmPnknScS6+DdZGkpLu1apiImYyMsTOZ5zqCimM4SgcqNAWZ
 xBrFPcxDCu61o7CgN8Y5ICGpRW3Cp11tTl4Lr1IVbSknTm1cLcF845RxX
 fnE3AdghWLvZHcFdXHEKSLeWgK/q/+8xG67qEVYNXAOjVxKS4WFZX41IR
 FTTQlioJWEvLZyP+O9uBXcP97K9KkbR4vGKj5WZ9Pt9rxO3pMoLgYUFeH
 +LhKSqnFRPKYUh+SYPzX1Y8PkpP8gBeBHaQc/G21Ru9Cq5NHIj3yRAQEj
 l9w/+2eNVKQLKQ+jGPyJWzbeYACCLkvIh6jRlyI24ccEbXD5y3Ykc2ZzJ Q==;
X-CSE-ConnectionGUID: Oyda3UmNQ+e8+kGkhk19IQ==
X-CSE-MsgGUID: cTUzvhpWSo+wUHwvYIia+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63686328"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63686328"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:01:19 -0700
X-CSE-ConnectionGUID: u16gAOxzRcO5A15rT/ulKQ==
X-CSE-MsgGUID: dCJ8mXX6S42gCVfap5q90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="208948271"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2025 07:01:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vDkG6-000JBZ-0W;
 Tue, 28 Oct 2025 14:01:10 +0000
Date: Tue, 28 Oct 2025 22:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Miaoqian Lin <linmq006@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linmq006@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/of: Fix device node reference leak in
 drm_of_panel_bridge_remove
Message-ID: <202510282123.AjUbRs11-lkp@intel.com>
References: <20251028060918.65688-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028060918.65688-1-linmq006@gmail.com>
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

Hi Miaoqian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaoqian-Lin/drm-of-Fix-device-node-reference-leak-in-drm_of_panel_bridge_remove/20251028-141134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251028060918.65688-1-linmq006%40gmail.com
patch subject: [PATCH] drm/of: Fix device node reference leak in drm_of_panel_bridge_remove
config: mips-randconfig-r072-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282123.AjUbRs11-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282123.AjUbRs11-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282123.AjUbRs11-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_bridge.c:37:
>> include/drm/drm_of.h:174:2: error: call to undeclared function 'of_node_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     174 |         of_node_put(remote);
         |         ^
   1 error generated.
--
   In file included from drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c:10:
>> include/drm/drm_of.h:174:2: error: call to undeclared function 'of_node_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     174 |         of_node_put(remote);
         |         ^
   In file included from drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c:13:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:21:
   In file included from include/linux/irqdomain.h:14:
>> include/linux/of.h:129:13: error: conflicting types for 'of_node_put'
     129 | extern void of_node_put(struct device_node *node);
         |             ^
   include/drm/drm_of.h:174:2: note: previous implicit declaration is here
     174 |         of_node_put(remote);
         |         ^
   2 errors generated.


vim +/of_node_put +174 include/drm/drm_of.h

   153	
   154	/*
   155	 * drm_of_panel_bridge_remove - remove panel bridge
   156	 * @np: device tree node containing panel bridge output ports
   157	 *
   158	 * Remove the panel bridge of a given DT node's port and endpoint number
   159	 *
   160	 * Returns zero if successful, or one of the standard error codes if it fails.
   161	 */
   162	static inline int drm_of_panel_bridge_remove(const struct device_node *np,
   163						     int port, int endpoint)
   164	{
   165	#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
   166		struct drm_bridge *bridge;
   167		struct device_node *remote;
   168	
   169		remote = of_graph_get_remote_node(np, port, endpoint);
   170		if (!remote)
   171			return -ENODEV;
   172	
   173		bridge = of_drm_find_bridge(remote);
 > 174		of_node_put(remote);
   175		drm_panel_bridge_remove(bridge);
   176	
   177		return 0;
   178	#else
   179		return -EINVAL;
   180	#endif
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
