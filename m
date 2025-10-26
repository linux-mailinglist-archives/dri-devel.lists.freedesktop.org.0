Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD9C0AF41
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607F410E308;
	Sun, 26 Oct 2025 17:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hEwNBQdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BA410E380
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 17:40:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59052926cf9so4068898e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761500402; x=1762105202; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iEmUHXG37I7hN7DklrpCAGo6hzPuY0ejVR9WD3TuWYY=;
 b=hEwNBQdIekWadkXUogs46t0gBh6mgwl9HGQU8lZnAqZY3p4MO1TLHZ3BqkhUApqSfb
 TX0ea0Jmm10GfVrhrE0ByyTgBXlMfx4LdT807phxpBot53+BKklSisf7To/3/6tVJERF
 NPFuvqI6eWCvi+JvhLRGin4m6th5Zv9VrLvBQTQhEXz/LJW8+gs/+ySISN1Hqv+ZV3jy
 R03GO4v4G8gs2z+usAq8FTvIdx3jE6xijsl3Qh3QA4B91Wdlhqh+t5RwZGG16cWM4G0P
 BoWrOLDJ+3ewenWMBdz/hpzSuHQcA7f6AQxlgYCOMbs6p8TJufSFf6DuZCBoY+XkUoN+
 Lw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761500402; x=1762105202;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEmUHXG37I7hN7DklrpCAGo6hzPuY0ejVR9WD3TuWYY=;
 b=tEtJD8+WXPAXS9xjhXVPvOQxzu3L0g855Xu+d8UbtjuP2kQGCarrxsrJoc7aT74nB7
 D7RGJs0LQbqAmehD6tr+1DATGlS5bFxEHChn04eJKoOjihy0ZN2aqWlucYeUe7c0wr9Z
 53cFY1WHH+En48HqVlDNfEHNIYqR3JaMWT8esw5HUA8gjTayIlkETCNUzARXv71ctHev
 MGvEuiNQ8frEnFlUTnBtCb9h1SeBr3kYVeS3nDfACTFaIfr8awzdVcpe3AbnvynQbxK1
 Ayopa8e8td6q457GYLOsvnD3f/NiVU72PsngJpgfdvZ7galatZ5ZjagJnyLAo05BZLBX
 +sgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMf3zLdDXyZtoBeggnxw4bYdBuB5kVSsf0eJCVcc+Uk+xiJ+1yh1zKUkqifI+zSJnFCUQd8p2wyas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaQi5+WFeg7P+voV9orf7GeotQavKXK+V+Asj9IMeDOEYjREHc
 5Y7Gq1coECyYVm1yx0lPsLVPBoN5BJ1UiOzpFN+VPlimjk4XCVPnu8+v4FnbGt/G0Co=
X-Gm-Gg: ASbGnctMs8CPwzqMXeBWWepQNgLIN0Ug6FMQFmJdXrJfVvmcb6DabHyeHnn8ZJDIiJy
 72zyzMBKG3UsyU/0+pWXptZUUlXDkTZWbGYpsUAzUCC3yGOL2ga2ehiAkcluKbZyRlbL76D+zAT
 kqr1QdwnUtijafQWdItX0vccupXZu0w3HZ8ufiC3064OWN8d0IZi2ZUx4lC7+UYoMaBLEdETl63
 SU3sHmsLFlAmdAXBoTj0XAo4Ui0ip5MbZIrsKx2ivOUOjO+OVtPijtQ4lKX+IXd67DcQ+jO5Psb
 oTXTHKT/pIM3EcPpgtef3bRJB1CKC5w0qAHvBWuXr4Q4N3do6/0c3V3H2yjVHG3KXVbwfYaR9Sw
 xbCDG2jJLanev4dvLK4x0BqHvoWab4bjAX436RAbtZtPWMvk7G0g4HCd93V5a3P/ChNSW5pZv9d
 VTY84zrsDm9nsHB/LBUmfEFC7TFna3m6zl/oxGu2xgAU8VdzTVihon4wA=
X-Google-Smtp-Source: AGHT+IGQaWbyuFzC5aAvoJONt7xToa1lcvW9J6sm4lT0pZvskUobCI9ic9x53MRcvfbJulUBccNVWQ==
X-Received: by 2002:a05:6512:e81:b0:579:fb2b:d280 with SMTP id
 2adb3069b0e04-592f5a612e2mr3497283e87.42.1761500401752; 
 Sun, 26 Oct 2025 10:40:01 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm1713620e87.20.2025.10.26.10.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 10:40:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
Date: Sun, 26 Oct 2025 18:39:59 +0100
Message-Id: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CQAxEf4X0bM1SQxRP/gfhsHQrNBHWdA3RE
 P7dhcSjxzeZebNAElNJcC0WMJk1aZwy0KEAHvzUC2rIDOSoKh0R3vWNIwfBYCOa9CZp2yDXnh0
 zuc4L5PXTJFd3c9NmHjS9on32o7nc0p/z9Nc5l+hQQu1rqkJ34fPtoZO3eIzWQ7uu6xc1fETQv
 wAAAA==
X-Change-ID: 20251022-fix-mcde-drm-regression-c9ac0cc20bae
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

This is also evident from device trees with the DSI
inside the CRTC such as this:

mcde@a0350000 {
   status = "okay";
   pinctrl-names = "default";
   pinctrl-0 = <&dsi_default_mode>;

   dsi@a0351000 {
     panel {
       compatible = "hydis,hva40wv1", "novatek,nt35510";
       reg = <0>;
       vdd-supply = <&ab8500_ldo_aux4_reg>;
       vddi-supply = <&ab8500_ldo_aux6_reg>;
    };
  };
};

The panel is inside the DSI which is inside the CRTC
(MCDE).

This is in a way natural, so let's just fix it in all
affected panel drivers that I know of and can test.
Mostly Ux500 phones, and only those with the display
directly on DSI (not e.g. using DPI and SPI).

Other panel drivers may be affected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fix half-baked NT35510 patch that was still sending init commands
  in the prepare() callback.
- Link to v1: https://lore.kernel.org/r/20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org

---
Linus Walleij (4):
      drm: panel: nt355510: Move DSI commands to enable/disable
      drm: panel: s6d16d0: Move DSI commands to enable/disable
      drm: panel: nt35560: Move DSI commands to enable/disable
      drm: panel: s6e63m0: Move DSI commands to enable/disable

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 31 +++++++++++++++++++-----
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 24 ++++++++++++------
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 35 ++++++++++++---------------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 31 +++++++++---------------
 4 files changed, 70 insertions(+), 51 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251022-fix-mcde-drm-regression-c9ac0cc20bae

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

