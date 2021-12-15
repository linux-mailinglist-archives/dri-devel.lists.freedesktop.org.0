Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D6476111
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DDF10F804;
	Wed, 15 Dec 2021 18:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D3910F804;
 Wed, 15 Dec 2021 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639594277; x=1671130277;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w8p92joXT//Ut2Ca4EToYwQQZyk50QZlXPcun2b6MEA=;
 b=Oofenp3gpnjkVoJQXj8yslAjrekqZsUVd+Qu+xxi1akP/G+8C1g3IVW8
 DBZtycKVpIFX0Zth7GjGQigDFE51St7WdP9Lr9CXhASCxCjgzI56wfBHm
 Tcshy18pQX4LfHlBqZJXekYQ3u9fo8V1OpJbv8pjsR2SxUo5cSglyl1Zd
 G2uAKNiwL42vbn3Xaz0/mG6DqgGSdsBPDPmFfGRwIb1iP4EI2VzWwBGK8
 N5DwMlemppvqpGj8HS2zbj2dUFfovk0GwLIL594p9ugCZH8Ie33E7EZ6k
 bddmPDeVwzs/dWMdHY4Pf2qnX2y96jRUTj/f1xRQZDHSrFOYNEIPgpKaV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="219326014"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219326014"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:51:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="482517960"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 10:51:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxZMw-0002Bz-J1; Wed, 15 Dec 2021 18:51:14 +0000
Date: Thu, 16 Dec 2021 02:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/i915: Use struct vma_resource instead of struct
 vma_snapshot
Message-ID: <202112160255.Kmo6u2NC-lkp@intel.com>
References: <20211215103611.777665-8-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215103611.777665-8-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20211214]
[cannot apply to drm-exynos/exynos-drm-next drm/drm-next drm-intel/for-linux-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a003-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160255.Kmo6u2NC-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/ede025870be746e37b5bcde123cdf741aa685fab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
        git checkout ede025870be746e37b5bcde123cdf741aa685fab
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gt/intel_ggtt_fencing.h:12,
                    from drivers/gpu/drm/i915/i915_vma.h:33,
                    from drivers/gpu/drm/i915/display/intel_display_types.h:50,
                    from drivers/gpu/drm/i915/i915_driver.c:51:
>> drivers/gpu/drm/i915/i915_vma_resource.h:176:15: warning: 'struct intel_memory_region' declared inside parameter list will not be visible outside of this definition or declaration
     176 |        struct intel_memory_region *mr,
         |               ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_drv.h:74,
                    from drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:9:
>> drivers/gpu/drm/i915/i915_vma_resource.h:176:15: warning: 'struct intel_memory_region' declared inside parameter list will not be visible outside of this definition or declaration
     176 |        struct intel_memory_region *mr,
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:464:5: warning: no previous prototype for 'prev_deps' [-Wmissing-prototypes]
     464 | int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
         |     ^~~~~~~~~
--
   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_vma.c:28:
>> drivers/gpu/drm/i915/i915_vma_resource.h:176:15: warning: 'struct intel_memory_region' declared inside parameter list will not be visible outside of this definition or declaration
     176 |        struct intel_memory_region *mr,
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_vma.c: In function 'i915_vma_resource_init_from_vma':
   drivers/gpu/drm/i915/i915_vma.c:394:48: error: passing argument 8 of 'i915_vma_resource_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
     394 |           i915_gem_object_is_lmem(obj), obj->mm.region,
         |                                         ~~~~~~~^~~~~~~
         |                                                |
         |                                                struct intel_memory_region *
   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_vma.c:28:
   drivers/gpu/drm/i915/i915_vma_resource.h:176:36: note: expected 'struct intel_memory_region *' but argument is of type 'struct intel_memory_region *'
     176 |        struct intel_memory_region *mr,
         |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/i915/i915_request.h:43,
                    from drivers/gpu/drm/i915/i915_active.h:13,
                    from drivers/gpu/drm/i915/gem/i915_gem_object_types.h:16,
                    from drivers/gpu/drm/i915/display/intel_frontbuffer.h:30,
                    from drivers/gpu/drm/i915/i915_drv.h:74,
                    from drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:12:
>> drivers/gpu/drm/i915/i915_vma_resource.h:176:15: warning: 'struct intel_memory_region' declared inside parameter list will not be visible outside of this definition or declaration
     176 |        struct intel_memory_region *mr,
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c:59:6: warning: no previous prototype for 'intel_pxp_debugfs_register' [-Wmissing-prototypes]
      59 | void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *gt_root)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +176 drivers/gpu/drm/i915/i915_vma_resource.h

   146	
   147	/**
   148	 * i915_vma_resource_init - Initialize a vma resource.
   149	 * @vma_res: The vma resource to initialize
   150	 * @vm: Pointer to the vm.
   151	 * @pages: The pages sg-table.
   152	 * @page_sizes: Page sizes of the pages.
   153	 * @pages_rsgt: Pointer to a struct i915_refct_sgt of an object with
   154	 * delayed destruction.
   155	 * @readonly: Whether the vma should be bound read-only.
   156	 * @lmem: Whether the vma points to lmem.
   157	 * @mr: The memory region of the object the vma points to.
   158	 * @ops: The backend ops.
   159	 * @private: Bind backend private info.
   160	 * @start: Offset into the address space of bind range start.
   161	 * @node_size: Size of the allocated range manager node.
   162	 * @size: Bind size.
   163	 *
   164	 * Initializes a vma resource allocated using i915_vma_resource_alloc().
   165	 * The reason for having separate allocate and initialize function is that
   166	 * initialization may need to be performed from under a lock where
   167	 * allocation is not allowed.
   168	 */
   169	static inline void i915_vma_resource_init(struct i915_vma_resource *vma_res,
   170						  struct i915_address_space *vm,
   171						  struct sg_table *pages,
   172						  const struct i915_page_sizes *page_sizes,
   173						  struct i915_refct_sgt *pages_rsgt,
   174						  bool readonly,
   175						  bool lmem,
 > 176						  struct intel_memory_region *mr,
   177						  const struct i915_vma_ops *ops,
   178						  void *private,
   179						  unsigned long start,
   180						  unsigned long node_size,
   181						  unsigned long size)
   182	{
   183		__i915_vma_resource_init(vma_res);
   184		vma_res->vm = vm;
   185		vma_res->bi.pages = pages;
   186		vma_res->bi.page_sizes = *page_sizes;
   187		if (pages_rsgt)
   188			vma_res->bi.pages_rsgt = i915_refct_sgt_get(pages_rsgt);
   189		vma_res->bi.readonly = readonly;
   190		vma_res->bi.lmem = lmem;
   191	#if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
   192		vma_res->mr = mr;
   193	#endif
   194		vma_res->ops = ops;
   195		vma_res->private = private;
   196		vma_res->start = start;
   197		vma_res->node_size = node_size;
   198		vma_res->vma_size = size;
   199	}
   200	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
