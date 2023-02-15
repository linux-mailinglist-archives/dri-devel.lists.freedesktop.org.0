Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237DF698874
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 00:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C77B10E2CA;
	Wed, 15 Feb 2023 23:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9810E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676502094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqVitRGjYBX8GSzEkilO7B7lFiZnfb8r4eRKt2Vhqk0=;
 b=fYfqtpMxJevMU/cbTTwbOxM96QwVsbF994+WpSqzHc8m0nRl73cBaCRDMNmzH+7OAefdgk
 AT/cEgUxNm9nsEH5XVf5nQDz7MLYIPhnsVUhnMdmzCit2f/jZnqjrU6YCUUvr0nEDv6sOZ
 0FlDB/jLmXXrK2sz7m0lwEJXzKF8aUo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-D1mIKGieMXKb7tQw_29cIw-1; Wed, 15 Feb 2023 18:01:33 -0500
X-MC-Unique: D1mIKGieMXKb7tQw_29cIw-1
Received: by mail-qk1-f198.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso97825qki.14
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 15:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsYrZzYMtnpPy1dLr5xbLMKSM/UlrfB6vQQZ4rqlNLU=;
 b=14An1Tmnk+uBCgpNh4xMk4dH+7wq7zZflug4KhwPvWsd2R/nuzXO87FV84w6xpa1nI
 O1sXRTuk8r7IyNjtzFdpdzhaiblJz6rMVV0fKRHMTu6lZkrjZwpWcDh1tmTvdY42jjtB
 Ox8I+AkGfLMyzuE7EiuzDkd7OapYjfvk4dalfU2VWojhtboMU49L84Frw+K1SPnojGbm
 6V5nNwYSripJJVMQ346+SVUvMFpkn2GqBukgJYAAtsYgZETZgbZ/DnkL7xM8sNR4xyzF
 N5L8UqvRbOdsIqAljBj1iFSqoUeiO1d2OpTRv9FStlIMsHwv074Fi3P8vmWFIoioVCeD
 U/MQ==
X-Gm-Message-State: AO0yUKXVIBanHmJpU21fGE29lAbvCHdCi2mJFmDl7txZ1ObBvvzPoJht
 XO4bFRnLMXXQ1ZLQZPXfds4nTu61pOSH2/dXWMkjTc7W873e29VT6IuMPJ3FcFetzDCP1T2aTkm
 GvMdKrktTmb4EG+CZcKexn6cLzDUhkcFxzQ==
X-Received: by 2002:ac8:7f16:0:b0:3b9:b422:4d5b with SMTP id
 f22-20020ac87f16000000b003b9b4224d5bmr6282649qtk.26.1676502092427; 
 Wed, 15 Feb 2023 15:01:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+qnHViHFdBUIjxUI6M3KrFKZ6NirVS+Cp47Y7N9ahccvHsZrp34JkpSRGEGSaqRlksgX+0TA==
X-Received: by 2002:ac8:7f16:0:b0:3b9:b422:4d5b with SMTP id
 f22-20020ac87f16000000b003b9b4224d5bmr6282620qtk.26.1676502092198; 
 Wed, 15 Feb 2023 15:01:32 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 o190-20020a375ac7000000b0073b45004754sm6662405qkb.34.2023.02.15.15.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 15:01:31 -0800 (PST)
Message-ID: <d676862c180af8c5325fb00f0e2e469e6f600835.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/led: explicitly include linux/leds.h
From: Lyude Paul <lyude@redhat.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Feb 2023 18:01:30 -0500
In-Reply-To: <20230215-power_supply-leds-nouveau-v1-1-ea93bfa0ba7e@weissschuh.net>
References: <20230215-power_supply-leds-nouveau-v1-1-ea93bfa0ba7e@weissschuh.net>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Wed, 2023-02-15 at 01:04 +0000, Thomas Wei=C3=9Fschuh wrote:
> Instead of relying on an accidental, transitive inclusion of linux/leds.h
> use it directly.
>=20
> Also drop the forware definition of struct led_classdev that is now
> provided by linux/leds.h.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/nouveau/nouveau_led.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_led.h b/drivers/gpu/drm/nouv=
eau/nouveau_led.h
> index 21a5775028cc..bc9bc7208da3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_led.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_led.h
> @@ -27,7 +27,7 @@
> =20
>  #include "nouveau_drv.h"
> =20
> -struct led_classdev;
> +#include <linux/leds.h>
> =20
>  struct nouveau_led {
>  =09struct drm_device *dev;
>=20
> ---
> base-commit: e1c04510f521e853019afeca2a5991a5ef8d6a5b
> change-id: 20230215-power_supply-leds-nouveau-ff4995ba0794
>=20
> Best regards,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

