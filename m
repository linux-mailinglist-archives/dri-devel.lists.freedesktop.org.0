Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B878C6933E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F510E486;
	Tue, 18 Nov 2025 11:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="K9MhYjxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCBD10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riSBN4wn1ID0ifNkbJj89AfSh1zNbVarl63fT3CNtAf6d32RsNUY2NFAK2de5a9ZZylkerJLonmT/A8pt6d7gci3dMuUeL+Avy6k3oMjViFqFeOro7p/jNTJGN/jXVFpyskn4gd46Kva6yDELlM1Jr5hBZE+nTpW+QRXx4I05/TWFcgsxRU1TB6efGHwarcJWl1LGtfRA6Lb3XqJZ11+oBkp07j6HBN1iSCR7WwVCkoU+QYK9Ufaru7Dcd7RJZHsmw/QW50p8LBRkBBqcRU9eH0zrsXKnxk1C6/CSQFDAQyc+chY0xYXPo9FvvznNrw/fhvPb67lItK9rFejzUtB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBPA0tNMaCuO/8J9/FwxB2kGR7Iq4HY6KmoZTbg5mFM=;
 b=zDAeBsGEERLCFv2QEiojiR393y9IUzFaXl22mcUwDdfv/I8KYpMUArkpOCe32+5o0iP018YAI8h6JkE/8nNeSpEHfEuEbkYucy0P8VNa0bnWXEdi2OOpWI7Lj1N5jwDnbXP8IKxnqDlHavib5YYcK15IPvXnpaRtfxD3brz4CpuSYDGp5tSAhCLfu1OyLPUZjcv8o53xiJfjuYaifpLDWwQ9hFWPax8OgfX18HwsUu+k1PxLmWN7y+rb3zPuId/jMbEZTFJe8XrKrdLhuq5WS9ecIp0u7qW6Rg7mc4+hsU5SYHJAt9aoCHAa6EGDkgnLM+2bJixdcTeLw/TK9Ij4SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBPA0tNMaCuO/8J9/FwxB2kGR7Iq4HY6KmoZTbg5mFM=;
 b=K9MhYjxE7xfid6BGqZewV3wvWC8Rn5bc/amzoahUhCpNPJvVmRZNINM4OBNWcsccCu1nY+AvntaWVrOSLxoc/Zj2ZX4OpoykFounvzTHniPNBZWFycI+PCXP4mQDRkezxw5S9R49yJZtmiVhY7bnybnlaGFzexPk5ujPPXKs9h8=
