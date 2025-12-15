Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40663CBDE9A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ED910E492;
	Mon, 15 Dec 2025 12:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rz5QyBm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04910E492
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765803452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJPuhd80iTSF+OO5gKXbsXNzHvhZFugxRejPAvwRung=;
 b=Rz5QyBm+K+0+l3L1xuDFCVO92hj/on9ncRDU998YPlK/iMuzNYvKWUpYLq4hoXchfHkgCz
 q5BnK0cmSA+K6nRi7+98ypIJ6l3ZGPtMcxMq0fvlUBd4H26VAUi89Uv4xsi3Y6xA1+QzyR
 oW0ba/wgsr+ZaZBNVtWJJT2tVVsVDAI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385--2DqiC2COlGSDQQ-8sqalQ-1; Mon, 15 Dec 2025 07:57:30 -0500
X-MC-Unique: -2DqiC2COlGSDQQ-8sqalQ-1
X-Mimecast-MFC-AGG-ID: -2DqiC2COlGSDQQ-8sqalQ_1765803449
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430fdaba167so468431f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 04:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765803449; x=1766408249;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJPuhd80iTSF+OO5gKXbsXNzHvhZFugxRejPAvwRung=;
 b=Kh2eRqyoigfAxh1eTNhMhG3+idwFoCZjBOKi1lYsiGeK55KOtTCwqbXkba1BvPE5AQ
 5wF86wRirspDZTdAv1T+jycsYo2mmW48zEAYIjPa1ut9RrmYVIlxzMatPngcwnilENw9
 +TXKBkk0M4KjAk9Jua/vulr/jOS/ucLQeQJxPXopu9KZiCo1K7qo6X2wsXb+km4Q6tGF
 2KuSKJWycfKx4ORyPwSzAy1XTK9ynWCYH48wpas95m6BRanAzzbCPwQUzj+3owKT+jsw
 R/mIttuE073LRZ48izA1otU/HSUg5WHve4MMIJa4d4tLIIz5huGh9koT47MypnHc1Ezj
 1JDg==
X-Gm-Message-State: AOJu0YwO8Qo06EL4VEVdZmJz9xSAAFiJ8+FgIWnaEsmDRZcbokO9m/yr
 zl/caZ8XrxlX7IjLOTksWwWMHLzohBdcJFiRiWS8xfe2qqIgz0td6reE/cP773CLYwL7aL/kBnh
 uyFUJzaCEwKQv7Zn8rIOxUHv6isO0Ci9siIXRMGOSYTIvRs+k7dhYPMlY5EcPP6K8vBD2zQ==
X-Gm-Gg: AY/fxX510aRGZj2AoNauxH4hUuz/TM558+UYfeQ0MMj9GK3+0pbzwKkTAW1ozfhVvgS
 J/R8n/AZ7IsVHGRx4p+lCod+TLdfAc7S2U/J2INFc/O5fVqhF5OKFj72kC/5LLJu9YPxQWJQYl/
 SwvYP2QqzuDzwqWyTZ69RI+8qdUSiNZpwv1GeA6wNm6P80JqSEXWN0glHt+mRzsXUD98XNfHxQU
 uEATUjw3BnLxslbKjqPPDPHduGQbwEpEEZz3x+JwHANkbSDw2hA5BISW0YOtlfY2DjFFww7OC1m
 OVEnoUuq5GUorhCcTphx0Dkj2F8sV5QD+ZlgeMjHIYiIKL7R6a7yZEbHJ2SpJteaZDyXK6Eu4xn
 iLd7qJho+RiZPMVct1aYZ0zf0CDJSvD/gX+JEChYEHKwt4ytYn7b/FXF0VFZEfMEp/PfGNU2w61
 Vp+s8=
X-Received: by 2002:a05:6000:2f81:b0:42b:3062:c647 with SMTP id
 ffacd0b85a97d-42fb44b7718mr9423847f8f.21.1765803449371; 
 Mon, 15 Dec 2025 04:57:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5Zv0vhReJo51vrrwa+7wzPN1PGO8Bh6Thhn0xc2h920KOWnaqhooUP4kpjy6aaSzbAIad0Q==
X-Received: by 2002:a05:6000:2f81:b0:42b:3062:c647 with SMTP id
 ffacd0b85a97d-42fb44b7718mr9423809f8f.21.1765803448948; 
 Mon, 15 Dec 2025 04:57:28 -0800 (PST)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net.
 [159.63.51.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16734579f8f.15.2025.12.15.04.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 04:57:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v3 0/7] drm/sitronix/st7571: split up driver to support
 both I2C and SPI
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
Date: Mon, 15 Dec 2025 13:57:27 +0100
Message-ID: <87tsxrkimg.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hm8xPEYo9lj0yUhqGL_nOutcMKJ65wXz9xs_Pin9V98_1765803449
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

> This series splits up the driver and finally implements
> support for ST7571/ST7561 connected to a SPI bus.
>
> I've not tested the SPI interface myself as I lack HW, but the
> implementation should be okay from what I've read in the datasheet.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> Changes in v3:
> - Add SPI example to the bindings doc (Thanks Javier)
> - Select REGMAP rather than REGMAP_I2C (Thanks Javier)
> - Fix gramatical errors in patch description (Thanks Javier)
> - Link to v2: https://lore.kernel.org/r/20251027-st7571-split-v2-0-8352fb278d21@gmail.com
>
> Changes in v2:
> - Add MODULE_IMPORT_NS to st7571-i2c.c st7571-spi.c (Kernel test robot)
> - Link to v1: https://lore.kernel.org/r/20251024-st7571-split-v1-0-d3092b98130f@gmail.com
>
> ---
> Marcus Folkesson (7):
>       drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
>       drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
>       drm/sitronix/st7571-i2c: move common structures to st7571.h
>       drm/sitronix/st7571-i2c: make probe independent of hw interface
>       drm/sitronix/st7571: split up the driver into a common and an i2c part
>       drm/sitronix/st7571-spi: add support for SPI interface
>       dt-bindings: display: sitronix,st7571: add example for SPI
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

