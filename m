Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A392E691
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 13:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818E610EA25;
	Thu, 11 Jul 2024 11:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gxzGKVt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E932C10EA21
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720697232;
 bh=yYEpV6mgz8Ga+AjpAiMeT63sbhybaoeCYkwkqiyqnac=;
 h=From:Date:Subject:To:Cc:From;
 b=gxzGKVt0luCl6OOlv0XQK3+THNu/Uhyz5wMbAEccZfD0XM0QT7SuJjenzhqIVKNoh
 aUIJd4h7GapobNbaX/77BoMfw2ho1mCc+oBMnFt8K40mKw2TXs9WV9vLTxblXghEqF
 j4g4eVNTJy/tLRcOC+qPVsDzrN1vTuo3brD1YeD1g+OKfamKswz+aPCOCTrtzJKElE
 H3GnJE5i10k9BNQW7MPxmBmb+Sf6qv95DNEJ9LBNuF84XH2BbaNF4shu9YKVfSlyaH
 PaQ96RWNwN7a9DAoZxoGejHxJ3jdIlBWhjYlAjFHXEbyz27zONq3R9m1zJQH3ghulT
 CeYTimGF7bV+w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4DAF63781185;
 Thu, 11 Jul 2024 11:27:12 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 11 Jul 2024 14:26:55 +0300
Subject: [PATCH] drm/bridge-connector: Fix double free in error handling paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-bridge-connector-fix-dbl-free-v1-1-d558b2d0eb93@collabora.com>
X-B4-Tracking: v=1; b=H4sIAH7Bj2YC/x2M0QqDMAwAf0XyvEDbFWT+iviwNqkGRiupyED89
 4U93h3cBZ1VuMM0XKB8SpdWDfxjgLy968ooZAzBhehG7zGpkNncauV8NMUiX6T0waLM+CJ6hlh
 cCqMDe+zK1v//ebnvH4bFYfJvAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
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

The recent switch to drmm allocation in drm_bridge_connector_init() may
cause double free on bridge_connector in some of the error handling
paths.

Drop the explicit kfree() calls on bridge_connector.

Fixes: c12907be57b1 ("drm/bridge-connector: switch to using drmm allocations")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_bridge_connector.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0869b663f17e..a4fbf1eb7ac5 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -443,10 +443,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			panel_bridge = bridge;
 	}
 
-	if (connector_type == DRM_MODE_CONNECTOR_Unknown) {
-		kfree(bridge_connector);
+	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
-	}
 
 	if (bridge_connector->bridge_hdmi)
 		ret = drmm_connector_hdmi_init(drm, connector,
@@ -461,10 +459,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-	if (ret) {
-		kfree(bridge_connector);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 

---
base-commit: 1eb586a9782cde8e5091b9de74603e0a8386b09e
change-id: 20240711-bridge-connector-fix-dbl-free-9dd324f0b270

