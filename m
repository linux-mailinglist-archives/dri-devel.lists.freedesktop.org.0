Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD19A0533
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA1E10E0C9;
	Wed, 16 Oct 2024 09:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6qlyN58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9E810E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729070189; x=1760606189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=onyxEH1KISQiqYJGLI7raCS1+ZwS7w8hY8gPJibtVYU=;
 b=D6qlyN58D5ttLjFsX9ChAzE0eWa2nAfEoqgQm34QL70KwGkxLYkhkXY2
 TBkdquc99GX+cvFLvk3TgbJcs6DBrJxzIUJ6Epd0zfZDrODKOJK4s35Qo
 ENZi5XZdo3/MTvEBCYgDQJYEWBGeZycb74pdWwMbraqvATkFKpGZpSlLZ
 NC9HNti9fI8SHIugGWEoXLL/GGjhdSO8VH1rMJf2tnU5u+keaUv0TTcCR
 ntWCgPE7QCIxuEsUoK12TNiB0KEZJx++eI++wwQ24nyljy99rsrd6vNBp
 CakBIoHqXOviNkBbk51s09sDCuAafzyqAuhLxQln/0MuVYYxeNMx1GJia Q==;
X-CSE-ConnectionGUID: Zs6PiUvpSF+Zd4lNMi/2gg==
X-CSE-MsgGUID: RtGF/ntiSTuZ/AdxVVg9nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28707681"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="28707681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 02:15:06 -0700
X-CSE-ConnectionGUID: 1MK7xEv8RT2+CXCKAsHcxw==
X-CSE-MsgGUID: lNK2xPKSR/aLm2sD7BaYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78517618"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 02:15:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t107P-000Kfj-2u;
 Wed, 16 Oct 2024 09:14:59 +0000
Date: Wed, 16 Oct 2024 17:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panthor: Rreset device and load FW after failed
 PM suspend
Message-ID: <202410161634.8YjhTQM2-lkp@intel.com>
References: <20241011225906.3789965-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241011225906.3789965-3-adrian.larumbe@collabora.com>
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

