Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F010BA57B9B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 16:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E2710E22F;
	Sat,  8 Mar 2025 15:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQB8Rps6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE7A10E22F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741447946; x=1772983946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aCOCEpaVH+30HX17q9jqaxGS78kFjRKje/JxKl7RuUM=;
 b=cQB8Rps68MNYK4JhYy0beG5tMFlAhS1q+6F2NaRZR+cXQGE1nuT0u0g4
 fcm8+pUprCFshJ6U2XRduh15+14oMj6LcaJsfeiJdWcgbdxNbL4B4LPcK
 7svYOKGZLiqq5cCzYIjg0Q8NVok4+NInZbiRQih4ZAeBEJscxaIzd8zwV
 T3SshSlE5p0ywADESkMAJjhjP5NZ1jOZ3kitcE2JtCv+yFcQI2Tr6PDi/
 Enw0uEVPDhtXm1PkYVrK7HrSEsZkRNrGwXCktKd4iiTB47rgAD4MtcMMN
 MhTy82lr8NllureSamQs6TZ1EJaXU7I9MawujNX6EppkXjOLuR81KapzT w==;
X-CSE-ConnectionGUID: FyPtJxuETEG8mI7G83Wa9g==
X-CSE-MsgGUID: cq3t0aVlQ+eaTzb2L6UiEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46267546"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; d="scan'208";a="46267546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 07:32:18 -0800
X-CSE-ConnectionGUID: uRZAX0p3TsWFdU5HyAQX1Q==
X-CSE-MsgGUID: RME2FdVjTquzI4fs7BboIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150526792"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2025 07:32:14 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tqw9r-0001zz-2x;
 Sat, 08 Mar 2025 15:32:11 +0000
Date: Sat, 8 Mar 2025 23:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Make the timeout per-queue instead of per-job
Message-ID: <202503082339.3TzIrrex-lkp@intel.com>
References: <20250307155556.173494-1-ashley.smith@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307155556.173494-1-ashley.smith@collabora.com>
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

