Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297A6669DF4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1D310EA82;
	Fri, 13 Jan 2023 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F035010EA2C;
 Fri, 13 Jan 2023 16:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmzizEb40+3mMc7AUX6GjaV/3kB8vTAinJo3Byrwtx+zPIXZGpTe1Y07aIRSO6Jq43vkA3kw7HKCDp9acOF7a74WwRAUl4GNVgyYM1upa9fGh2UkzxNB2yxkTpbS3RmXMpEo67N8FQpSV1BEQ6O3tSKmB6c0S7phxoPm7r60LRJbwxPLGg/LdB1i7fOsJAisE4N/z8LWTirFpBQPIERzvc0vHr5WEQ2lOAtOa53PjVXkl5n9SSvbHpeJyqSy/+j3QAxB6lcRKbxMqB4uhtPGK9SvuPFBeSRAGh5X8fmUT4cI69eExJGKgn5FmCgN5MwgpXC+zh4/hgPgZsnOCfubbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s73/vEColYOLgso5yBPNWZLOfZkh6u+gq/M4kzdSP0=;
 b=PgQi7RFm2uG71YRK/7F7bA23sjj3qhiRRF9rZBFCXCKW/crAExG93y6K7d9xH1EoHS4xHrrwf5XabkBLhRjj9iFq+L5r9ZOcpNkJqKKJbvUbYw57z5juGObQDXf8tnNcFvnt+xZCtKYhPhDSjHh5ybUK23atjid36LHVfA9inQmnk3tZCz82J3kBjqrPKSidm7HNfM1pBlx+Y90w2PsVwDPceodkdZRQ77sdEqk9vfGTUmVq9TOCD4uqWGNiXBVBnNtcntOAc37GP1jU7YR6Ec26riPUmujK+Xa5d/Cl0SQM/ybiCmfRnqoursO5ZWk5MEFtoTWnp8TsUu9+J4qaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s73/vEColYOLgso5yBPNWZLOfZkh6u+gq/M4kzdSP0=;
 b=g6k/qqJpRv7TvCCDMNCqFgmWmQ6hJyOW+BcLF2tqmll6Ny0MZ9YqNqrvwM25qiIJg511L73IKQgUamv2zMKCc4ajd0hNe+mEAsAiSqNAyAciOgvMyhkxfZuPJzQqDPTGIxx23/OmjqDyJWDT1tQahG9fk9AQ/rLYxNcrKp3Zcdk=
Received: from CY5PR15CA0021.namprd15.prod.outlook.com (2603:10b6:930:14::26)
 by CH0PR12MB5331.namprd12.prod.outlook.com (2603:10b6:610:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:26:41 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:14:cafe::48) by CY5PR15CA0021.outlook.office365.com
 (2603:10b6:930:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:54 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:54 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 05/21] drm/connector: Pull out common
 create_colorspace_property code
Date: Fri, 13 Jan 2023 11:24:12 -0500
Message-ID: <20230113162428.33874-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|CH0PR12MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: e045d734-b57e-47a7-f8ab-08daf582f410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T41U4FEM++WsdxN683qBmjVjxcYs2euHLa5/QA5r3Zl11+cg4LDHDvok0winvzTRTts3/PxX1FjCceaRgImoR6Xevui+2pG69rJnKF9ldlVMvfA9pd1TzPWTNK3uZ1yfiti+QNAhH4t3wvKykIPzCWUeKeUB58l4vjh1Oh4Kcphk41qVo+BZjsAyMR5AT1Yb04QfYoaEQiUMvg4MssbzbAccq53AJvvYL1YVvGj45WdAw/e4XiJ4KvCf0sx3X0qfEOeMp+wEdnFHr330G3Ytz07BHS6xff0nD1jtd3GYQE6YepgZawDwHrtyRc5kRBnE7i6lpmbIN2EYpOzcoJ6LlBo+JA2tT0z1f9nh5O7TFhbRN+q7hiQvl/zFbl63S4J5FcMwMsgoXsqfahG2oC3LrlZdzhqgb7tLXh9bu8U7n7kC17WKb2Kk+onZ4bIAuC03qSUcOAmOmO4vLxDDZV6fUm/VFXjateHB0QWT3qzGE/CAuuJZd7JdZHvkYW/dGNG5+XIkfaiBAnoK9v/ONreqNJZVy84NnkE7Ei9CHgypfVwtNSyU9sSmABY3aqeyciSoVKOle4CsfaoI95wBVKFwlWpPXJw+tA8WLoGW5++JUlV1Jl4vlT7Yjj6NubTPYJm3o/1tTCmYMSW1FQQmDAPNST4I2bIJE6xkeKT53cKzOJcQPhFnV90jT2/XMg0WSuyg6hR3YwielSH9qY7Oi/GJBca1C+bfMqbC7Zm6lAxJ32Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(8936002)(5660300002)(41300700001)(83380400001)(86362001)(426003)(47076005)(81166007)(66574015)(82310400005)(36756003)(40460700003)(82740400003)(356005)(2906002)(44832011)(40480700001)(36860700001)(478600001)(186003)(7696005)(26005)(8676002)(336012)(4326008)(316002)(110136005)(70206006)(1076003)(54906003)(2616005)(70586007)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:41.4558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e045d734-b57e-47a7-f8ab-08daf582f410
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5331
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
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
2.39.0

