Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2366A5F66
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 20:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F610E062;
	Tue, 28 Feb 2023 19:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17910E062
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677611640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjO/4dZYYaWbOpiP2ns8b+xmm1hWiDbXX3tWXgAvxAM=;
 b=OCqJ51WNKM7R4NCzxWE341+ZpS2cwEULzdTz1GIVnycuhE1XKesljP65S+s7mrYlV71B/u
 SfSTaJ02NXwQoklLVjujHTgcSnFpZe9MKmvvfOoUBliI929zuhymPNRbGmpfXqZ8HFelP2
 qkarySKC4e3VIeyKAlz9cfk09tpk8XY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-lkdmdFHXO8S5VFHpqBYhEA-1; Tue, 28 Feb 2023 14:13:59 -0500
X-MC-Unique: lkdmdFHXO8S5VFHpqBYhEA-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg35-20020a05640228a300b004ad6e399b73so15331686edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjO/4dZYYaWbOpiP2ns8b+xmm1hWiDbXX3tWXgAvxAM=;
 b=PDLRCn/3Vbd898xn+UyHjv8oy8TuSfnylBUqwFIMzQEBulmK6ikRhN8Qp96UdTufWp
 MHgn7mB+rtzjKZ1UPZjB6P6Tk+/QOwcPjWwYaoJXKWIm96cnqdD6eKm/HaIzR2M+Cnbu
 8dJtRSdkven20ZzEvpVW3Kf3tQeSgC2I8LUYXriszBtnD0IL25AFYlXJzgyCjDuZz8db
 T1qcNpDBccBo1I+B9k8q+qywEVfqeIOWlmKscl3FIu75/WYPr6Tw+euHVJIRPMExSKPV
 fNMct0Jeg+I3bGlw0w3eIROmsr+9tfyHwkjw2uv3pj2ecbRouuerNNypKSSF1ED4udJF
 vYwQ==
X-Gm-Message-State: AO0yUKVyXQ7qCEC1aDuzBnDyWWBlVw4Rzbi1YOJ0gyA/QNwTrhNSrHhI
 lBzl3mBmsJ3t0o2i0Jf87JebS6Oo7X6T/KJLH41KB6gDWlf3keifSIc7uMGC+2NOoRiGRptnFDi
 ochjvL6kWLvAz5kWg61TEYfKYYaz+
X-Received: by 2002:a17:906:1b14:b0:879:6abe:915e with SMTP id
 o20-20020a1709061b1400b008796abe915emr3863288ejg.69.1677611637989; 
 Tue, 28 Feb 2023 11:13:57 -0800 (PST)
X-Google-Smtp-Source: AK7set8gsbHpOB8GS1wNzJmS34lEkguEbPyv5NUDdzqY1hAGi8x5EmOPovAor9eHNBaV5y8kLQjNfg==
X-Received: by 2002:a17:906:1b14:b0:879:6abe:915e with SMTP id
 o20-20020a1709061b1400b008796abe915emr3863250ejg.69.1677611637527; 
 Tue, 28 Feb 2023 11:13:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gl9-20020a170906e0c900b008c76facbbf7sm4863517ejb.171.2023.02.28.11.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 11:13:57 -0800 (PST)
Message-ID: <873a0702-56be-6277-c86f-8bb73a4805fd@redhat.com>
Date: Tue, 28 Feb 2023 20:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/9] drm: execution context for GEM buffers v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-2-christian.koenig@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230228083406.1720795-2-christian.koenig@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/23 09:33, Christian König wrote:
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existinc TTMs execbuf util and intended to replace

"existing"

> it in the long term.
> 
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
> 
> v2: drop xarray and use dynamic resized array instead, the locking
>      overhead is unecessary and measureable.

"unecessary", "measurable"

