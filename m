Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2040B6AE407
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AA110E4E6;
	Tue,  7 Mar 2023 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298DF10E4E4;
 Tue,  7 Mar 2023 15:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwDASMFe/x+lnPWCyvXCBt+UXAq61rjCq8lCd8V3y7WrhF6SMm4us5N/w8SMuAViVV6FxyMUuezmLLZQSRcv/q76NaCcloK9QwV4FVFqGYltUkuLqxJgCFfs6M2YjalDaHDrMBGklNJTh6DVu46z6uC50SMH0w/NTBj01uUUABviLYEneW/ASSGel8q4NJZpUgOt/t4fhXT4UyoND/d0eMLlDyNaqELrsCCUIXeRf5fZcH+TfdGrOd1bnomymvbN8iVrLkaLCL849P1VVwQmOsHw0iTbbY1EXYDPHqbX9puBpJYYBdhCuuTKwFNVxfYDWB28OsJeDwGs0nkK074IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBAkFEWpyLbo4zJtQXuE57KdFEh/F2W22fqdVahHseQ=;
 b=a8RL+J9ypTAf8j+Ekj3h1jTISRJTAFFkN6Pno+yU7NFniQCt+/W9incfZRO6tM9b5fQ1DHnBaY5Z2RrGct+gEHlNAa227wLxR9LrzYzXNoB7nxUqR6RH9BiXNt/a4rX4IGl10e6EBFY/MmAVtucRtOYbZPOYONL/WjphdVpK9Us0nL/Vl49Y/G+RuPvVZGL1YQrjVNwV87LDIWRDFYEhx0tiOCYvG61T4nQfhpEORm8sQ4ClUGEMeoX0uC1lHlwsup4Iwj7VBzEdboWlcyH3URMbqJkFiIljCXLmz7e6vKVoStlrl6B53u38fZKkX0+zt0cPJQjYQ7TMK4W9cSmpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBAkFEWpyLbo4zJtQXuE57KdFEh/F2W22fqdVahHseQ=;
 b=BIZJdtabtzPDnScrzlBtznD5M5LhZ9Ezu/ssi6DN+JwWrkDrz5hr7E/4N9GuWVGcVlmlidMgyRRGgQFUuIMiW+mT7lAVNHxVcQBbm90ZJSydJM2UlXgagOo+UXpMEFINgoWEBi7yvd0QR2vWOT5t72U9d9LRkMfEQ8yHJgd/a+Q=
Received: from DS7PR05CA0058.namprd05.prod.outlook.com (2603:10b6:8:2f::11) by
 CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Tue, 7 Mar 2023 15:11:17 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::eb) by DS7PR05CA0058.outlook.office365.com
 (2603:10b6:8:2f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:17 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:16 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 03/17] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Date: Tue, 7 Mar 2023 10:10:53 -0500
Message-ID: <20230307151107.49649-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: bb33c077-990b-4fa9-815a-08db1f1e338e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFdRsPdnHin9zPgcfWdnvBbaF9dhBvbNpUihMwgVNbpdEsjdLUv1SiqdwY5nMwPmx8BQ1i7Q++LzC6xy/5xqnUwbukL91i9j/Ia7TLgnHkGycAV04zy+AF4levNyxufP2tpOzAOPo2ijIhbAHJpk+Oy2+sKMo89ut2m6jOCllo9UFfw+ktLvh0QJvOxqTnB0ZQIZ9G2znXqKxvFwLriDqF13trNIvicrKpwWgdWYwxFd8FxTcro+g+sMAFI0rzf37KTRVypsb22+bc11IARl/s08DTEuhJx1NtaHHhdzG7XmtIVuo+WO0oHXqO53DmR+9QeA0nim/a+BpTqytJMnIHFcC7o0qg0M66GOo++LLDbqDi09/PdaUkK03ejRKQ77QxSKFWds40jHAeOwjTMGaHo+uTTCegDpAHFRWJciVKRYTQqVIiPO48AEcVPptoIlETH7o9CJ2GqXQqwqlLdDglLitMv/NGYYeVep357vXqCIeG28L04Fd/Tm3QVtLk21t0pIgBs8o2QJlcew6NF4Pi5x8G7wYscacMAMGS3WBNRJMG6CuzvPHN6173LkDTCn6c8YlE95c2B/vbAW8e+WyDiLuVdw1QTj+MZwXbnude2GMivjK2qZY77ulZm0nYLdG/8FlQBYWdCmN5s2waf0GW12YK9VS6koJG4l7qkV/y6OcG3/kSJHNAK8UOqe3F2ZIdSMEx2CPSUO7Ve8yFTdE2DKWP4Kos5pD16jjG9/iVM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(36860700001)(82740400003)(86362001)(81166007)(356005)(36756003)(70586007)(4326008)(8676002)(2906002)(1076003)(44832011)(5660300002)(70206006)(41300700001)(8936002)(40480700001)(82310400005)(426003)(40460700003)(186003)(336012)(83380400001)(26005)(47076005)(2616005)(316002)(6666004)(478600001)(110136005)(54906003)(66899018)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:17.6733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb33c077-990b-4fa9-815a-08db1f1e338e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
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

