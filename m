Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01392A322
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB0C10E1F7;
	Mon,  8 Jul 2024 12:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eiFRTsge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37D610E1F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720442783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhoO6urTVJ0q192k56ooXPYrzl6TzMmLD2n9wo2/bAc=;
 b=eiFRTsgen5T3WF4ENBIp7uxRYWmh7hw6QcycNaBdRt0prouZ/QLxlG4MpMRgmP0qykPd8e
 HAtmirP+3ljz1yOMZpBdcpKiYHwkkvxcmALY116Qy4wgX3v3KTzyLjuXtzfmUkJ4uiezNO
 xiTVftfv1vcNkbNuKVZFEF26wE2EwlQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-rN2WVHcgMEy3WfD-uW9hNw-1; Mon, 08 Jul 2024 08:46:22 -0400
X-MC-Unique: rN2WVHcgMEy3WfD-uW9hNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-367987cff30so2654318f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442781; x=1721047581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AhoO6urTVJ0q192k56ooXPYrzl6TzMmLD2n9wo2/bAc=;
 b=g22YBectl4y2XE+8G1Yj64Pv/0oWKh5zhwrbLnOOytG+9UWwIka1A2Jkc+XiPrGMk8
 dwAkIQ25orxRmH6DtpyyrKSQJxr2/9Ctwg4h36nBfZWlu4/qybUdO+mUOkXZtg2nJTl6
 unImZRhe4ymyovAq9J3nYrN5zY/0zBI+m2lv+xO4JGlH4beXsVHojqsgwEiZcn2SmLII
 YaHSi8KfTTFGe9EwCwn5JGyUtXgssPLtg0FqPBtzEGrv1jusLNhLUR6h1+dEuYbfDnh6
 DoCkSvktPD3F5q9c/AP4/Preiy6hugdeZA9hZGOWZ89N+x1jmRTLBiK3Pmodu0CjhQtz
 QGqA==
X-Gm-Message-State: AOJu0Yz1GeCR/e11wBjnBMlBY120HcWr6DB+eMUU1Fmt2IlpUf/V/7f8
 2iHutTy322NxH+1PEVNjTqyCvWFSHrP3/8+Zz0tA5zSY2I+Ot7zyXDqlAWf1HP6fKR3p6Llw0Kc
 54XO3ki7yyQjo+2uIrYNlhBgkcgXwr3lmm8jmKn7wZsrGtX58B73bowZQxfHI2UCqZDGH5gZFsA
 ==
X-Received: by 2002:a5d:4f05:0:b0:366:efa2:f2f7 with SMTP id
 ffacd0b85a97d-3679dd15b0emr8645921f8f.1.1720442780950; 
 Mon, 08 Jul 2024 05:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkpawbuDfiwYZKmzSEu7EUVZzM4xhNmo2MbgKIgjCYu6uQNEja/xMYRNljIEpoHY6nVIf08g==
X-Received: by 2002:a5d:4f05:0:b0:366:efa2:f2f7 with SMTP id
 ffacd0b85a97d-3679dd15b0emr8645896f8f.1.1720442780433; 
 Mon, 08 Jul 2024 05:46:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678fefc01dsm14416235f8f.26.2024.07.08.05.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:46:18 -0700 (PDT)
Message-ID: <1ff58346-c5cb-4fcf-9583-e048422fe7f7@redhat.com>
Date: Mon, 8 Jul 2024 14:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/mgag200: Add vblank support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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



On 05/07/2024 13:47, Thomas Zimmermann wrote:
> There's no VBLANK interrupt on Matrox chipsets. The workaround that is
> being used here and in other free Matrox drivers is to program <linecomp>
> to the value of <vblkstr> and enable the VLINE interrupt. This triggers
> an interrupt at the time when VBLANK begins.
> 
> VLINE uses separate registers for enabling and clearing pending interrupts.
> No extra synchronization between irq handler and the rest of the driver is
> required.

