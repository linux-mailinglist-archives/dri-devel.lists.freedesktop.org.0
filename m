Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8C819E9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3499C10E339;
	Wed, 20 Dec 2023 12:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C059110E332
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703073845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lka5tYrad/R/08SV2MTuchYw7orCVUyJFKIPJol5JAg=;
 b=QIVoNBPYYePg/27ouEu70z1OVDsbEN/xicHZM2VC7h0joY1iOzukBMJ+7V9HaPyb/TaMOn
 hIKERgNlTudP5OVeRdu3jzzYbs8wkIi/YFGuJXPjdSi9sRmegfexKt/XBsMtsu1pG9Mvkk
 kHCFKDXd2Rd3vRA2h8t0o6cnN9bO4/c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-MO-nmqRtO4y6aNjguaVgoA-1; Wed, 20 Dec 2023 07:04:04 -0500
X-MC-Unique: MO-nmqRtO4y6aNjguaVgoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3335231c733so324072f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 04:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703073843; x=1703678643;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOIBv5aCgCzFx82SAqfImjdfdj7hcvw8IGRj+pX8Llk=;
 b=QY12vyC/GMdBtJ/AvOr9+CDcCQwzxwLjE4uejgc0OFVRYKP+xiGATVHF4h/tqafsrg
 QBEkgIJTacxCew3kPwuChT8vCDFSkqnqBiCl4wohzsnbTaMGz4a2dIdEVub/mEcu/Qa4
 5/N3MXW870bj28Qtu3TLitHZJxZVNmhFVT7tHpSKUoEd3bUleCL1NHqhulORODmDQxEi
 3tvoetI79b4+4c8T531LLtNry0ZRohZQAEYVMg/Sg+5Bn0eLDg4B4B1rFaYDPmweDv2l
 fefzSRhIfz1bAPe7AcNb3gKATmL/UgKl3J+B4VQhJ4ho0mQkHgbFhdAn9oCF2UfPYzRl
 5BEg==
X-Gm-Message-State: AOJu0Yyh3bBfmwvlpwP8lFm0OXL88KGSltJY3kenLNCdGZeqBcb/bYLk
 H42ALmz/TTTGAz8lpFsr2OdvOV/PJZoIDt4DNPNrsFAkKaWXhM8P/hZeqEAkgC7LQRG1M7tlJkD
 yJSuebj46rTJNY1Dur6JsiA4O1GoQ
X-Received: by 2002:a05:600c:4e4f:b0:40d:3773:36f0 with SMTP id
 e15-20020a05600c4e4f00b0040d377336f0mr475079wmq.87.1703073843110; 
 Wed, 20 Dec 2023 04:04:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbZC41p9v3kAdf252seL2X9D2BEjOUjveeox/+jZ4LdlgSM8+7oshKXYQu/k1Umxzj3KQqVA==
X-Received: by 2002:a05:600c:4e4f:b0:40d:3773:36f0 with SMTP id
 e15-20020a05600c4e4f00b0040d377336f0mr475069wmq.87.1703073842683; 
 Wed, 20 Dec 2023 04:04:02 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c450300b0040c6dd9e7aesm7122634wmo.34.2023.12.20.04.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 04:04:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Don't unref the same fb many times by mistake
 due to deadlock handling
In-Reply-To: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
References: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
Date: Wed, 20 Dec 2023 13:04:01 +0100
Message-ID: <87cyv15bda.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville Syrjala <ville.syrjala@linux.intel.com> writes:

Hello Ville,

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> If we get a deadlock after the fb lookup in drm_mode_page_flip_ioctl()
> we proceed to unref the fb and then retry the whole thing from the top.
> But we forget to reset the fb pointer back to NULL, and so if we then
> get another error during the retry, before the fb lookup, we proceed
> the unref the same fb again without having gotten another reference.
> The end result is that the fb will (eventually) end up being freed
> while it's still in use.
>
> Reset fb to NULL once we've unreffed it to avoid doing it again
> until we've done another fb lookup.
>
> This turned out to be pretty easy to hit on a DG2 when doing async
> flips (and CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy). The first symptom I
> saw that drm_closefb() simply got stuck in a busy loop while walking
> the framebuffer list. Fortunately I was able to convince it to oops
> instead, and from there it was easier to track down the culprit.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/gpu/drm/drm_plane.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 9e8e4c60983d..672c655c7a8e 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1503,6 +1503,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev=
,
>  out:
>  =09if (fb)
>  =09=09drm_framebuffer_put(fb);
> +=09fb =3D NULL;
>  =09if (plane->old_fb)
>  =09=09drm_framebuffer_put(plane->old_fb);
>  =09plane->old_fb =3D NULL;

Interesting that it was done correctly for old_fb.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

