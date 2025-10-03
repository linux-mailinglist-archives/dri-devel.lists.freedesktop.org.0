Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4155BB732C
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414A310E124;
	Fri,  3 Oct 2025 14:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cPuHCayY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0783310E124
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:37:09 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593EajN53108431;
 Fri, 3 Oct 2025 09:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759502205;
 bh=eRtwW9kgEmfhupb6hjqTLv6iszrEJJkIhoAnFqn8n3A=;
 h=From:To:CC:Subject:Date;
 b=cPuHCayYoQazD6DeLfmxdU8jEVMZVThf/aEtKFTL2LphdcLYkF8HSZFznHOYxnn8N
 F88DQVxiIiJPl0WBGx6sU1YScfyrnkjnof82KNfNeyvI4oEYZiZodOE3klQFcd8Pa+
 8/kknAK8yFw24k/vX0/LHuog1BCCgAwiO/7tVtdU=
Received: from DLEE210.ent.ti.com (dlee210.ent.ti.com [157.170.170.112])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593EaiHO821490
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 Oct 2025 09:36:44 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 09:36:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 09:36:44 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.233.157] (may be forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593EahG43514627;
 Fri, 3 Oct 2025 09:36:44 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <jani.nikula@intel.com>,
 <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <s-wang12@ti.com>, <r-donadkar@ti.com>,
 <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Fri, 3 Oct 2025 20:06:42 +0530
Message-ID: <20251003143642.4072918-1-devarsht@ti.com>
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
 drivers/gpu/drm/bridge/sii902x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d537b1d036fb..3d169b9fac70 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -292,10 +292,16 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
+	const struct edid *edid;
 
 	mutex_lock(&sii902x->mutex);
 
 	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
+	if (drm_edid) {
+		edid = drm_edid_raw(drm_edid);
+		if (edid && drm_detect_hdmi_monitor(edid))
+			sii902x->sink_is_hdmi = true;
+	}
 
 	mutex_unlock(&sii902x->mutex);
 
@@ -315,8 +321,6 @@ static int sii902x_get_modes(struct drm_connector *connector)
 		drm_edid_free(drm_edid);
 	}
 
-	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
-
 	return num;
 }
 
-- 
2.39.1

