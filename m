Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAEA90608
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5226810E0ED;
	Wed, 16 Apr 2025 14:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DA4010E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 14:19:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6001595;
 Wed, 16 Apr 2025 07:19:28 -0700 (PDT)
Received: from [10.57.90.52] (unknown [10.57.90.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114FE3F66E;
 Wed, 16 Apr 2025 07:19:28 -0700 (PDT)
Message-ID: <ee51d864-f99d-4f95-8f74-a84be4ed7f31@arm.com>
Date: Wed, 16 Apr 2025 15:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix the panthor_gpu_coherency_init() error
 path
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250414130120.581274-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250414130120.581274-1-boris.brezillon@collabora.com>
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

On 14/04/2025 14:01, Boris Brezillon wrote:
> The panthor_gpu_coherency_init() call has been moved around, but the
> error path hasn't been adjusted accordingly. Make sure we undo what
> has been done before this call in case of failure.
> 
> Fixes: 7d5a3b22f5b5 ("drm/panthor: Call panthor_gpu_coherency_init() after PM resume()")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/4da470aa-4f84-460e-aff8-dabc8cc4da15@stanley.mountain/T/#t
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index c73c1608d6e6..1e8811c6716d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -245,7 +245,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	ret = panthor_gpu_coherency_init(ptdev);
>  	if (ret)
> -		return ret;
> +		goto err_unplug_gpu;
>  
>  	ret = panthor_mmu_init(ptdev);
>  	if (ret)

