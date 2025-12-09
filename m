Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5BCAFDBC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76BF10E525;
	Tue,  9 Dec 2025 12:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="aU7cKI/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A7610E525
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlnDVzKhG4aKB6cmdxvRS8AE5PGXPno0h11+6HXTqrFcxt8U451EbKL3lNPJAKBYghJdNrpKo+W4quyXNKG0GkV7fiQpo/OiJ7IIblGGBqTzJ1eKS9RkvluGxS9QaXUgg6/IDpSf9Eh2cTlhSyPpKnON7Atm7lfE6lkhcNSGo/ia896iOs+avN2Q++o2QtieDGjttE/gXYFJBePywQNAzhELHhZlIFPKXpqNVJxsOWxOx9OFl2PeECyxj9lhAd/l25VcFJNfBn8BZRcGq6jy2sibN9QXDyHtueImZ9M1XK+1ZZjsViBzkySx+8fhQbpBCLX0FaQMD3oEFFABjmxA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNL5nM1H4dYgxQbdLJ6r1WkBE7SWqIImh3dZBwbu0yg=;
 b=PCFdG/TMRSjIeHQWpNGcOAm81rlVB6Wvc1PT/3UuLS1xGAvRCaxmOYkkZdOrumCLcsmlUXae0hUQitvmk7rcYyBcWg5VH4LUKyAm3ij6RUfqns3rEZCsHDxV9wziPfb5+cgZbZBE4lwvf+pebRUUKumRObez1MLFahsDTHPRuc6/nP0crid0w+FEKci77HmcgRWdya5s9BCXGPUWHz8Lzr9TffQw0Bq+BvWQLrN6hmljce1+RCC+XgHGyucnIvwxfLyaXPRbqOtoXFFLWJefNdLfXOOFqVmePrz1dXuVB8F9wCxD82i90H5OAsNJe4Uk0ROuxUP7KEIXhPIW27sSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNL5nM1H4dYgxQbdLJ6r1WkBE7SWqIImh3dZBwbu0yg=;
 b=aU7cKI/WTM7jf8avmq+QkmNylKeUCELhSePP90+/5EONepNjg9p7Q5chj4Tp0LQqf2An2w69uDn0a+vw1p3fo+CQIkKx400gsHhg1HVBakY7YVmeNljLIfyepTjs90kKUixFUf24XLMDQnISvYYRLLx2HTfoX/jpK1bXEgDjGy0=
