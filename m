Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F5C4EDD4B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599389D7C;
	Thu, 31 Mar 2022 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CC089058
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:39:39 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ED33683B0D;
 Thu, 31 Mar 2022 17:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648741178;
 bh=4amBSfd9cm80ZsnDOCWuoTiI1dJTtgLYV9KcJzxKN4M=;
 h=From:To:Cc:Subject:Date:From;
 b=NQ7m81y4ML5a6hJyMoZEV90w4FgsZD+efOxMir1GEKeZ2TDbSRihCokl8/6jMWiwe
 Id9OZM3NPP/HT5Ipl5C4TAm3qqNecgxF2RFvk0w3RXCkJOfJ3zRx1OJsZvjb1ZDUpe
 LvBU2kDBbNq1c+5HSW5da5cSzTqA1gWoKZF3BK72i1JO+pa7g6rneyeEH2i3WEYVF3
 E60euN+eONJbezocJRUWHbU4z0Oq2vX7h6d3Dr1n4H57RqB6CaURBBHpjVObpS7rc2
 E4A+TczLM9wzjP+KIBwGVDccyCviWh9iFFzW/1PmS8uw7HjVPI3yl+TanqMqE2kHhe
 OXR7klhnI6lmw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND][PATCH 1/2] drm/bridge: lt9611: Switch to atomic operations
Date: Thu, 31 Mar 2022 17:39:22 +0200
Message-Id: <20220331153923.14314-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the atomic version of the enable/disable operations to continue the
transition to the atomic API. This will be needed to access the mode
from the atomic state.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 63df2e8a8abc..9b3ac3794a2c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -700,7 +700,9 @@ lt9611_connector_mode_valid(struct drm_connector *connector,
 }
 
 /* bridge funcs */
-static void lt9611_bridge_enable(struct drm_bridge *bridge)
+static void
+lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
@@ -721,7 +723,9 @@ static void lt9611_bridge_enable(struct drm_bridge *bridge)
 	regmap_write(lt9611->regmap, 0x8130, 0xea);
 }
 
-static void lt9611_bridge_disable(struct drm_bridge *bridge)
+static void
+lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	int ret;
@@ -856,7 +860,9 @@ static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 	lt9611->sleep = false;
 }
 
-static void lt9611_bridge_post_disable(struct drm_bridge *bridge)
+static void
+lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
@@ -919,13 +925,17 @@ static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
-	.enable = lt9611_bridge_enable,
-	.disable = lt9611_bridge_disable,
-	.post_disable = lt9611_bridge_post_disable,
 	.mode_set = lt9611_bridge_mode_set,
 	.detect = lt9611_bridge_detect,
 	.get_edid = lt9611_bridge_get_edid,
 	.hpd_enable = lt9611_bridge_hpd_enable,
+
+	.atomic_enable = lt9611_bridge_atomic_enable,
+	.atomic_disable = lt9611_bridge_atomic_disable,
+	.atomic_post_disable = lt9611_bridge_atomic_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int lt9611_parse_dt(struct device *dev,
-- 
2.35.1

