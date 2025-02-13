Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D8A3432D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961210EAED;
	Thu, 13 Feb 2025 14:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CzMJFvu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16510EAEC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B0EE4A41D5E;
 Thu, 13 Feb 2025 14:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE5CC4CEE4;
 Thu, 13 Feb 2025 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457914;
 bh=G/dtHGJLltHvyQvOlbZxv0Dbjvb3n4W6Sq3TiFqZN7Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CzMJFvu3mGQSIUbWRdPNGlktfm9tTcHsneSZ6VGrkosVec/KofGhk0jYwLRfilOkl
 nx0jVjbgz/BdxLezIhIqNLaJtfCws9wy22NfrId90FitkbhOnzKNA3vHJv4A7R1y5o
 ZTACp5x/zLXzLWrFA0Nk2XsYdksocrwzgyVvj9O0fwPeXME/9mQgcOv1+pgEwG3gIs
 Evj78V3wOLgrNcvCS102fLqWfyQ+eYEk6yBIyL5CLsdaN7D3fK9Kh431sVTycHTl2d
 ifvntnXKBcBi82hkUt5eRRswCboNPFU3XXbut8p1czan2Ssj1QlF8eHJi8T1gxodu0
 EU+fFaknmMlog==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:48 +0100
Subject: [PATCH v3 29/37] drm/bridge: Introduce drm_bridge_is_atomic() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-29-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=mripard@kernel.org;
 h=from:subject:message-id; bh=G/dtHGJLltHvyQvOlbZxv0Dbjvb3n4W6Sq3TiFqZN7Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWJV/vm+4t8Y1e/mDxwuOGM18a7vr0OvNa+LKvm4/9
 T8nyXuDfcdUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYyNV0xnpntr7bD3TyYrdy
 x1V1FMhbKd4NOJFQmfH754z6eX4iEx2+B9/sPb7j1iZe/R26s0VceRnrTE8mrPky+/KRZZruTiE
 RXsfPPDOSXbDxx/rGORN9VVgXm2h03pr3ysOBb/YBL8leudsqAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

We test for whether the bridge is atomic in several places in the source
code, so let's consolidate them.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 8241c00e4506eceeb9bb4ba74a38d8f360c65d38..d2525d0b1324cc3a63e32f5bf6ca6c4f9034eb4e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -278,10 +278,15 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
 };
 
+static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
+{
+	return bridge->funcs->atomic_reset != NULL;
+}
+
 /**
  * drm_bridge_attach - attach the bridge to an encoder's chain
  *
  * @encoder: DRM encoder
  * @bridge: bridge to attach
@@ -330,11 +335,11 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		ret = bridge->funcs->attach(bridge, encoder, flags);
 		if (ret < 0)
 			goto err_reset_bridge;
 	}
 
-	if (bridge->funcs->atomic_reset) {
+	if (drm_bridge_is_atomic(bridge)) {
 		struct drm_bridge_state *state;
 
 		state = bridge->funcs->atomic_reset(bridge);
 		if (IS_ERR(state)) {
 			ret = PTR_ERR(state);
@@ -375,11 +380,11 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		return;
 
 	if (WARN_ON(!bridge->dev))
 		return;
 
-	if (bridge->funcs->atomic_reset)
+	if (drm_bridge_is_atomic(bridge))
 		drm_atomic_private_obj_fini(&bridge->base);
 
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
 

-- 
2.48.0

