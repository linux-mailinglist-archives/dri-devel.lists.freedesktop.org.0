Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F481FF1B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 12:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC010E2AF;
	Fri, 29 Dec 2023 11:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135010E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703848839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d3KNTkAHMEq6kRnLdtQoUQE4cKQn8zc78RB5qaLNfps=;
 b=EFOwvIaKGdwHNSXmIvW4p2IlTxZ5tm1Bj81Di35Uy10z/TH2Xk13IxBD0nEJgTGP9tQlNJ
 LYBqM1Pn29//awmg/LvyMtbxNqJJeZNKdFc0OFAyA6pDOGZ1Va4/F4tgzu+9Z53sNv5rnq
 +Lawn90NJgYtKPC6668wKYBCr8xHNs0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-zOm-npsWOzCYntueiKg6ig-1; Fri, 29 Dec 2023 06:20:33 -0500
X-MC-Unique: zOm-npsWOzCYntueiKg6ig-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-50e7ce2713cso3251589e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 03:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703848831; x=1704453631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3KNTkAHMEq6kRnLdtQoUQE4cKQn8zc78RB5qaLNfps=;
 b=I+gPNrgZKEK3ONVnrxsivS/kSQOLNfMdeEaLH91jqwcWA5N3X957eeHzTo+Cxkoc/O
 9dTLkCYThN1CgtvEOKLle0TWvWRbEPeRkstKfbX7Rfxk4Vx2/Pj8g0oK/JVppWXsM/rN
 SLlt2jWfkdg++T2EqlKjypnTq/Dm84Wh40AWjfX1wK6lTdwjHgzO04pSF3Po4x9ajWMw
 EykhqasZ9cB3Kta7ex3N62Ynj0A5VTPVxaa01x5xe9OlGK1X6b3gFVSpBCHob3lDrEdc
 2O5AvH/78JKh+yQ4g6u6IS0Mx0XXQ4KPem1MQ0d4+E76U5p9UtEUD4GYKOVvopP6xxLK
 dMYQ==
X-Gm-Message-State: AOJu0Yz5DFor4E+HMY3sW/eWHP/3XKsnFWEE5TctXNJ0sU+a4Oj72t6v
 hBFtt6AQmEGRXwcvBgmZj6VF9xkNwWRLk/NVGuDw+h3TZToXGj+fXXmyPZyq5G35NmVUktKp+mq
 +ycxpDFJ7CFpi7SlY7SK0PybqoogiCEge4cxO
X-Received: by 2002:ac2:47e6:0:b0:50e:7702:a189 with SMTP id
 b6-20020ac247e6000000b0050e7702a189mr3613954lfp.22.1703848831380; 
 Fri, 29 Dec 2023 03:20:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH/ywHRre541SoLTPy1QECA7NUgjNY8fcN4VeI019+xCIjYOchbO5JRtdR/qeeHiOlbvC6jw==
X-Received: by 2002:ac2:47e6:0:b0:50e:7702:a189 with SMTP id
 b6-20020ac247e6000000b0050e7702a189mr3613937lfp.22.1703848830973; 
 Fri, 29 Dec 2023 03:20:30 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b0040d5c58c41dsm10315024wmq.24.2023.12.29.03.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 03:20:30 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] drm/solomon: Add support for the SSD133x controller
 family
Date: Fri, 29 Dec 2023 12:20:17 +0100
Message-ID: <20231229112026.2797483-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD133x Solomon controllers,
such as the SSD1331. These are used for RGB Dot Matrix OLED/PLED panels.

This is a v5 that is basically the same than the previous v4 but dropping
support for I2C since the ssd133x family does not support that interface.

The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator. The binding schema were tested
using the `make W=1 dt_binding_check` target.

Patch #1 and #2 are fixes for the DT binding schema of the existing SSD130x
and SSD132x families.

Patch #3 adds a DT binding schema for the SSD133x controllers and patch #4
extends the ssd130x DRM driver to support the SSD133x controller family.

Best regards,
Javier

Changes in v5:
- Drop I2C example in DT binding schema due that bus not being supported.
- Drop "solomon,ssd1331" entry from ssd130x-i2c due I2C bus not being supported.

Changes in v4:
- Fix typo in commit message (Jocelyn Falempe).
- Add collected tags.

Changes in v3:
- Move solomon,ssd-common.yaml ref before the properties section and
  width/height constraints after the other properties (Conor Dooley).

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

Javier Martinez Canillas (4):
  dt-bindings: display: ssd1307fb: Add vendor prefix to width and height
  dt-bindings: display: ssd132x: Add vendor prefix to width and height
  dt-bindings: display: Add SSD133x OLED controllers
  drm/ssd130x: Add support for the SSD133x OLED controller family

 .../bindings/display/solomon,ssd1307fb.yaml   |  20 +-
 .../bindings/display/solomon,ssd132x.yaml     |  12 +-
 .../bindings/display/solomon,ssd133x.yaml     |  45 +++
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   7 +
 drivers/gpu/drm/solomon/ssd130x.c             | 370 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h             |   5 +-
 6 files changed, 442 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

-- 
2.43.0

