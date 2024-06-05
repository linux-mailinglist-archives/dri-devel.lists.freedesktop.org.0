Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495278FC07B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD81710E649;
	Wed,  5 Jun 2024 00:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TXwDaxBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658010E640
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:49 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-702492172e3so1680338b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547088; x=1718151888;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msnwFK/XkOnU7RbguwwCWHAg9Wx/3x8graQzx6Y6iJo=;
 b=TXwDaxBo2aGrNVsrX6NDD0r4fgofu6lJv6WNV/whDdjmwXtIntSLgxv1U1rXX0ODiF
 bSzP5/XrgN7apGKA5bfYTyLoFojhTrlNO9ieOO+LtnxYHKw8/oWzYz2UufvDJB4TPRVq
 zHmhohvpPkm0/R+haoNJt4PzXE99fiL4Rt3yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547088; x=1718151888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msnwFK/XkOnU7RbguwwCWHAg9Wx/3x8graQzx6Y6iJo=;
 b=ogRjeno2L8TO7//A4uHzQAGF1NDngPLcbaRu/sPjs64MiBUTQzaD+RUCFvP7fnrGik
 a5k/Xe1hQdoWSrQAcuXbWu6yVCT+pvGPl4lV3EEt+3qWxcOxkBt2nM+9zKntqlYWZ6h/
 BSttvY8TRCJRxgkF6y3BC8Bqje+jqHt3fHEteOMqW9KwSScaQqAMtdvHCtpcj3SCzd90
 7+/z+4ItUJR1jkiG14xP2HmXiVybJrr4Hkko/t4WpZR3XFx+/nCk+5kotCIgbLv6Widr
 cwNN0fMEQZzEgW1bZw99H8vwkHQ/foywcm4ZwA1OQAoV5kYZJhcYEo5ftru0jtIHz4wQ
 AL1Q==
X-Gm-Message-State: AOJu0YyPhsHPCXKBxqlHElcuVYWX0zPoqf8Zdvqzdk9v1+Y1TtDPnNPV
 N5rzvS6ugsoS3wMpKFYhJIsAMYfWqMSN3M7D+qxzYx654pOG7AvwtkLvicP5OVDlk3P7aHL4lgg
 =
X-Google-Smtp-Source: AGHT+IFbuMMubq5nzPSGHbnA/7JCHbN1RIJ5658MiA6y66RGqchQoA/HmoffnqBh5Mo5cI2sbFTEzA==
X-Received: by 2002:a05:6a20:1590:b0:1af:d153:b76a with SMTP id
 adf61e73a8af0-1b2b6f68b99mr1497594637.18.1717547088161; 
 Tue, 04 Jun 2024 17:24:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Marco Franchi <marco.franchi@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/24] drm/panel: seiko-43wvf1g: Don't call disable at
 shutdown/remove
Date: Tue,  4 Jun 2024 17:23:02 -0700
Message-ID: <20240604172305.v3.16.Ief712fb6720cb98bdf9ec8644362d028b6554f9b@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by IMX boards. As far as I can tell, all IMX
boards are now correctly calling drm_atomic_helper_shutdown() so we
can remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 98480904126c..8a3fe531c641 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -243,14 +243,6 @@ static void seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-}
-
-static void seiko_panel_shutdown(struct platform_device *pdev)
-{
-	struct seiko_panel *panel = platform_get_drvdata(pdev);
-
-	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
@@ -306,7 +298,6 @@ static struct platform_driver seiko_panel_platform_driver = {
 	},
 	.probe = seiko_panel_platform_probe,
 	.remove_new = seiko_panel_remove,
-	.shutdown = seiko_panel_shutdown,
 };
 module_platform_driver(seiko_panel_platform_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

