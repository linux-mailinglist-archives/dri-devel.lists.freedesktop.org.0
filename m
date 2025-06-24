Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A3AE5BEF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1A910E4CD;
	Tue, 24 Jun 2025 05:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="IgChX0kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9B10E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 05:45:18 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O5it6I1774779;
 Tue, 24 Jun 2025 00:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750743895;
 bh=eTKTSCgwQi63eDxsR5VB/2nK8gnFY+9cx8VUiRRuPb8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=IgChX0kx6ABJVXlhfGLRMJvQRbZs5KEFb5WGVYyKD16kbzyG1EgcC1fga/lypYWnE
 JLVbsDp+42/55NcWzIyvb3lBq8qmTEV2SI7ah+xCvgNzos3oCZe4XaVlv6tbwS7jv/
 2yM9Q3OCVX7gnR44Kk2A2doJCqqRMv0Jp4iUpXZc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O5itwI1441877
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 24 Jun 2025 00:44:55 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 00:44:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 00:44:54 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.214])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O5is1W1225658;
 Tue, 24 Jun 2025 00:44:54 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <lumag@kernel.org>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
 <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
 <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v4 3/5] drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp
 connector earlier in atomic_enable()
Date: Tue, 24 Jun 2025 11:14:46 +0530
Message-ID: <20250624054448.192801-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624054448.192801-1-j-choudhary@ti.com>
References: <20250624054448.192801-1-j-choudhary@ti.com>
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

In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
NULL pointer while trying to access the mutex. We need the connector to
be set before that. Unlike in legacy !(DBANC) cases, we do not have
connector initialised in bridge_attach(). So set the mhdp->connector
in atomic_enable() earlier to avoid possible NULL pointer.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 1136daaa6c90..872a2c4e1701 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1759,12 +1759,21 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
 	u32 resp;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(mhdp->dev, "bridge enable\n");
 
 	mutex_lock(&mhdp->link_mutex);
 
+	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!mhdp->connector))
+		goto out;
+
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
+	if (WARN_ON(!conn_state))
+		goto out;
+
 	if (mhdp->plugged && !mhdp->link_up) {
 		ret = cdns_mhdp_link_up(mhdp);
 		if (ret < 0)
@@ -1784,15 +1793,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
-	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
-								   bridge->encoder);
-	if (WARN_ON(!mhdp->connector))
-		goto out;
-
-	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
-	if (WARN_ON(!conn_state))
-		goto out;
-
 	if (mhdp->hdcp_supported &&
 	    mhdp->hw_state == MHDP_HW_READY &&
 	    conn_state->content_protection ==
-- 
2.34.1

