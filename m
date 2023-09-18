Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0A7A55BA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02989F4F;
	Mon, 18 Sep 2023 22:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54C89F4F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695075902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPyNutSLkkHTZxI3B0PY2u8QnFtvmNqTwCfplTU4uRc=;
 b=YWLZCSz3yQ21rpNbGRiAEqNtK6xC6Q4nI1QECh4IYKV75CfDn5W2RgtYGafPpQbQWtb8Pf
 vLopl0Tg6+8Ted8HqqaKEr5EAfGQ1gDJGfTMTjlPj92o/tUDZSY1drTKLnhigcRa49fh/n
 eu6qfOkwfJaYiWnIqp6IF7PNd7fuya4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-cGnFcDk4ObS4DPg9bi1QSQ-1; Mon, 18 Sep 2023 18:24:58 -0400
X-MC-Unique: cGnFcDk4ObS4DPg9bi1QSQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-655d89a574eso59501406d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695075898; x=1695680698;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WG8Pu+Mw6aXgo3oVLCA7cZJ3LSi2mKUayS+JlD6Q7jo=;
 b=rJba4AbI96bW0+CNr7mTBbhouQH8KZ0ECTpaSCbSZJOXnLbaK5IsLU45o6mgjJ9Owr
 79KttL+LepgEuUY7LvTQtn8YjowskDrCfnHwX59bRSjqptJPNqmPmtrk7xfuTmmofikP
 EHdCMWUtMvp5IOe7hyPZU6J2xueqihHET5ap9ECEXr/2r+YzX/pOnqGlz1yUINi/sS5V
 zrSlzX6/N7BODfVlIjs8bayun8jlwF2/Wbt0qItF5XR6qZLgvaZ5cxPuBpJKW9uinF9u
 ohxn64Z3d+bKL8R2F9MD2BYoY3MUxpsHNZrW3b/8bV0LDJBC6bG7cqXgpnjDG3Wp1B0D
 L7fw==
X-Gm-Message-State: AOJu0YwUqWB3QV1Lo1j9ifG6uudliTnbEsWjIBK5fg7ljZGu7Ga40Jzi
 6DnZAYGeVgrjDb1UDlEHzdJXyf0bNgY60wJkh8EARvQndhDF/Bnve2Hw8GWe4Y755OaD7LmFhA9
 JqShErcs7aXF0gtCtwllluzSSn3Bm
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id
 a13-20020a0ccdcd000000b0065588e91b0cmr10311584qvn.38.1695075898341; 
 Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj7nahJ/IxATPNQUGSshqEPQ29nHykvjD/+zTI+gGvnxe5EWaVWGI/vQ9GRABMAcnfQ+LBUg==
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id
 a13-20020a0ccdcd000000b0065588e91b0cmr10311573qvn.38.1695075898129; 
 Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a0cf4ca000000b00656329bb3b1sm3217669qvm.10.2023.09.18.15.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:24:57 -0700 (PDT)
Message-ID: <10db3f25dc671ca0b8f50be548d409fcd3fc896c.camel@redhat.com>
Subject: Re: [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
From: Lyude Paul <lyude@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie <airlied@redhat.com>
Date: Mon, 18 Sep 2023 18:24:56 -0400
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you need me to push this to drm-misc?

On Fri, 2023-09-15 at 15:59 +0300, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
>=20
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned=
 int size)
>  =09size_t bytes;
> =20
>  =09if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -=09=09return NULL;
> +=09=09return ERR_PTR(-ENOMEM);
>  =09return vmemdup_user(userptr, bytes);
>  }
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

