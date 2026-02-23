Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOsEMQ6KnGlWJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:10:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517A17A6AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 18:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC4110E05A;
	Mon, 23 Feb 2026 17:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxXmV20G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198589830;
 Mon, 23 Feb 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771866635; x=1803402635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O0ZvE7y9t9xpfzGDEN2L3jg3C36sia6pyPmPJdqLoT4=;
 b=bxXmV20GknMlbxhTpFm8UQTEvVU0jBSWBFoHKQFUalkk6N75SzYjQOgx
 oMGaBDP++ZhlPVMLuKQuIYiVNGiAwuj5nXUJssLeQqoPy7i3n4IgTzAtn
 aION0iGx/JmgaP5MTDLJcGDohxY9IAxaaaJvLrurn1wuJ/M4eUdPjyFdQ
 tsumHYGmdlzc30OD9SWyuymXPdpMkR2MRwEwMXHNMy7ReHQGwaGt8vykN
 cnUzLqeV5yy1WAbcXEMqExuO6EFdQHQV3pSwhWAgSpd07iUWEX1JDUpsQ
 fd+bq9By+viHJW7fekGPGGE4zgT1SOnsFrSblWGE8pWg8k0SKR1TV18Uy Q==;
X-CSE-ConnectionGUID: zdJyBvUmRpSyedNXLh7X1g==
X-CSE-MsgGUID: RVs2xhbZSZ+MY3TlPAB7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71894010"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71894010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:10:35 -0800
X-CSE-ConnectionGUID: Go9dg9wBTb6+JtsvV03RyA==
X-CSE-MsgGUID: kya9xiABTiSr66o2f2ZQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219742265"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.253])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:10:32 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [RFC v3] drm/i915/selftests: Prevent userspace mapping
 invalidation
