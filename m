Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0357A12D3A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771CC10E801;
	Wed, 15 Jan 2025 21:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GIGfyyuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524210E801
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 510395C007A;
 Wed, 15 Jan 2025 21:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75023C4CED1;
 Wed, 15 Jan 2025 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975204;
 bh=9T4ReeimU/AWX2mhfPxcnSlL9IFfjkRULA/cewF8mHQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GIGfyyuF+0E+BM33vaISLl+XVtOHjDezKxt5Hfbff+4WRS9uEi4VK/hjxK8fe0WBU
 jIS3TitzqGof5+zg/olNLxeChpg1sKQznxdH6ISHoywmF6nJ1kbuxp+BpA7iPBxI67
 BtVFXO+QU/gG6u3eGIMEw5feCvA8SrCFabEKy/gD/bL5vk/7jMwJGmGC9X3AA23GUA
 pyKP4NN+UQ7mzWo/41uw+wb0fy2zmj9xpe+tSsm5DK4DZkSKbx3f2JYsZ9slvIAvTg
 Ir1EtvboOP8XLD4coKo9Cw2G7ZEIkS3nPa4Ltak4Yi8xClONIJC9+O6ni1Law1ZBop
 EDwGgmxyZQGgA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:30 +0100
Subject: [PATCH 23/29] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-23-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=mripard@kernel.org;
 h=from:subject:message-id; bh=9T4ReeimU/AWX2mhfPxcnSlL9IFfjkRULA/cewF8mHQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyvJz54n9/qZ0dem20yGtusa2pqqvTD9OefyaxSD0y
 Oe7Tz4wdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ/A5ibDjOIOb3p7WmJ3Wm
 nOp7kdCOf0eFQyYzab9YUxzBJKTQ2ex80DFT0OpEvmSJ7ZPCCt4/jDX8XI2xVm7G5Xy67xILtv6
 T1jnLNn9r/5Tm1Mais0xT7z+5fiH6x7JXNT1vbtjvS5js/BQA
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

The current bridge state is accessible from the drm_bridge structure,
but since it's fairly indirect it's not easy to figure out.

Provide a helper to retrieve it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8e18130be8bb85fc2463917dde9bf1d281934184..95c5037a6335e4c1be511e6c31308202015c7754 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -955,10 +955,27 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
 #endif
 
+/**
+ * @drm_bridge_get_current_state() - Get the current bridge state
+ * @bridge: bridge object
+ *
+ * RETURNS:
+ *
+ * The current bridge state, or NULL if there is none.
+ */
+static inline struct drm_bridge_state *
+drm_bridge_get_current_state(struct drm_bridge *bridge)
+{
+	if (!bridge)
+		return NULL;
+
+	return drm_priv_to_bridge_state(bridge->base.state);
+}
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
  *
  * RETURNS:

-- 
2.47.1

