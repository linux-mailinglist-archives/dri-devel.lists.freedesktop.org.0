Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8FF969B8D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B38E10E49E;
	Tue,  3 Sep 2024 11:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="icboxGNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCAD10E1AE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbJNkV9u0ZGr/jKEh9pTFkh2fVXMicyQllArXRfkk5s=;
 b=icboxGNXrqbTB++QzdU48uG5eOw/phj1SSaxm/2LcAWOFWEhYWNmU44mP8fKGgMcK4JER1
 Y6RAk3Vu//JPBxzfwUHj3GWHrZHYzL9X1iwcDK/HYCPx4/bQbJBiGrz9jC5x0mkRok590K
 ODa/kaX14LT1e0rW8VGHGm+W4rV90+0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-hVfk4z7dPHeYd7wCga3K2g-1; Tue, 03 Sep 2024 07:23:47 -0400
X-MC-Unique: hVfk4z7dPHeYd7wCga3K2g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3730b54347cso3198483f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362626; x=1725967426;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbJNkV9u0ZGr/jKEh9pTFkh2fVXMicyQllArXRfkk5s=;
 b=Sh/jt9DMuzR69JoJiJsN/RPcdLM5cEttgmcoKLKsCuI+8p7iy0OZx5DesvYjB3bxnP
 52pbT6RH0Ffv6ZvFP47mbRkR5g3uXEf9CawW23bhP+uW2KsbSt1RSKO8J2VDo2O+XH/N
 jjmhnAkJy0Vdu3kct49kELswkSmoy7QCIuOeBkQUroaTQQND3809Q62ojR857Mm8SSSN
 +GhRYvyDwPCVS0Mo3hb4qdArs2PunxOWGl8pYFavwe3K8MIIyud+Tzn/ry6pwLjjxzuH
 gMLAgIvHkAyrgoJY+Bov1dn3vJa6qiG9/kry6A/b3tCe+u28iUV2/zwh+3kCIR/CLfAL
 bmZA==
X-Gm-Message-State: AOJu0YzQvn9YsITfC6VzBcfh66eWSdcPup0jLl7dXIuI4GJFHftKjqIf
 B8FQk/MSlVJHxRFi9TPCTVXYuzGUliYH6+k/OOPftr6ByEUckKkmuxEYiWbAcBxHHGXua3IZ9Eo
 w6fqkCUSG9/ANFLOBN7j4Di1lxteNV00JP2btoY+AkEj9yONSVXCsGlSKx1Q5Kz+iHw==
X-Received: by 2002:adf:f784:0:b0:374:c69b:5a16 with SMTP id
 ffacd0b85a97d-374f9e47a5cmr2179061f8f.50.1725362626237; 
 Tue, 03 Sep 2024 04:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSm/RqGjce7S7ZMEuf3IOUzOzr9uuowr5iGarnhEC2vfQARAToz2WJdH4ddi+cl3DwZjT8sw==
X-Received: by 2002:adf:f784:0:b0:374:c69b:5a16 with SMTP id
 ffacd0b85a97d-374f9e47a5cmr2179047f8f.50.1725362625744; 
 Tue, 03 Sep 2024 04:23:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba30d5b8sm10273357f8f.15.2024.09.03.04.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:23:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 17/81] drm/ili9341: Run DRM default client setup
In-Reply-To: <20240830084456.77630-18-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-18-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:23:44 +0200
Message-ID: <87wmjtf0an.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/ili9341.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

