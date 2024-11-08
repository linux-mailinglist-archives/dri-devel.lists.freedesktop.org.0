Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9B9C224C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA31210EA16;
	Fri,  8 Nov 2024 16:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DyEclIlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4580A10EA0F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731084218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flGicnhrzheG3HiEqRZIpt1IFFE3et6OHBSu8ABI4Ek=;
 b=DyEclIlSeHHFdOJUE1G8FJ07+feqekD1/pTkf1T7LGIbo7a9l+ttE/OGcf/xUQRMGTbBjc
 JAXCaKypgFLNB/AQKmBaSZ2GVuoJlS4lKB5g1HhxAxYHph+/gJu2glFzlIRBjbI5ISNWd/
 HdnOBQ/DClv/2NQWEZrUWQ33pECVKT4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-vpOQDzBJOcykxnl9fwHMTg-1; Fri, 08 Nov 2024 11:43:36 -0500
X-MC-Unique: vpOQDzBJOcykxnl9fwHMTg-1
X-Mimecast-MFC-AGG-ID: vpOQDzBJOcykxnl9fwHMTg
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-539f5f33333so1934328e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 08:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731084215; x=1731689015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=flGicnhrzheG3HiEqRZIpt1IFFE3et6OHBSu8ABI4Ek=;
 b=ekxv9avxYsj7v+/46pG/svyIpOd9Z8durR77fVg34W1sqKLahYEeJpQylNcEnD30/R
 qE7BbhELXJ26pR1fOVNUjiNQorq84npUehE6oOIP75sn0YWbidfIQeWOHFOEc4FmGQCc
 k7VP+o0APGEmu8xtt332GfyoSv8SUOqdF6ZzwVmUI1XcSXU9Uu8GuW0E5Z8+73sKN3Id
 Tq+jzkWhhfm5Ckp2XPLr5rJHzHxZnnpOnBaW+2t4TBuhsxnZmsOTW/exw0ee/IYOmbQy
 8td29cBWM4bAElwEPWXt6emnbOIB+DVq7JidibcbU/oRmQkgZ8LpzwMbXT31shJSPSop
 UiJA==
X-Gm-Message-State: AOJu0YyuSw1mPyNb303NaNqW4cBT6m7K8Wlm3yliL10+ZTX0uZOwslTN
 5yzDilZhgKAFZAawAfk/zh10vnYSUIqooPxKfuYilbILkxCoWmcMYSv/1Pj1/IIpRRlanHeFtVY
 wb7t8MphTEepsb/fiE00VzwX7BmRP9FF2vxY+S4xrwTtVBXJtdCwi6RnisFT5bj4gdg==
X-Received: by 2002:a05:6512:110c:b0:53b:154c:f762 with SMTP id
 2adb3069b0e04-53d862e5d6emr2235101e87.46.1731084215194; 
 Fri, 08 Nov 2024 08:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCZPwCzTqnQx+04ZrY76bi3ZXy0XSCnF6GkL3WmBcnUhVw//MGLBxMI4MIGJLRom9j37AQAA==
X-Received: by 2002:a05:6512:110c:b0:53b:154c:f762 with SMTP id
 2adb3069b0e04-53d862e5d6emr2235088e87.46.1731084214737; 
 Fri, 08 Nov 2024 08:43:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053ff08sm77380765e9.10.2024.11.08.08.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 08:43:34 -0800 (PST)
Message-ID: <257ca617-2ce4-45da-be67-a4423953214d@redhat.com>
Date: Fri, 8 Nov 2024 17:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm: Move client code into subdirectories
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241108154600.126162-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241108154600.126162-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k81ynCzh7K-87HT-T9vZR_ws3_-kDf274tfURTOJGxs_1731084215
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 08/11/2024 16:42, Thomas Zimmermann wrote:
> The drm_log client will likely be merged into DRM soon. Time to clean
> up some of the existing files. This series moves the existing DRM
> client for fbdev emulation and its build infrastructure into clients/
> subdirectories. Drm_log can then be located there as well.
> 
> The core and helper support for in-kernel DRM clients remains in
> its current location.

