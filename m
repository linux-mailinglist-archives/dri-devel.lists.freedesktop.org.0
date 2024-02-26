Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255286733E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC2210F0BA;
	Mon, 26 Feb 2024 11:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="agq/r/qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E14210F0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708947375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiM5Ab3c2YEsIuh7FkITwyub7eTq27XaCaUZGe1oNzY=;
 b=agq/r/qkrXQe415xCLlATdnh/ZXkSWgB7aWgPMZTK0vvQX4x5oBMwQitQIOkuaSIBzqq+f
 dWSYOEAgK4648faqQjb6kVgzyflw/lQAcEfo4NCUr1/DQ11Qn9kgJL1Hg1BQZ0oZWo11tC
 g5me/rqPuIL4M+w8/CVobZ0gywaJj4o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-M9CB9ksJOHyhzWJxt3dsEQ-1; Mon, 26 Feb 2024 06:36:14 -0500
X-MC-Unique: M9CB9ksJOHyhzWJxt3dsEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41294023627so14250575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 03:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708947373; x=1709552173;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiM5Ab3c2YEsIuh7FkITwyub7eTq27XaCaUZGe1oNzY=;
 b=O3+QtI/3OXGWp5t/kDGecODU81u12n/UixjdtmBYieb/pXIwj7Ll/XKYO3TaHDbUo5
 Kn0ZLBWfJkPO2kxthgZYXqBXe1Vi6Wi3yU5UwD+naz4Ais5i9DWqf5w5zUbqzDBTBMbv
 GW1fbSdpR0m6RGD8aamqsDGjnh5uIFXTyHArnMYN8roUH1AoUdhiu0rnt8JIL/6p5VuV
 jH4F+bXJ3yYgtiZ7Rxs/aqupiSWIDWE06SLYVZlBJ5nRKmA4zNZti4kRtfcPMgmwJauV
 TZ3+ZL9MucRZB0tRHo+nPUm59+vIicSfIGxytKrJTHqTgULoFK0PIG+hGuE3LWxFM0F3
 q48Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMt1PKRBJyvI+F8ZVuBNJkUKlWA9mhI6zy1QQ2J5fLQz30pNeslibysIoHQW7gls69eoZy3bRZ+0rs7gFAHoW18+Ixdp+BAPreUP0NDuM
X-Gm-Message-State: AOJu0YyILuiExJORHoC1oO8mwZE0DLUj+JG+IJcQXHUw18y7ymPxgxE/
 M7bYwtfYfA7wWkFMl3g/dlJ0alCYYnX/+g/TNDiOSho4x+dmiFhESnyW9luuGOZ6/3NoOqYqlZH
 JxxS3FNq4t9ny9z7yX/qVVdjsEVHxRipD7aBa3oe5wz4a8iYDuoSEExruwT4evGfauA==
X-Received: by 2002:a05:600c:3596:b0:412:a6ee:f02c with SMTP id
 p22-20020a05600c359600b00412a6eef02cmr1298482wmq.41.1708947373137; 
 Mon, 26 Feb 2024 03:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR/9WiyuxbOSRTdu3HNLiiES+3vcXjXufzWFFoCAwoJviZIRa7spdFpP/3r+pUPyCBAYYA8A==
X-Received: by 2002:a05:600c:3596:b0:412:a6ee:f02c with SMTP id
 p22-20020a05600c359600b00412a6eef02cmr1298455wmq.41.1708947372688; 
 Mon, 26 Feb 2024 03:36:12 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b004120537210esm11694435wmf.46.2024.02.26.03.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:36:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
In-Reply-To: <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
Date: Mon, 26 Feb 2024 12:36:11 +0100
Message-ID: <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
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

> Hi
>
> Am 23.02.24 um 16:03 schrieb Thierry Reding:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Tegra DRM doesn't support display on Tegra234 and later, so make sure
>> not to remove any existing framebuffers in that case.
>>
>> v2: - add comments explaining how this situation can come about
>>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Makes sense as far as the aperture helpers are concerned.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

I believe this is drm-misc-fixes material. Since the tegra DRM will remove
simple{fb,drm} for Tegra234, even when the driver does not support display
on that platform, leaving the system with no display output at all.

Are you going to push this patch or is going to be done by Thierry?

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

