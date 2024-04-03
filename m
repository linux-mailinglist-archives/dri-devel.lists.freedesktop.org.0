Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3208965E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DE311213D;
	Wed,  3 Apr 2024 07:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jorrmBy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8515911213D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712128583;
 bh=tQNrSIQZaUNiT99nJmQcFMOdFkIJCNIcfgUU7cMY014=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jorrmBy+xuAHaTUDZDC3n8cN2n+mOsfFW2Mapxt096gNM5ok2AFePSCjKR4SpcHiw
 yEgEsnuxsQDebvznavMawWl+3r17M4KAPJuTo6yBTdJ6G1BtglWCfdxWoyGzW6jsLS
 /LtTmEMmLCgzJaMKEo/nQN4LcwEDFmo7aVi8rNqZm+qq8BVYPHAMqs+wCugZZFPrNz
 341fNCzUBgzTR9cEibMqFsmiKEip2yFFfaY61W+wBg/EIG4UGSa/opkOlVkNznDO8A
 Whxf548DTN01baAjAl+A6ajvnbQedbTzVBhtJPc1npwmItAoasXdV91+4LQI7/+wjI
 uY49GHa0JJaEQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A207137813DC;
 Wed,  3 Apr 2024 07:16:22 +0000 (UTC)
Date: Wed, 3 Apr 2024 09:16:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix error code in panthor_gpu_init()
Message-ID: <20240403091621.4b084d6f@collabora.com>
In-Reply-To: <d753e684-43ee-45c2-a1fd-86222da204e1@moroto.mountain>
References: <d753e684-43ee-45c2-a1fd-86222da204e1@moroto.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 2 Apr 2024 12:56:19 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This code accidentally returns zero/success on error because of a typo.
> It should be "irq" instead of "ret".  The other thing is that if
> platform_get_irq_byname() were to return zero then the error code would
> be cmplicated.  Fortunately, it does not so we can just change <= to
> < 0.
> 
> Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Queued to drm-misc-next.

Thanks,

Boris

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 0f7c962440d3..5251d8764e7d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -211,8 +211,8 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  		return ret;
>  
>  	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
> -	if (irq <= 0)
> -		return ret;
> +	if (irq < 0)
> +		return irq;
>  
>  	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
>  	if (ret)

