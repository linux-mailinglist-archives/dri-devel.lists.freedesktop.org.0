Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A47B129BE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 10:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F3A10E00D;
	Sat, 26 Jul 2025 08:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MX/jntr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4863810E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753518785; x=1785054785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LEWTiS4vR6beHfRptRxrwrTlWCgoYMPfxCzalpZzFVs=;
 b=MX/jntr6dhlDKKYokUKmMdHRL4Ad/V+DAg75QujLQslDGucKbA/bRbhD
 Iegm9Iv77F9mng4Du4Bh6qUPSP7/bKUIQVPIpmOv/RwvMJSx8LYaynyH2
 yaEKulHdxMP25Hwrmq7iORhii/S/c57EppGndJnjfCoyhawtPOhTV3Tbz
 ZHd5Bs87qO82N7ldBYfUtw4DM0u0C6771UIUF1RrIERCgeZqED1Vrbyd0
 1N+H2T+p+pLOrT/UIOItCPv6mtMt68tKu082QU6bS6gTWLDrRVpVM1wld
 aYv3Biw+QSG5d575rIqHe3nlEqc5eoV99t4N+BVoPjIKHZRLqGq0ud+Xc A==;
X-CSE-ConnectionGUID: RkcAbaCeRY6Hwdrvqb9N5Q==
X-CSE-MsgGUID: qbRBcWJuSz254/Yyjg+fcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="81286733"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="81286733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 01:33:04 -0700
X-CSE-ConnectionGUID: Pag6J/LlSIeQTjvagaqpuQ==
X-CSE-MsgGUID: QKNuBG0FQViIT0Uz/y/6PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="198586788"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 26 Jul 2025 01:33:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ufaKw-000LnP-1r;
 Sat, 26 Jul 2025 08:32:58 +0000
