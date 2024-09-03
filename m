Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970F969BE3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BFD10E4E6;
	Tue,  3 Sep 2024 11:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LBYUyt4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8916510E4E4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c51g429CqBiAb8sLxTg967o4LCr9w5BY0m8TTXdBTJI=;
 b=LBYUyt4AukJGQpQGT8yQX0XtdOUMXzBvvU40LrIW8LpWM+h8FP03LtFLZ29g6e+nd2CZzg
 z1/mKYPqQuAptohD9pjPTN2sIjv6EANpUIt7meyZsR2VhFLAMZNX4Gq5AMHes2xAXvPMqq
 uGPmuHWOBgixtcLFVB8Gc4mBHiy/GQg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-WX7B3BqHPH-pu_4sE380Mg-1; Tue, 03 Sep 2024 07:32:21 -0400
X-MC-Unique: WX7B3BqHPH-pu_4sE380Mg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bb8610792so46105755e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363140; x=1725967940;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c51g429CqBiAb8sLxTg967o4LCr9w5BY0m8TTXdBTJI=;
 b=cfrf3aQOcRbNl8mpCO7a+rHemJxrLw8BrtUm+pv2d0KmQMW+1HgOxqKVS+Vk2cCCg5
 5MG2trnxeUqr4sWwxEE68pTxMtTSKmcQYtRMh/f1ksZUZ9z5KOc7/EG2GbgqzbA661BW
 KhZOPqQ+KLVP5zVoTHeKPLMTQby6GraOrmIJdJDgGt3tfXub7LPAIUbz8S1y2dGQWK1O
 sBITaesmCIdvkcIgVq69MACPHvBoUWLgRKVPRHQdStT7xmj9Zngsd4k6mW7GZ+m6605v
 OHzEma5rcnGUL9cZnB3UKv0A9VPdD9B+GCA1XjxYLEIUKlpUjmTcZpsJ3E2KH3m/mAc4
 O2OA==
X-Gm-Message-State: AOJu0Yyxx386pnNZ575mFmx73wcbnwzkkNKKs2/akwfw1TRt5VZNAPkB
 ZTDeJEpULnlOyuNG7nVJ+Gnhwf6ym4lR9IA7HMt1TxB4YX35X3/kkzPVyz845Vkqb6cRHOSv8B5
 RSQDuDUulvsiqd0LjkVLJjn1WA0z6yrrcEa7EK+goSRzeL8GPafwHDr6G0gYBdjlOVQ==
X-Received: by 2002:a05:600c:4591:b0:42a:a6aa:4135 with SMTP id
 5b1f17b1804b1-42bb0308417mr139793735e9.20.1725363140441; 
 Tue, 03 Sep 2024 04:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp42gNprz2um//CdGf3nf4XLE2F7OEX9FA43AbT1f7fMaJeIdKj5LbeBnDqdBCONucMiA4yQ==
X-Received: by 2002:a05:600c:4591:b0:42a:a6aa:4135 with SMTP id
 5b1f17b1804b1-42bb0308417mr139793465e9.20.1725363140014; 
 Tue, 03 Sep 2024 04:32:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b67ff88dsm11060831f8f.26.2024.09.03.04.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:32:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 43/81] drm/tilcdc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-44-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-44-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:32:18 +0200
Message-ID: <87r0a1dlbx.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>
> v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