From: Joshua Ashton <joshua@froggi.es>

Userspace has no way of controlling or knowing the pixel encoding
currently, so there is no way for it to ever get the right values here.

When we do add pixel_encoding control from userspace,we can pick the
right value for the colorimetry packet based on the
pixel_encoding + the colorspace.

Let's deprecate these values, and have one BT.2020 colorspace entry
that userspace can use.

v2:
 - leave CYCC alone for now; it serves a purpose
 - leave BT2020_RGB the new default BT2020

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/display/drm_hdmi_helper.c |  7 +++----
 drivers/gpu/drm/drm_connector.c           |  8 ++++----
 drivers/gpu/drm/i915/display/intel_dp.c   | 14 +++++++-------
 include/drm/drm_connector.h               | 15 +++++++++------
 4 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..05a0d03ffcda 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -97,8 +97,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
 #define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
 #define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
 #define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
+#define HDMI_COLORIMETRY_BT2020			(C(3) | EC(6) | ACE(0))
 #define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
 #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
 
@@ -112,8 +111,8 @@ static const u32 hdmi_colorimetry_val[] = {
 	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
 	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
 	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
-	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
-	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
+	[DRM_MODE_COLORIMETRY_BT2020_DEPRECATED] = HDMI_COLORIMETRY_BT2020,
+	[DRM_MODE_COLORIMETRY_BT2020] = HDMI_COLORIMETRY_BT2020,
 };
 
 #undef C
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 61c29ce74b03..fe7eab15f727 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1031,9 +1031,9 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
 	/* Colorimetry based on ITU-R BT.2020 */
 	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
+	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
 	/* Added as part of Additional Colorimetry Extension in 861.G */
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" },
@@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
 	/* Colorimetry based on SMPTE RP 431-2 */
 	{ DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
+	{ DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
 	{ DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
 	{ DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
 	/* Standard Definition Colorimetry based on IEC 61966-2-4 */
@@ -1068,7 +1068,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
 	/* Colorimetry based on ITU-R BT.2020 */
 	{ DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
 	/* Colorimetry based on ITU-R BT.2020 */
-	{ DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
+	{ DRM_MODE_COLORIMETRY_BT2020_DEPRECATED, "BT2020_DEPRECATED" },
 };
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c9be61d2348e..be100a193bf5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1766,11 +1766,11 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
 		vsc->colorimetry = DP_COLORIMETRY_BT2020_CYCC;
 		break;
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
-		vsc->colorimetry = DP_COLORIMETRY_BT2020_RGB;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-		vsc->colorimetry = DP_COLORIMETRY_BT2020_YCC;
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
+	case DRM_MODE_COLORIMETRY_BT2020:
+		vsc->colorimetry = vsc->pixelformat == DP_PIXELFORMAT_RGB
+			? DP_COLORIMETRY_BT2020_RGB
+			: DP_COLORIMETRY_BT2020_YCC;
 		break;
 	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
 	case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
@@ -3043,9 +3043,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 	switch (conn_state->colorspace) {
 	case DRM_MODE_COLORIMETRY_SYCC_601:
 	case DRM_MODE_COLORIMETRY_OPYCC_601:
-	case DRM_MODE_COLORIMETRY_BT2020_YCC:
-	case DRM_MODE_COLORIMETRY_BT2020_RGB:
 	case DRM_MODE_COLORIMETRY_BT2020_CYCC:
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
+	case DRM_MODE_COLORIMETRY_BT2020:
 		return true;
 	default:
 		break;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index bb078666dc34..3e2e1bc7aa04 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -409,12 +409,15 @@ enum drm_privacy_screen_status {
  * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
  *   (HDMI, DP)
  *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
- * @DRM_MODE_COLORIMETRY_BT2020_RGB:
+ * @DRM_MODE_COLORIMETRY_BT2020:
  *   (HDMI, DP)
- *   ITU-R BT.2020 R' G' B' colorimetry format
- * @DRM_MODE_COLORIMETRY_BT2020_YCC:
+ *   ITU-R BT.2020 [R' G' B'] or
+ * 	 ITU-R BT.2020 [Y' C'b C'r] or
+ *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
+ *   colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
  *   (HDMI, DP)
- *   ITU-R BT.2020 Y' C'b C'r colorimetry format
+ *   deprecated; same as DRM_MODE_COLORIMETRY_BT2020
  * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
  *   (HDMI)
  *   SMPTE ST 2113 P3D65 colorimetry format
@@ -448,8 +451,8 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_OPYCC_601		= 6,
 	DRM_MODE_COLORIMETRY_OPRGB		= 7,
 	DRM_MODE_COLORIMETRY_BT2020_CYCC	= 8,
-	DRM_MODE_COLORIMETRY_BT2020_RGB		= 9,
-	DRM_MODE_COLORIMETRY_BT2020_YCC		= 10,
+	DRM_MODE_COLORIMETRY_BT2020		= 9,
+	DRM_MODE_COLORIMETRY_BT2020_DEPRECATED	= 10,
 	/* Additional Colorimetry extension added as part of CTA 861.G */
 	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65	= 11,
 	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER	= 12,
-- 
2.39.2