Date: Sat, 26 Jul 2025 16:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, nd@arm.com,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v5 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <202507261628.odFO5ElZ-lkp@intel.com>
References: <ae6f93a51033a35e9b8e7d2994c8595975f95264.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae6f93a51033a35e9b8e7d2994c8595975f95264.1753449448.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on e48123c607a0db8b9ad02f83c8c3d39918dbda06]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20250725-230250
base:   e48123c607a0db8b9ad02f83c8c3d39918dbda06
patch link:    https://lore.kernel.org/r/ae6f93a51033a35e9b8e7d2994c8595975f95264.1753449448.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v5 5/7] drm/panthor: Implement the counter sampler and sample handling
config: i386-buildonly-randconfig-006-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261628.odFO5ElZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261628.odFO5ElZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261628.odFO5ElZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_perf.c: In function 'session_populate_sample':
>> drivers/gpu/drm/panthor/panthor_perf.c:1031:33: error: passing argument 1 of 'bitmap_to_arr64' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1031 |                 bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 __u64 (*)[2] {aka long long unsigned int (*)[2]}
   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/drm/drm_file.h:34,
                    from drivers/gpu/drm/panthor/panthor_perf.c:5:
   include/linux/bitmap.h:313:27: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type '__u64 (*)[2]' {aka 'long long unsigned int (*)[2]'}
     313 | void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits);
         |                      ~~~~~^~~
   In file included from <command-line>:
   In function 'session_read_insert_idx',
       inlined from 'session_copy_sample' at drivers/gpu/drm/panthor/panthor_perf.c:1039:25,
       inlined from 'panthor_perf_report_irq' at drivers/gpu/drm/panthor/panthor_perf.c:1141:4:
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_385' declared with attribute error: Need native word sized stores/loads for atomicity.
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:69:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_perf.c:491:16: note: in expansion of macro 'smp_load_acquire'
     491 |         return smp_load_acquire(&session->control->insert_idx) % slots;
         |                ^~~~~~~~~~~~~~~~
   In function 'session_read_insert_idx',
       inlined from 'session_emit_sample' at drivers/gpu/drm/panthor/panthor_perf.c:1063:25,
       inlined from 'panthor_perf_report_irq' at drivers/gpu/drm/panthor/panthor_perf.c:1153:4:
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_385' declared with attribute error: Need native word sized stores/loads for atomicity.
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:69:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_perf.c:491:16: note: in expansion of macro 'smp_load_acquire'
     491 |         return smp_load_acquire(&session->control->insert_idx) % slots;
         |                ^~~~~~~~~~~~~~~~
   In function 'session_read_extract_idx',
       inlined from 'session_stop' at drivers/gpu/drm/panthor/panthor_perf.c:1599:26,
       inlined from 'panthor_perf_session_stop' at drivers/gpu/drm/panthor/panthor_perf.c:1785:8:
   include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_381' declared with attribute error: Need native word sized stores/loads for atomicity.
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:571:9: note: in expansion of macro 'compiletime_assert'
     571 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:69:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      69 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:176:29: note: in expansion of macro '__smp_load_acquire'
     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_perf.c:473:16: note: in expansion of macro 'smp_load_acquire'
     473 |         return smp_load_acquire(&session->control->extract_idx) % slots;
         |                ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bitmap_to_arr64 +1031 drivers/gpu/drm/panthor/panthor_perf.c

   976	
   977	/**
   978	 * session_populate_sample - Write out a new sample into a previously populated slot in the user
   979	 *                           ringbuffer and update both the header of the block and the PRFCNT_EN
   980	 *                           counter to contain only the selected subset of counters for that block.
   981	 *
   982	 * @ptdev: Panthor device
   983	 * @session: Perf session
   984	 * @session_sample: Pointer aligned to the start of the data section of the sample in the targeted
   985	 *                  slot.
   986	 * @sampler_sample: Pointer aligned to the start of the data section of the intermediate sampler
   987	 *                  buffer.
   988	 *
   989	 * When a new sample slot is targeted, it must be cleared of the data already existing there,
   990	 * enabling a direct copy from the intermediate buffer and then zeroing out any counters
   991	 * that are not required for the current session.
   992	 */
   993	static void session_populate_sample(struct panthor_device *ptdev,
   994					    struct panthor_perf_session *session, u8 *session_sample,
   995					    u8 *sampler_sample)
   996	{
   997		const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
   998	
   999		const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
  1000		const size_t sample_size = session_get_user_sample_size(perf_info);
  1001		const size_t sample_header_size = perf_info->sample_header_size;
  1002		const size_t data_size = sample_size - sample_header_size;
  1003		const u32 counters = perf_info->counters_per_block;
  1004	
  1005		session_populate_sample_header(session,
  1006					       (struct drm_panthor_perf_sample_header *)session_sample,
  1007					       ptdev->perf->sampler.set_config);
  1008	
  1009		session_sample += sample_header_size;
  1010	
  1011		memcpy(session_sample, sampler_sample + sample_header_size, data_size);
  1012	
  1013		for (size_t i = 0; i < data_size; i += block_size) {
  1014			DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
  1015			struct panthor_perf_counter_block *blk = (typeof(blk))(session_sample + i);
  1016			enum drm_panthor_perf_block_type type = blk->header.block_type;
  1017			unsigned long *blk_em = session->enabled_counters->mask[type];
  1018	
  1019			bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
  1020	
  1021			bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
  1022			bitmap_clear(em_diff, 0, PANTHOR_HEADER_COUNTERS);
  1023	
  1024			blk->counters[PANTHOR_CTR_PRFCNT_EN] = compress_enable_mask(counters, blk_em);
  1025	
  1026			for (size_t ctr_idx = PANTHOR_HEADER_COUNTERS; ctr_idx < counters; ctr_idx++) {
  1027				if (test_bit(ctr_idx, em_diff))
  1028					blk->counters[ctr_idx] = 0;
  1029			}
  1030	
> 1031			bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
  1032		}
  1033	}
  1034	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
