Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACA7BE993
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8978110E2B1;
	Mon,  9 Oct 2023 18:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340F310E2B1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zsxGVSfsuhfbNcHVttLtmT7ohtovb+UILcIo39l8Suw=;
 b=GhX2r/APXfHtK1nWxepc7lBspphQvNRdQxTAUz0u9Ar0+/9IJNRj+FC650hWwz6QtbCULS
 DXMeKZmJ+GCiHZCtFyFdjFfhhI5Zf1tkzLOBMwf4VkarXddK+pvoUvAYPD8LC53lWiTCSY
 aCYAkJBObAaYKLMRBe8uC7oMJJYPw0s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-8tBVCf9zOImv4DOW12xfVQ-1; Mon, 09 Oct 2023 14:35:59 -0400
X-MC-Unique: 8tBVCf9zOImv4DOW12xfVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32172e3679bso3412761f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876558; x=1697481358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zsxGVSfsuhfbNcHVttLtmT7ohtovb+UILcIo39l8Suw=;
 b=RlfLBGZHYB6T+Q/Ra9yA7PFJRXZ+rd519Is2RVu+Kj6+73Ka2ssqiTQ34dHciYT5Cw
 X8PipSZgnoB1m3Rf4ItXff2C+wDPeOjJn801hyNOG51HKzF/NrOC5qJLletwJQVVvzG/
 2Wu0kcY67JuiRYUDpxaJBboa4sUntft2epy80tF7YhG+bh8GB2qJC9/4d8dGNZ7Whd/z
 Yv9EFco9j2HQdJL9JzHfsvL7AltJoQqCKOarGGhXXAOnLlxoXtWB0wnmQVA7ScyhpPrd
 U+AjXVp2TpwONxU2OngRfFxdPM189L89RbFkjhXPDmzlyPFj/LdkFEtWbdt94pkplfmN
 RoXg==
X-Gm-Message-State: AOJu0YzEV+u3/RAWU91JsoP5pvIfHRBKSpcv50u4VoFS4aavfYwB61xQ
 UmM8buTz0Txtp2Je/DtI8y2+iHhLUXSrXY7+A+rUCfUpF1nnpzQWLpIewnJqLL9qLu5gGhhztsl
 wUYFc9T94fNfUDQT3CT0c/FVCoF3l
X-Received: by 2002:a5d:46cf:0:b0:31f:8e7c:6ebe with SMTP id
 g15-20020a5d46cf000000b0031f8e7c6ebemr13528773wrs.5.1696876557915; 
 Mon, 09 Oct 2023 11:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+JcBXZXNGTEmKnDAtxnhtdraUNMsB+1F+EutebIzxSPaz9pa+gYUnBEZnCiXhnydilDCYXQ==
X-Received: by 2002:a5d:46cf:0:b0:31f:8e7c:6ebe with SMTP id
 g15-20020a5d46cf000000b0031f8e7c6ebemr13528764wrs.5.1696876557507; 
 Mon, 09 Oct 2023 11:35:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f16-20020adfdb50000000b0031ff89af0e4sm10318981wrj.99.2023.10.09.11.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:35:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] drm/solomon: Add support for the SSD132x controller family
Date: Mon,  9 Oct 2023 20:34:14 +0200
Message-ID: <20231009183522.543918-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pwm@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD132x Solomon controllers,
such as the SSD1322, SSD1325 and SSD1327 chips. These are used for 16 Gray
Scale Dot Matrix OLED panels.

The patches were tested on a Waveshare SSD1327 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator.

Patch #1 renames the ssd130x driver to ssd13xx since it will support both
the SSD130x and SSD132x Solomon families and at least the SSD133x family
in the future.

Patch #2 also renames the data structures and functions prefixes with the
ssd13xx name.

Patch #3 drops the .page_height field from the device info with a constant
because it's only needed by the SSD130x family and not the SSD132x family.

Patch #4 changes the driver to use drm_format_info_min_pitch() instead of
open coding the same calculation.

Patch #5 adds a per controller family functions table to have logic that
could be shared by both SSD130x and SSD132x callbacks.

Patch #6 renames some SSD130X_* commands that are shared by both families
and patch #7 adds the support for the SSD132x controller family.

Finally patch #8 adds a DT binding schema for the SSD132x device nodes.

Best regards,
Javier


Javier Martinez Canillas (8):
  drm/solomon: Rename ssd130x driver to ssd13xx
  drm/ssd13xx: Rename data structures and functions prefixes
  drm/ssd13xx: Replace .page_height field in device info with a constant
  drm/ssd13xx: Use drm_format_info_min_pitch() to calculate the
    dest_pitch
  drm/ssd13xx: Add a per controller family functions table
  drm/ssd13xx: Rename commands that are shared across chip families
  drm/ssd13xx: Add support for the SSD132x OLED controller family
  dt-bindings: display: Add SSD132x OLED controllers

 .../bindings/display/solomon,ssd132x.yaml     |  116 ++
 MAINTAINERS                                   |    6 +-
 drivers/gpu/drm/solomon/Kconfig               |   28 +-
 drivers/gpu/drm/solomon/Makefile              |    6 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  112 --
 drivers/gpu/drm/solomon/ssd130x.c             | 1260 --------------
 drivers/gpu/drm/solomon/ssd13xx-i2c.c         |  126 ++
 .../solomon/{ssd130x-spi.c => ssd13xx-spi.c}  |  104 +-
 drivers/gpu/drm/solomon/ssd13xx.c             | 1508 +++++++++++++++++
 .../gpu/drm/solomon/{ssd130x.h => ssd13xx.h}  |   63 +-
 10 files changed, 1876 insertions(+), 1453 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
 delete mode 100644 drivers/gpu/drm/solomon/ssd130x-i2c.c
 delete mode 100644 drivers/gpu/drm/solomon/ssd130x.c
 create mode 100644 drivers/gpu/drm/solomon/ssd13xx-i2c.c
 rename drivers/gpu/drm/solomon/{ssd130x-spi.c => ssd13xx-spi.c} (54%)
 create mode 100644 drivers/gpu/drm/solomon/ssd13xx.c
 rename drivers/gpu/drm/solomon/{ssd130x.h => ssd13xx.h} (51%)

-- 
2.41.0

