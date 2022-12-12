Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B5664A6E3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7FA10E263;
	Mon, 12 Dec 2022 18:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6384F10E25A;
 Mon, 12 Dec 2022 18:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVHCZEjPgiiiZU0xfC6iOx9vLdB6hG/pPHig1ASyau9ygB/cU/7Ms8XYu2k9Op61OkMm+Wlw5IVjfYKVjKXXXnk6VXRuKHpxvjFixLY7o7xih+g4NZwBJkKHn9cnY+BCMmMmgLy2jZQ8YJ3kBby1P7eHUdwBc3xLtWAwQiRHx+ar2UfgeDkJBYRCB33dz2QdfUaJkfkAomJFbzUOcHs8PK8eqvbu8Rc8pMvlwp9DUI+Zfpphms8u8M0gVxbnX0YNLU+33Zor8HkKh5THGcxgJoUFX5+T/9h3kcVV/rILgRtK+D8q0abFJGsVNcd0W7/i9lFR90gcozNl2J2GPwng6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehNxlOf306sOQAwMo41GKJcva27daO2d7cWuMCZRbko=;
 b=LO4Ad78KSgchRR3lmiQdH7gWWCiqKa+6P888vACbTLy1ntggDgGOB+pgNg6L3sdZIpOVOfRgtu+kQRs/i/8IDf8c96AbwK8/QJbDpBnbmffLFRZlL4c7Mcvcw5fhhOiugFPIh7U9akH/K2IR3VEWbMSSLn0dI0O/guMMApFooelnX+RIj2Bg3UXXz8yBAjPiraPfMXFVOvcIXU6gTXl+IsqliSQ/vGP9FLHRhyFsZ3WgE1/b/xxJzgooHDDyXPrhiDj3QwgxoAhiX4Phgz2mUTS5Hf2rfQ+ga7v0eG35roRrhfh2lARjov2T4UNpjyh++257pFvZCjyjkReIzGkd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehNxlOf306sOQAwMo41GKJcva27daO2d7cWuMCZRbko=;
 b=TYxLXdzupZDIu/Ytn24F3qN26mS1wyfuFb9aX66cwEfAXmVpyzOb0eCy4iO+I432a+RN7jNlQ2LlfT/OqUtvv5lnSDy5n2VOkQ+gs8+gVohY22wPELDZGbdvdJZGCUzU4Ncv4lHn+4xY+LyhE1fQ1QKCkTYVsFTrfFZqtR4/qWI=
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Mon, 12 Dec
 2022 18:22:12 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::45) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:09 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:08 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/16] drm/connector: Allow drivers to pass list of supported
 colorspaces
Date: Mon, 12 Dec 2022 13:21:27 -0500
Message-ID: <20221212182137.374625-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: be73b9a2-b0df-4163-c9d3-08dadc6dc8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ULHU4bgVK3Yhak2Zk4G6Z/ElbLivpfiY/qwIqHRZfoqlNHcNDqO/uHA1VPyxrbEXCa3vaYkEvzDR2Zuxr4U8lJwNV3Q9u+GaFHuCryLurzHJIneb3dOkU9jJrlSXpigHorcl2m7XFIpMZ9Lttd5XmNAuwpSTw6kFFddkMbC7n9YZWlp7P27aQQOmX931tH2lng6gMQg8DO3/vTtCqb5nC6wjtC37/qZ/Aoc/Cngd76b827nxtmMxH4K6ax4OISxNb+4eOxW8QGzuMThyWrEWae99jjtzSHVJROTVsy+swfTU6s/JNKEs8IfGDhHwV08qUL3vnaFILo2haTsbIkj7hOykMn+sa27edwzyyF7Hd9Q4EURM2V1y8kwYPj3/VBO7CUEWBeBlEzHEp7FMV925+N6ndGcb2Oy9x3BAL6enr4nVTsROqOMhZJOyGGOsK/RWL2CwbJgmhxz3d/u2pS2T7x5Zk6QKKt4RFhjT2qYZbPOs26B0XM5TVkyhVVTKB4Ln4iJ1FxQFaV6+n7yCbP81nloIsV6Igp44GVX8bQtji6yz7mRTF4hZvkzP2JlYh2zm/rL6pzLhs5HxQxN47tvwgIHYZANc0BIIYDvF3r/3B3u8uuAeoCDRkkXp1znEa6uUTnfsNuZ4BOkg5DbdP9E6Wb3KgB5i0rdAZpnMvmwQhQ/UcoC8VgoqEXcuYbneSUdPMO5Jwup2Du3dcfIYK6oi/DXhmw7oMoqM0GBYHc/wEg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(426003)(478600001)(83380400001)(54906003)(47076005)(66574015)(186003)(4326008)(8676002)(82740400003)(336012)(44832011)(70586007)(36756003)(70206006)(81166007)(30864003)(316002)(356005)(7696005)(40460700003)(8936002)(36860700001)(110136005)(41300700001)(2906002)(5660300002)(6666004)(26005)(40480700001)(86362001)(82310400005)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:10.6859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be73b9a2-b0df-4163-c9d3-08dadc6dc8f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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

Drivers might not support all colorspaces defined in
dp_colorspaces and hdmi_colorspaces. This results in
undefined behavior when userspace is setting an
unsupported colorspace.

