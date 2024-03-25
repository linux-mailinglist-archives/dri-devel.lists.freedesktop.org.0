Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9727889529
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 09:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC98610E3CE;
	Mon, 25 Mar 2024 08:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KPQTl6b7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E64110E3CE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711354818;
 bh=EOuiWs8du4z/j7Ah6vYpJvGj8hoJqJ0Goki/wN9yEK8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KPQTl6b7ci0hQ7vi0vQviWzjm9nl7bFBMvlPosICqpMG+lV4FPIlcLU1i49nF8Ot6
 //jOVs17GnLk2NA3HMrcuE8XjJ9dxEm0hKhRFgcDzRTyrM/NyniUog6xLA0z1ZMn9A
 IW4Gr/5cGk5efv0R0rd7eqO0tjtwCYGcSD1gn1mQJfN3rpIwDG5+nG+uuSE0856J2a
 GkSJGs40VnmRocBRxZytgIKaecMFRRkEq6bwxwr0cKgbYtl6Bdi+WhltTrDMihTRcP
 f0r6Z98V/xdXTXcZE+bIAraxbz/7B+MeoqcbbvDSidAYkLhnWuNPBJpyo84yTAxJue
 0VBP2vfoels2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 047A637813B7;
 Mon, 25 Mar 2024 08:20:17 +0000 (UTC)
Message-ID: <45ef7d6e-d029-4b02-be9e-736dff3724af@collabora.com>
Date: Mon, 25 Mar 2024 09:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: fix power transition timeout warnings
To: Christian Hewitt <christianshewitt@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240322164525.2617508-1-christianshewitt@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322164525.2617508-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 22/03/24 17:45, Christian Hewitt ha scritto:
> Increase the timeout value to prevent system logs on Amlogic boards flooding
> with power transition warnings:
> 
> [   13.047638] panfrost ffe40000.gpu: shader power transition timeout
> [   13.048674] panfrost ffe40000.gpu: l2 power transition timeout
> [   13.937324] panfrost ffe40000.gpu: shader power transition timeout
> [   13.938351] panfrost ffe40000.gpu: l2 power transition timeout
> ...
> [39829.506904] panfrost ffe40000.gpu: shader power transition timeout
> [39829.507938] panfrost ffe40000.gpu: l2 power transition timeout
> [39949.508369] panfrost ffe40000.gpu: shader power transition timeout
> [39949.509405] panfrost ffe40000.gpu: l2 power transition timeout
> 
> The 2000 value has been found through trial and error testing with devices
> using G52 and G31 GPUs.
> 
> Fixes: 22aa1a209018 ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 9063ce254642..fd8e44992184 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -441,19 +441,19 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>   
>   	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
> -					 val, !val, 1, 1000);
> +					 val, !val, 1, 2000);
>   	if (ret)
>   		dev_err(pfdev->dev, "shader power transition timeout");
>   
>   	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
> -					 val, !val, 1, 1000);
> +					 val, !val, 1, 2000);

Are you sure that you need to raise the timeout for TILER as well?

Cheers,
Angelo

>   	if (ret)
>   		dev_err(pfdev->dev, "tiler power transition timeout");
>   
>   	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>   	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
> -				 val, !val, 0, 1000);
> +				 val, !val, 0, 2000);
>   	if (ret)
>   		dev_err(pfdev->dev, "l2 power transition timeout");
>   }


