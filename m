Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E22CF16CE
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 23:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CF710E0E2;
	Sun,  4 Jan 2026 22:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5F1Cdms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AAE10E07F;
 Sun,  4 Jan 2026 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767566494; x=1799102494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9k0MkleAVvHbKnQUmL9KWFcTXNH5jwQDODeMnaJJZTg=;
 b=W5F1Cdms5Ijj0GE6NSeAxzn9V/2n4rK4uleu3HGM4B157ADxmlQntq+/
 2iZ8qOrU6B69fsBSFXRTj8RKUHqyX49u5K1gDa1SJYUxgNRTdNkN1Uyrk
 fb6/4ai8N7j/FH51AGtKDoNghK0xCOPPc5XQCx7ftfD/B4yn41Xb9zVD4
 zazraw8F2m/k6bDqOSxsWbA7euiXVd5mqFqa7PaLlbsTkhfp2lCmTARK9
 oBqHFM1mzBGvvZEtEcQg56KUIDItWJ7JXFWCw0yePNYmwQeIrtp1Ay6UB
 VvSTA4WeipGATiUpjbDtSWrApGYw7HM/y2BeZYnoRo3YpeEKtndon1UsH g==;
X-CSE-ConnectionGUID: FkLXgt07QSmOjP3BXSB0bA==
X-CSE-MsgGUID: q9F41Q5kShazH2BukoHaTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79244436"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="79244436"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 14:41:33 -0800
X-CSE-ConnectionGUID: aQulSiwVTGKKsjVzV89AIA==
X-CSE-MsgGUID: ZUWYfN29S+OpqIvgdYz7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="207141229"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa)
 ([10.211.93.152])
 by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2026 14:41:30 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vcWmu-000000000yD-1OxE;
 Sun, 04 Jan 2026 22:41:28 +0000
Date: Sun, 4 Jan 2026 23:41:04 +0100
From: kernel test robot <lkp@intel.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Message-ID: <202601042317.3h1kg7NS-lkp@intel.com>
References: <20260104131532.3978895-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104131532.3978895-1-lihaoxiang@isrc.iscas.ac.cn>
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

