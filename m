Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB985174E77
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 17:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17376E4CB;
	Sun,  1 Mar 2020 16:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC206E215;
 Sun,  1 Mar 2020 16:27:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2020 08:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,504,1574150400"; d="scan'208";a="242893182"
Received: from zitzelsb-mobl.ger.corp.intel.com (HELO [10.252.38.19])
 ([10.252.38.19])
 by orsmga006.jf.intel.com with ESMTP; 01 Mar 2020 08:27:24 -0800
Subject: Re: [Intel-gfx] [PATCH 2/2] RFC drm/i915: Export per-client debug
 tracing
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20200301155248.4132645-1-chris@chris-wilson.co.uk>
 <20200301155248.4132645-2-chris@chris-wilson.co.uk>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <74b581c4-2e5b-6455-63d3-351635820a4b@intel.com>
Date: Sun, 1 Mar 2020 18:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200301155248.4132645-2-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/03/2020 17:52, Chris Wilson wrote:
> Rather than put sensitive, and often voluminous, user details into a
> global dmesg, report the error and debug messages directly back to the
> user via the kernel tracing mechanism.


Sounds really nice. Don't you want the existing global tracing to be the 
default at least until a client does a get_trace?


-Lionel


>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 104 ++++++++++-----
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 124 ++++++++++--------
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   6 +-
>   drivers/gpu/drm/i915/i915_drv.h               |   4 +
>   drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>   include/uapi/drm/i915_drm.h                   |   7 +
>   6 files changed, 156 insertions(+), 94 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index e525ead073f7..c136a8c90e27 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -81,6 +81,8 @@
>   
>   #define ALL_L3_SLICES(dev) (1 << NUM_L3_SLICES(dev)) - 1
>   
> +#define CTX_TRACE(ctx, ...) TRACE((ctx)->file_priv->trace, __VA_ARGS__)
> +
>   static struct i915_global_gem_context {
>   	struct i915_global base;
>   	struct kmem_cache *slab_luts;
> @@ -158,8 +160,12 @@ lookup_user_engine(struct i915_gem_context *ctx,
>   		engine = intel_engine_lookup_user(ctx->i915,
>   						  ci->engine_class,
>   						  ci->engine_instance);
> -		if (!engine)
> +		if (!engine) {
> +			CTX_TRACE(ctx,
> +				  "Unknown engine {class:%d, instance:%d}\n",
> +				  ci->engine_class, ci->engine_instance);
>   			return ERR_PTR(-EINVAL);
> +		}
>   
>   		idx = engine->legacy_idx;
>   	} else {
> @@ -762,8 +768,6 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>   
>   		ppgtt = i915_ppgtt_create(&i915->gt);
>   		if (IS_ERR(ppgtt)) {
> -			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> -				PTR_ERR(ppgtt));
>   			context_close(ctx);
>   			return ERR_CAST(ppgtt);
>   		}
> @@ -1461,14 +1465,15 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>   		return -EFAULT;
>   
>   	if (idx >= set->engines->num_engines) {
> -		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> -			idx, set->engines->num_engines);
> +		CTX_TRACE(set->ctx,
> +			  "Invalid placement value, %d >= %d\n",
> +			  idx, set->engines->num_engines);
>   		return -EINVAL;
>   	}
>   
>   	idx = array_index_nospec(idx, set->engines->num_engines);
>   	if (set->engines->engines[idx]) {
> -		drm_dbg(&i915->drm,
> +		CTX_TRACE(set->ctx,
>   			"Invalid placement[%d], already occupied\n", idx);
>   		return -EEXIST;
>   	}
> @@ -1505,9 +1510,9 @@ set_engines__load_balance(struct i915_user_extension __user *base, void *data)
>   						       ci.engine_class,
>   						       ci.engine_instance);
>   		if (!siblings[n]) {
> -			drm_dbg(&i915->drm,
> -				"Invalid sibling[%d]: { class:%d, inst:%d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> +			CTX_TRACE(set->ctx,
> +				  "Invalid sibling[%d]: { class:%d, inst:%d }\n",
> +				  n, ci.engine_class, ci.engine_instance);
>   			err = -EINVAL;
>   			goto out_siblings;
>   		}
> @@ -1551,15 +1556,15 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>   		return -EFAULT;
>   
>   	if (idx >= set->engines->num_engines) {
> -		drm_dbg(&i915->drm,
> -			"Invalid index for virtual engine: %d >= %d\n",
> -			idx, set->engines->num_engines);
> +		CTX_TRACE(set->ctx,
> +			  "Invalid index for virtual engine: %d >= %d\n",
> +			  idx, set->engines->num_engines);
>   		return -EINVAL;
>   	}
>   
>   	idx = array_index_nospec(idx, set->engines->num_engines);
>   	if (!set->engines->engines[idx]) {
> -		drm_dbg(&i915->drm, "Invalid engine at %d\n", idx);
> +		CTX_TRACE(set->ctx, "Invalid engine at %d\n", idx);
>   		return -EINVAL;
>   	}
>   	virtual = set->engines->engines[idx]->engine;
> @@ -1580,9 +1585,9 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>   	master = intel_engine_lookup_user(i915,
>   					  ci.engine_class, ci.engine_instance);
>   	if (!master) {
> -		drm_dbg(&i915->drm,
> -			"Unrecognised master engine: { class:%u, instance:%u }\n",
> -			ci.engine_class, ci.engine_instance);
> +		CTX_TRACE(set->ctx,
> +			  "Unrecognised master engine: { class:%u, instance:%u }\n",
> +			  ci.engine_class, ci.engine_instance);
>   		return -EINVAL;
>   	}
>   
> @@ -1599,9 +1604,9 @@ set_engines__bond(struct i915_user_extension __user *base, void *data)
>   						ci.engine_class,
>   						ci.engine_instance);
>   		if (!bond) {
> -			drm_dbg(&i915->drm,
> -				"Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> +			CTX_TRACE(set->ctx,
> +				  "Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
> +				  n, ci.engine_class, ci.engine_instance);
>   			return -EINVAL;
>   		}
>   
> @@ -1701,7 +1706,6 @@ static int
>   set_engines(struct i915_gem_context *ctx,
>   	    const struct drm_i915_gem_context_param *args)
>   {
> -	struct drm_i915_private *i915 = ctx->i915;
>   	struct i915_context_param_engines __user *user =
>   		u64_to_user_ptr(args->value);
>   	struct set_engines set = { .ctx = ctx };
> @@ -1723,8 +1727,9 @@ set_engines(struct i915_gem_context *ctx,
>   	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
>   	if (args->size < sizeof(*user) ||
>   	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
> -		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
> -			args->size);
> +		CTX_TRACE(ctx,
> +			  "Invalid size for engine array: %d\n",
> +			  args->size);
>   		return -EINVAL;
>   	}
>   
> @@ -1761,9 +1766,9 @@ set_engines(struct i915_gem_context *ctx,
>   						  ci.engine_class,
>   						  ci.engine_instance);
>   		if (!engine) {
> -			drm_dbg(&i915->drm,
> -				"Invalid engine[%d]: { class:%d, instance:%d }\n",
> -				n, ci.engine_class, ci.engine_instance);
> +			CTX_TRACE(ctx,
> +				  "Invalid engine[%d]: { class:%d, instance:%d }\n",
> +				  n, ci.engine_class, ci.engine_instance);
>   			__free_engines(set.engines, n);
>   			return -ENOENT;
>   		}
> @@ -1906,6 +1911,36 @@ get_engines(struct i915_gem_context *ctx,
>   	return err;
>   }
>   
> +static int
> +get_trace(struct i915_gem_context *ctx,
> +	  struct drm_i915_gem_context_param *args)
> +{
> +	int fd;
> +
> +	if (args->ctx_id) /* single trace per-fd, let's not mix it up! */
> +		return -EINVAL;
> +
> +	if (!READ_ONCE(ctx->file_priv->trace)) {
> +		struct trace_array *tr;
> +
> +		tr = trace_array_create();
> +		if (IS_ERR(tr))
> +			return PTR_ERR(tr);
> +
> +		if (cmpxchg(&ctx->file_priv->trace, NULL, tr))
> +			trace_array_destroy(tr);
> +	}
> +
> +	fd = anon_trace_getfd("i915-client", ctx->file_priv->trace);
> +	if (fd < 0)
> +		return fd;
> +
> +	args->size = 0;
> +	args->value = fd;
> +
> +	return 0;
> +}
> +
>   static int
>   set_persistence(struct i915_gem_context *ctx,
>   		const struct drm_i915_gem_context_param *args)
> @@ -1943,8 +1978,13 @@ static int set_priority(struct i915_gem_context *ctx,
>   		return -ENODEV;
>   
>   	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
> -	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
> +	    priority < I915_CONTEXT_MIN_USER_PRIORITY) {
> +		CTX_TRACE(ctx, "priority %d out-of-range [%d, %d]\n",
> +			  priority,
> +			  I915_CONTEXT_MAX_USER_PRIORITY,
> +			  I915_CONTEXT_MIN_USER_PRIORITY);
>   		return -EINVAL;
> +	}
>   
>   	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
>   	    !capable(CAP_SYS_NICE))
> @@ -2302,9 +2342,9 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>   
>   	ext_data.fpriv = file->driver_priv;
>   	if (client_is_banned(ext_data.fpriv)) {
> -		drm_dbg(&i915->drm,
> -			"client %s[%d] banned from creating ctx\n",
> -			current->comm, task_pid_nr(current));
> +		TRACE(ext_data.fpriv->trace,
> +		      "client %s[%d] banned from creating ctx\n",
> +		      current->comm, task_pid_nr(current));
>   		return -EIO;
>   	}
>   
> @@ -2326,7 +2366,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>   		goto err_ctx;
>   
>   	args->ctx_id = id;
> -	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
> +	TRACE(ext_data.fpriv->trace, "HW context %d created\n", args->ctx_id);
>   
>   	return 0;
>   
> @@ -2480,6 +2520,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>   		ret = get_ringsize(ctx, args);
>   		break;
>   
> +	case I915_CONTEXT_PARAM_TRACE:
> +		ret = get_trace(ctx, args);
> +		break;
> +
>   	case I915_CONTEXT_PARAM_BAN_PERIOD:
>   	default:
>   		ret = -EINVAL;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index ac0e5fc5675e..620a0e8da5d8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -275,6 +275,16 @@ struct i915_execbuffer {
>   	struct hlist_head *buckets; /** ht for relocation handles */
>   };
>   
> +static inline struct trace_array *file_trace(struct drm_file *f)
> +{
> +	struct drm_i915_file_private *fp = f->driver_priv;
> +
> +	return fp->trace;
> +}
> +
> +#define FILE_TRACE(F, ...) TRACE(file_trace(F), __VA_ARGS__)
> +#define EB_TRACE(E, ...) FILE_TRACE((E)->file, __VA_ARGS__)
> +
>   #define exec_entry(EB, VMA) (&(EB)->exec[(VMA)->exec_flags - (EB)->flags])
>   
>   static inline bool eb_use_cmdparser(const struct i915_execbuffer *eb)
> @@ -419,7 +429,6 @@ eb_validate_vma(struct i915_execbuffer *eb,
>   		struct drm_i915_gem_exec_object2 *entry,
>   		struct i915_vma *vma)
>   {
> -	struct drm_i915_private *i915 = eb->i915;
>   	if (unlikely(entry->flags & eb->invalid_flags))
>   		return -EINVAL;
>   
> @@ -443,9 +452,9 @@ eb_validate_vma(struct i915_execbuffer *eb,
>   	}
>   
>   	if (unlikely(vma->exec_flags)) {
> -		drm_dbg(&i915->drm,
> -			"Object [handle %d, index %d] appears more than once in object list\n",
> -			entry->handle, (int)(entry - eb->exec));
> +		EB_TRACE(eb,
> +			 "Object [handle %d, index %d] appears more than once in object list\n",
> +			 entry->handle, (int)(entry - eb->exec));
>   		return -EINVAL;
>   	}
>   
> @@ -1331,7 +1340,6 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>   		  struct i915_vma *vma,
>   		  const struct drm_i915_gem_relocation_entry *reloc)
>   {
> -	struct drm_i915_private *i915 = eb->i915;
>   	struct i915_vma *target;
>   	int err;
>   
> @@ -1342,24 +1350,26 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>   
>   	/* Validate that the target is in a valid r/w GPU domain */
>   	if (unlikely(reloc->write_domain & (reloc->write_domain - 1))) {
> -		drm_dbg(&i915->drm, "reloc with multiple write domains: "
> -			  "target %d offset %d "
> -			  "read %08x write %08x",
> -			  reloc->target_handle,
> -			  (int) reloc->offset,
> -			  reloc->read_domains,
> -			  reloc->write_domain);
> +		EB_TRACE(eb,
> +			 "reloc with multiple write domains: "
> +			 "target %d offset %d "
> +			 "read %08x write %08x",
> +			 reloc->target_handle,
> +			 (int) reloc->offset,
> +			 reloc->read_domains,
> +			 reloc->write_domain);
>   		return -EINVAL;
>   	}
>   	if (unlikely((reloc->write_domain | reloc->read_domains)
>   		     & ~I915_GEM_GPU_DOMAINS)) {
> -		drm_dbg(&i915->drm, "reloc with read/write non-GPU domains: "
> -			  "target %d offset %d "
> -			  "read %08x write %08x",
> -			  reloc->target_handle,
> -			  (int) reloc->offset,
> -			  reloc->read_domains,
> -			  reloc->write_domain);
> +		EB_TRACE(eb,
> +			 "reloc with read/write non-GPU domains: "
> +			 "target %d offset %d "
> +			 "read %08x write %08x",
> +			 reloc->target_handle,
> +			 (int) reloc->offset,
> +			 reloc->read_domains,
> +			 reloc->write_domain);
>   		return -EINVAL;
>   	}
>   
> @@ -1393,18 +1403,20 @@ eb_relocate_entry(struct i915_execbuffer *eb,
>   	/* Check that the relocation address is valid... */
>   	if (unlikely(reloc->offset >
>   		     vma->size - (eb->reloc_cache.use_64bit_reloc ? 8 : 4))) {
> -		drm_dbg(&i915->drm, "Relocation beyond object bounds: "
> -			  "target %d offset %d size %d.\n",
> -			  reloc->target_handle,
> -			  (int)reloc->offset,
> -			  (int)vma->size);
> +		EB_TRACE(eb,
> +			 "Relocation beyond object bounds: "
> +			 "target %d offset %d size %d.\n",
> +			 reloc->target_handle,
> +			 (int)reloc->offset,
> +			 (int)vma->size);
>   		return -EINVAL;
>   	}
>   	if (unlikely(reloc->offset & 3)) {
> -		drm_dbg(&i915->drm, "Relocation not 4-byte aligned: "
> -			  "target %d offset %d.\n",
> -			  reloc->target_handle,
> -			  (int)reloc->offset);
> +		EB_TRACE(eb,
> +			 "Relocation not 4-byte aligned: "
> +			 "target %d offset %d.\n",
> +			 reloc->target_handle,
> +			 (int)reloc->offset);
>   		return -EINVAL;
>   	}
>   
> @@ -1914,13 +1926,14 @@ static int i915_gem_check_execbuffer(struct drm_i915_gem_execbuffer2 *exec)
>   	return 0;
>   }
>   
> -static int i915_reset_gen7_sol_offsets(struct i915_request *rq)
> +static int gen7_sol_reset(struct i915_execbuffer *eb)
>   {
> +	struct i915_request *rq = eb->request;
>   	u32 *cs;
>   	int i;
>   
>   	if (!IS_GEN(rq->i915, 7) || rq->engine->id != RCS0) {
> -		drm_dbg(&rq->i915->drm, "sol reset is gen7/rcs only\n");
> +		EB_TRACE(eb, "sol reset is gen7/rcs only\n");
>   		return -EINVAL;
>   	}
>   
> @@ -2074,7 +2087,6 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>   
>   static int eb_parse(struct i915_execbuffer *eb)
>   {
> -	struct drm_i915_private *i915 = eb->i915;
>   	struct intel_engine_pool_node *pool;
>   	struct i915_vma *shadow, *trampoline;
>   	unsigned int len;
> @@ -2090,8 +2102,7 @@ static int eb_parse(struct i915_execbuffer *eb)
>   		 * post-scan tampering
>   		 */
>   		if (!eb->context->vm->has_read_only) {
> -			drm_dbg(&i915->drm,
> -				"Cannot prevent post-scan tampering without RO capable vm\n");
> +			EB_TRACE(eb, "Cannot prevent post-scan tampering without RO capable vm\n");
>   			return -EINVAL;
>   		}
>   	} else {
> @@ -2173,7 +2184,7 @@ static int eb_submit(struct i915_execbuffer *eb)
>   		return err;
>   
>   	if (eb->args->flags & I915_EXEC_GEN7_SOL_RESET) {
> -		err = i915_reset_gen7_sol_offsets(eb->request);
> +		err = gen7_sol_reset(eb);
>   		if (err)
>   			return err;
>   	}
> @@ -2379,9 +2390,9 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
>   
>   	if (user_ring_id != I915_EXEC_BSD &&
>   	    (args->flags & I915_EXEC_BSD_MASK)) {
> -		drm_dbg(&i915->drm,
> -			"execbuf with non bsd ring but with invalid "
> -			"bsd dispatch flags: %d\n", (int)(args->flags));
> +		EB_TRACE(eb,
> +			 "execbuf with non bsd ring but with invalid "
> +			 "bsd dispatch flags: %d\n", (int)(args->flags));
>   		return -1;
>   	}
>   
> @@ -2395,9 +2406,9 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
>   			bsd_idx >>= I915_EXEC_BSD_SHIFT;
>   			bsd_idx--;
>   		} else {
> -			drm_dbg(&i915->drm,
> -				"execbuf with unknown bsd ring: %u\n",
> -				bsd_idx);
> +			EB_TRACE(eb,
> +				 "execbuf with unknown bsd ring: %u\n",
> +				 bsd_idx);
>   			return -1;
>   		}
>   
> @@ -2405,8 +2416,8 @@ eb_select_legacy_ring(struct i915_execbuffer *eb,
>   	}
>   
>   	if (user_ring_id >= ARRAY_SIZE(user_ring_map)) {
> -		drm_dbg(&i915->drm, "execbuf with unknown ring: %u\n",
> -			user_ring_id);
> +		EB_TRACE(eb, "execbuf with unknown ring: %u\n",
> +			 user_ring_id);
>   		return -1;
>   	}
>   
> @@ -2680,14 +2691,14 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	}
>   
>   	if (unlikely(*eb.batch->exec_flags & EXEC_OBJECT_WRITE)) {
> -		drm_dbg(&i915->drm,
> -			"Attempting to use self-modifying batch buffer\n");
> +		EB_TRACE(&eb,
> +			 "Attempting to use self-modifying batch buffer\n");
>   		err = -EINVAL;
>   		goto err_vma;
>   	}
>   	if (eb.batch_start_offset > eb.batch->size ||
>   	    eb.batch_len > eb.batch->size - eb.batch_start_offset) {
> -		drm_dbg(&i915->drm, "Attempting to use out-of-bounds batch\n");
> +		EB_TRACE(&eb, "Attempting to use out-of-bounds batch\n");
>   		err = -EINVAL;
>   		goto err_vma;
>   	}
> @@ -2851,7 +2862,6 @@ int
>   i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
>   			  struct drm_file *file)
>   {
> -	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_execbuffer *args = data;
>   	struct drm_i915_gem_execbuffer2 exec2;
>   	struct drm_i915_gem_exec_object *exec_list = NULL;
> @@ -2861,7 +2871,7 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
>   	int err;
>   
>   	if (!check_buffer_count(count)) {
> -		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
> +		FILE_TRACE(file, "execbuf2 with %zd buffers\n", count);
>   		return -EINVAL;
>   	}
>   
> @@ -2886,9 +2896,9 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
>   	exec2_list = kvmalloc_array(count + 1, eb_element_size(),
>   				    __GFP_NOWARN | GFP_KERNEL);
>   	if (exec_list == NULL || exec2_list == NULL) {
> -		drm_dbg(&i915->drm,
> -			"Failed to allocate exec list for %d buffers\n",
> -			args->buffer_count);
> +		FILE_TRACE(file,
> +			   "Failed to allocate exec list for %d buffers\n",
> +			   args->buffer_count);
>   		kvfree(exec_list);
>   		kvfree(exec2_list);
>   		return -ENOMEM;
> @@ -2897,8 +2907,8 @@ i915_gem_execbuffer_ioctl(struct drm_device *dev, void *data,
>   			     u64_to_user_ptr(args->buffers_ptr),
>   			     sizeof(*exec_list) * count);
>   	if (err) {
> -		drm_dbg(&i915->drm, "copy %d exec entries failed %d\n",
> -			args->buffer_count, err);
> +		FILE_TRACE(file, "copy %d exec entries failed %d\n",
> +			   args->buffer_count, err);
>   		kvfree(exec_list);
>   		kvfree(exec2_list);
>   		return -EFAULT;
> @@ -2945,7 +2955,6 @@ int
>   i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>   			   struct drm_file *file)
>   {
> -	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_execbuffer2 *args = data;
>   	struct drm_i915_gem_exec_object2 *exec2_list;
>   	struct drm_syncobj **fences = NULL;
> @@ -2953,7 +2962,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>   	int err;
>   
>   	if (!check_buffer_count(count)) {
> -		drm_dbg(&i915->drm, "execbuf2 with %zd buffers\n", count);
> +		FILE_TRACE(file, "execbuf2 with %zd buffers\n", count);
>   		return -EINVAL;
>   	}
>   
> @@ -2965,14 +2974,15 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>   	exec2_list = kvmalloc_array(count + 1, eb_element_size(),
>   				    __GFP_NOWARN | GFP_KERNEL);
>   	if (exec2_list == NULL) {
> -		drm_dbg(&i915->drm, "Failed to allocate exec list for %zd buffers\n",
> -			count);
> +		FILE_TRACE(file,
> +			   "Failed to allocate exec list for %zd buffers\n",
> +			   count);
>   		return -ENOMEM;
>   	}
>   	if (copy_from_user(exec2_list,
>   			   u64_to_user_ptr(args->buffers_ptr),
>   			   sizeof(*exec2_list) * count)) {
> -		drm_dbg(&i915->drm, "copy %zd exec entries failed\n", count);
> +		FILE_TRACE(file, "copy %zd exec entries failed\n", count);
>   		kvfree(exec2_list);
>   		return -EFAULT;
>   	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 24f4cadea114..001ad1c02249 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -83,14 +83,10 @@ void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
>   
>   int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
>   {
> -	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   	int err;
>   
> -	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED)) {
> -		drm_dbg(&i915->drm,
> -			"Attempting to obtain a purgeable object\n");
> +	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED))
>   		return -EFAULT;
> -	}
>   
>   	err = obj->ops->get_pages(obj);
>   	GEM_BUG_ON(!err && !i915_gem_object_has_pages(obj));
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index b621df933212..dccb71735d5d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -46,6 +46,7 @@
>   #include <linux/dma-resv.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/stackdepot.h>
> +#include <linux/trace.h>
>   #include <linux/xarray.h>
>   
>   #include <drm/intel-gtt.h>
> @@ -223,7 +224,10 @@ struct drm_i915_file_private {
>   	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
>   	atomic_t ban_score;
>   	unsigned long hang_timestamp;
> +
> +	struct trace_array *trace;
>   };
> +#define TRACE(tr, ...) trace_array_printk((tr), _THIS_IP_,  __VA_ARGS__)
>   
>   /* Interface history:
>    *
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index ca5420012a22..baea6be98b0f 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1286,6 +1286,9 @@ void i915_gem_release(struct drm_device *dev, struct drm_file *file)
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
>   	struct i915_request *request;
>   
> +	if (file_priv->trace)
> +		trace_array_destroy(file_priv->trace);
> +
>   	/* Clean up our request list when the client is going away, so that
>   	 * later retire_requests won't dereference our soon-to-be-gone
>   	 * file_priv.
> @@ -1301,8 +1304,6 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>   	struct drm_i915_file_private *file_priv;
>   	int ret;
>   
> -	DRM_DEBUG("\n");
> -
>   	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>   	if (!file_priv)
>   		return -ENOMEM;
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 2813e579b480..c69827e04b48 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1640,6 +1640,13 @@ struct drm_i915_gem_context_param {
>    * Default is 16 KiB.
>    */
>   #define I915_CONTEXT_PARAM_RINGSIZE	0xc
> +
> +/*
> + * I915_CONTEXT_PARAM_TRACE:
> + *
> + * Return an fd representing a pipe of all trace output from this file.
> + */
> +#define I915_CONTEXT_PARAM_TRACE	0xd
>   /* Must be kept compact -- no holes and well documented */
>   
>   	__u64 value;


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
