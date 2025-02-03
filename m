Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C263CA25B47
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EB610E055;
	Mon,  3 Feb 2025 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KHjFWCrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04E110E055
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738590545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCnbh2rHtvG8ufUpmEcsV5kGVSlh2z7m5Sra0NhDUy4=;
 b=KHjFWCrLxZlVPVxBoVrYqdbJV6IQTrRGuPh0bzVvktJCBxpcD+2qS3Xi6fn4KvPoW5DbcX
 JX6c8rtHpa/jWW36zkrKcvll/wDflE3+Y58yW3KX0vr8OphVIhnGBn4Iu33MMiMJMay8Pj
 ghS7GnWY8ct16ceMkxw1WgHE9VGjGV4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-C-KV1HXlNkuWmu3YSTkxGw-1; Mon, 03 Feb 2025 08:49:04 -0500
X-MC-Unique: C-KV1HXlNkuWmu3YSTkxGw-1
X-Mimecast-MFC-AGG-ID: C-KV1HXlNkuWmu3YSTkxGw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-436225d4389so23714355e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 05:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738590543; x=1739195343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mCnbh2rHtvG8ufUpmEcsV5kGVSlh2z7m5Sra0NhDUy4=;
 b=EcxU10ncBrd8udKXRxKviQM5uQv9ey7IEVen346APFIN/zYH8oKKAt8OWMqzvDUAtg
 10yoV+DG8CyXuhirZyhDuguPnWIU1hPuQEbm/BX6aTZGGRUS8GPrhh6Bn30CF+VXKU/Q
 YUfa0yWhKQiWLVgH+3i3nwzRfVZCHQ1+XYOWV+gAF+cVtewQCQqByJKeEK/WawSotqZS
 onEXpGuzzikv7QiiwHgHjuOoFhWv5Zvo45U1MrWNlnWGc/EnWfoYD4ZR7rAW/hW0Lv4K
 gN+4SB3e9QVtzPkdL9XkReNS79ShjRMtLm6uvwsN+Y/JjWNSnU1OAjKzlAovzUuh2qOi
 CwJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEhRnoftMDZ2b6r3Fdpu8SSaDUPgdl0f1XSkwJkR/DNJOh3l+F3g78DYa/weuWdqHoF4DWj+WXZ34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqoOonpNRxSfNVPrBEwEXFuVn4eSUtlhECT8Vmqvn8ME7bkY9H
 48JV7Aoirp35k2ubr5ZCPRvp0lOrIqZ60t2HUK0ldI2q+M6hIVqC1d9iOdDbzPcDy/UB423AA6G
 hJDeImGIn4TAAOsVYDnxoL9W7rRyHItgGiJhtlk0iLzUvt0wVdUaAvEg2tLUCIBRh1w==
X-Gm-Gg: ASbGncuo51/HhKC8g2Jyql9XGjdnJbuYsJ69ovo1iy9WQJ6jfSr3PawBM8tFuh4hma5
 yVl7tPyWI52iZgAySohg2p8t4tbaZOWbzCLzjm5Lj4JY+yBgUuDMNXBY0Qnh0VnUNcHoGWqX4wI
 eKT/NAT3ngVwRHnLm0Tm8Dn+RJHvr8m6D+8DFpO4e478Eqj0THab0iuq8nZC+cUo1xsXmaBTqcf
 kG+/mjZyMI0Fh/juWJi2srdiFv0FPQ964u/552GGybyf3wnHg7ZiVs/F1G+RKwKXfysXpb8dShl
 5yvbdiY9dUMkuYQUDvEbJsilBl4Au1E5LoXChl/VjOLJ
X-Received: by 2002:a05:600c:83c4:b0:436:2155:be54 with SMTP id
 5b1f17b1804b1-438e6eaaab1mr106932645e9.1.1738590543056; 
 Mon, 03 Feb 2025 05:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoALKOFXe9v5uR4kQ76q04gknKbEJgZlj7+pXVLgrpeGK21EvPnNDw1VXjZRv2PdNSQ2rXEQ==
X-Received: by 2002:a05:600c:83c4:b0:436:2155:be54 with SMTP id
 5b1f17b1804b1-438e6eaaab1mr106932435e9.1.1738590542560; 
 Mon, 03 Feb 2025 05:49:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f492sm154303805e9.38.2025.02.03.05.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:49:02 -0800 (PST)
Message-ID: <6d2e6b82-2ed6-4c78-9f5d-b2f6ba8aebeb@redhat.com>
Date: Mon, 3 Feb 2025 14:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Gwenael Georgeault <ggeorgea@matrox.com>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <alpine.LFD.2.00.2502030802150.30536@pluton.matrox.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <alpine.LFD.2.00.2502030802150.30536@pluton.matrox.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iXp1Y2PmlNdikeTai6nEXAEVh2eOJ9xD-X27VdH6PVU_1738590543
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/02/2025 14:07, Gwenael Georgeault wrote:
> - Added the new device ID
> - Added new pll algorithm

