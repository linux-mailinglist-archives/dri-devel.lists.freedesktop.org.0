Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD4C1E490
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157410E9C9;
	Thu, 30 Oct 2025 03:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5b4aLoE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032D10E9C9;
 Thu, 30 Oct 2025 03:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB7RTLbuAv7mdZKSOOko4tPZws85p3Tn0GD+RhBBCIe1YBUFYpbqGUITVd1v0SfDjUmlJqqJgC2+UQxXCspz4VCjErYP0xAWLZfZU7l4Z5wzeo+oUSwUMkSaB34R4U7Rd2BBwSO7ocz1pOW4hQYPLwWg1pX5BCKIGA1LE8NXvtUH2D6LogiMm8A7q6ZvB92Itxss3Ll2/Nl1/hbTeBe1R984TYs2hF2qk7tQCFAsPRrKdYqYwrZMqp0gxW6jmdREpXLwjxf6GXFEF2IG3h6G8Aql6zU7mXkxSpvd5AJxMj8zZC6wXvrL+9MpKcIe/xXIhpjSdo8nJDG54eIjSXfmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqXUruZ8e60+9pmHjY8RgU4J6fGD9pT7rqaQWLMYA/E=;
 b=yzSLnv4/bIFRfiAyA3589SfT/Ei6Ma0oMv2ROXpnc4B8akZF7YPw1OrI4amfoCakVEmuKV3+isfZIeL0lNK2ZHh963mvOA+wfpSecEIhvUgR1G3s2LsrQ/AktqpWFD0J9Ci6F00bQ7S1tXA/Lv96HNL5ZndXAC8A2B9TF75772gPCttZ6bFMKGxW8rVTwvzRP6gpc3AgCb6QqBDEGushQeqsAqkNZknWbhsoZ/sw8tt/yUszlN/9+2pIknxCRdAtmZgm+DLMdqSUuYXBapF8LR6I07nwOijDwfi7iBx7RQRB61zwOQHQFXDK7JBGnbu0J4EVHPVnZ0NkUFH7dB9BKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqXUruZ8e60+9pmHjY8RgU4J6fGD9pT7rqaQWLMYA/E=;
 b=5b4aLoE+uztxwadKnWH0LPiS63Te69nhjeYeEJFeKFh0lHnb4tgItm0m3yV/g8KrngH7ip4jW42h5+0TbcCcFqryWQgR0+ltKwUk7m5CXbFZPZK40DEcrxcFChqW6tJ9CbbX8yGnwyH+4jtGP9xu1X1TGZfTV03OOfJ6VIEwUO8=
