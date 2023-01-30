Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760DB681F7F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 00:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58810E13D;
	Mon, 30 Jan 2023 23:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ACA10E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 23:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675120771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YYZbm1NG6N/PIBWtUfFisf+kascGS94J1cLzdIpfo0=;
 b=X2i4rbuyGZb3BOsq7vIMwZ+EFDAfOsPR/8ndQma+3Xt+Aa4pb2EGUDfkr8/sJGtDKJja8m
 wbi7brVY4qZtiq7TvBGFGYEZhyztATjnYoujRMviwDiMfh6yQy8lRzRrwzV1yy6hb61GrD
 /UqlrpFiDzv93+6oxxMDrShKEKZO9zA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-IUC-bqgMMYm3UzL1ZBqHNQ-1; Mon, 30 Jan 2023 18:19:29 -0500
X-MC-Unique: IUC-bqgMMYm3UzL1ZBqHNQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so7931698qkl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 15:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MdBN2G9s2H/cLKZlLD94GwiOC2SlLxVwCwwyt87y3Zg=;
 b=uswaO6PPC+4BVyt7Dk0wA9Z7WpRhyR+9J9RaK65ZgWlmV+buP4oDGcNSf8Ojcfhn9P
 vAjW/GiBobuULkMP2H1KsTBHhhK2mWEW8/ZtvDFPRGlHDHTzsLfDZUX0KmDkelEAcjDn
 9+RDBwEXNgXyBfSSffEtAB1FrtFR1yBYEB3vrzpTy7A5+D0r4i1U+VvHXgq6O9rmjYuG
 VFPQQOBk9rOQDNUQYXCFbUEYUszsO9rXM+54OdYxgJ7hE2snSk6MfHlAcz2/LnP1FnOV
 6avurr7EtTBCYy/0P0SmfYIfyqS+Sod0HVcTJ9x+XIBlj5VdyshhhjM8HWpxQX9cgUTP
 TfXQ==
X-Gm-Message-State: AO0yUKU91XWEjmmrwAp+P6npUmGZi5hgQeomNCq7HleIC9iWDVzqDVOr
 qfRr4pBzOhtun8mFkEErYNH/dPdA2eRXpGOhQawpWTHndXFswU0Rx4rg4IIRLX6V7zZUlrPurC+
 2ZjF8BxOxUNz9FCV3V/NfVkegIXJY
X-Received: by 2002:a05:6214:1c49:b0:53a:ee35:a4bd with SMTP id
 if9-20020a0562141c4900b0053aee35a4bdmr16013562qvb.18.1675120769165; 
 Mon, 30 Jan 2023 15:19:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+HLt2DVY6XtkZAz5EMEhz8AevZQYPYGG/AzUvHaJYaLFBkZhOOoRXIbEk8yziqgHcAmrSTQQ==
X-Received: by 2002:a05:6214:1c49:b0:53a:ee35:a4bd with SMTP id
 if9-20020a0562141c4900b0053aee35a4bdmr16013531qvb.18.1675120768915; 
 Mon, 30 Jan 2023 15:19:28 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 ea17-20020a05620a489100b007204305dee4sm2302390qkb.19.2023.01.30.15.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 15:19:28 -0800 (PST)
Message-ID: <2641c2cd5b1cabd09af96b36899d72abab244cec.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/nouveau/devinit/tu102-: wait for
 GFW_BOOT_PROGRESS == COMPLETED
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Date: Mon, 30 Jan 2023 18:19:27 -0500
In-Reply-To: <20230130223715.1831509-1-bskeggs@redhat.com>
References: <20230130223715.1831509-1-bskeggs@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment

On Tue, 2023-01-31 at 08:37 +1000, Ben Skeggs wrote:
> Starting from Turing, the driver is no longer responsible for initiating
> DEVINIT when required as the GPU started loading a FW image from ROM and
> executing DEVINIT itself after power-on.
>=20
> However - we apparently still need to wait for it to complete.
>=20
> This should correct some issues with runpm on some systems, where we get
> control of the HW before it's been fully reinitialised after resume from
> suspend.
>=20
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../drm/nouveau/nvkm/subdev/devinit/tu102.c   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> index 634f64f88fc8..81a1ad2c88a7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> @@ -65,10 +65,33 @@ tu102_devinit_pll_set(struct nvkm_devinit *init, u32 =
type, u32 freq)
>  =09return ret;
>  }
> =20
> +static int
> +tu102_devinit_wait(struct nvkm_device *device)
> +{
> +=09unsigned timeout =3D 50 + 2000;
> +
> +=09do {
> +=09=09if (nvkm_rd32(device, 0x118128) & 0x00000001) {
> +=09=09=09if ((nvkm_rd32(device, 0x118234) & 0x000000ff) =3D=3D 0xff)
> +=09=09=09=09return 0;
> +=09=09}
> +
> +=09=09usleep_range(1000, 2000);
> +=09} while (timeout--);
> +
> +=09return -ETIMEDOUT;
> +}
> +
>  int
>  tu102_devinit_post(struct nvkm_devinit *base, bool post)
>  {
>  =09struct nv50_devinit *init =3D nv50_devinit(base);
> +=09int ret;
> +
> +=09ret =3D tu102_devinit_wait(init->base.subdev.device);
> +=09if (ret)
> +=09=09return ret;
> +
>  =09gm200_devinit_preos(init, post);
>  =09return 0;
>  }

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

