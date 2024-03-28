Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319478903DE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FC71124AD;
	Thu, 28 Mar 2024 15:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fMxg1Beh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8262B1124AD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711641115;
 bh=Ke8i0TRtjx5ZFSdZott23A8QqP/B51J9yaY5GocXqkM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fMxg1BeheGYK1iBjBHLYpbSTaSQYgwezZNL2V4tB0NUxZ5KUEGNIfEw2v4ez56eg7
 DD1b6cZwb/Eh4C6/ol9SY3sQKeqodqvCldVEe8ky6fX1/SSpvrg+uMWrMrXZje+Ad6
 uDTBmjtmrhtUMGnEJWi8/b7wtjGqI4qJJDvMKiQbbXDNu0TXpLzMyT7C7GDQTwzrdr
 i0eDX1tg6eVrl+j01EBI2TA3v3Xdh2NhQk6414tmR/7TFSPsZNPYWvQ4emIckxXswc
 IcwEA91Xf4K46FJ6e4oHD8l2QMKzfGjpOriU9AT2Ed/1UufxmS8Ewivzce6OdBS6Hy
 lJXNXdkTFDPyA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9592D37804B2;
 Thu, 28 Mar 2024 15:51:54 +0000 (UTC)
Date: Thu, 28 Mar 2024 16:51:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Maxime Ripard <mripard@kernel.org>,
 llvm@lists.linux.dev
