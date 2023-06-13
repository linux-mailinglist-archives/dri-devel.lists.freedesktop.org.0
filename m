Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB772ED34
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 22:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395610E013;
	Tue, 13 Jun 2023 20:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194F910E013
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686688821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5F0M7/J2pBqIlbj07I33+sdD0PR1/h1TZjZ1JXWtMIM=;
 b=JbRj5ZQOofzG0JDYhsZfUuiT0aMKjlYwQFFzTDyL/DtepH2y49uCympNP0WC4yUJ7yu3A8
 IBQm1M7MP5w8LrXWSB/RVs+40ka7bZTq0BGuBN+n7Wb2OlABcRtxDwS5+0SkUNJOjueAIS
 9Xhn+N0nBtAAroLo4a773H/KmIekyi8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-1fLyX7ScPvW91RD3rzJPFA-1; Tue, 13 Jun 2023 16:40:20 -0400
X-MC-Unique: 1fLyX7ScPvW91RD3rzJPFA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76072bd9339so173053285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688819; x=1689280819;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/KEV8rgNWQcziNkOQw3aa12KM/0QxpSM9LvG+rNFReA=;
 b=XEpbk1ypfxARip5JcwWZ1WVRh8P4MY28WqLrsykQ0C81r87as/YZUWlznQKM0gX850
 lAobGiWa0WD7PkOrVihYxIaWJ9wmIgYPklG/gULaMMvhbuytaR4XJZ+nE1lmFpt5T7Jt
 9AmUZ0A5VcO8GMc8APLV3hQHVVMNcwdpXvI3vRrh3M6tIq6V96ugw5tyg7zJ6IkueWJ1
 FdXGnI7NoSy2tEyJOgTSJ1xYLkc93NHFQTY3hYQFP4lYZSt2AK2N1wz+O2J3Pb3/ZM9H
 knCRIrwaBPUcThKItGhmJumFHZmmGWHqrCrso/6JXtnH3IpovrQYz/tZaqMdVkIZDZ6t
 xqBg==
X-Gm-Message-State: AC+VfDyYFQUVCoo/Xae4H4a06EDlvwJX8MUbJXeqK2s7kmn+yJ5aYOm1
 TyqZ5PzlJVFTR5glMt/ZzCZzQBRRvxzG3ayB+2HSvMyxYWMSx4zm3LuWmb9bNvi+qkqX5nIHgxM
 EKzs72LezsVpUabaCATLQ6b04OHfr
X-Received: by 2002:a05:620a:8e13:b0:75b:23a1:8e67 with SMTP id
 re19-20020a05620a8e1300b0075b23a18e67mr10918321qkn.56.1686688819334; 
 Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ531Nu7ofpSl0Xf9KKfuKJTyiRduM7Azc8WhTHGMU/grfOlSdbBgp+kcjzgvYLlWsWJIlQgoQ==
X-Received: by 2002:a05:620a:8e13:b0:75b:23a1:8e67 with SMTP id
 re19-20020a05620a8e1300b0075b23a18e67mr10918309qkn.56.1686688819045; 
 Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 g17-20020ae9e111000000b0075d49ce31c3sm3823609qkm.91.2023.06.13.13.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:40:18 -0700 (PDT)
Message-ID: <c2bf9c25b5ba7d00cc476ed1389ad5e2dd9b2491.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/dp: check for NULL nv_connector->native_mode
From: Lyude Paul <lyude@redhat.com>
To: Natalia Petrova <n.petrova@fintech.ru>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 13 Jun 2023 16:40:17 -0400
In-Reply-To: <20230512111526.82408-1-n.petrova@fintech.ru>
References: <20230512111526.82408-1-n.petrova@fintech.ru>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
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
Cc: lvc-project@linuxtesting.org, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a bit

On Fri, 2023-05-12 at 14:15 +0300, Natalia Petrova wrote:
> Add checking for NULL before calling nouveau_connector_detect_depth() in
> nouveau_connector_get_modes() function because nv_connector->native_mode
> could be dereferenced there since connector pointer passed to
> nouveau_connector_detect_depth() and the same value of
> nv_connector->native_mode is used there.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: d4c2c99bdc83 ("drm/nouveau/dp: remove broken display depth functio=
n, use the improved one")
>=20
> Signed-off-by: Natalia Petrova <n.petrova@fintech.ru>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 086b66b60d91..5dbf025e6873 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -966,7 +966,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09/* Determine display colour depth for everything except LVDS now,
>  =09 * DP requires this before mode_valid() is called.
>  =09 */
> -=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS)
> +=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS && nv_conn=
ector->native_mode)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09/* Find the native mode if this is a digital panel, if we didn't
> @@ -987,7 +987,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09 * "native" mode as some VBIOS tables require us to use the
>  =09 * pixel clock as part of the lookup...
>  =09 */
> -=09if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS)
> +=09if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS && nv_co=
nnector->native_mode)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_TV)

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

