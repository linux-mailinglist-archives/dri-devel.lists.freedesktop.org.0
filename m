Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB482D9A1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF11810E138;
	Mon, 15 Jan 2024 13:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3B10E138
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705324277;
 bh=J6lmpsLaW44HoUa9Uh5rOh5LCzCw5FBFbJHAExOTX5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sbVVd1aXNfAsHhdwfZv8syJzIsOq19Jyix3AvetWxMyUXkonnAPnfX6Vj3W7PaFVK
 FUTpbHWpH7HjnSml+pserNTK7X2JXXPr+cU3jomZAZ8epf2CdNr0BpZvxp9Hev/g34
 W2MJMJFutlrOjiflswtcW3+J4k7OiFjl8cn6qmLybiGSvJFj16QSOCkXOPhtkEGwed
 UYeOWa8+lIXAd9dYE4+iipAE4xLZsDNsRS7UmoHvYHQnqj+qUQbRnknX82ShqAhEL7
 3OrtPYI65U+ivtR/mtd+HA2QVBi9Yqkw4oZsY2pDWNhqfMf+CK+Uox8jzruGUEvJuj
 wrBLmgh0wH7Sw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3CB9378000A;
 Mon, 15 Jan 2024 13:11:16 +0000 (UTC)
Date: Mon, 15 Jan 2024 14:11:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v3 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240115141115.0b9f4da6@collabora.com>
In-Reply-To: <a185918b-19d0-40c3-8cef-92a91196d09e@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-11-boris.brezillon@collabora.com>
 <a185918b-19d0-40c3-8cef-92a91196d09e@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Dec 2023 20:59:43 +0100
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> > +/**
> > + * cs_slot_sync_queue_state_locked() - Synchronize the queue slot priority
> > + * @ptdev: Device.
> > + * @csg_id: Group slot.
> > + * @cs_id: Queue slot.
> > + *
> > + * Queue state is updated on group suspend or STATUS_UPDATE event.
> > + */
> > +static void
> > +cs_slot_sync_queue_state_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
> > +{
> > +	struct panthor_group *group = ptdev->scheduler->csg_slots[csg_id].group;
> > +	struct panthor_queue *queue = group->queues[cs_id];
> > +	struct panthor_fw_cs_iface *cs_iface =
> > +		panthor_fw_get_cs_iface(group->ptdev, csg_id, cs_id);
> > +
> > +	u32 status_wait_cond;
> > +
> > +	switch (cs_iface->output->status_blocked_reason) {
> > +	case CS_STATUS_BLOCKED_REASON_UNBLOCKED:
> > +		if (queue->iface.input->insert == queue->iface.output->extract &&
> > +		    cs_iface->output->status_scoreboards == 0)
> > +			group->idle_queues |= BIT(cs_id);
> > +		break;
> > +
> > +	case CS_STATUS_BLOCKED_REASON_SYNC_WAIT:
> > +		drm_WARN_ON(&ptdev->base, !list_empty(&group->wait_node));  
> 
> I think we should remove this drm_WARN_ON(). With my user submission 
> experiments, I keep hitting this warning because I'm a bit slow to 
> signal a Mali sync object. In other words; I'm keeping a stream blocked 
> for a while.
> 
> It is quite common to get two rapid job IRQs, e.g. one for a global 
> event, and one for a particular CSG event. Depending on timing of the 
> scheduled work to deal with the IRQs, I quite often end up with two 
> tick_work() being scheduled and executed as a result of this. Both of 
> these will see the same stream as CS_STATUS_BLOCKED_REASON_UNBLOCKED, 
> and hence the second will trigger the drm_WARN_ON(), as the first run 
> already added the group to the waiting list.
> 
> I'm pretty sure we can hit this drm_WARN_ON() when user space starts 
> making use of multiple streams pr group as well, since two or more 
> streams for the same group could both be 
> CS_STATUS_BLOCKED_REASON_SYNC_WAIT, thus running into the same issue.

It makes total sense, I'll drop the WARN_ON().

> 
> > +		list_move_tail(&group->wait_node, &group->ptdev->scheduler->groups.waiting);
> > +		group->blocked_queues |= BIT(cs_id);
> > +		queue->syncwait.gpu_va = cs_iface->output->status_wait_sync_ptr;
> > +		queue->syncwait.ref = cs_iface->output->status_wait_sync_value;
> > +		status_wait_cond = cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_COND_MASK;
> > +		queue->syncwait.gt = status_wait_cond == CS_STATUS_WAIT_SYNC_COND_GT;
> > +		if (cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_64B) {
> > +			u64 sync_val_hi = cs_iface->output->status_wait_sync_value_hi;
> > +
> > +			queue->syncwait.sync64 = true;
> > +			queue->syncwait.ref |= sync_val_hi << 32;
> > +		} else {
> > +			queue->syncwait.sync64 = false;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		/* Other reasons are not blocking. Consider the queue as runnable
> > +		 * in those cases.
> > +		 */
> > +		break;
> > +	}
> > +}  
