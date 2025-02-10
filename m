Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F6A2EF1B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629710E0D6;
	Mon, 10 Feb 2025 14:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O1az4Imi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777FF10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739196093;
 bh=kPze+pNQzUNpjNT8GEkxqP89h6kiJEF9oU3AtIW6GJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O1az4Imi7vbK17ebnEZtl4LDIpkzxnqo8kHLyjUQYOdnNOH7h73+Yd/aL4PQjLM2b
 CJqv1y6Y+MPP6WEBojc5j8KMsXP8FXPQNdpuo97+aElvlLYuJjMN60D7mOFuszp9qj
 WlpJUBiKyQZs8UCycYpE5Wa+RFYuXMMz0IC3CSneoXueXTmm8R7AtgwVT5Krw24gmg
 BbTO+YSMIt3krTefnDzKh10veVZ3xlVoNmkoibT4hLI/09ajpxHk2UNwm3e/CUfkW+
 bBsDkQ8Pt3N63Me0HJMkJeW+yD+77g5xKyH6xQWGED1MZUT7RLvgcYE93WSV001l9X
 L7rosibweWwkA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C4A317E0B59;
 Mon, 10 Feb 2025 15:01:32 +0100 (CET)
Date: Mon, 10 Feb 2025 15:01:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <nd@arm.com>, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 5/5] drm/panthor: Add support for entering and
 exiting protected mode
Message-ID: <20250210150125.3da7bcf5@collabora.com>
In-Reply-To: <d41f08f356d9fa01f497e8b8f95f1bed069be464.1738228114.git.florent.tomasin@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <d41f08f356d9fa01f497e8b8f95f1bed069be464.1738228114.git.florent.tomasin@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Jan 2025 13:09:01 +0000
Florent Tomasin <florent.tomasin@arm.com> wrote:

> This patch modifies the Panthor driver code to allow handling
> of the GPU HW protected mode enter and exit.
> 
> The logic added by this patch only includes the mechanisms
> needed for entering and exiting protected mode. The submission of
> a protected mode jobs is not covered by this patch series
> and is responsibility of the user space program.
> 
> To help with the review, here are some important information
> about Mali GPU protected mode enter and exit:
> - When the GPU detects a protected mode job needs to be
>   executed, an IRQ is sent to the CPU to notify the kernel
>   driver that the job is blocked until the GPU has entered
>   protected mode. The entering of protected mode is controlled
>   by the kernel driver.
> - The Mali Panthor CSF driver will schedule a tick and evaluate
>   which CS in the CSG to schedule on slot needs protected mode.
>   If the priority of the CSG is not sufficiently high, the
>   protected mode job will not progress until the CSG is
>   scheduled at top priority.
> - The Panthor scheduler notifies the GPU that the blocked
>   protected jobs will soon be able to progress.
> - Once all CSG and CS slots are updated, the scheduler
>   requests the GPU to enter protected mode and waits for
>   it to be acknowledged.
> - If successful, all protected mode jobs will resume execution
>   while normal mode jobs block until the GPU exits
>   protected mode, or the kernel driver rotates the CSGs
>   and forces the GPU to exit protected mode.
> - If unsuccessful, the scheduler will request a GPU reset.
> - When a protected mode job is suspended as a result of
>   the CSGs rotation, the GPU will send an IRQ to the CPU
>   to notify that the protected mode job needs to resume.
> 
> This sequence will continue so long the user space is
> submitting protected mode jobs.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |   3 +
>  drivers/gpu/drm/panthor/panthor_fw.c     |  10 +-
>  drivers/gpu/drm/panthor/panthor_sched.c  | 119 +++++++++++++++++++++--
>  3 files changed, 122 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 406de9e888e2..0c76bfd392a0 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -196,6 +196,9 @@ struct panthor_device {
>  	struct {
>  		/** @heap: Pointer to the protected heap */
>  		struct dma_heap *heap;
> +
> +		/** @pending: Set to true if a protected mode enter request is pending. */
> +		bool pending;

If this is only used by panthor_sched.c, I'd be tempted to keep that in
the panthor_scheduler struct.

>  	} protm;
>  };
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 7822af1533b4..2006d652f4db 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1025,13 +1025,19 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  	glb_iface->input->progress_timer = PROGRESS_TIMEOUT_CYCLES >> PROGRESS_TIMEOUT_SCALE_SHIFT;
>  	glb_iface->input->idle_timer = panthor_fw_conv_timeout(ptdev, IDLE_HYSTERESIS_US);
>  
> -	/* Enable interrupts we care about. */
> +	/* Enable interrupts we care about.
> +	 *
> +	 * GLB_PROTM_ENTER and GLB_PROTM_EXIT interrupts are only
> +	 * relevant if a protected memory heap is present.
> +	 */
>  	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
>  					 GLB_PING |
>  					 GLB_CFG_PROGRESS_TIMER |
>  					 GLB_CFG_POWEROFF_TIMER |
>  					 GLB_IDLE_EN |
> -					 GLB_IDLE;
> +					 GLB_IDLE |
> +					 (ptdev->protm.heap ?
> +					 (GLB_PROTM_ENTER | GLB_PROTM_EXIT) : 0);

