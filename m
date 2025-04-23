Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA115A998EB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 21:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1AB10E03C;
	Wed, 23 Apr 2025 19:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iDWNnVhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D7210E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745437762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CW5oobOQNyvvT3K29QIOTqiPjFO//Y6rbktPHRqNllQ=;
 b=iDWNnVhcMQk70Wh9M2BVDUQl4dodxX7TaYDB315wzRjV1nFwTrDbVa4di4R48p5W3DbU54
 oyKl8Dx0PYBCVJUfxuZ1E9I8u+6M3+R5KZ6uXpgra3wS42klsewHV1YYziUaWmWKBXdaa2
 +OQrOGBN5OaD0WwUYf5rElZgzDZRiBc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-feGs1VDeMniXVbqEOv2kWQ-1; Wed, 23 Apr 2025 15:49:20 -0400
X-MC-Unique: feGs1VDeMniXVbqEOv2kWQ-1
X-Mimecast-MFC-AGG-ID: feGs1VDeMniXVbqEOv2kWQ_1745437760
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d6c65dc52so1259975e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745437759; x=1746042559;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CW5oobOQNyvvT3K29QIOTqiPjFO//Y6rbktPHRqNllQ=;
 b=EhuPuz38gra3fhnoVX/C4Qw8QcBRiQZquk2L21exWmtr5jOuBoTZl+BJBCwOxnK3/g
 n/LyWowAi/v7ogsrTiIN+IYZOyFUo977ZMUhDTy30YAcsMma6kcHyahIPJzn0c69w72y
 Nthz5y0kd6KrYhmPWdnKOCIxX5hzGHeYWcCN1mSWgqpJ+4Ar3DDmb6eOiM99yUN6YJcd
 AfPjJ2uBboeGLBFT+wtW9L+wBaZOfa+AuAEpcrZ0E0lffu0RHlzDOsG1vF1MVCi93ryT
 vOubVyHRGmn/BZuKSKOcBbhtgzLOH3iG6SZz8ICp2vfTgRqT4/4/irz8vdpqT7eoIQdd
 xbDg==
X-Gm-Message-State: AOJu0Yz3tb4qpbYvt+7/UEWderYopHxcwd5pvjLdEBED3jtsPTT30oS1
 JwUrpb+merAeSw/D34zrtuZNyMvtN6kR+eFVuru7IxZhOqbnLzyCd2+kgPmz1y+gSvgo1v404nk
 9hbPBqep/eecMfbhmQOts4cLEHrGo6Dafr0WbsrUR1c0/yse2nDSCywkdo1kOzqy4fg==
X-Gm-Gg: ASbGncuUy7IU+Q15nHnPJGrEuwtnZmICJyLnSPZAdezHUP0teYrmAqA7PXUBKwfp7me
 awAEpmfAdDkLZsheEAghK+Obkufb/ZLqal6rBDAM4GOYE42MPWZOnD8XreuUuPIq3PyrrV9YQ9u
 6d0odL2wXTkbeU7YfB1SYPKuTvPjwRu3zrn/2rPAd3UsaZSEUWKpRHmOgt9gmky7gFOCmK4dq/5
 CrKQ4EUUVlKNUujsoqvuKzyRFWQYxDqvDn0bqxFizkf24M4ndIuViHUGFLJKmAB2S1fzwt5Pq/2
 n5dBlOWjvF7HbNuqoeZKYjpxVbdkTJnuCU+aSEVeJ2BhZGdPzzfR+e4P65nL+I+sBs6Yfg==
X-Received: by 2002:a5d:5986:0:b0:39d:724f:a8ec with SMTP id
 ffacd0b85a97d-3a06c43700amr713276f8f.44.1745437759701; 
 Wed, 23 Apr 2025 12:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6sbVUSbQlqX73+/VhkgOLOaiskfxeP/YLRaHmiCsxzKpxWGgR7NPA0wc62DOWcmh03chLAA==
X-Received: by 2002:a5d:5986:0:b0:39d:724f:a8ec with SMTP id
 ffacd0b85a97d-3a06c43700amr713251f8f.44.1745437759388; 
 Wed, 23 Apr 2025 12:49:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408d8d191bsm44033205e9.1.2025.04.23.12.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 12:49:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Zimmermann
 <tzimmrmann@suse.de>
Subject: Re: [PATCH v6 0/3] Add support for Sitronix ST7571 LCD controller
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
Date: Wed, 23 Apr 2025 21:49:17 +0200
Message-ID: <87v7quacaq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JaKTCyRQOfA_Td-WmXw40Kt1EAuWXc-0VdiMjkGYq8E_1745437760
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

> This series add support for the ST7571 LCD Controller.
> It is a 4 gray scale dot matrix LCD controller that supports several
> interfaces such as SPI, I2C and a 8bit parallell port.
> The controlelr supports both monochrome and grayscale displays.
>
> This driver only supports the I2C interface, but all common parts could
> easily be put into a common file to be used with other interfaces.
> I only have I2C to test with.
>
> The device is a little defiant, it tends to NAK some commands, but all
> commands takes effect, hence the I2C_M_IGNORE_NAK flag.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

