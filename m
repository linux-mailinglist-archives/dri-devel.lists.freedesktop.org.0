Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228D6D07DE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FBD10E3D5;
	Thu, 30 Mar 2023 14:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70B510E3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:16:37 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B96F660310D;
 Thu, 30 Mar 2023 15:16:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680185796;
 bh=aTfefQf7wUPldM8GfwxyIBQhpoEf1h/RP3aMOHoG5mg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/hJlZxOEbaGyp+oaQoR1ff6jbmyH6VOaZJTv1qkCUr5ZN+0HOzujNwZvlNSON4Wm
 XoW+9USRjLmb7oA6Kc3IMqnzPhTlo882s0QEJs5JX/ZUsdunMcOkutO9RYERJSJAEc
 MP1cf6Xna9f/NN/2VVwr7aLZi0JfG1AQedugoImdSJ8eZKozW6kYU/L6pazR2AdpZf
 QP5uT5uRBpvtgi50o47j1vmpHdURXbCPGoGycob2nHfcY+VRMoDlWhZXmyCdgvlnOY
 E/VqX4LjIOJQhZ7E/qAC26gGrBzLhL0DXtnmpRarUfJiWXVEcRUWS3uOOVJlQSOmFm
 +HfruHQvhoLvQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v1 1/8] drm/mediatek: dp: Cache EDID for eDP panel
Date: Thu, 30 Mar 2023 16:16:23 +0200
Message-Id: <20230330141631.190528-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330141631.190528-1-angelogioacchino.delregno@collabora.com>
References: <20230330141631.190528-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since eDP panels are not removable it is safe to cache the EDID:
this will avoid a relatively long read transaction at every PM
resume that is unnecessary only in the "special" case of eDP,
hence speeding it up a little, as from now on, as resume operation,
we will perform only link training.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..84f82cc68672 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -118,6 +118,7 @@ struct mtk_dp {
 	const struct mtk_dp_data *data;
 	struct mtk_dp_info info;
 	struct mtk_dp_train_info train_info;
+	struct edid *edid;
 
 	struct platform_device *phy_dev;
 	struct phy *phy;
@@ -1993,7 +1994,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		usleep_range(2000, 5000);
 	}
 
-	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
+	/* eDP panels aren't removable, so we can return a cached EDID. */
+	if (mtk_dp->edid && mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		new_edid = drm_edid_duplicate(mtk_dp->edid);
+	else
+		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
 
 	/*
 	 * Parse capability here to let atomic_get_input_bus_fmts and
@@ -2022,6 +2027,10 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 	}
 
+	/* If this is an eDP panel and the read EDID is good, cache it for later */
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && !mtk_dp->edid && new_edid)
+		mtk_dp->edid = drm_edid_duplicate(new_edid);
+
 	return new_edid;
 }
 
-- 
2.40.0

