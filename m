Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689A969CE8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FE410E52E;
	Tue,  3 Sep 2024 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PDETIwjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF77710E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=PDETIwjtXoSVt2SeT8BJbxX698bGVDhBQSZ3UoaBryP5KSGIkAkZx4csGe8TrQ7dzPy70L
 Ms7rQ+Z8XZ1GQxppo+2YA1CMPaJckXARuL2WHO1Imb9Ijs5zqsx3NEia5ZPOdCTSNqH0C+
 xuyi/I36Y1mOVjX1nYz8BKoBcz+BhOw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-t8AzukG5Po-uXwlULEAjNQ-1; Tue, 03 Sep 2024 08:06:34 -0400
X-MC-Unique: t8AzukG5Po-uXwlULEAjNQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a86f0c0af53so453274766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365193; x=1725969993;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=N34rn2kX92CWsiVWqHAUvHAPDNgXo8Cg5zK+U/OkOmrhU/Qjte96Hf3/e5HDdX8mke
 G0Z0DsILF+iyre12gpZRBU7xZ96oyNbnthHWaYeWZwJpK7axrvI8Zyfkx2/wbn6C9Txl
 ztHmrCAZdcuoEAmJwq6dqNOXwVUUfx8URunN0xHsFvthyl4MGovBamvuABQ2qFWHAVpx
 90rkfRaahvI2khyOUeOMDNXluOMZ8iYOFaz4tMRvUcyQbquSpLjaTUL4SzDjfwvQjUzM
 2LONK0HkqxzRQ+91VB1Tiw5347e0SelT8vDA1dBc1wkZBDm0vyQ4gWSC1bYg1AcL/QiN
 ZGIA==
X-Gm-Message-State: AOJu0Yxbr8xZgkfrs4Omn6inNN9lQnuoYJMu5WSauNfVCK1baQItUCOr
 Wg8zaLxJ8bu+qoKVjnw7ciOTjzQDvzXjQChoUJLn2zDPJKpqh7GWHewfBwMyoB1/N3DN1NpliCJ
 tlwKAktXNwVKEHDMDhVGDfHb+hkLegXaPPaR/lfNJTrvWKK5AMl/TWqzBSRqfEX/LjQ==
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262520966b.23.1725365193652; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKoeIshuDSdtf/JGgIl6tnQAFAZn+DDFBpQM9QN52xxGXt/DVTGdF5osqSdNpaEvBaP2lGVw==
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262519066b.23.1725365193131; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f0acsm674520966b.73.2024.09.03.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:06:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, John
 Stultz <jstultz@google.com>
Subject: Re: [PATCH v3 67/81] drm/hisilicon/hibmc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-68-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-68-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:32 +0200
Message-ID: <87v7zdc56f.fsf@minerva.mail-host-address-is-not-set>
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
> The hibmc driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