Received: from MN0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:208:530::22)
 by DS0PR10MB6029.namprd10.prod.outlook.com (2603:10b6:8:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 11:53:15 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::ea) by MN0PR02CA0028.outlook.office365.com
 (2603:10b6:208:530::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:14 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:10 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:09 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulO006869;
 Tue, 18 Nov 2025 05:53:03 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH v9 1/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp
 connector earlier in atomic_enable()
Date: Tue, 18 Nov 2025 17:22:50 +0530
Message-ID: <20251118115255.108225-2-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR10MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 6799df2b-f1d3-4ca7-f214-08de26990e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2E2AGeQo2ESVvHzYbIz8vs2U/NW5sojX+TyYxEdGVAh7Ncx3WN5BvrwxXIho?=
 =?us-ascii?Q?XBULfTJvO5epy0nRGW4xwe65xyyIoWl9tPMD8Hc9qCnAdeBLpOZitf8oFFdy?=
 =?us-ascii?Q?aPhQ4c1BCiSD2xvwP0cJsXHOxd0h7RYIM7m8zYFbGq7zl2lG3V+v3Ln8PIAj?=
 =?us-ascii?Q?SyA/qi3YcrjAt7ZqCatDWvuofFNjm/IlyabVlxtdJfxXRpaX848Zp4UX6bPS?=
 =?us-ascii?Q?WYYgmAgFPoKkZJ+qCRi4t4fp/KJLqVex+vrZKrqNGbUHI6fUztWSp71Kgg2x?=
 =?us-ascii?Q?ZtNTPvYukMW4mK+v7S6BfFzC9/Z1X63WhF7EQpo2DVsfoO25wxiwaUZcJW5y?=
 =?us-ascii?Q?e7jUNYZ+J+vHIkhr6qP9H1N0i9MpzTeutpbdVWI1phFQ1u4TaHF02F5sfO/O?=
 =?us-ascii?Q?8csU9zOMSdB5ucOHK0/ZR1D/GWVR3WCKVILewotZTy5aWdq2Zz2hujQu3+6b?=
 =?us-ascii?Q?05jaGweriO6MmH7/lwuO5t72sZha9ftiIPcSpUqYdgMWpVEEMNR/9Re9q0de?=
 =?us-ascii?Q?Qha2tKtp5JFSbe1hfssvLxdGg9kZhygtNeEvkU/N+w+l8DqUhgTNHrklS2Rn?=
 =?us-ascii?Q?6aUrvbjXKwRo1sD0T9H1IDvRLsGilvdj7P/wYNjG86PG249kyAAv+WEFU76N?=
 =?us-ascii?Q?3UR/x1Q9E51JFHuxlsIoxaZs+aOCXdyRkprG/ft3f6yw/tX4B0P80Fp1bV8Y?=
 =?us-ascii?Q?dxbYsHGwFFXSqsjSWvwrJgu547McyKiGkrLZP++ebe3tt6wPbpD49ypwF0xy?=
 =?us-ascii?Q?WJ6TEPiTBWezs7MHX8zcj0MmLZy7xQD9YFAOzvOwJ27mjFkCyXqq9JuMLv6N?=
 =?us-ascii?Q?hHDG6MlWVy5AXCVsWPjPakyYEA0sWqkLmaboV3vQrCrIwLlQPILvq7h92YS5?=
 =?us-ascii?Q?ntV+cjPJCP1nZdnMc7FIMbfVvhMBu0vl9v/x7td6dGfy8WW9paTrrN4xoPdS?=
 =?us-ascii?Q?1MlqxNXjJMkGidvaqbycYQDfIJOE+WG39yicsWJcMKGCw9l27ZC2prbPR/PQ?=
 =?us-ascii?Q?CtZChWZNyuCzABypVC84QOQeYHKBDn+MR51zjuFzfsTSfIzkITnWjKxzvpCZ?=
 =?us-ascii?Q?XLU3MwTlZ55N5rzvDKdaPxydcdXwJuEj35/zhfQTdXj5PGXbFCTIKj9G40Ff?=
 =?us-ascii?Q?037NHDBeOc9oACVobdocmBGt46YZhMIsSnCMxii1h2N5vaPosPB4+rjhKKGA?=
 =?us-ascii?Q?P1DTUmwC/XGzcwBNYvEesUn/uXKLehMoW18ViKUK48YjlxPTf4TBLjJGrR+Y?=
 =?us-ascii?Q?jfhe7m05sOHaLjkTm6HcLJnANMJb2/IGmee6YH/WmqklrP1/BvTYPZm3HI4d?=
 =?us-ascii?Q?0B0863LZi/G6aSINA6D4VKAN22M6KlL6YA4smot5h6f3CXHyeFCjTuGWMqvA?=
 =?us-ascii?Q?WZNGQPuIGGgmf17qS1n5TqTrARWHVHjoO6pxonr/D+L1B35h0Q7o0GT4ryOT?=
 =?us-ascii?Q?aADhNQ7oZWJEdNo1lqE0iNavgHMT/zCywnZBWi7U/3bpBx77r3c2R7z3TVsR?=
 =?us-ascii?Q?LZF7UOkthsXRLYJhBPJ89r0meWH1et3gfDwyNKA+9mCL8hQJfGiffXCp/yTR?=
 =?us-ascii?Q?wxHexXH1PsiGJGBUjqEViq8fKvSxhNlv6A299+qe?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:14.5655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6799df2b-f1d3-4ca7-f214-08de26990e69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6029
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

From: Jayesh Choudhary <j-choudhary@ti.com>

In case if we get errors in cdns_mhdp_link_up() or cdns_mhdp_reg_read()
in atomic_enable, we will go to cdns_mhdp_modeset_retry_fn() and will hit
NULL pointer while trying to access the mutex. We need the connector to
be set before that. Unlike in legacy !(DBANC) cases, we do not have
connector initialised in bridge_attach(), so add the mhdp->connector_ptr
in device structure to handle both DBANC and !DBANC case and set it in
atomic_enable() earlier to avoid possible NULL pointer dereference in
recovery paths like modeset_retry_fn() with the DBANC flag set.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 ++++++++++---------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 26 ++++++++++++-----
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..f3076e9cdabbe 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -740,7 +740,7 @@ static void cdns_mhdp_fw_cb(const struct firmware *fw, void *context)
 	bridge_attached = mhdp->bridge_attached;
 	spin_unlock(&mhdp->start_lock);
 	if (bridge_attached) {
-		if (mhdp->connector.dev)
+		if (mhdp->connector_ptr && mhdp->connector_ptr->dev)
 			drm_kms_helper_hotplug_event(mhdp->bridge.dev);
 		else
 			drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
@@ -1636,6 +1636,7 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
+	mhdp->connector_ptr = conn;
 	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
 
 	ret = drm_display_info_set_bus_formats(&conn->display_info,
@@ -1915,17 +1916,25 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	struct cdns_mhdp_bridge_state *mhdp_state;
 	struct drm_crtc_state *crtc_state;
-	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_bridge_state *new_state;
 	const struct drm_display_mode *mode;
 	u32 resp;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(mhdp->dev, "bridge enable\n");
 
 	mutex_lock(&mhdp->link_mutex);
 
+	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
+								       bridge->encoder);
+	if (WARN_ON(!mhdp->connector_ptr))
+		goto out;
+
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
+	if (WARN_ON(!conn_state))
+		goto out;
+
 	if (mhdp->plugged && !mhdp->link_up) {
 		ret = cdns_mhdp_link_up(mhdp);
 		if (ret < 0)
@@ -1945,15 +1954,6 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
-	connector = drm_atomic_get_new_connector_for_encoder(state,
-							     bridge->encoder);
-	if (WARN_ON(!connector))
-		goto out;
-
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
-	if (WARN_ON(!conn_state))
-		goto out;
-
 	if (mhdp->hdcp_supported &&
 	    mhdp->hw_state == MHDP_HW_READY &&
 	    conn_state->content_protection ==
@@ -2030,6 +2030,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
 		mhdp->info->ops->disable(mhdp);
 
+	mhdp->connector_ptr = NULL;
 	mutex_unlock(&mhdp->link_mutex);
 }
 
@@ -2296,7 +2297,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = &mhdp->connector;
+	conn = mhdp->connector_ptr;
 
 	/* Grab the locks before changing connector property */
 	mutex_lock(&conn->dev->mode_config.mutex);
@@ -2373,7 +2374,7 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	int ret;
 
 	ret = cdns_mhdp_update_link_status(mhdp);
-	if (mhdp->connector.dev) {
+	if (mhdp->connector_ptr && mhdp->connector_ptr->dev) {
 		if (ret < 0)
 			schedule_work(&mhdp->modeset_retry_work);
 		else
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..a76775c768956 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -376,6 +376,7 @@ struct cdns_mhdp_device {
 	struct mutex link_mutex;
 
 	struct drm_connector connector;
+	struct drm_connector *connector_ptr;
 	struct drm_bridge bridge;
 
 	struct cdns_mhdp_link link;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 42248f179b69d..5ac2fad2f0078 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -393,8 +393,10 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 {
 	int ret;
 
-	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+	if (mhdp->connector_ptr) {
+		dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
+			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+	}
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
 
@@ -443,9 +445,11 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 	if (!ret && hdcp_port_status & HDCP_PORT_STS_AUTH)
 		goto out;
 
-	dev_err(mhdp->dev,
-		"[%s:%d] HDCP link failed, retrying authentication\n",
-		mhdp->connector.name, mhdp->connector.base.id);
+	if (mhdp->connector_ptr) {
+		dev_err(mhdp->dev,
+			"[%s:%d] HDCP link failed, retrying authentication\n",
+			mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+	}
 
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
 	if (ret) {
@@ -487,13 +491,19 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct cdns_mhdp_device *mhdp = container_of(hdcp,
 						     struct cdns_mhdp_device,
 						     hdcp);
-	struct drm_device *dev = mhdp->connector.dev;
+	struct drm_device *dev = NULL;
 	struct drm_connector_state *state;
 
+	if (mhdp->connector_ptr)
+		dev = mhdp->connector_ptr->dev;
+
+	if (!dev)
+		return;
+
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&mhdp->hdcp.mutex);
-	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector.state;
+	if (mhdp->connector_ptr && mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		state = mhdp->connector_ptr->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

