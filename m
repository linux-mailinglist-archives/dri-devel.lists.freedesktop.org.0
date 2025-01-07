Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294FA042C2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3E410E70E;
	Tue,  7 Jan 2025 14:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="bMuTGudG";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Kz/TNRA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE6910E70E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736260769; x=1767796769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
 b=bMuTGudGdCF+GFdN3BRpzeYX2ub3vAL583xnZ67bsh/g1m0Rfl/QNAcp
 bsBZWCTqCqw+iOvxI0xnGyPIow2HfD5HU9P/X+JZpsH6VZ9eqxQ2j5Qyb
 1Xt9JnvjhmKRJmw6Fz/d+up2EBv6+juW0Wo8EDoItc4JHmY2S2YiGYOBL
 zss84WT6eFPWKM/ceX6BrhJk9bns0/iuYzvZYX/T33kV7vh5oV7FG1Bof
 aw10cNd+H51kh/6pGFP0S3fQlAY1jhaoruGB/evGiTIi2byx7DxGOY4Ra
 ow4faNh6cRd7gnFxXWRdzOufJYwyv+nu7elXKp1bWxsm8ovcXUgcYlhBe g==;
X-CSE-ConnectionGUID: OLkKxxOYQ2O7L3x2p5kTEg==
X-CSE-MsgGUID: kBmI3pPLQ6y9k7ktctXARQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; d="scan'208";a="40897247"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:27 +0100
X-CheckPoint: {677D3C9F-1F-3C670366-E45AD810}
X-MAIL-CPID: 5D665BE28A4386F0867A29349A815CCC_4
X-Control-Analysis: str=0001.0A682F27.677D3C9F.00CA, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59956160B22; Tue,  7 Jan 2025 15:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736260763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
 b=Kz/TNRA2k3u0PyJ5oHB+nYGayQGkRTxZ/4I43G45iHR3By/K8jB9CNTC3ABHnqQ+5j4yi1
 JK0iWidsvqz2r9mSf8ykklx9V5qMaTkR7iAxw2V8CPSar/qAY4r74lKL/noQSeVcC3VVOj
 je4FFLa5DIqPgszBZ3nBkUAmqXvJnXvKX30Y1XIgBDai1BUJ6zBIZ/BlC2qN9HwAzVqHmQ
 hNivDMYEMYc6BHoSSj8KRGOVdaMfOGRVTg8i89h8UNQBaLgqsi9GP1SeITDB3QCVktFNGH
 tENFAAGPUqz8kL4ALPtJ9jxdwF68cdWI7BZbASmcBCgXIL03jobcxGjHDJ+xOQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/bridge: imx8qxp-ldb: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:58 +0100
Message-Id: <20250107143900.988567-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7bce2305d6767..d5e123173f354 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -557,10 +557,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 
 	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
-		ret = -EPROBE_DEFER;
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "failed to find bridge for companion bridge: %d\n",
-				     ret);
+		ret = dev_err_probe(dev, -EPROBE_DEFER,
+				    "failed to find bridge for companion bridge\n");
 		goto out;
 	}
 
@@ -590,22 +588,14 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
-	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get pixel clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_pixel))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_pixel),
+				     "failed to get pixel clock\n");
 
 	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
-	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get bypass clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_bypass))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_bypass),
+				     "failed to get bypass clock\n");
 
 	imx8qxp_ldb->dev = dev;
 
@@ -640,13 +630,10 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	}
 
 	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
-	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
-		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
-				      imx8qxp_ldb->active_chno, ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb_ch->phy))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb_ch->phy),
+				     "failed to get channel%d PHY\n",
+				     imx8qxp_ldb->active_chno);
 
 	ret = ldb_find_next_bridge_helper(ldb);
 	if (ret)
-- 
2.34.1

