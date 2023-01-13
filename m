Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2EB669DE9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421E10EA53;
	Fri, 13 Jan 2023 16:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A2F10EA45;
 Fri, 13 Jan 2023 16:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB/deeLA6qMvt0DJYG/ThkhlYVC7aHosNpnbb35+SqpgJFRO+DaJlgZ+VznQo0oAqRZV/Lur4qebtjiicgd5F7xx45TK9kL8SM4wASlvmyESYudHCOnINp/L/2xgOMwFtJ4pvyPHbQZcrbtPxoAoDDycgUnEDqTiBdOQ1ksycuEiHL7SWwLa/yFAwpQLBDZqKfaemSvY4KnYRRP8952PYNKCraFzzmQJR/cGiRcXiZTKEYq518CfO8xYP/JAvEi0a+vxvrgg63kaGhL/MCgI3JtSKGLVpGeciICIDgjQUComeTtQxNrEDgAnjAVMoJOmKIy7aI63eAUYVuZSi+U1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJIAgw8mMCtt9FIyvYx61tjZISOmCn2P6DmK6G4xZws=;
 b=nOV+D3S/WaXuZwCf6WQaoD9OsKBz5bcFctUmysch5RrxlFEY+PSu0xwZWiNgb/k8phGVOipqZY4rtJXHz9lwkvU2To5Ki+hinUSK/Uy/txe41Y0cysr70wcQHv9ZxO3od+MYztEQNWKs/EhqlHkt58c4BAtKDz+ycgbg44Ej1YpjKd9dMJLVREpBmvE59tgCDfmrDzISiAk9nPNyqos2+lVBdpevYYYEmP68lPKVApJtKuAYUzltj5c7n1cQxkRvqnTTPefB/YBlEV4x6a5iWdJSjSOoDFA269uUex8s1UUe+E/g7r+akd+w47aqCM1uG55Tk7JIVJ6hjisNnBjpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJIAgw8mMCtt9FIyvYx61tjZISOmCn2P6DmK6G4xZws=;
 b=VwfntDmOl5Qpi7l/0o1nujSnyqIr/H2pTGFkjR2MzHXN0TDCUo3X8/6TRmB+uPx4QxJPOe7X8uCxt6FUVh38VWaBfROQ9ZgVmEQnaWi2dURmPNsTL7xF6ej0o43T/aPHrdNpAnl4RiE7Wk3S4o/GErExoi2Dqh2jQikQWdu54pg=
Received: from DS7PR05CA0085.namprd05.prod.outlook.com (2603:10b6:8:56::15) by
 PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:42 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::58) by DS7PR05CA0085.outlook.office365.com
 (2603:10b6:8:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:55 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:55 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 06/21] drm/connector: Allow drivers to pass list of
 supported colorspaces
Date: Fri, 13 Jan 2023 11:24:13 -0500
Message-ID: <20230113162428.33874-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 682a9470-abef-4450-7f8a-08daf582f458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcHsOlONczV/iic/AVRs3s5HALYEwp4W9l5trOvi6+YKm2wxdMOhoxQdptxZtbxxyVb0TH0qQMERrPS+nisvuIMiqSfs7Rr06otL4SuIhnjpeBMb5CIwFC5VUAjcHPSPNdDOPAH8RUXelFPL3Y3yFwfTs3ICcuBP/R67FICfA4RswOWdL9qMEcMIfW6DsGsbm5FxCaj0DKNv0lkJ3tma7F42zkQsQ29y8HNYRTWexVOBeOssgYyJwLiJ8QsP0WfdDqCcgBUn9ORXMrI/C8PPqirz2D/kawxZJv99Rjtz0ALnirPgj0eqTwjKweVKCpLbq+nbD1lFRA+dIiLBZ6m7ADpoOYgJCL7vGAqU8G2WRe3FRxrwzmPv8XoHvrkaXx+kVnWx4/JIUIn5rZcwJ/WJci+ctZOsGszUnrX9I00ad7IMZyWz46XmmxnE02h/6vZWH5zGcGm6nnduZao+f76zVe9+GVZNaU+DA46MhqcEC0oEJZAi7eWLays2REzgAwST5B380VIoZsIy6ARq3mDKAualYjJTjwUchPLq2vmyLsA//EeAg2S/n2Fkrvj1FhiVPWev1wFSC89qospkMMR9jy7VAQC9AlBN6+/7ilx0kFAyLLJgZtHkQWcO6Dl5XfJqtOoglWwdDaYCaaxgqBJJVlRrpwdUI2o54BYGVpDD8ZZjesEVXNZHZatNfC02fjgusv1jQ0IXdASITSTWlvEmeE1iPvQPBcpN1PIJvYr8qN4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(66574015)(1076003)(40460700003)(426003)(41300700001)(36860700001)(54906003)(36756003)(110136005)(8676002)(2616005)(70586007)(316002)(70206006)(336012)(81166007)(86362001)(82310400005)(356005)(83380400001)(8936002)(5660300002)(4326008)(44832011)(82740400003)(40480700001)(47076005)(30864003)(2906002)(7696005)(186003)(478600001)(26005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:41.9559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 682a9470-abef-4450-7f8a-08daf582f458
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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

v2:
 - Use 0 to indicate support for all colorspaces (Jani)
 - Print drm_dbg_kms message when drivers pass 0
   to signal that drivers should specify supported
   colorspaecs explicity (Jani)

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
 drivers/gpu/drm/drm_connector.c               | 148 ++++++++++--------
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/drm_connector.h                   |   8 +-
 4 files changed, 91 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ddba0b9fcc17..8e81105fb2ab 100644
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
@@ -1972,30 +1965,49 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
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
+	if (!supported_colorspaces)
+		drm_dbg_kms(dev, "Driver is not passing supported colorspaces on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+
+	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_MAX)) != 0)
+		return -EINVAL;
+
+	len = 0;
+	for (i = 0; i < DRM_MODE_COLORIMETRY_MAX; i++) {
+		if (supported_colorspaces != 0 && (colorspaces & BIT(i)) == 0)
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
+ * @supported_colorspaces: A bitfield of supported colorspaces or 0 for all
+ *                         HDMI colorspaces
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * HDMI connectors.
@@ -2003,17 +2015,20 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
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
 
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: A bitfield of supported colorspaces or 0 for all
+ *                         DP colorspaces
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * DP connectors.
@@ -2021,11 +2036,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
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
index 6d5cbeb8df4d..9e4b054266ea 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_connector *connector)
 void
 intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_hdmi_colorspace_property(connector))
+	if (!drm_mode_create_hdmi_colorspace_property(connector, 0))
 		drm_connector_attach_colorspace_property(connector);
 }
 
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_dp_colorspace_property(connector))
+	if (!drm_mode_create_dp_colorspace_property(connector, 0))
 		drm_connector_attach_colorspace_property(connector);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9e145690c480..95d73b817b05 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -605,7 +605,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_mode_create_hdmi_colorspace_property(connector);
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0);
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
2.39.0

