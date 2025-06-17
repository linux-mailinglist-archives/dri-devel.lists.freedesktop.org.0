Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B775ADD04B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA5710E45F;
	Tue, 17 Jun 2025 14:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PQD8erj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D3910E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1750171544;
 bh=ULFNwYQca9wWdUwi5WouClDI7RzoaTU1rxQ8ju3xMX4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PQD8erj0C7Hy+ryhmlFfeBMXd63QxZtIVk28bKTsFyrdpP0vqNI2BWU1C3FVzkMzw
 TBIdDrGu70jJM1n36OG9XgxQ1na2IXCgdmOshBU41BQs7mnfLYW6wh6Hb6KPi5ynO9
 2fW0hfxwsfJLu4cVvzmcYk0uj6sLFPxvCR03+3NTSqneClVFxSubbvrMqMCl0+7qx8
 OSZxtc/+lAAhP8xQMIf9ADsfJsqaEj6Nt5tn59QsFjfzvEYGb8jJNPOXiWgdSZRcDI
 42s2FZ8c5LbMJ8PCvD8UabhPc4ei38SYwuyslHDgo1XE/UdPUkUys+BQekNY8v3pN/
 MssXb3HnHbAoA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9512717E06BF;
 Tue, 17 Jun 2025 16:45:43 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:45:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination fails
Message-ID: <20250617164540.4fb196d4@collabora.com>
In-Reply-To: <20250603094952.4188093-2-ashley.smith@collabora.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Tue,  3 Jun 2025 10:49:31 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> This fixes a bug where if we timeout after a suspend and the termination
> fails, due to waiting on a fence that will never be signalled for
> example, we do not resume the group correctly. The fix forces a reset
> for groups that are not terminated correctly.
> 
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 43ee57728de5..65d8ae3dcac1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2727,8 +2727,17 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  			 * automatically terminate all active groups, so let's
>  			 * force the state to halted here.
>  			 */
> -			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
> +			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
>  				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
> +
> +				/* Reset the queue slots manually if the termination
> +				 * request failed.
> +				 */
> +				for (i = 0; i < group->queue_count; i++) {

group is used uninitialized which leads to a random (most likely NULL)
pointer deref. Either we go:

				for (i = 0; i < csg_slot->group->queue_count; i++) {

and we move the group variable to the last for loop, so we're not
tempted to use it again in places where it's not initialized, or
we use the group variable consistently accross this function by having

		group = csg_slot->group;

assignments where csg_slot->group is currently used.

We might also want to consider splitting this huge function in
sub-functions, but probably not in a patch that's flagged for
backporting.


> +					if (group->queues[i])
> +						cs_slot_reset_locked(ptdev, csg_id, i);
> +				}
> +			}
>  			slot_mask &= ~BIT(csg_id);
>  		}
>  	}