> v3: drop duplicate tracking, radeon is really the only one needing that.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/gpu/drm-mm.rst |  12 ++
>   drivers/gpu/drm/Kconfig      |   6 +
>   drivers/gpu/drm/Makefile     |   2 +
>   drivers/gpu/drm/drm_exec.c   | 249 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_exec.h       | 115 ++++++++++++++++
>   5 files changed, 384 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 include/drm/drm_exec.h
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index a79fd3549ff8..a52e6f4117d6 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -493,6 +493,18 @@ DRM Sync Objects
>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>      :export:
>   
> +DRM Execution context
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :doc: Overview
> +
> +.. kernel-doc:: include/drm/drm_exec.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :export:
> +
>   GPU Scheduler
>   =============
>   
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 17d252dc25e2..84a5fc28c48d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -200,6 +200,12 @@ config DRM_TTM
>   	  GPU memory types. Will be enabled automatically if a device driver
>   	  uses it.
>   
> +config DRM_EXEC
> +	tristate
> +	depends on DRM
> +	help
> +	  Execution context for command submissions
> +
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ab4460fcd63f..d40defbb0347 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   #
>   # Memory-management helpers
>   #
> +#
> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> new file mode 100644
> index 000000000000..df546cc5a227
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -0,0 +1,249 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-resv.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * This component mainly abstracts the retry loop necessary for locking
> + * multiple GEM objects while preparing hardware operations (e.g. command
> + * submissions, page table updates etc..).
> + *
> + * If a contention is detected while locking a GEM object the cleanup procedure
> + * unlocks all previously locked GEM objects and locks the contended one first
> + * before locking any further objects.
> + *
> + * After an object is locked fences slots can optionally be reserved on the
> + * dma_resv object inside the GEM object.
> + *
> + * A typical usage pattern should look like this::
> + *
> + *	struct drm_gem_object *obj;
> + *	struct drm_exec exec;
> + *	unsigned long index;
> + *	int ret;
> + *
> + *	drm_exec_init(&exec, true);
> + *	drm_exec_while_not_all_locked(&exec) {
> + *		ret = drm_exec_prepare_obj(&exec, boA, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *
> + *		ret = drm_exec_lock(&exec, boB, 1);

This function doesn't seem to exist (anymore).

> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *	}
> + *
> + *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
> + *		...
> + *	}
> + *	drm_exec_fini(&exec);
> + *
> + * See struct dma_exec for more details.
> + */
> +
> +/* Dummy value used to initially enter the retry loop */
> +#define DRM_EXEC_DUMMY (void*)~0
> +
> +/* Unlock all objects and drop references */
> +static void drm_exec_unlock_all(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +	}
> +
> +	if (exec->prelocked) {
> +		dma_resv_unlock(exec->prelocked->resv);
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
> +	}

Let's say we try to lock 3 objects A, B and C in chronological order and 
in the first "drm_exec_cleanup() iteration" C is contended. Firstly, we 
lock C in the next iteration. If now A or B is contended, we never set 
exec->prelocked to NULL in drm_exec_prepare_obj(), since we did not yet 
reach C.

Hence, this causes a double unlock, since the prelocked object is also 
unlocked in the above loop.

Maybe I miss a detail, but to me it looks like setting exec->prelocked 
to NULL and dropping the reference should be enough.

I found that through one of my tests causing the following warning while 
porting over to your v3.

[   26.507866] =====================================
[   26.507867] WARNING: bad unlock balance detected!
[   26.507868] 6.2.0-rc6-vmbind-0.2+ #118 Tainted: G        W
[   26.507868] -------------------------------------
[   26.507869] nouveau_dma_cop/1724 is trying to release lock 
(reservation_ww_class_mutex) at:
[   26.507870] [<ffffffffc05f113a>] drm_exec_unlock_all+0x7a/0xc0 [drm_exec]
[   26.507873] but there are no more locks to release!
<snip>
[   26.508146]
                stack backtrace:
[   26.508146] CPU: 10 PID: 1724 Comm: nouveau_dma_cop Tainted: G 
W          6.2.0-rc6-vmbind-0.2+ #118
[   26.508147] Hardware name: ASUS System Product Name/PRIME Z690-A, 
BIOS 2103 09/30/2022
[   26.508148] Call Trace:
[   26.508148]  <TASK>
[   26.508149]  dump_stack_lvl+0x5b/0x77
[   26.508151]  lock_release.cold+0x45/0x4a
[   26.508154]  __mutex_unlock_slowpath+0x2a/0x260
[   26.508157]  drm_exec_unlock_all+0x7a/0xc0 [drm_exec]
[   26.508159]  drm_exec_cleanup+0x153/0x15c [drm_exec]
[   26.508162]  nouveau_exec_job_submit+0x6b/0x1b5 [nouveau]
[   26.508230]  nouveau_job_submit+0x60/0x450 [nouveau]
[   26.508307]  ? drm_sched_job_init+0x56/0x90 [gpu_sched]
[   26.508311]  nouveau_exec_ioctl_exec+0x228/0x2b0 [nouveau]
[   26.508386]  ? __pfx_nouveau_exec_ioctl_exec+0x10/0x10 [nouveau]
[   26.508457]  drm_ioctl_kernel+0xa9/0x160
[   26.508459]  drm_ioctl+0x1f7/0x4b0
<snip>

