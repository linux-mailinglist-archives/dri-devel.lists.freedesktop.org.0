Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32741ADC07A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8978410E610;
	Tue, 17 Jun 2025 04:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lmDRBX6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D99210E649;
 Tue, 17 Jun 2025 04:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPZBvkG4cWCR4zIMHdMDGcLzdG/MK47GgFtne26TqFJjCR2i+UTCFBQY/i4eacSk8VXPoWi1+rHPiPfg7NN/HSbqvtOln/BS0ifB6i2PpQveaxzVhE5opgwM3RDxjuMNVIjY3Tl3IQKriaylbjSHLoKKHyq0egnz1ZHxyCE5D+4B3BSO0A/+jIZ0yYE61PpnCKz4Oef1sdW1LJjsvrqiv3IFs5lH50DxogIcQiH0Jn4eh4m+u7v5OyJL3ALzovhyVi80+rnIXnVmGTuw+xO8cKfBiLTN+F/GIcUZm1CJfgDbb3Gmwt0x3OvSIzZy9bUK+JZ8lvSul7Ntu2F2Ay3SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCFymb0Iix/CCquXPr4UtetFAUA4fOPzPsOCD449zfo=;
 b=xR/tdIy42V6Od7iWWMHZXE4/VNUXNbXn+Nl9DmB2xqjE/2rQQ+3/UoskSgAeI3ftYpewj1pA+n3kQnJkrrpvBNazCq88Dh1UNaJCSLwHxwX7UdJ5uUu4SBKZ5z9d6J/lhMJwB7y4eE9YmlNnU8IemrQB9RHDcGFFCDZWiLmOHQg5iMbf70jmVU14hXw58OAWSY6QXWH7V+oEL0nNsT20ne6PNBksYdBkhCMGuDZMLRCepXOejqVtujvSSFQ7oBCbIiKI3jvhw2gljI6fGbPCQU006QZSbGEeKvLm3ZlGRKu3ITTDucSNtfnr5HbidZskfv57DgE/q8ruv2VDQ36NXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCFymb0Iix/CCquXPr4UtetFAUA4fOPzPsOCD449zfo=;
 b=lmDRBX6fxexlS8P22K2hrUsIICKUkQQwkp3Jz5RcG011ouWUCEZuUtxghzHTfF3lnswAlATj6giPJhseH5TDenSp0r4LUGsM9qziEoEPcdaPiVQiVbM6MtDuS7ylwPKWGZdG1iXv0DQJ1uFMkyoVKYSdlw/8N7sFlnZbC9XZCLw=
