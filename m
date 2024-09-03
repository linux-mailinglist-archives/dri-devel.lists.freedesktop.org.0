Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58201969CF7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC3310E53B;
	Tue,  3 Sep 2024 12:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V3k0Ics5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B8710E537
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=V3k0Ics5NTre+IfZcFrGpSRURsMYx6ujTIcouoFomX90Fj8OpkCQPgGehV+MmEz0V0a7XY
 ALwSR6i267Uz5gl+sZwnynIzOuWljkKqMauWUq9vHiRGbkJVlZ/clKIn09tRqvqLZEcxWm
 RskYrq45EGABmnnNnxXm6bedCnV3hqc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-7HfgecfUO9SxcGfipnDlbQ-1; Tue, 03 Sep 2024 08:07:47 -0400
X-MC-Unique: 7HfgecfUO9SxcGfipnDlbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bafca2438so59577355e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365265; x=1725970065;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=f0JY3W9WLTsKnVqlCpdYGFq0/P/7Eumc7pNk9O9z7ugZR3TVbOhCMdh2SMW547E9I+
 a9kh9lfYaubOuTNaVgo0RxrFutrvrSnCk5XyJ4CIBP0ryhHG5Y0IZViQKDwa3+O8cw/2
 +CNGb7VOuLjJlYvuuhE+VrVdnlYz2yXV/XETG3svqNc+nnnKB5GxGzS8q3LNzlFObi6w
 oBm+UdQF7tNm3m2eCkuGdJpfZzEgR63lYiwOrWRgTKuvPxG8HD9HEDIa/LrH2FD9j8Cb
 d8VqCPTFkHcm6z1dRBQ0ftzZGfd0WI8Vel80Q4pF9nbl274Cw1VldzwMDDFw1iqFHNFc
 /lWg==
X-Gm-Message-State: AOJu0YwU1fIY6HUytSjM2MiC0Xv1FEtZmpvenv0Y67JFSwECsNtx4zz3
 q4y6PuJQtYIh5N/pCrQzrzNWrfZ6d9L3AmkmFMwd8noYH5e5qFTy3s64VmIMW6dfhUzH4raeEWX
 NPmv0w7NFwixk7UL7vutg+NMLlZHXj+iRtl553XpeFRnxB2cze+rCPaaOdLh70q0a+g==
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846591f8f.22.1725365265438; 
 Tue, 03 Sep 2024 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCZGf4oyMzQD1xP820+OtoZdwpD9efRDqC8p6dHAxE3oooeovG0mBCFinpOGmjQ84JGX0fEg==
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846571f8f.22.1725365264915; 
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b23f20d1sm11428477f8f.35.2024.09.03.05.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v3 72/81] drm/vmwgfx: Run DRM default client setup
In-Reply-To: <20240830084456.77630-73-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-73-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:43 +0200
Message-ID: <87mskpc54g.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

