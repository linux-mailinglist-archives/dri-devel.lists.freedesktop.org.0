Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AAEA27526
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4610E68B;
	Tue,  4 Feb 2025 15:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a8XgoH16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191A10E68C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 02F7B5C6A9D;
 Tue,  4 Feb 2025 14:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F739C4CEE6;
 Tue,  4 Feb 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681231;
 bh=SZ80RYYbOzS9KBgx+LvZ/ITH8QJeNJfXoz1zlA4N1ZM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=a8XgoH16h0po1cDBCNjxTR3jinuLzvt9v9OJM8KP805TguPW/PRmzmfE/UGB+UPUt
 sIAb475qR3ZPTbrQ2rmqgAB8rxVpPnYuPeFOwTCZWAoZ5R8HuJfYcfDwysm0YeSDPr
 f8NhqUnfHA8oI8PHkrGA+xdYkETjivE1jptTR5IvKaVXVcaPZbub2h2HbzSXrP1ZsJ
 BNAWHO6ojZSaHOwDSiUaOMka79q390SJkciwhStEvdnc7lVCYDRNYEc+LIZDDIx10C
 mGnDpFauKERNtuNEyBO34QMdnupoWVGYDHjU9z0sIoZHSs1Xqlw2Vtk6f42PUu0Ecp
 60iV6j9aEyRKQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:56 +0100
Subject: [PATCH v2 28/35] drm/bridge: Provide a helper to retrieve current
 bridge state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SZ80RYYbOzS9KBgx+LvZ/ITH8QJeNJfXoz1zlA4N1ZM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL7mvXArLK15Lan/rP39bPWwGSudk7sPSAusEF+vK
 CYrVW7bMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYSUsrYsHqfmvYa4xPGr7xO
 HcjVuNahpS9V4CHtJe8oduLwKYds35pNvYZNqh23ezU0/58z8tFlrE/bGFUvPM90PqtFX+50i0V
 /Qr8zn3KVeuzwVOyLar3xfvEVC5N+X+OeHWYa27fXeVrPWQA=
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
 include/drm/drm_bridge.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cf7ab89e652a982510ae9df1f5972b9c6eb13cf2..7a3664770c3ab8634a69e953b37a30ac467139b3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -955,10 +955,31 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
 #endif
 
+/**
+ * @drm_bridge_get_current_state() - Get the current bridge state
+ * @bridge: bridge object
+ *
+ * This function must be called with the modeset lock held.
+ *
+ * RETURNS:
+ *
+ * The current bridge state, or NULL if there is none.
+ */
+static inline struct drm_bridge_state *
+drm_bridge_get_current_state(struct drm_bridge *bridge)
+{
+	lockdep_assert_held(&bridge->base.lock.mutex.base);
+
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
2.48.0

