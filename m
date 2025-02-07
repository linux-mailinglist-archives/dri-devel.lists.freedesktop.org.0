Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E6A2C52E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3B10EB1E;
	Fri,  7 Feb 2025 14:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KMtm3aq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790D10EB1E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738938402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WI37PJY6W4SjT4jRC/9YBD4cM6hytEycAvqoqUwuQE0=;
 b=KMtm3aq+hDojgPzGxqe6mhp6TJ+HyT7HiPLW8hcuSgKBSdGAh58evOSNhoOp2d/TS9nvxm
 StwhD75a7fPNvHsZ8nCK6AYms/9eZFXzmLNQ6vXnsVh8uIREVrTza4n8lWqVW3Xjdgd7nM
 VAA3YUdrK79rIsHC14vDVIOkdFozwGY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-avoiOioQP12QYl-SNmy8AQ-1; Fri, 07 Feb 2025 09:26:40 -0500
X-MC-Unique: avoiOioQP12QYl-SNmy8AQ-1
X-Mimecast-MFC-AGG-ID: avoiOioQP12QYl-SNmy8AQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436289a570eso18366225e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738938400; x=1739543200;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WI37PJY6W4SjT4jRC/9YBD4cM6hytEycAvqoqUwuQE0=;
 b=WBRBSqQK0u9u3H4gwpT1OCqHIHjpwpEliEkUHwZCuxu3gS4tK9FmtkuxELStjNbsMl
 Ru7c2D7agVZpMagWzHAX5g72sU9SY2mVKCDQcW4yI/k38ehC2VVJVZctiYNiMeCwDLJM
 BnQQaLSG+PJGM2p1JbU5xNMrIb3L5mkexUFMUm7kh783BEWexWRZNAZx+iuFvNMUcUsG
 t/IM5rpBFcvuQC8bfsa1eGhIl5/iVyl4hfRcanXz4mg6BgkHY6z8PgMNEjS5LTKlrmS/
 77EFHlAU5aXItS1IM+EYqta+n63D9zz/u9O+5ev2I3ikisB1jOOwiQuwpu2FFnSIeuwo
 sREg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuRKbElE+fuzGqx6+eH1vc9MPVUgRvKJaVFQgwZ4QGFIGYZB0T2mSmjBv8SENODNxHE/NrTts9lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq3q/DSNfNS1Tha/GH46KRxKb9CbADdAhqaBi0j1WSNNhPKmuj
 RVCF+xW6Dd/aNWPYDp7251k7tomUXRMf041dieAtatxU+/GdsQVwjFHmDE3IpHQGu6lLnmr7r87
 EHoc9Zmx+y2oMC9Sd2ldfun4LZPTdYZxQ5eFmUT23062Ox72F5EpixLULIBsn0ECQMg==
X-Gm-Gg: ASbGnctdF1c6YKBz5KKcdk53z7gqrvzEwi+kyEDnMIPlURbHwCRrzuIKB8BduZvRvwD
 SiJ8HAhhR6CrnnZ1DiQRnC/+ISTEbtwHyuoS3Z8lDDlI2ZIdCRVxFj110UysOSemK+5WimpkBPY
 e7WbQuNrcN3MPSQIwiP5OpPqduemU935rVnrHj4P64WPVez1TXGuH8VRPF+cLyiq90D+2qgh+2L
 yGt02vfVpwAktLWogZkiIX5z0bot9AsPkxLC8t2cDJZ72sMyEvaOyTkgv5C8Xu9Gv9W84Yo8YuJ
 aZort1VzApoNXOt+t5lc7lRaQQpZOBLcNjPX27MM1KsM
X-Received: by 2002:a05:600c:4f8e:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-43924990cdbmr37663045e9.13.1738938399601; 
 Fri, 07 Feb 2025 06:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm3p0rosjbyax+gDDRtv5T4I5TGzOJoLbD3wNdOouEOGMa/3r9A0ACgt9OGGWj7t/zXMH1HA==
X-Received: by 2002:a05:600c:4f8e:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-43924990cdbmr37662675e9.13.1738938399072; 
 Fri, 07 Feb 2025 06:26:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dc9ff10sm55889195e9.12.2025.02.07.06.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 06:26:38 -0800 (PST)
Message-ID: <9a38c67c-ebd0-4ca7-82c8-6f29c807a85b@redhat.com>
Date: Fri, 7 Feb 2025 15:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Added support for the new device G200eH5
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gwenael Georgeault <ggeorgea@matrox.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mgi_lnx@matrox.com
References: <alpine.LFD.2.00.2502070816590.23666@pluton.matrox.com>
 <0ec78bb6-bb1b-49b0-aaa3-9d9ecfdda586@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <0ec78bb6-bb1b-49b0-aaa3-9d9ecfdda586@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f7PeSXdRT_ykt9-6zaRwi5BB6uiWWtNETUWTNxuvqnE_1738938400
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