Thanks for this patch, I have a few comments below:
> 
> v4:
> - recreate patch on latest upstream
> - use devm_request_irq() for managed cleanup
> - fail if vblanking cannot be initialized
> - rename register constants (Sam, Emil)
> - clear interrupt before registering handler (Ville)
> - move <linecomp> programming into separate commit
> - set <linecomp> to <vblkstr>
> - fix typo in commit message
> 
> v3:
> - set <linecomp> to <vdisplay> + 1 to trigger at VBLANK
> - expand comment on linecomp
> 
> v2:
> - only signal vblank on CRTC 0
> - use constants for registers and fields
> - set VLINECLR before enabling interrupt
> - test against STATUS and IEN in irq handler
> - coding-style fixes
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c     | 47 ++++++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  6 ++-
>   drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_mode.c    | 54 ++++++++++++++++++++++-
>   drivers/gpu/drm/mgag200/mgag200_reg.h     |  7 +++
>   12 files changed, 152 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 62080cf0f2da..62479de9e659 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -18,6 +18,7 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
>   #include <drm/drm_pciids.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -84,6 +85,35 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>   	return offset - 65536;
>   }
>   
> +static irqreturn_t mgag200_irq_handler(int irq, void *arg)
> +{
> +	struct drm_device *dev = arg;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	struct drm_crtc *crtc;
> +	u32 status, ien, iclear;
> +
> +	status = RREG32(MGAREG_STATUS);
> +
> +	if (status & MGAREG_STATUS_VLINEPEN) {
> +		ien = RREG32(MGAREG_IEN);
> +		if (!(ien & MGAREG_IEN_VLINEIEN))
> +			goto out;
> +
This is to catch a race condition, receiving the interrupt, just after 
disabling it ? I think you still want to clear it, to avoid having it 
fire as soon as you re-enable it ?

> +		crtc = drm_crtc_from_index(dev, 0);
> +		if (WARN_ON_ONCE(!crtc))
> +			goto out;
> +		drm_crtc_handle_vblank(crtc);
> +
> +		iclear = RREG32(MGAREG_ICLEAR);

iclear is a Write-Only register, according to the documentation.
So reading it will always return 0.

I would suggest to just write:

WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);

> +		iclear |= MGAREG_ICLEAR_VLINEICLR;
> +		WREG32(MGAREG_ICLEAR, iclear);
> +		return IRQ_HANDLED;
> +	}
> +
> +out:
> +	return IRQ_NONE;
> +}
> +
>   /*
>    * DRM driver
>    */
> @@ -167,7 +197,9 @@ int mgag200_device_init(struct mga_device *mdev,
>   			const struct mgag200_device_funcs *funcs)
>   {
>   	struct drm_device *dev = &mdev->base;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>   	u8 crtcext3, misc;
> +	u32 ien, iclear;
>   	int ret;
>   
>   	mdev->info = info;
> @@ -192,6 +224,21 @@ int mgag200_device_init(struct mga_device *mdev,
>   
>   	mutex_unlock(&mdev->rmmio_lock);
>   
> +	ien = RREG32(MGAREG_IEN);
> +	ien &= ~(MGAREG_IEN_VLINEIEN);
> +	WREG32(MGAREG_IEN, ien);

I would suggest to disable all interrupt instead,
WREG32(MGAREG_IEN, 0);



> +
> +	iclear = RREG32(MGAREG_ICLEAR);

same here, don't read the iclear register.

> +	iclear |= MGAREG_ICLEAR_VLINEICLR;
> +	WREG32(MGAREG_ICLEAR, iclear);
> +
> +	ret = devm_request_irq(&pdev->dev, pdev->irq, mgag200_irq_handler, IRQF_SHARED,
> +			       dev->driver->name, dev);
> +	if (ret) {
> +		drm_err(dev, "Failed to acquire interrupt, error %d\n", ret);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 7f7dfbd0f013..f7b22b195016 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -421,6 +421,8 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
>   void mgag200_crtc_reset(struct drm_crtc *crtc);
>   struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
>   void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
> +int mgag200_crtc_enable_vblank(struct drm_crtc *crtc);
> +void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
>   
>   #define MGAG200_CRTC_FUNCS \
>   	.reset = mgag200_crtc_reset, \
> @@ -428,7 +430,9 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
>   	.set_config = drm_atomic_helper_set_config, \
>   	.page_flip = drm_atomic_helper_page_flip, \
>   	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
> -	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
> +	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
> +	.enable_vblank = mgag200_crtc_enable_vblank, \
> +	.disable_vblank = mgag200_crtc_disable_vblank
>   
>   void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode);
>   void mgag200_set_format_regs(struct mga_device *mdev, const struct drm_format_info *format);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
> index f874e2949840..77ce8d36cef0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -403,5 +404,9 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> index 52bf49ead5c5..72bd8e3421c2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -279,5 +280,9 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> index e7f89b2a59fd..1bbb0745b84a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -184,5 +185,9 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index 4e8a1756138d..3350baf08a45 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -318,5 +319,9 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index d884f3cb0ec7..88d8bcd6fe51 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -323,5 +324,9 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index 839401e8b465..9d08180f7612 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -204,5 +205,9 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index a824bb8ad579..fcc8075627ef 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -523,5 +524,9 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index 835df0f4fc13..4f8ef3465b9f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_drv.h"
>   
> @@ -328,5 +329,9 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
>   	drm_mode_config_reset(dev);
>   	drm_kms_helper_poll_init(dev);
>   
> +	ret = drm_vblank_init(dev, 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index da2cbe81d4e6..ec6fb1277d6e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -22,6 +22,7 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_panic.h>
>   #include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
>   
>   #include "mgag200_ddc.h"
>   #include "mgag200_drv.h"
> @@ -226,7 +227,14 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   	vblkstr = mode->crtc_vblank_start;
>   	vblkend = vtotal + 1;
>   
> -	linecomp = vdispend;
> +	/*
> +	 * There's no VBLANK interrupt on Matrox chipsets, so we use
> +	 * the VLINE interrupt instead. It triggers when the current
> +	 * <linecomp> has been reached. For VBLANK, this is the first
> +	 * non-visible line at the bottom of the screen. Therefore,
> +	 * keep <linecomp> in sync with <vblkstr>.
> +	 */
> +	linecomp = vblkstr;
>   
>   	misc = RREG8(MGA_MISC_IN);
>   
> @@ -637,6 +645,8 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	struct drm_device *dev = crtc->dev;
>   	struct mga_device *mdev = to_mga_device(dev);
> +	struct drm_pending_vblank_event *event;
> +	unsigned long flags;
>   
>   	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>   		const struct drm_format_info *format = mgag200_crtc_state->format;
> @@ -646,6 +656,18 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
>   		else
>   			mgag200_crtc_set_gamma_linear(mdev, format);
>   	}
> +
> +	event = crtc->state->event;
> +	if (event) {
> +		crtc->state->event = NULL;
> +
> +		spin_lock_irqsave(&dev->event_lock, flags);
> +		if (drm_crtc_vblank_get(crtc) != 0)
> +			drm_crtc_send_vblank_event(crtc, event);
> +		else
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		spin_unlock_irqrestore(&dev->event_lock, flags);
> +	}
>   }
>   
>   void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
> @@ -676,6 +698,8 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   
>   	if (funcs->enable_vidrst)
>   		funcs->enable_vidrst(mdev);
> +
> +	drm_crtc_vblank_on(crtc);
>   }
>   
>   void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
> @@ -683,6 +707,8 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
>   	struct mga_device *mdev = to_mga_device(crtc->dev);
>   	const struct mgag200_device_funcs *funcs = mdev->funcs;
>   
> +	drm_crtc_vblank_off(crtc);
> +
>   	if (funcs->disable_vidrst)
>   		funcs->disable_vidrst(mdev);
>   
> @@ -735,6 +761,32 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
>   	kfree(mgag200_crtc_state);
>   }
>   
> +int mgag200_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
> +	u32 iclear, ien;
> +
> +	iclear = RREG32(MGAREG_ICLEAR);
> +	iclear |= MGAREG_ICLEAR_VLINEICLR;
> +	WREG32(MGAREG_ICLEAR, iclear);

