Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C470FB0AE6F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 09:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D210E1D9;
	Sat, 19 Jul 2025 07:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATPA/r6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21B210E0CB;
 Sat, 19 Jul 2025 07:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910368; x=1784446368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BWHip9Ob+Rbo7R8yQG563T+TiGK9qqPI2QgNU5+R2xI=;
 b=ATPA/r6Noz+i64ez+IZINarEQqoMcFAx7iGns+gS183JGVlnowHRej8Y
 P9tazHWzgYwbCpUunL5Ti5PgyQrAkO4TI7STmXHf9y1OUSkQ6NzC5GEDa
 UXe9OCwhH5c7OPJlWLLiNat+APtNmTPADHNq8qc8pnxwT0VbEqrE9lnWt
 9WXh8Z1NrO9gUJ1xzEmxN7DGmWDG/RD1zo+J96KuDPdwSupvS9CR8kmo6
 3owjgJGw+N4t/yaSg5/xWWAI0DhSTpNJQ6NShMJEzSg0RHeN6kSkTWk4Z
 /RfCjWG3+gzY0977njy2mCTMoWguocvMVAyIYMMsXbSfMb7V4RqPst3jk A==;
X-CSE-ConnectionGUID: VFKxdt1VQ5eF+6qszIbWMQ==
X-CSE-MsgGUID: KhojoIvPSwmP8gZtmVdpvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="59010263"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="59010263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:32:47 -0700
X-CSE-ConnectionGUID: 0R3YABj+SL+PxeGyc1cErA==
X-CSE-MsgGUID: uDXsMMRDRKqNlUa8DLZ7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="195481924"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 19 Jul 2025 00:32:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ud23m-000FJX-2O;
 Sat, 19 Jul 2025 07:32:42 +0000
Date: Sat, 19 Jul 2025 15:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>, airlied@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 simona@ffwll.ch, mripard@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: Re: [PATCH] [PATCH v3] drm/i915: move struct_mutex from drm_device
 to drm_i915_private
Message-ID: <202507191538.4n49mSm3-lkp@intel.com>
References: <20250718195543.301391-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718195543.301391-1-luiz.mello@estudante.ufscar.br>
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

Hi Luiz,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc6]
[cannot apply to next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Otavio-Mello/drm-i915-move-struct_mutex-from-drm_device-to-drm_i915_private/20250719-035710
base:   linus/master
patch link:    https://lore.kernel.org/r/20250718195543.301391-1-luiz.mello%40estudante.ufscar.br
patch subject: [PATCH] [PATCH v3] drm/i915: move struct_mutex from drm_device to drm_i915_private
config: arm-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191538.4n49mSm3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191538.4n49mSm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191538.4n49mSm3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_init_release':
>> drivers/gpu/drm/drm_drv.c:686:27: error: 'struct drm_device' has no member named 'struct_mutex'
     686 |         mutex_destroy(&dev->struct_mutex);
         |                           ^~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/dcache.h:11,
                    from include/linux/fs.h:9,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/drm_drv.c:31:
   drivers/gpu/drm/drm_drv.c: In function 'drm_dev_init':
   drivers/gpu/drm/drm_drv.c:727:24: error: 'struct drm_device' has no member named 'struct_mutex'
     727 |         mutex_init(&dev->struct_mutex);
         |                        ^~
   include/linux/mutex.h:64:23: note: in definition of macro 'mutex_init'
      64 |         __mutex_init((mutex), #mutex, &__key);                          \
         |                       ^~~~~


vim +686 drivers/gpu/drm/drm_drv.c

31bbe16f6d8862 drivers/gpu/drm/drm_stub.c David Rheinsberg  2014-01-03  647  
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  648  /**
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  649   * DOC: component helper usage recommendations
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  650   *
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  651   * DRM drivers that drive hardware where a logical device consists of a pile of
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  652   * independent hardware blocks are recommended to use the :ref:`component helper
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  653   * library<component>`. For consistency and better options for code reuse the
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  654   * following guidelines apply:
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  655   *
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  656   *  - The entire device initialization procedure should be run from the
4c8e84b8876dc7 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-09-02  657   *    &component_master_ops.master_bind callback, starting with
4c8e84b8876dc7 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-09-02  658   *    devm_drm_dev_alloc(), then binding all components with
4c8e84b8876dc7 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-09-02  659   *    component_bind_all() and finishing with drm_dev_register().
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  660   *
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  661   *  - The opaque pointer passed to all components through component_bind_all()
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  662   *    should point at &struct drm_device of the device instance, not some driver
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  663   *    specific private structure.
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  664   *
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  665   *  - The component helper fills the niche where further standardization of
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  666   *    interfaces is not practical. When there already is, or will be, a
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  667   *    standardized interface like &drm_bridge or &drm_panel, providing its own
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  668   *    functions to find such components at driver load time, like
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  669   *    drm_of_find_panel_or_bridge(), then the component helper should not be
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  670   *    used.
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  671   */
86ab67dfcfc5a2 drivers/gpu/drm/drm_drv.c  Simona Vetter     2019-02-12  672  
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  673  static void drm_dev_init_release(struct drm_device *dev, void *res)
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  674  {
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  675  	drm_fs_inode_free(dev->anon_inode);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  676  
143ec8d3f93965 drivers/gpu/drm/drm_drv.c  Thomas Zimmermann 2025-03-07  677  	put_device(dev->dma_dev);
143ec8d3f93965 drivers/gpu/drm/drm_drv.c  Thomas Zimmermann 2025-03-07  678  	dev->dma_dev = NULL;
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  679  	put_device(dev->dev);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  680  	/* Prevent use-after-free in drm_managed_release when debugging is
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  681  	 * enabled. Slightly awkward, but can't really be helped. */
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  682  	dev->dev = NULL;
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  683  	mutex_destroy(&dev->master_mutex);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  684  	mutex_destroy(&dev->clientlist_mutex);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  685  	mutex_destroy(&dev->filelist_mutex);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23 @686  	mutex_destroy(&dev->struct_mutex);
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  687  }
2cbf7fc6718b94 drivers/gpu/drm/drm_drv.c  Simona Vetter     2020-03-23  688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
