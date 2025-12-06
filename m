Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C27FCAA702
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A71610E2E7;
	Sat,  6 Dec 2025 13:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BLsGdGZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5BE10E138
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 765C144427;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E75C116D0;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028083;
 bh=xnfwSKVPAn/+oKcBddi9HnvJpJcCnJl7aalvezxhKXY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=BLsGdGZfo/sTJpXrnlvWnPpfZOu7d8zClC6ngdHIn7DuufoHJRhKAJIRfmuJSFQ9M
 ryipIPRTF/kcWidAQ4fa3Kdh+MB3dQ5lyUzjAxZGoRAS6j1He6rFi5PLZS7Ett1+fv
 q8Qrqy0l7DwXPQx71bkNIUFnm9GwWKEgnpngxrFMn7UC2UQoAAV7s5s6EYR9MJAvz9
 7bPL71/hcQDuyaE/thDFgwc5mEggZCWDpDH1qDSyqXW5Z2o0+mWy8zbXLvqcoJ7Awm
 3VluUjhZDC8/2SSbOrJGkd9xVeVs8ZeRPZVFcrjQ+ahA1KITo4K9KmCY3NiAVXYspX
 BVfF4mGOYM/bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 41AE4D339BC;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:23 +0100
Subject: [PATCH v5 6/8] drm/panel: sw43408: Switch to
 devm_regulator_bulk_get_const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-6-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=uVsb8swJAoi+FQAuLqZnopgHFSzHoIO92dAgRnXWra8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDxv6t4VuZdCZLrdK1kaZgK7nLWAXjcOcrbQ
 /fkSrvYyhqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8QAKCRBgAj/E00kg
 cvsFD/4n/SUSuiLIi+NtZpsmV8LAvclnd65vs136thYaW0obqU5Wv0Uqznr01YjMKmo4tAiwd+9
 db681ZBwiHOL2iDnVDm1iEwI3p2USZA0s7XSsImX6Ubj1C2OH41XjBOY7QPO5UN2U8FBeeVxXyu
 pF2MGUuRL0pvEnOrfucSIQRsBCNt+RVZ11igHVdLAz6TlMCnc6epk7j7BAHp6EN1JWhoU+/WaSh
 3Z6PoXgJVbnS3MnPm3pKi3mJJu27NtfL7yqQYWypz1hd35BMRuI2JvslSdoPhkU9oGq7Z9SUuxd
 AVgcgyBzP/w5ZZ2xewN0TfaLOSVqhCxKgEMimQNpgXp37/iuOVjS9BpqWB/x69cGGzpU/zQerxE
 lm5CQ6m8Yl+aHnHAyDc5vvPMwjWEcbm7Zt+HHWM8vkR9rgprLQPz2oVzuSpGYnFXdW5uEP9XaZi
 uHtt7V+5+Yg7FsdxMdskSODdln4JttQwodZfPOHUVBeS9M6s0LQs0dtW6TvCuny9Y8+5LhaD2BP
 m9NAAdRQyPeExRISAJsvliB0JAtjzW6vMc/Gv4ptcuf/E9y5HZjAFY/nqWsiTlJu1gpbm20s4P3
 ix7BxJN+OBO3uuOBcr3QPxrFMplA17z1K4bmVcLBcMcVnDGerZNihaHi+ufLskOpIXgVFzsS/C7
 eiZeJPKZZaDdXZA==
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 06b9c5e650edf..65d54c8a9630f 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -20,13 +20,18 @@
 #include <drm/display/drm_dsc.h>
 #include <drm/display/drm_dsc_helper.h>
 
-#define NUM_SUPPLIES 2
+static const struct regulator_bulk_data sw43408_supplies[] = {
+	{ .supply = "vddi", /* 1.88V */
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


