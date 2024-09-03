Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D1969D3E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D111910E559;
	Tue,  3 Sep 2024 12:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HMLi1O6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8F710E558
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NAq91MHu1YedLn3F02fhYw1UruzCX/irseYvT1RQybQ=;
 b=HMLi1O6rmmuWIbzYULZngZVmDmFMMBbWnHhz8ujZ9qyFJA3X0ROKSvU8e9Exp40jiT6+i+
 D4n2/g0RGE2WIZkjmVDVrq92wd78fFQWBo9it+wTrmPNu2sgUlMqGuEsqa/10/QQYYbURs
 tzICL+mYm9Y8llSv+bEDcQwd824UjZM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-7NiZnkqPMP2RSyJFKZvGfQ-1; Tue, 03 Sep 2024 08:15:44 -0400
X-MC-Unique: 7NiZnkqPMP2RSyJFKZvGfQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374c581ce35so1399416f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365743; x=1725970543;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAq91MHu1YedLn3F02fhYw1UruzCX/irseYvT1RQybQ=;
 b=BrB/6Up58fKgzSh9xdcCvlUhw9Z40eNsmA8dXv32eq0+Xl8PSqG9oYqh9Y6ML4JB8Y
 wBTZ3IL0OqaPLOK0/YuLQ4liRHmy6YCwNOGOaRORXcZjnGKDpwWcEGYg20KAE5GkQi2g
 91ErP/GwRQp4tlgEkZBkJ9HNTak5kJp9vDzv8kCa6MFLL6lswRQRsRXE/5EsI428PuJS
 2Vh+1h1zG09VhwWMNylAt0A45YFqAbadXDmucva6peaDlMMtHTCbcoqXFKU5hvtTu2EX
 RVH7xaQK/d5Yd0GWAWpZsHZFr6miLKcm4nqkbcOz1DOt6M4vauxL8WiSoF+VXZBjNlsB
 etRg==
X-Gm-Message-State: AOJu0Yzq7kSt2mZBwgN1j2YoFkP1empMOzb2t58YgWpWOot3nB0RNr5P
 uV5z8PGcsfI+lmoQh6Lb3WV9aA7bdhjx+vSvXwhHKf1Sp5YMWr2eTau2KbWc16X/k0X4tR1DsmP
 3mHpDdgigYryUYsOFjQD79rErBBov7RLjTPsyWmCrYIMSml8W/ZtIvK3ahNcckQi9pQ==
X-Received: by 2002:adf:fa51:0:b0:374:c1a9:b97b with SMTP id
 ffacd0b85a97d-376dcc8b8e5mr467032f8f.8.1725365742990; 
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrOxGUesKlUZWk0uC4i7YVs6JItUFj0a5y2fMikJdW7sd9iJpSVoWROtdMbdcImV5AXcDIYQ==
X-Received: by 2002:adf:fa51:0:b0:374:c1a9:b97b with SMTP id
 ffacd0b85a97d-376dcc8b8e5mr466725f8f.8.1725365742564; 
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b6a3d27fsm11081760f8f.59.2024.09.03.05.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v3 76/81] drm/gma500: Run DRM default client setup
In-Reply-To: <20240830084456.77630-77-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-77-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:15:41 +0200
Message-ID: <87bk15c4r6.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>  drivers/gpu/drm/gma500/fbdev.c   | 100 +++----------------------------
>  drivers/gpu/drm/gma500/psb_drv.c |   4 +-
>  drivers/gpu/drm/gma500/psb_drv.h |  12 +++-
>  3 files changed, 19 insertions(+), 97 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

