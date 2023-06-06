Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7A3724E07
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD9D10E3B7;
	Tue,  6 Jun 2023 20:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8410E3B0;
 Tue,  6 Jun 2023 20:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRDADy+zX0CIOX6shYNSJqTAoKqJbYCan8m2wxUNz0m9c500AwmX3ReO5ALwnWYAv6caVckPhlk+ZKDhEDDcQyRd9+NtUUaXyns5ra45/2nUOAaEHKt0aM1cL9bwWQvGsaGM//ZkEKUX3Mxow41MSLSveYOzzC0+Q2Tf0IKmyp82Ew4p6TlOZCmwHNuMR+E3w40zLpSz3sA1nFHvSok6lGR9sXSxgeXFqbVfBAOprmLLI3Y/d7+tCkBzFDQAaMbMV9Q2EMxX70KMTAtCVmG1l4GWcmsJ86zDvGVYYUyQfuBLJtBNQ7XBcTdrZWvaVwyJPJ6bHkF0o/VfGqK+WMbT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12TmfGqEzpwdH5qOZwibR55046Lhg5OzL5JgP4yQ5s8=;
 b=ZEnNLuFlkI3lOEzDobs/ZU8a6EVdQ0F5AAODs8t4+JDcNQRSX39hBjO2pdCydyym4aQdpcbJ72Qz3dXZlmiUlw9l7JHXnX0z0I0d+cAUd1LzNpgZEmVkwSR6fHXQoNkpbmLaHw2U0cIcNM96ppEECVm26lI0QIavn8B/CSnQpEhDWrcH/9kSjBTW6CbsLQ7n40npKaFns1RdOc2wTPvAchjHA2Z57yWFSubuy1K9EqbRxH4sP3qhuwPXeYUn0EmNMifCuaOnzxsiZEvx59WOWGOOtLl0+6OoExwKrbJXJH+xNqt44Rxx981VxRuJRAwGuV9NFFfRBdPmgkILqWxk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12TmfGqEzpwdH5qOZwibR55046Lhg5OzL5JgP4yQ5s8=;
 b=SN6uwDiPfm9yP2wMAtLvSqDmfbZqffRuKm+f1IamjuEyhZ1qp2iU2mdnpdkZQvNvN9SNQRnqrelldYWuZMlKzHmZB6dlqVU6wdLoYtVi+j7q079SMYp+8H5Bz3++GZyIzGtnhNKfbX3x8qn2sHJSXicH7FH7MXoxI/IKYXcLQTU=
Received: from BN0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:408:141::19)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:26:17 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::a7) by BN0PR07CA0013.outlook.office365.com
 (2603:10b6:408:141::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:16 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:14 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 04/13] drm/connector: Use common colorspace_names array
Date: Tue, 6 Jun 2023 16:25:58 -0400
Message-ID: <20230606202607.122914-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a61595-dd48-427b-4260-08db66cc4801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiwPp+xjGqWFw/ZrgIZvXlQsss1fX6F0yAbiC08WVFKBwMqJ/6VtJqlOC/TqEjrgvGFg4vpcE15Op2gKSHqyxO99k/z5kjzgy2EKzC4/WYexBSRdoc9KVIhrCScUE08VBlNEKHvNtyfvY5/Lg0Vf5teZPBddgHgVgkcOiyDkorzjI5fEvanDjgRsXZSwRhxNrzAcZyCcI32w19GVv53/olBHpgVrPo4AThsXibKnR3bXZDFKJ2viqLeyWH3z/n6G6Pv88y9DKPJFAktIyQa/f4izvYhVKSQsz9mpEUpsZlNqNMCgunv618ybwl5scgAI11+AFznxgWVwfRLdLfMAcAQqjTT/fURDpos7lIo0Igf84ZNmlkpkDWj9ud09VESPY5GXMEArNqtbXPCVuieODyd7yA84WAX2GNhTM2zp3yqFojGWNJDeV3FGM8V9I+snsYifxyLtPc4NCrBWcBQxFAgB+8WZlMYWF9H2Vu2BSbSadoazwELp3HCUwxc6BWGi7JzXsM5dpaTnstRIpy6DWkrTgu2Kp9y63wU4AvHX9rNcjT4aIg4CRXsnnHMeOF6pmZ+6RQhfDmZSeejQR8bkkqjyzlPBfVWxQcYF8NZKENAhzPTmI34YDqxYkCAl5tjQNb55Py0w7NPCVW01DJ4g6pqLhxpCoQm/JGVLIpVZ5tPraDVRtKphZdCSnx4efzqJN+MFe5EArjj80y+2CtmoPWMn9tc+X69GTUPWgmqy6h6j4wFGctYSjevJonPaHjK6Sibj8VsRb44/Q0RjlDZ2AQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(86362001)(5660300002)(66899021)(186003)(8936002)(110136005)(26005)(40460700003)(1076003)(36756003)(2906002)(54906003)(316002)(7416002)(44832011)(8676002)(41300700001)(40480700001)(4326008)(356005)(82740400003)(70206006)(70586007)(478600001)(426003)(6666004)(2616005)(82310400005)(83380400001)(336012)(81166007)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:16.9992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a61595-dd48-427b-4260-08db66cc4801
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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
 drivers/gpu/drm/drm_connector.c | 125 ++++++++++++++++++--------------
 include/drm/drm_connector.h     |   2 +
 2 files changed, 74 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9c087d6f5691..8d24a5da4076 100644
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
@@ -1976,27 +1982,44 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
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
+	if (!supported_colorspaces)
+		drm_dbg_kms(dev, "Driver is not passing supported colorspaces on [CONNECTOR:%d:%s]\n",
+			    connector->base.id, connector->name);
+
+	if ((supported_colorspaces & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0)
+		return -EINVAL;
+
+	len = 0;
+	for (i = 0; i < DRM_MODE_COLORIMETRY_COUNT; i++) {
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
@@ -2009,9 +2032,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
  */
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
 {
-	return drm_mode_create_colorspace_property(connector,
-						   hdmi_colorspaces,
-						   ARRAY_SIZE(hdmi_colorspaces));
+	return drm_mode_create_colorspace_property(connector, hdmi_colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
@@ -2027,9 +2048,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
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