Received: from CH0PR08CA0007.namprd08.prod.outlook.com (2603:10b6:610:33::12)
 by DM6PR10MB4138.namprd10.prod.outlook.com (2603:10b6:5:218::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 12:04:14 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::d8) by CH0PR08CA0007.outlook.office365.com
 (2603:10b6:610:33::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 12:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 12:04:14 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:04:12 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:04:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:04:12 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBQ1165975;
 Tue, 9 Dec 2025 06:04:06 -0600
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
Subject: [PATCH v10 5/6] cadence: cdns-mhdp8546*: Change drm_connector from
 structure to pointer
Date: Tue, 9 Dec 2025 17:33:31 +0530
Message-ID: <20251209120332.3559893-6-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DM6PR10MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 224ffe21-d676-4704-124c-08de371b122c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?otbocbBg3GHGdBU/yvUi8jJeV3HCi+UBUR99Hz3NSLUtBwpi1chd3kOk2jVa?=
 =?us-ascii?Q?qIAU9LhoU+IKdPxHQi5NP5/JVIsSg3CH6sbgQ42Usmma+Z9PJy3sw4dVGRMe?=
 =?us-ascii?Q?ti3m/OpjhgOTj++uOU1bUdCL0gMOAp068T1tsQXkRVNFg5aMM1SO9Qu5hWKw?=
 =?us-ascii?Q?Dksstf6PXwxL78cAjaEY9XMdcE7+eDgwLRmZXIbAgrCKqjqi0hv6h5Qrmvmv?=
 =?us-ascii?Q?s49YMzQjM4NTExEerpEqT8m6LODf2qWV7KIkjTqJMwK/0OaI878JwsPb0tc8?=
 =?us-ascii?Q?NAMXFAzDNR3JZjuB/kPYNvT9owJI7DWKv17nY5/ygdHIiTYYXZ+tLplXo10v?=
 =?us-ascii?Q?dTXne1+2x/z2BHRJ8m0gl6DJK9Cv9/3Qx2Sxz2HFc1JKJXIRq0aeW8ZHW8M0?=
 =?us-ascii?Q?gGll7VKVPj+urcugCPn3HciFKeqHA44DOlG/eFzMJxSDRQOQN03feE3BYHrr?=
 =?us-ascii?Q?sVnU12GfvTpj0jyEMEWYDg/DwuWC0zsmNrknFqaI78gzTqtks60hl5O8RPQC?=
 =?us-ascii?Q?rpZTzID3RobomUx2JAKYwYo3AMbbjQfoFHgbtpImfFr6Inz2AV9l+EqMVaYZ?=
 =?us-ascii?Q?Fa3XjsGJNdxJ9xPaLHfuRvj3mJepDlgtOjJzuYjhvaLaEXpsnMEOHVpf4EA8?=
 =?us-ascii?Q?oaiB93SD5picKKqw00afGJBSzu7KxUl3Tmqbaw7tgj8N4NjSkaFcX4+dbrxd?=
 =?us-ascii?Q?CG2Z8b4CMcEl9s01Ty1a1TlnNxoSSQUNfU8VDr1nE403nOQs5p/NI8q4WVR0?=
 =?us-ascii?Q?qMEMwjUcslWh9MzYB/BylhJ2sXjYxt8e+yf+paHWYufYKNx2joAv1OmRnGny?=
 =?us-ascii?Q?9aluZfEFr725/9MJYA8PwFJ07His/H1wNqvFOYAR2mdn4EjdOMvS/fDYaBlp?=
 =?us-ascii?Q?l7L5n8gEqEolVX5EYYzGc2sygOsNxJNZOYxCRvylQkKiNhsxY01O/iYisKtI?=
 =?us-ascii?Q?9k7F0yuljn190RDgl+MH9SMIcz/rDsrCXHbeU+9ObRgp1Ye8m2fYghzGdoDR?=
 =?us-ascii?Q?EnQvaUDhpcwM/P+Roi+j7SzFsDsMjcb13DqPGpe40LZTenSieEipOyRmmfvf?=
 =?us-ascii?Q?AWTdDbRr7n64e0FYJIGjSuU+DRefcWYH/jRFtSx4AmK3L+7kiNUPmpBp4Sge?=
 =?us-ascii?Q?qzVHf7L9xGhV59cqW/V72bF6dExXGPJptVHQgU1mM1RzErwJV/hEc3Kv+9/O?=
 =?us-ascii?Q?yfecvpa/SKebeSswIVgseJG9uEqSeDS3CG4fEFaT/SdWfytiXany+Ixxa9oH?=
 =?us-ascii?Q?yNmZ9KHY1vMlqdIKOrNsMHCjYa6fEGsPkGZ1KMOxgsQZrqlxjaU36rUo9ImC?=
 =?us-ascii?Q?gU2eqFijpKFaKD3CMzzgZ54DjMiwr0gjKwvjNYj0t0r9zexXxXJcXxjJPggB?=
 =?us-ascii?Q?ZRLgxxfjHWQAz3vmZb3DsIzl7sAXqh0FU+6yASVRdQw3eQSFLH034cT2jQW8?=
 =?us-ascii?Q?h+mrDSPvIDZGSlE9ce+OJN27hEQQmHSdyFlE4oitizYFeol5+bA2xzfF8wtW?=
 =?us-ascii?Q?TSosJ6q257y60sxIXD+o5ECWbTAi2XQ6kttB5Hao3DJhDjEF1udfnasHIoB7?=
 =?us-ascii?Q?DZSFBaIfDsdKkcJcZI6lDroMrUxEMlf7r6f2TInK?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:04:14.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 224ffe21-d676-4704-124c-08de371b122c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4138
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

Now that we have dropped the legacy code which became redundant with
introduction of DRM_BRIDGE_ATTACH_NO_CONNECTOR
usecase in driver,we can cleanly switch to drm_connector pointer
instead of structure.

Rename the connector_ptr member variable to connector for clarity and
consistency. The driver was using both connector and connector_ptr members,
but connector_ptr was the only one actually used throughout the code.
This change removes the unused connector struct member and renames
connector_ptr to connector for better readability.

This is purely a code cleanup change with no functional impact. All
references to connector_ptr are updated to use the renamed connector
variable throughout the driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 14 +++++++-------
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  3 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    | 12 ++++++------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index e3066dae340a6..f909469dacf08 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1765,12 +1765,12 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 
 	mutex_lock(&mhdp->link_mutex);
 
-	mhdp->connector_ptr = drm_atomic_get_new_connector_for_encoder(state,
-								       bridge->encoder);
-	if (WARN_ON(!mhdp->connector_ptr))
+	mhdp->connector = drm_atomic_get_new_connector_for_encoder(state,
+								   bridge->encoder);
+	if (WARN_ON(!mhdp->connector))
 		goto out;
 
-	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector_ptr);
+	conn_state = drm_atomic_get_new_connector_state(state, mhdp->connector);
 	if (WARN_ON(!conn_state))
 		goto out;
 