How about we keep things simple and unconditionally enable the PROTM
interrupts? If the group doesn't support protected mode, it should
generate PROTM events anyway. And if it does, we probably want to know
and kill the group immediately.

>  
>  	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
>  	panthor_fw_toggle_reqs(glb_iface, req, ack,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e260ed8aef5b..c10a21f9d075 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -573,6 +573,9 @@ struct panthor_group {
>  	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
>  	u32 fatal_queues;
>  
> +	/** @protm_queues: Bitmask reflecting the queues that are waiting on a CS_PROTM_PENDING. */
> +	u32 protm_queues;

How about protm_pending_queues or protm_pending_mask, otherwise
it gets confusing. I initially thought it was a mask encoding the CS
that are in protected mode, but the bit is cleared as soon as we
acknowledge a request. BTW, what happens when we resume a CS that was
suspended inside a protected section? Do we get a new PROTM_PEND event?

I feel like the whole sequence and corner cases should be documented
somewhere in the code, because it's not obvious.

> +
>  	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
>  	atomic_t tiler_oom;
>  
> @@ -870,6 +873,31 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  	return NULL;
>  }
>  
> +static int glb_protm_enter(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface;
> +	u32 acked;
> +	int ret;
> +
> +	lockdep_assert_held(&ptdev->scheduler->lock);
> +
> +	if (!ptdev->protm.pending)
> +		return 0;
> +
> +	glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PROTM_ENTER);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PROTM_ENTER, &acked, 4000);
> +	if (ret)
> +		drm_err(&ptdev->base, "FW protm enter timeout, scheduling a reset");
> +	else
> +		ptdev->protm.pending = false;
> +
> +	return ret;
> +}
> +
>  static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
>  {
>  	if (IS_ERR_OR_NULL(queue))
> @@ -1027,6 +1055,7 @@ group_unbind_locked(struct panthor_group *group)
>   * @ptdev: Device.
>   * @csg_id: Group slot ID.
>   * @cs_id: Queue slot ID.
> + * @protm_ack: Acknowledge pending protected mode queues
>   *
>   * Program a queue slot with the queue information so things can start being
>   * executed on this queue.
> @@ -1034,10 +1063,13 @@ group_unbind_locked(struct panthor_group *group)
>   * The group slot must have a group bound to it already (group_bind_locked()).
>   */
>  static void
> -cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
> +cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id, bool protm_ack)
>  {
> -	struct panthor_queue *queue = ptdev->scheduler->csg_slots[csg_id].group->queues[cs_id];
> +	struct panthor_group * const group = ptdev->scheduler->csg_slots[csg_id].group;
> +	struct panthor_queue *queue = group->queues[cs_id];
>  	struct panthor_fw_cs_iface *cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
> +	u32 const cs_protm_pending_mask =
> +		protm_ack && (group->protm_queues & BIT(cs_id)) ? CS_PROTM_PENDING : 0;
>  
>  	lockdep_assert_held(&ptdev->scheduler->lock);
>  
> @@ -1055,15 +1087,22 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  			       CS_IDLE_SYNC_WAIT |
>  			       CS_IDLE_EMPTY |
>  			       CS_STATE_START |
> -			       CS_EXTRACT_EVENT,
> +			       CS_EXTRACT_EVENT |
> +			       cs_protm_pending_mask,
>  			       CS_IDLE_SYNC_WAIT |
>  			       CS_IDLE_EMPTY |
>  			       CS_STATE_MASK |
> -			       CS_EXTRACT_EVENT);
> +			       CS_EXTRACT_EVENT |
> +			       CS_PROTM_PENDING);
>  	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
>  		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
>  		queue->timeout_suspended = false;
>  	}
> +
> +	if (cs_protm_pending_mask) {
> +		group->protm_queues &= ~BIT(cs_id);
> +		ptdev->protm.pending = true;
> +	}
>  }
>  
>  /**
> @@ -1274,7 +1313,7 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>  }
>  
>  static int
> -csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
> +csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority, bool protm_ack)
>  {
>  	struct panthor_fw_csg_iface *csg_iface;
>  	struct panthor_csg_slot *csg_slot;
> @@ -1291,14 +1330,14 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  
>  	csg_slot = &ptdev->scheduler->csg_slots[csg_id];
>  	group = csg_slot->group;
> -	if (!group || group->state == PANTHOR_CS_GROUP_ACTIVE)
> +	if (!group || (group->state == PANTHOR_CS_GROUP_ACTIVE && !protm_ack))
>  		return 0;
>  
>  	csg_iface = panthor_fw_get_csg_iface(group->ptdev, csg_id);
>  
>  	for (i = 0; i < group->queue_count; i++) {
>  		if (group->queues[i]) {
> -			cs_slot_prog_locked(ptdev, csg_id, i);
> +			cs_slot_prog_locked(ptdev, csg_id, i, protm_ack);
>  			queue_mask |= BIT(i);
>  		}
>  	}
> @@ -1329,6 +1368,34 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  	return 0;
>  }
>  
> +static void
> +cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
> +					   u32 csg_id, u32 cs_id)
> +{
> +	struct panthor_scheduler *sched = ptdev->scheduler;
> +	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
> +	struct panthor_group *group = csg_slot->group;
> +
> +	lockdep_assert_held(&sched->lock);
> +
> +	if (!group)
> +		return;
> +
> +	/* No protected memory heap, a user space program tried to
> +	 * submit a protected mode jobs resulting in the GPU raising
> +	 * a CS_PROTM_PENDING request.
> +	 *
> +	 * This scenario is invalid and the protected mode jobs must
> +	 * not be allowed to progress.
> +	 */
> +	if (drm_WARN_ON_ONCE(&ptdev->base, !ptdev->protm.heap))
> +		return;
> +
> +	group->protm_queues |= BIT(cs_id);
> +
> +	sched_queue_delayed_work(sched, tick, 0);
> +}
> +
>  static void
>  cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  				   u32 csg_id, u32 cs_id)
> @@ -1566,6 +1633,9 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
>  	if (events & CS_TILER_OOM)
>  		cs_slot_process_tiler_oom_event_locked(ptdev, csg_id, cs_id);
>  
> +	if (events & CS_PROTM_PENDING)
> +		cs_slot_process_protm_pending_event_locked(ptdev, csg_id, cs_id);
> +
>  	/* We don't acknowledge the TILER_OOM event since its handling is
>  	 * deferred to a separate work.
>  	 */
> @@ -1703,6 +1773,17 @@ static void sched_process_idle_event_locked(struct panthor_device *ptdev)
>  	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
>  }
>  
> +static void sched_process_protm_exit_event_locked(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +	lockdep_assert_held(&ptdev->scheduler->lock);
> +
> +	/* Acknowledge the protm exit and schedule a tick. */
> +	panthor_fw_update_reqs(glb_iface, req, glb_iface->output->ack, GLB_PROTM_EXIT);

I would keep this ack in panthor_fw.c (just like I would keep the enter
handler at the _fw.c level).

> +	sched_queue_delayed_work(ptdev->scheduler, tick, 0);
> +}
> +
>  /**
>   * sched_process_global_irq_locked() - Process the scheduling part of a global IRQ
>   * @ptdev: Device.
> @@ -1720,6 +1801,9 @@ static void sched_process_global_irq_locked(struct panthor_device *ptdev)
>  
>  	if (evts & GLB_IDLE)
>  		sched_process_idle_event_locked(ptdev);
> +
> +	if (evts & GLB_PROTM_EXIT)
> +		sched_process_protm_exit_event_locked(ptdev);
>  }
>  
>  static void process_fw_events_work(struct work_struct *work)
> @@ -2238,9 +2322,22 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  		list_for_each_entry(group, &ctx->groups[prio], run_node) {
>  			int csg_id = group->csg_id;
>  			struct panthor_fw_csg_iface *csg_iface;
> +			bool protm_ack = false;
> +
> +			/* The highest priority group has pending protected mode queues */
> +			if (new_csg_prio == MAX_CSG_PRIO && group->protm_queues)
> +				protm_ack = true;

