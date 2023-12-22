Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1581C7B5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79C210E78A;
	Fri, 22 Dec 2023 10:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9090210E7A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703239317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oS+qjXh8HC10X0gWfxfO5QF2dd2RsmhOYMQoP9qGsHs=;
 b=JVZ5m09YPGam/L4+cibPzQMrNMr/TowlAf6BWycKEwhQHg+iAyTTdggqCleXJuDap4R+DE
 lEpaefykvqH6GsiE7MV1EsVsD0a3eY4zAkYcqmrLgGM4DKYdImppZNfzlDAEiIoEE0jbJG
 o00vWsakueS+RV5XBza8zkqKy/t+mms=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ANp75AVpN8e1eNfFC-iT1Q-1; Fri, 22 Dec 2023 05:01:53 -0500
X-MC-Unique: ANp75AVpN8e1eNfFC-iT1Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50e6d41ebc5so12725e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:01:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703239312; x=1703844112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oS+qjXh8HC10X0gWfxfO5QF2dd2RsmhOYMQoP9qGsHs=;
 b=ZTB+onjcO/9DW8pe6oQnsN2TE5Pblro/cugDaygU8xFgogbj3OJV2Or7fnvd5wOGs4
 6gyRFaIzRnaHAdtZBBNsI5hYpOQPybKDAHOFUSN4gUqfFkl3sLK5rw1S1FFAqLbt7OD+
 A8jRLpD1kKBVlixc3efCDTxXzD8IfLZ6NF36wCtVEZmCs4YkisWkow0iu/NmtWmjHi39
 KZp86NneNHS0fs+1LICjZbw9zLAO68n+8xV1nW/zt2T33cvaOo0fgRpDtfBaqV20OoYK
 63IN59yL0gVZVa+4f5pjBaYCQ6An4gLXAcbDbe272jVeEHGPSR+UyXUJW6DLg2kN5H7P
 yoYg==
X-Gm-Message-State: AOJu0YxkmMj69c7cjN9NWbalRd9cLkAIOr4epvYyqz6OfuIRfUTe2hbG
 CWMp7tll6LqDonH3MKV2dXYxLu13TsCQrftqwYI5n6Bti9o9GmwedMHqIhcGZJ5nRuTzYZiXv/b
 qfHkFpJ7jbDAj8j0WnBBihf/QCPAl97kvK3s1
X-Received: by 2002:a19:675c:0:b0:50b:f2b0:8002 with SMTP id
 e28-20020a19675c000000b0050bf2b08002mr565054lfj.1.1703239312018; 
 Fri, 22 Dec 2023 02:01:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3UUA6JbUM94lCnUrXw37J307GXHRb3FGcQu41FituqE8XKR8rvHDKTEOZVs6QkjodmX2xng==
X-Received: by 2002:a19:675c:0:b0:50b:f2b0:8002 with SMTP id
 e28-20020a19675c000000b0050bf2b08002mr565039lfj.1.1703239311651; 
 Fri, 22 Dec 2023 02:01:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b0040d3f4b1c8esm4883265wmq.36.2023.12.22.02.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 02:01:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] drm/solomon: Add support for the SSD133x controller
 family
Date: Fri, 22 Dec 2023 11:01:37 +0100
Message-ID: <20231222100149.2641687-1-javierm@redhat.com>
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

This is a v4 that addresses issues pointed out in v3:

https://lists.freedesktop.org/archives/dri-devel/2023-December/435686.html

The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator. The binding schema were tested
using the `make W=1 dt_binding_check` target.

Patch #1 and #2 are fixes for the DT binding schema of the existing SSD130x
and SSD132x families.

Patch #3 adds a DT binding schema for the SSD133x controllers and patch #4
extends the ssd130x DRM driver to support the SSD133x controller family.

Best regards,
Javier

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
 .../bindings/display/solomon,ssd133x.yaml     |  57 +++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   5 +
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   7 +
 drivers/gpu/drm/solomon/ssd130x.c             | 370 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h             |   5 +-
 7 files changed, 459 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

-- 
2.43.0

