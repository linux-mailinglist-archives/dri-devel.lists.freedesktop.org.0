Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF83969CD6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447F10E516;
	Tue,  3 Sep 2024 12:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GfW5DeWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F73710E518
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fiZjoQDP1pxCas9l8KljpRaPLENWaMi4jehrGgSlHU=;
 b=GfW5DeWDVxyvbAWI3bUIbl38jc3c3i4YaGKNebkHH2yCE9zGRJmsPCMGq3CHDyoQQraDuD
 vfoSQ1oACcZqcaqoflTO2tAPduXi2pLODaTecmQ9UzxpVG2smU3b0/dUG7iv1YvFxbR4PT
 9TZs/OTqp6mLyaWNDSWbrBqjCeHTDaw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-ZwqN4rxNOVilgeKiHsN2kw-1; Tue, 03 Sep 2024 08:04:20 -0400
X-MC-Unique: ZwqN4rxNOVilgeKiHsN2kw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bb9fa67d7so50433285e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365059; x=1725969859;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fiZjoQDP1pxCas9l8KljpRaPLENWaMi4jehrGgSlHU=;
 b=hyT8TwXPtayivyUkfjpsKY+Z3kSnP1kLlpNSszHf1hgU9T+qME/y6Xsz1pT316ON0B
 1L7wvwiqaSIQHPXOhHwgJxwrSxLh0HJkQQt/ukTmnA9R1U149TIN6RUpgvU/jPhd5MDY
 kWqsJQMk/8kVS3ka5hPk2HNjK8Qe+gBRsCPyH4zeYfiuh9X3kXQV1HUIdPP2qPTltlqb
 ZVI+DYgktT1h8z1qPxFLsPfGFET1lPNCbDHQqNtyOIkVJKSiOE6R5P006NPMa3iIgONW
 W9PsvNgqnVfkURS82J78FyhaMbYlAWVPi4vpOiDrSw6BXWpu0UWP56woNkeamwnXvY8E
 ldJA==
X-Gm-Message-State: AOJu0YyFWHO+2Tc2VX0K0idu7IeQNoB094RQhXGFkOqHjv5e5szpPfkF
 78i0QFL7cP6o4FrtTjCOGFnKHV2DfvUSA4e27dSx7Ddhz0ye8kJCbyLGB3IyY1tdA3rr3lypEIX
 41cdQOgheiqVSv6JTYlFK21kpC3taXS+qhk9yC34wJO/OI21bX29Ti6PmK4paxfp9Pb0gZ1z2TA
 ==
X-Received: by 2002:a05:600c:474c:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42bb01ad776mr149399595e9.2.1725365058833; 
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAsxohFpaNmRsPtig4vIEqTLLJJ6A9qw2cCf0dEsQNkZ8aqk53IDxglqBJcoW1INXcnXT9w==
X-Received: by 2002:a05:600c:474c:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42bb01ad776mr149399315e9.2.1725365058397; 
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbf00e095sm129587485e9.13.2024.09.03.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 63/81] drm/fbdev-shmem: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-64-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-64-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:04:17 +0200
Message-ID: <874j6xdjum.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_shmem_setup() is unused. Remove it
> and its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_shmem.c | 120 +-----------------------------
>  include/drm/drm_fbdev_shmem.h     |   6 --
>  2 files changed, 1 insertion(+), 125 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

