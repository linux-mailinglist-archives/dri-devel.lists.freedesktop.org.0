Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86B4A4FED
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 21:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFC410E135;
	Mon, 31 Jan 2022 20:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A810E17E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643659964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cCZTFH2Jz9n7CnT5wyJgHCMwnAI//gCfT+1J887Hbp8=;
 b=IvwX+Jq+EmdNKoAc1BseI72fa5I+rcqnmLaJmc1I639J2LgOG1Tn4GrAjTUgxMS7dzU6bX
 r/m1OwjMZ5OvWKMUFszgaZkxgqwgwtAgNeaTTxmWOLwi3zO0/1H2VuKS/4DEMmMwi3XwWs
 6pL8135r2V2A/4TMVvMeO3KKyzEOEz0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-vr2TlQprM6Wh9OMzWnSwKQ-1; Mon, 31 Jan 2022 15:12:40 -0500
X-MC-Unique: vr2TlQprM6Wh9OMzWnSwKQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso116980wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 12:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cCZTFH2Jz9n7CnT5wyJgHCMwnAI//gCfT+1J887Hbp8=;
 b=n51D9RURvjgSHXl9LQUWWXS3e0dAmNlsis1mzsrUfflAfF2/0rhWU6WE0V3uhutUiV
 Y3mUxsB0M4LK9bsSotEsE6PSK8wTObXYSrYw6A/a/x8Jok1GqAA6uT1hPf3Uy4+0M91m
 ilx2Lxz27QgGeQ0VldMXfpMxVcPZLU/sewUd5U0bCwmNVPoxwiWnbi0XXtOPKisqV5JT
 jOAESYFngsIdyXePUfg8RGKW/O9OVGtbvpw0/zAN5BcXqvSSPCi2kVGfBNa3nQGvgH7Z
 AgrvAxAC1RXh6QybauAA8wFGT2dwl4PlNTUSHAR0aWOXAbrvbn3ZtOttRoMIs8SoOZn0
 TODQ==
X-Gm-Message-State: AOAM531aVXjs+V+8PaNixbG3cfmzwgWW3Tjxus8tDy7HhmCP4JujsML5
 y1wePtIz5MNS9c3ZxjvMbXT9tIhaHOeciOzpZC7hU/6u9Nh6TzoqB1Ci60GaCZeHrDRjtOAWWIO
 Srs+ea0O969XRPEDUsT6nmyfogB5y
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr8847548wmq.107.1643659958848; 
 Mon, 31 Jan 2022 12:12:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVR5gg/GkWjplwAp2GCFjYULewNFaqtbWuaY9/kEdRUVdrcLHpHcgr6Utqd0EVs24QXTKHkA==
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr8847515wmq.107.1643659958507; 
 Mon, 31 Jan 2022 12:12:38 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id i9sm15124660wry.32.2022.01.31.12.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 12:12:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Date: Mon, 31 Jan 2022 21:12:20 +0100
Message-Id: <20220131201225.2324984-1-javierm@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
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
    test009: PASSED
    test010: PASSED
    Benchmarking... 10x10 squares: 412.99 Mpixels/s
    Benchmarking... 20x20 squares: 857.46 Mpixels/s
    Benchmarking... 50x50 squares: 1593.51 Mpixels/s
    test012: PASSED
    Benchmarking... R5 circles: 237.07 Mpixels/s
    Benchmarking... R10 circles: 501.24 Mpixels/s
    Benchmarking... R25 circles: 947.86 Mpixels/s
    test013: PASSED

Patch #1 adds an I2C connector type since currently there isn't one and
I2C drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.

Patch #2 adds a drm_fb_gray8_to_mono_reversed() DRM format helper since
most DRM/KMS user-space don't support bpp 1 displays, so drivers expose
a common format that's converted to greyscale and then to monochrome.

Patch #3 adds the driver. The name ssd1307 was used instead of ssd130x
(which would be more accurate) to avoid confusion for users who want to
migrate from the existing ssd1307fb fbdev driver.

Patch #4 just adds a MAINTAINERS entry for this new DRM driver.

Best regards,
Javier


Javier Martinez Canillas (4):
  drm: Add I2C connector type
  drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
  drm/tiny: Add driver for Solomon SSD1307 OLED displays
  MAINTAINERS: Add entry for Solomon SSD1307 OLED displays DRM driver

 MAINTAINERS                         |   7 +
 drivers/gpu/drm/drm_connector.c     |   1 +
 drivers/gpu/drm/drm_format_helper.c |  35 +
 drivers/gpu/drm/tiny/Kconfig        |  12 +
 drivers/gpu/drm/tiny/Makefile       |   1 +
 drivers/gpu/drm/tiny/ssd1307.c      | 976 ++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |   2 +
 include/uapi/drm/drm_mode.h         |   1 +
 8 files changed, 1035 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ssd1307.c

-- 
2.34.1

