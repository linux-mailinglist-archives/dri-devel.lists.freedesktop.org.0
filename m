Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54816969D4D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B705C10E55F;
	Tue,  3 Sep 2024 12:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CjfGhaK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67110E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=CjfGhaK2Gpg/KjYT+bYxyB4OsIqZnFmc1DpBm1b5yJtlcDjV5GVn7cHJavoJOba7n3EOTh
 pX4GURpH75UgTDIpiYMRncTVLzxQLwMSEcPz6O3+6wdxh/DbcCWuqG9eH3BumQDLs1MyQn
 kVxU6WV6T7xKFzwhMAmnDk3Zg3ObGRU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-qgRM1QVSOG2Tcz1Gfq8tlQ-1; Tue, 03 Sep 2024 08:18:12 -0400
X-MC-Unique: qgRM1QVSOG2Tcz1Gfq8tlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42c827c4d3aso20250805e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365891; x=1725970691;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=ek0vrW0QMfAymqV/b48/JeEXkJmZNAcPWK/j7kH9i95TkwSNzYdMBXdc2qNUMuwyOO
 i1HsAYICTrE++ALA4unG7u3BQLfsp5Lutney5rHQPyfXYCXmN0SkvWdh3PDhStWl62C/
 3AMcJ6KAaNxw6YG1BwSjj8PAl/6gtmc2vr8uq0uBzfi7Li3oYnmgt1DTKMU3OLzh5cvE
 rPu6pXzHezzZJNdX0QxOJwyRhXO2HcK5UORhpYpiRVY+LLE1pBO4avQtlndzo1NsMySH
 2Ib6ehMDiUxjl9th9iExegokt0V7+a04yK/XULnavpvPerc67RwZBOx1KEl1fHicxJbL
 +wLw==
X-Gm-Message-State: AOJu0YyF9L76Bw3DKYUUAmNPG5Ax2Z9CMj734fJuZobfFZjd+u2zBgCO
 VWDJeF/Cw9WAQlwd/KGj9mQN50qH+W0uNGHHscYONh3b9Zb3NLhmE/HlwT+l5H4xr3nGfYk8L9p
 kkVbMauf8riThzIAwknxHLPuxzdLyUFsBEhP/9VhqWxIzPy0AU6JdRQXvjTTOKmEfvw==
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626405e9.13.1725365891691; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1PB5397pxPS+al287j5eSLcqH0EiAmMQ60AOH/NehoWOvOhNnHbQE2ALKLczHDDhpPV0k3A==
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626185e9.13.1725365891158; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e367b3sm168493655e9.48.2024.09.03.05.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:18:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 79/81] drm/tegra: Run DRM default client setup
In-Reply-To: <20240830084456.77630-80-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-80-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:18:10 +0200
Message-ID: <875xrdc4n1.fsf@minerva.mail-host-address-is-not-set>
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

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The tegra driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c   |  5 +-
>  drivers/gpu/drm/tegra/drm.h   | 12 +++--
>  drivers/gpu/drm/tegra/fbdev.c | 98 +++--------------------------------
>  3 files changed, 19 insertions(+), 96 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

