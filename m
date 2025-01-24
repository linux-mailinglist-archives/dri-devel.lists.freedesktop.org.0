Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C5A1B530
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798F310E002;
	Fri, 24 Jan 2025 12:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erBPIjy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116E710E002
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737720401; x=1769256401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FlsHX7XKI6oH9V/UmwN26+YBU8lwk7xjRh/EqJQ/HIA=;
 b=erBPIjy6dytPkVvWS/iIlqr3kS+RZq5LFUI9veR9jDvo00YmNpB7YR71
 gQuip32u9hkBORSSsiHH/8mVN1waMJmn1OlKaR7SK7EXtj5v0d+Iq0LHc
 IFzQbMTcCcbtMP6HNbWV+Uv3yTiIMfXrGQrCXT9BuBxqxPMCoenuhcX30
 m7Z/JIEjnuhyyLI3fjSqYIYyHD6s7kVcOSYjgBxDKDZylKgKQO5D0pt6H
 FFmXsvdhWccrjJQXlOEnHw6xi0i7G3OVOBFLKRk104ELKbmtmHIRE9sDE
 jRjxn9d37pLRv1HYrMeRONIRcwSSO9rT72A/h8yW9BUUwCqhiCV477sbC Q==;
X-CSE-ConnectionGUID: RxubBtymQC29o2o6pqiDjA==
X-CSE-MsgGUID: OXcS6eA1SfmbPUHvznnqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63603979"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="63603979"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:06:40 -0800
X-CSE-ConnectionGUID: SNVz+z9wREqH87SSJT8xzA==
X-CSE-MsgGUID: 9UTJgMD4Q8iLxqG4l0Z5iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112703979"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 24 Jan 2025 04:06:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tbISI-000ceZ-0i;
 Fri, 24 Jan 2025 12:06:34 +0000
Date: Fri, 24 Jan 2025 20:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v9 3/5] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <202501241937.7HbajZjV-lkp@intel.com>
References: <20250123225325.3271764-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123225325.3271764-4-adrian.larumbe@collabora.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on c6eabbab359c156669e10d5dec3e71e80ff09bd2]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/Documentation-gpu-Clarify-format-of-driver-specific-fidnfo-keys/20250124-065603
base:   c6eabbab359c156669e10d5dec3e71e80ff09bd2
patch link:    https://lore.kernel.org/r/20250123225325.3271764-4-adrian.larumbe%40collabora.com
patch subject: [PATCH v9 3/5] drm/panthor: Expose size of driver internal BO's over fdinfo
config: i386-buildonly-randconfig-005-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241937.7HbajZjV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241937.7HbajZjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241937.7HbajZjV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:320: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'slots' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:492: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:691: warning: Excess struct member 'data' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:691: warning: Excess struct member 'lock' description in 'panthor_group'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'mask' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:827: warning: Excess struct member 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1756: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1756: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:2649: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'
>> drivers/gpu/drm/panthor/panthor_sched.c:3646: warning: expecting prototype for panthor_group_kbo_sizes(). Prototype was for panthor_fdinfo_gather_group_mem_info() instead


vim +3646 drivers/gpu/drm/panthor/panthor_sched.c

  3635	
  3636	/**
  3637	 * panthor_group_kbo_sizes() - Retrieve aggregate size of all private kernel BO's
  3638	 * belonging to all the groups owned by an open Panthor file
  3639	 * @pfile: File.
  3640	 * @stats: Memory statistics to be updated.
  3641	 *
  3642	 */
  3643	void
  3644	panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
  3645					     struct drm_memory_stats *stats)
> 3646	{
  3647		struct panthor_group_pool *gpool = pfile->groups;
  3648		struct panthor_group *group;
  3649		unsigned long i;
  3650	
  3651		if (IS_ERR_OR_NULL(gpool))
  3652			return;
  3653	
  3654		xa_lock(&gpool->xa);
  3655		xa_for_each(&gpool->xa, i, group) {
  3656			stats->resident += group->fdinfo.kbo_sizes;
  3657			if (group->csg_id >= 0)
  3658				stats->active += group->fdinfo.kbo_sizes;
  3659		}
  3660		xa_unlock(&gpool->xa);
  3661	}
  3662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
