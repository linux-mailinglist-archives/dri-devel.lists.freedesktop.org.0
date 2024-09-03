Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E015969B74
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BFD10E498;
	Tue,  3 Sep 2024 11:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RWlDFUbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C010E493
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=RWlDFUbwKfQJ4D+WMECz9OTP+Ws0jfTGI0uUmRNQdv5Qu7/KDKiOZc52P3egwBA1VJRN8f
 Q4JTtW26ivCT+kHJN0sjo72geXAKIb4FOVtYZh0S+U+8DJmNih7UmrpAULYJ5lLlzUN/uV
 COv/xZ4Ub3SMOq47RlAg/hpk8kEsLBg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-0wTfbtEENg66FtLsQRGpsw-1; Tue, 03 Sep 2024 07:20:33 -0400
X-MC-Unique: 0wTfbtEENg66FtLsQRGpsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374bacd5cccso2476491f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362432; x=1725967232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=RC1LB+zshzmvUBklxgK/SReG012KsQleuErkjDbtSm6lPWoG1gFFrif68fWX//OFMW
 nr8TgIQzP0Xyurv0V9r4SrmmA8au6wjPTMITT6lMF1YwYfzbmDxxsSUXCwtDLrbisRIz
 OxnqebxyGGMuuPiq25r973G/9z0cRb4nwTRbgfgzxQXVQeJol8OVziD+culUsN7ob/wl
 wso6TLvwLTEOMUh/HtImHzWYhXCBm3lnpiYod5s5X6eW3R/cr3NoJZKk57f9989I/+5g
 HnStm9plfM22mwCujvTVVa2N4fiYg/+iaLBQySZPNfnjZKhsqX7xJYooZKhg0OaH2Xqf
 AAfA==
X-Gm-Message-State: AOJu0Yy+aJHrbl9//DWAA/VlVAgLZvHY+IqFX4B3JbPVoO50pNuBGOmF
 aZQW76lBOqrbSOHxXcx2QkPURZhyzpayXjzwcmeB84KZDjjOhIK79MEUYYNcv64IBbuxZnSIEPK
 M4Zkmbfs4tmeFTGgw/lSOgg5ftfJI5gvPCGdrt69btxgwIaX+US50khMCG+QC0VGQJg==
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548893f8f.11.1725362432182; 
 Tue, 03 Sep 2024 04:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwpteDh/jYV60lwH9EfcQ38ojTrOG4EYTUpYCdQn17HGXGrVhhlQh31XG3MTmZZx8V6M3Sw==
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548866f8f.11.1725362431651; 
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27364sm166897175e9.34.2024.09.03.04.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 14/81] drm/hx8357d: Run DRM default client setup
In-Reply-To: <20240830084456.77630-15-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-15-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:20:30 +0200
Message-ID: <8734mhgf0h.fsf@minerva.mail-host-address-is-not-set>
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
>  drivers/gpu/drm/tiny/hx8357d.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

