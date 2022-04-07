Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7D4F8840
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F84910EE9F;
	Thu,  7 Apr 2022 20:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24C710EE9F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649361780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ubm6YFhYAC6YInMSbu5d7oAdD3benT+KYPcFzTrtvY=;
 b=Ypj31GM5mE8z8bI6/7GoN9+Ir5goV1Sx3mNqhq0+eQFKoD0Ttvryvqps5YngPf8okwLZNx
 PcP5bktijHUaYVqP8oF0WkWvlKGovR9Ig27xj2RH9n5JrRcW4Jyg7NdTBoAqCS55f9Oqoj
 MMD7xWb13JP1367hrS+x7NdzsDK6uVs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-8HvcXUMLM-CQT-Q2aH7ElA-1; Thu, 07 Apr 2022 16:02:59 -0400
X-MC-Unique: 8HvcXUMLM-CQT-Q2aH7ElA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s13-20020adfa28d000000b00205e049cff2so1564375wra.17
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ubm6YFhYAC6YInMSbu5d7oAdD3benT+KYPcFzTrtvY=;
 b=Pq1BW1tBmPgCiT7t1xNqCdcGAsZ1RBodUrpNSXuTfeXg643aa7P9bfOhmWv7VZktOV
 /L95rqBizEk/L3UlTlQiIXFDTR1JoxRoSFQP0Gs323lOWxYzdnhA9IxduN3z7oJNeIT0
 tGXYutm3SA8R/W12bQ7DQKd+s0G846mtMzYc6ASYA7gGbbTI5wqG5m4cCC9q9Hx8bWvs
 51XxO/QfgJg3N6dzTR6F/qnzweAb0Y29rQG7z9RG2pTa8fZqQQp6fDIHUuG/XE7gakRb
 XNl4FleZth0C6ojYhnSei58alDBLx4DP/IW9rUxj/bPNhFALqqE/ducaefUFixufhyY6
 pEug==
X-Gm-Message-State: AOAM532hB1T8Waqhh6NnTPAkPfPyi9hVbutVp6FAB4hOkdkGzubRbdG7
 64g+F19IrGOAlw2UIwpEzEoqgiXPqaR2v7m5pB+afi9q1b1DeY/GxP9yO5QmQZKVbR6M+IJ1yiX
 tWrK/LFFM0RKHZ/oXKGJ8TAoSnk+v
X-Received: by 2002:a05:600c:3c8c:b0:38e:4c59:6852 with SMTP id
 bg12-20020a05600c3c8c00b0038e4c596852mr13621691wmb.194.1649361778335; 
 Thu, 07 Apr 2022 13:02:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysWMrIHnSxlQAqg6ZsL9nRoRIt6fyQo/+UTGcvFjw2Wl1wRNhCzVnqbJMc1z8BK0S49w+MJg==
X-Received: by 2002:a05:600c:3c8c:b0:38e:4c59:6852 with SMTP id
 bg12-20020a05600c3c8c00b0038e4c596852mr13621668wmb.194.1649361778123; 
 Thu, 07 Apr 2022 13:02:58 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002078f74ccd2sm1048712wry.36.2022.04.07.13.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:02:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Thu,  7 Apr 2022 22:01:59 +0200
Message-Id: <20220407200205.28838-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds a ssd130x-spi driver that provides a 4-wire SPI transport
support for SSD130x OLED controllers that can be accessed through a SPI.

The driver is quite similar to existing ssd130x-i2c driver that is used by
I2C controllers, but there is a difference in the protocol used by SSD130x
depending on the transport used. The details are in patch #4 description.

Patch #1 just makes the current ssd130x-i2c compatible strings in the DT
binding to be deprecated, and add new ones that don't have an -fb suffix.

Patch #2 extends the DT binding with the compatible string and properties
needed to support the ssd130x-spi devices.

Patch #3 adds the new compatible strings to the OF device ID table in the
ssd130x-i2c DRM driver.

Patch #4 moves the device info for the different SSD130x variants from
the ssd130x-i2c transport driver to the ssd130x core driver.

Finally patch #5 adds the ssd130x-spi DRM driver for the OLED controllers
that come with a 4-wire SPI interface, instead of an I2C interface.

Best regards,
Javier


Javier Martinez Canillas (5):
  dt-bindings: display: ssd1307fb: Deprecate fbdev compatible strings
  dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
  drm/solomon: Add ssd130x-i2c compatible strings without an -fb suffix
  drm/solomon: Move device info from ssd130x-i2c to the core driver
  drm/solomon: Add SSD130x OLED displays SPI support

 .../bindings/display/solomon,ssd1307fb.yaml   | 117 ++++++++---
 drivers/gpu/drm/solomon/Kconfig               |   9 +
 drivers/gpu/drm/solomon/Makefile              |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  60 +++---
 drivers/gpu/drm/solomon/ssd130x-spi.c         | 184 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c             |  60 +++++-
 drivers/gpu/drm/solomon/ssd130x.h             |  13 ++
 7 files changed, 376 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

-- 
2.35.1