Date: Mon, 23 Feb 2026 18:10:28 +0100
Message-ID: <1986046.g5d078U9FE@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <dnqbdeooikcsklr2xk2uzh6shqddneuah27oobtyohahhfzp4q@23vsrz5343ny>
References: <dnqbdeooikcsklr2xk2uzh6shqddneuah27oobtyohahhfzp4q@23vsrz5343ny>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[janusz.krzysztofik@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jkrzyszt-mobl2.ger.corp.intel.com:mid,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 4517A17A6AA
X-Rspamd-Action: no action

Hi Krzysztof,

On Monday, 23 February 2026 16:21:48 CET Krzysztof Karas wrote:
> Migration testing in i915 uses current task's address space to
> allocate new userspace mapping, without registering real user
> for that address space in mm_struct. Since PCI probe executes in
> another process, "current" is unknown at the time the selftest
> run [1].

I think that statement is too general.  PCI probe usually executes the
driver's .probe function within the current kernel thread, though it 
*may* decide to pass its execution to a kworker if it detects the probed 
device's resources belong to a different NUMA cell in a multi-cell NUMA 
system.  Do we know other conditions when that may happen?  Please 
specify all such conditions we know about instead of potentially 
suggesting that the delegation to a kworker is unconditional.

Thanks,
Janusz

> 
> It was observed that mm->mm_users would occasionally be 0
> or drop to 0 during the test, which reaped userspace mappings,
> further leading to failures upon reading from userland memory.
> 
> Prevent this by waiting for usable address space and
> artificially increasing its mm_users counter for the duration
> of the test.
> 
> [1]:
> IGT makes use of selftest on module load mechanism in i915:
>  1) IGT recognizes arguments and passes them to libkmod while in
>   userspace;
>  2) libkmod forms and executes a syscall simulating a
>   modprobe command, thus moving to kernel context;
>  3) PCI code puts local_pci_probe() call onto a workqueue via
>   work_on_cpu() macro in pci_call_probe(). Below backtrace shows
>   call order between syscall and work_on_cpu() call:
> 
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xc1/0xf0
>  dump_stack+0x10/0x20
>  pci_device_probe+0x205/0x280
>  really_probe+0xf1/0x410
>  __driver_probe_device+0x8c/0x190
>  driver_probe_device+0x24/0xd0
>  __driver_attach+0x10f/0x240
>  ? __pfx___driver_attach+0x10/0x10
>  bus_for_each_dev+0x7f/0xe0
>  driver_attach+0x1e/0x30
>  bus_add_driver+0x163/0x2a0
>  driver_register+0x5e/0x130
>  __pci_register_driver+0x80/0xa0
>  i915_pci_register_driver+0x23/0x30 [i915]
>  i915_init+0x37/0x120 [i915]
>  ? __pfx_i915_init+0x10/0x10 [i915]
>  do_one_initcall+0x5e/0x3a0
>  do_init_module+0x97/0x2b0
>  load_module+0x2d89/0x2e90
>  ? kernel_read_file+0x2b1/0x320
>  init_module_from_file+0xf4/0x120
>  ? init_module_from_file+0xf4/0x120
>  idempotent_init_module+0x117/0x330
>  __x64_sys_finit_module+0x73/0xf0
>  x64_sys_call+0x1d68/0x26b0
>  do_syscall_64+0x93/0x1470
>  ? do_syscall_64+0x1e4/0x1470
>  ? ksys_lseek+0x4f/0xd0
>  ? do_syscall_64+0x1e4/0x1470
>  ? clear_bhb_loop+0x50/0xa0
>  ? clear_bhb_loop+0x50/0xa0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> note that pci_device_probe() calls __pci_device_probe(), which
> then calls pci_call_probe() and both are static functions;
>  4) at last, the actual probe is called from kworker and the
>  selftests execute:
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xc1/0xf0
>  dump_stack+0x10/0x20
>  igt_mmap_migrate+0x302/0x7e0 [i915]
>  __i915_subtests+0xb8/0x250 [i915]
>  ? __pfx___i915_live_teardown+0x10/0x10 [i915]
>  ? __pfx___i915_live_setup+0x10/0x10 [i915]
>  i915_gem_mman_live_selftests+0x103/0x140 [i915]
>  __run_selftests+0xc5/0x220 [i915]
>  i915_live_selftests+0xaa/0x130 [i915]
>  i915_pci_probe+0xee/0x1d0 [i915]
>  local_pci_probe+0x47/0xb0
>  work_for_cpu_fn+0x1a/0x30
>  process_one_work+0x22e/0x6b0
>  worker_thread+0x1e8/0x3d0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x11f/0x250
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x344/0x3a0
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
> 
> This operation of putting selftests into a forked process
> creates a short delay in which another userspace process may be
> handled by the scheduler, so IGT process is not the one from
> which kernel borrows the address space.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> Fixes: 34b1c1c71d37 ("i915/selftest/igt_mmap: let mmap tests run in 
kthread")
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> This has previously been a regular patch, but after many
> deliberations and discussions with i915 team members we decided
> that this should be made into a RFC, as this may still be an
> incomplete solution.
> 
> This change is best effort to increase reliability of the
> selftest. There will still be instances, where there is no
> suitable address space available, because we rely on operating
> system to be in a certain state, which we probably should not
> force by ourselves. In this case, it would be sufficient to have
> this test pass most of the time and silently skip if it cannot
> execute safely.
> 
>  .../drm/i915/gem/selftests/i915_gem_mman.c    | 44 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/
gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 9d454d0b46f2..ccb00cd5e750 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -38,6 +38,8 @@ struct tile {
>  	unsigned int swizzle;
>  };
>  
> +bool skip_vma = true;
> +
>  static u64 swizzle_bit(unsigned int bit, u64 offset)
>  {
>  	return (offset & BIT_ULL(bit)) >> (bit - 6);
> @@ -903,6 +905,9 @@ static int __igt_mmap(struct drm_i915_private *i915,
>  	int err, i;
>  	u64 offset;
>  
> +	if (skip_vma)
> +		return 0;
> +
>  	if (!can_mmap(obj, type))
>  		return 0;
>  
> @@ -1165,6 +1170,9 @@ static int __igt_mmap_migrate(struct 
intel_memory_region **placements,
>  	u64 offset;
>  	int err;
>  
> +	if (skip_vma)
> +		return 0;
> +
>  	obj = __i915_gem_object_create_user(i915, PAGE_SIZE,
>  					    placements,
>  					    n_placements);
> @@ -1847,7 +1855,6 @@ static int igt_mmap_revoke(void *arg)
>  int i915_gem_mman_live_selftests(struct drm_i915_private *i915)
>  {
>  	int ret;
> -	bool unuse_mm = false;
>  	static const struct i915_subtest tests[] = {
>  		SUBTEST(igt_partial_tiling),
>  		SUBTEST(igt_smoke_tiling),
> @@ -1860,14 +1867,41 @@ int i915_gem_mman_live_selftests(struct 
drm_i915_private *i915)
>  	};
>  
>  	if (!current->mm) {
> -		kthread_use_mm(current->active_mm);
> -		unuse_mm = true;
> +		int timeout = 10;
> +		/**
> +		 * We want to use current->active_mm, which corresponds to 
the
> +		 * address space of a userspace process that was last 
handled by
> +		 * scheduler. It is possible that this memory is in the 
middle
> +		 * of cleanup indicated by mm_users == 0, in which case 
kernel
> +		 * waits until the process is finished to release its 
mm_struct.
> +		 * Borrowing that memory at that point is unsafe, because 
it may
> +		 * be freed at any point and taking additional references 
to it
> +		 * will not change the cleanup behavior.
> +		 * Wait for a bit in hopes that another process is taken 
by
> +		 * scheduler and has reliable memory for us to map into.
> +		 */
> +		while (timeout--) {
> +			if (mmget_not_zero(current->active_mm)) {
> +				kthread_use_mm(current->active_mm);
> +				skip_vma = false;
> +				break;
> +			}
> +
> +			msleep(1000);
> +		}
>  	}
>  
>  	ret = i915_live_subtests(tests, i915);
>  
> -	if (unuse_mm)
> -		kthread_unuse_mm(current->active_mm);
> +	if (!skip_vma) {
> +		/**
> +		 * The scheduler was working while the test executed,
> +		 * so current->active_mm might have changed. Use the old
> +		 * reference to the address space stored in current->mm.
> +		 */
> +		mmput_async(current->mm);
> +		kthread_unuse_mm(current->mm);
> +	}
>  
>  	return ret;
>  }
> 