@@ -1869,7 +1869,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
 		mhdp->info->ops->disable(mhdp);
 
-	mhdp->connector_ptr = NULL;
+	mhdp->connector = NULL;
 	mutex_unlock(&mhdp->link_mutex);
 }
 
@@ -1964,7 +1964,7 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector_state *old_state, *new_state;
 	struct drm_atomic_state *state = crtc_state->state;
-	struct drm_connector *conn = mhdp->connector_ptr;
+	struct drm_connector *conn = mhdp->connector;
 	u64 old_cp, new_cp;
 
 	mutex_lock(&mhdp->link_mutex);
@@ -2179,7 +2179,7 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
 
 	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
 
-	conn = mhdp->connector_ptr;
+	conn = mhdp->connector;
 
 	/* Grab the locks before changing connector property */
 	mutex_lock(&conn->dev->mode_config.mutex);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index a76775c768956..b297db53ba283 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -375,8 +375,7 @@ struct cdns_mhdp_device {
 	 */
 	struct mutex link_mutex;
 
-	struct drm_connector connector;
-	struct drm_connector *connector_ptr;
+	struct drm_connector *connector;
 	struct drm_bridge bridge;
 
 	struct cdns_mhdp_link link;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 21a7d2fb266e4..5cd0b873e16f9 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -394,7 +394,7 @@ static int _cdns_mhdp_hdcp_disable(struct cdns_mhdp_device *mhdp)
 	int ret;
 
 	dev_dbg(mhdp->dev, "[%s:%d] HDCP is being disabled...\n",
-		mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+		mhdp->connector->name, mhdp->connector->base.id);
 
 	ret = cdns_mhdp_hdcp_set_config(mhdp, 0, false);
 
@@ -437,7 +437,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 
 	mutex_lock(&mhdp->hdcp.mutex);
 
-	if (!mhdp->connector_ptr)
+	if (!mhdp->connector)
 		goto out;
 
 	if (mhdp->hdcp.value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
@@ -449,7 +449,7 @@ static int cdns_mhdp_hdcp_check_link(struct cdns_mhdp_device *mhdp)
 
 	dev_err(mhdp->dev,
 		"[%s:%d] HDCP link failed, retrying authentication\n",
-		mhdp->connector_ptr->name, mhdp->connector_ptr->base.id);
+		mhdp->connector->name, mhdp->connector->base.id);
 
 	ret = _cdns_mhdp_hdcp_disable(mhdp);
 	if (ret) {
@@ -494,8 +494,8 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	struct drm_device *dev = NULL;
 	struct drm_connector_state *state;
 
-	if (mhdp->connector_ptr)
-		dev = mhdp->connector_ptr->dev;
+	if (mhdp->connector)
+		dev = mhdp->connector->dev;
 
 	if (!dev)
 		return;
@@ -503,7 +503,7 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
 	mutex_lock(&mhdp->hdcp.mutex);
 	if (mhdp->hdcp.value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		state = mhdp->connector_ptr->state;
+		state = mhdp->connector->state;
 		state->content_protection = mhdp->hdcp.value;
 	}
 	mutex_unlock(&mhdp->hdcp.mutex);
-- 
2.34.1

