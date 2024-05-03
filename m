Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8808BB5F2
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991A3113292;
	Fri,  3 May 2024 21:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mPl40IRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67108113291
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:02 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so872975ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772221; x=1715377021;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Y9nTdENQ7Wsy544i8JrWRgyMyQ3M74fjSP7BIF4QEI=;
 b=mPl40IREgw212F0pttDsQ7pppB7txT2UhAAU3OgGWP8SGzrlJeDvSUQ3Jtc48rVtaX
 PJVQO4ZFJK2oMH80y0TjMIuq3FGH3mfeJeMaGWgDAvQAedrjQa4v/6F3GtNxzy/pQvFV
 SWM4HAqV+Kv6GxSQyOjB9p0AUVGu4LS/+7eJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772221; x=1715377021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Y9nTdENQ7Wsy544i8JrWRgyMyQ3M74fjSP7BIF4QEI=;
 b=XlM2rqwzhYFWfbO6CxvIPz2qWKKjEMZNpUt3EQqx2e3q30cGJP5iVK1Ufs6fSfurKS
 /kFU6Jiwk4CiTN8amP/80oshTGP4gXkfw+FkjkolbGeG8hD8BlayQWqvYx/r4hkZMJOB
 qkrfzboaDxHdHqappaSFDtF96STya7B9NeJ7My7Z9T+5uL2PcpLt3rTVf83xw7B2+iS+
 OxMJkMK1z4+mbZ2zwK5zDAwQ9bq83vSutZAca7VXss4Mv/UXIkvUOC4S8yaxwF7CGCR2
 1XCdtOeGArmFBDEIkK/+1Jc177ChpRPIHP29Z+goNUbk5WTPSeA/usjULLAladV8D+JM
 sXlA==
X-Gm-Message-State: AOJu0Yw1icwmKTU/omARrsyd3fBwit8P915IHDiifVk1/ZTi/nlSL2LQ
 Nlx3RrCxDVxd0rE18nDvEZCfBKBqGcjoFzgQeWNpl/LL2CkyzquVO7bPd5hsKHmrraE2+cDA0a+
 5Ag==
X-Google-Smtp-Source: AGHT+IG9ldtVTieXA1Mk9918TqXU0GmNr1vS54kcAamhylLrurY6wy29CnNThSUyMLFqb7DbECdGsQ==
X-Received: by 2002:a17:902:a60c:b0:1e4:6938:6fe3 with SMTP id
 u12-20020a170902a60c00b001e469386fe3mr3701239plq.58.1714772220922; 
 Fri, 03 May 2024 14:37:00 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 15/48] drm/panel: ltk050h3146w: Don't call
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:56 -0700
Message-ID: <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, grepping mainline for this panel's compatible string
shows no hits, so we can't be 100% sure if the DRM modeset driver used
with this panel has been fixed. If it is found that the DRM modeset
driver hasn't been fixed then this patch could be temporarily reverted
until it is.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 .../gpu/drm/panel/panel-leadtek-ltk050h3146w.c  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 5894bf30524a..292aa26a456d 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -673,27 +673,11 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void ltk050h3146w_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct ltk050h3146w *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-}
-
 static void ltk050h3146w_remove(struct mipi_dsi_device *dsi)
 {
 	struct ltk050h3146w *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ltk050h3146w_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -725,7 +709,6 @@ static struct mipi_dsi_driver ltk050h3146w_driver = {
 	},
 	.probe	= ltk050h3146w_probe,
 	.remove = ltk050h3146w_remove,
-	.shutdown = ltk050h3146w_shutdown,
 };
 module_mipi_dsi_driver(ltk050h3146w_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

