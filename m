Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED38952CC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 14:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991A410FCD7;
	Tue,  2 Apr 2024 12:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="glnejwao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9110FCDE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712060460;
 bh=xyAFVVSrUaZelYKAVF4nMxj60RRWxZjPtQr6WMey4Mw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=glnejwaovaa1DO8cccp6ZRvs2DNHxoE3trZF+FEuDKp8m43onB4hwOknMkYcQ7yYj
 aTXzdvcnAilQ+WznEWbbl/6vkY8v7R4ksPGclv/lcjQVwd56tOTohiseugslKDp1eZ
 +yrnjF9WQuNuD5qvTrTLloHtZ6mNbXgo8vwc+eKgFNB38j/yAt0nF93MFhpiiMeU9B
 hQEEEShmHXDeZOvYBSDOR33tAYOzpKt1TH53/EMULZOeq8WLHBsca3gY1pbFOPjWHC
 Owng3d9WO3P4AHfQCIheDlq0ptGb92pDoakhxqEjGUi3e5WLS/CBgS+cdmkDH7aNre
 Y09oy5O2JEVAA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CFAD03781144;
 Tue,  2 Apr 2024 12:20:59 +0000 (UTC)
Date: Tue, 2 Apr 2024 14:20:58 +0200
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
Message-ID: <20240402142058.5477a9bf@collabora.com>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

