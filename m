Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDFD6DB70E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 01:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E8810E7C4;
	Fri,  7 Apr 2023 23:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8310E842
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 23:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680909319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ISymq/GgmsRPf4qsquUvqkqq/xnOiiDysSrttQOxIQ=;
 b=jIFa9QrNWMOny2FWTp1rre4rIF6U7X4wyPyDwsTiAORNJA147lIAURHbBD4+5V+BWnJ8c8
 6inZTi9WBYR44PdXW4/XYTmxFihMOBvJZ7Kpk51svPACu02Ud7lent2HlQfmP40cYnl9hj
 nbAz4OYlwR+UkwAKxZcZRHmLviBoZ/U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-9CikYt8NNkaZqLSlyqYxtQ-1; Fri, 07 Apr 2023 19:15:18 -0400
X-MC-Unique: 9CikYt8NNkaZqLSlyqYxtQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 s14-20020a05621412ce00b005e839e5891bso1294153qvv.17
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 16:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680909318; x=1683501318;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gDqv07q4EW3FaIE3tiwTcIZKESozldm9Lvt1N22Zwwk=;
 b=tFhE8JKjzvSGY8UzpdsNHEiFp3AQ9z7AkRApyzEX9w/Y7qlhVmD8ltYyOt4GX0N24a
 ofYRFsrEC968/zXPdRgRm3Z9+c3YX/6HVCmyz6tK5UaNUW73fV6xLnrFjxurplGvb07w
 /rAOa1QDIWp1WLRaT1YrJ0PwDI3LXRQJn/MJ3nEZKxPwupGO/1IhIrIF+V83wkQLZbWW
 TDt1+0qaaO6QnT59ghSLiGh/vsIHjcMKWnW43X4mKsEFOGvS8qTyH9FSGwlDS4artUJd
 anJULxKQB7bkWne1frC5BoN3/96578h6MDX6YJHTkQrcllFBCj4J8/xnQ61SC6pHbaGi
 1dBA==
X-Gm-Message-State: AAQBX9eBzkvFpBb3FCFjuRIzPSp/BJmu1RdQTgQ/niINWFwTnaoyANlV
 D0s4Eyh5hcX8Bp8OH3PrcpDtEqrLEQx1Tidmk35hiy/G3pPus9PCVDqifkU6c1b/ADOOerS1gf7
 YojO1rIRvloYyZuBtoQaZmpifsH60
X-Received: by 2002:a05:622a:1818:b0:3db:fba6:53f8 with SMTP id
 t24-20020a05622a181800b003dbfba653f8mr6591181qtc.25.1680909318261; 
 Fri, 07 Apr 2023 16:15:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdgxF2YkJyao35TIkGn0N7Mvwz1VbA4EtERvx/JG60e/RP0fMnaunGlYblEzKjanOkDS6r8Q==
X-Received: by 2002:a05:622a:1818:b0:3db:fba6:53f8 with SMTP id
 t24-20020a05622a181800b003dbfba653f8mr6591161qtc.25.1680909318047; 
 Fri, 07 Apr 2023 16:15:18 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 x78-20020a376351000000b007466432a559sm1632908qkb.86.2023.04.07.16.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 16:15:17 -0700 (PDT)
Message-ID: <bcf9a62b87e4d46cabfe7d751882527b10b6b401.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fb: add missing sysmen flush
 callbacks
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Fri, 07 Apr 2023 19:15:15 -0400
In-Reply-To: <20230405110455.1368428-1-kherbst@redhat.com>
References: <20230405110455.1368428-1-kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2023-04-05 at 13:04 +0200, Karol Herbst wrote:
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/203
> Fixes: 5728d064190e1 ("drm/nouveau/fb: handle sysmem flush page from comm=
on code")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c | 1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c | 1 +
>  4 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gf108.c
> index 76678dd60f93f..c4c6f67af7ccc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
> @@ -31,6 +31,7 @@ gf108_fb =3D {
>  =09.init =3D gf100_fb_init,
>  =09.init_page =3D gf100_fb_init_page,
>  =09.intr =3D gf100_fb_intr,
> +=09.sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
>  =09.ram_new =3D gf108_ram_new,
>  =09.default_bigpage =3D 17,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gk104.c
> index f73442ccb424b..433fa966ba231 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
> @@ -77,6 +77,7 @@ gk104_fb =3D {
>  =09.init =3D gf100_fb_init,
>  =09.init_page =3D gf100_fb_init_page,
>  =09.intr =3D gf100_fb_intr,
> +=09.sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
>  =09.ram_new =3D gk104_ram_new,
>  =09.default_bigpage =3D 17,
>  =09.clkgate_pack =3D gk104_fb_clkgate_pack,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gk110.c
> index 45d6cdffafeed..4dc283dedf8b5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
> @@ -59,6 +59,7 @@ gk110_fb =3D {
>  =09.init =3D gf100_fb_init,
>  =09.init_page =3D gf100_fb_init_page,
>  =09.intr =3D gf100_fb_intr,
> +=09.sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
>  =09.ram_new =3D gk104_ram_new,
>  =09.default_bigpage =3D 17,
>  =09.clkgate_pack =3D gk110_fb_clkgate_pack,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/fb/gm107.c
> index de52462a92bf0..90bfff616d35b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
> @@ -31,6 +31,7 @@ gm107_fb =3D {
>  =09.init =3D gf100_fb_init,
>  =09.init_page =3D gf100_fb_init_page,
>  =09.intr =3D gf100_fb_intr,
> +=09.sysmem.flush_page_init =3D gf100_fb_sysmem_flush_page_init,
>  =09.ram_new =3D gm107_ram_new,
>  =09.default_bigpage =3D 17,
>  };

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

