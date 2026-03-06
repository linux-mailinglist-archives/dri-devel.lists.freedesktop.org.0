Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEKGJou6qmmiVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:29:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E821FA7B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ED910ECEE;
	Fri,  6 Mar 2026 11:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ATLeglKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAD810ECEC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HMfsnkjckdajKIWV7wxRbJD8ADPvejNdoCIJqmJGbe0=; b=ATLeglKz34io3p4fs/+zgE5HFT
 Tn/i54/XoEnQSi+5Ujv8AGwe24kj1CFdV/GJGWZ7Yk2LElNDM6uzH9oY/2zG2tH8TpswjXdYdZLuo
 dFb4Ha5vU9R/BRZjKLtB3tx5wj/1Hgl/wHjPTXkTFxpgPdyHtF4Cb2Y/1L1j3D7LxcNNVy8UdRbeP
 dG0bQ+7MNTAgosy6Puh+/PE/JLuahU/w0mXUO5N7Pmw1Mpdz0tocrdiGcOuF5fD3MIFEGK/3ziyHF
 9aiR81kwvDVk/JREYLzXkI638a5hqUWI8Lb0Cez/0HcthHna2IWWogfR3tGrjysTICUk6HKkwgxau
 hek5D1Jw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vyTMQ-00A0GZ-IN; Fri, 06 Mar 2026 12:28:50 +0100
Message-ID: <1d9813ab-67b9-43a8-a7ed-e713fab3140a@igalia.com>
Date: Fri, 6 Mar 2026 11:28:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] drm/vc4: Add new job submission implementation
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20260205-vc4-drm-scheduler-v1-0-c6174fd7bbc1@igalia.com>
 <20260205-vc4-drm-scheduler-v1-6-c6174fd7bbc1@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260205-vc4-drm-scheduler-v1-6-c6174fd7bbc1@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0D6E821FA7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,kernel.org,raspberrypi.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.269];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On 05/02/2026 21:31, Maíra Canal wrote:
