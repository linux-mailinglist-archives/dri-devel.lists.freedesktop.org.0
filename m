Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D315281A76E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 20:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E1B10E106;
	Wed, 20 Dec 2023 19:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7906210E106
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 19:58:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA8471FB;
 Wed, 20 Dec 2023 11:59:33 -0800 (PST)
Received: from [10.57.75.35] (unknown [10.57.75.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06D4A3F738;
 Wed, 20 Dec 2023 11:58:46 -0800 (PST)
Message-ID: <a185918b-19d0-40c3-8cef-92a91196d09e@arm.com>
Date: Wed, 20 Dec 2023 20:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] drm/panthor: Add the scheduler logical block
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-11-boris.brezillon@collabora.com>
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20231204173313.2098733-11-boris.brezillon@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 18:33, Boris Brezillon wrote:

<snip>

> +/**
> + * cs_slot_sync_queue_state_locked() - Synchronize the queue slot priority
> + * @ptdev: Device.
> + * @csg_id: Group slot.
> + * @cs_id: Queue slot.
> + *
> + * Queue state is updated on group suspend or STATUS_UPDATE event.
> + */
> +static void
> +cs_slot_sync_queue_state_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
> +{
> +	struct panthor_group *group = ptdev->scheduler->csg_slots[csg_id].group;
> +	struct panthor_queue *queue = group->queues[cs_id];
> +	struct panthor_fw_cs_iface *cs_iface =
> +		panthor_fw_get_cs_iface(group->ptdev, csg_id, cs_id);
> +
> +	u32 status_wait_cond;
> +
> +	switch (cs_iface->output->status_blocked_reason) {
> +	case CS_STATUS_BLOCKED_REASON_UNBLOCKED:
> +		if (queue->iface.input->insert == queue->iface.output->extract &&
> +		    cs_iface->output->status_scoreboards == 0)
> +			group->idle_queues |= BIT(cs_id);
> +		break;
> +
> +	case CS_STATUS_BLOCKED_REASON_SYNC_WAIT:
> +		drm_WARN_ON(&ptdev->base, !list_empty(&group->wait_node));

I think we should remove this drm_WARN_ON(). With my user submission 
experiments, I keep hitting this warning because I'm a bit slow to 
signal a Mali sync object. In other words; I'm keeping a stream blocked 
for a while.

It is quite common to get two rapid job IRQs, e.g. one for a global 
event, and one for a particular CSG event. Depending on timing of the 
scheduled work to deal with the IRQs, I quite often end up with two 
tick_work() being scheduled and executed as a result of this. Both of 
these will see the same stream as CS_STATUS_BLOCKED_REASON_UNBLOCKED, 
and hence the second will trigger the drm_WARN_ON(), as the first run 
already added the group to the waiting list.

I'm pretty sure we can hit this drm_WARN_ON() when user space starts 
making use of multiple streams pr group as well, since two or more 
streams for the same group could both be 
CS_STATUS_BLOCKED_REASON_SYNC_WAIT, thus running into the same issue.

> +		list_move_tail(&group->wait_node, &group->ptdev->scheduler->groups.waiting);
> +		group->blocked_queues |= BIT(cs_id);
> +		queue->syncwait.gpu_va = cs_iface->output->status_wait_sync_ptr;
> +		queue->syncwait.ref = cs_iface->output->status_wait_sync_value;
> +		status_wait_cond = cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_COND_MASK;
> +		queue->syncwait.gt = status_wait_cond == CS_STATUS_WAIT_SYNC_COND_GT;
> +		if (cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_64B) {
> +			u64 sync_val_hi = cs_iface->output->status_wait_sync_value_hi;
> +
> +			queue->syncwait.sync64 = true;
> +			queue->syncwait.ref |= sync_val_hi << 32;
> +		} else {
> +			queue->syncwait.sync64 = false;
> +		}
> +		break;
> +
> +	default:
> +		/* Other reasons are not blocking. Consider the queue as runnable
> +		 * in those cases.
> +		 */
> +		break;
> +	}
> +}

<snip>

--
Thanks,
Ketil

