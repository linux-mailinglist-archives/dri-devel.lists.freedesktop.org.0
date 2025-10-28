Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1BC15235
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:22:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1EC10E415;
	Tue, 28 Oct 2025 14:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlCEYile";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954010E415
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761661342; x=1793197342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=px0MgSDxvp/2jAYLc+fSsb66AHIsm1T+dXEXQF/9FzY=;
 b=QlCEYileTNx8ZOBagdFl4aL3G4ak+yEpH5sUsRrRMOSD2LlD5YujGQjh
 LrS52fRTrx3w+23TGrmR0909bV1KyvwvinJz8nqaXa2JvwuJNA5Mn5lMb
 P1jNUdbLqwVC3LTVw09x1nSH9BVb9K7k785tmojxE2SSREg/2jodS7GNW
 FXYyzcdMJPsJRs/hEimzvOXVd5NSO40c8GX6Ax+KGwr7X5PwEXU9HZdW6
 QCwd4tg8PLDSWb8Q02GgRyBRt+zCtnlBpf1wINCiuNCHU6L2g8iT2Vhc7
 CpceAOsZXZqhAJMJCzEfAg0nHMrIoHj462IZ4wZ20sMR8GzzVI6PWmyXN g==;
X-CSE-ConnectionGUID: Jix225lqT9mBYldOw1GF4w==
X-CSE-MsgGUID: 3uSDDWKFSz+CH0g9lLvPKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51335815"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="51335815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 07:22:19 -0700
X-CSE-ConnectionGUID: cTls5HCJRuGpZlmY+dGByg==
X-CSE-MsgGUID: ug5gR5tiSbiJl0V4QntL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185055954"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 07:22:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vDkaR-000JDt-0Q;
 Tue, 28 Oct 2025 14:22:13 +0000
Date: Tue, 28 Oct 2025 22:22:08 +0800
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
Message-ID: <202510282155.MdnvC7YI-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.18-rc3 next-20251028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaoqian-Lin/drm-of-Fix-device-node-reference-leak-in-drm_of_panel_bridge_remove/20251028-141134
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251028060918.65688-1-linmq006%40gmail.com
patch subject: [PATCH] drm/of: Fix device node reference leak in drm_of_panel_bridge_remove
config: x86_64-randconfig-161-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282155.MdnvC7YI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282155.MdnvC7YI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282155.MdnvC7YI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tiny/arcpgu.c:23:
   include/drm/drm_of.h: In function 'drm_of_panel_bridge_remove':
   include/drm/drm_of.h:174:9: error: implicit declaration of function 'of_node_put' [-Wimplicit-function-declaration]
     174 |         of_node_put(remote);
         |         ^~~~~~~~~~~
   In file included from include/linux/of_reserved_mem.h:6,
                    from drivers/gpu/drm/tiny/arcpgu.c:28:
   include/linux/of.h: At top level:
>> include/linux/of.h:129:13: warning: conflicting types for 'of_node_put'; have 'void(struct device_node *)'
     129 | extern void of_node_put(struct device_node *node);
         |             ^~~~~~~~~~~
   include/drm/drm_of.h:174:9: note: previous implicit declaration of 'of_node_put' with type 'void(struct device_node *)'
     174 |         of_node_put(remote);
         |         ^~~~~~~~~~~


vim +129 include/linux/of.h

0829f6d1f69e4f Pantelis Antoniou 2013-12-13  126  
0f22dd395fc473 Grant Likely      2012-02-15  127  #ifdef CONFIG_OF_DYNAMIC
0f22dd395fc473 Grant Likely      2012-02-15  128  extern struct device_node *of_node_get(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15 @129  extern void of_node_put(struct device_node *node);
0f22dd395fc473 Grant Likely      2012-02-15  130  #else /* CONFIG_OF_DYNAMIC */
3ecdd0515287af Rob Herring       2011-12-13  131  /* Dummy ref counting routines - to be implemented later */
3ecdd0515287af Rob Herring       2011-12-13  132  static inline struct device_node *of_node_get(struct device_node *node)
3ecdd0515287af Rob Herring       2011-12-13  133  {
3ecdd0515287af Rob Herring       2011-12-13  134  	return node;
3ecdd0515287af Rob Herring       2011-12-13  135  }
0f22dd395fc473 Grant Likely      2012-02-15  136  static inline void of_node_put(struct device_node *node) { }
0f22dd395fc473 Grant Likely      2012-02-15  137  #endif /* !CONFIG_OF_DYNAMIC */
9448e55d032d99 Jonathan Cameron  2024-02-25  138  DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
3ecdd0515287af Rob Herring       2011-12-13  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
