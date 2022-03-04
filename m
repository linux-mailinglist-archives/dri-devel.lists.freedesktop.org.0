Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C423E4CDDD0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFDF113757;
	Fri,  4 Mar 2022 20:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5914113756
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646425481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQnecUCi6JtX5H2+Imm8lSOq7dsr4zLE9x/tjqn4RLU=;
 b=O38MfvyxBDsUXq1TBlYVClS8SYW3ktH0MgSpbRLGRWidWv4YD5S7CfTFhy/rlGu+fJWiWA
 7t27UfJsiIxRTUAsrgAeBLgruQwLLMvlqoVAAcYonsO7RQDJUdrRfGS3BKAmU5x0ghgUDD
 OopYnJYAW/g7bxt7fhx+FFgnY6KQBJQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460--xUuiGQePxaOsJfoHJF_bw-1; Fri, 04 Mar 2022 15:24:39 -0500
X-MC-Unique: -xUuiGQePxaOsJfoHJF_bw-1
Received: by mail-qv1-f71.google.com with SMTP id
 n8-20020a0ce488000000b0043519e2750cso7810179qvl.4
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 12:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=qQnecUCi6JtX5H2+Imm8lSOq7dsr4zLE9x/tjqn4RLU=;
 b=epWMVqO0PmPdEKVUAtxY3r5A7bVGnbxaoLOkLX3SdhMRwxJkbmDTl/12ARTldimzjp
 cSopKfIHvGAiw0+hzM9JWqJqv+yRM1BSfF6FkPOiaLrFtKfBzAEjAmBNpnXdLyLJCVqK
 x+dSQenE2tm6B4o6ebHrp0OtqargOYTHS4dukEQ6C7AJjC/C9Uphca6dNdva/VG499Fh
 kkWHVXmewxlRIYE0f/zHA/dLm7M4U0FIaLuoecEv60dkfNJirkuX0gbqmHY3qfQEiA1/
 pB4EP/GIr5DAcCu7shpS5ay8xcU1dfK5L0HJiBXfQYgofc2M1bWeDA0/h96cRXMlsOcR
 5QbQ==
X-Gm-Message-State: AOAM532hX0aanwM2SqkbyyiFtzSsNS6+THA1ThcrFmHdSJOKAFNduB/p
 l2oi13ivk+TKxBiF2c6zVDydumGAIrj4NZhNZo80EoWmKH6hT36WiubqqrOsjNub7hdaN9qsyO4
 yTaSw+TLxJXf0BUZyTnzsNsS+jn7z
X-Received: by 2002:a37:492:0:b0:47d:e1d1:baca with SMTP id
 140-20020a370492000000b0047de1d1bacamr248069qke.247.1646425479100; 
 Fri, 04 Mar 2022 12:24:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgLMhureMazbApcHxoId0ovHTPxZ6IY2TMXkHtaF62KtRhKSEPCfFTIpWUImpKhXu+6GtUPg==
X-Received: by 2002:a37:492:0:b0:47d:e1d1:baca with SMTP id
 140-20020a370492000000b0047de1d1bacamr248054qke.247.1646425478849; 
 Fri, 04 Mar 2022 12:24:38 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 y16-20020a37e310000000b00648c706dda1sm2874739qki.6.2022.03.04.12.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:24:38 -0800 (PST)
Message-ID: <47e09d6010852db928c0de29b89450ea7eee74d8.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios: Rename prom_init() and friends functions
From: Lyude Paul <lyude@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 04 Mar 2022 15:24:37 -0500
In-Reply-To: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
References: <2d97ae92b9c06214be0e088a72cf303eb591bf01.1646414295.git.christophe.leroy@csgroup.eu>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This mostly looks good to me. Just one question (and one comment down below
that needs addressing). Is this with ppc32? (I ask because ppc64le doesn't
seem to hit this compilation error).

On Fri, 2022-03-04 at 18:20 +0100, Christophe Leroy wrote:
> While working on powerpc headers, I ended up with the following error.
> 
>         drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c:48:1: error:
> conflicting types for 'prom_init'; have 'void *(struct nvkm_bios *, const
> char *)'
>         make[5]: *** [scripts/Makefile.build:288:
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.o] Error 1
> 
> powerpc and a few other architectures have a prom_init() global function.
> One day or another it will conflict with the one in shadowrom.c
> 
> Those being static, they can easily be renamed. Do it.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> index ffa4b395220a..9c951e90e622 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowrom.c
> @@ -25,7 +25,7 @@
>  #include <subdev/pci.h>
>  
>  static u32
> -prom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
> +nvbios_rom_read(void *data, u32 offset, u32 length, struct nvkm_bios *bios)
>  {
>         struct nvkm_device *device = data;
>         u32 i;
> @@ -38,14 +38,14 @@ prom_read(void *data, u32 offset, u32 length, struct
> nvkm_bios *bios)
>  }
>  
>  static void
> -prom_fini(void *data)
> +nvbios_rom_fini(void *data)
>  {
>         struct nvkm_device *device = data;
>         nvkm_pci_rom_shadow(device->pci, true);
>  }
>  
>  static void *
> -prom_init(struct nvkm_bios *bios, const char *name)
> +nvbios_rom_init(struct nvkm_bios *bios, const char *name)
>  {
>         struct nvkm_device *device = bios->subdev.device;
>         if (device->card_type == NV_40 && device->chipset >= 0x4c)
> @@ -57,8 +57,8 @@ prom_init(struct nvkm_bios *bios, const char *name)
>  const struct nvbios_source
>  nvbios_rom = {
>         .name = "PROM",
> -       .init = prom_init,
> -       .fini = prom_fini,
> -       .read = prom_read,
> +       .init = nvbios_rom_init,
> +       .fini = nvbios_rom_fini,
> +       .read = nvbios_rom_read,

Seeing as the source name is prom, I think using the naming convention
nvbios_prom_* would be better then nvbios_rom_*.

>         .rw = false,
>  };

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