On 07/02/2025 14:36, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 07.02.25 um 14:21 schrieb Gwenael Georgeault:
>> - Added the new device ID
>> - Added new pll algorithm
>>
>> Signed-off-by: Gwenael Georgeault <ggeorgea@matrox.com>
>> Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> There's a remark below, but it might not be an issue.

With the "#include <limits.h>" changed to "#include <linux/limits.h>" 
(see below):
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
>> ---
>>  drivers/gpu/drm/mgag200/Makefile          |   1 +
>>  drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
>>  drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
>>  drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 205 ++++++++++++++++++++++
>>  4 files changed, 213 insertions(+)
>>  create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c
>>
>> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/ 
>> mgag200/Makefile
>> index 5a02203fad12..94f063c8722a 100644
>> --- a/drivers/gpu/drm/mgag200/Makefile
>> +++ b/drivers/gpu/drm/mgag200/Makefile
>> @@ -6,6 +6,7 @@ mgag200-y := \
>>      mgag200_g200.o \
>>      mgag200_g200eh.o \
>>      mgag200_g200eh3.o \
>> +    mgag200_g200eh5.o \
>>      mgag200_g200er.o \
>>      mgag200_g200ev.o \
>>      mgag200_g200ew3.o \
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/ 
>> mgag200/mgag200_drv.c
>> index 069fdd2dc8f6..32cd8ac018c0 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -214,6 +214,7 @@ static const struct pci_device_id 
>> mgag200_pciidlist[] = {
>>      { PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_ER },
>>      { PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_EW3 },
>>      { PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_EH3 },
>> +    { PCI_VENDOR_ID_MATROX, 0x53a, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_EH5 },
>>      {0,}
>>  };
>>
>> @@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const 
>> struct pci_device_id *ent)
>>      case G200_EH3:
>>          mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
>>          break;
>> +    case G200_EH5:
>> +        mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
>> +        break;
>>      case G200_ER:
>>          mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
>>          break;
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/ 
>> mgag200/mgag200_drv.h
>> index 0608fc63e588..819a7e9381e3 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -196,6 +196,7 @@ enum mga_type {
>>      G200_EV,
>>      G200_EH,
>>      G200_EH3,
>> +    G200_EH5,
>>      G200_ER,
>>      G200_EW3,
>>  };
>> @@ -334,6 +335,8 @@ struct mga_device 
>> *mgag200_g200eh_device_create(struct pci_dev *pdev,
>>                          const struct drm_driver *drv);
>>  struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>>                           const struct drm_driver *drv);
>> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
>> +                         const struct drm_driver *drv);
>>  struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
>>                          const struct drm_driver *drv);
>>  struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/ 
>> drm/mgag200/mgag200_g200eh5.c
>> new file mode 100644
>> index 000000000000..2c4265293504
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
>> @@ -0,0 +1,205 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <limits.h>
> 
> I'm skeptical of this line, as it looks like it pulls in a system 
> header. But other drivers do the same, so it's OK, I guess.

Good catch, most other drivers include <linux/limits.h>, which also have 
ULLONG_MAX defined through include/vdso/limits.h:
https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/limits.h
https://elixir.bootlin.com/linux/v6.13.1/source/include/vdso/limits.h

Best regards,

Jocelyn

