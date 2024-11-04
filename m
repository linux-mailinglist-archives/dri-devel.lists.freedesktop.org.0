Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27D9BBDAF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 20:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9280510E4B6;
	Mon,  4 Nov 2024 19:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L1rzpenq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697A510E4B6;
 Mon,  4 Nov 2024 19:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7C1B5C53C3;
 Mon,  4 Nov 2024 19:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB8DC4CECE;
 Mon,  4 Nov 2024 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730747206;
 bh=RLzepUvEzi8jZ2gEcW80zZHNRl/o1f2BUC9/lRQBcsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=L1rzpenqUzfXsjKliMp3NKFrjpC1eJfEx7bkxuYDVJPLtcz1JnjY2FP8cKO22jX4t
 3Vq3JECDbLiRwdy/UndJxh0e3QAYAJAPhMZizem1ucLER9hLLhQoiXAgd6ytPPccO2
 zZzM5L5WwVKyxT61cgkfJzI3YvilPV3vSUPaRv5MMuXnc3RPfpC9U5xkrbR2IJ80cb
 T3Zm/IWe3iV89yiqSnrH27Ucdudb6nzOFMv7Q1v9b8kaW2jkoOe9t/XLtgLxXMf5up
 Sj/WLE1DzNXbjWwLH/BZiLwe73BGXgo/qzFBNjX6YY2MDxyZkbDWbGui+HGDeZhz0s
 StyDRVGh2rNfA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:06:35 -0600
Message-ID: <20241104190636.274926-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 drivers/gpu/drm/bridge/sii902x.c     | 2 +-
 drivers/gpu/drm/drm_panel.c          | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 925e42f46cd8..0eae7c01b975 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1480,7 +1480,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
 		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
 		return 0;
 	}
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 7f91b0db161e..f73e1174a5ad 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -850,7 +850,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 	u8 lanes[4];
 	int num_lanes, i;
 
-	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
 		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
 			__func__);
 		return 0;
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 19ab0a794add..46d61cc871ca 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -413,7 +413,7 @@ bool drm_is_panel_follower(struct device *dev)
 	 * don't bother trying to parse it here. We just need to know if the
 	 * property is there.
 	 */
-	return of_property_read_bool(dev->of_node, "panel");
+	return of_property_present(dev->of_node, "panel");
 }
 EXPORT_SYMBOL(drm_is_panel_follower);
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf37..78cac4ecc58f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1831,7 +1831,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
 	ret = 0;
 
-	if (of_property_read_bool(np, "syscon-sfpb")) {
+	if (of_property_present(np, "syscon-sfpb")) {
 		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
 					"syscon-sfpb");
 		if (IS_ERR(msm_host->sfpb)) {
-- 
2.45.2

