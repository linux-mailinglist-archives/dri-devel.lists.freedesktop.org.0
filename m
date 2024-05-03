Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF88BB603
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396FF10FC15;
	Fri,  3 May 2024 21:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XwmZVWC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61610FC15
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:31 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1eab16dcfd8so1102645ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772251; x=1715377051;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qk2LC4K5RJqsx2QB9+nJgz+tBqijGejd/DYbrsWwU0M=;
 b=XwmZVWC88pZQVRFv+Pst8RfpETW0CU3Mnot7BVtCgN+AjT4ePNlTJtAICtpfUlMUBp
 vL9KEkALeeNcQd8e3PeveED54TEeeg7XV7JZxKI5ed6HLqHdcEi/S0ExDCNKoR91yqki
 zTOPcVhINBirKndhmoFZSPmBd+EZeC5++Chpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772251; x=1715377051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qk2LC4K5RJqsx2QB9+nJgz+tBqijGejd/DYbrsWwU0M=;
 b=Hr4QQr8YoDgbTygDKY+D1J5MkvNkg3NNPSPzwRVZnH/h/0YOxWqZTGLZ1t5R2tLI5/
 JLxN3S79Dc/RuocU32MBkInUCzBIr+C//8uZYugDMOWJm9WUAcaGIIxGGCu2R5IeNslo
 ubcL12ovQ6WUUfa9FDj47UXyq+w1QNv/PDO3cwVlG4kFS1ZwdZa43ih2VPeF8kk/BL9r
 gB3k3xhTKXRsrb91Tiv9D4m9kPUeJ8zH9LrKVIxvzN2dL8HaL/plzF9+8RW/ZORzVUUK
 9G7wM2fJ8nX1m0JT1oBMWLUzDPMeyOLimCegSdr1p23jgrUQlI56LXXq6uqUUZOB4Otj
 UPfw==
X-Gm-Message-State: AOJu0Yz2U4JoCub4vxhJh1RXzOwhV/NKFBnTyzfegyi8vjhEV1NCVleQ
 qx0kVs2YAbymZL3p7vEMiBZgYn4Y8l+Jkx3xAGNO4xMv/EQ96i3neJf4oHP0EftHrfNH6+cGrj3
 6iw==
X-Google-Smtp-Source: AGHT+IF25tSPTopP9g7n30MtXJROijO2HKPmfXJa+9xCs2KvJx4G7kvTTz0Y7toa0BkNX3wlMPNHNw==
X-Received: by 2002:a17:902:f685:b0:1eb:309a:ebdc with SMTP id
 l5-20020a170902f68500b001eb309aebdcmr5394677plg.30.1714772250902; 
 Fri, 03 May 2024 14:37:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 28/48] drm/panel: tdo-tl070wsh30: Stop tracking prepared
Date: Fri,  3 May 2024 14:33:09 -0700
Message-ID: <20240503143327.RFT.v2.28.I5025ab14adc2efeef1be1843648547fb725106be@changeid>
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

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index d8487bc6d611..36f27c664b69 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -24,8 +24,6 @@ struct tdo_tl070wsh30_panel {
 
 	struct regulator *supply;
 	struct gpio_desc *reset_gpio;
-
-	bool prepared;
 };
 
 static inline
@@ -39,9 +37,6 @@ static int tdo_tl070wsh30_panel_prepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;
 
-	if (tdo_tl070wsh30->prepared)
-		return 0;
-
 	err = regulator_enable(tdo_tl070wsh30->supply);
 	if (err < 0)
 		return err;
@@ -74,8 +69,6 @@ static int tdo_tl070wsh30_panel_prepare(struct drm_panel *panel)
 
 	msleep(20);
 
-	tdo_tl070wsh30->prepared = true;
-
 	return 0;
 }
 
@@ -84,9 +77,6 @@ static int tdo_tl070wsh30_panel_unprepare(struct drm_panel *panel)
 	struct tdo_tl070wsh30_panel *tdo_tl070wsh30 = to_tdo_tl070wsh30_panel(panel);
 	int err;
 
-	if (!tdo_tl070wsh30->prepared)
-		return 0;
-
 	err = mipi_dsi_dcs_set_display_off(tdo_tl070wsh30->link);
 	if (err < 0)
 		dev_err(panel->dev, "failed to set display off: %d\n", err);
@@ -103,8 +93,6 @@ static int tdo_tl070wsh30_panel_unprepare(struct drm_panel *panel)
 
 	regulator_disable(tdo_tl070wsh30->supply);
 
-	tdo_tl070wsh30->prepared = false;
-
 	return 0;
 }
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

