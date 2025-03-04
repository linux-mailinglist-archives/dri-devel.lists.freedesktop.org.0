Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF10A4DC07
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717710E58F;
	Tue,  4 Mar 2025 11:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sO75RUId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE89110E58F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 68B1D5C5AF4;
 Tue,  4 Mar 2025 11:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CB6C4CEEA;
 Tue,  4 Mar 2025 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086692;
 bh=sKleaYeZ7mJs6nOj6qpkdQC+JqPOSJpww8MRjOINY+Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sO75RUIdn1py72c3aiZrtz475xIE6yxiG/Q0DsdOCXWMI/ZJT/S+gzuihPvZuUI6A
 5rTB54FdRAvBY0mW1pd8hzKtNrrwOHFpYYpt3reHk6QfVBELHi7CA28DZ1k7WKVk35
 nQrJBcLpUBDENRXheA9iKw0LubgctqjBKsvDPf5NXCMabfvR5sQhdpqsBO8nBeGATb
 BcwwsU5rj1qL6JLYbGzJNaeDSAauCxgQGlWpgoBMITu0MwbEcS4J8eQDtSF8aseyhj
 XMRuow03MubtJ3eTpmFiGZRpLiOy7/o/P3bS28vRJOlSsmlE4rqh794y/bLKDSS+Ed
 Pi9Q3N+AZ89iA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Mar 2025 12:10:54 +0100
Subject: [PATCH v5 11/16] drm/bridge: Introduce drm_bridge_is_atomic() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bridge-connector-v5-11-aacf461d2157@kernel.org>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
In-Reply-To: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sKleaYeZ7mJs6nOj6qpkdQC+JqPOSJpww8MRjOINY+Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7h+0yDpr9dzfzVH85oEYrh1aMs91nVTmbGVxlVd3O
 GZ8YkZpx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIcA5jfdUuweUF9/J++O05
 la/wu/n/QraeHON9FQsO8+4tdXnx1XlV0telQtlz77w+zRI+nefhQcaGlTvnWyeuS59ef0qysan
 Byyvyb3vc/OiEy8FFUed+Okx41V5c++L+mnCZ59+DvmWdywgBAA==
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
2.48.1

