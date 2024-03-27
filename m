Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B50A88E8D7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 16:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BC310F7FE;
	Wed, 27 Mar 2024 15:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04AB910F7FE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 15:25:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A462F4;
 Wed, 27 Mar 2024 08:25:56 -0700 (PDT)
Received: from [10.57.14.133] (unknown [10.57.14.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330863F64C;
 Wed, 27 Mar 2024 08:25:21 -0700 (PDT)
Message-ID: <8172a633-f4cc-4814-8fbc-fbc241917e3a@arm.com>
Date: Wed, 27 Mar 2024 15:25:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/panthor: Drop the dev_enter/exit() sections in
 _irq_suspend/resume()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
 <20240326111205.510019-3-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240326111205.510019-3-boris.brezillon@collabora.com>
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

On 26/03/2024 11:12, Boris Brezillon wrote:
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

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

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

