Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D172648A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE4B10E52C;
	Wed,  7 Jun 2023 15:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C4710E510;
 Wed,  7 Jun 2023 15:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9ufxk2ruxT7BbhX68ixscfFBsHckx1BSD95MRNMBf5f701LFtBsGOsP7xc2rKfFD8rfO8f0dKLX2CWZxi68XTMduDZg4bg3yn6p7R9nezKZhtWpZM8Pvhlks1QTCDezwj9F5yhfeuga36r3+mlJ0QP9Z8E9cOFNn9OnbZyFpnsTsi5OMX1TefIig7bCjrq/ENBmXDduJVOiM323TwWL47LQDQaj1va0ImPW/b2ijVOJqyuL3/kYklMvxfu8PFxSrRHVEaREpyLONK8SQEJ9es48cxg2JrTwfIC0aeAfHWfuwTLFc8G4cTfQLkacOLKrX8Ll8dC/gPAWh9OOgXAPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vXmsMhsPUcl7tDkQTUDcLNgxOn39ab/n/TcXmWWWoU=;
 b=i5I7oDobxGjcvQEo4XuN9H0CKjcaMzphW73zHjSpGGgzdm8CyhsLmvjBuPoYQ4D1f80Zk1Ba9eAxEdl/RxypHsx6vlPjzeBhdRN/rFzuriJRkILBK70aXn+cEGrNkAQY10m2YlmhJlXc8ZCcHQ58PPLVGo4740QUSGbNuAwbTpYvYUW962fy2qbE301AE4DiJmeV5CJCVXeVSF/N1y8KQQwRMV5mdKe3/qpFuMvWYxVb7HRbq1p8DDhFzJArvuOtbrwX6FevsFBPajfWijtuiS8uWVd2Qkr87dZBE0UvQ/fj47mIZip7ercNdMrmxLqyaDpCA6xELdKlKwCn7SlJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vXmsMhsPUcl7tDkQTUDcLNgxOn39ab/n/TcXmWWWoU=;
 b=b+L8J/9+akSCgaG9WVJQBDTq8BGJZ7j9+KiVtFvYl/r2BuvuF2eyAlpuKPBHqNIquBIkbB6N0IhzEiPXa5LoEVBV1/XeF5OAJSgbLmD5rx5c9uICEudS/HOb2z/eMbZMQRymjL34+YIbXBzzkN15/fnsSQbqcau5cBfxQDhFTdE=
Received: from MW3PR06CA0019.namprd06.prod.outlook.com (2603:10b6:303:2a::24)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:26 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::b) by MW3PR06CA0019.outlook.office365.com
 (2603:10b6:303:2a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 15:26:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:26:25 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 04/13] drm/connector: Use common colorspace_names array
Date: Wed, 7 Jun 2023 11:26:08 -0400
Message-ID: <20230607152617.997573-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|DM6PR12MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 7753b237-4cec-48c4-edd2-08db676b8f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4JKQpZeS/2qCVRDNLfQDk77Jx6Sc7dlYFnsUO3pZ3SFkYIZtItQUNWtOCPO+Q8a00rbT3vVb7jrJ7QMhDevp446hERw7oUmYuqDYuappwvOk3OQoVLFP3bqjs0DWr0GwZuzU3M0Xy4eM2Buevp8v0Vtojt2OvBsmrgdWXWXaFy+PzL+2a40Y7D2F5Wu+dwwFvT0iPi3qvbWX//dCy1PuubQldomHDVCkrSw/CkASxOomo6jxstLX6SLgJO4sNCiZ7bAZGks1ORx7UG1+QnAMKtsvbuNG/RRhimra2ySg0Yuc/M3nF2o7v5PxKKHTZ98AJ0EKSKBStioeR/jl300Q+y3MuDTcG5OVomZIGv8qCjtd0iHpdHebQyrCRU9eoQfkDPQluui6NG2y5vjwlH0lSsTaKdIXEGIkYHELHWXbiXF5f+EIkiA/hBX8Wl4hFxKT/4eVyb77zscvJ/lYmno14u6+FRdZKQWjCh3rV2vPbVMydv/YcXIqgHaLtUN4gTOCzF4FPWAir3BdMENTYH6c8TWlPrGDyctTGgfbg4sjQtqwwsqVaBPsOhFsrJnIYgqqpQECSf4b/T8Zy2stcjRLCWyJJW3aP9NKQuXQDO8i6ceQpvEDGq3OKlpxPH6a+LFi84y7u0ShabA7aLKcpdTQUmRno1+LNwO/+j1/7QK752OtFbSNK+fmezzzcLsFfvHdyNIzhQsOjSQmnR1oljYYU1BnnN4NAU4LxTDA5FN7H43x1Zw3IbjPy4xPbE/fqcLb8hjNMEj8PMoITofbFF1nA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(26005)(1076003)(2616005)(83380400001)(41300700001)(36860700001)(6666004)(426003)(186003)(336012)(40460700003)(66899021)(478600001)(54906003)(110136005)(81166007)(82310400005)(356005)(82740400003)(40480700001)(316002)(70206006)(70586007)(4326008)(7416002)(5660300002)(8936002)(8676002)(44832011)(2906002)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:26.0867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7753b237-4cec-48c4-edd2-08db676b8f0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
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

We an use bitfields to track the support ones for HDMI
and DP. This allows us to print colorspaces in a consistent
manner without needing to know whether we're dealing with
DP or HDMI.

v4:
- Rename _MAX to _COUNT and leave comment to indicate
  it's not a valid value
- Fix misplaced function doc

