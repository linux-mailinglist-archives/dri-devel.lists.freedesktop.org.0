Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A99CACB5D
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A933810E40B;
	Mon,  8 Dec 2025 09:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hAobI2px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0110E3F9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:42:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 458186018F;
 Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6360C16AAE;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765186945;
 bh=7dRCkVhoY2x3WSouCqiav3GqVK107vBblD9M5kWqe3E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hAobI2pxRfWoBTOsgHxYyMaxEnwUnn38eghXjc2s4uqBY25XUN0lEOgrFuvh6cu1U
 yHWrh802lrm4fSGrdVt7x56I8aimnpWKADxzNH00YVMLUv18sGK90wzcNqW0yOm6I3
 h8zwRMRV15RedJdG8TYvinQR/vG3IK/sxJW26J2BtOMcQCom6IliiTjmyB6DwWRW1d
 8tnmRasRp2QNMv6l/UZ+NYfu3BShyKweIGYr3K4WtBxys6kjN4pLDjX95DCXN+/CKh
 9oZIMok/GoZyYuAnBSoyHNywVFQWBiTkyY4PoGXqD/GPEyQb3eeVmJTCHI97pEvGjI
 k0y8ROZ/oGILA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 97FD4D3B7EB;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:56 +0100
Subject: [PATCH v6 3/8] drm/panel: sw43408: Introduce LH546WF1-ED01 panel
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-3-e9e559d6f412@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K5KrfoqgLLk98vvZLiz1OAUosAiZymNlygbzh53UxIQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/90irK0UolOH2zOZv2yI82ykWEOJlbnkPZ
 zph1dDz3w6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 csOTD/4j8h8D0ACjR3hGNmO/UsN6h21O6p3z14Bc80eyhqEWmVebf/felupuaRq17Ptc+qLLT2i
 S593RKsObEUkppbTSqEiOJ22kfT6tzetJShnKpelFANXgwWBdMOLFZICll9ZKG20pncQ8BkWuwc
 0BSIR3ej2LYNpKg776b9G76z7Kmb2cNctGrTS3lQFi6loCjU7G3T7peRZR0CA6UHw1mrHU6gnOV
 grx5wkooVgPx5qKb9pSuPEnlwN8BIgE5kwKfRAcEy0AOKjsaOyWB+QO9FN59oiBYCPCWh61Dppv
 ukApZFMSzfy8gMNZkIchf1Y8pdJEXOcxFKaMSBLmPkeeyaIC1EEF8UjqvqMpZKGdAey5vJMnemt
 FKdIMrtE6h5QKQbaVTnTqtUlNdvLBwEnIulw0HiEYk6rhkAEgcZE57nXU8CZkgg7TpOh46OxJfl
 ViBAl5lZ3p4ezPS7OSeOGrUVD2duPd4AVie9n6gJv0msIZ1oYgdF3HPFmHpyj3anAL2WClYFzsq
 mXrKNXZE+co47xlOpgLudARjXar9M/JePX652FyyoxB7QsrF0DzvRtOQBc/5cEsP7ScA0brrtqR
 yTG/dO33J6EYqniLVCTMLAZ5M9GKSsQ2/oH2wIFZOKWm/8NyifD1w+lnFVOwC9VRBVbk4brC3cY
 C3TDTsERRGu+8+A==
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


