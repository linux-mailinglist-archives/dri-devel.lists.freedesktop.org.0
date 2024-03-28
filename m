Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF505890337
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B295F10EF80;
	Thu, 28 Mar 2024 15:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fm4u9YVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B15110EF80
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:38:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AE4560CA4;
 Thu, 28 Mar 2024 15:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E81C433F1;
 Thu, 28 Mar 2024 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711640292;
 bh=a3UiF8Jb5VsXbW8jUWWhts4BMqGG1Eg6dk9smFBR0Hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fm4u9YVvM62G4iA4zhCy+erMwipS4b5BSZOx7Cmzuo1x17b+BJJYzqNqSkliEMtfw
 DQxQRnqinXSN4Z0eL7TtHPM0Hg3GfrACIrroy4JWQOCAYvQL8+JVtriCdrOgJOxrTL
 QNqWYQuR3Mq/bzT3a7tbXgt8j3sZ1TYUSYzgns6LGwG5ifaa4Jls7WPf5cDXXschNK
 uoIcAO0XYD9+jOFTVc+2Lx8URvVLW9JnoboNm7QRLfJMzdpHxo9u97+vXsh9tYTp8A
 xtc5/l6l8Lj3UOcBQFsBzI+lXueMnhM+DFnyX5Xk5eduwrQD6zNXfQkw9dQedrlfQO
 0CctndvqCj0Kw==
Date: Thu, 28 Mar 2024 08:38:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Maxime Ripard <mripard@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v6 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240328153809.GA2673768@dev-arch.thelio-3990X>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229162230.2634044-11-boris.brezillon@collabora.com>
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

Hi Boris,