Allow drivers to pass the list of supported colorspaces
when creating the colorspace property.

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
 drivers/gpu/drm/drm_connector.c               | 140 +++++++++---------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/drm_connector.h                   |   8 +-
 4 files changed, 83 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ddba0b9fcc17..0df5db3e4fec 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1012,64 +1012,57 @@ static const struct drm_prop_enum_list drm_dp_subconnector_enum_list[] = {
 DRM_ENUM_NAME_FN(drm_get_dp_subconnector_name,
 		 drm_dp_subconnector_enum_list)
 
-static const struct drm_prop_enum_list hdmi_colorspaces[] = {
-	/* For Default case, driver will set the colorspace */
-	{ DRM_MODE_COLORIMETRY_DEFAULT, "Default" },
-	/* Standard Definition Colorimetry based on CEA 861 */
-	{ DRM_MODE_COLORIMETRY_SMPTE_170M_YCC, "SMPTE_170M_YCC" },
-	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
-	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_601, "XVYCC_601" },
-	/* High Definition Colorimetry based on IEC 61966-2-4 */
-	{ DRM_MODE_COLORIMETRY_XVYCC_709, "XVYCC_709" },
-	/* Colorimetry based on IEC 61966-2-1/Amendment 1 */
-	{ DRM_MODE_COLORIMETRY_SYCC_601, "SYCC_601" },
-	/* Colorimetry based on IEC 61966-2-5 [33] */
-	{ DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
-	/* Colorimetry based on IEC 61966-2-5 */
-	{ DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
-	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
-	/* Added as part of Additional Colorimetry Extension in 861.G */
-	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
-	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
+static const char * const colorspace_names[] = {
+	[DRM_MODE_COLORIMETRY_DEFAULT] = "Default",
+	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = "SMPTE_170M_YCC",
+	[DRM_MODE_COLORIMETRY_BT709_YCC] = "BT709_YCC",
+	[DRM_MODE_COLORIMETRY_XVYCC_601] = "XVYCC_601",
+	[DRM_MODE_COLORIMETRY_XVYCC_709] = "XVYCC_709",
+	[DRM_MODE_COLORIMETRY_SYCC_601] = "SYCC_601",
+	[DRM_MODE_COLORIMETRY_OPYCC_601] = "opYCC_601",
+	[DRM_MODE_COLORIMETRY_OPRGB] = "opRGB",
+	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = "BT2020_CYCC",
+	[DRM_MODE_COLORIMETRY_BT2020_RGB] = "BT2020_RGB",
+	[DRM_MODE_COLORIMETRY_BT2020_YCC] = "BT2020_YCC",
+	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65] = "P3_RGB_D65",
+	[DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER] = "P3_RGB_Theater",
+	[DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED] = "RGB_WIDE_FIXED",
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
@@ -1972,21 +1965,34 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  */
 
 static int drm_mode_create_colorspace_property(struct drm_connector *connector,
-					const struct drm_prop_enum_list *colorspaces,
-					int size)
+					u32 supported_colorspaces)
 {
 	struct drm_device *dev = connector->dev;
+	u32 colorspaces = supported_colorspaces | BIT(DRM_MODE_COLORIMETRY_DEFAULT);
+	struct drm_prop_enum_list enum_list[DRM_MODE_COLORIMETRY_MAX];
+	int i, len;
 
 	if (connector->colorspace_property)
 		return 0;
 
-	if (!colorspaces)
-		return 0;
+	if (WARN_ON(supported_colorspaces == 0 ||
+		    (supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) != 0))
+		return -EINVAL;
+
+	len = 0;
+	for (i = 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
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
@@ -2003,11 +2009,12 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
+					     u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector,
-						   hdmi_colorspaces,
-						   ARRAY_SIZE(hdmi_colorspaces));
+	u32 colorspaces = supported_colorspaces & hdmi_colorspaces;
+
+	return drm_mode_create_colorspace_property(connector, colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
@@ -2021,11 +2028,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
+					   u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector,
-						   dp_colorspaces,
-						   ARRAY_SIZE(dp_colorspaces));
+	u32 colorspaces = supported_colorspaces & dp_colorspaces;
+
+	return drm_mode_create_colorspace_property(connector, colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
 
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 1dcc268927a2..6e7cef58a626 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_connector *connector)
 void
 intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_hdmi_colorspace_property(connector))
+	if (!drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff))
 		drm_connector_attach_colorspace_property(connector);
 }
 
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_dp_colorspace_property(connector))
+	if (!drm_mode_create_dp_colorspace_property(connector, 0xffffffff))
 		drm_connector_attach_colorspace_property(connector);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6ab83296b0e4..8d08d6a36f37 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -416,7 +416,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_mode_create_hdmi_colorspace_property(connector);
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0xffffffff);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index edef65388c29..5825c6ab969b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -30,6 +30,7 @@
 #include <linux/notifier.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
+#include <drm/drm_property.h>
 
 #include <uapi/drm/drm_mode.h>
 
@@ -393,6 +394,7 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
 	DRM_MODE_COLORIMETRY_BT601_YCC,
+	DRM_MODE_COLORIMETRY_MAX
 };
 
 /**
@@ -1818,8 +1820,10 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
-int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
+					     u32 supported_colorspaces);
+int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
+					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
-- 
2.38.1