> 
> Best regards
> Thomas
> 
>> +
>> +#include <linux/pci.h>
>> +#include <linux/units.h>
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +#include "mgag200_drv.h"
>> +
>> +/*
>> + * PIXPLLC
>> + */
>> +
>> +static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
>> +                        struct drm_atomic_state *new_state)
>> +{
>> +    const unsigned long long VCO_MAX = 10 * GIGA; // Hz
>> +    const unsigned long long VCO_MIN = 2500 * MEGA; // Hz
>> +    const unsigned long long PLL_FREQ_REF = 25 * MEGA; // Hz
>> +
>> +    struct drm_crtc_state *new_crtc_state = 
>> drm_atomic_get_new_crtc_state(new_state, crtc);
>> +    struct mgag200_crtc_state *new_mgag200_crtc_state = 
>> to_mgag200_crtc_state(new_crtc_state);
>> +    long clock = new_crtc_state->mode.clock;
>> +    struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state- 
>> >pixpllc;
>> +
>> +    unsigned long long fdelta = ULLONG_MAX;
>> +
>> +    u16 mult_max = (u16)(VCO_MAX / PLL_FREQ_REF); // 400 (0x190)
>> +    u16 mult_min = (u16)(VCO_MIN / PLL_FREQ_REF); // 100 (0x64)
>> +
>> +    u64 ftmp_delta;
>> +    u64 computed_fo;
>> +
>> +    u16 test_m;
>> +    u8 test_div_a;
>> +    u8 test_div_b;
>> +    u64 fo_hz;
>> +
>> +    u8 uc_m = 0;
>> +    u8 uc_n = 0;
>> +    u8 uc_p = 0;
>> +
>> +    fo_hz = (u64)clock * HZ_PER_KHZ;
>> +
>> +    for (test_m = mult_min; test_m <= mult_max; test_m++) { // This 
>> gives 100 <= M <= 400
>> +        for (test_div_a = 8; test_div_a > 0; test_div_a--) { // This 
>> gives 1 <= A <= 8
>> +            for (test_div_b = 1; test_div_b <= test_div_a; 
>> test_div_b++) {
>> +                // This gives 1 <= B <= A
>> +                computed_fo = (PLL_FREQ_REF * test_m) /
>> +                    (4 * test_div_a * test_div_b);
>> +
>> +                if (computed_fo > fo_hz)
>> +                    ftmp_delta = computed_fo - fo_hz;
>> +                else
>> +                    ftmp_delta = fo_hz - computed_fo;
>> +
>> +                if (ftmp_delta < fdelta) {
>> +                    fdelta = ftmp_delta;
>> +                    uc_m = (u8)(0xFF & test_m);
>> +                    uc_n = (u8)((0x7 & (test_div_a - 1))
>> +                        | (0x70 & (0x7 & (test_div_b - 1)) << 4));
>> +                    uc_p = (u8)(1 & (test_m >> 8));
>> +                }
>> +                if (fdelta == 0)
>> +                    break;
>> +            }
>> +            if (fdelta == 0)
>> +                break;
>> +        }
>> +        if (fdelta == 0)
>> +            break;
>> +    }
>> +
>> +    pixpllc->m = uc_m + 1;
>> +    pixpllc->n = uc_n + 1;
>> +    pixpllc->p = uc_p + 1;
>> +    pixpllc->s = 0;
>> +
>> +    return 0;
>> +    }
>> +
>> +/*
>> + * Mode-setting pipeline
>> + */
>> +
>> +static const struct drm_plane_helper_funcs 
>> mgag200_g200eh5_primary_plane_helper_funcs = {
>> +    MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
>> +};
>> +
>> +static const struct drm_plane_funcs 
>> mgag200_g200eh5_primary_plane_funcs = {
>> +    MGAG200_PRIMARY_PLANE_FUNCS,
>> +};
>> +
>> +static const struct drm_crtc_helper_funcs 
>> mgag200_g200eh5_crtc_helper_funcs = {
>> +    MGAG200_CRTC_HELPER_FUNCS,
>> +};
>> +
>> +static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
>> +    MGAG200_CRTC_FUNCS,
>> +};
>> +
>> +static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
>> +{
>> +    struct drm_device *dev = &mdev->base;
>> +    struct drm_plane *primary_plane = &mdev->primary_plane;
>> +    struct drm_crtc *crtc = &mdev->crtc;
>> +    int ret;
>> +
>> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
>> +                       &mgag200_g200eh5_primary_plane_funcs,
>> +                       mgag200_primary_plane_formats,
>> +                       mgag200_primary_plane_formats_size,
>> +                       mgag200_primary_plane_fmtmods,
>> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
>> +    if (ret) {
>> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +    drm_plane_helper_add(primary_plane, 
>> &mgag200_g200eh5_primary_plane_helper_funcs);
>> +    drm_plane_enable_fb_damage_clips(primary_plane);
>> +
>> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
>> +                    &mgag200_g200eh5_crtc_funcs, NULL);
>> +    if (ret) {
>> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
>> +
>> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
>> without */
>> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>> +    ret = mgag200_vga_bmc_output_init(mdev);
>> +
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * DRM device
>> + */
>> +
>> +static const struct mgag200_device_info mgag200_g200eh5_device_info =
>> +    MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
>> +
>> +static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs 
>> = {
>> +    .pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
>> +    .pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // 
>> same as G200EH
>> +};
>> +
>> +struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
>> +                         const struct drm_driver *drv)
>> +{
>> +    struct mga_device *mdev;
>> +    struct drm_device *dev;
>> +    resource_size_t vram_available;
>> +    int ret;
>> +
>> +    mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
>> +
>> +    if (IS_ERR(mdev))
>> +        return mdev;
>> +    dev = &mdev->base;
>> +
>> +    pci_set_drvdata(pdev, dev);
>> +
>> +    ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    ret = mgag200_device_preinit(mdev);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
>> +                  &mgag200_g200eh5_device_funcs);
>> +
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    mgag200_g200eh_init_registers(mdev); // same as G200EH
>> +    vram_available = mgag200_device_probe_vram(mdev);
>> +
>> +    ret = mgag200_mode_config_init(mdev, vram_available);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    ret = mgag200_g200eh5_pipeline_init(mdev);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>> +    drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>> +
>> +    return mdev;
>> +}
> 

