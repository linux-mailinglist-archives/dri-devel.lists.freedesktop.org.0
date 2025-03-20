Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B086A6AE08
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 20:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88A10E68D;
	Thu, 20 Mar 2025 19:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2091D10E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 19:03:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B866113E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:03:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55DF33F63F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:03:26 -0700 (PDT)
Date: Thu, 20 Mar 2025 19:03:24 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] drm/panthor: Add support for Mali-G710,
 Mali-G510, and Mali-G310
Message-ID: <Z9xmfJDCEz_-u8PH@e110455-lin.cambridge.arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-10-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320111741.1937892-10-karunika.choo@arm.com>
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

On Thu, Mar 20, 2025 at 11:17:41AM +0000, Karunika Choo wrote:
> This patch adds GPU model name and FW binary support for Mali-G710,
> Mali-G510, and Mali-G310.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
>  drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 8a967af0e2b4..7050adfaa8b6 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1398,6 +1398,8 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  }
>  
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
>  MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");

Firmware available for testing here:

https://gitlab.com/dliviu/linux-firmware

Best regards,
Liviu

> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index e6354304bbef..6f18b7420f90 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -49,8 +49,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
>  
>  	switch (product_id) {
> +	case GPU_PROD_ID_MAKE(10, 2):
> +		return "Mali-G710";
>  	case GPU_PROD_ID_MAKE(10, 7):
>  		return "Mali-G610";
> +	case GPU_PROD_ID_MAKE(10, 3):
> +		return "Mali-G510";
> +	case GPU_PROD_ID_MAKE(10, 4):
> +		return "Mali-G310";
>  	case GPU_PROD_ID_MAKE(11, 2):
>  		if (shader_core_count > 10 && ray_intersection)
>  			return "Mali-G715-Immortalis";
> -- 
> 2.47.1
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
