Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1828969CBF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9D610E50C;
	Tue,  3 Sep 2024 12:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LcdAxe8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F5910E50C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKK2QQnQ+cfp5Bkofc8ATvqaWrX2Xfp7Uc2gYkHJUw4=;
 b=LcdAxe8LyFRMiJGQL1qldW8kFvAS3T51Ao0D2P9gp5gBmoahYCteZK7niXpMZe2HURUh+8
 D1f8Y/CkVqPXrkNK406oGeUKtauXF2/EtuLhyRnIITaDoyI7jULiKABUtJWVFVibXHCloI
 ZY4xIiABFk/YLqrGZbRKOEpN4z2zrO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-a8QKGb2VPs2w7lBBC7ijzg-1; Tue, 03 Sep 2024 08:02:12 -0400
X-MC-Unique: a8QKGb2VPs2w7lBBC7ijzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4280b119a74so2221595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364932; x=1725969732;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKK2QQnQ+cfp5Bkofc8ATvqaWrX2Xfp7Uc2gYkHJUw4=;
 b=S8oL9Z4svoF8iS+oADTh+v6m6JiuanPhsNQxkm36DJ32TW9ju2IJhnJhNT5YTkec6A
 IJv+CnYM+uL6pXqGraACNCajxpRMZ2RpZZ1CK1jo49wBrKl1+vfeOggOdjaxirDDGDCU
 Nqix1wIDS7XV+ho+F7PF60hGQ5mKWW7lhuQpZvUk2bsQ/1DO50RFR9MJvn9DELBz+fkJ
 9dk2da5cisciSLgdQgzFSt0Z9nrHQVd1YCkAPprlb80dZKWkjRhWDJlE1QOIsIrVT6kz
 Wk3RpXPwkJOV0XulzsnQCqE+g13eTLKSbcoPipEHNDctAx3SSqh1qRu0XBEHI0JfkH/U
 cSXQ==
X-Gm-Message-State: AOJu0YwzIoe99PZKxCsrG0pNAk4Po9d1OzoukZGOAlsh0dNHa+G/nwaR
 ItK6V32s+QQavPm2KChQEGHuDG4ZtLZ5g/kTEBlXgvfDkszC0T1h/k793BrTvvcn6VoL7cJtYmZ
 mNtKKJzVMdf6Ha+GEWI02coLUEH8s//pAzrLktvM+l7dPCVFQQuxdWu1PFnGZ3CD/EQ==
X-Received: by 2002:a05:600c:1548:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-42bb01bfbfemr122465075e9.17.1725364931541; 
 Tue, 03 Sep 2024 05:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1f5pEh1/LWdcdNFaDJqTeBylHrSHEG8GX+8Ch9n4e6ZFe+eJQZXbxWE8WbPHjx9DxpA5KA==
X-Received: by 2002:a05:600c:1548:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-42bb01bfbfemr122464655e9.17.1725364931030; 
 Tue, 03 Sep 2024 05:02:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df9705sm168596475e9.27.2024.09.03.05.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:02:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>
Subject: Re: [PATCH v3 61/81] drm/virtgpu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-62-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-62-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:02:09 +0200
Message-ID: <87a5gpdjy6.fsf@minerva.mail-host-address-is-not-set>
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
> The virtgpu driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