I'd rather have an `enter_protm` field added to panthor_sched_tick_ctx,
and then have this ctx passed to csg_slot_prog_locked() so they can
check themselves if they need to ack PROTM requests.

>  
>  			if (csg_id >= 0) {
>  				new_csg_prio--;
> +
> +				/* This group is on slot but at least one queue
> +				 * is waiting for PROTM_ENTER.
> +				 */
> +				if (protm_ack)
> +					csg_slot_prog_locked(ptdev, csg_id,
> +							     new_csg_prio, protm_ack);
> +
>  				continue;
>  			}
>  
> @@ -2251,7 +2348,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  			csg_slot = &sched->csg_slots[csg_id];
>  			group_bind_locked(group, csg_id);
> -			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
> +			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--, protm_ack);
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
>  						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
>  						CSG_STATE_RESUME : CSG_STATE_START,
> @@ -2303,6 +2400,12 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  
>  	sched->used_csg_slot_count = ctx->group_count;
>  	sched->might_have_idle_groups = ctx->idle_group_count > 0;
> +
> +	ret = glb_protm_enter(ptdev);
> +	if (ret) {
> +		panthor_device_schedule_reset(ptdev);
> +		ctx->csg_upd_failed_mask = U32_MAX;
> +	}
>  }
>  
>  static u64