Thanks for this patch, it's cleaner this way.
I've rebased drm_log on top of it, and it works.
I've also merged the content of drm_log.h into drm_client_internal.h
I will send the updated series when this one is merged.

Best regards,

-- 

Jocelyn

> 
> No functional changes.
> 
> Thomas Zimmermann (3):
>    drm: Move client code to clients/ subdirectory
>    drm/client: Move public client header to clients/ subdirectory
>    drm/fbdev-client: Unexport drm_fbdev_client_setup()
> 
>   drivers/gpu/drm/Kconfig                       | 72 +-----------------
>   drivers/gpu/drm/Makefile                      |  9 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +-
>   .../gpu/drm/arm/display/komeda/komeda_drv.c   |  2 +-
>   drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>   drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>   drivers/gpu/drm/armada/armada_drv.c           |  2 +-
>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>   drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
>   drivers/gpu/drm/clients/Kconfig               | 73 +++++++++++++++++++
>   drivers/gpu/drm/clients/Makefile              |  5 ++
>   .../gpu/drm/clients/drm_client_internal.h     |  4 +-
>   .../gpu/drm/{ => clients}/drm_client_setup.c  |  5 +-
>   .../gpu/drm/{ => clients}/drm_fbdev_client.c  |  4 +-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
>   drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>   drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
>   drivers/gpu/drm/gud/gud_drv.c                 |  2 +-
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
>   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  2 +-
>   drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
>   drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  2 +-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
>   drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
>   drivers/gpu/drm/logicvc/logicvc_drm.c         |  2 +-
>   drivers/gpu/drm/loongson/lsdc_drv.c           |  2 +-
>   drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>   drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.c         |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c                 |  2 +-
>   drivers/gpu/drm/mxsfb/lcdif_drv.c             |  2 +-
>   drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 +-
>   drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
>   drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>   drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
>   drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 +-
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  2 +-
>   .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  2 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
>   drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
>   drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>   drivers/gpu/drm/stm/drv.c                     |  2 +-
>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
>   drivers/gpu/drm/tegra/drm.c                   |  2 +-
>   drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
>   drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
>   drivers/gpu/drm/tiny/arcpgu.c                 |  3 +-
>   drivers/gpu/drm/tiny/bochs.c                  |  2 +-
>   drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
>   drivers/gpu/drm/tiny/gm12u320.c               |  2 +-
>   drivers/gpu/drm/tiny/hx8357d.c                |  2 +-
>   drivers/gpu/drm/tiny/ili9163.c                |  2 +-
>   drivers/gpu/drm/tiny/ili9225.c                |  2 +-
>   drivers/gpu/drm/tiny/ili9341.c                |  2 +-
>   drivers/gpu/drm/tiny/ili9486.c                |  2 +-
>   drivers/gpu/drm/tiny/mi0283qt.c               |  2 +-
>   drivers/gpu/drm/tiny/ofdrm.c                  |  2 +-
>   drivers/gpu/drm/tiny/panel-mipi-dbi.c         |  2 +-
>   drivers/gpu/drm/tiny/repaper.c                |  2 +-
>   drivers/gpu/drm/tiny/sharp-memory.c           |  2 +-
>   drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
>   drivers/gpu/drm/tiny/st7586.c                 |  2 +-
>   drivers/gpu/drm/tiny/st7735r.c                |  2 +-
>   drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>   drivers/gpu/drm/udl/udl_drv.c                 |  2 +-
>   drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
>   drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
>   drivers/gpu/drm/vkms/vkms_drv.c               |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  2 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +-
>   include/drm/{ => clients}/drm_client_setup.h  |  0
>   78 files changed, 158 insertions(+), 155 deletions(-)
>   create mode 100644 drivers/gpu/drm/clients/Kconfig
>   create mode 100644 drivers/gpu/drm/clients/Makefile
>   rename include/drm/drm_fbdev_client.h => drivers/gpu/drm/clients/drm_client_internal.h (85%)
>   rename drivers/gpu/drm/{ => clients}/drm_client_setup.c (96%)
>   rename drivers/gpu/drm/{ => clients}/drm_fbdev_client.c (98%)
>   rename include/drm/{ => clients}/drm_client_setup.h (100%)
> 

