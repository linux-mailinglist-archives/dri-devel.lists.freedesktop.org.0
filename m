Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EECCACB56
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D2C10E404;
	Mon,  8 Dec 2025 09:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="owU6458b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFFE10E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38C5D444B9;
 Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E126EC2BCB8;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765186945;
 bh=2rgKnYxiFmxDbKElV6Y/BkMlAs+qt7O9a1p3PCU9Vv8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=owU6458b1Y+hebzbjSF9V7Fy9Zdr4hIzhLzraemi/YhWPaiLsNuDFFmZ2FdYGyeLU
 xKwHDNr/gjqAdsL2dWkP0svXhh1bivpQXmbPBWRrD6770pHcivKvqjRmaOFi6ozz0e
 YHnv/ToPqfDnnS/kH8uE/4nS12hqczAKyR/EnWxIXI/c34HCxMXf+bT9uegURsJctO
 AYGrG4YiZc1U2LTm88IwHuUobjIkIlw43MY4pfgeWLSzvcVI97vlQC1yzfdri5iG/Q
 RoKc8lgyq1mY0FgPbZltIVamqqT2r+QP7H6s6k1SOLbBQTs0bGqYwu7DGMuMiSdyrb
 qScHotwyG7HLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D4FDAD3B7EA;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:59 +0100
Subject: [PATCH v6 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-6-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=FslEhjXGojUkauhq/OFIjdrErLG55tF+5ngAsfmKcWA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/QW4GScA8cEz+uhXAJUtAgwmVHwHY4iRM2
 vwuelghuCaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 ck25EAC5uhi1m435DMsot5KN86ZhoHWasdgQfpWrEK+Tj7zj1W0cK/zJ0q0LC+4FUBNAcOP6mK4
 DZCEhQHHj+rFtaAltEjRouVGlGLYO069Obqfiv7d2E0vIh7OjJCTrMBYftLKdoq965x1k8eK8qH
 h1DQCuYQyu7cXOAScceqj7rDGjAGAR78pRDuvnL2QCm34Khech3T8DTnV0duei1BtbYsXu1k1Jp
 BsgCK5+8tg8jDISWphqbzAbPUyfKif0w3yxzrPGaVsq1UZzpH0qoAxZC+VaxGpTW7M40b0a9iHc
 Vw6W1zSaefzSZgG4daNAZhzbyubcCpLfSNtqCyIfIh/0UKcbEBL6VQpFyqVIdp/drsGIynOSHLc
 ZsFURGFONcXWNh0TZG8SJA67u1eLFbzPwjFx4HYPRPEJK9tqIysqrqTzh8K/TBBMEVKoGN8lVIc
 kAkzCYVDsc81FBcHqrSJsk2ay+jdZ3WyeS/Hr7sFdQrp7oHSpnnIrfwmfqanXyyaSPd3o86xqtp
 Uc+xE0ankiWf9py7PoGOZ+aROYPotxmAp7oVE/fCP0KFamGmm/9oTluAaqlu4lH0kkMqFJr7tHr
 yfqK7HYKxJfg4ouEZHr9woOuY83NKVFVcB+hjqk7BLLUButPUT0xDFW8QNEE5qfEnbF0Rvp0Nq0
 9Nk/cXsAD9kqPqQ==
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

Switch to devm_regulator_bulk_get_const() to stop setting the supplies
list in probe(), and move the regulator_bulk_data struct in static const.

Cosmetic: adjust comment for regulator from 1.88V to 1.8 V.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 06b9c5e650edf..e8a970b53d873 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -20,13 +20,18 @@
 #include <drm/display/drm_dsc.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#define NUM_SUPPLIES 2
+static const struct regulator_bulk_data sw43408_supplies[] = {
+	{ .supply = "vddi", /* 1.8 V */
+	  .init_load_uA = 62000 },
+	{ .supply = "vpnl", /* 3.0 V */
+	  .init_load_uA = 857000 },
+};
 
 struct sw43408_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *link;
 
-	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+	struct regulator_bulk_data *supplies;
 
 	struct gpio_desc *reset_gpio;
 
@@ -59,7 +64,7 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
 	gpiod_set_value(sw43408->reset_gpio, 1);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
+	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), sw43408->supplies);
 
 	return ret;
 }
@@ -152,7 +157,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	struct sw43408_panel *ctx = to_panel_info(panel);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	if (ret < 0)
 		return ret;
 
@@ -166,7 +171,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 
 poweroff:
 	gpiod_set_value(ctx->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), ctx->supplies);
 	return ret;
 }
 
@@ -248,13 +253,10 @@ static int sw43408_add(struct sw43408_panel *ctx)
 	struct device *dev = &ctx->link->dev;
 	int ret;
 
-	ctx->supplies[0].supply = "vddi"; /* 1.88 V */
-	ctx->supplies[0].init_load_uA = 62000;
-	ctx->supplies[1].supply = "vpnl"; /* 3.0 V */
-	ctx->supplies[1].init_load_uA = 857000;
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
-				      ctx->supplies);
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(sw43408_supplies),
+					    sw43408_supplies,
+					    &ctx->supplies);
 	if (ret < 0)
 		return ret;
 

-- 
2.51.0


