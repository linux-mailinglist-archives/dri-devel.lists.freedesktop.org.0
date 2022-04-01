Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F434EEFA2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BBE10E94C;
	Fri,  1 Apr 2022 14:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5E10E938
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:27:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C35ADB8240F;
 Fri,  1 Apr 2022 14:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BF7C2BBE4;
 Fri,  1 Apr 2022 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823248;
 bh=BRK+9JeOfueA1hXgfeqN+d3kw7Pcf0cfVeiYcuNNvxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iGMovSujhBAyEwN8A0irQt5nTDhf4fvmlr4aDTUIityelEkTFPIAmRBlWNn2m6VN+
 CNdRbjr5XjeBY3O3od1ZVlUf73I93w36r4OvOXZIKFvMcu+2lb9d4CZZHXE5pHaY8G
 u1kwQdpMfvdjdv46+n9W67MvMcWG5oMesswfuDY4dXPOWrD9cYaJuYboyKSMm2Y7Tw
 Z5vnvQUn7ks+Pu7q1mCZeF+jXbdLGc1B4ynT+eRZzsshjP+sW3W/unA7VKZU/lpJW5
 pE9GuBV1ixjSsv8aCp8SEhnjGqyz8ig7QuJFMF7vXVNwqrvywW/n8voWhgMsY4RkMH
 6oCAEgnw+oSOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 033/149] drm/bridge: Add missing
 pm_runtime_put_sync
Date: Fri,  1 Apr 2022 10:23:40 -0400
Message-Id: <20220401142536.1948161-33-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, narmstrong@baylibre.com,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, airlied@linux.ie,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongzhi Liu <lyz_cs@pku.edu.cn>

[ Upstream commit 46f47807738441e354873546dde0b000106c068a ]

pm_runtime_get_sync() will increase the rumtime PM counter
even when it returns an error. Thus a pairing decrement is needed
to prevent refcount leak. Fix this by replacing this API with
pm_runtime_resume_and_get(), which will not change the runtime
PM counter on error. Besides, a matching decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1643008835-73961-1-git-send-email-lyz_cs@pku.edu.cn
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index af07eeb47ca0..1529b9e3d576 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -861,18 +861,19 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
 	drm_mode_debug_printmodeline(adjusted_mode);
 
-	pm_runtime_get_sync(dev);
+	if (pm_runtime_resume_and_get(dev) < 0)
+		return;
 
 	if (clk_prepare_enable(dsi->lcdif_clk) < 0)
-		return;
+		goto runtime_put;
 	if (clk_prepare_enable(dsi->core_clk) < 0)
-		return;
+		goto runtime_put;
 
 	/* Step 1 from DSI reset-out instructions */
 	ret = reset_control_deassert(dsi->rst_pclk);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert PCLK: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
 
 	/* Step 2 from DSI reset-out instructions */
@@ -882,13 +883,18 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	ret = reset_control_deassert(dsi->rst_esc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert ESC: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
 	ret = reset_control_deassert(dsi->rst_byte);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to deassert BYTE: %d\n", ret);
-		return;
+		goto runtime_put;
 	}
+
+	return;
+
+runtime_put:
+	pm_runtime_put_sync(dev);
 }
 
 static void
-- 
2.34.1

