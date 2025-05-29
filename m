Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2BAC7F9F
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 16:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2910E730;
	Thu, 29 May 2025 14:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="PtBvsrJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C310E734
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 14:25:38 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TEPMO03542540;
 Thu, 29 May 2025 09:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1748528722;
 bh=ZByoL64g5kJxcxNyedO7QZs4Way40dPH4ibaMqNKB5w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PtBvsrJ+0YHFkEcyv3C8qGdYfofdNORoaEh5sB3LQumzV5KzxbNAHb68rMclCL3+l
 RWXRGWMo0tmcjeoCTK1aVN84s9hOKyciwsw1GaAH+P+mex0SriC1dUAzVEjWSmx+/4
 CLMd9znDvQEaYAn2QqI7JCi9uUWUzmq22SQuE8DI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TEPLTC090774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 29 May 2025 09:25:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 09:25:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 09:25:21 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TEPKNw1657124;
 Thu, 29 May 2025 09:25:21 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <andyshrk@163.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <lumag@kernel.org>, <lyude@redhat.com>, <andy.yan@rock-chips.com>,
 <mordan@ispras.ru>, <linux@treblig.org>, <viro@zeniv.linux.org.uk>,
 <a-bhatia1@ti.com>, <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 2/5] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
Date: Thu, 29 May 2025 19:55:14 +0530
Message-ID: <20250529142517.188786-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529142517.188786-1-j-choudhary@ti.com>
References: <20250529142517.188786-1-j-choudhary@ti.com>
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

After adding DBANC framework, mhdp->connector is not initialised during
bridge_attach(). The connector is however required in few driver calls
like cdns_mhdp_hdcp_enable() and cdns_mhdp_modeset_retry_fn().
Use drm_connector pointer instead of structure, set it in bridge_enable()
and clear it in bridge_disable(), and make appropriate changes.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 ++++++------
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 4c79a64dad41..df604c384bb2 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1755,7 +1755,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	struct cdns_mhdp_bridge_state *mhdp_state;
 	struct drm_crtc_state *crtc_state;
-	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
@@ -1785,12 +1784,12 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
-	connector = drm_atomic_get_new_connector_for_encoder(state,
-							     bridge->encoder);
-	if (WARN_ON(!connector))
+	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!mhdp->connector))
 		goto out;
 
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
 	if (WARN_ON(!conn_state))
 		goto out;
 
@@ -1853,6 +1852,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 		cdns_mhdp_hdcp_disable(mhdp);
 
 	mhdp->bridge_enabled = false;
+	mhdp->connector = NULL;
 	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
 	resp |= CDNS_DP_NO_VIDEO_MODE;
@@ -2133,7 +2133,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = &mhdp->connector;
+	conn = mhdp->connector;
 
 	/* Grab the locks before changing connector property */
 	mutex_lock(&conn->dev->mode_config.mutex);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c7306..b297db53ba28 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -375,7 +375,7 @@ struct cdns_mhdp_device {
 	 */
 	struct mutex link_mutex;
 
-	struct drm_connector connector;
+	struct drm_connector *connector;
 	struct drm_bridge bridge;
 
 	struct cdns_mhdp_link link;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 42248f179b69..59f18c3281ef 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 	int ret;
 
 	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+		mhdp->connector->name, mhdp->connector->base.id);
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
 
@@ -445,7 +445,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 
 	dev_err(mhdp->dev,
 		"[%s:%d] HDCP link failed, retrying authentication\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+		mhdp->connector->name, mhdp->connector->base.id);
 
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
 	if (ret) {
@@ -487,13 +487,13 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(hdcp,
 						     struct cdns_mhdp_device,
 						     hdcp);
-	struct drm_device *dev = mhdp->connector.dev;
+	struct drm_device *dev = mhdp->connector->dev;
 	struct drm_connector_state *state;
 
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&mhdp->hdcp.mutex);
 	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector.state;
+		state = mhdp->connector->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

