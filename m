Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677154A9A2C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 14:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744BD10E415;
	Fri,  4 Feb 2022 13:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AA010E415
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643982236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H5esco7azdiruVAyvRxpYC4oCr4WW6uFBnyTeQyuFsU=;
 b=OEL76ZDrd97Fp8HrpvnS5t8XgQY6ksgJPsSKnvrj2lgTiqCc2Uf7jFz+79R4+vXIBApPIU
 W2033zMKwaFaNM6360jeCGzKavDkr6J8ZI5kgHWfZdX9dmrefy20zpn+bbw5j/NHwYiUmt
 DZanoDaYcobktZJCLeES/Wqf9nE71aw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-jNiMloPKMNOBKlGS_Lx8bw-1; Fri, 04 Feb 2022 08:43:53 -0500
X-MC-Unique: jNiMloPKMNOBKlGS_Lx8bw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s17-20020adf9791000000b001e274a1233bso1993826wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 05:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5esco7azdiruVAyvRxpYC4oCr4WW6uFBnyTeQyuFsU=;
 b=4iEY8k5ig6BWDjusQLgmxZ6BiAGP0gGgUnjd1mnwRaTcu3zqD7z5n9tLOpD9Xta8mL
 8kF1ScXuL91pWPHmPF6MQQoT7BT1YSr1CX+a9TAXosnrBc3HEEoKcHgNU/cgT6z1A4C5
 dopek97NRamJFJ/nb5+8xjEsxfaH/t0Gh8g5qbBMkiBxEq85TmIHzJGWMHUj3sr8CH/N
 Gfa2L6oRHLCIaaU9f4kwRimn7JTu3R0cs/JpG/17J2PEGhzza3v6U54yjdi4o1TQ7mmS
 szI1LIv14jg4MGJ0Kir73LZCVO5tnIArunrl6qVmLHFBT2nWQR72HNCCBGLB2FG0R1Zr
 atBw==
X-Gm-Message-State: AOAM530D9kEUlfpaUxbw/ltnFzerqiJWXgPyG7alfmDmtFJB8nBf6WFg
 jf9Ht87NSsFP+f+LGRJg71aYXGo7wpoWIvFQ8iQF2qbatdZ1WswEe1LM+oSB4EvtVljhnoldOwA
 Va8deenfdQy45tU/cryTwJQ0Bx14S
X-Received: by 2002:a5d:4703:: with SMTP id y3mr2602634wrq.277.1643982232516; 
 Fri, 04 Feb 2022 05:43:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNEVPxf9D3BSc9PXf0lMOYyEHkzq9ZzRZkaw2OBYe/H95+tszrYIazMw6ofG8uiI7auodIxA==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr2602606wrq.277.1643982232280; 
 Fri, 04 Feb 2022 05:43:52 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r3sm1871692wrt.102.2022.02.04.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:43:51 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Date: Fri,  4 Feb 2022 14:43:43 +0100
Message-Id: <20220204134347.1187749-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a DRM driver for the Solomon OLED SSD1305, SSD1306,
SSD1307 and SSD1309 displays. It is a port of the ssd1307fb fbdev driver.

