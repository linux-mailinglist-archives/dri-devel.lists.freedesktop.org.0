Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BD8CE164
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708E10E323;
	Fri, 24 May 2024 07:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YRLipYsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605A10E323
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 07:14:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44O7Dox9038123;
 Fri, 24 May 2024 02:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716534830;
 bh=8oHVJyl8ghpLM7G3pdOUpqrr8DkSSfn80M8q5wk4pqk=;
 h=From:To:CC:Subject:Date;
 b=YRLipYsQ5DlNWe23I3s8/QqQSexeNUnX4Esle/lvtNZukNtySi1aCLRZpe44NzcVS
 pTA3Nle0vPLxO4jEk1740JP9wZD/Pra8IWFINU6MYCRsWGbtQgGGuym49sYVZAxf+q
 KV20Ah8/oRdOHf358bdzk45wZaXtIsYO8vFMkKvg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44O7DoNj086309
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2024 02:13:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 02:13:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 02:13:49 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.102] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44O7DnPu076318;
 Fri, 24 May 2024 02:13:49 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <u.kleine-koenig@pengutronix.de>, <a-bhatia1@ti.com>,
 <javierm@redhat.com>, <nikhil.nd@ti.com>, <jani.nikula@intel.com>,
 <amishin@t-argos.ru>
Subject: [PATCH] drm: bridge: cdns-mhdp8546: Add mode_valid hook for the
 drm_bridge_funcs
Date: Fri, 24 May 2024 12:43:48 +0530
Message-ID: <20240524071348.106210-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

With the support for the 'DRM_BRIDGE_ATTACH_NO_CONNECTOR' case,
the connector_helper funcs are not initialized if the encoder has this
flag in its bridge_attach call. Till now we had mode_valid hook only in
the drm_connector_helper_funcs. Add this hook in drm_bridge_funcs to
validate the modes in this case as well.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 8a91ef0ae065..0aee038f5db7 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1617,12 +1617,10 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
 	return true;
 }
 
-static
-enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
-					  struct drm_display_mode *mode)
+static enum
+drm_mode_status cdns_mhdp_mode_valid(struct cdns_mhdp_device *mhdp,
+				     const struct drm_display_mode *mode)
 {
-	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
-
 	mutex_lock(&mhdp->link_mutex);
 
 	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
@@ -1635,6 +1633,16 @@ enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
 	return MODE_OK;
 }
 
+static enum drm_mode_status
+cdns_mhdp_connector_mode_valid(struct drm_connector *conn,
+			       struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
+	const struct drm_display_mode *mod = mode;
+
+	return cdns_mhdp_mode_valid(mhdp, mod);
+}
+
 static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
 					    struct drm_atomic_state *state)
 {
@@ -1678,7 +1686,7 @@ static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
 static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
 	.detect_ctx = cdns_mhdp_connector_detect,
 	.get_modes = cdns_mhdp_get_modes,
-	.mode_valid = cdns_mhdp_mode_valid,
+	.mode_valid = cdns_mhdp_connector_mode_valid,
 	.atomic_check = cdns_mhdp_connector_atomic_check,
 };
 
@@ -2233,6 +2241,16 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
 	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
+static enum drm_mode_status
+cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	return cdns_mhdp_mode_valid(mhdp, mode);
+}
+
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
@@ -2247,6 +2265,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
+	.mode_valid = cdns_mhdp_bridge_mode_valid,
 };
 
 static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
-- 
2.25.1