same here, don't read the iclear register.

> +
> +	ien = RREG32(MGAREG_IEN);
> +	ien |= MGAREG_IEN_VLINEIEN;
> +	WREG32(MGAREG_IEN, ien);
> +
> +	return 0;
> +}
> +
> +void mgag200_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
> +	u32 ien;
> +
> +	ien = RREG32(MGAREG_IEN);
> +	ien &= ~(MGAREG_IEN_VLINEIEN);
> +	WREG32(MGAREG_IEN, ien);
> +}
> +
>   /*
>    * Mode config
>    */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_reg.h b/drivers/gpu/drm/mgag200/mgag200_reg.h
> index aa73463674e4..d4fef8f25871 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_reg.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_reg.h
> @@ -102,10 +102,17 @@
>   #define MGAREG_EXEC		0x0100
>   
>   #define	MGAREG_FIFOSTATUS	0x1e10
> +
>   #define	MGAREG_STATUS		0x1e14
> +#define MGAREG_STATUS_VLINEPEN	BIT(5)
> +
>   #define MGAREG_CACHEFLUSH       0x1fff
> +
>   #define	MGAREG_ICLEAR		0x1e18
> +#define MGAREG_ICLEAR_VLINEICLR	BIT(5)
> +
>   #define	MGAREG_IEN		0x1e1c
> +#define MGAREG_IEN_VLINEIEN	BIT(5)
>   
>   #define	MGAREG_VCOUNT		0x1e20
>   


Do you know what happens if the IRQ doesn't work (ie not receiving any IRQ)?
When testing the DMA, I remember that on a few machines, I never get the 
Softrap IRQ. I don't know if it was a DMA engine problem, or if it's the 
mgag200 IRQ that was not connected properly.

I will try to find this machine, and test this series on it.

Best regards,

-- 

Jocelyn

