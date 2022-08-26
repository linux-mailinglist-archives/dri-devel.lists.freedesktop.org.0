Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD35A241A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2664510E7BC;
	Fri, 26 Aug 2022 09:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Fri, 26 Aug 2022 09:20:57 UTC
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A24810E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:20:57 +0000 (UTC)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id C5A1A5208BD;
 Fri, 26 Aug 2022 11:11:41 +0200 (CEST)
Received: from vmlxhi-182.adit-jv.com (10.72.94.19) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Fri, 26 Aug
 2022 11:11:41 +0200
From: Michael Rodin <mrodin@de.adit-jv.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sean
 Paul <seanpaul@chromium.org>, Vincent Abriou <vincent.abriou@st.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: do not call detect for connectors which are forced on
Date: Fri, 26 Aug 2022 11:11:21 +0200
Message-ID: <20220826091121.389315-1-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.72.94.19]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
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
Cc: michael@rodin.online, Michael Rodin <mrodin@de.adit-jv.com>,
 erosca@de.adit-jv.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"detect" should not be called and its return value shall not be used when a
connector is forced as hinted in the commit d50ba256b5f1 ("drm/kms: start
adding command line interface using fb.") and the commit 6fe14acd496e
("drm: Document drm_connector_funcs"). One negative side effect of doing
this is observed on the RCar3 SoCs which use the dw-hdmi driver. It
continues executing drm_helper_hpd_irq_event even if its connector is
forced to ON. As consequence drm_helper_hpd_irq_event calls "detect" so the
connector status is updated to "disconnected":

[  420.201527] [drm:drm_helper_hpd_irq_event] [CONNECTOR:76:HDMI-A-1] status updated from connected to disconnected

This status is corrected by drm_helper_probe_single_connector_modes shortly
after this because this function checks if a connector is forced:

[  420.218703] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:76:HDMI-A-1] status updated from disconnected to connected

To avoid similar issues this commit adapts functions which call "detect"
so they check if a connector is forced and return the correct status.

Fixes: 949f08862d66 ("drm: Make the connector .detect() callback optional")
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bb427c5a4f1f..1691047d0472 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -289,7 +289,12 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 retry:
 	ret = drm_modeset_lock(&connector->dev->mode_config.connection_mutex, &ctx);
 	if (!ret) {
-		if (funcs->detect_ctx)
+		if (connector->force == DRM_FORCE_ON ||
+		    connector->force == DRM_FORCE_ON_DIGITAL)
+			ret = connector_status_connected;
+		else if (connector->force == DRM_FORCE_OFF)
+			ret = connector_status_disconnected;
+		else if (funcs->detect_ctx)
 			ret = funcs->detect_ctx(connector, &ctx, force);
 		else if (connector->funcs->detect)
 			ret = connector->funcs->detect(connector, force);
@@ -340,7 +345,14 @@ drm_helper_probe_detect(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	if (funcs->detect_ctx)
+	if (connector->force == DRM_FORCE_ON ||
+	    connector->force == DRM_FORCE_ON_DIGITAL)
+		ret = connector_status_connected;
+	else if (connector->force == DRM_FORCE_OFF)
+		ret = connector_status_disconnected;
+	else if (funcs->detect_ctx)
+		ret = funcs->detect_ctx(connector, ctx, force);
+	else if (funcs->detect_ctx)
 		ret = funcs->detect_ctx(connector, ctx, force);
 	else if (connector->funcs->detect)
 		ret = connector->funcs->detect(connector, force);
-- 
2.25.1