> +}
> +
> +/**
> + * drm_exec_init - initialize a drm_exec object
> + * @exec: the drm_exec object to initialize
> + * @interruptible: if locks should be acquired interruptible
> + *
> + * Initialize the object and make sure that we can track locked and duplicate

Duplicate tracking was removed.

> + * objects.
> + */
> +void drm_exec_init(struct drm_exec *exec, bool interruptible)
> +{
> +	exec->interruptible = interruptible;
> +	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +
> +	/* If allocation here fails, just delay that till the first use */
> +	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
> +	exec->num_objects = 0;
> +	exec->contended = DRM_EXEC_DUMMY;
> +	exec->prelocked = NULL;
> +}
> +EXPORT_SYMBOL(drm_exec_init);
> +
> +/**
> + * drm_exec_fini - finalize a drm_exec object
> + * @exec: the drm_exec object to finilize
> + *
> + * Unlock all locked objects, drop the references to objects and free all memory
> + * used for tracking the state.
> + */
> +void drm_exec_fini(struct drm_exec *exec)
> +{
> +	drm_exec_unlock_all(exec);
> +	kvfree(exec->objects);
> +	if (exec->contended != DRM_EXEC_DUMMY) {
> +		drm_gem_object_put(exec->contended);
> +		ww_acquire_fini(&exec->ticket);
> +	}
> +}
> +EXPORT_SYMBOL(drm_exec_fini);
> +
> +/**
> + * drm_exec_cleanup - cleanup when contention is detected
> + * @exec: the drm_exec object to cleanup
> + *
> + * Cleanup the current state and return true if we should stay inside the retry
> + * loop, false if there wasn't any contention detected and we can keep the
> + * objects locked.
> + */
> +bool drm_exec_cleanup(struct drm_exec *exec)
> +{
> +	if (likely(!exec->contended)) {
> +		ww_acquire_done(&exec->ticket);
> +		return false;
> +	}
> +
> +	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
> +		exec->contended = NULL;
> +		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> +		return true;
> +	}
> +
> +	drm_exec_unlock_all(exec);
> +	exec->num_objects = 0;
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_exec_cleanup);
> +
> +/* Track the locked object in the xa and reserve fences */
> +static int drm_exec_obj_locked(struct drm_exec *exec,
> +			       struct drm_gem_object *obj)
> +{
> +	if (unlikely(exec->num_objects == exec->max_objects)) {
> +		size_t size = exec->max_objects * sizeof(void *);
> +		void *tmp;
> +
> +		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
> +				GFP_KERNEL);
> +		if (!tmp)
> +			return -ENOMEM;
> +
> +		exec->objects = tmp;
> +		exec->max_objects += PAGE_SIZE / sizeof(void *);
> +	}
> +	drm_gem_object_get(obj);
> +	exec->objects[exec->num_objects++] = obj;
> +
> +	return 0;
> +}
> +
> +/* Make sure the contended object is locked first */
> +static int drm_exec_lock_contended(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj = exec->contended;
> +	int ret;
> +
> +	if (likely(!obj))
> +		return 0;
> +
> +	if (exec->interruptible) {
> +		ret = dma_resv_lock_slow_interruptible(obj->resv,
> +						       &exec->ticket);
> +		if (unlikely(ret))
> +			goto error_dropref;
> +	} else {
> +		dma_resv_lock_slow(obj->resv, &exec->ticket);
> +	}
> +
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (unlikely(ret)) {
> +		dma_resv_unlock(obj->resv);
> +		goto error_dropref;
> +	}
> +
> +	swap(exec->prelocked, obj);
> +
> +error_dropref:
> +	/* Always cleanup the contention so that error handling can kick in */
> +	drm_gem_object_put(obj);
> +	exec->contended = NULL;
> +	return ret;
> +}
> +
> +/**
> + * drm_exec_prepare_obj - prepare a GEM object for use
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to prepare
> + * @num_fences: how many fences to reserve
> + *
> + * Prepare a GEM object for use by locking it and reserving fence slots. All
> + * succesfully locked objects are put into the locked container. Duplicates

"successfully"

> + * detected as well and automatically moved into the duplicates container.

This comment needs update, duplicates are not tracked anymore.

> + *
> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
> + * allocation failed and zero for success.

You may also want to document that this function returns -EALREADY for 
duplicates and that the caller needs to handle it accordingly.

> + */
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences)
> +{
> +	int ret;
> +
> +	ret = drm_exec_lock_contended(exec);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (exec->prelocked == obj) {
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
> +
> +		return dma_resv_reserve_fences(obj->resv, num_fences);
> +	}
> +
> +	if (exec->interruptible)
> +		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
> +	else
> +		ret = dma_resv_lock(obj->resv, &exec->ticket);
> +
> +	if (unlikely(ret == -EDEADLK)) {
> +		drm_gem_object_get(obj);
> +		exec->contended = obj;
> +		return -EDEADLK;
> +	}
> +
> +	if (unlikely(ret))
> +		return ret;
> +
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (ret)
> +		goto error_unlock;
> +
> +	/* Keep locked when reserving fences fails */
> +	return dma_resv_reserve_fences(obj->resv, num_fences);
> +
> +error_unlock:
> +	dma_resv_unlock(obj->resv);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_exec_prepare_obj);
> +
> +MODULE_DESCRIPTION("DRM execution context");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> new file mode 100644
> index 000000000000..65e518c01db3
> --- /dev/null
> +++ b/include/drm/drm_exec.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef __DRM_EXEC_H__
> +#define __DRM_EXEC_H__
> +
> +#include <linux/ww_mutex.h>
> +
> +struct drm_gem_object;
> +
> +/**
> + * struct drm_exec - Execution context
> + */
> +struct drm_exec {
> +	/**
> +	 * @interruptible: If locks should be taken interruptible
> +	 */
> +	bool			interruptible;
> +
> +	/**
> +	 * @ticket: WW ticket used for acquiring locks
> +	 */
> +	struct ww_acquire_ctx	ticket;
> +
> +	/**
> +	 * @num_objects: number of objects locked
> +	 */
> +	unsigned int		num_objects;
> +
> +	/**
> +	 * @max_objects: maximum objects in array
> +	 */
> +	unsigned int		max_objects;
> +
> +	/**
> +	 * @objects: array of the locked objects
> +	 */
> +	struct drm_gem_object	**objects;
> +
> +	/**
> +	 * @contended: contended GEM object we backet of for

"backed off"

> +	 */
> +	struct drm_gem_object	*contended;
> +
> +	/**
> +	 * @prelocked: already locked GEM object because of contention

"due to"

> +	 */
> +	struct drm_gem_object *prelocked;
> +};
> +
> +/**
> + * drm_exec_for_each_locked_object - iterate over all the locked objects
> + * @exec: drm_exec object
> + * @index: unsigned long index for the iteration
> + * @obj: the current GEM object
> + *
> + * Iterate over all the locked GEM objects inside the drm_exec object.
> + */
> +#define drm_exec_for_each_locked_object(exec, index, obj)	\
> +	for (index = 0, obj = (exec)->objects[0];		\
> +	     index < (exec)->num_objects;			\
> +	     ++index, obj = (exec)->objects[index])
> +
> +/**
> + * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
> + * @exec: drm_exec object
> + *
> + * Core functionality of the drm_exec object. Loops until all GEM objects are
> + * prepared and no more contention exists.
> + *
> + * At the beginning of the loop it is guaranteed that no GEM object is locked.
> + */
> +#define drm_exec_while_not_all_locked(exec)	\
> +	while (drm_exec_cleanup(exec))
> +
> +/**
> + * drm_exec_continue_on_contention - continue the loop when we need to cleanup
> + * @exec: drm_exec object
> + *
> + * Control flow helper to continue when a contention was detected and we need to
> + * clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_continue_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		continue
> +
> +/**
> + * drm_exec_break_on_contention - break a subordinal loop on contention
> + * @exec: drm_exec object
> + *
> + * Control flow helper to break a subordinal loop when a contention was detected
> + * and we need to clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_break_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		break
> +
> +/**
> + * drm_exec_is_contended - check for contention
> + * @exec: drm_exec object
> + *
> + * Returns true if the drm_exec object has run into some contention while
> + * locking a GEM object and needs to clean up.
> + */
> +static inline bool drm_exec_is_contended(struct drm_exec *exec)
> +{
> +	return !!exec->contended;
> +}
> +
> +void drm_exec_init(struct drm_exec *exec, bool interruptible);
> +void drm_exec_fini(struct drm_exec *exec);
> +bool drm_exec_cleanup(struct drm_exec *exec);
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences);
> +
> +#endif

