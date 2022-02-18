Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5554BAEE6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CC810E914;
	Fri, 18 Feb 2022 01:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C41810E213
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:19 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6C13783B61;
 Fri, 18 Feb 2022 02:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146077;
 bh=NPmflDqRkebk6Rl8O5Lv7IkXyAWRjG8E1LLtnuH7Xuc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D69ZIJ2lLxdTb79JkdCNQpbgI3gzolD2zYcCfGxJV5AonUVsaZXofsjsqNUDcATaO
 mhvCMamPpFYPFTdp4YWK+73rpIkrZV0SXsoFEqKp2BtZVo3CDbPNx5zSrx+S/CWdye
 egKaEbPXTYWb4lv3ybg1v2BECy7CKJc3uVJ+uzcDTeaUjtLt/C5sVqX5D2HAFTvlbO
 ZvedNHcYAOt712a3dVLlqO1OvJjqPmALUdYv3W/jrhwQ5mnuVMMyGinxTNMrZ+eLLM
 aaK8Zef2keTgfAkD2HxtH+FCDdgDzEcJl34PY7b1aKLJFHI9PR0QpupinR+LxA1R9P
 ToNBky4q0bWmw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 03/11] drm/bridge: tc358767: Convert to atomic ops
Date: Fri, 18 Feb 2022 02:00:46 +0100
Message-Id: <20220218010054.315026-4-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218010054.315026-1-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the atomic version of the enable/disable operations to continue the
transition to the atomic API. This will be needed to access the mode
from the atomic state.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
---
 drivers/gpu/drm/bridge/tc358767.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 4b8ea0db2a5e8..522c2c4d8514f 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1234,7 +1234,9 @@ static int tc_edp_stream_disable(struct tc_data *tc)
 	return 0;
 }
 
-static void tc_edp_bridge_enable(struct drm_bridge *bridge)
+static void
+tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1259,7 +1261,9 @@ static void tc_edp_bridge_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void tc_edp_bridge_disable(struct drm_bridge *bridge)
+static void
+tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1459,11 +1463,14 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.detach = tc_edp_bridge_detach,
 	.mode_valid = tc_edp_mode_valid,
 	.mode_set = tc_bridge_mode_set,
-	.enable = tc_edp_bridge_enable,
-	.disable = tc_edp_bridge_disable,
+	.atomic_enable = tc_edp_bridge_atomic_enable,
+	.atomic_disable = tc_edp_bridge_atomic_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
-- 
2.34.1

