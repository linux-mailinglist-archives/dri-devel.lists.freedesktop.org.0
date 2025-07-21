Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93110B0C6AB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F096E10E55B;
	Mon, 21 Jul 2025 14:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D09EB10E55B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:42:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB1B153B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:42:07 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 576D63F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:42:13 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:42:12 +0100
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
Subject: Re: [PATCH v5 3/6] drm/panthor: Add support for Mali-G710, Mali-G510
 and Mali-G310
Message-ID: <aH5RxPHhfO5msiT0@e110455-lin.cambridge.arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
 <20250721111344.1610250-4-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250721111344.1610250-4-karunika.choo@arm.com>
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

On Mon, Jul 21, 2025 at 12:13:41PM +0100, Karunika Choo wrote:
> This patch adds GPU model name and FW binary support for Mali-G710,
> Mali-G510, and Mali-G310.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
>  drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 36f1034839c2..b7b454d16f12 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  }
>  
>  MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
> +MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index f39010c0ca86..7f138974d43b 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
>  						GPU_PROD_MAJOR(gpu_id));
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
>  	}
>  
>  	return "(Unknown Mali GPU)";
> -- 
> 2.49.0
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
