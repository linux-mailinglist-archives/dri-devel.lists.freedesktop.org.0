Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F381470C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7710EA02;
	Fri, 15 Dec 2023 11:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F127C10E9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702640092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxLtYgaj39U/CzJUXMJOMteay7634xHgF6ELa5W+WoE=;
 b=WMdT3cU6F/CLjxNZ7BBL6OjIFQm3a3TQrLN32h/hwHk3g6GNHXBsQtmwsZDOr++x2hKaxb
 TU1ztnqwlFECEW5kp6gVYg6Ma1xlgMsNcTWzl1hK9b0RdNukVEDwJwXeM52RklKDY7NBT3
 1CMlSN59AleeBQLG958mqgKbu9gVPjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-tLQSHji9M_mJ7FhItsEc8g-1; Fri, 15 Dec 2023 06:34:51 -0500
X-MC-Unique: tLQSHji9M_mJ7FhItsEc8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40c4297e070so4460215e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 03:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702640089; x=1703244889;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hjij57/MHtZ00H1IeuNQXCGro5hKEbeWCBBuBWAUgzg=;
 b=CTvur9tixV7Dp2xmRxDcgRdJllyyDNGDzrm/Ib8LumOIivYZx+0VaohcqBpea2c/k3
 Rm7pyOs+XHMHoslhx1snkqtwBQt28z6ydPkiM7+dwGfE7EaeeuAIqEHJO732jhTEAbGi
 e4WdssOlEHvitbm2tAGJHWJkMESgJVvTGqHCClcQPQAhaoKk5HcAFMpFXvDHRw2SEEeL
 cnY9tjoSeZK4d8mVEUOfwXHFpqkbCFYDxPbEqqoXftwwrg2QoUEcqCcei4PiJraM1GlE
 ZZbO+Q00zR7J5LSbVj3LucTeI6mQRxXbmKaw/bVsH9vFiKuV+CoNVKxRgZNkLJ7c05oI
 X4mA==
X-Gm-Message-State: AOJu0YxikWkEqAocdieQsX6m0kCzk1jFRQPbpoy3DOXu4Q/fBXT2kk4v
 bTbmxes4SiOkauKZoFghRhrsdn2LMYEvKYRlVXoYvrJyVp4HrdiVv2LSNw55NOYsTC6RkBEAN1W
 ZZQ42yGftS9WRzFsbTpwGWBkb3neISKU7cIR3
X-Received: by 2002:a05:600c:520e:b0:40c:3f09:57bc with SMTP id
 fb14-20020a05600c520e00b0040c3f0957bcmr5344651wmb.175.1702640089683; 
 Fri, 15 Dec 2023 03:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEowepjiQzOg4sQ5uGsfl3tFMRKfHZ19kftFAa7jN0Z8zZSe2V99S5FI3SHfaEaJmfJmoN3CQ==
X-Received: by 2002:a05:600c:520e:b0:40c:3f09:57bc with SMTP id
 fb14-20020a05600c520e00b0040c3f0957bcmr5344639wmb.175.1702640089270; 
 Fri, 15 Dec 2023 03:34:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fl9-20020a05600c0b8900b0040b43da0bbasm28957062wmb.30.2023.12.15.03.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:34:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/mm: Allow CONFIG_DRM_MM_DEBUG with DRM=m
In-Reply-To: <20231215111129.9559-1-ville.syrjala@linux.intel.com>
References: <20231215111129.9559-1-ville.syrjala@linux.intel.com>
Date: Fri, 15 Dec 2023 12:34:48 +0100
Message-ID: <87o7ern1gn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville Syrjala <ville.syrjala@linux.intel.com> writes:

Hello Ville,

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The original rationale for
> commit cd456f8d06d2 ("drm: Restrict stackdepot usage to builtin drm.ko")
> was that depot_save_stack() (which is what we used back then)
> wasn't exported. stack_depot_save() (which is what we use now) is
> exported however, so relax the dependency allow CONFIG_DRM_MM_DEBUG
> with DRM=3Dm.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 31cfe2c2a2af..4b8b8f8a0e72 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -42,7 +42,7 @@ config DRM_MIPI_DSI
>  config DRM_DEBUG_MM
>  =09bool "Insert extra checks and debug info into the DRM range managers"
>  =09default n
> -=09depends on DRM=3Dy
> +=09depends on DRM
>  =09depends on STACKTRACE_SUPPORT
>  =09select STACKDEPOT
>  =09help
> --=20

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