Hi Haoxiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoxiang-Li/drm-amdkfd-fix-a-memory-leak-in-device_queue_manager_init/20260104-211645
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260104131532.3978895-1-lihaoxiang%40isrc.iscas.ac.cn
patch subject: [PATCH] drm/amdkfd: fix a memory leak in device_queue_manager_init()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260104/202601042317.3h1kg7NS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042317.3h1kg7NS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601042317.3h1kg7NS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c: In function 'device_queue_manager_init':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3046:17: error: implicit declaration of function 'deallocate_hiq_sdma_mqd'; did you mean 'allocate_hiq_sdma_mqd'? [-Wimplicit-function-declaration]
    3046 |                 deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 allocate_hiq_sdma_mqd
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c: At top level:
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3053:13: warning: conflicting types for 'deallocate_hiq_sdma_mqd'; have 'void(struct kfd_node *, struct kfd_mem_obj *)'
    3053 | static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3053:13: error: static declaration of 'deallocate_hiq_sdma_mqd' follows non-static declaration
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:3046:17: note: previous implicit declaration of 'deallocate_hiq_sdma_mqd' with type 'void(struct kfd_node *, struct kfd_mem_obj *)'
    3046 |                 deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +3046 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c

  2921	
  2922	struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
  2923	{
  2924		struct device_queue_manager *dqm;
  2925	
  2926		pr_debug("Loading device queue manager\n");
  2927	
  2928		dqm = kzalloc(sizeof(*dqm), GFP_KERNEL);
  2929		if (!dqm)
  2930			return NULL;
  2931	
  2932		switch (dev->adev->asic_type) {
  2933		/* HWS is not available on Hawaii. */
  2934		case CHIP_HAWAII:
  2935		/* HWS depends on CWSR for timely dequeue. CWSR is not
  2936		 * available on Tonga.
  2937		 *
  2938		 * FIXME: This argument also applies to Kaveri.
  2939		 */
  2940		case CHIP_TONGA:
  2941			dqm->sched_policy = KFD_SCHED_POLICY_NO_HWS;
  2942			break;
  2943		default:
  2944			dqm->sched_policy = sched_policy;
  2945			break;
  2946		}
  2947	
  2948		dqm->dev = dev;
  2949		switch (dqm->sched_policy) {
  2950		case KFD_SCHED_POLICY_HWS:
  2951		case KFD_SCHED_POLICY_HWS_NO_OVERSUBSCRIPTION:
  2952			/* initialize dqm for cp scheduling */
  2953			dqm->ops.create_queue = create_queue_cpsch;
  2954			dqm->ops.initialize = initialize_cpsch;
  2955			dqm->ops.start = start_cpsch;
  2956			dqm->ops.stop = stop_cpsch;
  2957			dqm->ops.halt = halt_cpsch;
  2958			dqm->ops.unhalt = unhalt_cpsch;
  2959			dqm->ops.destroy_queue = destroy_queue_cpsch;
  2960			dqm->ops.update_queue = update_queue;
  2961			dqm->ops.register_process = register_process;
  2962			dqm->ops.unregister_process = unregister_process;
  2963			dqm->ops.uninitialize = uninitialize;
  2964			dqm->ops.create_kernel_queue = create_kernel_queue_cpsch;
  2965			dqm->ops.destroy_kernel_queue = destroy_kernel_queue_cpsch;
  2966			dqm->ops.set_cache_memory_policy = set_cache_memory_policy;
  2967			dqm->ops.process_termination = process_termination_cpsch;
  2968			dqm->ops.evict_process_queues = evict_process_queues_cpsch;
  2969			dqm->ops.restore_process_queues = restore_process_queues_cpsch;
  2970			dqm->ops.get_wave_state = get_wave_state;
  2971			dqm->ops.reset_queues = reset_queues_cpsch;
  2972			dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
  2973			dqm->ops.checkpoint_mqd = checkpoint_mqd;
  2974			break;
  2975		case KFD_SCHED_POLICY_NO_HWS:
  2976			/* initialize dqm for no cp scheduling */
  2977			dqm->ops.start = start_nocpsch;
  2978			dqm->ops.stop = stop_nocpsch;
  2979			dqm->ops.create_queue = create_queue_nocpsch;
  2980			dqm->ops.destroy_queue = destroy_queue_nocpsch;
  2981			dqm->ops.update_queue = update_queue;
  2982			dqm->ops.register_process = register_process;
  2983			dqm->ops.unregister_process = unregister_process;
  2984			dqm->ops.initialize = initialize_nocpsch;
  2985			dqm->ops.uninitialize = uninitialize;
  2986			dqm->ops.set_cache_memory_policy = set_cache_memory_policy;
  2987			dqm->ops.process_termination = process_termination_nocpsch;
  2988			dqm->ops.evict_process_queues = evict_process_queues_nocpsch;
  2989			dqm->ops.restore_process_queues =
  2990				restore_process_queues_nocpsch;
  2991			dqm->ops.get_wave_state = get_wave_state;
  2992			dqm->ops.get_queue_checkpoint_info = get_queue_checkpoint_info;
  2993			dqm->ops.checkpoint_mqd = checkpoint_mqd;
  2994			break;
  2995		default:
  2996			dev_err(dev->adev->dev, "Invalid scheduling policy %d\n", dqm->sched_policy);
  2997			goto out_free;
  2998		}
  2999	
  3000		switch (dev->adev->asic_type) {
  3001		case CHIP_KAVERI:
  3002		case CHIP_HAWAII:
  3003			device_queue_manager_init_cik(&dqm->asic_ops);
  3004			break;
  3005	
  3006		case CHIP_CARRIZO:
  3007		case CHIP_TONGA:
  3008		case CHIP_FIJI:
  3009		case CHIP_POLARIS10:
  3010		case CHIP_POLARIS11:
  3011		case CHIP_POLARIS12:
  3012		case CHIP_VEGAM:
  3013			device_queue_manager_init_vi(&dqm->asic_ops);
  3014			break;
  3015	
  3016		default:
  3017			if (KFD_GC_VERSION(dev) >= IP_VERSION(12, 0, 0))
  3018				device_queue_manager_init_v12(&dqm->asic_ops);
  3019			else if (KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0))
  3020				device_queue_manager_init_v11(&dqm->asic_ops);
  3021			else if (KFD_GC_VERSION(dev) >= IP_VERSION(10, 1, 1))
  3022				device_queue_manager_init_v10(&dqm->asic_ops);
  3023			else if (KFD_GC_VERSION(dev) >= IP_VERSION(9, 0, 1))
  3024				device_queue_manager_init_v9(&dqm->asic_ops);
  3025			else {
  3026				WARN(1, "Unexpected ASIC family %u",
  3027				     dev->adev->asic_type);
  3028				goto out_free;
  3029			}
  3030		}
  3031	
  3032		if (init_mqd_managers(dqm))
  3033			goto out_free;
  3034	
  3035		if (!dev->kfd->shared_resources.enable_mes && allocate_hiq_sdma_mqd(dqm)) {
  3036			dev_err(dev->adev->dev, "Failed to allocate hiq sdma mqd trunk buffer\n");
  3037			goto out_free;
  3038		}
  3039	
  3040		if (!dqm->ops.initialize(dqm)) {
  3041			init_waitqueue_head(&dqm->destroy_wait);
  3042			return dqm;
  3043		}
  3044	
  3045		if (!dev->kfd->shared_resources.enable_mes)
> 3046			deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
  3047	
  3048	out_free:
  3049		kfree(dqm);
  3050		return NULL;
  3051	}
  3052	
> 3053	static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
  3054					    struct kfd_mem_obj *mqd)
  3055	{
  3056		WARN(!mqd, "No hiq sdma mqd trunk to free");
  3057	
  3058		amdgpu_amdkfd_free_gtt_mem(dev->adev, &mqd->gtt_mem);
  3059	}
  3060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
