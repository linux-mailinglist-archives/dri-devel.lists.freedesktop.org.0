Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41612711728
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825410E73B;
	Thu, 25 May 2023 19:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013AE10E110;
 Thu, 25 May 2023 19:18:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTYacyj9qZyrarKVMBSf+D04K6Ym5xfIFPyruC+Y/ZE0bErX3dUrWgo1sBo4XK+2YKDUmVX6hXgSdW6kWQWvk1VEL13/KiD18qQUCedJFju1ZLP/MqbXe0DSvG4ZeqBIcjKv2OMKuIsNiRkgg45apmZmtR09kNThABW8MeHn4nl0O3IjLSU1J03WAlz0bhpLQCe9XHvWHwBqddxtgYvfoKKN8C0HtjPesuwidACIKFp/8rlcpcC1L+lYjAse5p7jLRQ9l01WoK5NcA7Ksk6fJZFsVZ9JM5sa64ih+QOAHscsLLLskaLTwuWyIBGKRD+AOf0OibEaHXsTto5kGXp05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt7o+KeQqGbJ2T3VAiKrfGTGtqSEZssui4xI73o1pmI=;
 b=jZkmFZWXI6dJiTzOJMGo9Tk3sQCUqfPQrwtMkzBjqPxW++wvLRvmycHa+bIVXDjkZK40jcpXElWO1uMy8CocokMTtLsu5G7LBGC2re98yWogXBz0Lv4hyA6oMT0M6Ih1uE42RzzVPmSEd7RprgYU5GEiDtTG3WnSZCtEjB/XI0N1IU2RlwHt+aArtJc+4WwzfvVEnoTOKB7nJYXqDPObH0JTD0yNFRYA10mHm7umpJOGBrqo3e9kHldHCdY7jVkMFwEF3if4tcPgyPMIKKwKdbqNor5NC2qTkewUySyR522K//23k6fb+2SWocqQ8klSk+KoZYcUHAAjogbxpsps9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt7o+KeQqGbJ2T3VAiKrfGTGtqSEZssui4xI73o1pmI=;
 b=F0Utg/0RUDLkmx2YTVqSpeQxklPgKzJ54/+SbB9HmmdKP8CybfErViQTD53FcBJ4rKbDZC8H/pf+VoksmWDTa33XKAeZSndn/sO2IFmO+fvkPUi2aGRxy+W7KYznlWs+sCfsvQxXvBF8wUSWMCKbjVWVceaI3H18jRh8fIKtao8=
Received: from SJ0PR03CA0185.namprd03.prod.outlook.com (2603:10b6:a03:2ef::10)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 19:18:32 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2ef:cafe::2b) by SJ0PR03CA0185.outlook.office365.com
 (2603:10b6:a03:2ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:18:29 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 04/13] drm/connector: Use common colorspace_names array
Date: Thu, 25 May 2023 15:18:00 -0400
Message-ID: <20230525191809.3524-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: d4160460-ad58-4d53-e7fe-08db5d54d438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5zfR45QxJm+r1Z3CeIiWj5eQtE3OxhUpr15GhfMFn5aZA8UgclaCnRFhYDQHLyZO0wMn4A6PYl3pjnOpM3rFWM2otsj9J0K8O3q0sTpSqq2syr9qPSgJAbwmvbLIsMWbmsIQKBypomdnVsZygZ0lV8nMK6pJ33TyFF9QcoY864xuHIH9jG6mKlo7ZvAQIg3tuGeLNOFOjBHtGFH4EWyV6wkdxvjiHSJKit0dYJ/MD3MU927KRimoewtMSos4fPtrzSvGFhUBG+nLCwns2cgTEPxc7vvoeFFq49FPhs0wF4VS1ER8vaPGhJPQvt2iOPE8VdX/ENN1Dw+pCbCBY1TOj+IZBwCv9t8CTrehvSPdO3BoLB29WoEwfbNxFB8v1rFEowBtGQftikOasZpssDXvb12HTQUk21GAd4+l37qrakauezhubX6INICnpE4KjEr4dQKUG7XqPs823N52Ip77sTbGSXFpINDnZQZJ1sY7IgrlRWjsrhuottFohc2mKtb3WUt60fDHBOL3pN0TCeEXnxwPFvrATKcpz/cF+GNX4ditroHWl7mjonjnfU9DFs0+NxdMpx4bk/6wMhMt9buE4R0p3CSb5tQLLVm5ZZIaZyWjVMPobSDMTsDAUzBDGdnbYJKVYgPniZkvm/WhkrQqkF9QGNOw5iXdpG3gNZgRlWHIoaz8V7FRGRt5HGSwCgKmxwahL1a7tav2hXRWucMTzVrciQ2rqVabzsJpOsjXIEfhdv05WKQYO1JQhxEjlstf20JRZ2zvjdHQQ1Jq5zIqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(46966006)(40470700004)(2906002)(54906003)(66899021)(110136005)(82310400005)(5660300002)(47076005)(36860700001)(7416002)(8676002)(8936002)(44832011)(426003)(6666004)(41300700001)(478600001)(70586007)(4326008)(316002)(70206006)(40460700003)(40480700001)(26005)(83380400001)(81166007)(1076003)(86362001)(336012)(2616005)(186003)(36756003)(82740400003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:32.1411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4160460-ad58-4d53-e7fe-08db5d54d438
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
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
index ee597593d7e6..565311e194da 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -452,6 +452,8 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
+	/* not a valid value; merely used for counting */
+	DRM_MODE_COLORIMETRY_COUNT
 };
 
 /**
-- 
2.40.1

