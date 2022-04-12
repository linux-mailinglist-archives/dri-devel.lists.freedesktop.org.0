Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0374FE5C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92D910E1EA;
	Tue, 12 Apr 2022 16:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310CE10E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649780870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lfkn5TYpg4K2UbIAiqP/jS0HrRHZn0tpfdIL3TtxJCc=;
 b=aSvtuwg3lsCCBEIEBiCMbxGiW7VyFFWS4KHDkEd6crqj5fllUJEWc3pS6Ho5nv2xbykSlh
 ftV356aXh5ig3fGTQ4b3G+FZ8LAjQzR3JmM9A9cOktABINIWLSqOxY4FnMIB0rvd2RPFh/
 I+oMVJBl5uVK2aoOKfxCy5vgi27TcIM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-pdLXtnCNNBSw2aNEjZ8iwQ-1; Tue, 12 Apr 2022 12:27:49 -0400
X-MC-Unique: pdLXtnCNNBSw2aNEjZ8iwQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h61-20020adf9043000000b002079bbaa5d3so2046443wrh.16
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lfkn5TYpg4K2UbIAiqP/jS0HrRHZn0tpfdIL3TtxJCc=;
 b=3ccOzscw6Y49uXWIVoy6hSzUbOu9yAUFt7JlB8w2ptl2GqpE+s072YFUyrzdYoQe84
 7HaX2BddpPxZZybnTN54Al3rYxi6pWtVSH2Wwdb8IELYNslr3tm8moafOVT3sGGzadd4
 vsl4C2T/n4BMMAtiCu2iqhNLPlK7PGHPpsPF+ur4ykBvQBvcZcOqbIWtYTQ3PsGOOo1I
 /bJ6qK+ouIJlTfKL9FSdtvbQv+HtfoT6FOj4JnBnHcURaONYcCwwV15bWRjQz9vuuzp4
 z3gYGdnwAcy8dFJXhhZSxkCeQSkB2KsXO7RCsonH9w/iZYopD116HdpjcMiM40bhsmrt
 g27w==
X-Gm-Message-State: AOAM533QyGk1ZZVbsgFxG0/Wslln4NropM5lQc0IG3n+v1qnRwuYnGv6
 0dzsTR79CildtVoVCFm9JzqDWmJ0EtIRBs9Maqfb/dEECZtNHA1jKhXACQF7ZgKDMnU5wPulcgf
 dA4K7xXP5BIyIYeN/nLXyu1jrOapt
X-Received: by 2002:a5d:5604:0:b0:207:a2a3:2f3d with SMTP id
 l4-20020a5d5604000000b00207a2a32f3dmr11237118wrv.358.1649780867558; 
 Tue, 12 Apr 2022 09:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgqa7/aV9ISwqb4HltJ51cUzLX12vmdSnwVQPSzUyImyzqg+JOJyY+2jY2yZWjjrp82c0mKw==
X-Received: by 2002:a5d:5604:0:b0:207:a2a3:2f3d with SMTP id
 l4-20020a5d5604000000b00207a2a32f3dmr11237093wrv.358.1649780867296; 
 Tue, 12 Apr 2022 09:27:47 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm7700358wrq.81.2022.04.12.09.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 09:27:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Tue, 12 Apr 2022 18:27:24 +0200
Message-Id: <20220412162729.184783-1-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds a ssd130x-spi driver that provides a 4-wire SPI transport
support for SSD130x OLED controllers that can be accessed over a SPI bus.

The driver is quite similar to existing ssd130x-i2c driver that is used by
I2C controllers, but there is a difference in the protocol used by SSD130x
depending on the transport used. The details are in patch #4 description.

Patch #1 just makes the current ssd130x-i2c compatible strings in the DT
binding to be deprecated, and add new ones that don't have an "fb-i2c".

Patch #2 extends the DT binding with the properties needed to support SPI.

Patch #3 adds the new compatible strings to the OF device ID table in the
ssd130x-i2c DRM driver and deprecate the old ones.

Patch #4 moves the device info for the different SSD130x variants from
the ssd130x-i2c transport driver to the ssd130x core driver.

Finally patch #5 adds the ssd130x-spi DRM driver for the OLED controllers
that come with a 4-wire SPI interface, instead of an I2C interface.

This is a v3 that addresses the issues pointed out in v2.

Best regards,
Javier

Changes in v3:
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
- Continue enforcing required properties for deprecated strings (Maxime Ripard)
- Add a comment to the properties required for SPI (Geert Uytterhoeven)
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
- s/it/they in the commit description (Geert Uytterhoeven)
- Drop unnecessary blank line (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)
- Drop ssd130x_spi_get_dc() helper and open code it (Geert Uytterhoeven)
- Export variants array and use &info[ID] in device table (Andy Shevchenko)
- Add Geert Uytterhoeven's Reviewed-by tag to patches.

Changes in v2:
- Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven)
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)
- Use the compatible strings that don't have "fb-i2c" (Geert Uytterhoeven).
- Drop ssd13x_variant_to_info() and just use the array index (Neil Armstrong).
- Add the same compatible strings than I2C (Geert Uytterhoeven)
- Add Mark Brown's Acked-by tag to all patches.

Javier Martinez Canillas (5):
  dt-bindings: display: ssd1307fb: Deprecate "-i2c" compatible strings
  dt-bindings: display: ssd1307fb: Extend schema for SPI controllers
  drm/solomon: Add ssd130x new compatible strings and deprecate old
    ones.
  drm/solomon: Move device info from ssd130x-i2c to the core driver
  drm/solomon: Add SSD130x OLED displays SPI support

 .../bindings/display/solomon,ssd1307fb.yaml   |  82 ++++++--
 drivers/gpu/drm/solomon/Kconfig               |   9 +
 drivers/gpu/drm/solomon/Makefile              |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  62 +++---
 drivers/gpu/drm/solomon/ssd130x-spi.c         | 177 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c             |  36 +++-
 drivers/gpu/drm/solomon/ssd130x.h             |  14 ++
 7 files changed, 324 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

-- 
2.35.1

