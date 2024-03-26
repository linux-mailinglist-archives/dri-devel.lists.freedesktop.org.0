Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB488C4A9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280D10EAAC;
	Tue, 26 Mar 2024 14:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 229DF10EAAC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 14:10:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C07C2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:10:48 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89BC73F694
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:10:14 -0700 (PDT)
Date: Tue, 26 Mar 2024 14:10:09 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/3] drm/panthor: Drop the dev_enter/exit() sections
 in _irq_suspend/resume()
Message-ID: <ZgLXQY1Y3xFnBvA5@e110455-lin.cambridge.arm.com>
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
 <20240326111205.510019-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326111205.510019-3-boris.brezillon@collabora.com>
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

On Tue, Mar 26, 2024 at 12:12:05PM +0100, Boris Brezillon wrote:
> There's no reason for _irq_suspend/resume() to be called after the
> device has been unplugged, and keeping this dev_enter/exit()
> section in _irq_suspend() is turns _irq_suspend() into a NOP
> when called from the _unplug() functions, which we don't want.
> 
> v3:
> - New patch
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 3a930a368ae1..99ddc41f2626 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -326,13 +326,8 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>  	int cookie;										\
>  												\
>  	pirq->mask = 0;										\
> -												\
> -	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
> -		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> -		synchronize_irq(pirq->irq);							\
> -		drm_dev_exit(cookie);								\
> -	}											\
> -												\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> +	synchronize_irq(pirq->irq);								\
>  	atomic_set(&pirq->suspended, true);							\
>  }												\
>  												\
> @@ -342,12 +337,8 @@ static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u
>  												\
>  	atomic_set(&pirq->suspended, false);							\
>  	pirq->mask = mask;									\
> -												\
> -	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
> -		gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);			\
> -		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
> -		drm_dev_exit(cookie);								\
> -	}											\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
>  }												\
>  												\
>  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
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
