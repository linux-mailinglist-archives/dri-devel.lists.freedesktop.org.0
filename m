Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D918FC072
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAB510E633;
	Wed,  5 Jun 2024 00:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SB4XHg+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F075510E632
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:28 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1f61f775738so44198505ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547068; x=1718151868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zp09ce6jbG1VuSId6iviX6d1cVtpmqjoxS5RCsh3XVE=;
 b=SB4XHg+tqU3gEtIz6TkDWwnOEBX4+gYFpcAwHMw8kR6bkmzcXBFvNF08B6aGD4hf32
 IvTY2yBAlOO4qhJqhhjTYCYgZV0tJCvtHeym5NAtnc+7yNzB8z8OZuxzM5LJpQW0K5ix
 z5qa9KwF9t3qgQmpZRtF7y4wBftHnwjnr3aPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547068; x=1718151868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zp09ce6jbG1VuSId6iviX6d1cVtpmqjoxS5RCsh3XVE=;
 b=FNnfj5gGocJMjQ5h5djCJe41u1khAUOjNgcL1TapDqmzM/JOewU8Rd0E4Ifj/I3kkq
 L0Ezbpa4InOXZ69IRPZUzKTL+R/0LXz8EpuYLTwa9gaKVEhIuNUpzbKBwuJmWJixKS2i
 LvVDlFJQNvi6L4ykdYv278naeI9JFenepbeYlqwxy/WQ/qw+pSLR6MeMjOG0u7g+tCwO
 IeHymxIc0/J8OFZOtl7HDGmQrriTMiv1bZxAGZ8q3otkorqPNsdMpK14YSTpFJQvYLdo
 gS7vyMiZ5Q8Cpg/nDqh86vF+xGIYavBC1b3FR/dChc1vCtAetQj6/nnPQwu8p9YKaHSH
 OgPw==
X-Gm-Message-State: AOJu0Yw7U9GwF6UrHFIUB9zgrM7Yn3rl9z/lT88SX/ehRqTNDYgFoTt4
 6pWvjD9YQL+/Zd2fdQXE/iGlI7dk6jqpPOIssIpAIpMgOzlPbhAEh8I1PzanFwsEMrN8gNHXeIM
 =
X-Google-Smtp-Source: AGHT+IHrG+KMpa5qVMm89loF3lWFCdvOQ3M12nUwP9Qgba8qphs6ItL9jDOQyxs+1t/bccCFAWHjaQ==
X-Received: by 2002:a17:903:1cc:b0:1f4:5a89:39a4 with SMTP id
 d9443c01a7336-1f6a5a0aebbmr12879035ad.21.1717547067625; 
 Tue, 04 Jun 2024 17:24:27 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/24] drm/panel: osd-osd101t2587-53ts: Stop tracking
 prepared/enabled
Date: Tue,  4 Jun 2024 17:22:53 -0700
Message-ID: <20240604172305.v3.7.Ic7f6b4ae48027668940a756090cfc454645d3da4@changeid>
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

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 27 +------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 493e0504f6f7..c0da7d9512e8 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -21,9 +21,6 @@ struct osd101t2587_panel {
 
 	struct regulator *supply;
 
-	bool prepared;
-	bool enabled;
-
 	const struct drm_display_mode *default_mode;
 };
 
@@ -37,13 +34,8 @@ static int osd101t2587_panel_disable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (!osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_shutdown_peripheral(osd101t2587->dsi);
 
-	osd101t2587->enabled = false;
-
 	return ret;
 }
 
@@ -51,11 +43,7 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 
-	if (!osd101t2587->prepared)
-		return 0;
-
 	regulator_disable(osd101t2587->supply);
-	osd101t2587->prepared = false;
 
 	return 0;
 }
@@ -63,16 +51,8 @@ static int osd101t2587_panel_unprepare(struct drm_panel *panel)
 static int osd101t2587_panel_prepare(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
 
-	if (osd101t2587->prepared)
-		return 0;
-
-	ret = regulator_enable(osd101t2587->supply);
-	if (!ret)
-		osd101t2587->prepared = true;
-
-	return ret;
+	return regulator_enable(osd101t2587->supply);
 }
 
 static int osd101t2587_panel_enable(struct drm_panel *panel)
@@ -80,15 +60,10 @@ static int osd101t2587_panel_enable(struct drm_panel *panel)
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
 	int ret;
 
-	if (osd101t2587->enabled)
-		return 0;
-
 	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 	if (ret)
 		return ret;
 
-	osd101t2587->enabled = true;
-
 	return ret;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog

