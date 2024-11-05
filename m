Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B289BD141
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 16:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A8010E5D0;
	Tue,  5 Nov 2024 15:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xne3BHfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CBB10E5D0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730822318; x=1762358318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q/y9vOpTykXgYrQoKuWRZ+1nv2SoQIiyeDAcyGYSW0I=;
 b=Xne3BHfukjWs18vFCcx8a2KASLoXyLGNPH9HzTRXdpo8P69vzYZePS96
 l1hiKBWGkUTmYvLZENp09wBQgdOcj15bGQVxzh9vq9RkvyJjjCiECg4Qu
 AGMHCP313uBp+SRCUJp1vbbHlgrtmxIz9JPmu9xdowMeLy99z0YzIgXno
 nPR60WWLr+igyzYIr8451YMvWujpTuxeOQiegOlfP9Y1BEeqUAUwRnDdx
 74fdNeS8xk/dV7eS8Un+OjULF8CG1Aa1VQXAgDVMjcOI7DGPqKwEEYXxP
 TLO0+T/j/jSRRK0Z49fC4MHt48vDihebxaZlHy8NB6mP++sHpu/8tOopY A==;
X-CSE-ConnectionGUID: +bXNcEk4QDOvfYasii8mmw==
X-CSE-MsgGUID: 0rKAcM1lSOeGNmyJW5gFtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41976449"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41976449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:58:38 -0800
X-CSE-ConnectionGUID: BTNINd6BQHe8MZCjfF5MUw==
X-CSE-MsgGUID: etmk2V29Rei+8saJ95Mtkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="121550940"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 07:58:35 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8Lwu-000mCF-1r;
 Tue, 05 Nov 2024 15:58:32 +0000
Date: Tue, 5 Nov 2024 23:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 memxor@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, kernel-team@fb.com
Subject: Re: [PATCH bpf-next 2/2] bpf: Switch bpf arena to use drm_mm instead
 of maple_tree
Message-ID: <202411052322.GENc72sg-lkp@intel.com>
References: <20241101235453.63380-3-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101235453.63380-3-alexei.starovoitov@gmail.com>
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

Hi Alexei,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/drm-bpf-Move-drm_mm-c-to-lib-to-be-used-by-bpf-arena/20241102-075645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241101235453.63380-3-alexei.starovoitov%40gmail.com
patch subject: [PATCH bpf-next 2/2] bpf: Switch bpf arena to use drm_mm instead of maple_tree
config: sparc-randconfig-r061-20241105 (https://download.01.org/0day-ci/archive/20241105/202411052322.GENc72sg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052322.GENc72sg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052322.GENc72sg-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: lib/drm_mm.o: in function `drm_mm_takedown':
>> lib/drm_mm.c:135:(.text+0x470): undefined reference to `__drm_err'
>> sparc64-linux-ld: lib/drm_mm.c:129:(.text+0x4ac): undefined reference to `__drm_err'


vim +135 lib/drm_mm.c

5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  117  
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  118  static void show_leaks(struct drm_mm *mm)
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  119  {
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  120  	struct drm_mm_node *node;
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  121  	char *buf;
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  122  
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  123  	buf = kmalloc(BUFSZ, GFP_KERNEL);
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  124  	if (!buf)
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  125  		return;
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  126  
2bc98c86517b08 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-12-22  127  	list_for_each_entry(node, drm_mm_nodes(mm), node_list) {
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  128  		if (!node->stack) {
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31 @129  			DRM_ERROR("node [%08llx + %08llx]: unknown owner\n",
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  130  				  node->start, node->size);
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  131  			continue;
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  132  		}
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  133  
0f68d45ef41abb drivers/gpu/drm/drm_mm.c Imran Khan   2021-11-08  134  		stack_depot_snprint(node->stack, buf, BUFSZ, 0);
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31 @135  		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  136  			  node->start, node->size, buf);
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  137  	}
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  138  
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  139  	kfree(buf);
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  140  }
5705670d046342 drivers/gpu/drm/drm_mm.c Chris Wilson 2016-10-31  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
