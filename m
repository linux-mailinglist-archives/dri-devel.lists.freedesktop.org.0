Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D154A507C18
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A650B89D44;
	Tue, 19 Apr 2022 21:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E9989D44
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 21:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650404912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iUv2NTJ7gTBOf8GrxhIvtx/g2bgEnpVi/9pLqch7VAA=;
 b=HI0iqOCF36wy0xXCsxNn6n1lxyzurFgIxAfDIPd9qTBiisv3lAt03l0SsbIvbh9WhgAOJf
 wujgh0RXUhDELez6nGkg1x8peLbJp0FudQesROgJYJLT8O94s0FpdE63p5ziYIzVqf+eCN
 L5+JrGqoceRu55HGzznomQ6IRKEHt90=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-0D8tG4h1OJCAeIcKooZ75g-1; Tue, 19 Apr 2022 17:48:31 -0400
X-MC-Unique: 0D8tG4h1OJCAeIcKooZ75g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k66-20020a1ca145000000b003928959f8efso1220087wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUv2NTJ7gTBOf8GrxhIvtx/g2bgEnpVi/9pLqch7VAA=;
 b=YtCd3lQ2+ppWe7KuY3DJ9c4gMGWxsVM9olObFiCrqXtrglCPcf6S+hsDDO1Wn4X53s
 JjkhKihLLHBVfpEAo3GxqIqIu1JR88tLrNC3Bq5ivGTD/I+GM2WGNHDtv73Y9uWAG+hx
 2XllOHYAPEiArcg3k6rMyvZWh+A10L3aceMklY+M3+/sOlPxOU4Y6gDI7TOsuEn+7H5f
 gFdzU0dvxFSX1sLfmxfJ7QAoIAPDlof5G2LOWDUJqcqgu/+WRrRERI2DAYB9op1PCjHR
 6xeoAiSHNlxB2ayNsL0RwiLJaN6+VD+6Jo2Q0QXx4V73BtgINaGhf0uj29JbKq328ok5
 dXDg==
X-Gm-Message-State: AOAM53167HnBXP4R9VuxxCbSyC/J3TDuc7/JROzA3DmBAuGFaDDQgOf+
 ZJXRrInbNIqUwk8s+bsICA3i0XcVnlg2KHOoOdzYmxCo6UTqnT31BhC3wZMcIAsJ8O0iaaNBTgT
 vtB0PYhdvDC6MPEgHDHYHzBbz9HGJ
X-Received: by 2002:a05:6000:156e:b0:20a:9665:ca9d with SMTP id
 14-20020a056000156e00b0020a9665ca9dmr9055411wrz.172.1650404910376; 
 Tue, 19 Apr 2022 14:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzTCCp+DmpxwaENdM0BASbGg3Ig10/xv8vgQpwOiaUtPU5pBeDOUif9F+KNHopbNeaYjdzPw==
X-Received: by 2002:a05:6000:156e:b0:20a:9665:ca9d with SMTP id
 14-20020a056000156e00b0020a9665ca9dmr9055390wrz.172.1650404910137; 
 Tue, 19 Apr 2022 14:48:30 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm13333699wrv.19.2022.04.19.14.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:48:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] drm/solomon: Add SSD130x OLED displays SPI support
Date: Tue, 19 Apr 2022 23:48:18 +0200
Message-Id: <20220419214824.335075-1-javierm@redhat.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 YueHaibing <yuehaibing@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org
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

This is a v5 that addresses the issues pointed out in v4.

Best regards,
Javier

Changes in v5:
- Remove unnecessary blank line added by mistake in v4 (Andy Shevchenko).
- Remove cast by just using u8 *reg instead of void *data (Geert Uytterhoeven).
- Add Geert Uytterhoeven's Reviewed-by tag to patch 5/5.

Changes in v4:
- Add a description for the dc-gpios property for SPI (Geert Uytterhoeven)
- Export ssd13x_variants array using EXPORT_SYMBOL_NS_GPL() (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-i2c driver (Andy Shevchenko)
- Use MODULE_IMPORT_NS(DRM_SSD130X) in the ssd130x-spi driver (Andy Shevchenko)

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

 .../bindings/display/solomon,ssd1307fb.yaml   |  86 +++++++--
 drivers/gpu/drm/solomon/Kconfig               |   9 +
 drivers/gpu/drm/solomon/Makefile              |   1 +
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  63 +++----
 drivers/gpu/drm/solomon/ssd130x-spi.c         | 178 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.c             |  35 +++-
 drivers/gpu/drm/solomon/ssd130x.h             |  14 ++
 7 files changed, 329 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/solomon/ssd130x-spi.c

-- 
2.35.1

