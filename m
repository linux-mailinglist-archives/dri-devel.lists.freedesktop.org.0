Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBDD6CCD28
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AE910E4C7;
	Tue, 28 Mar 2023 22:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1059810E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680042207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZOEXo//NG6ZuxMwWYZ3Q5XdOI468xHeInsZ4IotWAU=;
 b=VpKnSvVy3Iu44o5B3NHoKWGXcHo/AZL8OCdote6puVY5Lj9BVdVKaZXPEsVBcvLNxojF91
 OghwW83iQNCEulM6uALEYxKJZpoKSPnEN90mMRtGmT/DPKj4DKI2N8sT2S4IsqA7PbEOyV
 39r4aDBQGGawVXhytLCP1275UvklYCI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-VgjtJOjtNwGOpo5NVU15Ew-1; Tue, 28 Mar 2023 18:23:26 -0400
X-MC-Unique: VgjtJOjtNwGOpo5NVU15Ew-1
Received: by mail-qk1-f200.google.com with SMTP id
 b34-20020a05620a272200b007460c05a463so6414825qkp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680042205;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/880kkvDFtCR5sIo7DiowXLZImkJfXYxCTOdE4arHY=;
 b=4GGdXPnZWcAyOV8vam09E5AMM2IuWQ9aOPtVzkSyy46G7tL13gtLLFQ/5h/pd55oL2
 aElNP/2E86zFfrmG/RJLRDcY/tUTlTLh4Ngknzp1x3ViH4NjxISJTwiaDMjxo0anLPpI
 DKwQqrZqJbzqpVuisIti66W9W4fsDMaj6WNmJ6RVgjyO/yzy0bSa0Wqx3ofOvtbfqlcN
 Wm2osNZkNZ4eZr6qDeTeNmW8Fg6vqUpk4rFgHVbdSVdggCo+Hs6nPN4UisAuvk4GEC2q
 H8YVa78pP79GbRyAODtRo3aI1FAafbMLe8MwgA6rLQ1VsmV67afvm9e/dm0xqwUuOMxJ
 fHzQ==
X-Gm-Message-State: AAQBX9c6OTbbEn60Dm/37A9FLDH51CXHepUwmKNRa4da3Ux53V8ofsTJ
 NrHJtQynFe9aoNsCnvhzE5A/E2QS3/EEQAbt3laZEj1BU8GgyDx3y4DrBWBzMDMFkv/jd4bc9aW
 3TiDhIkqwxamPUeUvBWC1G/2f3+RX
X-Received: by 2002:a05:6214:20e8:b0:571:13c:6806 with SMTP id
 8-20020a05621420e800b00571013c6806mr27337647qvk.33.1680042205716; 
 Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHs3HSZwuEOKXFrGu7Y8M8LAvPxj+euHxcA9SzX+HVHy5mGA1OUIs92Bd1flUbQgB9m2rGUg==
X-Received: by 2002:a05:6214:20e8:b0:571:13c:6806 with SMTP id
 8-20020a05621420e800b00571013c6806mr27337629qvk.33.1680042205469; 
 Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
 by smtp.gmail.com with ESMTPSA id
 ec13-20020ad44e6d000000b005dd8b9345ddsm4123898qvb.117.2023.03.28.15.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
Message-ID: <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
Subject: Re: [PATCH 6.2 regression fix] drm/nouveau/kms: Fix backlight
 registration
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Mar 2023 18:23:24 -0400
In-Reply-To: <20230326205433.36485-1-hdegoede@redhat.com>
References: <20230326205433.36485-1-hdegoede@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Mark Pearson <mpearson@lenovo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

(Also note to Mark: this is my way of letting you know someone fixed the
regression with backlight controls upstream, looking into the weird bright
screen after resume issue)

On Sun, 2023-03-26 at 22:54 +0200, Hans de Goede wrote:
> The nouveau code used to call drm_fb_helper_initial_config() from
> nouveau_fbcon_init() before calling drm_dev_register(). This would
> probe all connectors so that drm_connector->status could be used during
> backlight registration which runs from nouveau_connector_late_register().
>=20
> After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers"=
)
> the fbdev emulation code, which now is a drm-client, can only run after
> drm_dev_register(). So during backlight registration the connectors are
> not probed yet and the drm_connector->status =3D=3D connected check in
> nv50_backlight_init() would now always fail.
>=20
> Replace the drm_connector->status =3D=3D connected check with
> a drm_helper_probe_detect() =3D=3D connected check to fix nv_backlight
> no longer getting registered because of this.
>=20
> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 40409a29f5b6..91b5ecc57538 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -33,6 +33,7 @@
>  #include <linux/apple-gmux.h>
>  #include <linux/backlight.h>
>  #include <linux/idr.h>
> +#include <drm/drm_probe_helper.h>
> =20
>  #include "nouveau_drv.h"
>  #include "nouveau_reg.h"
> @@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  =09struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  =09struct nvif_object *device =3D &drm->client.device.object;
> =20
> +=09/*
> +=09 * Note when this runs the connectors have not been probed yet,
> +=09 * so nv_conn->base.status is not set yet.
> +=09 */
>  =09if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or=
) - 1)) ||
> -=09    nv_conn->base.status !=3D connector_status_connected)
> +=09    drm_helper_probe_detect(&nv_conn->base, NULL, false) !=3D connect=
or_status_connected)
>  =09=09return -ENODEV;
> =20
>  =09if (nv_conn->type =3D=3D DCB_CONNECTOR_eDP) {

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

