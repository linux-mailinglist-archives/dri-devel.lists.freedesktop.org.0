Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E063724E04
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C907310E3B0;
	Tue,  6 Jun 2023 20:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B47B10E3AF;
 Tue,  6 Jun 2023 20:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT/4z5qF49sOGFXh39QaqW6Zvgtftn32Sb65hcRzf0Di+NpY088v8C8FKbKO4110o9MKBH//6yUCfNahCG9HdxSO537x66Qhr2SdcKDkHMb3wGlkpMUG1JfEZmdtYEauptTzz8tMI9ftn8iL3XR57sYKvhfWbaTLJoncMukMBsKWWR/m4PLTEJt0elPDr8w6B0dCNvr9OosX+Omc0w3kR5XImdBf2KR1W9ZOSm6L4tQYt2/GjWqt9qlvMqWHJ2ZeKyND517oZ7VYCCeuaV4a+x/xlG7tm0lLlvKLaH2X0823o4DDNr+KLAOrC1stRIechnTIeKygdT6CoSx8vtoAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGs6BQd2ndqdv/jZo8ca7c3wADzxVv4YTq9Hshj6MhU=;
 b=XqicojZ8+cHcbs80LCFpxqSCMo+qaaLG92mgGPh0tIl/T+1nIl6viN2pjOHrCl9TG97plO9vv6gNfaU2yN3vhYrXt/v+cHw+kDeqdSvwWNHzdG6ENDEsSUBQDIJUqXLroAIiMxylBR9OPXjo3TZSjH3+7B3Y+XarXS8++t8V8ktqHlobN6j8H8RGbbjJXqrdkBhQh8eQsEDSoZ152o/jHySnSU1cNCjU5el9RxM2fqtwvyVM3scVJKkniqpH2aLuYgC2g04uWm3kbeJ6hG5xa5WJhrlicaWpYdZSXzXAaMU3mnDB5Sq0Hn8+SpkfCUWc2BC0xr/tRg5OMqYVAehf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGs6BQd2ndqdv/jZo8ca7c3wADzxVv4YTq9Hshj6MhU=;
 b=E0PReXWQKEcLwGB2jgWhX+fP7yvaPRFqCR/o0IdxzHPfz/wJW5KsXYpZ0I/YvugD3EZ+OQJqGx+z73ajOAZV17Gnrq6NqoQIih59+YKqYfpkIzz1ckbBSNo6OsFSQkgo71d4D8kNrJb5pKYhhxX+9GlAIWbgbBuM1keUxMGkkuE=
Received: from BN0PR04CA0072.namprd04.prod.outlook.com (2603:10b6:408:ea::17)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:15 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::b5) by BN0PR04CA0072.outlook.office365.com
 (2603:10b6:408:ea::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:14 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:13 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 03/13] drm/connector: Pull out common
 create_colorspace_property code
Date: Tue, 6 Jun 2023 16:25:57 -0400
Message-ID: <20230606202607.122914-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT046:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f5f278-3fec-452a-1345-08db66cc46dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kziuVMm9Y/TZT6lZHtli/qXdDCXD6En51q3SkCkdya9JctPH+FlRviQ3GxpaTgzCt1/f6hrfZUVKcanTN5V2x6Fqz/dCZ2iMRDat7PmVkveFFkR2B6JA1T/hB8anODawD3j76e+7OLO7PiYJm3sapMV2SY8UVUDL1HxfX0FPyZ6F/7CBA39vjznY6Qkv4Ve2kybLlKEP/beKujmcNoKNCZI8SHCZ3g/hu3MQYxLnn2quDzNpD2eO8Bd91EEhl7jfNi68HOoSZ/yQzub3AIef02sXV9Oau+G5uo78KAR9ESzknaOGc1UKh4YnDO0SsZ0Xbh+Jo87ULk1NfBSkbAa+jS5DxQL1Aioi54BRfnNbQM6bCdGkQk6VbDMkxwKGUQ+IlSkxYuqYmxk23GzC0weLBbl8I57g01pWNz7sG87oyq5+3DHsZtLq5vJHzJjUKAtJgddmmu6fW4txdOLDB4L1IXvUabfmhbQd44pA9U2bs5Fit2TB+Gcg+ajb+lub4OwVpxQyNJnpKHIlgr/frlfjBXqdBRE9Z2nG+w6X01UmbOsHICUDGFwJeIp2NfPPGHGrdVWaAQH25P9xy1Xhn99dAhkiKk89flFHXlv8sTgficilPbX8u5HRTfjvVyCAKiprCAqTFThopAZT9865thxqXOkwZZDII4KOeMhr/EMmpxu0ocoGHDE7SGwYGgP/NJ9wKJoK4r16Tlfg3V0boxblYjmAoet5cVe1q37mEOAE04kWtunpHSKHEyFwNDADP2kyAn9K6h69oxOnlpnzA0GIjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(1076003)(2616005)(41300700001)(426003)(6666004)(336012)(36860700001)(26005)(47076005)(66574015)(83380400001)(186003)(40460700003)(40480700001)(478600001)(110136005)(54906003)(81166007)(82310400005)(4326008)(356005)(82740400003)(70206006)(70586007)(316002)(7416002)(8676002)(8936002)(44832011)(86362001)(5660300002)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:15.0999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f5f278-3fec-452a-1345-08db66cc46dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/drm_connector.c | 54 ++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 547356e00341..9c087d6f5691 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1975,33 +1975,44 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
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
@@ -2016,20 +2027,9 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
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
2.41.0

