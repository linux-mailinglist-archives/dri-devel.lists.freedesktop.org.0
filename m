Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550166AE405
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FB810E4E5;
	Tue,  7 Mar 2023 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5BC10E4E4;
 Tue,  7 Mar 2023 15:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD2r3Dd/h5K5rPFiNxmXddMrtQtUEfvO0lMhfyD4To7tPOJysz/927vN87ELXMHeUgXGeWXiuKgQgheVG7AtOe+Te23Xl+YXMUJhEfS0Ukv/V2C0zaSkHuKknHp/H2nQB+6wk8oFPVqVbnsusKriDFYW8THPODUezzBmYzBKCvEXNyD+lk5x3WRtd36j3S3e3o1J3vkyS437tGmxYc3BB/ru4ILaoxa6MKkrw5Q4BDDg7JBdcQ8Ww0EoV6XrxpZBx8OVttq5BFjVyur+CRSITxXGl4NxtptTswh+zoqziXg5ewTeFb6cEvji/jFLYIz2GoDi6HooJA443665RjSBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uO/xyrDnQzDjM3BfF2UYq3sBZ4nzUtSydxEK5keb38=;
 b=VZAgeQ3LhMQGQnk/m5FRkY4YCm4pSraOwZjdeWNsK0nxxqYAEuyHqmOkVfZcXgGW85/tBX8MYGStxYcHlNbf6pzoarGWPaVtafBx5VBrp5w6wMAgHkA34PHK4c8sjrNJwPkZamWFHDYJvf4kc1j3XOSS1/nSzyId3msuweMls8B8rKAYQLYgnLQkaZ9ZYWWU9hYgMWyxBz+KqfdhoK9eV1xzgB9AgCF5z9kICxXfgN8bYypxi9s98jLBO73R13uqTPlI5MuMSm/2aaTeGvWfrinZ6BoNvHB2MfWiEKfjVsOOSEEwIcSl2QKR52V4LdJUOGEL7Gj6UjA+ZqG3G2B7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uO/xyrDnQzDjM3BfF2UYq3sBZ4nzUtSydxEK5keb38=;
 b=oUeMlJ2aCJgFbO9oISB2I/HT/Jq419XJcfA3AbUIbAPiuhszb0EPzayLUn7uKR/Yc+9HnAhUSkXCkKBjXbVWd05W0Xtcfe0IEhPU9r+2FrDB9C2PKICaBd9QDI9kRDecfqexWlDLM+VZYMlfHZF+R2Jnfjfr32Y2ecw8Lma4JEM=
Received: from DM5PR07CA0086.namprd07.prod.outlook.com (2603:10b6:4:ae::15) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Tue, 7 Mar 2023 15:11:19 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::5c) by DM5PR07CA0086.outlook.office365.com
 (2603:10b6:4:ae::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:18 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:17 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 04/17] drm/connector: Pull out common
 create_colorspace_property code
Date: Tue, 7 Mar 2023 10:10:54 -0500
Message-ID: <20230307151107.49649-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 254bcbce-5f3c-4d64-8956-08db1f1e3485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDOQfVEq8KuQQveOsfosQK2O27ULfllOB1g0ub85dVFH2LugCVvXVGeTs9TovpGBCqeHI1yPCr6RFgQRQ/Q38gtA2/DjrGcW+h+UDpTnOURlnZeza9Bzwhp2OBLdbsxNjV4tzPdWRsfi7Xu8SY9F08kNycblHJmq8vu6yCQoDv3XIt95IqKJs2+yGI4c0nPjGuzn8CQxq1+pDxHnwEhFYGNhNXSIBn9Yx5zSgwVEnEIhSHnZstLzZzFfmLR8noPnMHsYcpr3uKg35UUq8xEB7CjMF0VISMD6hbiq7hnAxc8vSPhLJDGQ6Ww5mFndBwkzQmwAk4qFkuGA9HezaGUHhQt3iK7gFukz2Uyy+h0cTjrgA/9Rl1jthk8/zbUGompUIsZ8gHRlgalAbIDmwt3G1tgCfIjz3F0Flt/dmC8so7jueY6R/MalhfIHr3gCBgiraNme4fvHKY3yjr4aFVvGB2KcGtVC8FrDOsVakH2LuUR3DkaQTNXPdlvVHu8DJG0N6+kUuLxu1oIHyD7GS5w0Q5Sw6qrGDey5sUHdbKQhOrt+Mj5ksYHXEZBToJZcUtI2a9nB79hwrlcC70HdgSmbD4w1fLf9Y3ePl/I1Z1HX0eJXF3JH/z/7eFptN/Dd7x/dFtJinEUpGwEft0367zZFz0q9rKkdAVN2g2T+IX41tPZtmboZdJkgsX3OkbYvGEyJdjkuLK99MbZb3DETJ2HTsn34Df1FuXHpJ1Pdrdc0AuY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(110136005)(36756003)(316002)(336012)(83380400001)(54906003)(40480700001)(82310400005)(86362001)(2906002)(70206006)(40460700003)(186003)(70586007)(5660300002)(82740400003)(44832011)(26005)(478600001)(8936002)(8676002)(41300700001)(36860700001)(4326008)(1076003)(426003)(2616005)(6666004)(47076005)(66574015)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:19.2922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254bcbce-5f3c-4d64-8956-08db1f1e3485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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
index fe7eab15f727..ff4af48c029a 100644
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
2.39.2

