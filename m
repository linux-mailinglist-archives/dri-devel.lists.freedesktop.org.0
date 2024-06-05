Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ACB8FC078
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6110E641;
	Wed,  5 Jun 2024 00:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ILRp80db";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401C10E639
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:24:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f32a3b9491so45641765ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547079; x=1718151879;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfrcD8JBjZkCaL7eZQ01Qcv1YJLZOCOi3SqrruG0MFA=;
 b=ILRp80dbyssDrtXHWb09hMqYxYCPdD+VfL4iYh5/RCJRO2lBhrb+yxbc35VGY24Jd5
 h8Iksot12VkoMRT5HEPgmQYsRzwyWPfEbpxvM7A82d+Bb90+Uhfd3ZoG8SemP1hqRK0/
 O6GQnbqqjbNegbW5l0NuNShbAMJn/VgouMLeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547079; x=1718151879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IfrcD8JBjZkCaL7eZQ01Qcv1YJLZOCOi3SqrruG0MFA=;
 b=E8OSXXACzNOylAgcwce1YartcW2B3s13xM5ws/GO2b30/Q9MmFwdSH9g2RwZzEt921
 fHITyuPxPX3Iyr+c/OWMGRgfO9KsCHjGu7PmY2pEUs+9p5++xri5JUXpA0JIqlwx77Hv
 EMwTYAGohZbb3TZTrVFuTvn316Hqk6uYSDktjKohI2LWfO5K+kJ0lU/TkFEaTL+cGvTo
 Pa/FYQN5HKRaL2yN3Lzcdvk9vctdLWgI+sH33oc6hIEJXmEUL2UjKTViI3dITynJoWUR
 VJtWe/jPupe8zzU3ZvbL6FFkprrbQuC6RJs/13t+oR5izepUpdBvylTMx8U0ZFbvtQ2T
 bRSg==
X-Gm-Message-State: AOJu0YxG5yphcXWBiuS/oRea/OoFGxzmYOORpINvzCuflrUbjTYqujtL
 6HCCMP9Sd20VpW32y9vmtV/qr8ef969RBq6/V/yGVNjKZJIKUScZH4mnWuCueIPfUbjOyUddcZU
 =
X-Google-Smtp-Source: AGHT+IEEXeKEFU3e6/tB86kEEDxmpRztg5jwJKvGuNYwl+8Zuu/KCQ9s/CpPfv0EO0JOLP/Q6+umFg==
X-Received: by 2002:a17:903:2289:b0:1f6:6c64:a7b6 with SMTP id
 d9443c01a7336-1f6a5a24e16mr13838715ad.37.1717547078652; 
 Tue, 04 Jun 2024 17:24:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:24:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vinay Simha BN <simhavcs@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/24] drm/panel: jdi-lt070me05000: Don't call disable at
 shutdown/remove
Date: Tue,  4 Jun 2024 17:22:58 -0700
Message-ID: <20240604172305.v3.12.I5f3426e511e77b93c247e0aac114bd12b2b2a933@changeid>
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
indicates that it is used by Qualcomm boards. The Qualcomm driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 4ddddee6fa1e..b1ce186de261 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -452,10 +452,6 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = drm_panel_disable(&jdi->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to disable panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n",
@@ -464,13 +460,6 @@ static void jdi_panel_remove(struct mipi_dsi_device *dsi)
 	jdi_panel_del(jdi);
 }
 
-static void jdi_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct jdi_panel *jdi = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&jdi->base);
-}
-
 static struct mipi_dsi_driver jdi_panel_driver = {
 	.driver = {
 		.name = "panel-jdi-lt070me05000",
@@ -478,7 +467,6 @@ static struct mipi_dsi_driver jdi_panel_driver = {
 	},
 	.probe = jdi_panel_probe,
 	.remove = jdi_panel_remove,
-	.shutdown = jdi_panel_shutdown,
 };
 module_mipi_dsi_driver(jdi_panel_driver);
 
-- 
2.45.1.288.g0e0cd299f1-goog

