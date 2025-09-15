Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A7B575E0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC8610E3D9;
	Mon, 15 Sep 2025 10:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CtZTMnMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266E910E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:14:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BAC6DC8F1D2;
 Mon, 15 Sep 2025 10:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CD9B6063F;
 Mon, 15 Sep 2025 10:14:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32F1E102F2ABB; 
 Mon, 15 Sep 2025 12:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757931245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MxaPaKKWKs3ulFwyzozXHLb7YuQsngXreF1xvu2bmpo=;
 b=CtZTMnMU03MxTsrWXJ9NXMRSnC0dMIdN9ALKSTRBqUHAc7zlUv+xA2w7kfdoJKHwa/y5J/
 63Nq+cjEoHfO5MKZd0vlB6xyPwf2YDm0Y6UPJaI8JUqtVFpkcFfCGCtC0L+So0A2FDwZL0
 W6+orSJQh/TbX17Trd9bW3xtJG3P/e3ymWii4/1pEQnuWsEEZiLrhauMYqDAkF6LrWk2bN
 WWBb7AqKUKtkOBN983pbMZebyzDH9mWONo2pFFbfZNbZ/KtKXTSTpUdQyzJRJHKuwyWkAw
 pzjxZnALiNY7i2jeKZbWzcZ9AnMXaAfbGg+mCsJwRZX8STxTrPqihKUtY/4Dsw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 15 Sep 2025 12:12:47 +0200
Subject: [PATCH v9 2/3] drm/debugfs: show lingering bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-drm-bridge-debugfs-removed-v9-2-6e5c0aff5de9@bootlin.com>
References: <20250915-drm-bridge-debugfs-removed-v9-0-6e5c0aff5de9@bootlin.com>
In-Reply-To: <20250915-drm-bridge-debugfs-removed-v9-0-6e5c0aff5de9@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

The usefulness of /sys/kernel/debug/dri/bridges is limited as it only shows
bridges between drm_bridge_add() and drm_bridge_remove(). However
refcounted bridges can stay allocated and lingering for a long time after
drm_bridge_remove(), and a memory leak due to a missing drm_bridge_put()
would not be visible in this debugfs file.

Add lingering bridges to the /sys/kernel/debug/dri/bridges output.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v9:
- rename leftover instances of "removed" to "lingering"

Changes in v8:
- updated to rename bridge_removed_list -> bridge_lingering_list

Changes in v7:
- rebased on current code which is in drm_bridge.c now
- removed if (drm_bridge_is_refcounted(bridge)), refcounting is not
  optional
- don't show bridge address
- improve commit message

This patch was added in v6.
---
 drivers/gpu/drm/drm_bridge.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9491ae7c884d355be4a82fb02a43a42d17fa8e0c..dda4e641a38fa38cef16296366eea08fe8702618 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1491,17 +1491,20 @@ EXPORT_SYMBOL(devm_drm_put_bridge);
 
 static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
 					   struct drm_bridge *bridge,
-					   unsigned int idx)
+					   unsigned int idx,
+					   bool lingering)
 {
 	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
 
-	drm_printf(p, "\trefcount: %u\n", kref_read(&bridge->refcount));
+	drm_printf(p, "\trefcount: %u%s\n", kref_read(&bridge->refcount),
+		   lingering ? " [lingering]" : "");
 
 	drm_printf(p, "\ttype: [%d] %s\n",
 		   bridge->type,
 		   drm_get_connector_type_name(bridge->type));
 
-	if (bridge->of_node)
+	/* The OF node could be freed after drm_bridge_remove() */
+	if (bridge->of_node && !lingering)
 		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
 
 	drm_printf(p, "\tops: [0x%x]", bridge->ops);
@@ -1527,7 +1530,10 @@ static int allbridges_show(struct seq_file *m, void *data)
 	mutex_lock(&bridge_lock);
 
 	list_for_each_entry(bridge, &bridge_list, list)
-		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, false);
+
+	list_for_each_entry(bridge, &bridge_lingering_list, list)
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, true);
 
 	mutex_unlock(&bridge_lock);
 
@@ -1542,7 +1548,7 @@ static int encoder_bridges_show(struct seq_file *m, void *data)
 	unsigned int idx = 0;
 
 	drm_for_each_bridge_in_chain_scoped(encoder, bridge)
-		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, false);
 
 	return 0;
 }

-- 
2.51.0

