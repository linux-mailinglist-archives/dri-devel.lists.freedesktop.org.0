Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0945A12D3B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9925010E805;
	Wed, 15 Jan 2025 21:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n6UiRYFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE610E808
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A77D8A42528;
 Wed, 15 Jan 2025 21:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BDBC4CED1;
 Wed, 15 Jan 2025 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975207;
 bh=5zLzfFZPREyjvEuyET+bvMC8ZsqMF5Ry5XDxOdMfXqs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n6UiRYFZNzvlTfen819iBAVzF6FfZpArJHliz49TPpZZ+aqdEL/sGaVcxWjDziOgC
 GGLZtfck4gFI1HO/LSSirx0AWYxaxBKbIGai7V8KDdFgrUUpqzH61eZwLwkEFmGa66
 krlOePI1jnnj0slUNIyVSMocBRuZKkWl+5bkUicmfvvLVZy5ZkANROS/CIqcom5IRx
 EYlLC+THZjcni++cEO0kveyp6au+mC3J/U4p8qDuqWicOJgdrtlt4osz7/jCMnRqLe
 vFTgkvhkRE9vRlb4V3CfLrIWiRLAC458WDfDceW7VEILfyMTsIn1Spe+W1qZUqdikV
 xaY2IVwWhk72A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:31 +0100
Subject: [PATCH 24/29] drm/bridge: Provide a helper to get the global state
 from a bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-24-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5zLzfFZPREyjvEuyET+bvMC8ZsqMF5Ry5XDxOdMfXqs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyvJ3FL9NcPi4LnNzf0pHU6vd0UtMfOebJFsW8X+xm
 Xrk9oIFHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiu/UYG9521p24H2B9Qtvv
 lU33ZPaApBunFh3VOVwkLXlvtfOcRNtXqeelZ2qm+a9RSRU80vx0NWOt2JXtzDE/Hk0IN/55fXr
 e0c6327aq5ZT6lCgt+y+g/ZVvyY/KO647l5lynlLMzohl2M4CAA==
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

We have access to the global drm_atomic_state from a drm_bridge_state,
but since it's fairly indirect it's not as obvious as it can be for
other KMS entities.

Provide a helper to make it easier to figure out.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..bd7959ae312c99c0a0034d36378ae44f04f6a374 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1183,10 +1183,26 @@ static inline struct drm_bridge_state *
 drm_priv_to_bridge_state(struct drm_private_state *priv)
 {
 	return container_of(priv, struct drm_bridge_state, base);
 }
 
+/**
+ * @drm_bridge_state_get_atomic_state() - Get the atomic state from a bridge state
+ * @bridge_state: bridge state object
+ *
+ * RETURNS:
+ * The global atomic state @bridge_state is a part of, or NULL if there is none.
+ */
+static inline struct drm_atomic_state *
+drm_bridge_state_get_atomic_state(struct drm_bridge_state *bridge_state)
+{
+	if (!bridge_state)
+		return NULL;
+
+	return bridge_state->base.state;
+}
+
 struct drm_bridge_state *
 drm_atomic_get_bridge_state(struct drm_atomic_state *state,
 			    struct drm_bridge *bridge);
 struct drm_bridge_state *
 drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,

-- 
2.47.1