On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
<snip>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3502 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |   50 +
>  2 files changed, 3552 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> new file mode 100644
> index 000000000000..5f7803b6fc48
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
<snip>
> +static void
> +tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
> +{
> +	struct panthor_group *group, *tmp;
> +	struct panthor_device *ptdev = sched->ptdev;
> +	struct panthor_csg_slot *csg_slot;
> +	int prio, new_csg_prio = MAX_CSG_PRIO, i;
> +	u32 csg_mod_mask = 0, free_csg_slots = 0;
> +	struct panthor_csg_slots_upd_ctx upd_ctx;
> +	int ret;
> +
> +	csgs_upd_ctx_init(&upd_ctx);
> +
> +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> +		/* Suspend or terminate evicted groups. */
> +		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
> +			bool term = !group_can_run(group);
> +			int csg_id = group->csg_id;
> +
> +			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
> +				continue;
> +
> +			csg_slot = &sched->csg_slots[csg_id];
> +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> +						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
> +						CSG_STATE_MASK);
> +		}
> +
> +		/* Update priorities on already running groups. */
> +		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> +			struct panthor_fw_csg_iface *csg_iface;
> +			int csg_id = group->csg_id;
> +
> +			if (csg_id < 0) {
> +				new_csg_prio--;
> +				continue;
> +			}
> +
> +			csg_slot = &sched->csg_slots[csg_id];
> +			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> +			if (csg_slot->priority == new_csg_prio) {
> +				new_csg_prio--;
> +				continue;
> +			}
> +
> +			panthor_fw_update_reqs(csg_iface, endpoint_req,
> +					       CSG_EP_REQ_PRIORITY(new_csg_prio),
> +					       CSG_EP_REQ_PRIORITY_MASK);
> +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> +						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> +						CSG_ENDPOINT_CONFIG);
> +			new_csg_prio--;
> +		}
> +	}
> +
> +	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> +	if (ret) {
> +		panthor_device_schedule_reset(ptdev);
> +		ctx->csg_upd_failed_mask |= upd_ctx.timedout_mask;
> +		return;
> +	}
> +
> +	/* Unbind evicted groups. */
> +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> +		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
> +			/* This group is gone. Process interrupts to clear
> +			 * any pending interrupts before we start the new
> +			 * group.
> +			 */
> +			if (group->csg_id >= 0)
> +				sched_process_csg_irq_locked(ptdev, group->csg_id);
> +
> +			group_unbind_locked(group);
> +		}
> +	}
> +
> +	for (i = 0; i < sched->csg_slot_count; i++) {
> +		if (!sched->csg_slots[i].group)
> +			free_csg_slots |= BIT(i);
> +	}
> +
> +	csgs_upd_ctx_init(&upd_ctx);
> +	new_csg_prio = MAX_CSG_PRIO;
> +
> +	/* Start new groups. */
> +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> +		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> +			int csg_id = group->csg_id;
> +			struct panthor_fw_csg_iface *csg_iface;
> +
> +			if (csg_id >= 0) {
> +				new_csg_prio--;
> +				continue;
> +			}
> +
> +			csg_id = ffs(free_csg_slots) - 1;
> +			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
> +				break;
> +
> +			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> +			csg_slot = &sched->csg_slots[csg_id];
> +			csg_mod_mask |= BIT(csg_id);
> +			group_bind_locked(group, csg_id);
> +			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
> +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> +						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
> +						CSG_STATE_RESUME : CSG_STATE_START,
> +						CSG_STATE_MASK);
> +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> +						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> +						CSG_ENDPOINT_CONFIG);
> +			free_csg_slots &= ~BIT(csg_id);
> +		}
> +	}
> +
> +	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> +	if (ret) {
> +		panthor_device_schedule_reset(ptdev);
> +		ctx->csg_upd_failed_mask |= upd_ctx.timedout_mask;
> +		return;
> +	}
> +
> +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> +		list_for_each_entry_safe(group, tmp, &ctx->groups[prio], run_node) {
> +			list_del_init(&group->run_node);
> +
> +			/* If the group has been destroyed while we were
> +			 * scheduling, ask for an immediate tick to
> +			 * re-evaluate as soon as possible and get rid of
> +			 * this dangling group.
> +			 */
> +			if (group->destroyed)
> +				ctx->immediate_tick = true;
> +			group_put(group);
> +		}
> +
> +		/* Return evicted groups to the idle or run queues. Groups
> +		 * that can no longer be run (because they've been destroyed
> +		 * or experienced an unrecoverable error) will be scheduled
> +		 * for destruction in tick_ctx_cleanup().
> +		 */
> +		list_for_each_entry_safe(group, tmp, &ctx->old_groups[prio], run_node) {
> +			if (!group_can_run(group))
> +				continue;
> +
> +			if (group_is_idle(group))
> +				list_move_tail(&group->run_node, &sched->groups.idle[prio]);
> +			else
> +				list_move_tail(&group->run_node, &sched->groups.runnable[prio]);
> +			group_put(group);
> +		}
> +	}
> +
> +	sched->used_csg_slot_count = ctx->group_count;
> +	sched->might_have_idle_groups = ctx->idle_group_count > 0;
> +}

Clang builds fail after this change in -next as commit
de8548813824 ("drm/panthor: Add the scheduler logical block"):

  drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mod_mask' set but not used [-Werror,-Wunused-but-set-variable]
   2048 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
        |             ^
  1 error generated.

It appears legitimate to me, csg_mod_mask is only updated with '|=' but
never accessed in any other manner. Should the variable be removed or
was it supposed to be used somewhere else?

Cheers,
Nathan

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5f7803b6fc48..e5a710f190d2 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2045,7 +2045,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_csg_slot *csg_slot;
 	int prio, new_csg_prio = MAX_CSG_PRIO, i;
-	u32 csg_mod_mask = 0, free_csg_slots = 0;
+	u32 free_csg_slots = 0;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
 	int ret;
 
@@ -2139,7 +2139,6 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 			csg_slot = &sched->csg_slots[csg_id];
-			csg_mod_mask |= BIT(csg_id);
 			group_bind_locked(group, csg_id);
 			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