Using the DRM fb emulation, all the tests from Geert Uytterhoeven's fbtest
(https://git.kernel.org/pub/scm/linux/kernel/git/geert/fbtest.git) passes:

    ./fbtest -f /dev/fb1
    Using drawops cfb32 (32 bpp packed pixels)
    Available visuals:
      Monochrome
      Grayscale 256
      Truecolor 8:8:8:0
    Using visops truecolor
    Running all tests
    test001: PASSED
    test002: PASSED
    test003: PASSED
    test004: PASSED
    test005: PASSED
    test006: PASSED
    test008: PASSED
    Screen size too small for this test
    test010: PASSED
    Benchmarking... 10x10 squares: 414.41 Mpixels/s
    Benchmarking... 20x20 squares: 858.31 Mpixels/s
    Benchmarking... 50x50 squares: 1586.33 Mpixels/s
    test012: PASSED
    Benchmarking... R5 circles: 234.68 Mpixels/s
    Benchmarking... R10 circles: 498.24 Mpixels/s
    Benchmarking... R25 circles: 942.34 Mpixels/s
    test013: PASSED

This is a v2 that addresses all the issues pointed in v1, thanks a lot
to everyone that gave me feedback and reviews. I tried to not miss any
comment, but there were a lot so forgive me if something is not there.

Patch #1 adds two new helpers, drm_fb_gray8_to_mono_reversed() to convert
from grayscale to monochrome and a drm_fb_xrgb8888_to_mono_reversed() to
convert from XR24 to monochrome. The latter internally use thes former.

Patch #2 adds the driver. The name ssd130x was used instead of ssd1307fb
to denote that this driver is not only for SSD1307, but also for other
displays from the same chip family.

Patch #3 just adds a MAINTAINERS entry for the DRM driver and patch #4
adds myself as a co-maintainer of the existing Device Tree binding for
ssd1307fb, since the same is shared between the fbdev and DRM drivers.

Best regards,
Javier

Changes in v2:
- Drop patch that was adding a DRM_MODE_CONNECTOR_I2C type.
- Invert order of backlight {en,dis}able and display {on,off} (Sam Ravnborg)
- Don't clear the screen and turn on display on probe (Sam Ravnborg)
- Use backlight_get_brightness() macro to get BL brightness (Sam Ravnborg)
- Use dev managed version of devm_backlight_device_register() (Sam Ravnborg)
- Use dev_name(dev) for backlight name instead of an array (Sam Ravnborg)
- Drop the .get_brightness callback since isn't needed  (Sam Ravnborg)
- Add myself as co-maintainer of the ssd1370fb DT binding (Sam Ravnborg)
- Add Sam Ravnborg's acked-by tag to patch 3/4.
- Rename driver to ssd130x since supports a display family (Thomas Zimmermann)
- Drop the TINY prefix from the Kconfig symbol (Thomas Zimmermann)
- Sort the Kconfig symbol dependencies alphabetically (Thomas Zimmermann)
- Rename struct ssd130x_array to struct ssd130x_i2c_msg (Thomas Zimmermann)
- Rename struct ssd130x_i2c_msg .type member to .cmd (Thomas Zimmermann)
- Use sizeof(*foo) instead of sizeof(struct foo) (Thomas Zimmermann)
- Use struct_size() macro to calculate sizeof(*foo) + len (Thomas Zimmermann)
- Use kcalloc() instead of kmalloc_array() + memset() (Thomas Zimmermann)
- Use shadow plane helpers virtual screen support (Thomas Zimmermann)
- Remove unused goto label in ssd1307_fb_blit_rect() (Thomas Zimmermann)
- Use drm_set_preferred_mode() inset of manually set (Thomas Zimmermann)
- Use shadow plane helpers virtual screen support (Thomas Zimmermann)
- Remove unused goto label in ssd1307_fb_blit_rect() (Thomas Zimmermann)
- Use drm_set_preferred_mode() inset of manually set (Thomas Zimmermann)
- Reorganize code in probe to make it more legible (Thomas Zimmermann)
- ssd130x_write_cmd() uses varargs to simplify I2C code (Thomas Zimmermann)
- Move regulator/pwm init logic to display pipe enable callback.
- Also add a drm_fb_xrgb8888_to_mono_reversed() helper (Thomas Zimmermann)
- Add a drm_fb_gray8_to_mono_reversed_line() helper (Thomas Zimmermann)

Javier Martinez Canillas (4):
  drm/format-helper: Add drm_fb_{xrgb8888,gray8}_to_mono_reversed()
  drm/tiny: Add driver for Solomon SSD130X OLED displays
  MAINTAINERS: Add entry for Solomon SSD130X OLED displays DRM driver
  dt-bindings: display: ssd1307fb: Add myself as binding co-maintainer

 .../bindings/display/solomon,ssd1307fb.yaml   |   1 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/drm_format_helper.c           |  80 ++
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ssd130x.c                | 971 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   7 +
 7 files changed, 1079 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ssd130x.c

-- 
2.34.1