Hi Adrián,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Retry-OPP-transition-to-suspension-state-a-few-times/20241012-070112
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241011225906.3789965-3-adrian.larumbe%40collabora.com
patch subject: [PATCH 3/3] drm/panthor: Rreset device and load FW after failed PM suspend
config: i386-buildonly-randconfig-001-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161634.8YjhTQM2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161634.8YjhTQM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161634.8YjhTQM2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_sched.c:3104:29: error: no member named 'runtime_error' in 'struct dev_pm_info'
    3104 |         if (ptdev->base.dev->power.runtime_error) {
         |             ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/gpu/drm/panthor/panthor_sched.c:3104:29: error: no member named 'runtime_error' in 'struct dev_pm_info'
    3104 |         if (ptdev->base.dev->power.runtime_error) {
         |             ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
>> drivers/gpu/drm/panthor/panthor_sched.c:3104:29: error: no member named 'runtime_error' in 'struct dev_pm_info'
    3104 |         if (ptdev->base.dev->power.runtime_error) {
         |             ~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   3 errors generated.


vim +3104 drivers/gpu/drm/panthor/panthor_sched.c

  3081	
  3082	static struct dma_fence *
  3083	queue_run_job(struct drm_sched_job *sched_job)
  3084	{
  3085		struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
  3086		struct panthor_group *group = job->group;
  3087		struct panthor_queue *queue = group->queues[job->queue_idx];
  3088		struct panthor_device *ptdev = group->ptdev;
  3089		struct panthor_scheduler *sched = ptdev->scheduler;
  3090		struct panthor_job_ringbuf_instrs instrs;
  3091		struct panthor_job_cs_params cs_params;
  3092		struct dma_fence *done_fence;
  3093		int ret;
  3094	
  3095		/* Stream size is zero, nothing to do except making sure all previously
  3096		 * submitted jobs are done before we signal the
  3097		 * drm_sched_job::s_fence::finished fence.
  3098		 */
  3099		if (!job->call_info.size) {
  3100			job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
  3101			return dma_fence_get(job->done_fence);
  3102		}
  3103	
> 3104		if (ptdev->base.dev->power.runtime_error) {
  3105			ret = panthor_device_reset_sync(ptdev);
  3106			if (drm_WARN_ON(&ptdev->base, ret))
  3107				return ERR_PTR(ret);
  3108			drm_WARN_ON(&ptdev->base, pm_runtime_set_active(ptdev->base.dev));
  3109		}
  3110	
  3111		ret = pm_runtime_resume_and_get(ptdev->base.dev);
  3112		if (drm_WARN_ON(&ptdev->base, ret))
  3113			return ERR_PTR(ret);
  3114	
  3115		mutex_lock(&sched->lock);
  3116		if (!group_can_run(group)) {
  3117			done_fence = ERR_PTR(-ECANCELED);
  3118			goto out_unlock;
  3119		}
  3120	
  3121		dma_fence_init(job->done_fence,
  3122			       &panthor_queue_fence_ops,
  3123			       &queue->fence_ctx.lock,
  3124			       queue->fence_ctx.id,
  3125			       atomic64_inc_return(&queue->fence_ctx.seqno));
  3126	
  3127		job->profiling.slot = queue->profiling.seqno++;
  3128		if (queue->profiling.seqno == queue->profiling.slot_count)
  3129			queue->profiling.seqno = 0;
  3130	
  3131		job->ringbuf.start = queue->iface.input->insert;
  3132	
  3133		get_job_cs_params(job, &cs_params);
  3134		prepare_job_instrs(&cs_params, &instrs);
  3135		copy_instrs_to_ringbuf(queue, job, &instrs);
  3136	
  3137		job->ringbuf.end = job->ringbuf.start + (instrs.count * sizeof(u64));
  3138	
  3139		panthor_job_get(&job->base);
  3140		spin_lock(&queue->fence_ctx.lock);
  3141		list_add_tail(&job->node, &queue->fence_ctx.in_flight_jobs);
  3142		spin_unlock(&queue->fence_ctx.lock);
  3143	
  3144		/* Make sure the ring buffer is updated before the INSERT
  3145		 * register.
  3146		 */
  3147		wmb();
  3148	
  3149		queue->iface.input->extract = queue->iface.output->extract;
  3150		queue->iface.input->insert = job->ringbuf.end;
  3151	
  3152		if (group->csg_id < 0) {
  3153			/* If the queue is blocked, we want to keep the timeout running, so we
  3154			 * can detect unbounded waits and kill the group when that happens.
  3155			 * Otherwise, we suspend the timeout so the time we spend waiting for
  3156			 * a CSG slot is not counted.
  3157			 */
  3158			if (!(group->blocked_queues & BIT(job->queue_idx)) &&
  3159			    !queue->timeout_suspended) {
  3160				queue->remaining_time = drm_sched_suspend_timeout(&queue->scheduler);
  3161				queue->timeout_suspended = true;
  3162			}
  3163	
  3164			group_schedule_locked(group, BIT(job->queue_idx));
  3165		} else {
  3166			gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
  3167			if (!sched->pm.has_ref &&
  3168			    !(group->blocked_queues & BIT(job->queue_idx))) {
  3169				pm_runtime_get(ptdev->base.dev);
  3170				sched->pm.has_ref = true;
  3171			}
  3172			panthor_devfreq_record_busy(sched->ptdev);
  3173		}
  3174	
  3175		/* Update the last fence. */
  3176		dma_fence_put(queue->fence_ctx.last_fence);
  3177		queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
  3178	
  3179		done_fence = dma_fence_get(job->done_fence);
  3180	
  3181	out_unlock:
  3182		mutex_unlock(&sched->lock);
  3183		pm_runtime_mark_last_busy(ptdev->base.dev);
  3184		pm_runtime_put_autosuspend(ptdev->base.dev);
  3185	
  3186		return done_fence;
  3187	}
  3188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
