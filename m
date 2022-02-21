Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6984BD6D1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957BC10F8B2;
	Mon, 21 Feb 2022 07:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903F310F8B2;
 Mon, 21 Feb 2022 07:34:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u1so25394329wrg.11;
 Sun, 20 Feb 2022 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+qoR05yyHcZH4vSpMFd8zmkj+IJ0A8LVRiydiNyLQE=;
 b=bfJ5+9lJe1regsuOgOS62d6ohx+ewAGRCfg62qzUyvYZ+eec9jm0xpboi7mUJnHtRv
 b81hAbPB3zc1/p3GtZnBfH5tb7iVphRT8k0sM1SUj/jymWXJOxMc+o3E8aRz24F9Qgbt
 oQES8SLZ7qCM/r0yZHgLqC4AxDNlB8kFFZDMskAc36MeaGYxUDuqJqJkjZ1Yy8hHwxZj
 JOYxBcGX0LlyvJUGOmRPN0lHOojK1SeGpCeoE5u8FSU19yXr4CDHEL28OV7ApyphpHzU
 m/XuzUzdkLylwL8QK8qfXcgfIMIDEBt4xE83umKA13INLGHzsXmpMvThU1wPS76KJel0
 ndhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+qoR05yyHcZH4vSpMFd8zmkj+IJ0A8LVRiydiNyLQE=;
 b=jruxTP37kqHnr8xKnbXP+12NgT6HOprZaipFCRXiZgdaFrgVgDy1ki2cUmVUpx18lg
 MAAjbTrY++jgHtfJrTbAqj3ERWHzgPChUa39vKocm6KKEU4Ps6M1FlZ5VJSmVdGhuyfl
 wLFc3o99oIxcyIBQEm0V8K38Q7o/pR3rbWQti8CsPxToM/OuZGxAtH3y5kpnqKnCTuTg
 /c6PN7Hoe8ax/xAGEKyijUqnHbtwhelcwPsILlZ8McYuNkHgc0ExclwoANTTNxnKo7sh
 tqCNM97AQpYy7t+NVfxLxxKki3dYi4xDCaQOiVSpa0YyuI+0POjDxT6G2Hc7joldiM75
 8HmQ==
X-Gm-Message-State: AOAM533pUrL6k1GnGeJkkFX0WSGbA0L6imjniJZUyWyImUIZX9LMC5ig
 NXxQ8oHDoSys6y3dKSY7HWA=
X-Google-Smtp-Source: ABdhPJx0lw3Y5VqBWVHfEPeyySbm9dv8MgG72DRRcySxMXil771gs/YOCQimQJH9Iw+6HqFyEOkkeQ==
X-Received: by 2002:adf:e7cd:0:b0:1e3:31a4:4b55 with SMTP id
 e13-20020adfe7cd000000b001e331a44b55mr13981624wrn.650.1645428849129; 
 Sun, 20 Feb 2022 23:34:09 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id f13sm29876580wri.82.2022.02.20.23.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:34:08 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH] drm/msm/dp: switch to devm_drm_of_get_bridge
Date: Mon, 21 Feb 2022 08:33:39 +0100
Message-Id: <20220221073339.10742-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, maxime@cerno.tech,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index a7acc23f742b..0951752e2d98 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -268,16 +268,8 @@ static int dp_parser_clock(struct dp_parser *parser)
 static int dp_parser_find_panel(struct dp_parser *parser)
 {
 	struct device *dev = &parser->pdev->dev;
-	struct drm_panel *panel;
-	int rc;
 
-	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (rc) {
-		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
-		return rc;
-	}
-
-	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	parser->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(parser->panel_bridge)) {
 		DRM_ERROR("failed to create panel bridge\n");
 		return PTR_ERR(parser->panel_bridge);
-- 
2.25.1

