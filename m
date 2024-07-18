Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629F934CA5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA66110E7A7;
	Thu, 18 Jul 2024 11:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SLu8WmS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C100910E7A7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721302503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mTngtBUxuEYrAjYDlW4VqeRFK45WLHyUJLyxboPYQM=;
 b=SLu8WmS4qyVBcoxMjRWDxRJ5qTFG4GUMM20iEexpnLiDcmWAP8YJsl7tD5QMAQq+Ct/ohs
 CKbCemZG0dTYUX4upfUYZeDsuFeAs05+P36xOsx0bYC4JeYJEl2nCMyTKBKBIt7iR2fPWD
 +tYgiLkyfRM1QLM4zW0q4ru38JbAskg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-UKoKAQpsOA6wsoqIHgdlaA-1; Thu, 18 Jul 2024 07:35:02 -0400
X-MC-Unique: UKoKAQpsOA6wsoqIHgdlaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36796a0687bso422481f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 04:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721302501; x=1721907301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mTngtBUxuEYrAjYDlW4VqeRFK45WLHyUJLyxboPYQM=;
 b=sKLZMNF2te3Q+q71kghVHKsXA3iIM7PDCibZNdTmB7vBn0bTh9lJUaevHS/Vn6qTjJ
 BdzGa+IZ56ZWIUglb5+GnXJDwNNA+85SRbtk9QyDTuWXCsnU8Ms+qnCR4MXFcyZ3dZB+
 aShvvyCogCmOlB9tLTfsSmqlBUaOm8wCcq86lw3uAdBXTLuiukEFgMgp28pDbjPIE0Ir
 mpylqTzZUns4bqhcMs2m9Ec1RUE1r0vUTrPQAUgxxFHFm+JK2YRlo7EFnQBxnpePg/2W
 YSSRY1zYFC5XhKtcsy5Yh4VtJsOkzP2EHbnoLIXqFWDbS52vZ9zMIa6i3Gr06d3y4GBo
 +KlA==
X-Gm-Message-State: AOJu0YxO7OmsXcd2eugIpf4+JhXbudk7lUl8zSfgOpyxmkYGXLsc7Dfk
 ezbx0sGP+QfbEQtA7qxRE2LOZiD2fuoQTOckd9o1gP9e4zNVMPFKhJGWfVvCJJky1aoZgAaadp2
 CHJBe1ArIgc8z54wtw1YYuTWHXr2sz96Co5hlL7/sz2qQ6oDLECwMKINY5rHRNLCDlQ==
X-Received: by 2002:adf:fe50:0:b0:362:5816:f134 with SMTP id
 ffacd0b85a97d-368315fe328mr2326375f8f.13.1721302501132; 
 Thu, 18 Jul 2024 04:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwj2oOVP0HHkui/YrhCt6om+WR19kBaRCU+3ZNxOCsBSB6Pcy05Q+MtKBBTHhmWtuGd2NwEA==
X-Received: by 2002:adf:fe50:0:b0:362:5816:f134 with SMTP id
 ffacd0b85a97d-368315fe328mr2326353f8f.13.1721302500541; 
 Thu, 18 Jul 2024 04:35:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3686562ecedsm727746f8f.76.2024.07.18.04.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:35:00 -0700 (PDT)
Message-ID: <2436b6d7-70ba-4f95-9b27-e2c4e88a2db1@redhat.com>
Date: Thu, 18 Jul 2024 13:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] drm/mgag200: Add vblank support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <20240718104551.575912-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240718104551.575912-7-tzimmermann@suse.de>
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



