Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D579B4BC8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060F10E66D;
	Tue, 29 Oct 2024 14:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98E9B10E144
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 14:11:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEBC515BF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:12:08 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E22253F528
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:11:38 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:11:34 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] drm/panthor: Report group as timedout when we
 fail to properly suspend
Message-ID: <ZyDtFsacOBp61juc@e110455-lin.cambridge.arm.com>
References: <20241028114815.3793855-1-boris.brezillon@collabora.com>
 <20241028114815.3793855-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028114815.3793855-3-boris.brezillon@collabora.com>
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

On Mon, Oct 28, 2024 at 12:48:14PM +0100, Boris Brezillon wrote:
> If we don't do that, the group is considered usable by userspace, but
> all further GROUP_SUBMIT will fail with -EINVAL.
> 
> Changes in v2:
> - New patch
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index eda8fbb276b3..ef4bec7ff9c7 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -602,10 +602,11 @@ struct panthor_group {
>  	 * @timedout: True when a timeout occurred on any of the queues owned by
>  	 * this group.
>  	 *
> -	 * Timeouts can be reported by drm_sched or by the FW. In any case, any
> -	 * timeout situation is unrecoverable, and the group becomes useless.
> -	 * We simply wait for all references to be dropped so we can release the
> -	 * group object.
> +	 * Timeouts can be reported by drm_sched or by the FW. If a reset is required,
> +	 * and the group can't be suspended, this also leads to a timeout. In any case,
> +	 * any timeout situation is unrecoverable, and the group becomes useless. We
> +	 * simply wait for all references to be dropped so we can release the group
> +	 * object.
>  	 */
>  	bool timedout;
>  
> @@ -2687,6 +2688,12 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  		csgs_upd_ctx_init(&upd_ctx);
>  		while (slot_mask) {
>  			u32 csg_id = ffs(slot_mask) - 1;
> +			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
> +
> +			/* We consider group suspension failures as fatal and flag the
> +			 * group as unusable by setting timedout=true.
> +			 */
> +			csg_slot->group->timedout = true;
>  
>  			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
>  						CSG_STATE_TERMINATE,
> -- 
> 2.46.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
