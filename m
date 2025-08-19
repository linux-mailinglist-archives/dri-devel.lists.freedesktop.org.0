Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825FFB2BE0A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FD10E584;
	Tue, 19 Aug 2025 09:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xXN6mLqv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 572 seconds by postgrey-1.36 at gabe;
 Tue, 19 Aug 2025 09:52:17 UTC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC5F10E584
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:52:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4BB741A09EE;
 Tue, 19 Aug 2025 09:42:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 247BD60697;
 Tue, 19 Aug 2025 09:42:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22EA81C22A3C7; 
 Tue, 19 Aug 2025 11:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755596562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2zNEQPZm8ICen3OOvc7q25hoGo9P+jznlNsABvPRulI=;
 b=xXN6mLqvOUaVJoNCPpIvghQ8ufVJlS7dDO2xiPJ5CNBjIcvpn3Dsoje/ErdeiW/bcgPvXg
 e+bm7Ds9lm9vf4LNnRdjye7n2nbiuRf1RbalKE0Cxk2GsDMYBwortejAfo5/pD+SsXO+75
 BiiCijda81WjuMOK9eT/TmopY1iW1EOBSMF8MWwMlgCVQUPcku4B2qUqcRKK930oGlz6wi
 +VD3F01DN+MfutUSzXRAfPRcsrTjAD7GDCPSG0z7Vmn/DRE2mmmoTcMZWMtdTzycjxGGQh
 4oPDzg6q7mG5LhEsQ9h0XfNlRPoVvO9NZYTjkq1vf1tqkqkruXMEFzq6TFNTeQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 Aug 2025 11:42:12 +0200
Subject: [PATCH v7 3/3] drm/debugfs: show removed bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-bridge-debugfs-removed-v7-3-970702579978@bootlin.com>
References: <20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com>
In-Reply-To: <20250819-drm-bridge-debugfs-removed-v7-0-970702579978@bootlin.com>
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
refcounted bridges can stay allocated for a long time after
drm_bridge_remove(), and a memory leak due to a missing drm_bridge_put()
would not be visible in this debugfs file.

Add removed bridges to the /sys/kernel/debug/dri/bridges output.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

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
index 2e688ee14b9efbc810bcdb0ab7ecd4b688be8299..4e9ad8a198e357c448b82a1ff5e07e558a6168d6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1498,17 +1498,20 @@ EXPORT_SYMBOL(devm_drm_put_bridge);
 
 static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
 					   struct drm_bridge *bridge,
-					   unsigned int idx)
+					   unsigned int idx,
+					   bool removed)
 {
 	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
 
-	drm_printf(p, "\trefcount: %u\n", kref_read(&bridge->refcount));
+	drm_printf(p, "\trefcount: %u%s\n", kref_read(&bridge->refcount),
+		   removed ? " [removed]" : "");
 
 	drm_printf(p, "\ttype: [%d] %s\n",
 		   bridge->type,
 		   drm_get_connector_type_name(bridge->type));
 
-	if (bridge->of_node)
+	/* The OF node could be freed after drm_bridge_remove() */
+	if (bridge->of_node && !removed)
 		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
 
 	drm_printf(p, "\tops: [0x%x]", bridge->ops);
@@ -1534,7 +1537,10 @@ static int allbridges_show(struct seq_file *m, void *data)
 	mutex_lock(&bridge_lock);
 
 	list_for_each_entry(bridge, &bridge_list, list)
-		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, false);
+
+	list_for_each_entry(bridge, &bridge_removed_list, list)
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, true);
 
 	mutex_unlock(&bridge_lock);
 
@@ -1549,7 +1555,7 @@ static int encoder_bridges_show(struct seq_file *m, void *data)
 	unsigned int idx = 0;
 
 	drm_for_each_bridge_in_chain_scoped(encoder, bridge)
-		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
+		drm_bridge_debugfs_show_bridge(&p, bridge, idx++, false);
 
 	return 0;
 }

-- 
2.50.1