Hi Ashley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b72f66f22c0e39ae6684c43fead774c13db24e73]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashley-Smith/drm-panthor-Make-the-timeout-per-queue-instead-of-per-job/20250307-235830
base:   b72f66f22c0e39ae6684c43fead774c13db24e73
patch link:    https://lore.kernel.org/r/20250307155556.173494-1-ashley.smith%40collabora.com
patch subject: [PATCH] drm/panthor: Make the timeout per-queue instead of per-job
config: i386-buildonly-randconfig-004-20250308 (https://download.01.org/0day-ci/archive/20250308/202503082339.3TzIrrex-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503082339.3TzIrrex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082339.3TzIrrex-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:318: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
>> drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'remaining' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'slots' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:493: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:702: warning: Excess struct member 'data' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'mask' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:838: warning: Excess struct member 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1832: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1832: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:2712: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +493 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d0 Boris Brezillon 2024-02-29  147  
de85488138247d0 Boris Brezillon 2024-02-29  148  /**
de85488138247d0 Boris Brezillon 2024-02-29  149   * struct panthor_scheduler - Object used to manage the scheduler
de85488138247d0 Boris Brezillon 2024-02-29  150   */
de85488138247d0 Boris Brezillon 2024-02-29  151  struct panthor_scheduler {
de85488138247d0 Boris Brezillon 2024-02-29  152  	/** @ptdev: Device. */
de85488138247d0 Boris Brezillon 2024-02-29  153  	struct panthor_device *ptdev;
de85488138247d0 Boris Brezillon 2024-02-29  154  
de85488138247d0 Boris Brezillon 2024-02-29  155  	/**
de85488138247d0 Boris Brezillon 2024-02-29  156  	 * @wq: Workqueue used by our internal scheduler logic and
de85488138247d0 Boris Brezillon 2024-02-29  157  	 * drm_gpu_scheduler.
de85488138247d0 Boris Brezillon 2024-02-29  158  	 *
de85488138247d0 Boris Brezillon 2024-02-29  159  	 * Used for the scheduler tick, group update or other kind of FW
de85488138247d0 Boris Brezillon 2024-02-29  160  	 * event processing that can't be handled in the threaded interrupt
de85488138247d0 Boris Brezillon 2024-02-29  161  	 * path. Also passed to the drm_gpu_scheduler instances embedded
de85488138247d0 Boris Brezillon 2024-02-29  162  	 * in panthor_queue.
de85488138247d0 Boris Brezillon 2024-02-29  163  	 */
de85488138247d0 Boris Brezillon 2024-02-29  164  	struct workqueue_struct *wq;
de85488138247d0 Boris Brezillon 2024-02-29  165  
de85488138247d0 Boris Brezillon 2024-02-29  166  	/**
de85488138247d0 Boris Brezillon 2024-02-29  167  	 * @heap_alloc_wq: Workqueue used to schedule tiler_oom works.
de85488138247d0 Boris Brezillon 2024-02-29  168  	 *
de85488138247d0 Boris Brezillon 2024-02-29  169  	 * We have a queue dedicated to heap chunk allocation works to avoid
de85488138247d0 Boris Brezillon 2024-02-29  170  	 * blocking the rest of the scheduler if the allocation tries to
de85488138247d0 Boris Brezillon 2024-02-29  171  	 * reclaim memory.
de85488138247d0 Boris Brezillon 2024-02-29  172  	 */
de85488138247d0 Boris Brezillon 2024-02-29  173  	struct workqueue_struct *heap_alloc_wq;
de85488138247d0 Boris Brezillon 2024-02-29  174  
de85488138247d0 Boris Brezillon 2024-02-29  175  	/** @tick_work: Work executed on a scheduling tick. */
de85488138247d0 Boris Brezillon 2024-02-29  176  	struct delayed_work tick_work;
de85488138247d0 Boris Brezillon 2024-02-29  177  
de85488138247d0 Boris Brezillon 2024-02-29  178  	/**
de85488138247d0 Boris Brezillon 2024-02-29  179  	 * @sync_upd_work: Work used to process synchronization object updates.
de85488138247d0 Boris Brezillon 2024-02-29  180  	 *
de85488138247d0 Boris Brezillon 2024-02-29  181  	 * We use this work to unblock queues/groups that were waiting on a
de85488138247d0 Boris Brezillon 2024-02-29  182  	 * synchronization object.
de85488138247d0 Boris Brezillon 2024-02-29  183  	 */
de85488138247d0 Boris Brezillon 2024-02-29  184  	struct work_struct sync_upd_work;
de85488138247d0 Boris Brezillon 2024-02-29  185  
de85488138247d0 Boris Brezillon 2024-02-29  186  	/**
de85488138247d0 Boris Brezillon 2024-02-29  187  	 * @fw_events_work: Work used to process FW events outside the interrupt path.
de85488138247d0 Boris Brezillon 2024-02-29  188  	 *
de85488138247d0 Boris Brezillon 2024-02-29  189  	 * Even if the interrupt is threaded, we need any event processing
de85488138247d0 Boris Brezillon 2024-02-29  190  	 * that require taking the panthor_scheduler::lock to be processed
de85488138247d0 Boris Brezillon 2024-02-29  191  	 * outside the interrupt path so we don't block the tick logic when
de85488138247d0 Boris Brezillon 2024-02-29  192  	 * it calls panthor_fw_{csg,wait}_wait_acks(). Since most of the
de85488138247d0 Boris Brezillon 2024-02-29  193  	 * event processing requires taking this lock, we just delegate all
de85488138247d0 Boris Brezillon 2024-02-29  194  	 * FW event processing to the scheduler workqueue.
de85488138247d0 Boris Brezillon 2024-02-29  195  	 */
de85488138247d0 Boris Brezillon 2024-02-29  196  	struct work_struct fw_events_work;
de85488138247d0 Boris Brezillon 2024-02-29  197  
de85488138247d0 Boris Brezillon 2024-02-29  198  	/**
de85488138247d0 Boris Brezillon 2024-02-29  199  	 * @fw_events: Bitmask encoding pending FW events.
de85488138247d0 Boris Brezillon 2024-02-29  200  	 */
de85488138247d0 Boris Brezillon 2024-02-29  201  	atomic_t fw_events;
de85488138247d0 Boris Brezillon 2024-02-29  202  
de85488138247d0 Boris Brezillon 2024-02-29  203  	/**
de85488138247d0 Boris Brezillon 2024-02-29  204  	 * @resched_target: When the next tick should occur.
de85488138247d0 Boris Brezillon 2024-02-29  205  	 *
de85488138247d0 Boris Brezillon 2024-02-29  206  	 * Expressed in jiffies.
de85488138247d0 Boris Brezillon 2024-02-29  207  	 */
de85488138247d0 Boris Brezillon 2024-02-29  208  	u64 resched_target;
de85488138247d0 Boris Brezillon 2024-02-29  209  
de85488138247d0 Boris Brezillon 2024-02-29  210  	/**
de85488138247d0 Boris Brezillon 2024-02-29  211  	 * @last_tick: When the last tick occurred.
de85488138247d0 Boris Brezillon 2024-02-29  212  	 *
de85488138247d0 Boris Brezillon 2024-02-29  213  	 * Expressed in jiffies.
de85488138247d0 Boris Brezillon 2024-02-29  214  	 */
de85488138247d0 Boris Brezillon 2024-02-29  215  	u64 last_tick;
de85488138247d0 Boris Brezillon 2024-02-29  216  
de85488138247d0 Boris Brezillon 2024-02-29  217  	/** @tick_period: Tick period in jiffies. */
de85488138247d0 Boris Brezillon 2024-02-29  218  	u64 tick_period;
de85488138247d0 Boris Brezillon 2024-02-29  219  
de85488138247d0 Boris Brezillon 2024-02-29  220  	/**
de85488138247d0 Boris Brezillon 2024-02-29  221  	 * @lock: Lock protecting access to all the scheduler fields.
de85488138247d0 Boris Brezillon 2024-02-29  222  	 *
de85488138247d0 Boris Brezillon 2024-02-29  223  	 * Should be taken in the tick work, the irq handler, and anywhere the @groups
de85488138247d0 Boris Brezillon 2024-02-29  224  	 * fields are touched.
de85488138247d0 Boris Brezillon 2024-02-29  225  	 */
de85488138247d0 Boris Brezillon 2024-02-29  226  	struct mutex lock;
de85488138247d0 Boris Brezillon 2024-02-29  227  
de85488138247d0 Boris Brezillon 2024-02-29  228  	/** @groups: Various lists used to classify groups. */
de85488138247d0 Boris Brezillon 2024-02-29  229  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  230  		/**
de85488138247d0 Boris Brezillon 2024-02-29  231  		 * @runnable: Runnable group lists.
de85488138247d0 Boris Brezillon 2024-02-29  232  		 *
de85488138247d0 Boris Brezillon 2024-02-29  233  		 * When a group has queues that want to execute something,
de85488138247d0 Boris Brezillon 2024-02-29  234  		 * its panthor_group::run_node should be inserted here.
de85488138247d0 Boris Brezillon 2024-02-29  235  		 *
de85488138247d0 Boris Brezillon 2024-02-29  236  		 * One list per-priority.
de85488138247d0 Boris Brezillon 2024-02-29  237  		 */
de85488138247d0 Boris Brezillon 2024-02-29  238  		struct list_head runnable[PANTHOR_CSG_PRIORITY_COUNT];
de85488138247d0 Boris Brezillon 2024-02-29  239  
de85488138247d0 Boris Brezillon 2024-02-29  240  		/**
de85488138247d0 Boris Brezillon 2024-02-29  241  		 * @idle: Idle group lists.
de85488138247d0 Boris Brezillon 2024-02-29  242  		 *
de85488138247d0 Boris Brezillon 2024-02-29  243  		 * When all queues of a group are idle (either because they
de85488138247d0 Boris Brezillon 2024-02-29  244  		 * have nothing to execute, or because they are blocked), the
de85488138247d0 Boris Brezillon 2024-02-29  245  		 * panthor_group::run_node field should be inserted here.
de85488138247d0 Boris Brezillon 2024-02-29  246  		 *
de85488138247d0 Boris Brezillon 2024-02-29  247  		 * One list per-priority.
de85488138247d0 Boris Brezillon 2024-02-29  248  		 */
de85488138247d0 Boris Brezillon 2024-02-29  249  		struct list_head idle[PANTHOR_CSG_PRIORITY_COUNT];
de85488138247d0 Boris Brezillon 2024-02-29  250  
de85488138247d0 Boris Brezillon 2024-02-29  251  		/**
de85488138247d0 Boris Brezillon 2024-02-29  252  		 * @waiting: List of groups whose queues are blocked on a
de85488138247d0 Boris Brezillon 2024-02-29  253  		 * synchronization object.
de85488138247d0 Boris Brezillon 2024-02-29  254  		 *
de85488138247d0 Boris Brezillon 2024-02-29  255  		 * Insert panthor_group::wait_node here when a group is waiting
de85488138247d0 Boris Brezillon 2024-02-29  256  		 * for synchronization objects to be signaled.
de85488138247d0 Boris Brezillon 2024-02-29  257  		 *
de85488138247d0 Boris Brezillon 2024-02-29  258  		 * This list is evaluated in the @sync_upd_work work.
de85488138247d0 Boris Brezillon 2024-02-29  259  		 */
de85488138247d0 Boris Brezillon 2024-02-29  260  		struct list_head waiting;
de85488138247d0 Boris Brezillon 2024-02-29  261  	} groups;
de85488138247d0 Boris Brezillon 2024-02-29  262  
de85488138247d0 Boris Brezillon 2024-02-29  263  	/**
de85488138247d0 Boris Brezillon 2024-02-29  264  	 * @csg_slots: FW command stream group slots.
de85488138247d0 Boris Brezillon 2024-02-29  265  	 */
de85488138247d0 Boris Brezillon 2024-02-29  266  	struct panthor_csg_slot csg_slots[MAX_CSGS];
de85488138247d0 Boris Brezillon 2024-02-29  267  
de85488138247d0 Boris Brezillon 2024-02-29  268  	/** @csg_slot_count: Number of command stream group slots exposed by the FW. */
de85488138247d0 Boris Brezillon 2024-02-29  269  	u32 csg_slot_count;
de85488138247d0 Boris Brezillon 2024-02-29  270  
de85488138247d0 Boris Brezillon 2024-02-29  271  	/** @cs_slot_count: Number of command stream slot per group slot exposed by the FW. */
de85488138247d0 Boris Brezillon 2024-02-29  272  	u32 cs_slot_count;
de85488138247d0 Boris Brezillon 2024-02-29  273  
de85488138247d0 Boris Brezillon 2024-02-29  274  	/** @as_slot_count: Number of address space slots supported by the MMU. */
de85488138247d0 Boris Brezillon 2024-02-29  275  	u32 as_slot_count;
de85488138247d0 Boris Brezillon 2024-02-29  276  
de85488138247d0 Boris Brezillon 2024-02-29  277  	/** @used_csg_slot_count: Number of command stream group slot currently used. */
de85488138247d0 Boris Brezillon 2024-02-29  278  	u32 used_csg_slot_count;
de85488138247d0 Boris Brezillon 2024-02-29  279  
de85488138247d0 Boris Brezillon 2024-02-29  280  	/** @sb_slot_count: Number of scoreboard slots. */
de85488138247d0 Boris Brezillon 2024-02-29  281  	u32 sb_slot_count;
de85488138247d0 Boris Brezillon 2024-02-29  282  
de85488138247d0 Boris Brezillon 2024-02-29  283  	/**
de85488138247d0 Boris Brezillon 2024-02-29  284  	 * @might_have_idle_groups: True if an active group might have become idle.
de85488138247d0 Boris Brezillon 2024-02-29  285  	 *
de85488138247d0 Boris Brezillon 2024-02-29  286  	 * This will force a tick, so other runnable groups can be scheduled if one
de85488138247d0 Boris Brezillon 2024-02-29  287  	 * or more active groups became idle.
de85488138247d0 Boris Brezillon 2024-02-29  288  	 */
de85488138247d0 Boris Brezillon 2024-02-29  289  	bool might_have_idle_groups;
de85488138247d0 Boris Brezillon 2024-02-29  290  
de85488138247d0 Boris Brezillon 2024-02-29  291  	/** @pm: Power management related fields. */
de85488138247d0 Boris Brezillon 2024-02-29  292  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  293  		/** @has_ref: True if the scheduler owns a runtime PM reference. */
de85488138247d0 Boris Brezillon 2024-02-29  294  		bool has_ref;
de85488138247d0 Boris Brezillon 2024-02-29  295  	} pm;
de85488138247d0 Boris Brezillon 2024-02-29  296  
de85488138247d0 Boris Brezillon 2024-02-29  297  	/** @reset: Reset related fields. */
de85488138247d0 Boris Brezillon 2024-02-29  298  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  299  		/** @lock: Lock protecting the other reset fields. */
de85488138247d0 Boris Brezillon 2024-02-29  300  		struct mutex lock;
de85488138247d0 Boris Brezillon 2024-02-29  301  
de85488138247d0 Boris Brezillon 2024-02-29  302  		/**
de85488138247d0 Boris Brezillon 2024-02-29  303  		 * @in_progress: True if a reset is in progress.
de85488138247d0 Boris Brezillon 2024-02-29  304  		 *
de85488138247d0 Boris Brezillon 2024-02-29  305  		 * Set to true in panthor_sched_pre_reset() and back to false in
de85488138247d0 Boris Brezillon 2024-02-29  306  		 * panthor_sched_post_reset().
de85488138247d0 Boris Brezillon 2024-02-29  307  		 */
de85488138247d0 Boris Brezillon 2024-02-29  308  		atomic_t in_progress;
de85488138247d0 Boris Brezillon 2024-02-29  309  
de85488138247d0 Boris Brezillon 2024-02-29  310  		/**
de85488138247d0 Boris Brezillon 2024-02-29  311  		 * @stopped_groups: List containing all groups that were stopped
de85488138247d0 Boris Brezillon 2024-02-29  312  		 * before a reset.
de85488138247d0 Boris Brezillon 2024-02-29  313  		 *
de85488138247d0 Boris Brezillon 2024-02-29  314  		 * Insert panthor_group::run_node in the pre_reset path.
de85488138247d0 Boris Brezillon 2024-02-29  315  		 */
de85488138247d0 Boris Brezillon 2024-02-29  316  		struct list_head stopped_groups;
de85488138247d0 Boris Brezillon 2024-02-29  317  	} reset;
de85488138247d0 Boris Brezillon 2024-02-29 @318  };
de85488138247d0 Boris Brezillon 2024-02-29  319  
de85488138247d0 Boris Brezillon 2024-02-29  320  /**
de85488138247d0 Boris Brezillon 2024-02-29  321   * struct panthor_syncobj_32b - 32-bit FW synchronization object
de85488138247d0 Boris Brezillon 2024-02-29  322   */
de85488138247d0 Boris Brezillon 2024-02-29  323  struct panthor_syncobj_32b {
de85488138247d0 Boris Brezillon 2024-02-29  324  	/** @seqno: Sequence number. */
de85488138247d0 Boris Brezillon 2024-02-29  325  	u32 seqno;
de85488138247d0 Boris Brezillon 2024-02-29  326  
de85488138247d0 Boris Brezillon 2024-02-29  327  	/**
de85488138247d0 Boris Brezillon 2024-02-29  328  	 * @status: Status.
de85488138247d0 Boris Brezillon 2024-02-29  329  	 *
de85488138247d0 Boris Brezillon 2024-02-29  330  	 * Not zero on failure.
de85488138247d0 Boris Brezillon 2024-02-29  331  	 */
de85488138247d0 Boris Brezillon 2024-02-29  332  	u32 status;
de85488138247d0 Boris Brezillon 2024-02-29  333  };
de85488138247d0 Boris Brezillon 2024-02-29  334  
de85488138247d0 Boris Brezillon 2024-02-29  335  /**
de85488138247d0 Boris Brezillon 2024-02-29  336   * struct panthor_syncobj_64b - 64-bit FW synchronization object
de85488138247d0 Boris Brezillon 2024-02-29  337   */
de85488138247d0 Boris Brezillon 2024-02-29  338  struct panthor_syncobj_64b {
de85488138247d0 Boris Brezillon 2024-02-29  339  	/** @seqno: Sequence number. */
de85488138247d0 Boris Brezillon 2024-02-29  340  	u64 seqno;
de85488138247d0 Boris Brezillon 2024-02-29  341  
de85488138247d0 Boris Brezillon 2024-02-29  342  	/**
de85488138247d0 Boris Brezillon 2024-02-29  343  	 * @status: Status.
de85488138247d0 Boris Brezillon 2024-02-29  344  	 *
de85488138247d0 Boris Brezillon 2024-02-29  345  	 * Not zero on failure.
de85488138247d0 Boris Brezillon 2024-02-29  346  	 */
de85488138247d0 Boris Brezillon 2024-02-29  347  	u32 status;
de85488138247d0 Boris Brezillon 2024-02-29  348  
de85488138247d0 Boris Brezillon 2024-02-29  349  	/** @pad: MBZ. */
de85488138247d0 Boris Brezillon 2024-02-29  350  	u32 pad;
de85488138247d0 Boris Brezillon 2024-02-29  351  };
de85488138247d0 Boris Brezillon 2024-02-29  352  
de85488138247d0 Boris Brezillon 2024-02-29  353  /**
de85488138247d0 Boris Brezillon 2024-02-29  354   * struct panthor_queue - Execution queue
de85488138247d0 Boris Brezillon 2024-02-29  355   */
de85488138247d0 Boris Brezillon 2024-02-29  356  struct panthor_queue {
de85488138247d0 Boris Brezillon 2024-02-29  357  	/** @scheduler: DRM scheduler used for this queue. */
de85488138247d0 Boris Brezillon 2024-02-29  358  	struct drm_gpu_scheduler scheduler;
de85488138247d0 Boris Brezillon 2024-02-29  359  
de85488138247d0 Boris Brezillon 2024-02-29  360  	/** @entity: DRM scheduling entity used for this queue. */
de85488138247d0 Boris Brezillon 2024-02-29  361  	struct drm_sched_entity entity;
de85488138247d0 Boris Brezillon 2024-02-29  362  
b571025809e4350 Ashley Smith    2025-03-07  363  	/** @timeout: Queue timeout related fields. */
b571025809e4350 Ashley Smith    2025-03-07  364  	struct {
b571025809e4350 Ashley Smith    2025-03-07  365  		/** @timeout.work: Work executed when a queue timeout occurs. */
b571025809e4350 Ashley Smith    2025-03-07  366  		struct delayed_work work;
b571025809e4350 Ashley Smith    2025-03-07  367  
de85488138247d0 Boris Brezillon 2024-02-29  368  		/**
b571025809e4350 Ashley Smith    2025-03-07  369  		 * @remaining: Time remaining before a queue timeout.
de85488138247d0 Boris Brezillon 2024-02-29  370  		 *
b571025809e4350 Ashley Smith    2025-03-07  371  		 * When the timer is running, this value is set to MAX_SCHEDULE_TIMEOUT.
b571025809e4350 Ashley Smith    2025-03-07  372  		 * When the timer is suspended, it's set to the time remaining when the
b571025809e4350 Ashley Smith    2025-03-07  373  		 * timer was suspended.
de85488138247d0 Boris Brezillon 2024-02-29  374  		 */
b571025809e4350 Ashley Smith    2025-03-07  375  		unsigned long remaining;
b571025809e4350 Ashley Smith    2025-03-07  376  	} timeout;
de85488138247d0 Boris Brezillon 2024-02-29  377  
de85488138247d0 Boris Brezillon 2024-02-29  378  	/**
de85488138247d0 Boris Brezillon 2024-02-29  379  	 * @doorbell_id: Doorbell assigned to this queue.
de85488138247d0 Boris Brezillon 2024-02-29  380  	 *
de85488138247d0 Boris Brezillon 2024-02-29  381  	 * Right now, all groups share the same doorbell, and the doorbell ID
de85488138247d0 Boris Brezillon 2024-02-29  382  	 * is assigned to group_slot + 1 when the group is assigned a slot. But
de85488138247d0 Boris Brezillon 2024-02-29  383  	 * we might decide to provide fine grained doorbell assignment at some
de85488138247d0 Boris Brezillon 2024-02-29  384  	 * point, so don't have to wake up all queues in a group every time one
de85488138247d0 Boris Brezillon 2024-02-29  385  	 * of them is updated.
de85488138247d0 Boris Brezillon 2024-02-29  386  	 */
de85488138247d0 Boris Brezillon 2024-02-29  387  	u8 doorbell_id;
de85488138247d0 Boris Brezillon 2024-02-29  388  
de85488138247d0 Boris Brezillon 2024-02-29  389  	/**
de85488138247d0 Boris Brezillon 2024-02-29  390  	 * @priority: Priority of the queue inside the group.
de85488138247d0 Boris Brezillon 2024-02-29  391  	 *
de85488138247d0 Boris Brezillon 2024-02-29  392  	 * Must be less than 16 (Only 4 bits available).
de85488138247d0 Boris Brezillon 2024-02-29  393  	 */
de85488138247d0 Boris Brezillon 2024-02-29  394  	u8 priority;
de85488138247d0 Boris Brezillon 2024-02-29  395  #define CSF_MAX_QUEUE_PRIO	GENMASK(3, 0)
de85488138247d0 Boris Brezillon 2024-02-29  396  
de85488138247d0 Boris Brezillon 2024-02-29  397  	/** @ringbuf: Command stream ring-buffer. */
de85488138247d0 Boris Brezillon 2024-02-29  398  	struct panthor_kernel_bo *ringbuf;
de85488138247d0 Boris Brezillon 2024-02-29  399  
de85488138247d0 Boris Brezillon 2024-02-29  400  	/** @iface: Firmware interface. */
de85488138247d0 Boris Brezillon 2024-02-29  401  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  402  		/** @mem: FW memory allocated for this interface. */
de85488138247d0 Boris Brezillon 2024-02-29  403  		struct panthor_kernel_bo *mem;
de85488138247d0 Boris Brezillon 2024-02-29  404  
de85488138247d0 Boris Brezillon 2024-02-29  405  		/** @input: Input interface. */
de85488138247d0 Boris Brezillon 2024-02-29  406  		struct panthor_fw_ringbuf_input_iface *input;
de85488138247d0 Boris Brezillon 2024-02-29  407  
de85488138247d0 Boris Brezillon 2024-02-29  408  		/** @output: Output interface. */
de85488138247d0 Boris Brezillon 2024-02-29  409  		const struct panthor_fw_ringbuf_output_iface *output;
de85488138247d0 Boris Brezillon 2024-02-29  410  
de85488138247d0 Boris Brezillon 2024-02-29  411  		/** @input_fw_va: FW virtual address of the input interface buffer. */
de85488138247d0 Boris Brezillon 2024-02-29  412  		u32 input_fw_va;
de85488138247d0 Boris Brezillon 2024-02-29  413  
de85488138247d0 Boris Brezillon 2024-02-29  414  		/** @output_fw_va: FW virtual address of the output interface buffer. */
de85488138247d0 Boris Brezillon 2024-02-29  415  		u32 output_fw_va;
de85488138247d0 Boris Brezillon 2024-02-29  416  	} iface;
de85488138247d0 Boris Brezillon 2024-02-29  417  
de85488138247d0 Boris Brezillon 2024-02-29  418  	/**
de85488138247d0 Boris Brezillon 2024-02-29  419  	 * @syncwait: Stores information about the synchronization object this
de85488138247d0 Boris Brezillon 2024-02-29  420  	 * queue is waiting on.
de85488138247d0 Boris Brezillon 2024-02-29  421  	 */
de85488138247d0 Boris Brezillon 2024-02-29  422  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  423  		/** @gpu_va: GPU address of the synchronization object. */
de85488138247d0 Boris Brezillon 2024-02-29  424  		u64 gpu_va;
de85488138247d0 Boris Brezillon 2024-02-29  425  
de85488138247d0 Boris Brezillon 2024-02-29  426  		/** @ref: Reference value to compare against. */
de85488138247d0 Boris Brezillon 2024-02-29  427  		u64 ref;
de85488138247d0 Boris Brezillon 2024-02-29  428  
de85488138247d0 Boris Brezillon 2024-02-29  429  		/** @gt: True if this is a greater-than test. */
de85488138247d0 Boris Brezillon 2024-02-29  430  		bool gt;
de85488138247d0 Boris Brezillon 2024-02-29  431  
de85488138247d0 Boris Brezillon 2024-02-29  432  		/** @sync64: True if this is a 64-bit sync object. */
de85488138247d0 Boris Brezillon 2024-02-29  433  		bool sync64;
de85488138247d0 Boris Brezillon 2024-02-29  434  
de85488138247d0 Boris Brezillon 2024-02-29  435  		/** @bo: Buffer object holding the synchronization object. */
de85488138247d0 Boris Brezillon 2024-02-29  436  		struct drm_gem_object *obj;
de85488138247d0 Boris Brezillon 2024-02-29  437  
de85488138247d0 Boris Brezillon 2024-02-29  438  		/** @offset: Offset of the synchronization object inside @bo. */
de85488138247d0 Boris Brezillon 2024-02-29  439  		u64 offset;
de85488138247d0 Boris Brezillon 2024-02-29  440  
de85488138247d0 Boris Brezillon 2024-02-29  441  		/**
de85488138247d0 Boris Brezillon 2024-02-29  442  		 * @kmap: Kernel mapping of the buffer object holding the
de85488138247d0 Boris Brezillon 2024-02-29  443  		 * synchronization object.
de85488138247d0 Boris Brezillon 2024-02-29  444  		 */
de85488138247d0 Boris Brezillon 2024-02-29  445  		void *kmap;
de85488138247d0 Boris Brezillon 2024-02-29  446  	} syncwait;
de85488138247d0 Boris Brezillon 2024-02-29  447  
de85488138247d0 Boris Brezillon 2024-02-29  448  	/** @fence_ctx: Fence context fields. */
de85488138247d0 Boris Brezillon 2024-02-29  449  	struct {
de85488138247d0 Boris Brezillon 2024-02-29  450  		/** @lock: Used to protect access to all fences allocated by this context. */
de85488138247d0 Boris Brezillon 2024-02-29  451  		spinlock_t lock;
de85488138247d0 Boris Brezillon 2024-02-29  452  
de85488138247d0 Boris Brezillon 2024-02-29  453  		/**
de85488138247d0 Boris Brezillon 2024-02-29  454  		 * @id: Fence context ID.
de85488138247d0 Boris Brezillon 2024-02-29  455  		 *
de85488138247d0 Boris Brezillon 2024-02-29  456  		 * Allocated with dma_fence_context_alloc().
de85488138247d0 Boris Brezillon 2024-02-29  457  		 */
de85488138247d0 Boris Brezillon 2024-02-29  458  		u64 id;
de85488138247d0 Boris Brezillon 2024-02-29  459  
de85488138247d0 Boris Brezillon 2024-02-29  460  		/** @seqno: Sequence number of the last initialized fence. */
de85488138247d0 Boris Brezillon 2024-02-29  461  		atomic64_t seqno;
de85488138247d0 Boris Brezillon 2024-02-29  462  
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  463  		/**
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  464  		 * @last_fence: Fence of the last submitted job.
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  465  		 *
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  466  		 * We return this fence when we get an empty command stream.
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  467  		 * This way, we are guaranteed that all earlier jobs have completed
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  468  		 * when drm_sched_job::s_fence::finished without having to feed
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  469  		 * the CS ring buffer with a dummy job that only signals the fence.
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  470  		 */
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  471  		struct dma_fence *last_fence;
7b6f9ec6ad51125 Boris Brezillon 2024-07-03  472  
de85488138247d0 Boris Brezillon 2024-02-29  473  		/**
de85488138247d0 Boris Brezillon 2024-02-29  474  		 * @in_flight_jobs: List containing all in-flight jobs.
de85488138247d0 Boris Brezillon 2024-02-29  475  		 *
de85488138247d0 Boris Brezillon 2024-02-29  476  		 * Used to keep track and signal panthor_job::done_fence when the
de85488138247d0 Boris Brezillon 2024-02-29  477  		 * synchronization object attached to the queue is signaled.
de85488138247d0 Boris Brezillon 2024-02-29  478  		 */
de85488138247d0 Boris Brezillon 2024-02-29  479  		struct list_head in_flight_jobs;
de85488138247d0 Boris Brezillon 2024-02-29  480  	} fence_ctx;
f8ff51a47084517 Adrián Larumbe  2024-09-24  481  
f8ff51a47084517 Adrián Larumbe  2024-09-24  482  	/** @profiling: Job profiling data slots and access information. */
f8ff51a47084517 Adrián Larumbe  2024-09-24  483  	struct {
f8ff51a47084517 Adrián Larumbe  2024-09-24  484  		/** @slots: Kernel BO holding the slots. */
f8ff51a47084517 Adrián Larumbe  2024-09-24  485  		struct panthor_kernel_bo *slots;
f8ff51a47084517 Adrián Larumbe  2024-09-24  486  
f8ff51a47084517 Adrián Larumbe  2024-09-24  487  		/** @slot_count: Number of jobs ringbuffer can hold at once. */
f8ff51a47084517 Adrián Larumbe  2024-09-24  488  		u32 slot_count;
f8ff51a47084517 Adrián Larumbe  2024-09-24  489  
f8ff51a47084517 Adrián Larumbe  2024-09-24  490  		/** @seqno: Index of the next available profiling information slot. */
f8ff51a47084517 Adrián Larumbe  2024-09-24  491  		u32 seqno;
f8ff51a47084517 Adrián Larumbe  2024-09-24  492  	} profiling;
de85488138247d0 Boris Brezillon 2024-02-29 @493  };
de85488138247d0 Boris Brezillon 2024-02-29  494  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
