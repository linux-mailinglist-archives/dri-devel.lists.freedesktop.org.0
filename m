Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98604CD0815
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FB510F023;
	Fri, 19 Dec 2025 15:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3415E10F023
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 15:31:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9BAFEC;
 Fri, 19 Dec 2025 07:31:20 -0800 (PST)
Received: from [10.1.30.18] (e122027.cambridge.arm.com [10.1.30.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BA613F73F;
 Fri, 19 Dec 2025 07:31:23 -0800 (PST)
Message-ID: <bdf5b4f9-d6f5-419d-9465-4f722bac06ef@arm.com>
Date: Fri, 19 Dec 2025 15:31:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panthor: Implement reading shader_present from
 nvmem
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com>
 <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251217-mt8196-shader-present-v1-3-f6f8f3aa1e93@collabora.com>
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

On 17/12/2025 17:03, Nicolas Frattaroli wrote:
> On some platforms, notably MediaTek MT8196, the shader_present bitmask
> in the Mali GPU register for it has cores enabled that may be faulty.
> The true shader_present bitmask is found in an efuse instead.
> 
> Implement reading shader_present from an nvmem cell if one is present,
> falling back to the Mali register if it's absent. The error codes are
> trickled up through to the probe function so that probe deferral works.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

[Although I really hope other vendors don't do this - the hardware is
broken!]

Although one NIT below if you respin for other reasons...

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c | 63 ++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 87ebb7ae42c4..eb44c8b108aa 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright 2025 ARM Limited. All rights reserved. */
>  
> +#include <linux/nvmem-consumer.h>
>  #include <drm/drm_print.h>
>  
>  #include "panthor_device.h"
> @@ -109,7 +110,52 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	return "(Unknown Mali GPU)";
>  }
>  
> -static void panthor_gpu_info_init(struct panthor_device *ptdev)
> +static int overload_shader_present(struct panthor_device *ptdev)
> +{
> +	struct device *dev = ptdev->base.dev;
> +	struct nvmem_cell *cell = nvmem_cell_get(dev, "shader-present");
> +	ssize_t len;
> +	void *buf;
> +	int ret;
> +
> +	if (IS_ERR(cell)) {
> +		/* On platforms without this cell, use the Mali register */
> +		if (PTR_ERR(cell) == -ENOENT)
> +			return 0;
> +
> +		return dev_err_probe(dev, PTR_ERR(cell),
> +				     "Failed to get shader-present nvmem cell\n");
> +	}
> +
> +	buf = nvmem_cell_read(cell, &len);
> +	if (IS_ERR(buf)) {
> +		ret = dev_err_probe(dev, PTR_ERR(buf),
> +				    "Failed to read shader-present nvmem cell\n");
> +		goto err_put_cell;
> +	}
> +
> +	if (!len || len > 8) {
> +		ret = dev_err_probe(dev, -EINVAL, "shader-present cell can't be length %ld\n",
> +				    len);
> +		goto err_free;
> +	}
> +
> +	memcpy(&ptdev->gpu_info.shader_present, buf, len);
> +
> +	kfree(buf);
> +	nvmem_cell_put(cell);
> +
> +	return 0;
> +
> +err_free:
> +	kfree(buf);
> +err_put_cell:
> +	nvmem_cell_put(cell);
> +
> +	return ret;
> +}

Rather than repeating the clean up, you can do something like:

{
	void *buf = NULL;
	int ret = 0

	if (IS_ERR(cell)) {
		ret = dev_err_probe(...);
		goto out;
	}

	buf = nvmem_cell_read();
	if (IS_ERR(buf)) {
		ret = dev_err_probe(...);
		goto out;
	}

	if (!len || len > 8) {
		ret = dev_err_probe(...);
		goto out;
	}

	memcpy();

out:
	if (!IS_ERR(buf))
		kfree(buf);
	if (!IS_ERR(cell))
		nvmem_cell_put(cell);

	return ret;
}

That avoids mistakes when adding a new operation into the sequence. Or
you can use the fancy new cleanup helpers, but that feels overkill here.
But equally I'm ok if you leave the code as is - it's simple enough and
the conversation can be done later if we need it.

Thanks,
Steve

> +
> +static int panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
>  
> @@ -143,13 +189,18 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
>  		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
>  	}
> +
> +	return overload_shader_present(ptdev);
>  }
>  
> -static void panthor_hw_info_init(struct panthor_device *ptdev)
> +static int panthor_hw_info_init(struct panthor_device *ptdev)
>  {
>  	u32 major, minor, status;
> +	int ret;
>  
> -	panthor_gpu_info_init(ptdev);
> +	ret = panthor_gpu_info_init(ptdev);
> +	if (ret)
> +		return ret;
>  
>  	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>  	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> @@ -172,6 +223,8 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
>  		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
>  		 ptdev->gpu_info.tiler_present);
> +
> +	return 0;
>  }
>  
>  static int panthor_hw_bind_device(struct panthor_device *ptdev)
> @@ -218,7 +271,5 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> -	panthor_hw_info_init(ptdev);
> -
> -	return 0;
> +	return panthor_hw_info_init(ptdev);
>  }
> 

