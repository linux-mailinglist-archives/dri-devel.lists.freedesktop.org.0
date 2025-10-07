Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A40BBC131E
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 13:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E30B10E18D;
	Tue,  7 Oct 2025 11:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uuSHBBh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5010110E18D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 11:23:24 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597BNBo43748368;
 Tue, 7 Oct 2025 06:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759836191;
 bh=4KNIFjNPxwNPgtviTOOqfAT97sq7NEDYsdF9WCpvtF4=;
 h=From:To:CC:Subject:Date;
 b=uuSHBBh2/xiKm8wz6ta+YL1PdG30U/vG9IOaW4Xl91Du/RwYrywFKZFFJz0o41sdV
 KHXV9IR8RXH9wz2EgZd0sdfaP5PTJ9Y/ZvaXCSbuROaZT1vkLLdNWDTxLyi/9FGKs8
 TmhyLiQTJdrdvruOYCSzdnfRfQ9Dcqcf741d7XAE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597BNBEc650378
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 7 Oct 2025 06:23:11 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 06:23:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 06:23:10 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.233.157] (may be forged))
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597BN9Dj1039554;
 Tue, 7 Oct 2025 06:23:10 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <tomi.valkeinen@ideasonboard.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
 <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <s-wang12@ti.com>,
 <r-donadkar@ti.com>, <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v3] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Tue, 7 Oct 2025 16:53:09 +0530
Message-ID: <20251007112309.1103811-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

The SII902x HDMI bridge driver wasn't working properly with drivers that
use the newer bridge connector architecture with the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, like TIDSS.  This caused HDMI audio to
fail since the driver wasn't properly setting the sink_is_hdmi flag when
the bridge was attached without a connector since .get_modes() is never
called in this case. Fix it by setting sink_is_hdmi flag when reading
the EDID block itself.

Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V3: Use drm_edid_connector_update without edid NULL check
V2: Use drm_edid_connector_update to detect HDMI

Link to V2:
https://lore.kernel.org/all/20251006150714.3144368-1-devarsht@ti.com/
Link to V1:
https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/

 drivers/gpu/drm/bridge/sii902x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb..bb613d4c281f 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -296,6 +296,8 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
 	mutex_lock(&sii902x->mutex);
 
 	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
+	drm_edid_connector_update(connector, drm_edid);
+	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
 
 	mutex_unlock(&sii902x->mutex);
 
@@ -309,14 +311,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	int num = 0;
 
 	drm_edid = sii902x_edid_read(sii902x, connector);
-	drm_edid_connector_update(connector, drm_edid);
 	if (drm_edid) {
 		num = drm_edid_connector_add_modes(connector);
 		drm_edid_free(drm_edid);
 	}
 
-	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
-
 	return num;
 }
 
-- 
2.39.1

