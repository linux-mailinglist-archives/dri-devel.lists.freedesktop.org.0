Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF1784019
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7C810E327;
	Tue, 22 Aug 2023 11:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACEE10E327
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692705125; x=1724241125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pu2JihUeZ+Xsrrg0HNxh/onY2ikC55PTrTYgkaTJU2s=;
 b=gVTAysNH5B7fODiBzjiWgoAe9eeCkrNS2hIH5Mmkcp1nl0jJ0VT0bBc1
 +/fh/OcGf+DHqnVYD9iuMGr4bH8pwmGith7l+BCeMES7F4INsUAnE7jRL
 wPgCzIx4rPC7mX7c+uisCJibSdgi8RKUf7I4hdWRQkYOyvY7WwaDJU+Ah
 E+MDf1xJ5oWpNvF0F44Mtp5YTFGluGFUO0wez+hGhLhra5uDx2gQr+qye
 kceqlVELXhrU8FMP2VzJwPUR69txiakKHZXaGwRAUgdXRQDIQ1WFWx62L
 NmrF1ZhWDEpSrtrHxDS8gIEVqPZbPM6I8AnxjilHZO7mi2/8Vi8gSy2th g==;
X-IronPort-AV: E=Sophos;i="6.01,192,1684792800"; d="scan'208";a="32562485"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 22 Aug 2023 13:52:03 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 328A4280075;
 Tue, 22 Aug 2023 13:52:03 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Tue, 22 Aug 2023 13:52:00 +0200
Message-Id: <20230822115200.712231-1-alexander.stein@ew.tq-group.com>
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

When -EPROBE_DEFER is returned do not raise an error, but silently return
this error instead. Fixes error like this:
[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Adjust the indentation

Considering Laurent's input IMHO -517 should not occur when using component
framework, e.g. drivers/gpu/drm/mcde/mcde_drv.c. This should warrant to only
print an error if it is not deferred probe.
dev_err_probe() sounds reasonable, but this is something which should be done
in drivers. It is also arguable if this message is "hidden" within a debug
statement.

 drivers/gpu/drm/drm_bridge.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 39e68e45bb124..132180a03c0eb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -352,13 +352,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
+	if (ret != -EPROBE_DEFER) {
 #ifdef CONFIG_OF
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-		  bridge->of_node, encoder->name, ret);
+		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+			bridge->of_node, encoder->name, ret);
 #else
-	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
-		  encoder->name, ret);
+		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
+			encoder->name, ret);
 #endif
+	}
 
 	return ret;
 }
-- 
2.34.1

