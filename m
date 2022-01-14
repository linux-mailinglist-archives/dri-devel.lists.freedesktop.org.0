Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCEB48EB23
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 14:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3984610E4E7;
	Fri, 14 Jan 2022 13:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BED010E4DF;
 Fri, 14 Jan 2022 13:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 3E0763F8BA;
 Fri, 14 Jan 2022 14:57:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GMHm6g1146oi; Fri, 14 Jan 2022 14:57:12 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A8FCA3F875;
 Fri, 14 Jan 2022 14:57:10 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.54.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7ED54362691;
 Fri, 14 Jan 2022 14:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1642168630; bh=dhJnAPdstBc/ME2gcPxw6wH6NGQ2tlBIUQ49o8Vsidg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T76234/StfM+2cx6bT3bJkScoLouK3WtkHg7tXtGaXyH+8xyyuPn5cIOv/xL+/V4S
 eH17NFBbMSQ0HdAZToa78vFGJBzLQNBU0CkbO9pb7mKoB92dizKsoXWQM5IhZ6aaES
 gifFFYPYX7o8bopD4y2cXtys0yUR+pxm/X2pFlek=
Message-ID: <bb70ccb8-043c-bd99-e01e-c2f2a0c48d54@shipmail.org>
Date: Fri, 14 Jan 2022 14:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v6 2/6] drm/i915: Add locking to
 i915_gem_evict_vm(), v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220114132320.109030-1-maarten.lankhorst@linux.intel.com>
 <20220114132320.109030-3-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220114132320.109030-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/14/22 14:23, Maarten Lankhorst wrote:
