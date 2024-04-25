Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCD8B2016
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDB210E16B;
	Thu, 25 Apr 2024 11:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F75E10E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 11:18:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C6F71007;
 Thu, 25 Apr 2024 04:18:59 -0700 (PDT)
Received: from [10.57.56.40] (unknown [10.57.56.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 687C53F7BD;
 Thu, 25 Apr 2024 04:18:30 -0700 (PDT)
Message-ID: <093eec5f-1c47-4481-bf0a-567441fd6bc3@arm.com>
Date: Thu, 25 Apr 2024 12:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Kill the faulty_slots variable in
 panthor_sched_suspend()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240425103920.826458-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240425103920.826458-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 25/04/2024 11:39, Boris Brezillon wrote:
> We can use upd_ctx.timedout_mask directly, and the faulty_slots update
> in the flush_caches_failed situation is never used.
> 
> Suggested-by: Suggested-by: Steven Price <steven.price@arm.com>

I'm obviously too full of suggestions! ;)

And you're doing a much better job of my todo list than I am!

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

