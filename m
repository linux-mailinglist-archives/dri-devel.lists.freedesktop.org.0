Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3D7BED86
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD3410E133;
	Mon,  9 Oct 2023 21:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8110E133
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696887962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftt1UgT+rwdd9h1usoyRQh/PygW+aKPnhFyWsTDWReY=;
 b=dLcPQX4oqbk5jJfl5FaaOz7F/yXgdbwxMySCAFZnEDQ0OQ5dSASoEMpu1h7DoeaRR+LC+T
 65sG0jqQ0WDAqAyjvJY3PieiihhyTaYrcxL1NTowAJeuy206U3az69fdNHRtso3WEYtCKa
 BPIHh9CWIO0DpuE/GA2po9C7B/Ll8GI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-zgp97r2LObimrv_TAwDHNw-1; Mon, 09 Oct 2023 17:45:51 -0400
X-MC-Unique: zgp97r2LObimrv_TAwDHNw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1dd691b1037so8061665fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 14:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696887950; x=1697492750;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kc+EooNjRuIGaZlba0n715rKNgOK/kSBjOsmerqWaRg=;
 b=mkwV1Kn7bVVyfG44TkbkSboh4fKA4/D7RS19BWIGqaHcwUe9BmerT1L1OkstB+o40y
 tcAPAHrVLcQRktKAxKUoxrTWtcNM5D91lXKLTO4lUra9DWoFDL0iYHmRma/zaC+JdK5c
 jzyEjWkqcWDLELu2xcswU3KVbtWMEgPuIAOYJgTa5B2Y8kMW3F6EooPepI3VjzU2MyHZ
 OPHqrPmcR/FwIJeFg7oFu8xxs21UA9PrA/GzmuuRm1Abq3bWs8XXFXz5jOjz1okmHCCC
 a7jhTslmTnnvGsdklCOA3mLw/gXMHcH8p5c8ApeaQRCBNqxQXiSBuq7+Q5YP8oiRv4Zb
 1hGg==
X-Gm-Message-State: AOJu0Ywnqofck9A+WEGC/GTQaS9wBCG4rrmliKMgXv/M4T+ziEVHPCoA
 7qQ+hWRdc7PmTudXM5TiPCV1N4S9C5u998kTYPHc96jG7HCvWf+VCgG+2GR7FTWbH2aeRGUF/vc
 B3h6ZLq1xr1pXTorgDhOg70sR6ycAD6tjeOfF
X-Received: by 2002:a05:6870:f599:b0:1b0:2f63:4ff6 with SMTP id
 eh25-20020a056870f59900b001b02f634ff6mr18738565oab.1.1696887950710; 
 Mon, 09 Oct 2023 14:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA4GSK6GSMuEXs3YrDvKAZYcLFQXhm0ZOhmAvnxNzzFaJM60xpMGR10412D3pre/KXhgfm7Q==
X-Received: by 2002:a05:6870:f599:b0:1b0:2f63:4ff6 with SMTP id
 eh25-20020a056870f59900b001b02f634ff6mr18738558oab.1.1696887950418; 
 Mon, 09 Oct 2023 14:45:50 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a0c8d06000000b0065655bb349csm4188877qvb.141.2023.10.09.14.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 14:45:49 -0700 (PDT)
Message-ID: <2346aa93e2479f2ebd8849c5b2ead36a50ce43a0.camel@redhat.com>
Subject: Re: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
From: Lyude Paul <lyude@redhat.com>
To: Ma Ke <make_ruc2021@163.com>, airlied@gmail.com, daniel@ffwll.ch, 
 javierm@redhat.com, mripard@kernel.org, u.kleine-koenig@pengutronix.de, 
 noralf@tronnes.org, tzimmermann@suse.de
Date: Mon, 09 Oct 2023 17:45:48 -0400
In-Reply-To: <20231007031712.3997144-1-make_ruc2021@163.com>
References: <20231007031712.3997144-1-make_ruc2021@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2023-10-07 at 11:17 +0800, Ma Ke wrote:
> In ch7006_encoder_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
>=20
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/gpu/drm/i2c/ch7006_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch700=
6_drv.c
> index 131512a5f3bd..27c2f02f5b43 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -236,8 +236,10 @@ static int ch7006_encoder_get_modes(struct drm_encod=
er *encoder,
>  =09=09    ~mode->valid_norms & 1<<priv->norm)
>  =09=09=09continue;
> =20
> -=09=09drm_mode_probed_add(connector,
> -=09=09=09=09drm_mode_duplicate(encoder->dev, &mode->mode));
> +=09=09struct drm_display_mode *encoder_mode;
> +=09=09encoder_mode =3D drm_mode_duplicate(encoder->dev, &mode->mode);

I think the kernel prefers to have variable declaration at the top of the
scope, and as well: this breaks things because you don't add back the
drm_mode_probed_add() call.

> +=09=09if (!mode)
> +=09=09=09continue;
> =20
>  =09=09n++;
>  =09}

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

