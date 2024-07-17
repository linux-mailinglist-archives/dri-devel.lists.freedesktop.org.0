Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131B933AF2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932CA10EA57;
	Wed, 17 Jul 2024 10:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A+j8HAU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8910EA57
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721210990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fgHkqvfngesDByFlySmzTO1my6KcXoQjEWiFHxkIfE=;
 b=A+j8HAU32xEtw+RN7Ps01VmMBIO4HlLR4PPFGnYG55I2foHTYe/WBWVAiEn4SLl2nyxisw
 1/O6czDtjEjBeIFe6kSv/0KPs1aWCPZwHp/8laUVMeMpt0bODMeLP4Hzt1HfXlTH0z9ogc
 3rHxxK5CjHcLJjs+drijHSvZhcC6DPE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-PxfSxWVrPwGniHZ4Bfor3g-1; Wed, 17 Jul 2024 06:09:49 -0400
X-MC-Unique: PxfSxWVrPwGniHZ4Bfor3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3678fbf4aa7so3807892f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210988; x=1721815788;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fgHkqvfngesDByFlySmzTO1my6KcXoQjEWiFHxkIfE=;
 b=ebe0SbAdrJBgknSCVd69PJCi5eFbhIZaBorkSrsMrs1vSQFutcAgBs2UhbiUJ8XVdQ
 M5agARWYR3XlKoirfpp7nhcNaDBkJO4kCAiA/vNWLgDSqtfle3u3ME0JoiM4opWhGq6F
 jz3tbCd+vdFwB14SqCyJoUCd5QFyjnyFutCESzHNgX46lZVXvXX5HlLc9APNQ3jkzeHN
 hSM7xoCYUH5Ui9sy54814/YICfoZM9Hj1lx9CJZyQTD49IV0pfUfJD8b/amNSrOgBxzS
 mey6bfka4d1eJsNrGKpLz0rP7QgEVDKcsrYJruf5NbM+QfXTbd1BO5Yq1UJ8WpVet1Lq
 +ITQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0HqMd+V8MnM1t3ZtpoTBGJfkIK+ABZvVz6Dyu/+piL7vO+eli8VJLP4uuX+S6eD8dNZjdNIxrA+fwrqTHVQSejwlGm/jKcfy0bi25RRkg
X-Gm-Message-State: AOJu0YwG7HUcTgxlYvE5oq/oaiiXnlO1Bp8usFECdiEL0vBO04mBcdu+
 4+89wZdCL8djXYECGg2dw3wGe+xtTANzPTrl5R/F1bIhIklllY8qBno/puliSjNWjxVxJGNaVys
 Bv4YjJBA6cGNtS/KmL1AXkVrjzZzcsGpiMDehGWvXXzRTibbyZ+s9e6Cd8NPgclphXQ==
X-Received: by 2002:a05:6000:1e92:b0:367:98e6:362b with SMTP id
 ffacd0b85a97d-368316f85cdmr754685f8f.42.1721210987911; 
 Wed, 17 Jul 2024 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Lz0mGct43oO7Dy78Pu2M8nlnZoQ28GtDeNJR5prCRw0WEetXSwvYy2HHKS7mxHnPOm5GIg==
X-Received: by 2002:a05:6000:1e92:b0:367:98e6:362b with SMTP id
 ffacd0b85a97d-368316f85cdmr754664f8f.42.1721210987514; 
 Wed, 17 Jul 2024 03:09:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db038f4sm11142783f8f.94.2024.07.17.03.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 03:09:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, "Jiri Slaby
 (SUSE)" <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panic: Remove build time dependency with
 FRAMEBUFFER_CONSOLE
In-Reply-To: <20240717090102.968152-4-jfalempe@redhat.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-4-jfalempe@redhat.com>
Date: Wed, 17 Jul 2024 12:09:46 +0200
Message-ID: <87wmlk49ed.fsf@minerva.mail-host-address-is-not-set>
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> Now that fbcon has the skip_panic option, there is no more conflicts
> between drm_panic and fbcon.
> Remove the build time dependency, so they can be both enabled.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 6dd0016fc9cd..a22cab218004 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -107,7 +107,7 @@ config DRM_KMS_HELPER
>  
>  config DRM_PANIC
>  	bool "Display a user-friendly message when a kernel panic occurs"
> -	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
> +	depends on DRM

This is great. Thanks for finding an alternative approach! I don't see any
issues this time, because there is no locking involved. But let's see what
others think about it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

