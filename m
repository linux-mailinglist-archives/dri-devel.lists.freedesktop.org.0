Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0180C5FB38
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15CC10EB54;
	Sat, 15 Nov 2025 00:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I86IWQjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76010EB33;
 Sat, 15 Nov 2025 00:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LydErbnnpIc8+ymYDMb2HTJYYu89JMfGNBCwzsSX+YL5i6bH7rqF/5udhQCk9RPmGcVvaU9k2SrLaev7VmdktWeESFvdCX7TtplBAhNUIQY1jMIi6kyHKr64fUJFjeEoGN29KOzeYCmYhTZYXbaoh3OQUML2eai8rM3ET6PyyxjCdPyUnYiblPk94Z/heGVt7+dLLCZ68MM9SCzz/fI58WwBOT+syVMhLgdW27glhqqatjG7faSH1f63b+QcjCgnie83Q+K6pKbGuE8WghflV+WbZm1/jLfNJgst8Jhu0rOcS6qt0TJ3kNJeyOk1a0gDVvqM9Fx3Ms/Le3GJeRhmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqXUruZ8e60+9pmHjY8RgU4J6fGD9pT7rqaQWLMYA/E=;
 b=Qgq6Sm8rvIqu5w9lsONxgntIwj8p8aLJh0XHIAIuAi7CKrumeOyCjreRTECdkWCKPckrcaYNO5d2YuMDyOV8RBuD2YJvIx6noBEZt1oeQdqpve7D6fEtcZpcvmAlGngSW3t5LG5yyaXd1TlnFt//c3RR35RBANcsHARukIETpjU5MtSNS0Kr4MW0KVYD52hQPvk6N+LY7gtxpk5qv617rAyhgm/ilTeMKIVFUygaJWgP/4vHwiy5dNi+beA47RSX7pnJALHTWhq7hv4QJNI8xQedh2MwiOr0q0Q2gAhdfg9u9OpTYVDWGmEdozXeYvm2tConiqD9RE0M+Z21aISU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqXUruZ8e60+9pmHjY8RgU4J6fGD9pT7rqaQWLMYA/E=;
 b=I86IWQjpAR7eft9hgqC0qVB2z/5nmV+TQcfjEAAxTUMldtvVYWUpK4gaSnbDfCMxSfNGJMlLuOHG1tKik+lK4ApwTABbVB2Y90DpR8vFe1zLyXN9yZfAN6EB0z8yr5JOlR5fKNJJSb58MHxVi0T7XUcqjhmTICFA3aIbiWD334s=
Received: from PH2PEPF0000385B.namprd17.prod.outlook.com (2603:10b6:518:1::69)
 by LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:12:09 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF0000385B.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:12:09 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:12:05 -0800
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V13 35/51] drm: Add Enhanced LUT precision structure
Date: Fri, 14 Nov 2025 17:02:00 -0700
Message-ID: <20251115000237.3561250-36-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV3PR12MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: f47dd71e-c1d6-4276-e92a-08de23db9e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y199nuBv4pgWjYIqFPLfNuCXdEh5omtDrT7xIJ2rl4TkbGCeC/MTnj9YmVJr?=
 =?us-ascii?Q?h0mZVHToo9zqG2BQC8P64v3//oqsGiom3rowqK2NXyzm1yZ5FH8XoWQEhReH?=
 =?us-ascii?Q?bgN8MSGSnfWjBmdQsthDynQcgJsIoFcALDmtwpLF+almZbkdOlnxohhNRTPJ?=
 =?us-ascii?Q?qYWUeG4Eiy4cbtSjnm/G8Fv7AnbFLKlExsHVFKKRtMd8F/gYcSGnxIIYIX4P?=
 =?us-ascii?Q?gmqjy7ek/WdRraEJ209cIttndLHkBDtXD6dJeKlVOrerTfyZuv52QV/sxUbW?=
 =?us-ascii?Q?cbDN1aZXTel8+iQnptB4u4KScWOB0QwsOL/WnoNEstjlO2zYD7+YhD04Hc/P?=
 =?us-ascii?Q?fpeF8JRhLlwri6Zh9G8+T5LTGrMpZkffUJ3YPp7w06lkD3xrOzTu8vNXXzn2?=
 =?us-ascii?Q?qpYfXuaxpbJUQNOo81MCs5gkAqBEWmDLACh5+zuvBhowuq1KPlfl5bJaZ/fv?=
 =?us-ascii?Q?oHkhqg/GSXvn2dErBQLAmPAy45tx0pm/OQSZrazeetrcs+cBToLuZ7s5gEsN?=
 =?us-ascii?Q?APMDP99OCf3b5gp0W5CLHWQljtZiSeIE0svnIvsCFgLCTgrLpPExzMNCLW/Z?=
 =?us-ascii?Q?MTeZdj5KYKQ4Rp+ow649LUcPPyQRz9PcPAY5hc01otHuvyhxZuggvBuFhtZM?=
 =?us-ascii?Q?ds6/XmkeFGxYiAaj6J0K7d1u8na33sDob4TwnEe/65GG2w3ZZQehvdJg1IMV?=
 =?us-ascii?Q?y7DP2vExmuhOLAFaouEUPm7WK1XGjSK8eylCEEefzjOwXJyzWD4oP11UlZJv?=
 =?us-ascii?Q?POuXt7yYouMvDPi0jfo6FQ+37qb4aoKBmp+IeRWnaAFEQegVH2XLjT4uC0xf?=
 =?us-ascii?Q?Owh2COtFHJXyR3ORg0JFWG54Ut6WJ7JU/NyQUf1gZ52hSVW6sRy4dZe24R23?=
 =?us-ascii?Q?MV+2TqiybBOBSkw3H8Nnz9JbpC9w+U4Qh7mpG+N2lSOb8wp4td51xlTvHa0G?=
 =?us-ascii?Q?xT5iEqY2lp8LU+UCr1YtNTY3Jx68BB7jTEM93zC4s98c9vNN8G3S43k2VRjc?=
 =?us-ascii?Q?UGvucmDGoP2Rg7Qyk5c4RSCHWcFElf3MslYufDLBnNgfaxWdhDAhk55isTDh?=
 =?us-ascii?Q?RIYSI8VPpVvtzD2vMPRNdLW+YeosHnjhX1leEO3A2IkcpKX79XNGaDxRVMXY?=
 =?us-ascii?Q?PthRrng9K41nawCdSfqQ/cMDnlTIXNHHZTJ/Rjl8z/4XVcNNM+99NQfOvA7y?=
 =?us-ascii?Q?xN/3YFJAhT2a7HMVUcZ2WUggGWFqgqnX7FAwPHHOzI+x7AfjI/NbdLbGLr4l?=
 =?us-ascii?Q?25D/+4UCsnfdnhdmHV2mt06xSzz0lJxCPr81+YqytNLHoAmsTvafgS5SjyFk?=
 =?us-ascii?Q?U4zPlHnDbWj+7GAYyUo86/u8euHRE1nO0FQKPOPCjohco/hBcRY662AwO0NN?=
 =?us-ascii?Q?LD2mxE2mRtr5srNYdriKJVCKTotoqTEMqxgBoFFvDEuO4NqFapZFqy6D/PCC?=
 =?us-ascii?Q?HDXz8chlZoBRgNDSKKGN4i4EzhZz71PpMVoW2aubyKnnSLVrv9Kh/e6So8Mt?=
 =?us-ascii?Q?aPIfl06dd6FYKchXIQtwAMrPNDSgyN8Zof3gwVT5alUJBipwetR37bxdDsHp?=
 =?us-ascii?Q?N2hIIoWHySgHFhrN+WA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:12:09.0931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47dd71e-c1d6-4276-e92a-08de23db9e2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Uma Shankar <uma.shankar@intel.com>

