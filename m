Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358763F8C04
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 18:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DE56E881;
	Thu, 26 Aug 2021 16:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1027A6E02C;
 Thu, 26 Aug 2021 16:23:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="198018629"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="198018629"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 09:23:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="527948190"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 09:23:20 -0700
Date: Thu, 26 Aug 2021 09:18:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com
Subject: Re: [Intel-gfx] [PATCH 16/27] drm/i915: Allocate error capture in
 nowait context
Message-ID: <20210826161811.GA19893@jons-linux-dev-box>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-17-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826032327.18078-17-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Aug 25, 2021 at 08:23:16PM -0700, Matthew Brost wrote:
> Error captures can now be done in a work queue processing G2H messages.
> These messages need to be completely done being processed in the reset
> path, to avoid races in the missing G2H cleanup, which create a
> dependency on memory allocations and dma fences (i915_requests).
> Requests depend on resets, thus now we have a circular dependency. To
> work around this, allocate the error capture in a nowait context.
> 

For completeness Daniel suggested we include the lockdep splat,
included below:

[  154.625989] ======================================================
[  154.632195] WARNING: possible circular locking dependency detected
[  154.638393] 5.14.0-rc5-guc+ #50 Tainted: G     U
[  154.643991] ------------------------------------------------------
[  154.650196] i915_selftest/1673 is trying to acquire lock:
[  154.655621] ffff8881079cb918 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}, at: __flush_work+0x350/0x4d0 [  154.665826]
               but task is already holding lock:
[  154.671682] ffff8881079cbfb8 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0xf0/0x300 [i915] [  154.680659]
               which lock already depends on the new lock.

[  154.688857]
               the existing dependency chain (in reverse order) is:
[  154.696365]
               -> #2 (&gt->reset.mutex){+.+.}-{3:3}:
[  154.702571]        lock_acquire+0xd2/0x300
[  154.706695]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]
[  154.712959]        intel_gt_init_reset+0x61/0x80 [i915]
[  154.718258]        intel_gt_init_early+0xe6/0x120 [i915]
[  154.723648]        i915_driver_probe+0x592/0xdc0 [i915]
[  154.728942]        i915_pci_probe+0x43/0x1c0 [i915]
[  154.733891]        pci_device_probe+0x9b/0x110
[  154.738362]        really_probe+0x1a6/0x3a0
[  154.742568]        __driver_probe_device+0xf9/0x170
[  154.747468]        driver_probe_device+0x19/0x90
[  154.752114]        __driver_attach+0x99/0x170
[  154.756492]        bus_for_each_dev+0x73/0xc0
[  154.760870]        bus_add_driver+0x14b/0x1f0
[  154.765248]        driver_register+0x67/0xb0
[  154.769542]        i915_init+0x18/0x8c [i915]
[  154.773964]        do_one_initcall+0x53/0x2e0
[  154.778343]        do_init_module+0x56/0x210
[  154.782639]        load_module+0x25fc/0x29f0
[  154.786934]        __do_sys_finit_module+0xae/0x110
[  154.791835]        do_syscall_64+0x38/0xc0
[  154.795958]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  154.801558]
               -> #1 (fs_reclaim){+.+.}-{0:0}:
[  154.807241]        lock_acquire+0xd2/0x300
[  154.811361]        fs_reclaim_acquire+0x9e/0xd0
[  154.815914]        kmem_cache_alloc_trace+0x30/0x790
[  154.820899]        i915_gpu_coredump_alloc+0x53/0x1a0 [i915]
[  154.826649]        i915_gpu_coredump+0x39/0x560 [i915]
[  154.831866]        i915_capture_error_state+0xa/0x70 [i915]
[  154.837513]        intel_guc_context_reset_process_msg+0x174/0x1f0 [i915]
[  154.844383]        ct_incoming_request_worker_func+0x130/0x1b0 [i915]
[  154.850898]        process_one_work+0x264/0x590
[  154.855451]        worker_thread+0x4b/0x3a0
[  154.859655]        kthread+0x147/0x170
[  154.863428]        ret_from_fork+0x1f/0x30
[  154.867548]
               -> #0 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}:
[  154.875747]        check_prev_add+0x90/0xc30
[  154.880042]        __lock_acquire+0x1643/0x2110
[  154.884595]        lock_acquire+0xd2/0x300
[  154.888715]        __flush_work+0x373/0x4d0
[  154.892920]        intel_guc_submission_reset_prepare+0xf3/0x340 [i915]
[  154.899606]        intel_uc_reset_prepare+0x40/0x50 [i915]
[  154.905166]        reset_prepare+0x55/0x60 [i915]
[  154.909946]        intel_gt_reset+0x11c/0x300 [i915]
[  154.914984]        do_device_reset+0x13/0x20 [i915]
[  154.919936]        check_whitelist_across_reset+0x166/0x250 [i915]
[  154.926212]        live_reset_whitelist.cold+0x6a/0x7a [i915]
[  154.932037]        __i915_subtests.cold+0x20/0x74 [i915]
[  154.937428]        __run_selftests.cold+0x96/0xee [i915]
[  154.942816]        i915_live_selftests+0x2c/0x60 [i915]
[  154.948125]        i915_pci_probe+0x93/0x1c0 [i915]
[  154.953076]        pci_device_probe+0x9b/0x110
[  154.957545]        really_probe+0x1a6/0x3a0
[  154.961749]        __driver_probe_device+0xf9/0x170
[  154.966653]        driver_probe_device+0x19/0x90
[  154.971290]        __driver_attach+0x99/0x170
[  154.975671]        bus_for_each_dev+0x73/0xc0
[  154.980053]        bus_add_driver+0x14b/0x1f0
[  154.984431]        driver_register+0x67/0xb0
[  154.988725]        i915_init+0x18/0x8c [i915]
[  154.993149]        do_one_initcall+0x53/0x2e0
[  154.997527]        do_init_module+0x56/0x210
[  155.001822]        load_module+0x25fc/0x29f0
[  155.006118]        __do_sys_finit_module+0xae/0x110
[  155.011019]        do_syscall_64+0x38/0xc0
[  155.015139]        entry_SYSCALL_64_after_hwframe+0x44/0xae
[  155.020729]
               other info that might help us debug this:

[  155.028752] Chain exists of:
                 (work_completion)(&ct->requests.worker) --> fs_reclaim --> &gt->reset.mutex

[  155.041294]  Possible unsafe locking scenario:

[  155.047240]        CPU0                    CPU1
[  155.051791]        ----                    ----
[  155.056344]   lock(&gt->reset.mutex);
[  155.060026]                                lock(fs_reclaim);
[  155.065706]                                lock(&gt->reset.mutex);
[  155.071912]   lock((work_completion)(&ct->requests.worker));
[  155.077595]
                *** DEADLOCK ***