> Introduce vc4_submit.c with the job submission path rewritten to
> integrate with the DRM GPU scheduler. Most of this code is adapted from
> vc4_gem.c, with key changes concentrated in the job creation and
> lifecycle management. This implementation follows the same design as the
> v3d driver.
> 
> This code coexists with the legacy path until the switchover commit.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_submit.c | 509 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 509 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_submit.c b/drivers/gpu/drm/vc4/vc4_submit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d6c684a14e6f9d9f7f456ad7fc985dbf631a7fb4
> --- /dev/null
> +++ b/drivers/gpu/drm/vc4/vc4_submit.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright © 2014 Broadcom
> + * Copyright © 2026 Raspberry Pi
> + */
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_syncobj.h>
> +
> +#include "vc4_drv.h"
> +#include "vc4_regs.h"
> +#include "vc4_trace.h"
> +
> +/* Takes the reservation lock on all the BOs being referenced, so that
> + * at queue submit time we can update the reservations.
> + *
> + * We don't lock the RCL the tile alloc/state BOs, or overflow memory
> + * (all of which are on render->unref_list). They're entirely private
> + * to vc4, so we don't attach dma-buf fences to them.
> + */
> +static int
> +vc4_lock_bo_reservations(struct vc4_render_job *job, struct drm_exec *exec)
> +{
> +	int ret;
> +
> +	/* Reserve space for our shared (read-only) fence references,
> +	 * before we commit the CL to the hardware.
> +	 */
> +	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT, job->bo_count);
> +	drm_exec_until_all_locked(exec) {
> +		ret = drm_exec_prepare_array(exec, job->bo, job->bo_count, 1);
> +	}
> +
> +	if (ret)
> +		goto fail;
> +
> +	for (int i = 0; i < job->bo_count; i++) {
> +		ret = drm_sched_job_add_implicit_dependencies(&job->base.base,
> +							      job->bo[i], true);
> +		if (ret)
> +			goto fail;
> +	}
> +
> +	return 0;
> +fail:
> +	drm_exec_fini(exec);
> +	return ret;
> +}
> +
> +/**
> + * vc4_lookup_bos() - Sets up job->bo[] with the GEM objects
> + * referenced by the job.
> + * @dev: DRM device
> + * @file_priv: DRM file for this fd
> + * @job: VC4 render job being set up
> + * @bo_handles: GEM handles
> + * @bo_count: Number of GEM handles passed in
> + *
> + * The command validator needs to reference BOs by their index within
> + * the submitted job's BO list. This does the validation of the job's
> + * BO list and reference counting for the lifetime of the job.
> + */
> +static int
> +vc4_lookup_bos(struct drm_device *dev, struct drm_file *file_priv,
> +	       struct vc4_render_job *job, u64 bo_handles, u32 bo_count)
> +{
> +	int ret = 0;
> +	int i;
> +
> +	job->bo_count = bo_count;
> +
> +	if (!job->bo_count) {
> +		drm_warn(dev, "Rendering requires BOs to validate\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(bo_handles),
> +				     job->bo_count, &job->bo);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < job->bo_count; i++) {
> +		ret = vc4_bo_inc_usecnt(to_vc4_bo(job->bo[i]));

Quite odd model in vc4 that this can fail for completely different 
reasons. Looking into vc4_bo_inc_usecnt().. There are reference counts 
for the same bo? One GEM and one vc4, why?

The runtime invariant check is needed at this level, I mean this one?:

	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
		return -ENODEV;

It cannot be moved somewhere higher up the chain? There can legitimately 
be a mix of bos with different vc4_dev?

> +		if (ret)
> +			goto fail_dec_usecnt;
> +	}
> +
> +	return 0;
> +
> +fail_dec_usecnt:
> +	/* Decrease usecnt on acquired objects */
> +	for (i-- ; i >= 0; i--)
> +		vc4_bo_dec_usecnt(to_vc4_bo(job->bo[i]));

kvfree(job->bo)?

> +	return ret;
> +}
> +
> +static int
> +vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
> +{
> +	struct drm_vc4_submit_cl *args = exec->args;
> +	struct vc4_render_job *render_job = exec->render;
> +	struct vc4_bin_job *bin_job = exec->bin;
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +	struct drm_gem_dma_object *exec_bo;
> +	void *temp = NULL;
> +	void *bin;
> +	int ret = 0;

No need to init on a glance.

> +	uint32_t bin_offset = 0;

This one is never modified so maybe remove?

> +	uint32_t shader_rec_offset = roundup(bin_offset + args->bin_cl_size, 16);
> +	uint32_t uniforms_offset = shader_rec_offset + args->shader_rec_size;
> +	uint32_t exec_size = uniforms_offset + args->uniforms_size;
> +	uint32_t temp_size = exec_size + (sizeof(struct vc4_shader_state) *
> +					  args->shader_rec_count);
> +	struct vc4_bo *bo;

Line len sorting of the declaration block is quite unsightly but maybe 
it is straight copy and paste so you did not want to tidy it in the same go.

> +
> +	if (shader_rec_offset < args->bin_cl_size ||
> +	    uniforms_offset < shader_rec_offset ||
> +	    exec_size < uniforms_offset ||
> +	    args->shader_rec_count >= (UINT_MAX /
> +					  sizeof(struct vc4_shader_state)) ||
> +	    temp_size < exec_size) {
> +		drm_dbg(dev, "overflow in exec arguments\n");
> +		ret = -EINVAL;
> +		goto fail;
> +	}
> +
> +	/* Allocate space where we'll store the copied in user command lists
> +	 * and shader records.
> +	 *
> +	 * We don't just copy directly into the BOs because we need to
> +	 * read the contents back for validation, and I think the
> +	 * bo->vaddr is uncached access.
> +	 */
> +	temp = kvmalloc_array(temp_size, 1, GFP_KERNEL);

Is kvmalloc_array how byte buffers are allocated these days?

> +	if (!temp) {
> +		drm_err(dev, "Failed to allocate storage for copying in bin/render CLs.");

drm_err probably does not add much on top of the kvmalloc failure backtrace.

> +		ret = -ENOMEM;
> +		goto fail;
> +	}
> +	bin = temp + bin_offset;
> +	exec->shader_rec_u = temp + shader_rec_offset;
> +	exec->uniforms_u = temp + uniforms_offset;
> +	exec->shader_state = temp + exec_size;
> +	exec->shader_state_size = args->shader_rec_count;
> +
> +	if (copy_from_user(bin, u64_to_user_ptr(args->bin_cl),
> +			   args->bin_cl_size)) {
> +		ret = -EFAULT;
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(exec->shader_rec_u, u64_to_user_ptr(args->shader_rec),
> +			   args->shader_rec_size)) {
> +		ret = -EFAULT;
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(exec->uniforms_u, u64_to_user_ptr(args->uniforms),
> +			   args->uniforms_size)) {
> +		ret = -EFAULT;
> +		goto fail;
> +	}
> +
> +	bo = vc4_bo_create(dev, exec_size, true, VC4_BO_TYPE_BCL);
> +	if (IS_ERR(bo)) {
> +		drm_err(dev, "Couldn't allocate BO for binning\n");
> +		ret = PTR_ERR(bo);
> +		goto fail;
> +	}
> +	exec_bo = &bo->base;
> +
> +	list_add_tail(&bo->unref_head, &render_job->unref_list);
> +
> +	bin_job->ct0ca = exec_bo->dma_addr + bin_offset;
> +
> +	exec->bin_u = bin;
> +
> +	exec->shader_rec_v = exec_bo->vaddr + shader_rec_offset;
> +	exec->shader_rec_p = exec_bo->dma_addr + shader_rec_offset;
> +	exec->shader_rec_size = args->shader_rec_size;
> +
> +	exec->uniforms_v = exec_bo->vaddr + uniforms_offset;
> +	exec->uniforms_p = exec_bo->dma_addr + uniforms_offset;
> +	exec->uniforms_size = args->uniforms_size;
> +
> +	ret = vc4_validate_bin_cl(dev, exec_bo->vaddr + bin_offset, bin, exec);
> +	if (ret)
> +		goto fail;
> +
> +	ret = vc4_validate_shader_recs(dev, exec);
> +	if (ret)
> +		goto fail;
> +
> +	if (exec->found_tile_binning_mode_config_packet) {
> +		ret = vc4_v3d_bin_bo_get(vc4, &bin_job->bin_bo_used);
> +		if (ret)
> +			goto fail;
> +	}
> +
> +fail:
> +	kvfree(temp);
> +	return ret;
> +}
> +
> +static void
> +vc4_job_free(struct kref *ref)
> +{
> +	struct vc4_job *job = container_of(ref, struct vc4_job, refcount);
> +
> +	dma_fence_put(job->irq_fence);
> +	dma_fence_put(job->done_fence);
> +
> +	if (job->perfmon)
> +		vc4_perfmon_put(job->perfmon);
> +
> +	vc4_v3d_pm_put(job->vc4);
> +	kfree(job);
> +}
> +
> +static void
> +vc4_bin_job_free(struct kref *ref)
> +{
> +	struct vc4_bin_job *job = container_of(ref, struct vc4_bin_job,
> +					       base.refcount);
> +	struct vc4_dev *vc4 = job->base.vc4;
> +
> +	/* Release the reference on the binner BO if needed. */
> +	if (job->bin_bo_used)
> +		vc4_v3d_bin_bo_put(vc4);
> +
> +	vc4_job_free(ref);
> +}
> +
> +static void
> +vc4_render_job_free(struct kref *ref)
> +{
> +	struct vc4_render_job *job = container_of(ref, struct vc4_render_job,
> +						  base.refcount);
> +	struct vc4_dev *vc4 = job->base.vc4;
> +	struct vc4_bo *bo, *tmp;
> +	unsigned long irqflags;
> +	int i;
> +
> +	if (job->bo) {
> +		for (i = 0; i < job->bo_count; i++) {
> +			struct vc4_bo *bo = to_vc4_bo(job->bo[i]);
> +
> +			vc4_bo_dec_usecnt(bo);
> +			drm_gem_object_put(job->bo[i]);
> +		}
> +		kvfree(job->bo);
> +	}
> +
> +	list_for_each_entry_safe(bo, tmp, &job->unref_list, unref_head) {
> +		list_del(&bo->unref_head);
> +		drm_gem_object_put(&bo->base.base);
> +	}
> +
> +	/* Free up the allocation of any bin slots we used. */
> +	spin_lock_irqsave(&vc4->job_lock, irqflags);
> +	vc4->bin_alloc_used &= ~job->bin_slots;
> +	spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> +
> +	vc4_job_free(ref);
> +}
> +
> +static void
> +vc4_job_put(struct vc4_job *job)
> +{
> +	if (!job)
> +		return;
> +
> +	kref_put(&job->refcount, job->free);
> +}
> +
> +void vc4_job_cleanup(struct vc4_job *job)
> +{
> +	if (!job)
> +		return;
> +
> +	drm_sched_job_cleanup(&job->base);
> +	vc4_job_put(job);
> +}
> +
> +static int
> +vc4_job_init(struct vc4_dev *vc4, struct drm_file *file_priv,
> +	     void **container, size_t size, void (*free)(struct kref *ref),
> +	     u32 in_sync, enum vc4_queue queue)
> +{
> +	struct vc4_file *vc4_priv = file_priv->driver_priv;
> +	struct vc4_job *job;
> +	int ret;
> +
> +	*container = kcalloc(1, size, GFP_KERNEL);

Renaming the function to _alloc looks would have been more correct.

> +	if (!*container) {
> +		drm_err(&vc4->base, "Cannot allocate memory for VC4 job.");

Another questionable value add log.

> +		return -ENOMEM;
> +	}
> +
> +	job = *container;
> +	job->vc4 = vc4;
> +	job->free = free;
> +
> +	ret = drm_sched_job_init(&job->base, &vc4_priv->sched_entity[queue],
> +				 1, vc4_priv, file_priv->client_id);
> +	if (ret)
> +		goto fail;
> +
> +	ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv,
> +						   in_sync, 0);
> +	if (ret && ret != -ENOENT)
> +		goto fail_deps;

