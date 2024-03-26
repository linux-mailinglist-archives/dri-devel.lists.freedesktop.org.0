Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E299D88C49C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2054D10EAAB;
	Tue, 26 Mar 2024 14:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C475410E9F8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 14:09:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1E342F4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:09:47 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B9E43F694
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:09:14 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:09:07 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/3] drm/panthor: Fix ordering in _irq_suspend()
Message-ID: <ZgLXA89ducxFbwIf@e110455-lin.cambridge.arm.com>
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
 <20240326111205.510019-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326111205.510019-2-boris.brezillon@collabora.com>
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

On Tue, Mar 26, 2024 at 12:12:04PM +0100, Boris Brezillon wrote:
> Make sure we set suspended=true last to avoid generating an irq storm
> in the unlikely case where an IRQ happens between the suspended=true
> assignment and the _INT_MASK update.
> 
> We also move the mask=0 assignment before writing to the _INT_MASK
> register to prevent the thread handler from unmasking the interrupt
> behind our back. This means we might lose events if there were some
> pending when we get to suspend the IRQ, but that's fine.
> The synchronize_irq() we have in the _irq_suspend() path was not
> there to make sure all IRQs are processed, just to make sure we don't
> have registers accesses coming from the irq handlers after
> _irq_suspend() has been called. If there's a need to have all pending
> IRQs processed, it should happen before _irq_suspend() is called.
> 
> v3:
> - Add Steve's R-b
> 
> v2:
> - New patch
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Reported-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 7ee4987a3796..3a930a368ae1 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -325,7 +325,7 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>  {												\
>  	int cookie;										\
>  												\
> -	atomic_set(&pirq->suspended, true);							\
> +	pirq->mask = 0;										\
>  												\
>  	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
>  		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> @@ -333,7 +333,7 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>  		drm_dev_exit(cookie);								\
>  	}											\
>  												\
> -	pirq->mask = 0;										\
> +	atomic_set(&pirq->suspended, true);							\
>  }												\
>  												\
>  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
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
