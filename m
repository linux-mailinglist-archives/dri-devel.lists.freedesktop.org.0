Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F98969CBB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FD10E509;
	Tue,  3 Sep 2024 12:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RhFxI6dN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738D910E517
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=RhFxI6dNmc2dlUuf8KBil6+bUUcSslVWM5YbqLaUV6AtEL0XLX9vijM9de+l6W+x5nFbBd
 9s94qYyLp6Cpwfz5QWrh/mUzI831rDVc+uuvT3zhw5/EP2xSYUeQFuRHABuJXVdkRCVFpd
 FImBdqiAg0NxFGv+OmfPYGmbifSCKMI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-ROWasq7hPEWEIKYrNS2nJg-1; Tue, 03 Sep 2024 08:01:44 -0400
X-MC-Unique: ROWasq7hPEWEIKYrNS2nJg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5334af2a84fso5652951e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364902; x=1725969702;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=X1xp6Y7sloqTpVg0WUNVMGKE18irdGKVNS1Rn8GbCZJoMotxj+S/CG3MkL1OckPlba
 C0MKTXJr3VYOpIJW4lKKclhIflz5KgMqZpXJj/e67GgFxYr5ey84zOs3EU0K3rmwCL55
 nGCyvW1w93h3OrDpx8VN6hZDyDldxO+vAaPFNS9guNgyDGH9LegMG8gDpRh9OI3gM/ka
 lNTLiputTDAoKoufAKhuL0caaRDhjoYxV9EMnc22tTBPpJabgV5vS/R0hZYaW6Uzo2tR
 FGgeS9xYKe0x9CDki8NLdv24fWI+0904JGVih706E3gzTl0YS/zRjL23b8jIOu/ZdOdT
 ZqCg==
X-Gm-Message-State: AOJu0Yxm2UQay4uh3X8V2oWbRt0QkPcr4HczvIEPNWMk28heYUMF5VEa
 GX7m1TJCK9/MNg0xrC1UfoXTkgZi0SBzdscGva4LWhtbKqxPmSrJkqIyr9uX7FIR2wAH9He7O+9
 oYc3PrM6IgXBMJEm1KFtV8/CHdnJjp95KyhJO33K5Dv+kxebQpJTPXo9uvvx1+jeJ7w==
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669824e87.44.1725364901774; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDjxWGjvuovR8Aopi451WacRBX2Wf/wOeUhWBSbhzIhjLIYAAi1Vp+ANICqYmaRYGmnJV2vg==
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669769e87.44.1725364901129; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb2dcsm169907915e9.1.2024.09.03.05.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:01:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3 60/81] drm/udl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-61-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-61-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:01:40 +0200
Message-ID: <87cylldjyz.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