!= ENOENT is a shortcut so callers can pass in a zero ie. no dependency? 
If so it would have been more obvious to just skip the call. Or there is 
a special reason why userspace is allowed to pass in garbage and kernel 
silently ignores it?

> +
> +	ret = vc4_v3d_pm_get(vc4);
> +	if (ret)
> +		goto fail_deps;
> +
> +	kref_init(&job->refcount);
> +
> +	return 0;
> +
> +fail_deps:
> +	drm_sched_job_cleanup(&job->base);
> +fail:
> +	kfree(*container);
> +	*container = NULL;
> +
> +	return ret;
> +}
> +
> +static void
> +vc4_push_job(struct vc4_job *job)
> +{
> +	drm_sched_job_arm(&job->base);
> +
> +	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> +
> +	/* put by scheduler job completion */
> +	kref_get(&job->refcount);
> +
> +	drm_sched_entity_push_job(&job->base);
> +}
> +
> +static void
> +vc4_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
> +					 struct vc4_render_job *job,
> +					 struct drm_exec *exec,
> +					 u32 out_sync,
> +					 struct dma_fence *done_fence)
> +{
> +	struct drm_syncobj *sync_out;
> +	struct vc4_bo *bo;
> +	int i;
> +
> +	for (i = 0; i < job->bo_count; i++) {
> +		bo = to_vc4_bo(job->bo[i]);
> +		dma_resv_add_fence(bo->base.base.resv, job->base.done_fence,
> +				   DMA_RESV_USAGE_READ);
> +	}
> +
> +	for (i = 0; i < job->rcl_write_bo_count; i++) {
> +		bo = to_vc4_bo(&job->rcl_write_bo[i]->base);
> +		dma_resv_add_fence(bo->base.base.resv, job->base.done_fence,
> +				   DMA_RESV_USAGE_WRITE);
> +	}
> +
> +	drm_exec_fini(exec);
> +
> +	/* Update the return sync object for the job */
> +	sync_out = drm_syncobj_find(file_priv, out_sync);
> +	if (sync_out) {

Similar as above, we could skip calling drm_syncobj_find() if out sync 
was not requested. Not sure what is the typical situation here but if no 
out sync is common why add latency for a pointless function call and 
lookup if code already knows the answer.

> +		drm_syncobj_replace_fence(sync_out, done_fence);
> +		drm_syncobj_put(sync_out);
> +	}
> +}
> +
> +/**
> + * vc4_submit_cl_ioctl() - Submits a job (frame) to VC4.
> + * @dev: DRM device
> + * @data: ioctl argument
> + * @file_priv: DRM file for this fd
> + *
> + * This is the main entrypoint for userspace to submit a 3D frame to
> + * the GPU. Userspace provides the binner command list (if
> + * applicable), and the kernel sets up the render command list to draw
> + * to the framebuffer described in the ioctl, using the command lists
> + * that the 3D engine's binner will produce.
> + */
> +int
> +vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> +		    struct drm_file *file_priv)
> +{
> +	struct vc4_dev *vc4 = to_vc4_dev(dev);
> +	struct vc4_file *vc4_priv = file_priv->driver_priv;
> +	struct drm_vc4_submit_cl *args = data;
> +	struct vc4_exec_info exec = {
> +		.dev = vc4,
> +		.args = args,
> +	};
> +	struct vc4_bin_job *bin = NULL;
> +	struct vc4_render_job *render = NULL;
> +	struct drm_exec exec_ctx;
> +	int ret = 0;

No need to init ret.

> +
> +	trace_vc4_submit_cl_ioctl(dev, args->bin_cl_size, args->shader_rec_size,
> +				  args->bo_handle_count);
> +
> +	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
> +		return -ENODEV;
> +
> +	if (!vc4->v3d) {
> +		drm_dbg(dev, "VC4_SUBMIT_CL with no VC4 V3D probed\n");
> +		return -ENODEV;
> +	}
> +
> +	if ((args->flags & ~(VC4_SUBMIT_CL_USE_CLEAR_COLOR |
> +			     VC4_SUBMIT_CL_FIXED_RCL_ORDER |
> +			     VC4_SUBMIT_CL_RCL_ORDER_INCREASING_X |
> +			     VC4_SUBMIT_CL_RCL_ORDER_INCREASING_Y)) != 0) {
> +		drm_dbg(dev, "Unknown flags: 0x%02x\n", args->flags);
> +		return -EINVAL;
> +	}
> +
> +	if (args->pad2 != 0) {
> +		drm_dbg(dev, "Invalid pad: 0x%08x\n", args->pad2);
> +		return -EINVAL;
> +	}
> +
> +	ret = vc4_job_init(vc4, file_priv, (void *)&render, sizeof(*render),

The (void *) casts are probably not needed.

> +			   vc4_render_job_free, args->in_sync, VC4_RENDER);
> +	if (ret)
> +		return ret;
> +
> +	exec.render = render;
> +	INIT_LIST_HEAD(&render->unref_list);
> +
> +	ret = vc4_lookup_bos(dev, file_priv, render, args->bo_handles,
> +			     args->bo_handle_count);
> +	if (ret)
> +		goto fail;
> +
> +	if (args->bin_cl_size != 0) {
> +		ret = vc4_job_init(vc4, file_priv, (void *)&bin, sizeof(*bin),
> +				   vc4_bin_job_free, args->in_sync, VC4_BIN);
> +		if (ret)
> +			goto fail;
> +
> +		exec.bin = bin;
> +		bin->render = render;
> +
> +		ret = vc4_get_bcl(dev, &exec);
> +		if (ret)
> +			goto fail;
> +	}
> +
> +	ret = vc4_get_rcl(dev, &exec);
> +	if (ret)
> +		goto fail;

Presumably cleanup (should one of the below steps fails) relies on the 
unref list?

> +
> +	ret = vc4_lock_bo_reservations(render, &exec_ctx);
> +	if (ret)
> +		goto fail;
> +
> +	if (args->perfmonid) {
> +		render->base.perfmon = vc4_perfmon_find(vc4_priv, args->perfmonid);
> +		if (!render->base.perfmon) {
> +			ret = -ENOENT;
> +			goto fail_perfmon;
> +		}
> +
> +		if (bin) {
> +			bin->base.perfmon = render->base.perfmon;
> +			vc4_perfmon_get(bin->base.perfmon);
> +		}
> +	}
> +
> +	mutex_lock(&vc4->sched_lock);
> +	if (bin) {
> +		vc4_push_job(&bin->base);
> +
> +		ret = drm_sched_job_add_dependency(&render->base.base,
> +						   dma_fence_get(bin->base.done_fence));
> +		if (ret)
> +			goto fail_unreserve;
> +	}
> +
> +	vc4_push_job(&render->base);
> +	mutex_unlock(&vc4->sched_lock);
> +
> +	vc4_attach_fences_and_unlock_reservation(file_priv, render,
> +						 &exec_ctx, args->out_sync,
> +						 render->base.done_fence);

I am not sure this is a 100% helpful helper since it only passes in 
exec_ctx for the sole purpose of calling drm_exec_fini. Might be clearer 
to open code that and simplify the function name and signature?

> +
> +	vc4_job_put((void *)bin);
> +	vc4_job_put((void *)render);
> +
> +	return 0;
> +
> +fail_unreserve:
> +	mutex_unlock(&vc4->sched_lock);
> +fail_perfmon:
> +	drm_exec_fini(&exec_ctx);
> +fail:
> +	vc4_job_cleanup((void *)bin);
> +	vc4_job_cleanup((void *)render);
> +
> +	return ret;
> +}
> 

Regards,

Tvrtko
