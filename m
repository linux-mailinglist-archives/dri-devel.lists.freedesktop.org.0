Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945BB27778
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFC610EAD4;
	Fri, 15 Aug 2025 03:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VT11ixeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99EC10EABC;
 Fri, 15 Aug 2025 03:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE0iGxl+S8/nfxn/L+qjS1gZ9p/HpJrCkapl1q6Pn/xfasSL00LcRI1niHVa4VjoObuz2WRZkdGKPAq1eK+L9vtlzp7iljLKpLKkDpJmO+00lK+MPD8l1v6p+UliGZ+gVRe+A5YcZpmbh1E9BhGE81CfFeVzXf4IWBYiCPEO0438+O1IVKl6zLC0V3HsTJWO7MTEE+UP5E+Ff3SEHYi3kuJI0zRerA/XXxS+mRS2sSwuj/Fgn3RGFFpcGF7oryHWt5GspgirQtI6Fu3iSeZfybTFwHOsAZQBrlo/csuAu8POWxhKY/rcJ0QXRBZZ3+WqSSRn4RHU2qNpl55cvkI1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsbux+7KTfBtmvk3NhHOyAonrwS49rKHeauXwp8rMRE=;
 b=VnL5gnJNFyRaBcl0DAAWQLBx/DDcS7/dRA3aycGtmWiQ3NcybtjqMsCoML9e7v64TrkAkc4VujhOG8W1z7Wjhlu7g4YcTtV89vw8LAY1qtwHnlUP2+arAcICFQ1T5szibTj1vydbppOYkTHFAK+5Z4E6FZjQF4kxhvsX7zOqLaSV285kKSfmfs0IxFdkUVwlOnteE4/OgB+kF7WCWHSm10BqlzSapWlzfff9CZCDeATbVjvxIlPj8BxA1+JzEB2vCiDrmKsEjy2Urj6M0HXTOYsdKZJFQTexAzxpsKGGDANf8VXcr3kLRa3S8Ll1SigVeL080Bx/iMCOUoANRAl4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsbux+7KTfBtmvk3NhHOyAonrwS49rKHeauXwp8rMRE=;
 b=VT11ixeJfxfAFbA7N/TB16R8GORr8OP2Wq2nEjZLkUONsbgGZIlMupqneMl9vUNu2M+khs3GJWwtQPqGzbaktsl4YHSXHXbNytWTYSzr/A00dW8s9b2m7FMnMseMdJsznwuEiP8WKyW7C2rnRETDFqpXuKClRpVMdoHQUuJ1zdA=