Hi,

Thanks for this patch.
Overall it looks good, I have a few comments below:

Best regards,

-- 

Jocelyn
> 
> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
> ---
>   drivers/gpu/drm/mgag200/Makefile          |   1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   7 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 212 ++++++++++++++++++++++
>   4 files changed, 222 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> 
> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/ 
> Makefile
> index 5a02203fad12..94f063c8722a 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -6,6 +6,7 @@ mgag200-y := \
>       mgag200_g200.o \
>       mgag200_g200eh.o \
>       mgag200_g200eh3.o \
> +    mgag200_g200eh5.o \
>       mgag200_g200er.o \
>       mgag200_g200ev.o \
>       mgag200_g200ew3.o \
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.c
> index 069fdd2dc8f6..1c257f5b5136 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -214,6 +214,7 @@ static const struct pci_device_id 
> mgag200_pciidlist[] = {
>       { PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_ER },
>       { PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EW3 },
>       { PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH3 },
> +    { PCI_VENDOR_ID_MATROX, 0x53A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
> G200_EH5 },
>       {0,}
>   };
> 
> @@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct 
> pci_device_id *ent)
>       case G200_EH3:
>           mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
>           break;
> +    case G200_EH5:
> +        mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
> +        break;
>       case G200_ER:
>           mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
>           break;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/ 
> mgag200/mgag200_drv.h
> index 0608fc63e588..065ba09d109b 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -196,6 +196,7 @@ enum mga_type {
>       G200_EV,
>       G200_EH,
>       G200_EH3,
> +    G200_EH5,
>       G200_ER,
>       G200_EW3,
>   };
> @@ -333,11 +334,13 @@ void mgag200_g200eh_pixpllc_atomic_update(struct 
> drm_crtc *crtc, struct drm_atom
>   struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
> -                         const struct drm_driver *drv);
> +                        const struct drm_driver *drv);
The alignment was correct, don't modify indentation on lines you don't 
change.

> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +                        const struct drm_driver *drv);
>   struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>                           const struct drm_driver *drv);
>   struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
> -                         const struct drm_driver *drv);
> +                        const struct drm_driver *drv);
Here too
> 
>   /*
>    * mgag200_mode.c
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/ 
> drm/mgag200/mgag200_g200eh5.c
> new file mode 100644
> index 000000000000..5e39504785d8
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "mgag200_drv.h"
> +
> +/*
> + * PIXPLLC
> + */
> +
> +static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
> +                    struct drm_atomic_state *new_state)
> +{
> +
> +    static u64 ulVCOMax     = 10000000000ULL;   // units in Hz (10 GHz)
> +    static u64 ulVCOMin     = 2500000000LL;     // units in Hz (2.5 GHz)
> +    static u64 ulPLLFreqRef = 25000000ULL;      // units in Hz (25 MHz)
We don't use type prefix in the kernel, and usually variables are all 
lowercase.

Also those 3 variables don't need to be static. (Used like this, it 
means it will keep it's value when you call this function again, which 
is not needed as they are constant).

> +
> +    struct drm_crtc_state *new_crtc_state = 
> drm_atomic_get_new_crtc_state(new_state, crtc);
> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
> to_mgag200_crtc_state(new_crtc_state);
> +    long   clock = new_crtc_state->mode.clock;
> +    struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
> +
> +    u64 ulFDelta     = 0xFFFFFFFFFFFFFFFFULL;
> +
> +    u16 ulMultMax    = (u16)(ulVCOMax / ulPLLFreqRef);    // 400 (0x190)
> +    u16 ulMultMin    = (u16)(ulVCOMin / ulPLLFreqRef);    // 100 (0x64)

Here the type prefix is wrong, as it's not an unsigned long. But like 
all variables, just remove the prefix, and rename them to lowercase 
(either multmax or mult_max).

> +
> +    u64 ulFTmpDelta;
> +    u64 ulComputedFo;
> +
> +    u16 ulTestM;
> +    u8  ulTestDivA;
> +    u8  ulTestDivB;
> +    u64 ulFoHz;
> +    int iDone = 0;

iDone is useless, if you find the right parameters, and ulFDelta is 0, 
then you won't find a better solution, because you can't have 
(ulFTmpDelta < ulFDelta).
It's a small optimisation to avoid some loops, but the PLL are 
configured only once, so it's really not worth it.

