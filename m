Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9747B9D67
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC9F10E40B;
	Thu,  5 Oct 2023 13:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845B010E412
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696513129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRGReURk/svuajuI8roXNxIwnz5dGCmY9cH+iiBiQBE=;
 b=PQRk/E/znLNBelds0tdmjvbD4jPmTi+LxFrEjdoH2K+qh/WHlJJfC7eExUsjsBBPPJTEQx
 Cj3AfC4pNfyYNjOHALViuXv3htrb2Em8plv/F+xMr36OU1vydDkJ+ybpvuMixzZUvU23VU
 qjQXaqOOgjwYDd+t0O3Sr6npL5zonmI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-MM27PG0DMqKwyfEONTYHcQ-1; Thu, 05 Oct 2023 09:38:48 -0400
X-MC-Unique: MM27PG0DMqKwyfEONTYHcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-406de77fb85so2879545e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696513126; x=1697117926;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wRGReURk/svuajuI8roXNxIwnz5dGCmY9cH+iiBiQBE=;
 b=VdGTTM1wsF8Dk+Sdi9jdi1qcHNjhwmsb/tJMdClzRF2HbNHOq1sce53vuVgfTp7mB+
 ss+2zoaXrP8fIQn9/0q0Y3zhlPbfgqFlDz4jXIwbw9Y2/niB0mVfKWr3UBIPLMdlRMX2
 jbkk5WPFwyw29mGFA+q9GeSK8yzVydN61+VrMTpu4S7yFSFadr5VU8v6jsQff2xRmGUj
 /Pb7Plia6b0eXc7NlyPG6TKkX6EpSt3cyia7F9M90onBq7MD4vl8vDSeq1mwbHjPgdVy
 GL9ZJCMmfNMCrMYyp114DqgDtSHMvl6sgWLKEdVSaFR36STIhxclKLOovIVvCDRH21fT
 /++A==
X-Gm-Message-State: AOJu0YzoC5hIaSsBMpPFF6jie7Xx91UdmUSVudwRg4uu4J6R4GlFe1CM
 RikFzag1WbZGdeLtqZC+c8IR1fj1TOzFV0rxMyzYifn3nlniYUzhHB/OcFCQ9fscZDSve0NHG5h
 U2dXGqq0l39ED47dN2tn5d7lS6CuI
X-Received: by 2002:a1c:4b12:0:b0:405:4a8c:d4f8 with SMTP id
 y18-20020a1c4b12000000b004054a8cd4f8mr4957191wma.30.1696513126750; 
 Thu, 05 Oct 2023 06:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw06JdbXnbGU00Gj6zZ+6G7OuR2jsVyzxFEBDyoFJOyRorDcXfwwxao8k3m5SKK66PER1/5g==
X-Received: by 2002:a1c:4b12:0:b0:405:4a8c:d4f8 with SMTP id
 y18-20020a1c4b12000000b004054a8cd4f8mr4957178wma.30.1696513126354; 
 Thu, 05 Oct 2023 06:38:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d67c5000000b00317f70240afsm1803834wrw.27.2023.10.05.06.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 06:38:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
In-Reply-To: <20231005090520.16511-6-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 15:38:45 +0200
Message-ID: <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Preallocate the format-conversion state's storage in the plane's
> atomic_check function if a format conversion is necessary. Allows
> the update to fail if no memory is available. Avoids the same
> allocation within atomic_update, which may not fail.
>
> Also inline drm_plane_helper_atomic_check() into the driver and thus
> return early for invisible planes. Avoids memory allocation entirely
> in this case.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 41 +++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 6788f465995b3..d2280c81cbaae 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_format_helper.h>
> +#include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
> @@ -579,6 +580,44 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
>  	DRM_FORMAT_MOD_INVALID
>  };
>  
> +static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						       struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_shadow_plane_state *new_shadow_plane_state =
> +		to_drm_shadow_plane_state(new_plane_state);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +	struct drm_device *dev = plane->dev;
> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
> +	int ret;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);

Same comment that with the ssd130x driver. I think that we should use the
drm_plane_helper_atomic_check() helper instead of open coding it in each
driver. But regardless of what's decided on that, the change looks good:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

