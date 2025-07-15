Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FB0B0585A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFDD10E373;
	Tue, 15 Jul 2025 11:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JZRFEP2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E5810E373
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VWMAjYtNhkJh5mbP6XrZahkgyK59U5VmPrOphqHUics=;
 b=JZRFEP2iJW9zU94AygJ50tsjfZs6e/I8/FxEaPGfAJsmPuktevUMAnd9yx7s2/b8+HAs2D
 XjoyYc7GgEtJrJGKMHcr19Nv9dX6sQYLs+xGjBh8oAqNe7NjOOvCyufoBhVWu6ijIjnaFM
 +IXKgBisiTKULr+LEvQDsKz3GCqzy7I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-RQhupvaePJ2ihYA5sv2OcA-1; Tue, 15 Jul 2025 07:04:50 -0400
X-MC-Unique: RQhupvaePJ2ihYA5sv2OcA-1
X-Mimecast-MFC-AGG-ID: RQhupvaePJ2ihYA5sv2OcA_1752577490
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f8192e2cso3015829f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577490; x=1753182290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWMAjYtNhkJh5mbP6XrZahkgyK59U5VmPrOphqHUics=;
 b=iS0rZXX31+rjuntCe8EPwWzIuK94itJdo4M4PuSz7y2ekHdi7NHbxIGq4m1vk6sKJB
 58AhizeCpqpdMn8MOKhLl2gKpqwe0llDIF64Cxf/dIW/V1jMKXnUyUWGL7TbQpjkKQBv
 7OiXI1L+iuVZcgGOFlDiySiMLuGi00th/VTQfEQj2c5N3fWFa5moGx3YBeGQrhOhCXFE
 dFHDhRyOm3lIoMoDqM/RkPlSVDMu7zdK/k+Ga7+LuWAikB2xwUYizX0f7+/ZOXw9f47l
 PS8jXdgAr+9lp2922cg628JLi4rGSqK8FomMINVumpssWwjBWzBrQT5yuzNAQkp9c9AM
 iXXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLVUtp9TXAcxtm27cHhodX1unJlllR/OjP3Z4EYyCJomRjiHxLIhcrLJ1w5TvdIFQPZEDfEFTvcl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJRWGfjuAYqqlkSnxuJoqSjXkARf2T8037Y+3dMqguMWIavW14
 sHG9/AMcp7E60+Hma2Ft96J+B55Osl0kKCt9UcUZqLnu7OuO5Ha7+MCrM3SBvrlQU/dPKSX9w1h
 z8p2MiZ36XGpeBHT7/4s0e7kDLO/yb5hrOrPuWSArQYY3j0BoOAWt1MDqlJsR8vUxQzRs0Q==
X-Gm-Gg: ASbGnctMfpEnzjFM6N0qR/IYin6+zNg+GxeSWa/HM4A5gOZnRtjJU9o+Voo2hiuItTl
 ZX7OD0n2s/IoLXqbLgO++YdpCezJ+YBCBDjJp6BqhlRgCFpa5earGojPRYft+K/7Uv4PU2NYass
 rwZxhRj77XAqwSl1GVUowAWgCtdTFni5tJUkibkkv2j6BgXJlM9C5bvmRASYChUNRevLO9Y/vQ6
 zSb+DhvPKEvQ5G6vz5djSXKhPpDCmmnZH72ChcjuIaFymOGpMRWkz0LkRCd7gk47iUrR6mAVCyJ
 xtr21Ycp1iTkwTRuUeSvu8CldJn6fw9a
X-Received: by 2002:a05:6000:2003:b0:3a4:fc07:f453 with SMTP id
 ffacd0b85a97d-3b5f2db184cmr10464896f8f.8.1752577489612; 
 Tue, 15 Jul 2025 04:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl07y9vuHH7yDtGi3ONbzAtFfjZ48gg7A4ezv99KtO+nnd+7i/98kznjmeFhZWjFWsfGpUhA==
X-Received: by 2002:a05:6000:2003:b0:3a4:fc07:f453 with SMTP id
 ffacd0b85a97d-3b5f2db184cmr10464856f8f.8.1752577489121; 
 Tue, 15 Jul 2025 04:04:49 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d732sm15109798f8f.52.2025.07.15.04.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Tue, 15 Jul 2025 13:03:49 +0200
Message-ID: <20250715110411.448343-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4ZAS2j9clgwiyi_Zc-LG_qkT8_8vdL1JencYpkxYljM_1752577490
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

This patch-series adds support for the Sitronix ST7567 Controller, which is a
monochrome Dot Matrix LCD Controller that has SPI, I2C and parallel interfaces.

The st7571-i2c driver only has support for I2C so displays using other transport
interfaces are currently not supported.

The DRM_FORMAT_R1 pixel format and data commands are the same than what is used
by the ST7571 controller, so only is needed a different callback that implements
the expected initialization sequence for the ST7567 chip and a different callback
to parse the sub-set of DT properties needed by the ST7567.

Patches #1 and #2 are some trivial cleanups for the driver.

Patch #3 is a preparatory change that adds the level of indirection for the DT
parsing logic.

Patch #4 adds a Device Tree binding schema for the ST7567 Controller.

Patch #5 finally extends the st7571-i2c driver to also support the ST7567 device.

Changes in v3:
- Fix reset typo in commit message (Marcus Folkesson).
- Explicitly set ST7571_SET_REVERSE(0) instead of relying on defaults.

Changes in v2:
- Use a different parse DT function (Thomas Zimmermann).

Javier Martinez Canillas (5):
  drm/sitronix/st7571-i2c: Fix encoder callbacks function names
  drm/sitronix/st7571-i2c: Log probe deferral cause for GPIO get failure
  drm/sitronix/st7571-i2c: Add an indirection level to parse DT
  dt-bindings: display: Add Sitronix ST7567 LCD Controller
  drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

 .../bindings/display/sitronix,st7567.yaml     | 63 ++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c         | 95 +++++++++++++++++--
 3 files changed, 151 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml

-- 
2.49.0

base-commit: d5ca45b508916144d1e8be1102bedab405c1f6fb
branch: drm-st7567-v3