> +
> +    u8 ucM = 0;
> +    u8 ucN = 0;
> +    u8 ucP = 0;
> +
> +    ulFoHz = (u64)clock * 1000ULL;
> +
> +
> +    for (ulTestM = ulMultMin; ulTestM <= ulMultMax; ulTestM++) { // 
> This gives 100 <= M <= 400
> +        for (ulTestDivA = 8; ulTestDivA > 0; ulTestDivA--) { // This 
> gives 1 <= A <= 8
> +            for (ulTestDivB = 1; ulTestDivB <= ulTestDivA; ulTestDivB++) {
> +                // This gives 1 <= B <= A
> +                ulComputedFo = (ulPLLFreqRef * ulTestM) /
> +                    (4 * ulTestDivA * ulTestDivB);
> +
> +                if (ulComputedFo > ulFoHz)
> +                    ulFTmpDelta = ulComputedFo - ulFoHz;
> +                else
> +                    ulFTmpDelta = ulFoHz - ulComputedFo;
> +
> +                if (ulFTmpDelta < ulFDelta) {
> +                    ulFDelta = ulFTmpDelta;
> +                    ucM = (u8)(0xFF & ulTestM);
> +                    ucN = (u8)(
> +                    (0x7 & (ulTestDivA - 1))
> +                    | (0x70 & (0x7 & (ulTestDivB - 1)) << 4)
> +                    );
> +                    ucP = (u8)(1 & (ulTestM >> 8));
> +                }
> +                if (ulFDelta == 0) {
> +                    iDone = 1;
> +                    break;
> +                }
> +            } // End of DivB if (iDone)
> +            if (iDone)
> +                break;
> +        } // End of DivA Loop
> +
> +        if (iDone)
> +            break;
> +    } // End of M Loop
> +
> +    pixpllc->m = ucM + 1;
> +    pixpllc->n = ucN + 1;
> +    pixpllc->p = ucP + 1;
> +    pixpllc->s = 0;
> +
> +    return 0;
> +    }
> +
> +
> +
> +/*
> + * Mode-setting pipeline
> + */
> +
> +static const struct drm_plane_helper_funcs 
> mgag200_g200eh5_primary_plane_helper_funcs = {
> +    MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
> +};
> +
> +static const struct drm_plane_funcs mgag200_g200eh5_primary_plane_funcs 
> = {
> +    MGAG200_PRIMARY_PLANE_FUNCS,
> +};
> +
> +static const struct drm_crtc_helper_funcs 
> mgag200_g200eh5_crtc_helper_funcs = {
> +    MGAG200_CRTC_HELPER_FUNCS,
> +};
> +
> +static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
> +    MGAG200_CRTC_FUNCS,
> +};
> +
> +static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
> +{
> +    struct drm_device *dev = &mdev->base;
> +    struct drm_plane *primary_plane = &mdev->primary_plane;
> +    struct drm_crtc *crtc = &mdev->crtc;
> +    int ret;
> +
> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
> +        &mgag200_g200eh5_primary_plane_funcs,
> +        mgag200_primary_plane_formats,
> +        mgag200_primary_plane_formats_size,
> +        mgag200_primary_plane_fmtmods,
> +        DRM_PLANE_TYPE_PRIMARY, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
> +        return ret;
> +    }
> +    drm_plane_helper_add(primary_plane, 
> &mgag200_g200eh5_primary_plane_helper_funcs);
> +    drm_plane_enable_fb_damage_clips(primary_plane);
> +
> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
> +        &mgag200_g200eh5_crtc_funcs, NULL);
> +    if (ret) {
> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
> +        return ret;
> +    }
> +
> +    drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
> +
> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
> without */
> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
> +    ret = mgag200_vga_bmc_output_init(mdev);
> +
> +    if (ret)
> +        return ret;
> +
> +    return 0;
> +}
> +
> +/*
> + * DRM device
> + */
> +
> +static const struct mgag200_device_info mgag200_g200eh5_device_info =
> +    MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
> +
> +static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs = {
> +    .pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
> +    .pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // 
> same as G200EH
> +};
> +
> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
> +    const struct drm_driver *drv)
> +{
> +
> +    struct mga_device *mdev;
> +    struct drm_device *dev;
> +    resource_size_t vram_available;
> +    int ret;
> +
> +    mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
> +
> +    if (IS_ERR(mdev))
> +        return mdev;
> +    dev = &mdev->base;
> +
> +    pci_set_drvdata(pdev, dev);
> +
> +    ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_preinit(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
> +        &mgag200_g200eh5_device_funcs);
> +
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    mgag200_g200eh_init_registers(mdev); // same as G200EH
> +    vram_available = mgag200_device_probe_vram(mdev);
> +
> +    ret = mgag200_mode_config_init(mdev, vram_available);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    ret = mgag200_g200eh5_pipeline_init(mdev);
> +    if (ret)
> +        return ERR_PTR(ret);
> +
> +    drm_mode_config_reset(dev);
> +    drm_kms_helper_poll_init(dev);
> +
> +    return mdev;
> +}

