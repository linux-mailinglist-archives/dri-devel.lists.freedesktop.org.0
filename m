Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B50C3326B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C886A10E681;
	Tue,  4 Nov 2025 22:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FtOeuKsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466C310E67B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E63D60216;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254B6C4CEF7;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294575;
 bh=7kVUuFepyL1nqefy7/RVz/fzVOVxrSJ4iaI+ek8pJSU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=FtOeuKsjrUfQ808ka0As0INPyczTyCWSDAgoX+Gyb/lbJfu0nfdcD5AHHtWtFIVIl
 K0c4S2KUQH8Q11G5vS0Q/REUwJQAiU1iqZARYyeNifWy+/ftvkhdfsaGntTpIzWi6H
 2zzXkZWDr3bJDs0oihuHkr6CZvHKskiJq8Ro4g7YN6qvoRyZIYDTWmlKpwyk98iiCC
 HPAOnC2FGaTP5gmaklh+2+qwc1CiOZmI9NfEw9vLVsf43ED3JlChN3MDB5VZsftNGX
 yhiUWgRv8nFpCapqB5cs7wIv6QuD0yRV5o7L5ugvD+30rzqUKrXh5fJ/G7HIOFxo1O
 iDnHzIKY9IynA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6BECCF9E3;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:18 +0100
Subject: [PATCH 10/12] drm/panel: sofef00: Simplify get_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-10-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8diXpj4flXvL6PBJCymDKTVmS7jlHjaf2gFdGCxh2WA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssTJrYITqvXoSfOpO1N/xmq6B/uzeG9TnlS
 DqYQuDIxfeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 csOfD/92fqAeLGJR+XZi2fUT8DBSLFFuuY+d02H9N1VyZMdNS49uTPInJ2tXxfoaPXH6okErM6c
 jAhM9x4Jc12U+BA6h3RrWMseOYi4cdusav8PngmIbRCX1xHqrgmCVuFq08k71IFo5VWGsVw9nSz
 NSGLIFi+9JNr0uNXatGNHziS/31y4aiU+qDIWooJni1IHpYIILL+1dI32t41gqdAzT80rNi89kM
 E61JOFvwez//Cbu6a7i1rEFAp/sI2BTs6966n0i99mL2a5DdX5dW5g082+QgNJ5oP1r1k8uaHC9
 4QVYgOwusiCgd7FnHg7KVVxkmfJ83AjcnjGPImLPeeTVx46iTkHAYieD9umEBPJ8he8wVw+Hz1D
 LPQTxG5Hm1tcoOUT59XHBboB5cF5u0JNFgX6lbCA87B/uGa75uzgplwH3lKMz7AbAcOXqyGntOc
 fKZwFXGAvZEsUxEAzdKR9Xe2BugFoO5uQWsgJ2+nJC1KYCDIAgYJPxNHPEgCfmqls0zGbqk4g18
 3ugHyWRctJtD013BG82UTU2r6b9oNCSkViKwcoRAf2Wb0mdPHKBA8pC/HKXKrLZwPnCtUd85WVu
 otN8XtLJoiHtLRRr4d1Y48C0kB49ns1guGqlMuV5EcIFO7t8w+KBe3lKA+GsOb73Onbikb3q9MR
 88oF6RPjtYEyjCQ==
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

Levearage drm_connector_helper_get_modes_fixed helper function.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 7947adf908772..e69a28628b656 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 struct sofef00_panel {
 	struct drm_panel panel;
@@ -143,34 +144,26 @@ static int sofef00_panel_unprepare(struct drm_panel *panel)
 
 static const struct drm_display_mode ams628nw01_panel_mode = {
 	.clock = (1080 + 112 + 16 + 36) * (2280 + 36 + 8 + 12) * 60 / 1000,
+
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 112,
 	.hsync_end = 1080 + 112 + 16,
 	.htotal = 1080 + 112 + 16 + 36,
+
 	.vdisplay = 2280,
 	.vsync_start = 2280 + 36,
 	.vsync_end = 2280 + 36 + 8,
 	.vtotal = 2280 + 36 + 8 + 12,
+
 	.width_mm = 68,
 	.height_mm = 145,
+
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
 static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
 {
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, &ams628nw01_panel_mode);
-	if (!mode)
-		return -ENOMEM;
-
-	drm_mode_set_name(mode);
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &ams628nw01_panel_mode);
 }
 
 static const struct drm_panel_funcs sofef00_panel_panel_funcs = {

-- 
2.51.0


