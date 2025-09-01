Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D095DB3E615
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87B910E462;
	Mon,  1 Sep 2025 13:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jj6nH69F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6A10E462
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756734703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rNZv88G48kGiSTnEe1GdQJytPUc11wW2bIHAr97ppkA=;
 b=Jj6nH69FGOXVX8BPjs4OffGuxoHlql6a8z7o/iYwgVjW7o7Q7JN0DvQ10o+l1l+S/iFfN7
 dFErF8ETdvtaK6JYWtjKRFDZjHjjidqGtt1vbeisUiQk/fRY6Xy26yeEQ5SUFxLRpaY8FY
 /kvAgu2MzFCvq0MSxw6RwGMccm8rvgU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-wNzzEV9MOU605carqRNXMw-1; Mon, 01 Sep 2025 09:51:42 -0400
X-MC-Unique: wNzzEV9MOU605carqRNXMw-1
X-Mimecast-MFC-AGG-ID: wNzzEV9MOU605carqRNXMw_1756734701
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b8b7d66adso6247705e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 06:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756734701; x=1757339501;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNZv88G48kGiSTnEe1GdQJytPUc11wW2bIHAr97ppkA=;
 b=k/4CE9CWVTSVMjB5oTPENCIQYFG+vXsCTQWpohbceURTEzqNbvdOn9s8CxcmZiScBA
 VqsEasLcXmre/SkfNfDxcREkTYk2pgD9OMotOfD5ttWzkhiDVRi66YeGBzEoVwOMY0M5
 74SZvZ0tjGbx7Zd+Rexu6BZT7h+HhuOGIrewkZPPAdAoHYPv1P1nhprNpmSzM9Tr2TDT
 oijH9SXKf2JdskH2SNQudGwxAjtUHRrFuFWOQsSzv0HF0k3WTmrVAuxOp3lrKZMsq4W0
 6vLNtVgM2lHoUUS/tz9mlRBquPcaDSQxh0a24p+aYNQEHM2Tout79pstnOc99Oiqycdb
 b1JA==
X-Gm-Message-State: AOJu0Ywu6D5DYav/A7PHRXcF4e0zm/gwRIo03hhDNszH1iTUN1whrwtl
 2TmaXHTHh0aQoJZF3smmimMBml2zmlYRJ6Xh8OtLbDdoIr6Lea6j1e1vEZrVc2xEk/pNp20SZYd
 cv9IztoOi3lo4CmHqE//DgRpNnyD3BBMc7PyEer5Woefz7oHXB2nd2qiUDjAdJmD9ITY3Sg==
X-Gm-Gg: ASbGncsJ2NkMxVZEN8IoTQrRw/rvzXNaTUELpnAVN535/MbCoeph583XCV8HkFvnSJn
 xu9ubZ4t1vKcCOrSFnHpxI9s+qoKyVZLcXI2FAUFnvr7IGY/giqQvUOgLKF3s8AVqHFGqLEQWCr
 MqTQxUQzl6l4n1f89OlbhvnW/IEof+Wu2nHdVEaVkivcxAiwMp5cinPZ4HUXLafYoZNQa0I9F+c
 5ufhJWwDJ1G5cov60tixhkH26s99vibekuEUgkA7bpmYXQbyz60vkfPmyf5DOFQuXAJWZOM/7gG
 PJV389/zFclhi2HrtubNeqnvoxZRPBMpWnjsPMvwSxj8h5MkIA1IYG4KtwpAHTunJw==
X-Received: by 2002:a05:600c:1f08:b0:45b:765a:a8ff with SMTP id
 5b1f17b1804b1-45b855333e7mr70346995e9.11.1756734700957; 
 Mon, 01 Sep 2025 06:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZG5ym0+uvSyAKRRTSIKOXFShFsslOTmvomyIF3wBHiI22R5u0tBS4cfbprR0gPfxuAplifw==
X-Received: by 2002:a05:600c:1f08:b0:45b:765a:a8ff with SMTP id
 5b1f17b1804b1-45b855333e7mr70346775e9.11.1756734700463; 
 Mon, 01 Sep 2025 06:51:40 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e68c83asm167467245e9.20.2025.09.01.06.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:51:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v2 0/6] drm/st7571-i2c: add support for grayscale xrgb8888
In-Reply-To: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
References: <20250721-st7571-format-v2-0-159f4134098c@gmail.com>
Date: Mon, 01 Sep 2025 15:51:38 +0200
Message-ID: <87seh6ffh1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aKYDQvs79kT6IeooJQB2VqnFa95WJpusbZXlirTpPLo_1756734701
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> The goal with this series is to add support for 2bit grayscale with
> the xrgb8888 pixel format for the st7571 display controller.
>
> The first patch only corrects a comment of the pixel format.
>
> The next four patches adds support for inverting pixels. This is
> necessary as the connected display may or may not use the "right" (0 =>
> black, 1 => white) pixel format expected by the supported formats
> (R1/R2/XRGB8888).
>
> The fifth patch adds a helper function (drm_fb_xrgb8888_to_gray2) to
> convert xrgb8888 to gray2.
>
> The last path adds support for gray2 in the st7571 driver.
> Compare the mono [1] and the gray2 [2] variants of our penguin.
>
> [1] https://www.marcusfolkesson.se/gray2.png
> [2] https://www.marcusfolkesson.se/xrgb8888.png
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v2:
> - Do not share code between _to_mono() and _to_gray2()
> - Correct formatting (remove  "|") in the dt bindings
> - Implement support for inverting pixels for st7567
> - Link to v1: https://lore.kernel.org/r/20250714-st7571-format-v1-0-a27e5112baff@gmail.com
>
> ---
> Marcus Folkesson (6):
>       drm/st7571-i2c: correct pixel data format description
>       dt-bindings: display: sitronix,st7571: add optional inverted property
>       dt-bindings: display: sitronix,st7567: add optional inverted property
>       drm/st7571-i2c: add support for inverted pixel format
>       drm/format-helper: introduce drm_fb_xrgb8888_to_gray2()
>       drm/st7571-i2c: add support for 2bit grayscale for XRGB8888
>

When applying I noticed that patch #5 had the following warning [0], but
I fixed it locally before pushing to drm-misc (drm-misc-next). Thanks!

[0]: CHECK: Alignment should match open parenthesis
#86: FILE: drivers/gpu/drm/drm_format_helper.c:1415:
+void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
+                            const struct iosys_map *src, const struct drm_framebuffer *fb,

CHECK: Alignment should match open parenthesis
#153: FILE: include/drm/drm_format_helper.h:140:
+void drm_fb_xrgb8888_to_gray2(struct iosys_map *dst, const unsigned int *dst_pitch,
+                            const struct iosys_map *src, const struct drm_framebuffer *fb,

total: 0 errors, 0 warnings, 2 checks, 125 lines checked

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

