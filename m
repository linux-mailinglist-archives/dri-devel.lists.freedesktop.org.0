Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B055DB03C6F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF04D10E456;
	Mon, 14 Jul 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OA4/Huoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF9010E456
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752490163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yyAlKBmaunFz8ZQhBWMNPAv1OQI+eMdSmuzjRTl34ZM=;
 b=OA4/HuoqPbjxTubOVKoVCJk64Qe2dlhKL0PjOIifjs6auB5a9JoNT6I6qIS89Mf/KkJ3Qk
 KDevA3M51bMSaR5n8UkYQheg1OkV4OfbMBSv4cIuuVfcQHn/V91aSWV3dDkyhxYuif3XCr
 Ef7QXHS8qk4IlaW0AVoPNSPMfs6BLQA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-y7vMrgJLNJCEwWnhsPREqA-1; Mon, 14 Jul 2025 06:44:37 -0400
X-MC-Unique: y7vMrgJLNJCEwWnhsPREqA-1
X-Mimecast-MFC-AGG-ID: y7vMrgJLNJCEwWnhsPREqA_1752489876
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso1833347f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489876; x=1753094676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yyAlKBmaunFz8ZQhBWMNPAv1OQI+eMdSmuzjRTl34ZM=;
 b=MF6418yVELitfB+RktKQSg68Em5BiwWPfzbMnvR+a5HmgGmbx4jY9YFd3NlJLwIaI+
 a24oSsnuV1IaYbuj744qkePedDVcXXIgClFE2nX+raswFjhHjw64CT4m4l2Pt/WAims6
 QWRTQ028OxnbR7JPddoMjt6dgQIxab5Di7z7PnRUgii4+jA6U9ibpmU/03Gb0oIbRrMi
 Q0EgYO75b5OKVYAEu23WymFAzcs2v3xTLiSAVSTSF7gnUlrvhU8dy5QR0KyRXYgFg5rx
 c9k3lsGBHWJosUf5x9Vws1sDlT5XWBmMAaVAFLvxZaM9nbW47lP/0FMB2oEk9bwi1IZD
 wBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwSi/q6LSStdZMkTuy/ZIs7yEYDt9Nngf5QVnwRKNoxK6v3jhl/kCUBZ6JK25PpuM62tY2MNkToQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxMGgu9lY67+6w8nTuXtZ6IWJYjJQQ5ZJlEB8ITmDZXGH0lHJ/
 Nsb5DX+RXuJTdGWa7nqmTOmYyHEn/kAGipFOZQKkirskVr5hIP1wwuxclx8ZC/g/bylCRZMKE4x
 ugDtRXDitAEfQ8njzny4XUgyt2y+IQC/aRR6KvUPHPXpk4wwKHIlfk/+T3kPbWbpTCBvnfg==
X-Gm-Gg: ASbGncvBJkFqoNQwXMhCRZ1i/nztnpKAmn1rlpSdiRMsz8yj8bGlFqfmt7Mvk6Bx8tn
 RErUynlzI8uT/5TIrXACjaqIdOLE5gqDgjjP9ldP6HS+4ykoP6EN/psVoFqOIMwOR5sg2jcn066
 yM+G+1xPR+Di9Q8aFxOn6zZbcbFAvsey4yblICygN19HyXknYWv0UyaDdYImq278dc4XIVjUwwq
 QOC6ZA6TKhi5XMFSBjGPAwRdpD9LJ/6TOvv1Q01cGs0b99a6igCBsmNNvwkc5uKu0IJmGRuxj14
 NA2/435+3t14yHD/5mokL6BJD5v9+Wzt
X-Received: by 2002:a5d:58da:0:b0:3b5:def6:4b2 with SMTP id
 ffacd0b85a97d-3b5f18d975cmr10641413f8f.45.1752489875944; 
 Mon, 14 Jul 2025 03:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHndWVX2/3i6ySGFYkMs+g/Veyvvo3m6eT3vBl5Tmlx4cdn8hhICuraqnULOXZmnGxtJAOd6g==
X-Received: by 2002:a5d:58da:0:b0:3b5:def6:4b2 with SMTP id
 ffacd0b85a97d-3b5f18d975cmr10641383f8f.45.1752489875477; 
 Mon, 14 Jul 2025 03:44:35 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd15bfsm12317589f8f.19.2025.07.14.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:34 -0700 (PDT)
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
Subject: [PATCH v2 0/5] drm/sitronix/st7571-i2c: Add support for the ST7567
 Controller
Date: Mon, 14 Jul 2025 12:43:59 +0200
Message-ID: <20250714104421.323753-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tzN3cybSMmLAr6bCZHbXRt41zeX5Yo4tFkdTFY7LCkc_1752489876
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

Changes in v2:
- Use a different parse DT function (Thomas Zimmermann).

Javier Martinez Canillas (5):
  drm/sitronix/st7571-i2c: Fix encoder callbacks function names
  drm/sitronix/st7571-i2c: Log probe deferral cause for GPIO get failure
  drm/sitronix/st7571-i2c: Add an indirection level to parse DT
  dt-bindings: display: Add Sitronix ST7567 LCD Controller
  drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

 .../bindings/display/sitronix,st7567.yaml     | 63 +++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/gpu/drm/sitronix/st7571-i2c.c         | 94 +++++++++++++++++--
 3 files changed, 150 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml

-- 
2.49.0

base-commit: 8f80b1d66f927e818e5205fccf572b2adc5e318b
branch: drm-st7567-v2