v6:
- Drop magic in drm_mode_create_colorspace_property for
  dealing with "0" supported_colorspaces. Expect the caller
  to always provide a non-zero supported_colorspaces.
- Improve error checking and logging

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

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
 drivers/gpu/drm/drm_connector.c | 130 +++++++++++++++++++-------------
 include/drm/drm_connector.h     |   2 +
 2 files changed, 79 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9c087d6f5691..484effc731df 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1016,64 +1016,70 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
 		 drm_dp_subconnector_enum_list)
 
-static const struct drm_prop_enum_list hdmi_colorspaces[] = {
+
+static const char * const colorspace_names[] = {
 	/* For Default case, driver will set the colorspace */
-	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
+	[DRM_MODE_COLORIMETRY_DEFAULT] = "Default",
 	/* Standard Definition Colorimetry based on CEA 861 */
-	{ DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
-	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
+	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = "SMPTE_170M_YCC",
+	[DRM_MODE_COLORIMETRY_BT709_YCC] = "BT709_YCC",
 	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
+	[DRM_MODE_COLORIMETRY_XVYCC_601] = "XVYCC_601",
 	/* High Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
+	[DRM_MODE_COLORIMETRY_XVYCC_709] = "XVYCC_709",
 	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
-	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
+	[DRM_MODE_COLORIMETRY_SYCC_601] = "SYCC_601",
 	/* Colorimetry based on IEC 61966-2-5 [33] */
-	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
+	[DRM_MODE_COLORIMETRY_OPYCC_601] = "opYCC_601",
 	/* Colorimetry based on IEC 61966-2-5 */
-	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
+	[DRM_MODE_COLORIMETRY_OPRGB] = "opRGB",
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
+	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = "BT2020_CYCC",
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
+	[DRM_MODE_COLORIMETRY_BT2020_RGB] = "BT2020_RGB",
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
+	[DRM_MODE_COLORIMETRY_BT2020_YCC] = "BT2020_YCC",
 	/* Added as part of Additional Colorimetry Extension in 861.G */
-	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
-	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
+	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] = "DCI-P3_RGB_D65",
+	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] = "DCI-P3_RGB_Theater",
+	[DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] = "RGB_WIDE_FIXED",
+	/* Colorimetry based on scRGB (IEC 61966-2-2) */
+	[DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT] = "RGB_WIDE_FLOAT",
+	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+static const u32 hdmi_colorspaces =
+	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
+	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
+	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER);
+
 /*
  * As per DP 1.4a spec, 2.2.5.7.5 VSC SDP Payload for Pixel Encoding/Colorimetry
  * Format Table 2-120
  */
-static const struct drm_prop_enum_list dp_colorspaces[] = {
-	/* For Default case, driver will set the colorspace */
-	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
-	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED, "RGB_Wide_Gamut_Fixed_Point" },
-	/* Colorimetry based on scRGB (IEC 61966-2-2) */
-	{ DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT, "RGB_Wide_Gamut_Floating_Point" },
-	/* Colorimetry based on IEC 61966-2-5 */
-	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
-	/* Colorimetry based on SMPTE RP 431-2 */
-	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
-	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
-	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
-	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
-	/* High Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
-	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
-	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
-	/* Colorimetry based on IEC 61966-2-5 [33] */
-	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
-};
+static const u32 dp_colorspaces =
+	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED) |
+	BIT(DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT) |
+	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
+	BIT(DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT601_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_XVYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_XVYCC_709) |
+	BIT(DRM_MODE_COLORIMETRY_SYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_OPYCC_601) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_CYCC) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
 /**
  * DOC: standard connector properties
@@ -1976,27 +1982,49 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  */
 
 static int drm_mode_create_colorspace_property(struct drm_connector *connector,
-					const struct drm_prop_enum_list *colorspaces,
-					int size)
+					u32 supported_colorspaces)
 {
 	struct drm_device *dev = connector->dev;
+	u32 colorspaces = supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DEFAULT);
+	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_COUNT];
+	int i, len;
 
 	if (connector->colorspace_property)
 		return 0;
 
-	if (!colorspaces)
-		return 0;
+	if (!supported_colorspaces) {
+		drm_err(dev, "No supported colorspaces provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0) {
+		drm_err(dev, "Unknown colorspace provded on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+		return -EINVAL;
+	}
+
+	len = 0;
+	for (i = 0; i < DRM_MODE_COLORIMETRY_COUNT; i++) {
+		if ((colorspaces & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorspace_names[i];
+		len++;
+	}
 
 	connector->colorspace_property =
 		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
-					colorspaces,
-					size);
+					enum_list,
+					len);
 
 	if (!connector->colorspace_property)
 		return -ENOMEM;
 
 	return 0;
 }
+
 /**
  * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
  * @connector: connector to create the Colorspace property on.
@@ -2009,9 +2037,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
  */
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
 {
-	return drm_mode_create_colorspace_property(connector,
-						   hdmi_colorspaces,
-						   ARRAY_SIZE(hdmi_colorspaces));
+	return drm_mode_create_colorspace_property(connector, hdmi_colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
@@ -2027,9 +2053,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  */
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
 {
-	return drm_mode_create_colorspace_property(connector,
-						   dp_colorspaces,
-						   ARRAY_SIZE(dp_colorspaces));
+	return drm_mode_create_colorspace_property(connector, dp_colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 907f40851e80..fad38cdf4f79 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -460,6 +460,8 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
+	/* not a valid value; merely used for counting */
+	DRM_MODE_COLORIMETRY_COUNT
 };
 
 /**
-- 
2.41.0

