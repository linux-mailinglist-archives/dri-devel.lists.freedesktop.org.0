Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A32819193
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 21:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87B10E194;
	Tue, 19 Dec 2023 20:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAF710E194
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703018075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G3PrML/moN4j55SwG+/o34m/ejkpgfVZcKcfEFV4pS4=;
 b=WcIXb49Zmp+CxQWftsZBFxolXS0JRtzDTnTmoH3dCEOYMRD2iBXFr48mjle9tA3vt6ktHs
 PVaJ/GfOpq5jcf5SxrjBaLPS73J4OF7jyZ0mImxqnh4o0OtvpW3GMxrnlmutxyJfTn1qjO
 Uue3lrNqQZ/ZQw7Ra36wf8NS83eYPZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-Id1xQvnTPWGrgPrOcEceow-1; Tue, 19 Dec 2023 15:34:34 -0500
X-MC-Unique: Id1xQvnTPWGrgPrOcEceow-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c464a1e5cso38382185e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703018073; x=1703622873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G3PrML/moN4j55SwG+/o34m/ejkpgfVZcKcfEFV4pS4=;
 b=uRan+IKrz2CaWY3dgaEjzecnTEzp3XOLNwRdjjGeOJOaBz0hdo9hAqdmtBama04LRq
 dtFEDBcXJa46YPeRhbB0kktBXPIZSjAX97gTnOAFH2K6rnoHOBOZk/NOu6nN7z1GKlKr
 itCrYDjb2/PjCmzDPZwiF97Uno34vfwXde2fHWIinncfBtxle0F2xI8kRXz5FBcmjXNU
 Wchn7AYyblwUcjKZMqMHLVWbPK8ZNSlRjJuJAsIdXEuUmG1/0UGQtiVOiIbhMym2HMmD
 OYuB4VzeUttUhcNVJWa2rwkVx8NuhmD2FoTMhep8J7cnO36gj8v77sY8irb2Tf9kfFpA
 1JfA==
X-Gm-Message-State: AOJu0YyHBYb25E0DsUaRgbxrKFUpch27ML6MVDzDH64O32KzUvBK9Sg/
 XflwXLGCOHsWCm+rDLomi5oNbFTB4FcBeOKwlBSC9VWzgjimNnmufNrs4crxmc6+VXFOqGLqOLu
 lFwZcf+A+fPpEFGx3p3C377cnWY8y
X-Received: by 2002:a05:600c:34d3:b0:40d:1744:6cd8 with SMTP id
 d19-20020a05600c34d300b0040d17446cd8mr1762993wmq.234.1703018072857; 
 Tue, 19 Dec 2023 12:34:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE23XRYfTnL6CdjKlBDQ8esfC/c4AICDWtZHNoDhP5YZ2smTAkHdm4ruh5KSDtDSEL4FQBdew==
X-Received: by 2002:a05:600c:34d3:b0:40d:1744:6cd8 with SMTP id
 d19-20020a05600c34d300b0040d17446cd8mr1762989wmq.234.1703018072538; 
 Tue, 19 Dec 2023 12:34:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3965414wmq.48.2023.12.19.12.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 12:34:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drm/solomon: Add support for the SSD133x controller
 family
Date: Tue, 19 Dec 2023 21:34:05 +0100
Message-ID: <20231219203416.2299702-1-javierm@redhat.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD133x Solomon controllers,
such as the SSD1331. These are used for RGB Dot Matrix OLED/PLED panels.

This is a v3 that addresses issues pointed out in v2:

https://lore.kernel.org/dri-devel/20231218132045.2066576-1-javierm@redhat.com/

The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator. The binding schema were tested
using the `make W=1 dt_binding_check` target.

Patch #1 and #2 are fixes for the DT binding schema of the existing SSD130x
and SSD132x families.

Patch #3 adds a DT binding schema for the SSD133x controllers and patch #4
extends the ssd130x DRM driver to support the SSD133x controller family.

Best regards,
Javier

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
 .../bindings/display/solomon,ssd133x.yaml     |  57 +++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   5 +
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   7 +
 drivers/gpu/drm/solomon/ssd130x.c             | 370 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h             |   5 +-
 7 files changed, 459 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

-- 
2.43.0

