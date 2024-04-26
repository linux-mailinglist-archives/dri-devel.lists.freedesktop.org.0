Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377E8B36C8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 13:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6D1122F1;
	Fri, 26 Apr 2024 11:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 847EE1122F1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 11:56:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C9D21007
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 04:56:51 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4110A3F793
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 04:56:23 -0700 (PDT)
Date: Fri, 26 Apr 2024 12:56:19 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Kill the faulty_slots variable in
 panthor_sched_suspend()
Message-ID: <ZiuWYx_NbrL29Qed@e110455-lin.cambridge.arm.com>
References: <20240425103920.826458-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425103920.826458-1-boris.brezillon@collabora.com>
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

On Thu, Apr 25, 2024 at 12:39:20PM +0200, Boris Brezillon wrote:
> We can use upd_ctx.timedout_mask directly, and the faulty_slots update
> in the flush_caches_failed situation is never used.
> 
> Suggested-by: Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index fad4678ca4c8..fed28c16d5d1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2584,8 +2584,8 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  {
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_csg_slots_upd_ctx upd_ctx;
> -	u32 suspended_slots, faulty_slots;
>  	struct panthor_group *group;
> +	u32 suspended_slots;
>  	u32 i;
>  
>  	mutex_lock(&sched->lock);
> @@ -2605,10 +2605,9 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  
>  	csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
>  	suspended_slots &= ~upd_ctx.timedout_mask;
> -	faulty_slots = upd_ctx.timedout_mask;
>  
> -	if (faulty_slots) {
> -		u32 slot_mask = faulty_slots;
> +	if (upd_ctx.timedout_mask) {
> +		u32 slot_mask = upd_ctx.timedout_mask;
>  
>  		drm_err(&ptdev->base, "CSG suspend failed, escalating to termination");
>  		csgs_upd_ctx_init(&upd_ctx);
> @@ -2659,9 +2658,6 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  
>  			slot_mask &= ~BIT(csg_id);
>  		}
> -
> -		if (flush_caches_failed)
> -			faulty_slots |= suspended_slots;
>  	}
>  
>  	for (i = 0; i < sched->csg_slot_count; i++) {
> -- 
> 2.44.0
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
