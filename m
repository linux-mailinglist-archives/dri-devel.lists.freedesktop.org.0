Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792C8BB612
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8641132A8;
	Fri,  3 May 2024 21:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OLXj0Trh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC741132A6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1ec5387aed9so1022865ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772277; x=1715377077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cC/7w7cvbMIg1H0tLbovKCpsSruQDzBcns5w6WWFLNE=;
 b=OLXj0TrhzHL9fWUwemazPDbs85o+Hh3q7SN7zX4qH82cCyO78GpZKJUrjsUZV0d8jI
 ZleXnamys0UolHjUTdSUDIu6N/xS/Ii4m/En9ZRCesaQtYvgkoDFfMwkum3B9PVaHgAi
 Tpwh2TxOuBBRv0B/8WDlLevMhhV0b8ULZFGBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772277; x=1715377077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC/7w7cvbMIg1H0tLbovKCpsSruQDzBcns5w6WWFLNE=;
 b=oB6HscuMPSNvJQkx94K5cIJZG3/TdmDRuylgbqllW1ZMHWdTz8bI7bUZWquqLF5gY8
 0kO6sPWvEt5u81o5JHPegxfTIpbglReCbgR6EJ9tPy2C6Rzak0sRNYopByqF+O+joi8H
 QbNBIp3X4emlzw4ZEGD/C1gQOyVPun9ZNp09/0QPrHPIQNSG56KbrNO5XRmXohw80wWH
 Ic2BoJKSNsgBnFpEO0u3oFYDKtc7AEGwfhC/iubToAsazKAnJDfSyTcn/RRxL5Agwl9Z
 moWHkbxMoi+RR89CH1UWt/4ehYYu4CseRDvE3Zt83/KStrbGoimltMhbgVcU1xAGJQc8
 m0uA==
X-Gm-Message-State: AOJu0YzgWuBKfG20aaH9aA3J8aFuG5B4n75r45VvpO06Xhg24ElMJU/4
 h3Gj4lmIuQJx8ddekN6Wm+DDZKirHY3AzUC9sl7Q292PEfA7sTbg6Y8TRNOABHDTgTTdr9tMUQy
 Tiw==
X-Google-Smtp-Source: AGHT+IG4SIdj15z6GG8hET0eYzMhdd/lRGVRHEH1MacWakPy0nnB+jvXlG5KXqoNJ3o0nqOGfLsZdA==
X-Received: by 2002:a17:902:ecc2:b0:1e8:c993:a13c with SMTP id
 a2-20020a170902ecc200b001e8c993a13cmr4897231plh.25.1714772276873; 
 Fri, 03 May 2024 14:37:56 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 40/48] drm/panel: sharp-ls043t1le01: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:33:21 -0700
Message-ID: <20240503143327.RFT.v2.40.I56849dbe7c906f0cff076dc5286fd05c7e3e9c18@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Werner Johansson <werner.johansson@sonymobile.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 855e64444daa..c86337954ad7 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -26,8 +26,6 @@ struct sharp_nt_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
@@ -99,9 +97,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (!sharp_nt->prepared)
-		return 0;
-
 	ret = sharp_nt_panel_off(sharp_nt);
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
@@ -112,8 +107,6 @@ static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 	if (sharp_nt->reset_gpio)
 		gpiod_set_value(sharp_nt->reset_gpio, 0);
 
-	sharp_nt->prepared = false;
-
 	return 0;
 }
 
@@ -122,9 +115,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
 	int ret;
 
-	if (sharp_nt->prepared)
-		return 0;
-
 	ret = regulator_enable(sharp_nt->supply);
 	if (ret < 0)
 		return ret;
@@ -152,8 +142,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	sharp_nt->prepared = true;
-
 	return 0;
 
 poweroff:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

