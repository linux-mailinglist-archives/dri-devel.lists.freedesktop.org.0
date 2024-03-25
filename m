Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0D88A655
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 16:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9615710E965;
	Mon, 25 Mar 2024 15:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A999F10E965
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 15:23:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B21D32F4;
 Mon, 25 Mar 2024 08:23:59 -0700 (PDT)
Received: from [10.57.15.178] (unknown [10.57.15.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1863F64C;
 Mon, 25 Mar 2024 08:23:24 -0700 (PDT)
Message-ID: <2656ed39-6d0b-4736-8ab4-584292cff595@arm.com>
Date: Mon, 25 Mar 2024 15:23:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/panthor: Fix ordering in _irq_suspend()
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240325135705.3717293-1-boris.brezillon@collabora.com>
 <20240325135705.3717293-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240325135705.3717293-2-boris.brezillon@collabora.com>
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

On 25/03/2024 13:57, Boris Brezillon wrote:
> Make sure we set suspended=true last to avoid generating an irq storm
> in the unlikely case where an IRQ happens between the suspended=true
> assignment and the _INT_MASK update.
> 
> v2:
> - New patch
> 
> Reported-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks!

Steve

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

