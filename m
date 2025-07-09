Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E55AFE755
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3D610E14A;
	Wed,  9 Jul 2025 11:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQSM/Thd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5A010E0CF;
 Wed,  9 Jul 2025 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752059790; x=1783595790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=32L3Rb+UPYZJfq5N73CTmBYgLjgAuu4+A3pkOC45u7s=;
 b=YQSM/ThdC9Qtoulrxku10Jm13xKFcJUx3umkjNXuV2eJbN4o2UNIddjn
 ozoOb4mF/FTBs6TowWiCPC4bckIL9YKbIGgtfSADZFLOD4vLtrQm3sG2c
 9ERyvDW2Gkp3T2sVUB1ixr9eq4ao1infHopAFsh4pssbbFBDo16Wub2eU
 wPATH7jkrBPWIJ0PNpRZ3RVi5LxfBnzw1zKGBlOA4O74BdB40eJ7z3Yny
 AFK4w91TUcZkdAonYgqL8Md2JsqqMkSFO1MvmIf60tqK5KkZkxvUzHsXw
 Yq1kqx5EtGRmlTFtM5kxz4S2TVYEqvkeqy5B5uic1Jc8LntehXjAmSZRu Q==;
X-CSE-ConnectionGUID: mGfh7S1aT++QGNxn31FqHQ==
X-CSE-MsgGUID: c3AdkUMPSryH3KrmdQb9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53532917"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="53532917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 04:16:21 -0700
X-CSE-ConnectionGUID: q5OhuuEUQgu8XNT7/3fZPQ==
X-CSE-MsgGUID: PMhyUsdAQjW/pYXcuN5Ehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156084802"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2025 04:16:18 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uZSme-0003S7-2T;
 Wed, 09 Jul 2025 11:16:16 +0000
Date: Wed, 9 Jul 2025 19:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v6 01/15] drm/sched: Add some scheduling quality unit tests
Message-ID: <202507091842.CV3bHmEt-lkp@intel.com>
References: <20250708095147.73366-2-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708095147.73366-2-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on v6.16-rc5 next-20250708]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250708-180519
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250708095147.73366-2-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v6 01/15] drm/sched: Add some scheduling quality unit tests
config: powerpc-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091842.CV3bHmEt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091842.CV3bHmEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091842.CV3bHmEt-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/scheduler/tests/tests_scheduler.o: in function `drm_sched_client_work':
>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:419: undefined reference to `__divdi3'


vim +419 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

   409	
   410	static void drm_sched_client_work(struct kthread_work *work)
   411	{
   412		struct test_client *client = container_of(work, typeof(*client), work);
   413		const long sync_wait = MAX_SCHEDULE_TIMEOUT;
   414		unsigned int cycle, work_us, period_us;
   415		struct drm_mock_sched_job *job = NULL;
   416	
   417		work_us = client->params.job_cnt * client->params.job_us;
   418		period_us = work_us + client->params.wait_us;
 > 419		client->cycles = DIV_ROUND_UP(ktime_to_us(client->duration), period_us);
   420		client->ideal_duration = us_to_ktime(client->cycles * period_us);
   421	
   422		client->start = ktime_get();
   423	
   424		for (cycle = 0; cycle < client->cycles; cycle++) {
   425			unsigned int batch;
   426			unsigned long us;
   427			ktime_t t;
   428	
   429			if (READ_ONCE(client->done))
   430				break;
   431	
   432			t = ktime_get();
   433			for (batch = 0; batch < client->params.job_cnt; batch++) {
   434				job = drm_mock_sched_job_new(client->test,
   435							     client->entity);
   436				drm_mock_sched_job_set_duration_us(job,
   437								   client->params.job_us);
   438				drm_mock_sched_job_submit(job);
   439			}
   440	
   441			if (client->params.sync)
   442				drm_mock_sched_job_wait_finished(job, sync_wait);
   443	
   444			t = ktime_sub(ktime_get(), t);
   445			us = ktime_to_us(t);
   446			update_stats(&client->cycle_time, cycle, us);
   447			if (ktime_to_us(t) >= (long)work_us)
   448				us = ktime_to_us(t) - work_us;
   449			else if (WARN_ON_ONCE(client->params.sync))
   450				us = 0;
   451			update_stats(&client->latency_time, cycle, us);
   452			WRITE_ONCE(client->cycle, cycle);
   453	
   454			if (READ_ONCE(client->done))
   455				break;
   456	
   457			if (client->params.wait_us)
   458				fsleep(client->params.wait_us);
   459			else
   460				cond_resched();
   461		}
   462	
   463		client->done = drm_mock_sched_job_wait_finished(job, sync_wait);
   464		client->end = ktime_get();
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
