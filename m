Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F989052C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 17:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5DA1124D5;
	Thu, 28 Mar 2024 16:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20D871124D5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 16:29:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 283C01476;
 Thu, 28 Mar 2024 09:29:42 -0700 (PDT)
Received: from [10.1.29.21] (e122027.cambridge.arm.com [10.1.29.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 997953F694;
 Thu, 28 Mar 2024 09:29:06 -0700 (PDT)
Message-ID: <c639ee30-cecd-4089-a632-b32e740fcac3@arm.com>
Date: Thu, 28 Mar 2024 16:29:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix clang -Wunused-but-set-variable in
 tick_ctx_apply()
Content-Language: en-GB
To: Nathan Chancellor <nathan@kernel.org>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, heiko@sntech.de, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: <20240328-panthor-drop-csg_mod_mask-v1-1-5a80be3df581@kernel.org>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240328-panthor-drop-csg_mod_mask-v1-1-5a80be3df581@kernel.org>
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

On 28/03/2024 16:22, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR):
> 
>   drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mod_mask' set but not used [-Werror,-Wunused-but-set-variable]
>    2048 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
>         |             ^
>   1 error generated.
> 
> The variable is an artifact left over from refactoring that occurred
> during the development of the initial series for this driver. Remove it
> to resolve the warning.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
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
> 
> ---
> base-commit: d180649238f04183950d9c8a7d8a2c2f1788a89c
> change-id: 20240328-panthor-drop-csg_mod_mask-b4bbe317d690
> 
> Best regards,

