Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CEA40C34C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 12:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F256E8F7;
	Wed, 15 Sep 2021 10:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4816E8F7;
 Wed, 15 Sep 2021 10:07:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="283275447"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="283275447"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 03:07:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544776325"
Received: from vmastnak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.245])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 03:06:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imran Khan <imran.f.khan@oracle.com>, vbabka@suse.cz, geert@linux-m68k.org,
 akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
In-Reply-To: <20210910141001.1622130-2-imran.f.khan@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210910141001.1622130-1-imran.f.khan@oracle.com>
 <20210910141001.1622130-2-imran.f.khan@oracle.com>
Date: Wed, 15 Sep 2021 13:06:52 +0300
Message-ID: <87mtoeywxv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, 11 Sep 2021, Imran Khan <imran.f.khan@oracle.com> wrote:
> To print stack entries into a buffer, users of stackdepot,
> first get a list of stack entries using stack_depot_fetch
> and then print this list into a buffer using stack_trace_snprint.
> Provide a helper in stackdepot for this purpose.
> Also change above mentioned users to use this helper.
>
> Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
>  drivers/gpu/drm/drm_mm.c                |  5 +----
>  drivers/gpu/drm/i915/i915_vma.c         |  5 +----
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------

For the i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree suits you best.

>  include/linux/stackdepot.h              |  3 +++
>  lib/stackdepot.c                        | 23 +++++++++++++++++++++++
>  mm/page_owner.c                         |  5 +----
>  7 files changed, 35 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 86d13d6bc463..2d1adab9e360 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1668,13 +1668,10 @@ __dump_topology_ref_history(struct drm_dp_mst_topology_ref_history *history,
>  	for (i = 0; i < history->len; i++) {
>  		const struct drm_dp_mst_topology_ref_entry *entry =
>  			&history->entries[i];
> -		ulong *entries;
> -		uint nr_entries;
>  		u64 ts_nsec = entry->ts_nsec;
>  		u32 rem_nsec = do_div(ts_nsec, 1000000000);
>  
> -		nr_entries = stack_depot_fetch(entry->backtrace, &entries);
> -		stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 4);
> +		stack_depot_snprint(entry->backtrace, buf, PAGE_SIZE, 4);
>  
>  		drm_printf(&p, "  %d %ss (last at %5llu.%06u):\n%s",
>  			   entry->count,
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 93d48a6f04ab..ca04d7f6f7b5 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -118,8 +118,6 @@ static noinline void save_stack(struct drm_mm_node *node)
>  static void show_leaks(struct drm_mm *mm)
>  {
>  	struct drm_mm_node *node;
> -	unsigned long *entries;
> -	unsigned int nr_entries;
>  	char *buf;
>  
>  	buf = kmalloc(BUFSZ, GFP_KERNEL);
> @@ -133,8 +131,7 @@ static void show_leaks(struct drm_mm *mm)
>  			continue;
>  		}
>  
> -		nr_entries = stack_depot_fetch(node->stack, &entries);
> -		stack_trace_snprint(buf, BUFSZ, entries, nr_entries, 0);
> +		stack_depot_snprint(node->stack, buf, BUFSZ);
>  		DRM_ERROR("node [%08llx + %08llx]: inserted at\n%s",
>  			  node->start, node->size, buf);
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 4b7fc4647e46..f2d9ed375109 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -56,8 +56,6 @@ void i915_vma_free(struct i915_vma *vma)
>  
>  static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>  {
> -	unsigned long *entries;
> -	unsigned int nr_entries;
>  	char buf[512];
>  
>  	if (!vma->node.stack) {
> @@ -66,8 +64,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>  		return;
>  	}
>  
> -	nr_entries = stack_depot_fetch(vma->node.stack, &entries);
> -	stack_trace_snprint(buf, sizeof(buf), entries, nr_entries, 0);
> +	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
>  	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
>  			 vma->node.start, vma->node.size, reason, buf);
>  }
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index eaf7688f517d..cc312f0a05eb 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -65,16 +65,6 @@ static noinline depot_stack_handle_t __save_depot_stack(void)
>  	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
>  }
>  
> -static void __print_depot_stack(depot_stack_handle_t stack,
> -				char *buf, int sz, int indent)
> -{
> -	unsigned long *entries;
> -	unsigned int nr_entries;
> -
> -	nr_entries = stack_depot_fetch(stack, &entries);
> -	stack_trace_snprint(buf, sz, entries, nr_entries, indent);
> -}
> -
>  static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
>  	spin_lock_init(&rpm->debug.lock);
> @@ -146,12 +136,12 @@ static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
>  		if (!buf)
>  			return;
>  
> -		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
>  		DRM_DEBUG_DRIVER("wakeref %x from\n%s", stack, buf);
>  
>  		stack = READ_ONCE(rpm->debug.last_release);
>  		if (stack) {
> -			__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +			stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
>  			DRM_DEBUG_DRIVER("wakeref last released at\n%s", buf);
>  		}
>  
> @@ -183,12 +173,12 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
>  		return;
>  
>  	if (dbg->last_acquire) {
> -		__print_depot_stack(dbg->last_acquire, buf, PAGE_SIZE, 2);
> +		stack_depot_snprint(dbg->last_acquire, buf, PAGE_SIZE, 2);
>  		drm_printf(p, "Wakeref last acquired:\n%s", buf);
>  	}
>  
>  	if (dbg->last_release) {
> -		__print_depot_stack(dbg->last_release, buf, PAGE_SIZE, 2);
> +		stack_depot_snprint(dbg->last_release, buf, PAGE_SIZE, 2);
>  		drm_printf(p, "Wakeref last released:\n%s", buf);
>  	}
>  
> @@ -203,7 +193,7 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
>  		rep = 1;
>  		while (i + 1 < dbg->count && dbg->owners[i + 1] == stack)
>  			rep++, i++;
> -		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +		stack_depot_print(stack, buf, PAGE_SIZE, 2);
>  		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
>  	}
>  
> diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
> index d77a30543dd4..88b0b4cc9906 100644
> --- a/include/linux/stackdepot.h
> +++ b/include/linux/stackdepot.h
> @@ -19,6 +19,9 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
>  unsigned int stack_depot_fetch(depot_stack_handle_t handle,
>  			       unsigned long **entries);
>  
> +int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
> +		       int spaces);
> +
>  void stack_depot_print(depot_stack_handle_t stack);
>  
>  unsigned int filter_irq_stacks(unsigned long *entries, unsigned int nr_entries);
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 873aeb152f52..e1c1d7683f6b 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -214,6 +214,29 @@ static inline struct stack_record *find_stack(struct stack_record *bucket,
>  	return NULL;
>  }
>  
> +/**
> + * stack_depot_snprint - print stack entries from a depot into a buffer
> + *
> + * @handle:	Stack depot handle which was returned from
> + *		stack_depot_save().
> + * @buf:	Pointer to the print buffer
> + *
> + * @size:	Size of the print buffer
> + *
> + * @spaces:	Number of leading spaces to print
> + *
> + * Return:	Number of bytes printed.
> + */
> +int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
> +		       int spaces)
> +{
> +	unsigned long *entries;
> +	unsigned int nr_entries;
> +
> +	nr_entries = stack_depot_fetch(handle, &entries);
> +	return stack_trace_snprint(buf, size, entries, nr_entries, 0);
> +}
> +
>  /**
>   * stack_depot_print - print stack entries from a depot
>   *
> diff --git a/mm/page_owner.c b/mm/page_owner.c
> index 7918770c2b2b..a83f546c06b5 100644
> --- a/mm/page_owner.c
> +++ b/mm/page_owner.c
> @@ -329,8 +329,6 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
>  		depot_stack_handle_t handle)
>  {
>  	int ret, pageblock_mt, page_mt;
> -	unsigned long *entries;
> -	unsigned int nr_entries;
>  	char *kbuf;
>  
>  	count = min_t(size_t, count, PAGE_SIZE);
> @@ -361,8 +359,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
>  	if (ret >= count)
>  		goto err;
>  
> -	nr_entries = stack_depot_fetch(handle, &entries);
> -	ret += stack_trace_snprint(kbuf + ret, count - ret, entries, nr_entries, 0);
> +	ret += stack_depot_snprint(handle, kbuf + ret, count - ret, 0);
>  	if (ret >= count)
>  		goto err;

-- 
Jani Nikula, Intel Open Source Graphics Center