> v2:
>  (Daniel Vetter)
>   - Use GFP_NOWAIT instead GFP_ATOMIC
> 
> Fixes: dc0dad365c5e ("Fix for error capture after full GPU reset with GuC")
> Fixes: 573ba126aef3 ("Capture error state on context reset")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 39 +++++++++++++--------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index b9f66dbd46bb..8696ead02118 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -49,8 +49,7 @@
>  #include "i915_memcpy.h"
>  #include "i915_scatterlist.h"
>  
> -#define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
> -#define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)
> +#define ATOMIC_MAYFAIL (GFP_NOWAIT | __GFP_NOWARN)
>  
>  static void __sg_set_buf(struct scatterlist *sg,
>  			 void *addr, unsigned int len, loff_t it)
> @@ -79,7 +78,7 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
>  	if (e->cur == e->end) {
>  		struct scatterlist *sgl;
>  
> -		sgl = (typeof(sgl))__get_free_page(ALLOW_FAIL);
> +		sgl = (typeof(sgl))__get_free_page(ATOMIC_MAYFAIL);
>  		if (!sgl) {
>  			e->err = -ENOMEM;
>  			return false;
> @@ -99,10 +98,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
>  	}
>  
>  	e->size = ALIGN(len + 1, SZ_64K);
> -	e->buf = kmalloc(e->size, ALLOW_FAIL);
> +	e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
>  	if (!e->buf) {
>  		e->size = PAGE_ALIGN(len + 1);
> -		e->buf = kmalloc(e->size, GFP_KERNEL);
> +		e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
>  	}
>  	if (!e->buf) {
>  		e->err = -ENOMEM;
> @@ -243,12 +242,12 @@ static bool compress_init(struct i915_vma_compress *c)
>  {
>  	struct z_stream_s *zstream = &c->zstream;
>  
> -	if (pool_init(&c->pool, ALLOW_FAIL))
> +	if (pool_init(&c->pool, ATOMIC_MAYFAIL))
>  		return false;
>  
>  	zstream->workspace =
>  		kmalloc(zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL),
> -			ALLOW_FAIL);
> +			ATOMIC_MAYFAIL);
>  	if (!zstream->workspace) {
>  		pool_fini(&c->pool);
>  		return false;
> @@ -256,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
>  
>  	c->tmp = NULL;
>  	if (i915_has_memcpy_from_wc())
> -		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
> +		c->tmp = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  
>  	return true;
>  }
> @@ -280,7 +279,7 @@ static void *compress_next_page(struct i915_vma_compress *c,
>  	if (dst->page_count >= dst->num_pages)
>  		return ERR_PTR(-ENOSPC);
>  
> -	page = pool_alloc(&c->pool, ALLOW_FAIL);
> +	page = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  	if (!page)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -376,7 +375,7 @@ struct i915_vma_compress {
>  
>  static bool compress_init(struct i915_vma_compress *c)
>  {
> -	return pool_init(&c->pool, ALLOW_FAIL) == 0;
> +	return pool_init(&c->pool, ATOMIC_MAYFAIL) == 0;
>  }
>  
>  static bool compress_start(struct i915_vma_compress *c)
> @@ -391,7 +390,7 @@ static int compress_page(struct i915_vma_compress *c,
>  {
>  	void *ptr;
>  
> -	ptr = pool_alloc(&c->pool, ALLOW_FAIL);
> +	ptr = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  	if (!ptr)
>  		return -ENOMEM;
>  
> @@ -1026,7 +1025,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  
>  	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
>  	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
> -	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
> +	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ATOMIC_MAYFAIL);
>  	if (!dst)
>  		return NULL;
>  
> @@ -1462,7 +1461,7 @@ capture_engine(struct intel_engine_cs *engine,
>  	struct i915_request *rq = NULL;
>  	unsigned long flags;
>  
> -	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
> +	ee = intel_engine_coredump_alloc(engine, ATOMIC_MAYFAIL);
>  	if (!ee)
>  		return NULL;
>  
> @@ -1510,7 +1509,7 @@ gt_record_engines(struct intel_gt_coredump *gt,
>  		struct intel_engine_coredump *ee;
>  
>  		/* Refill our page pool before entering atomic section */
> -		pool_refill(&compress->pool, ALLOW_FAIL);
> +		pool_refill(&compress->pool, ATOMIC_MAYFAIL);
>  
>  		ee = capture_engine(engine, compress);
>  		if (!ee)
> @@ -1536,7 +1535,7 @@ gt_record_uc(struct intel_gt_coredump *gt,
>  	const struct intel_uc *uc = &gt->_gt->uc;
>  	struct intel_uc_coredump *error_uc;
>  
> -	error_uc = kzalloc(sizeof(*error_uc), ALLOW_FAIL);
> +	error_uc = kzalloc(sizeof(*error_uc), ATOMIC_MAYFAIL);
>  	if (!error_uc)
>  		return NULL;
>  
> @@ -1547,8 +1546,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
>  	 * As modparams are generally accesible from the userspace make
>  	 * explicit copies of the firmware paths.
>  	 */
> -	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
> -	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
> +	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ATOMIC_MAYFAIL);
> +	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ATOMIC_MAYFAIL);
>  	error_uc->guc_log =
>  		i915_vma_coredump_create(gt->_gt,
>  					 uc->guc.log.vma, "GuC log buffer",
> @@ -1815,7 +1814,7 @@ i915_vma_capture_prepare(struct intel_gt_coredump *gt)
>  {
>  	struct i915_vma_compress *compress;
>  
> -	compress = kmalloc(sizeof(*compress), ALLOW_FAIL);
> +	compress = kmalloc(sizeof(*compress), ATOMIC_MAYFAIL);
>  	if (!compress)
>  		return NULL;
>  
> @@ -1848,11 +1847,11 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>  	if (IS_ERR(error))
>  		return error;
>  
> -	error = i915_gpu_coredump_alloc(i915, ALLOW_FAIL);
> +	error = i915_gpu_coredump_alloc(i915, ATOMIC_MAYFAIL);
>  	if (!error)
>  		return ERR_PTR(-ENOMEM);
>  
> -	error->gt = intel_gt_coredump_alloc(gt, ALLOW_FAIL);
> +	error->gt = intel_gt_coredump_alloc(gt, ATOMIC_MAYFAIL);
>  	if (error->gt) {
>  		struct i915_vma_compress *compress;
>  
> -- 
> 2.32.0
> 