> i915_gem_evict_vm will need to be able to evict objects that are
> locked by the current ctx. By testing if the current context already
> locked the object, we can do this correctly. This allows us to
> evict the entire vm even if we already hold some objects' locks.
>
> Previously, this was spread over several commits, but it makes
> more sense to commit the changes to i915_gem_evict_vm separately
> from the changes to i915_gem_evict_something() and
> i915_gem_evict_for_node().
>
> Changes since v1:
> - Handle evicting dead objects better.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>   drivers/gpu/drm/i915/i915_gem_evict.c         | 32 +++++++++++++++++--
>   drivers/gpu/drm/i915/i915_gem_evict.h         |  4 ++-
>   drivers/gpu/drm/i915/i915_vma.c               |  7 +++-
>   .../gpu/drm/i915/selftests/i915_gem_evict.c   | 10 ++++--
>   6 files changed, 49 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index cf283b5f6ffe..4d832d6696b5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -767,7 +767,7 @@ static int eb_reserve(struct i915_execbuffer *eb)
>   		case 1:
>   			/* Too fragmented, unbind everything and retry */
>   			mutex_lock(&eb->context->vm->mutex);
> -			err = i915_gem_evict_vm(eb->context->vm);
> +			err = i915_gem_evict_vm(eb->context->vm, &eb->ww);
>   			mutex_unlock(&eb->context->vm->mutex);
>   			if (err)
>   				return err;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index fafd158e5313..a69787999d09 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -367,7 +367,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>   		if (vma == ERR_PTR(-ENOSPC)) {
>   			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
>   			if (!ret) {
> -				ret = i915_gem_evict_vm(&ggtt->vm);
> +				ret = i915_gem_evict_vm(&ggtt->vm, &ww);
>   				mutex_unlock(&ggtt->vm.mutex);
>   			}
>   			if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 24eee0c2055f..91f82ecb9ef4 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -368,7 +368,7 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>    * To clarify: This is for freeing up virtual address space, not for freeing
>    * memory in e.g. the shrinker.
>    */
> -int i915_gem_evict_vm(struct i915_address_space *vm)
> +int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>   {
>   	int ret = 0;
>   
> @@ -389,24 +389,52 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>   	do {
>   		struct i915_vma *vma, *vn;
>   		LIST_HEAD(eviction_list);
> +		LIST_HEAD(locked_eviction_list);
>   
>   		list_for_each_entry(vma, &vm->bound_list, vm_link) {
>   			if (i915_vma_is_pinned(vma))
>   				continue;
>   
> +			/*
> +			 * If we already own the lock, trylock fails. In case
> +			 * the resv is shared among multiple objects, we still
> +			 * need the object ref.
> +			 */

Should we handle dying vmas like for the other eviction utilities and 
also evict pinned dying vmas?

> +			if (!kref_read(&vma->obj->base.refcount) ||
> +			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
> +				__i915_vma_pin(vma);
> +				list_add(&vma->evict_link, &locked_eviction_list);
> +				continue;
> +			}
> +
> +			if (!i915_gem_object_trylock(vma->obj, ww))
> +				continue;
> +
>   			__i915_vma_pin(vma);
>   			list_add(&vma->evict_link, &eviction_list);
>   		}
> -		if (list_empty(&eviction_list))
> +		if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
>   			break;
>   
>   		ret = 0;
> +		/* Unbind locked objects first, before unlocking the eviction_list */
> +		list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
> +			__i915_vma_unpin(vma);
> +
> +			if (ret == 0)
> +				ret = __i915_vma_unbind(vma);
> +			if (ret != -EINTR) /* "Get me out of here!" */
> +				ret = 0;
> +		}
> +
>   		list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
>   			__i915_vma_unpin(vma);
>   			if (ret == 0)
>   				ret = __i915_vma_unbind(vma);
>   			if (ret != -EINTR) /* "Get me out of here!" */
>   				ret = 0;
> +
> +			i915_gem_object_unlock(vma->obj);
>   		}
>   	} while (ret == 0);
>   
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i915_gem_evict.h
> index d4478b6ad11b..f5b7a9100609 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.h
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.h
> @@ -10,6 +10,7 @@
>   
>   struct drm_mm_node;
>   struct i915_address_space;
> +struct i915_gem_ww_ctx;
>   
>   int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>   					  u64 min_size, u64 alignment,
> @@ -19,6 +20,7 @@ int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>   int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
>   					 struct drm_mm_node *node,
>   					 unsigned int flags);
> -int i915_gem_evict_vm(struct i915_address_space *vm);
> +int i915_gem_evict_vm(struct i915_address_space *vm,
> +		      struct i915_gem_ww_ctx *ww);
>   
>   #endif /* __I915_GEM_EVICT_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 1f15c3298112..8477cae5f877 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1535,7 +1535,12 @@ static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   		/* Unlike i915_vma_pin, we don't take no for an answer! */
>   		flush_idle_contexts(vm->gt);
>   		if (mutex_lock_interruptible(&vm->mutex) == 0) {
> -			i915_gem_evict_vm(vm);
> +			/*
> +			 * We pass NULL ww here, as we don't want to unbind
> +			 * locked objects when called from execbuf when pinning
> +			 * is removed. This would probably regress badly.
> +			 */
> +			i915_gem_evict_vm(vm, NULL);
>   			mutex_unlock(&vm->mutex);
>   		}
>   	} while (1);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> index 75b709c26dd3..7c075c16a573 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
> @@ -331,6 +331,7 @@ static int igt_evict_vm(void *arg)
>   {
>   	struct intel_gt *gt = arg;
>   	struct i915_ggtt *ggtt = gt->ggtt;
> +	struct i915_gem_ww_ctx ww;
>   	LIST_HEAD(objects);
>   	int err;
>   
> @@ -342,7 +343,7 @@ static int igt_evict_vm(void *arg)
>   
>   	/* Everything is pinned, nothing should happen */
>   	mutex_lock(&ggtt->vm.mutex);
> -	err = i915_gem_evict_vm(&ggtt->vm);
> +	err = i915_gem_evict_vm(&ggtt->vm, NULL);
>   	mutex_unlock(&ggtt->vm.mutex);
>   	if (err) {
>   		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
> @@ -352,9 +353,14 @@ static int igt_evict_vm(void *arg)
>   
>   	unpin_ggtt(ggtt);
>   
> +	i915_gem_ww_ctx_init(&ww, false);
>   	mutex_lock(&ggtt->vm.mutex);
> -	err = i915_gem_evict_vm(&ggtt->vm);
> +	err = i915_gem_evict_vm(&ggtt->vm, &ww);
>   	mutex_unlock(&ggtt->vm.mutex);
> +
> +	/* no -EDEADLK handling; can't happen with vm.mutex in place */
> +	i915_gem_ww_ctx_fini(&ww);
> +

Previous comment remains.

/Thomas




>   	if (err) {
>   		pr_err("i915_gem_evict_vm on a full GGTT returned err=%d]\n",
>   		       err);
