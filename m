Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8AAC7DBF
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 14:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DE610E13B;
	Thu, 29 May 2025 12:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsN0S0Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C681810E12B;
 Thu, 29 May 2025 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748521932; x=1780057932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yLbj4WLa1FW95pJKsDSKPi1C8D/v76hLHpk/PFj3PhU=;
 b=EsN0S0LscgKJPqezHD7wsvSaj4KQWysLDrWo+hraIqcg+SMcSyevK6xY
 Iae/Z3UQKhxxbmFaqHfg1mSeWA/IPdJ1V35lWmwq8zUxNrv2DzVgFm8U0
 ghRqfGJWRwHQN6i82JtffXCU59zMxRlXaiyYr9fODOWHtvvhm3OrtjPfu
 zXJxBQsTZwbnirifkaKv6cBJ0OrAKSXAuhIf/7C393UMlA1nl+QxLfqc8
 68PSwsuKoPojgyXF2ez333gRkm8u+VsOwoVnWq3Q78KXs5fbsmA0Rh1mM
 1fhffqLrQGiBCByua2Q8kjtaQlm3tMaz4g+w3Mcy5fHaU+HDxr5V+HaJW Q==;
X-CSE-ConnectionGUID: 5Nbtv/OcSyy5qUr1jZJHgA==
X-CSE-MsgGUID: kpS52WXfRCmDQrZm/EhgiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="75970801"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="75970801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:32:10 -0700
X-CSE-ConnectionGUID: OhMizr/4ReivJa5oyEuELQ==
X-CSE-MsgGUID: 4neKUg6ATbSEn1JT1J/KbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="143526205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 29 May 2025 05:32:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKcQY-000Wfw-1V;
 Thu, 29 May 2025 12:32:06 +0000
Date: Thu, 29 May 2025 20:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 3/8] drm/panthor: Fix UAF in
 panthor_gem_create_with_handle() debugfs code
Message-ID: <202505292016.42gSDa4w-lkp@intel.com>
References: <20250528091307.1894940-4-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-4-simona.vetter@ffwll.ch>
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

Hi Simona,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250527]
[also build test ERROR on linus/master]
[cannot apply to v6.15 v6.15-rc7 v6.15-rc6 v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simona-Vetter/drm-gem-Fix-race-in-drm_gem_handle_create_tail/20250528-171524
base:   next-20250527
patch link:    https://lore.kernel.org/r/20250528091307.1894940-4-simona.vetter%40ffwll.ch
patch subject: [PATCH 3/8] drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
config: sparc-randconfig-r132-20250529 (https://download.01.org/0day-ci/archive/20250529/202505292016.42gSDa4w-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505292016.42gSDa4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505292016.42gSDa4w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_gem.c: In function 'panthor_gem_create_object':
>> drivers/gpu/drm/panthor/panthor_gem.c:249:21: error: 'struct panthor_gem_object' has no member named 'debugfs'
     INIT_LIST_HEAD(&obj->debugfs.node);
                        ^~


vim +249 drivers/gpu/drm/panthor/panthor_gem.c

   225	
   226	/**
   227	 * panthor_gem_create_object - Implementation of driver->gem_create_object.
   228	 * @ddev: DRM device
   229	 * @size: Size in bytes of the memory the object will reference
   230	 *
   231	 * This lets the GEM helpers allocate object structs for us, and keep
   232	 * our BO stats correct.
   233	 */
   234	struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
   235	{
   236		struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
   237		struct panthor_gem_object *obj;
   238	
   239		obj = kzalloc(sizeof(*obj), GFP_KERNEL);
   240		if (!obj)
   241			return ERR_PTR(-ENOMEM);
   242	
   243		obj->base.base.funcs = &panthor_gem_funcs;
   244		obj->base.map_wc = !ptdev->coherent;
   245		mutex_init(&obj->gpuva_list_lock);
   246		drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
   247		mutex_init(&obj->label.lock);
   248	
 > 249		INIT_LIST_HEAD(&obj->debugfs.node);
   250	
   251		return &obj->base.base;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
