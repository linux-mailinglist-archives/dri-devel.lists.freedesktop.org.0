Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322DC817AC4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EB010E3BA;
	Mon, 18 Dec 2023 19:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890EA10E390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926929; x=1734462929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lv189ze1HjPcTpyti3gs1HfX3zuxk+ObuRHYy8a0Yc=;
 b=CzNalZDIBgUEr9n3fkdXrTdnSfy7Mm9sArWl86VBnD+2lGY8QO6Oxlo/
 y4twLHdPSOMD/9z6YqDMdKT63oufJuH2a+4hMLhxMRkvQb+lYIkKA16BH
 5j8ZTwtYmLAGUa966nk/+X8nBzoOP8lsmr4iyl6m7djptnIoaQdePzmXy
 8xS1imLEymVpiEAOQ4SzAr2gLvGLSaAwhANqPhqhjg5bEoDEM8WC4nG2K
 Iv/hoMGF8O9Wikn2aqYgc0EY44V20rUijHSW5mNxFJrBoaJp3CgqQDsHu
 9i9yT3BeUApncvX98TDRjPVATECu+Ru98t4eW70qfVBXQMmwMEawRwFJp A==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559832"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:21 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 71814280084;
 Mon, 18 Dec 2023 11:57:21 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/6] drm/bridge: imx: imx-ldb-helper: Use dev_err_probe
Date: Mon, 18 Dec 2023 11:57:15 +0100
Message-Id: <20231218105718.2445136-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 6967325cd8ee..9b872cfb849c 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -172,7 +172,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 {
 	struct device *dev = ldb->dev;
 	struct ldb_channel *ldb_ch;
-	int ret, i;
+	int i;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
 		ldb_ch = ldb->channel[i];
@@ -182,14 +182,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 
 		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
 							     1, 0);
-		if (IS_ERR(ldb_ch->next_bridge)) {
-			ret = PTR_ERR(ldb_ch->next_bridge);
-			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev,
-					      "failed to get next bridge: %d\n",
-					      ret);
-			return ret;
-		}
+		if (IS_ERR(ldb_ch->next_bridge))
+			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
+					     "failed to find next bridge\n");
 	}
 
 	return 0;
-- 
2.34.1

