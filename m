Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C087B2ED8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 11:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEB710E0EB;
	Fri, 29 Sep 2023 09:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352E610E0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695978301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZwuIZApiBj5DYtNWFPJHZ1zZPPh0B7fCep++5kWA1k=;
 b=Nw/EGwe11x0H9SGDxKwzF9fDObZ1fycxVawjAh3c5lW/WkLKlB7n7BYq921RBKucWF26gH
 nqqVGiZVfGEWh231ZOK8CIswPj5ntFLOtAjYt0FrB2drkQCnv/reHdqvco++ELcqEueHdd
 Ek5xLdX9NVRyIUtj1R8uEIpffdRsVno=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-5bjLitEoPTSzWH-3_AJeHQ-1; Fri, 29 Sep 2023 05:04:59 -0400
X-MC-Unique: 5bjLitEoPTSzWH-3_AJeHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3232c3df248so6873775f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 02:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695978298; x=1696583098;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCLMqN5eubKacZOhn5en2KattIzC1ezR8bQLgLgMqK0=;
 b=LDzj0odewCcXGbpONHPz5TNrse0DW4xHNAU43dB9S6D6FAg6y6VSMtSuGqI7FckNaG
 zHgu5y7Q+0TLTDU3+dD868qiNREcFWN9stIJRDZSAwn06hDeIC/Gz4HUYtWvA4g2BYeH
 yS0HcoIqdxPsNHCGdkWOSALaGvFtlNvGR3Gkm+74FMH6jLcYXTmvE0OJSWP69Q2j+ikN
 Xovk2ZVsTs4WP5PzxYrQdKS3RhlPU5fy3dN9TRmwwTEONtCdF0xTIa+Eooep9lepynNG
 SuJ9Aminvdl+PcusVoCermRYgVsf5D0SME+nRhyzYP8JJYkqwTKKoTPoKq5YzX8D1o/f
 ckJg==
X-Gm-Message-State: AOJu0Yxg0F03C1UrQeKqbGnvCYTqhpiz9Ku5PkDkbODtyfHD1gGvzx1f
 wLF5aWIxGtCWOC/V49HniNCTR/QfOeJiRu6eDaSzUt9ZY2a2JUa7lSST7kKxkAsPmegdLgYb7GM
 AjoFEjmqEbN9PsSW3MSFYXapDMNqt
X-Received: by 2002:adf:ead0:0:b0:317:5b76:826 with SMTP id
 o16-20020adfead0000000b003175b760826mr2820839wrn.0.1695978298618; 
 Fri, 29 Sep 2023 02:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRa6bWRdEpCvDZFb+DNqeJzNkSBCoeklYxTphxzEz+d2DQwSymUTScyVyLkk3qvf0kVc80pA==
X-Received: by 2002:adf:ead0:0:b0:317:5b76:826 with SMTP id
 o16-20020adfead0000000b003175b760826mr2820821wrn.0.1695978298260; 
 Fri, 29 Sep 2023 02:04:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a5d6f0d000000b003179b3fd837sm13982929wrb.33.2023.09.29.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 02:04:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v2 2/5] drm/format-helper: Pass xfrm buffer to
 format-conversion helpers
In-Reply-To: <20230920142535.19321-3-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-3-tzimmermann@suse.de>
Date: Fri, 29 Sep 2023 11:04:56 +0200
Message-ID: <87h6nd4afb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: David Lechner <david@lechnology.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Pass an instance of struct drm_xfrm_buf to DRM's format conversion
> helpers. Update all callers. Drivers will later be able to keep this
> cache across display updates.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: David Lechner <david@lechnology.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index 5a80b228d18ca..d11079733bc0e 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -571,6 +571,7 @@ static int ssd130x_fb_blit_rect(struct drm_plane_stat=
e *state,
>  =09struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
>  =09unsigned int page_height =3D ssd130x->device_info->page_height;
>  =09struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_state(=
state);
> +=09struct drm_xfrm_buf xfrm =3D DRM_XFRM_BUF_INIT;

I would prefer if this structure is a field of struct ssd130x_plane_state.

Since ssd130x_primary_plane_helper_atomic_check() zero allocates that, it
will have the same initial values as set by DRM_XFRM_BUF_INIT.

Alternatively you can do a drmm_xfrm_buf_init() + drm_xfrm_buf_reserve()
in ssd130x_primary_plane_helper_atomic_check().

>  =09u8 *buf =3D ssd130x_state->buffer;

and struct drm_xfrm_buf *xfrm =3D &ssd130x_state->xfrm;

>  =09struct iosys_map dst;
>  =09unsigned int dst_pitch;
> @@ -587,12 +588,14 @@ static int ssd130x_fb_blit_rect(struct drm_plane_st=
ate *state,
>  =09=09return ret;
> =20
>  =09iosys_map_set_vaddr(&dst, buf);
> -=09drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
> +=09drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, &xfrm);
> =20
>  =09drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> =20
>  =09ssd130x_update_rect(ssd130x, ssd130x_state, rect);
> =20
> +=09drm_xfrm_buf_release(&xfrm);
> +

and you can release it in ssd130x_primary_plane_destroy_state().

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