Subject: Re: [PATCH v6 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240328165153.0e3ff2d0@collabora.com>
In-Reply-To: <20240328153809.GA2673768@dev-arch.thelio-3990X>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
 <20240328153809.GA2673768@dev-arch.thelio-3990X>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

Hi Nathan,

On Thu, 28 Mar 2024 08:38:09 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Boris,
> 
> On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
> <snip>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 3502 +++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_sched.h |   50 +
> >  2 files changed, 3552 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > new file mode 100644
> > index 000000000000..5f7803b6fc48
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c  
> <snip>
> > +static void
> > +tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *ctx)
> > +{
> > +	struct panthor_group *group, *tmp;
> > +	struct panthor_device *ptdev = sched->ptdev;
> > +	struct panthor_csg_slot *csg_slot;
> > +	int prio, new_csg_prio = MAX_CSG_PRIO, i;
> > +	u32 csg_mod_mask = 0, free_csg_slots = 0;
> > +	struct panthor_csg_slots_upd_ctx upd_ctx;
> > +	int ret;
> > +
> > +	csgs_upd_ctx_init(&upd_ctx);
> > +
> > +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> > +		/* Suspend or terminate evicted groups. */
> > +		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
> > +			bool term = !group_can_run(group);
> > +			int csg_id = group->csg_id;
> > +
> > +			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
> > +				continue;
> > +
> > +			csg_slot = &sched->csg_slots[csg_id];
> > +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> > +						term ? CSG_STATE_TERMINATE : CSG_STATE_SUSPEND,
> > +						CSG_STATE_MASK);
> > +		}
> > +
> > +		/* Update priorities on already running groups. */
> > +		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> > +			struct panthor_fw_csg_iface *csg_iface;
> > +			int csg_id = group->csg_id;
> > +
> > +			if (csg_id < 0) {
> > +				new_csg_prio--;
> > +				continue;
> > +			}
> > +
> > +			csg_slot = &sched->csg_slots[csg_id];
> > +			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> > +			if (csg_slot->priority == new_csg_prio) {
> > +				new_csg_prio--;
> > +				continue;
> > +			}
> > +
> > +			panthor_fw_update_reqs(csg_iface, endpoint_req,
> > +					       CSG_EP_REQ_PRIORITY(new_csg_prio),
> > +					       CSG_EP_REQ_PRIORITY_MASK);
> > +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> > +						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> > +						CSG_ENDPOINT_CONFIG);
> > +			new_csg_prio--;
> > +		}
> > +	}
> > +
> > +	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> > +	if (ret) {
> > +		panthor_device_schedule_reset(ptdev);
> > +		ctx->csg_upd_failed_mask |= upd_ctx.timedout_mask;
> > +		return;
> > +	}
> > +
> > +	/* Unbind evicted groups. */
> > +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> > +		list_for_each_entry(group, &ctx->old_groups[prio], run_node) {
> > +			/* This group is gone. Process interrupts to clear
> > +			 * any pending interrupts before we start the new
> > +			 * group.
> > +			 */
> > +			if (group->csg_id >= 0)
> > +				sched_process_csg_irq_locked(ptdev, group->csg_id);
> > +
> > +			group_unbind_locked(group);
> > +		}
> > +	}
> > +
> > +	for (i = 0; i < sched->csg_slot_count; i++) {
> > +		if (!sched->csg_slots[i].group)
> > +			free_csg_slots |= BIT(i);
> > +	}
> > +
> > +	csgs_upd_ctx_init(&upd_ctx);
> > +	new_csg_prio = MAX_CSG_PRIO;
> > +
> > +	/* Start new groups. */
> > +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> > +		list_for_each_entry(group, &ctx->groups[prio], run_node) {
> > +			int csg_id = group->csg_id;
> > +			struct panthor_fw_csg_iface *csg_iface;
> > +
> > +			if (csg_id >= 0) {
> > +				new_csg_prio--;
> > +				continue;
> > +			}
> > +
> > +			csg_id = ffs(free_csg_slots) - 1;
> > +			if (drm_WARN_ON(&ptdev->base, csg_id < 0))
> > +				break;
> > +
> > +			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
> > +			csg_slot = &sched->csg_slots[csg_id];
> > +			csg_mod_mask |= BIT(csg_id);
> > +			group_bind_locked(group, csg_id);
> > +			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
> > +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> > +						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
> > +						CSG_STATE_RESUME : CSG_STATE_START,
> > +						CSG_STATE_MASK);
> > +			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
> > +						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> > +						CSG_ENDPOINT_CONFIG);
> > +			free_csg_slots &= ~BIT(csg_id);
> > +		}
> > +	}
> > +
> > +	ret = csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> > +	if (ret) {
> > +		panthor_device_schedule_reset(ptdev);
> > +		ctx->csg_upd_failed_mask |= upd_ctx.timedout_mask;
> > +		return;
> > +	}
> > +
> > +	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1; prio >= 0; prio--) {
> > +		list_for_each_entry_safe(group, tmp, &ctx->groups[prio], run_node) {
> > +			list_del_init(&group->run_node);
> > +
> > +			/* If the group has been destroyed while we were
> > +			 * scheduling, ask for an immediate tick to
> > +			 * re-evaluate as soon as possible and get rid of
> > +			 * this dangling group.
> > +			 */
> > +			if (group->destroyed)
> > +				ctx->immediate_tick = true;
> > +			group_put(group);
> > +		}
> > +
> > +		/* Return evicted groups to the idle or run queues. Groups
> > +		 * that can no longer be run (because they've been destroyed
> > +		 * or experienced an unrecoverable error) will be scheduled
> > +		 * for destruction in tick_ctx_cleanup().
> > +		 */
> > +		list_for_each_entry_safe(group, tmp, &ctx->old_groups[prio], run_node) {
> > +			if (!group_can_run(group))
> > +				continue;
> > +
> > +			if (group_is_idle(group))
> > +				list_move_tail(&group->run_node, &sched->groups.idle[prio]);
> > +			else
> > +				list_move_tail(&group->run_node, &sched->groups.runnable[prio]);
> > +			group_put(group);
> > +		}
> > +	}
> > +
> > +	sched->used_csg_slot_count = ctx->group_count;
> > +	sched->might_have_idle_groups = ctx->idle_group_count > 0;
> > +}  
> 
> Clang builds fail after this change in -next as commit
> de8548813824 ("drm/panthor: Add the scheduler logical block"):
> 
>   drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mod_mask' set but not used [-Werror,-Wunused-but-set-variable]
>    2048 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
>         |             ^
>   1 error generated.
> 
> It appears legitimate to me, csg_mod_mask is only updated with '|=' but
> never accessed in any other manner. Should the variable be removed or
> was it supposed to be used somewhere else?

Thanks for the report!

It's a leftover from a refactor that happened in v2 or v3 of this
patchset, csg_mod_mask can be dropped (like you do in your diff).
Mind sending a proper patch to dri-devel@lists.freedesktop.org with me,
Steven and Liviu in Cc?

Regards,

Boris

> 
> Cheers,
> Nathan
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..e5a710f190d2 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2045,7 +2045,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  	struct panthor_device *ptdev = sched->ptdev;
>  	struct panthor_csg_slot *csg_slot;
>  	int prio, new_csg_prio = MAX_CSG_PRIO, i;
> -	u32 csg_mod_mask = 0, free_csg_slots = 0;
> +	u32 free_csg_slots = 0;
>  	struct panthor_csg_slots_upd_ctx upd_ctx;
>  	int ret;
>  
> @@ -2139,7 +2139,6 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
>  
>  			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  			csg_slot = &sched->csg_slots[csg_id];
> -			csg_mod_mask |= BIT(csg_id);
>  			group_bind_locked(group, csg_id);
>  			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,