Received: from BL1P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::7)
 by IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:59:35 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::c5) by BL1P221CA0042.outlook.office365.com
 (2603:10b6:208:5b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:59:35 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:59:32 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>
Subject: [PATCH V11 33/47] drm: Add Enhanced LUT precision structure
Date: Thu, 14 Aug 2025 21:50:22 -0600
Message-ID: <20250815035047.3319284-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|IA1PR12MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e00ef5-f697-4505-2baa-08dddbb025f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PpIyyJnfvuJsubrNsH3sCuA8zKGAxAwmMEVXbMmjRZZpZ6NqdCeTr2jenMfi?=
 =?us-ascii?Q?DNBlS+QCQVbMWOZuR9kS2wmEwxViFt6bbHqAqObJgUt+kTcvS/npEJ2ZfFSc?=
 =?us-ascii?Q?N30GabUIJOCJdVokgNFfHSh+dr0h+5XHhQx70omk0VvZ4M48qWqR+D2eJIOd?=
 =?us-ascii?Q?VtbmmrfJdYH5sTDOKnZxDUxQSnkqhbQI3Ly6gzp7IBOncMym8+3XB9YYWHWp?=
 =?us-ascii?Q?vHUXzzepiu8BuWdWPQXHlhOG6b9sGMMgFol7zYakdiCL9+ob36B6QpB8jsSm?=
 =?us-ascii?Q?bK6ZwI6RykBOWdOVm0/LOx9Fw9SBmD+lOgQQpeAXBfqmbgj535RccEmhwfSi?=
 =?us-ascii?Q?rXF5RY/VMr/9H1d3N1GPSwRTjZjkXcIcZyMgKAQucy7B37UJed5vE0V4tbjG?=
 =?us-ascii?Q?7MmQFWedXz18K49oBUsyE5jFrM0DYUM4G4uQkF+/cumEh9at47faQFpjyBgV?=
 =?us-ascii?Q?cj/8PPH/VoqlkbCngIulPhqTiRl0nR4PaHqpXg2Cb4m9pbJ9lPAD0s/hLXgb?=
 =?us-ascii?Q?bykHvEl/T0kCcQ6+LRY+q7V5pcFSs37nkwicCn3vHoItsP5JTQps/kADSc3P?=
 =?us-ascii?Q?Xe4HxMBH2IGmeHw30l5zIVls3HcRKUOh0/un+ZidOGCEshMg2KxjRuPyPWjT?=
 =?us-ascii?Q?oJldYHN0iDaL+sJecq7p5UYkNIYDSs2nR25UZW5fOEmQLHUb6tiCUsVKsmqs?=
 =?us-ascii?Q?nMKHxwxgxHFAJpn3tKWPfUNlsgsYRqT/SBttVRqR8Kj47oFZZrH6ALAUIu7V?=
 =?us-ascii?Q?ggiJ/M/408WS+5xA/G9ir5dUS6bWDr6MZx6NEacjokNJM4vrKg6bsK4MJLcr?=
 =?us-ascii?Q?rrKqcojH7/e9Mp6rCSH+gQ03lrTiU7R7zOgvP+Wr2SiQD5oREEbSOb4KAjHz?=
 =?us-ascii?Q?WMhiCJOW0rIqB8a45h6Rf/tB4rjPqUwdP4d/iuYrPzDdDsvbIAkwJ0fCuVXQ?=
 =?us-ascii?Q?WLUdqj+yHg0R3HsJ+dr0QicVkCKbt8L/MilDnvHOP212A//T/6GjCZPROXVG?=
 =?us-ascii?Q?VYw5hwZNM2R7piHQWtm2UQ6mfmSWgNJ5ek5WaecXGecClWLmN8LrDz3j8VOi?=
 =?us-ascii?Q?w0bfXz6ls+FjMdBjyy5p2p9EcRpuHaTfNJ4OrGakecvg52Apro51hn7TScIO?=
 =?us-ascii?Q?wNehlI41loK3zWhPEO+4jUB9W3A5YR/5OT9yDweOfVLIVjK1Lq97mj4ekG8t?=
 =?us-ascii?Q?6lwPMPWotJIXnL9qZXAlUfpdzvI81qBb/sIK9q/VDDwso+w/ciA5OCIOzlgU?=
 =?us-ascii?Q?m103soGwfJ9riKY8HHvrwCvg3PBYqFbFocYB0j8PSgNtxAx840kUPMSSBer5?=
 =?us-ascii?Q?rZfrOawa4G0v5FB+oxJe0HtoBLmt6f7A4Ah9EP5Fs1vu8WKhFShgb35jk7YC?=
 =?us-ascii?Q?Czgj9QJ8ncD6sPySkWkgY/l9Q0vfkJcAiQNTxAmRwf5qYy4piCZxT5Ekmp9K?=
 =?us-ascii?Q?KOHxqu5te6cAsGStMOSJT8DhwX7oRm3wMbOfohtocZm/M6cCEDbSJ2G+buRp?=
 =?us-ascii?Q?iqs/oNs3NrOxcW/3DF0phYScGnkNjFt5P19A?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:59:35.3553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e00ef5-f697-4505-2baa-08dddbb025f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520
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
index 37a3270bc3c2..9c469f7fe0df 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -840,3 +840,46 @@ void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_pa
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
index 6cb577f6dba6..c422f352a150 100644
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
@@ -145,4 +157,5 @@ void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *
 
 void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
 
+int drm_color_lut32_check(const struct drm_property_blob *lut, u32 tests);
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index f309d2863180..bcc4e9845881 100644
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