On 18/07/2024 12:44, Thomas Zimmermann wrote:
> There's no VBLANK interrupt on Matrox chipsets. The workaround that is
> being used here and in other free Matrox drivers is to program <linecomp>
> to the value of <vblkstr> and enable the VLINE interrupt. This triggers
> an interrupt at the time when VBLANK begins.
> 
> VLINE uses separate registers for enabling and clearing pending interrupts.
> No extra synchronization between irq handler and the rest of the driver is
> required.
> 
> v5:
> - disable all interrupts before registering IRQ (Jocelyn)
> - don't read from ICLEAR (Jocelyn)
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
> Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c     | 40 +++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  6 ++-
>   drivers/gpu/drm/mgag200/mgag200_g200.c    |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  5 +++
>   drivers/gpu/drm/mgag200/mgag200_mode.c    | 52 ++++++++++++++++++++++-
>   drivers/gpu/drm/mgag200/mgag200_reg.h     |  7 +++
>   12 files changed, 143 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 62080cf0f2da..c33d4be4ef9d 100644
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
> @@ -84,6 +85,34 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>   	return offset - 65536;
>   }
>   
> +static irqreturn_t mgag200_irq_handler(int irq, void *arg)
> +{
> +	struct drm_device *dev = arg;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	struct drm_crtc *crtc;
> +	u32 status, ien;
> +
> +	status = RREG32(MGAREG_STATUS);
> +
> +	if (status & MGAREG_STATUS_VLINEPEN) {
> +		ien = RREG32(MGAREG_IEN);
> +		if (!(ien & MGAREG_IEN_VLINEIEN))
> +			goto out;
> +
> +		crtc = drm_crtc_from_index(dev, 0);
> +		if (WARN_ON_ONCE(!crtc))
> +			goto out;
> +		drm_crtc_handle_vblank(crtc);
> +
> +		WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
> +
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
> @@ -167,6 +196,7 @@ int mgag200_device_init(struct mga_device *mdev,
>   			const struct mgag200_device_funcs *funcs)
>   {
>   	struct drm_device *dev = &mdev->base;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
>   	u8 crtcext3, misc;
>   	int ret;
>   
> @@ -192,6 +222,16 @@ int mgag200_device_init(struct mga_device *mdev,
>   
>   	mutex_unlock(&mdev->rmmio_lock);
>   
> +	WREG32(MGAREG_IEN, 0);
> +	WREG32(MGAREG_ICLEAR, 0);

Writing 0 to iclear has no effect, I think it should be 0x1ff to clear 
all interrupts, (or 0x1a5 as only bits 0, 2, 5, 7, 8 are defined in the 
specification).

with that:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

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
> index f97eaa49b089..829d32f50915 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -411,6 +411,8 @@ void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic
>   void mgag200_crtc_reset(struct drm_crtc *crtc);
>   struct drm_crtc_state *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
>   void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
> +int mgag200_crtc_enable_vblank(struct drm_crtc *crtc);
> +void mgag200_crtc_disable_vblank(struct drm_crtc *crtc);
>   
>   #define MGAG200_CRTC_FUNCS \
>   	.reset = mgag200_crtc_reset, \
> @@ -418,7 +420,9 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
>   	.set_config = drm_atomic_helper_set_config, \
>   	.page_flip = drm_atomic_helper_page_flip, \
>   	.atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
> -	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state
> +	.atomic_destroy_state = mgag200_crtc_atomic_destroy_state, \
> +	.enable_vblank = mgag200_crtc_enable_vblank, \
> +	.disable_vblank = mgag200_crtc_disable_vblank
>   
>   void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mode *mode,
>   			   bool set_vidrst);
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
> index 737a48aa9160..6d727ab1a7aa 100644
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
> @@ -315,5 +316,9 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
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
> index 8d1ccc2ad94a..e6c9ba61bf97 100644
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
> @@ -320,5 +321,9 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
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
> index 265f3e95830a..fbaa97c7e0da 100644
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
> @@ -202,5 +203,9 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
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
> index cf7f6897838f..2a53ebf41539 100644
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
> @@ -520,5 +521,9 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
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
> index e25477347c3e..33ef35c95acb 100644
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
> @@ -326,5 +327,9 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
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
> index ff90f29b0612..afabf693df64 100644
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
> @@ -640,6 +648,8 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	struct drm_device *dev = crtc->dev;
>   	struct mga_device *mdev = to_mga_device(dev);
> +	struct drm_pending_vblank_event *event;
> +	unsigned long flags;
>   
>   	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>   		const struct drm_format_info *format = mgag200_crtc_state->format;
> @@ -649,6 +659,18 @@ void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_s
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
> @@ -676,12 +698,16 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   
>   	if (mdev->info->sync_bmc)
>   		mgag200_bmc_start_scanout(mdev);
> +
> +	drm_crtc_vblank_on(crtc);
>   }
>   
>   void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
>   {
>   	struct mga_device *mdev = to_mga_device(crtc->dev);
>   
> +	drm_crtc_vblank_off(crtc);
> +
>   	if (mdev->info->sync_bmc)
>   		mgag200_bmc_stop_scanout(mdev);
>   
> @@ -732,6 +758,30 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
>   	kfree(mgag200_crtc_state);
>   }
>   
> +int mgag200_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct mga_device *mdev = to_mga_device(crtc->dev);
> +	u32 ien;
> +
> +	WREG32(MGAREG_ICLEAR, MGAREG_ICLEAR_VLINEICLR);
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

