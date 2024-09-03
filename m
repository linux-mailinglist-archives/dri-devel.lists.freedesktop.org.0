Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27BA969BCC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46210E4D3;
	Tue,  3 Sep 2024 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hU/UiXTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9AC10E4D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=hU/UiXTFoUOV/r3VTLKJxeVWdEhiWyBjsVYpsjBVhHg7uAgXEVtXMAYMzZfFwSsu4qeJ9Z
 lFFOMWZVGRutRZyzTTTXmCal7s9ruq9m5cpI7GRWOg/wAO7ejHHEIycUWGOMIgZ801C3Gi
 jn7v5E/J2PamqT0z2pqbnf/4l/w7xbs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-9N1HpUCYN2iznaY_sOAhmQ-1; Tue, 03 Sep 2024 07:30:43 -0400
X-MC-Unique: 9N1HpUCYN2iznaY_sOAhmQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bafca2438so59159725e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363042; x=1725967842;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=KIEh1K/NRvqnjxztIeCv1MNWj4ISrbfL31hgSy4F0arJY7fXzJb5fiHOzRLlJKbQN4
 zX5WUMiTe/mGc8BY2B5rJbO8I6awyXLBtQ+vBBFBQprPy2I8NtDBniqBa09JdSn+r4AP
 4FI0WmkFOMXW+RoXe7KPJZZFNeP1qHPuyIdPuqOYG3roxXUAb3qgrwDWKUfrIa7Xzf4B
 NsJqqxXAgiSckPPWOssODmjAunjMrOFxQVWSIliUpAiOJKnrd+fNMhsUffjpq8C2RYDG
 +OAFvSYw3YUjXUW0koxtTAO6KkpV/pz/JvWnwU45IdxXbM5sdPJIXxRlOZakD2So7ZzV
 2Rfg==
X-Gm-Message-State: AOJu0YxcY2OMMgb9NwEpSn4dBmlSpc3b5oLI96Jk5Pie8cFkqLdC2os/
 NwVfZ09G8S9+VLevxF051rSb9QZ/66P3+GHwoHuwIIj+IOwIjCFYt6TS89cJD8m85C60MvzAKhB
 tAuGbuatsXXx5ZYekOlX2twcUy2AtXg3EH126Qgcd/E6VVzqRUp/O2PvMXCTxa3NvIw==
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142329f8f.20.1725363041819; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaxU5bJuIzUDf8RSjazoPcbW/KJpDG6+5g7d7j21W0xhBI7SOXf/r+/zCa6XdnhnO6fGnIQQ==
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142303f8f.20.1725363041396; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4d391sm14089852f8f.3.2024.09.03.04.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v3 39/81] drm/sti: Run DRM default client setup
In-Reply-To: <20240830084456.77630-40-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-40-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:30:40 +0200
Message-ID: <87zfopdlen.fsf@minerva.mail-host-address-is-not-set>
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
> The sti driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/gpu/drm/sti/sti_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

