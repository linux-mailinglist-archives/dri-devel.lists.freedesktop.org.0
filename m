Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC9B0730A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEF410E787;
	Wed, 16 Jul 2025 10:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M1wuwmja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1092B10E787
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752661023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSG5PjOM1vuacWsSNMsK+egpHtJUvGDNlOP+EjzmQwI=;
 b=M1wuwmja3Y1iW4nLwLc4RUkCHy9PZ3HMligsAjDhgf3lC0LUA9B2ZsetiQIlpsoLMVIbg5
 cKEaa4g9rUfXNdDZMjdioe6f7x1Pyu6lESLtBzSt5BUOfzdyszURSCO+MwLay92rReU9El
 Qv5DcxV3FqEDjfF/Zm/iaHp8AHvnLRU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-fuOAtctNPHSIlVfuVvJkHw-1; Wed, 16 Jul 2025 06:17:02 -0400
X-MC-Unique: fuOAtctNPHSIlVfuVvJkHw-1
X-Mimecast-MFC-AGG-ID: fuOAtctNPHSIlVfuVvJkHw_1752661021
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4561bc2f477so19657285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752661021; x=1753265821;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SSG5PjOM1vuacWsSNMsK+egpHtJUvGDNlOP+EjzmQwI=;
 b=uyNomdKgMByFtsE794SQDRXgQmaOLgixIkxW3eCEA/2GX1zuZvWCzx732+TM5ZZQ3a
 NCFKdjidSNZ9oXtgQK8T+WUdw1TALz7vIjHPCD4c1dVKbNhuU7SyHlgh1hmszlOiTcsR
 XoIDJ0plluWz8JmiOC3+z3ZDG3D0wuQO8Wfd0C/p44yRts2Id65IUl1nxlL0DL9S0p1D
 pqX4G+wXNeDS3eAss6dlZ2SKxjCdAXUU8rv7s3rHhfh01exqty7MBzf8INUAaONyCuG4
 HIkA4uyAO95LsIWO/MUBqjTo8STs/1z9VG4L1R4raEM6+TceYHLL2bexX+X7emwCmY/B
 +gyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfEActQ7h9cuQ8XJeKYeDMee5yRDhJdxBL9963Si1onDDzwexctX4r7cbmiYbEesT2PL1Qphb9dXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoqnvdnjbj5D8rAXYge6mDYyGduEVoC3xIp/46xO6M9BN+Fo3p
 WA+6VP0pHjsWoQgDqlfy73EigEH44oUjw7t0XuKuo3VnPwPL3veFEvypoK1naFP9XhzlIU/e4wZ
 WjZepxz0OScqbofePzueSIxLkONl6YoWk8eYN4Vgbmf00ULW2zYc7GY0zuasWne8CLK6qpg==
X-Gm-Gg: ASbGncve+UZGj0c3GDlcUTQ457MEW0uKuShCDVgHgddGNyFqFUFz+6wnJ3bISt/7kkJ
 sPZqQYciQ6LYBtsLE+ssgMquqkQdML1XGfStpwGfYvPNyU2UGuUd2Gn21iED7Ta4eA+tyRlfWfl
 Kj1X9DUJRq389MlLNP4/3nXHrrsU0X8Gmy4M5L+h4c16rRKbzo2IHLhqL7is2Ac3Y5WJHSuxUCA
 zd1Dzee3+SRP5DI4pr79C37TCA01SLGI2ZLQ5Z1aX79oB6CcmJ2F2IoeWrE5jkU5UvWxwFdSglo
 GB4dvMUdXibi6Kkr0xaBlpAHAAujqXwOq705GPcWxre3EiHGodcbo+DFSF2ACXdSZw==
X-Received: by 2002:a05:600c:3b29:b0:456:2ac6:cca4 with SMTP id
 5b1f17b1804b1-4562e34bad0mr20159195e9.13.1752661021211; 
 Wed, 16 Jul 2025 03:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXeNswO26008TyCVbd1BrUc5pJw0QJ11lHj1/vBSnGgP+du3DSrXSLyMDTcfCk1ml8cEQtJA==
X-Received: by 2002:a05:600c:3b29:b0:456:2ac6:cca4 with SMTP id
 5b1f17b1804b1-4562e34bad0mr20158905e9.13.1752661020728; 
 Wed, 16 Jul 2025 03:17:00 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e82cf22sm16587455e9.26.2025.07.16.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 03:16:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Conor Dooley <conor+dt@kernel.org>, David Airlie
 <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/5] drm/sitronix/st7571-i2c: Add support for the
 ST7567 Controller
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
Date: Wed, 16 Jul 2025 12:16:58 +0200
Message-ID: <87y0sobftx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uqHrygfy2h-xORqaINAnHd0lHkmxJ4wnCidtO81VVSo_1752661021
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> This patch-series adds support for the Sitronix ST7567 Controller, which is a
> monochrome Dot Matrix LCD Controller that has SPI, I2C and parallel interfaces.
>
> The st7571-i2c driver only has support for I2C so displays using other transport
> interfaces are currently not supported.
>
> The DRM_FORMAT_R1 pixel format and data commands are the same than what is used
> by the ST7571 controller, so only is needed a different callback that implements
> the expected initialization sequence for the ST7567 chip and a different callback
> to parse the sub-set of DT properties needed by the ST7567.
>
> Patches #1 and #2 are some trivial cleanups for the driver.
>
> Patch #3 is a preparatory change that adds the level of indirection for the DT
> parsing logic.
>
> Patch #4 adds a Device Tree binding schema for the ST7567 Controller.
>
> Patch #5 finally extends the st7571-i2c driver to also support the ST7567 device.
>
> Changes in v3:
> - Fix reset typo in commit message (Marcus Folkesson).
> - Explicitly set ST7571_SET_REVERSE(0) instead of relying on defaults.
>
> Changes in v2:
> - Use a different parse DT function (Thomas Zimmermann).
>
> Javier Martinez Canillas (5):
>   drm/sitronix/st7571-i2c: Fix encoder callbacks function names
>   drm/sitronix/st7571-i2c: Log probe deferral cause for GPIO get failure
>   drm/sitronix/st7571-i2c: Add an indirection level to parse DT
>   dt-bindings: display: Add Sitronix ST7567 LCD Controller
>   drm/sitronix/st7571-i2c: Add support for the ST7567 Controller
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

