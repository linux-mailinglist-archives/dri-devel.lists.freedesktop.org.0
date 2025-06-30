Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DDAEE053
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74A10E460;
	Mon, 30 Jun 2025 14:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E81710E460
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:16:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A8091D34
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:16:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 089103F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:16:55 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:16:52 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Karunika Choo <karunika.choo@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Wait for _READY register when powering on
Message-ID: <aGKcVPWVh5d0C9oQ@e110455-lin.cambridge.arm.com>
References: <20250630140704.432409-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630140704.432409-1-steven.price@arm.com>
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

On Mon, Jun 30, 2025 at 03:07:02PM +0100, Steven Price wrote:
> panthor_gpu_block_power_on() takes a register offset (rdy_reg) for the
> purpose of waiting for the power transition to complete. However, a
> copy/paste error converting to use the new 64 register functions
> switched it to using the pwrtrans_reg register instead. Fix the function
> to use the correct register.

Good catch!

> 
> Fixes: 4d230aa209ed ("drm/panthor: Add 64-bit and poll register accessors")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 534735518824..cb7a335e07d7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -297,8 +297,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  
>  	gpu_write64(ptdev, pwron_reg, mask);
>  
> -	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
> -					      !(mask & val), 100, timeout_us);
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, rdy_reg, val,
> +					      (mask & val) == val,
> +					      100, timeout_us);
>  	if (ret) {
>  		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>  			blk_name, mask);
> -- 
> 2.39.5
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
