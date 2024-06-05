Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B28FC076
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9000510E63C;
	Wed,  5 Jun 2024 00:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bdTkiNjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C721010E632
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:32 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6d4bf8eb8e2so771622a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547071; x=1718151871;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEmfWhNTcTb41jQU/gR81e0SjfT4byydDoGYn2r0lOw=;
 b=bdTkiNjHDIfn+klSpBsi4uBULtY2BqEZ7rZMnOzAOI6lHb4wvnc1NN1QM+5bIFtnvx
 yyjVZBE6ce0uZTtzL+iZjW8aBpVPd7jPsQmJB8n2H027DLqvbyDPWTtKW4dpQ9B8Ld30
 sutcPzDAPWqygmUQUUFD3PfNsPZtRPoxJ1/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547071; x=1718151871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XEmfWhNTcTb41jQU/gR81e0SjfT4byydDoGYn2r0lOw=;
 b=Oo0e/KPiL+z/VAbCDjaZWa9VQ4x/zkXvM0yP867UYJ/r8WXMvZ3TfwLuG3ZOkoDpXT
 +aXR+Kbox20o4547dDv3Xb9w7Z67hsB6+BdcpvcX0lpowuW4lKiOQ1Lcbh7w4E4AsVI3
 0M2ZNgam57kv7ukhPsJB6cM4IurvRYO36c/q7LRx2MbkQK7/Th/TkVQHpspCqwNeCyfn
 PCbpI8SGExbsEtVeeCPWbJlUopFttAcD2WgWbGv/nxRAV6bgS1KD1WZspkbrHIdKPURf
 eYfjVjHqaf8TGgr3H0HwuSwlle49mvwPsDYfJtlXtEkUfeNys/KG/uj8Bg+gJ4htO1L9
 8LkA==
X-Gm-Message-State: AOJu0YwZDK4tPOEnb3Z8z3C2AXZtCtZTTmqsMueV2Hl/TxjtqFWLmEhe
 +QLH4mngfAGxDShGx3jUoy9ZTdZI30g8iTxt1TRuZPy9rr4US2HRfKhI4wej6sMoVRhyzHuHcOw
 =
X-Google-Smtp-Source: AGHT+IGrcYOLi8G0eH6ZEIWKdmcS2aKK/kOX+omU7O4LuSX64QDzn3W99H3vl2K8F4dPXhpgCaMlcA==
X-Received: by 2002:a05:6a20:2588:b0:1b0:2b96:5f9 with SMTP id
 adf61e73a8af0-1b2b7025eb1mr1451478637.36.1717547071596; 
 Tue, 04 Jun 2024 17:24:31 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/24] drm/panel: tdo-tl070wsh30: Stop tracking prepared
Date: Tue,  4 Jun 2024 17:22:55 -0700
Message-ID: <20240604172305.v3.9.I5025ab14adc2efeef1be1843648547fb725106be@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