Existing LUT precision structure drm_color_lut has only 16 bit
precision. This is not enough for upcoming enhanced hardwares
and advance usecases like HDR processing. Hence added a new
structure with 32 bit precision values.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - Include drm_color_lut_32 from Intel to support 32BIT RGB in 1D & 3D
   LUTs (Uma Shankar)

 drivers/gpu/drm/drm_color_mgmt.c | 43 ++++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     | 13 ++++++++++
 include/uapi/drm/drm_mode.h      | 12 +++++++++
 3 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 131c1c9ae92f..c598b99673fc 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -874,3 +874,46 @@ void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_pa
 		fill_palette_8(crtc, i, set_palette);
 }
 EXPORT_SYMBOL(drm_crtc_fill_palette_8);
+
+/**
+ * drm_color_lut32_check - check validity of extended lookup table
+ * @lut: property blob containing extended LUT to check
+ * @tests: bitmask of tests to run
+ *
+ * Helper to check whether a userspace-provided extended lookup table is valid and
+ * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
+ * the tests in &drm_color_lut_tests should be performed.
+ *
+ * Returns 0 on success, -EINVAL on failure.
+ */
+int drm_color_lut32_check(const struct drm_property_blob *lut, u32 tests)
+{
+	const struct drm_color_lut32 *entry;
+	int i;
+
+	if (!lut || !tests)
+		return 0;
+
+	entry = lut->data;
+	for (i = 0; i < drm_color_lut32_size(lut); i++) {
+		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
+			if (entry[i].red != entry[i].blue ||
+			    entry[i].red != entry[i].green) {
+				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
+				return -EINVAL;
+			}
+		}
+
+		if (i > 0 && tests & DRM_COLOR_LUT_NON_DECREASING) {
+			if (entry[i].red < entry[i - 1].red ||
+			    entry[i].green < entry[i - 1].green ||
+			    entry[i].blue < entry[i - 1].blue) {
+				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_color_lut32_check);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index eccb71ab335a..527582c20885 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_lut32_size - calculate the number of entries in the extended LUT
+ * @blob: blob containing the LUT
+ *
+ * Returns:
+ * The number of entries in the color LUT stored in @blob.
+ */
+static inline int drm_color_lut32_size(const struct drm_property_blob *blob)
+{
+	return blob->length / sizeof(struct drm_color_lut32);
+}
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -146,4 +158,5 @@ void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *
 void drm_crtc_fill_palette_332(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 
+int drm_color_lut32_check(const struct drm_property_blob *lut, u32 tests);
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 054561022953..5e637ec7b64c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -872,6 +872,18 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/*
+ * struct drm_color_lut32
+ *
+ * 32-bit per channel color LUT entry, similar to drm_color_lut.
+ */
+struct drm_color_lut32 {
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
 /**
  * enum drm_colorop_type - Type of color operation
  *
-- 
2.43.0

