Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241598C3C5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 18:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DA910E647;
	Tue,  1 Oct 2024 16:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S9/BvfyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320C10E64B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727801141;
 bh=5ZiqyT1sYrbRIok2EPu+8IwDIatVhIQmTzLsA1XLL0s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S9/BvfyCI8vrlKKhpjMYgiL+f2Nog9ANnY5+YvReJV6fmxz+K4ahV2x3GTKpExZQG
 5qi1+9f6D7Zcl/Zn1hRI/nAUi01oomXS7R9cdj6Pqb0KDflC9oMmUEkxX3QwmAc1Wl
 OplQflqdWPpkpEz9UWpEFMP+qL+TrqDODWm8EN0T7/tiAz+JFEp3vnOHN2fZQabhRd
 IzaBWNbiGEz1j17Iopvd+VHZjaIF+PnD9/CUOjSo6GlEruXjhL9mMU9OOdgY7sGFQS
 g3xewuzQAwxdfXClWq51R3fNJjBguHvD2gpy0sRCpJNNIbjJSc5ELehDEniBTvVWjP
 sBBfpW31XPlUQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 786F517E1060;
 Tue,  1 Oct 2024 18:45:41 +0200 (CEST)
Date: Tue, 1 Oct 2024 18:45:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Don't declare a queue blocked if deferred
 operations are pending
Message-ID: <20241001184537.31582e16@collabora.com>
In-Reply-To: <20240905071914.3278599-1-boris.brezillon@collabora.com>
References: <20240905071914.3278599-1-boris.brezillon@collabora.com>
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

On Thu,  5 Sep 2024 09:19:14 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> If deferred operations are pending, we want to wait for those to
> land before declaring the queue blocked on a SYNC_WAIT. We need
> this to deal with the case where the sync object is signalled through
> a deferred SYNC_{ADD,SET} from the same queue. If we don't do that
> and the group gets scheduled out before the deferred SYNC_{SET,ADD}
> is executed, we'll end up with a timeout, because no external
> SYNC_{SET,ADD} will make the scheduler reconsider the group for
> execution.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-fixes.

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 41260cf4beb8..201d5e7a921e 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1103,7 +1103,13 @@ cs_slot_sync_queue_state_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs
>  			list_move_tail(&group->wait_node,
>  				       &group->ptdev->scheduler->groups.waiting);
>  		}
> -		group->blocked_queues |= BIT(cs_id);
> +
> +		/* The queue is only blocked if there's no deferred operation
> +		 * pending, which can be checked through the scoreboard status.
> +		 */
> +		if (!cs_iface->output->status_scoreboards)
> +			group->blocked_queues |= BIT(cs_id);
> +
>  		queue->syncwait.gpu_va = cs_iface->output->status_wait_sync_ptr;
>  		queue->syncwait.ref = cs_iface->output->status_wait_sync_value;
>  		status_wait_cond = cs_iface->output->status_wait & CS_STATUS_WAIT_SYNC_COND_MASK;

