Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B085CBBBEB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 15:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0500210E4AD;
	Sun, 14 Dec 2025 14:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qXbUOA5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EDB10E4A3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 693DB44465;
 Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 088FCC2BCB0;
 Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765723885;
 bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=qXbUOA5X3mn2FMuHerPq3pO0ux4Sncq0965K9Z+o9vrFhEwbNiiy24hkvr4IL7IEu
 l9G3z5CpJTil7oXtjFfjYOMUUiPDb3nqJQmdiBJ+51zmro1hv3Zw3U3nLPgfz0W95k
 z1GwRv6TegYo2CpXvsmjSm8ASksmRePKNuwPfwokkZUAyAUoAz7k3Bp7avCM2/vTre
 ppoVZxRfQzMN7P6N60JnrQUqz178PiGGM7CCeM4SYcQE3T+MGk59czQO8tAzus/L3r
 9p8u3g9jraN4xtlkiYQRPlbMvBCoriVTe0OM89lyRWUn1hVnw2k6Kv+1Tszs2auuoa
 QzTN0YYRJ/UQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F32F6D5B170;
 Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:19 +0100
Subject: [PATCH v7 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-3-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K5KrfoqgLLk98vvZLiz1OAUosAiZymNlygbzh53UxIQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pcjJ8DiNm/QsQ2xgqL2hhrn6hr487/6aGL
 ui0uC6MMsGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 ctMUEACWQDMLGDo+ER5UtNNwjpv+5lUOBlXndjOknI4BVQxaNXIaiehOZmzYL0zwL/Jz41ORIxE
 nUgeCa1AjM/vkqf2g9L8pggx3PRFnXaUhK5b+ZwfYIcI2NdCEMJr3Gc2ToNAxxh4XGCm9PIsDpe
 s6QC0SctaRlA4Ph1YJEf3ckWLWj/W9J4OBIFpoHGxtSRLpWTC7TDpS24VwdBn1PYOXdZGDaM9pD
 ta4V+h1Wz6YS5PWvcy3RMqCRoLx+4PZ14+UQyeEloTHDA6vq6ynxDIoWotxPEo+8gBS66/097kL
 vvQhOz0Szi9G3ScxGim/XP9BtW/9uGVkOgTGtVxUqeLhpGId76UqI2jgbUreLpX5ZY4Vv4oTR7l
 R+6FsTxBVfUQCQ32y+uMyS9EimXthkcPsJLvFBTA3MZST2N704IzP5TaMel9I/wDie1jSB2i/3E
 DdeZsl9ng6Kv1GYkdJsqT21/gwHPWt1weR6V0sGbd5PoCOuXW5GDNfitfB5wtbD1spbDXo8frE/
 gR0roOWBB6TVZXU+w1R3hefcRUPHXKTQp7hnBImEHy1NpwF8rKyQUpUs4zQeayTL2yqXSk3s9Md
 1GpANsUu+s92Tg6BEJaDoHk74ON7LGXmopD97Oqx5cXw+LIpiLOts+hImMFKjXusPgwsN1YOOSG
 PuYc25Vg66r1W4g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

The supported panel is LH546WF1-ED01, add compatible and adjust the
struct name to reflect that.

The standalone compatible lg,sw43408 will continue to work, even thou
there are no users yet.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 46a56ea92ad9f..dcca7873acf8e 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -149,7 +149,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static const struct drm_display_mode sw43408_mode = {
+static const struct drm_display_mode lh546wf1_ed01_mode = {
 	.clock = (1080 + 20 + 32 + 20) * (2160 + 20 + 4 + 20) * 60 / 1000,
 
 	.hdisplay = 1080,
@@ -171,7 +171,7 @@ static const struct drm_display_mode sw43408_mode = {
 static int sw43408_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
-	return drm_connector_helper_get_modes_fixed(connector, &sw43408_mode);
+	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
 }
 
 static int sw43408_backlight_update_status(struct backlight_device *bl)
@@ -214,7 +214,8 @@ static const struct drm_panel_funcs sw43408_funcs = {
 };
 
 static const struct of_device_id sw43408_of_match[] = {
-	{ .compatible = "lg,sw43408", },
+	{ .compatible = "lg,sw43408", }, /* legacy */
+	{ .compatible = "lg,sw43408-lh546wf1-ed01", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sw43408_of_match);

-- 
2.51.0