Received: from CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:26:08 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::30) by CH2PR04CA0018.outlook.office365.com
 (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:26:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:26:08 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:26:01 -0500
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
 <arthurgrillo@riseup.net>
Subject: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Date: Mon, 16 Jun 2025 22:17:15 -0600
Message-ID: <20250617041746.2884343-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b1fc07-c273-4ddd-bcb0-08ddad571515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nCuOntXz8HjCb+Qum/le5VMr68h9YFtKPyaORR+xzoXOUIUAoRxFpNk9AO8Y?=
 =?us-ascii?Q?5SMwFFKEHsyJFdFNo0g7U7ZJZBvWSnwVK7C+rzEk+bWCY5nX80uYzj/U489k?=
 =?us-ascii?Q?qODtzx/ZxcFGNjPjCkSIyKM1TsmqJaALr5tRSM0q+0ojnFEdAoDRX1RDFKaN?=
 =?us-ascii?Q?i4yEldAg5UeixdgN/VQQrNZ+IPOA5e1i4OLahmVc6QG0FIgsydrg3tINzv0r?=
 =?us-ascii?Q?2V5fuN4A2A1GrzbRLzChR6H0x/6ost3MGXBCSaf6PrCiQ4g4Be8CV29eARZh?=
 =?us-ascii?Q?8PENkeJlgxmKCLtS4WKazzQL+21GozOi+m5pFT7nG5g/8OYyvjA1xo2M/4RW?=
 =?us-ascii?Q?0QAc7lObR1Uge116j56CYfjLpqKMqnoyEGwrPjT2ZaMHXHUUfBUAvBguEv7b?=
 =?us-ascii?Q?zIVA9feqvHiIJBZQxZUD4emEzGYax83bRy90EnYF9T9uAySFtbr6mrvT3Ror?=
 =?us-ascii?Q?bk2QfHfxBOUEIzgjn8mdOeIGlXSGmya3yqXIs5WGZscrmUoJ1QZ8CwhYlOfH?=
 =?us-ascii?Q?fiOm1ENd1N0FGnwF+1ZWGwlAMEwvT6HU7OK51v5WHXo35ZyIjObd6YOkIxn3?=
 =?us-ascii?Q?ULwt0QUqo78p5Dd27xI/GvoOqto6aAsC6r+ZJ9lVcs/oR48N7sQWIdqWsJ67?=
 =?us-ascii?Q?Ugq7SfD5ZYGeIpgRme1ExLA2lEf0EqnLLZ2jsA71vzPA6sTWS/Du+fN19oPF?=
 =?us-ascii?Q?bq0QWPUxnSn7oWsTwFmblNtMqRZRMdohN1GRcbASZX4YWSrzpCm30nBhDCbH?=
 =?us-ascii?Q?M5bmjb7Xg1tvQiS761BrakUj6nptoTkX4+rjWuSSXJhy8h1QvYtmlUlmNAc+?=
 =?us-ascii?Q?Ox/77fuuFiRUrj4+8YJSnmk7ddfEehWW8qBNQ+f/1F6NztwmijgXLUFfBLi/?=
 =?us-ascii?Q?4yjxW4wsgn3htfZ+rM1t/CWXkINulfoonfox08/wynfRUTomSJipikMdV3F7?=
 =?us-ascii?Q?xULxQ2xjEy3zTASZRdMdN4cH4dudcZDAZ5NnEggEncrMl6cfCy9xTacsaLo2?=
 =?us-ascii?Q?DDxWFEXyUkgB0QG67WlhP9zuasHJRPWIws8AytRZBin29x09pWudTc04qbUU?=
 =?us-ascii?Q?RTz0RDOrAUYWE5/qwo/EyuhOOJoEhZupdc3sA/MRZRBnIamLEZ1zQNRkUx97?=
 =?us-ascii?Q?FSaIPEAoQbVxyjjPaoW3nH1MZKU4KZWPJTBpzWGp7qNeiURRNpiHeIVL+7gB?=
 =?us-ascii?Q?ckxvdvtfS5JZhOCUYB3/QgrpaSJ609FPYcmxet2KxSrWFS+u9p6wXmmj7JG5?=
 =?us-ascii?Q?aoveEYN1fKd590q+98MjoxbuH7U0vLffdkGLEBbTBl2FQS2xVjMFVR0YYy2j?=
 =?us-ascii?Q?wpEXHiBAm3TXZ7EGHnEUIRbir6ZYUHPZmNlookY9hOgLrzCdqzQQoQtIP0Pk?=
 =?us-ascii?Q?8WgEecokJ+eqsojD2VUrFcpK2i17kYO8QMemXg9yDsiBveXKsrbPCfGZumk7?=
 =?us-ascii?Q?YEM65AFeIpOW7Pla6F0qPAvronw+nwichhCQo2xakg9A0Ji3IaEzzCMQtRDi?=
 =?us-ascii?Q?3Mzsf+uFtA1FE5VRnblDhESvEaUuzgSvI7AT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:26:08.3653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b1fc07-c273-4ddd-bcb0-08ddad571515
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571
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
V10:
 - Include drm_color_lut_32 from Intel to support 32BIT RGB in 1D & 3D
   LUTs (Uma Shankar)

 drivers/gpu/drm/drm_color_mgmt.c | 43 ++++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     | 13 ++++++++++
 include/uapi/drm/drm_mode.h      | 11 ++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..83dc850d3b54 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -630,3 +630,46 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 	return 0;
 }
 EXPORT_SYMBOL(drm_color_lut_check);
+
+/**
+ * drm_color_lut_32_check - check validity of extended lookup table
+ * @lut: property blob containing extended LUT to check
+ * @tests: bitmask of tests to run
+ *
+ * Helper to check whether a userspace-provided extended lookup table is valid and
+ * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
+ * the tests in &drm_color_lut_tests should be performed.
+ *
+ * Returns 0 on success, -EINVAL on failure.
+ */
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests)
+{
+	const struct drm_color_lut_32 *entry;
+	int i;
+
+	if (!lut || !tests)
+		return 0;
+
+	entry = lut->data;
+	for (i = 0; i < drm_color_lut_32_size(lut); i++) {
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
+EXPORT_SYMBOL(drm_color_lut_32_check);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index ed81741036d7..882253a82bf1 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -72,6 +72,18 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_lut_32_size - calculate the number of entries in the extended LUT
+ * @blob: blob containing the LUT
+ *
+ * Returns:
+ * The number of entries in the color LUT stored in @blob.
+ */
+static inline int drm_color_lut_32_size(const struct drm_property_blob *blob)
+{
+	return blob->length / sizeof(struct drm_color_lut_32);
+}
+
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -118,4 +130,5 @@ enum drm_color_lut_tests {
 };
 
 int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
+int drm_color_lut_32_check(const struct drm_property_blob *lut, u32 tests);
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 651bdf48b766..21bd96f437e0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -872,6 +872,16 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+struct drm_color_lut_32 {
+	/*
+	 * Similar to drm_color_lut but for high precision LUTs
+	 */
+	__u32 red;
+	__u32 green;
+	__u32 blue;
+	__u32 reserved;
+};
+
 /**
  * enum drm_colorop_type - Type of color operation
  *
@@ -879,6 +889,7 @@ struct drm_color_lut {
  * and defines a different set of properties. This enum defines all types and
  * gives a high-level description.
  */
+
 enum drm_colorop_type {
 	/**
 	 * @DRM_COLOROP_1D_CURVE:
-- 
2.43.0

