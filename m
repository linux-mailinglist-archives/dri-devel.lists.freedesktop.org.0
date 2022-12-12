Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62A64A6EF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0510E270;
	Mon, 12 Dec 2022 18:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEAE10E264;
 Mon, 12 Dec 2022 18:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEEQQ2jDlNkEsT/adY+HJoFgI9Jf52DBOxMKjFcIpiTID7W+ogmR6NWVeOa8A1nf1xd42QONDFgZ3M/u85xh7HL+g4n8s3nObcqY/uiWyOaZRxbtgq2iJVIJEBUpE3WQFTjElNetN1VuoVNeb6d2ME2eTDT7WnBRw3e/T+YRKarULakW5tXuSDXNzYUYLf1Y6CeCoKOo9a/Jyj/wYKvlnazzy/UKNNIFGzOt/ZI0QNV/IL/tWlABbjcTtAjzye2H21JB5bhU7LkiW0oQW/eR6XNdNT6ifcHMsEJ0hu+h/Ykw87sFkqUsQymoTMZe9vXY1YAN5K943RdGTO90LWpI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5I+XY0eLakBgxRG8NZPSadATni+LzlPh2iwpH1HGdI=;
 b=kqL5pSRPTzrRY7aRDEuoQ6jQtYTy3PtwhU56/GKqdA7KdiVYge7+80zMkZkmYgwBAjilrDLg9Oghu3RJiUQ8mDzyixgkS5XZXwVkQUsuVWQIFaucg/K3/Gi9aM3tUx/zf9Co6nbw+NuEBpyitB2YSR816wGc/o4ezEGjNM2vjolYk06ptOmGYOlFRv+GbvZdLFvrqgzUycvDL3fcq3RRZq7mGeW+uy5FZF7ray3v+hUeaWgGlISQrDdM9m2Eon8M6HTbDtExJ88I5iZEq2MYcf2rOfOwaQ18Pz+RsaZyD66IMxHzWFzlDLE4XnlCeqT8N/EhpEjcQpup9RAW609Y8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5I+XY0eLakBgxRG8NZPSadATni+LzlPh2iwpH1HGdI=;
 b=rlJnq8SOdI9XoJeozKdXBBluuV1js99cz7KRkNhuwkyHYh/Mov6Fm2Dw8XTI9WQKI3n4wQFd4VxRLr7AR7MVEZwnlksNwVAAFwQUqh6EVwGRFxxcxYKSTnCuKK4mDBv0OlFSwMGopRATZdbQ16dJc7EPriptO2gzP3fXurdrd3g=
Received: from BN9PR03CA0473.namprd03.prod.outlook.com (2603:10b6:408:139::28)
 by CO6PR12MB5409.namprd12.prod.outlook.com (2603:10b6:5:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:23 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::df) by BN9PR03CA0473.outlook.office365.com
 (2603:10b6:408:139::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:23 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:22:08 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:07 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/16] drm/connector: Pull out common
 create_colorspace_property code
Date: Mon, 12 Dec 2022 13:21:26 -0500
Message-ID: <20221212182137.374625-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|CO6PR12MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 794f41e2-7481-4038-a532-08dadc6dd0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qjp6AQJcHlXYw+lB93mxEXBlVEdQH0Yu0gP61uGk7e6u4jSpPwYUc0mIqLZ9CK2JEKjUAZrTAFwzSA0ChG+YkQOIbLp4i9Dnd78jiSp4FMaJVEBN7Kk4orrsgQu6LYj2mnz18EUdoLE/PiwS7aFzWAtDBC5kwkzf6BQ0L8dHPjoZc7CJSfafo6NiBJGCIiYYoiFhWQ6/8fIG+n5Bv6vOSOPvfaoYUdwOkm/fKQWGTTfWAYJsDqyE4JS/pKhtmXmhgDy7d+2URfw+ZGULxbt7XkIdmSSUWE+Oyi3fTVDduPCo76i6ZE7VbbXtt77CZLL+8QYC4DyH/5ZBHaGq9NhYJDRIDREbnqgUjO29+q5ln0/rDeAkVOBo/eE5NPvsKqee6pNr3q2YYkbjzRHcbuS3ZlIEBC3kJ5rMJ7aqIP/jEaUWbnt4jfeMBSKIscgElLVzYnUtc0yfbAPOm9fq08S2MJ2Nh7n1QT5HU7XgTHme1odB7RFRPtRuF3F+TAxgXhASuqeNw+buwHuSNZWr+pF/KHCAwX/q2HJYd22ulQy2jJ55qCO6D5ipoljzaE9UmuQsReOgbM8R7ZPiTG5szgVc1eSitNti7j3Wvayi97CahFTTjeDVuFAFnzrTWu9nbejfXFXPmktBS0yQuNVcuWlC1+Fm5SitkulhTHHbDm1pfLZd3SUfYDoVmddaSkeDzyc5F2xi7Jeih8wOZed6mWvV9CnJMs/zWHuYnQZ6ojnwHqw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(2906002)(1076003)(44832011)(54906003)(2616005)(336012)(86362001)(83380400001)(47076005)(426003)(186003)(6666004)(110136005)(66574015)(26005)(81166007)(82740400003)(478600001)(7696005)(82310400005)(41300700001)(40480700001)(70586007)(356005)(5660300002)(8936002)(8676002)(316002)(4326008)(70206006)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:23.8627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 794f41e2-7481-4038-a532-08dadc6dd0ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5409
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/drm_connector.c | 54 ++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 61c29ce74b03..ddba0b9fcc17 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1971,33 +1971,44 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  * drm_mode_create_dp_colorspace_property() is used for DP connector.
  */
 
-/**
- * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
- * @connector: connector to create the Colorspace property on.
- *
- * Called by a driver the first time it's needed, must be attached to desired
- * HDMI connectors.
- *
- * Returns:
- * Zero on success, negative errno on failure.
- */
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+static int drm_mode_create_colorspace_property(struct drm_connector *connector,
+					const struct drm_prop_enum_list *colorspaces,
+					int size)
 {
 	struct drm_device *dev = connector->dev;
 
 	if (connector->colorspace_property)
 		return 0;
 
+	if (!colorspaces)
+		return 0;
+
 	connector->colorspace_property =
 		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
-					 hdmi_colorspaces,
-					 ARRAY_SIZE(hdmi_colorspaces));
+					colorspaces,
+					size);
 
 	if (!connector->colorspace_property)
 		return -ENOMEM;
 
 	return 0;
 }
+/**
+ * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
+ * @connector: connector to create the Colorspace property on.
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * HDMI connectors.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+{
+	return drm_mode_create_colorspace_property(connector,
+						   hdmi_colorspaces,
+						   ARRAY_SIZE(hdmi_colorspaces));
+}
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
 /**
@@ -2012,20 +2023,9 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  */
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-
-	if (connector->colorspace_property)
-		return 0;
-
-	connector->colorspace_property =
-		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
-					 dp_colorspaces,
-					 ARRAY_SIZE(dp_colorspaces));
-
-	if (!connector->colorspace_property)
-		return -ENOMEM;
-
-	return 0;
+	return drm_mode_create_colorspace_property(connector,
+						   dp_colorspaces,
+						   ARRAY_SIZE(dp_colorspaces));
 }
 EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
 
-- 
2.38.1