Received: from BL0PR02CA0092.namprd02.prod.outlook.com (2603:10b6:208:51::33)
 by SJ5PPFEB07C8E34.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:53:00 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::9a) by BL0PR02CA0092.outlook.office365.com
 (2603:10b6:208:51::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:52:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:52:55 -0700
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
Subject: [PATCH V12 33/49] drm: Add Enhanced LUT precision structure
Date: Wed, 29 Oct 2025 21:42:38 -0600
Message-ID: <20251030034349.2309829-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: fe185099-25e2-4521-a098-08de1767d140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AH8OZFWJgXPyFAhelAKRbvzy0x8z4GsdWhTBFhac4ZXwA343SNxLzTLZY81P?=
 =?us-ascii?Q?98tDP89VbqZhD9pcWGKBzOZLKT6z89UpsgFsRQ7g/u67mE/PcOOBrrG9fiF5?=
 =?us-ascii?Q?8i8g7l1aYmODTY2Viwbv7FT6OJj7UxeZfmfJB5VD96rYRC9RjfdW7alnClyv?=
 =?us-ascii?Q?PU/Tw79U7C//6DgBel6cic9blJuUwVbp6cofOQNMobz5REwzy3ov3CGpqYUT?=
 =?us-ascii?Q?HLp6qCnPyRAdfc0FYpLDTVnWmq4uyGOWqSWvdo+R69LTin/eE8coTvadX7Ue?=
 =?us-ascii?Q?669webyzsaGLXivwe+e047/GK5EycSNNx//iv0c8P8J2Vts+pf+eGit9boMb?=
 =?us-ascii?Q?G63zuvUaVo0xSzxXqjIzcPU+Jc5qlC69CUXgWmfnLyFyfK+Wc12BOWCIJ+EF?=
 =?us-ascii?Q?eL4wGLoG8zcJMztSKZvB5i1z0cPxncVnkgV4tWwuV9z/p1IrDQ4wfdqCnrzf?=
 =?us-ascii?Q?Ti59ROPfQqJKYrhX0poAMMR7EcziAAxHhkWIOYNlQwBqUDzEZIcxoQcxGSQN?=
 =?us-ascii?Q?AUFqoY9KwajGsviYzk7f4v5+ClgN+VVykbum6SjPtTd+vDgM+Ai4v1sVDuTg?=
 =?us-ascii?Q?KebbqdUWqRC5bzoIf+l+v2U60tpwY+F7OsXRNRuw/WYxtieTTW7MrlFaqld0?=
 =?us-ascii?Q?fN/nrfjV7G3FnkQtD488q3FtjlNgk10mLQOrYNI1Cbt+D85DzzoosIgxrekG?=
 =?us-ascii?Q?qlHt1l7b61JS6RtxOTjPsilWPKURLEDZ+HamiWzu0zrfYc/qRIWQbWlHTWIj?=
 =?us-ascii?Q?eVv8jMGgtKuTkGKeyC1NgUF5y8f0SpIM4RdGL3YesIq5l4zIL6T/SQBm3R2i?=
 =?us-ascii?Q?h+Guwj54yj6iTgYJcvSFYtvaMHWJX3/NlEoQSVV2rBhnLjALQMyUeJ7XV/QG?=
 =?us-ascii?Q?MBTXSPtO5j6d5IOm4Ze8F29XRLJurwV4oBrIesFiMUHeBgt/EQMbyo2tLl8+?=
 =?us-ascii?Q?M8tj1e32EACEG37L3L9aPZexXlPwM7DavbBOrETcfkqR91NoBE6KN+jIgE0b?=
 =?us-ascii?Q?b1fxP0xgNKBo4ekM1524niicH6XKZoNC/OjbpTj4dV1EQFZ8xyhFp0v67ONh?=
 =?us-ascii?Q?fqyQ06G6Kwo0NGbD0rI6+wW3o7f2c2/PSj/+bOm8qXr8YjaZTDB+Sfq4243z?=
 =?us-ascii?Q?Fz1JFE4Xfr1+Y8dJwbOmLnrSQ3d+jwQriB95vx34d+ObcUNIrrX6pjwTYUcn?=
 =?us-ascii?Q?FC1e84SrZ48meoqLunol/x6NmuDyUKou09+Vh9SBpm3pp3tnrJa5otTewc9+?=
 =?us-ascii?Q?K3tMsr5cQWr1UL6yGJENw2eL4sBTeP9tSBUR7LCRUjz7JeW3YuRzd4zfBhP6?=
 =?us-ascii?Q?W4Nzb6uK+/0DAmQikBHfJoe8NJUiFIpVrLsx3tAVu6QIoDAId2AEY/+qzVdS?=
 =?us-ascii?Q?unjM9AXyarqbczRahh1B4pAZTP8mQtZejhhLjim/A+dFSZbHs+EwyerZt1mx?=
 =?us-ascii?Q?v2XaFDMiHGqNRwWJzgQuZNqebqxFQNVfbM6CfK7SO+gYS9LwosvlzVlRDfAi?=
 =?us-ascii?Q?CTGxRakK10aPYRRqYOnrqS9Wy53lbWDrmu+ZK445/NG3AycMr1x6tnAXsRSP?=
 =?us-ascii?Q?EjJa0KJlgFVkKeuyiyA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:52:59.2483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe185099-25e2-4521-a098-08de1767d140
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34
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

