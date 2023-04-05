Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F96D75E3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EDB10E855;
	Wed,  5 Apr 2023 07:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AF710E855
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680681154; x=1712217154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ACkQIz0HgFos+YXo9V5mft0d3fgcbgEVuIDukGfZwVE=;
 b=OQSdLsobUa1/wF+tQjwJ2pmQu1EdOWJc8Nu0vES3zUp8/jy9iLbnJhCJ
 beWA5vKCfRb5hGFLErYxxXUmMRTL9t1VrD/DAtLIHdh3uXH7hp0KyIEgB
 k+uNrd7Vfwg7sJlW+yNKGPBZ/mP3U5vf8ge6tG2w26JIYSx5qM6RyophA
 v1ZqefFmQGjYy5PBXCZ9rsVJVuwPtx0Xi82wbPoqS27I741ohnx42LTRe
 ypN4dWZ39/nlTvdJlvV3tjAlDIKYjXprxYoPuRSn2Be/riVZNELqJu0wO
 mHiFhdag2EkIJe0r3p+9tM2rKTRVbjQhfRMzUoCbKuwoTaYCTQGEsADBX A==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30155776"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 05 Apr 2023 09:52:31 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 05 Apr 2023 09:52:31 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 05 Apr 2023 09:52:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680681151; x=1712217151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ACkQIz0HgFos+YXo9V5mft0d3fgcbgEVuIDukGfZwVE=;
 b=B/nptGNypjB+n5AY66RaP9r8rsM3uy/TYfwUjJbaWrjviUCcK3OUeVaP
 2BqHUinYeNaYabcK2ZZx/OuX8pzl+2HGj/uTSuaSG1GJsOepQFm4Yjbw0
 UiRUlEN4mivD+ZJ4rTpinBvx5UUzmjL53HZr6CBoRg3mVQF4Th7PYkedu
 xZIS4+Z3kPUbQ9QGEfQtESPt/meqKmeVzqI11Q0XI6M/uP6Z3GCOJ+NBD
 B3PRFhwpBDLSeTC38KoG+H7fVqZlTUNUrDsrSHP87jHPYwBXghzbzedEh
 o2U0oM4uSc4VEz9QbVU0UZTC8CoPZvqHdPSsDRnO1DsKzFSLOaSgSmSea g==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673910000"; d="scan'208";a="30155774"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 05 Apr 2023 09:52:31 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3D5E4280056;
 Wed,  5 Apr 2023 09:52:31 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: ti-sn65dsi83: use dev_err_probe if host
 attach failed
Date: Wed,  5 Apr 2023 09:52:23 +0200
Message-Id: <20230405075223.579461-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There might be cases where the host attach is deferred, use dev_err_probe
to add more detailed information to /sys/kernel/debug/devices_deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 91ecfbe45bf9..988e537ab884 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -698,8 +698,10 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);
-	if (ret)
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to attach DSI host\n");
 		goto err_remove_bridge;
+	}
 
 	return 0;
 
-- 
2.34.1

