Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ACD9F8B85
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09810EEC4;
	Fri, 20 Dec 2024 04:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k3l22pAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28CC10EEBD;
 Fri, 20 Dec 2024 04:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDeAo5jt4lxDNPEpSAO4IWhAaORth6RBWEsRAmjlkIvKi6Qw/WoCjJAEXfGMwUNdC3CYFBqwv4UuWDP9IP1CcPrrfd8HBPDtR/2jslIrreLEmuLqPapSXqELV9igIYroG853Mr0AmXRIEZfdmU/mLHJOLL+98oc4Nszp/ZLy2ncLHHWRzikJVp1Hi2uYmOq8eIkeOIP94ycQwsFKESBLpQICUhXpZ8fz1kGKqUDTV2n7Fd1cNhLYF4neD/jru8XSnj87CtUvfD+vHnwugTQp2msnalSvPKAii78rHNcelXjCnvGDdaBbTYryfF3GW1xwndBBJOYCxHXQCYuhGpAXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsBfc5XmsUnasWx39c7OIHeBL/z3yUqz/7BDF133iFs=;
 b=AfIgiS7pKHobK7uEbX0Jw3JVYEoim9FXY4ddPEGXjxHC0/DmObvF9OPD2qEOXmID/y+Xye5Nw4dqld8I3OMNVcHfAx0Ecm56PNXQmQHGnln/LE8urXGnu7CX0JS92l38UalCIFuHoqZnt0nV9Z6vIJpActIXc8FL1U26kG0Guys4RkZvsPMhKYRNWaWdK/jIVkbuYEU6EzheC3/k2ftkeYEcx2tLp4r43mdxtSw4lKY3eWAWwbisfoaIkPOCJUBYC1pqUBrbnIWuKemFLJB2UDnuuVdOUjX2kUZF8MIrXwlwaHEjt/qnY3TnXdDNaJ4IKs3wNMNAQnG2ZZJtR9xbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsBfc5XmsUnasWx39c7OIHeBL/z3yUqz/7BDF133iFs=;
 b=k3l22pAr2O4nnbP+QfErN7YZiv/svoZ32rKTqFOPnjy0YMNmFfLi6WTnQL+MyuSLr+eqTr+Z7/43dWtUAaWFl92XEz7XEN8Ld7DhdpP//O74kuoWPvw0bclaMiLEbJjyK7iHcXk7iBMGlaOjO6F9SCYrbHWFSSBjDFzL7a4fIPA=
Received: from SA1P222CA0135.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::13)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:42:54 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::f2) by SA1P222CA0135.outlook.office365.com
 (2603:10b6:806:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:42:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:42:50 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 29/45] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Thu, 19 Dec 2024 21:33:35 -0700
Message-ID: <20241220043410.416867-30-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ba62c8-62e3-4df6-9448-08dd20b0c464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qZ/A9A/Dhz2QJF85mmy8b8NEpvoYtedQvx0pPdmPzHF/eaSHBR0LBNXZW0Ov?=
 =?us-ascii?Q?nXxVr0x+tl3UMEwwtfVrIxPDyYFOsgix1hq3PkihItWQT+oY4DacBWzHCsqW?=
 =?us-ascii?Q?41T9x2BICJmv1r21UJvO2vw4Fk9NzDrxl8i0CLcx+/cB7VxWQ0nZg5fQpXXW?=
 =?us-ascii?Q?VyDDBqv5ANkCVkvL7XfQgAtMsk6cxtEbpL8AhKP3frtSFo7LfIM4sz9SseKM?=
 =?us-ascii?Q?8JuJ3r+vSqjElIpcyU8TfygqE42N6BtHzRGT3YBjqWPA8vZ7K8RqHFOXCk2l?=
 =?us-ascii?Q?W+Qpr+wet3KQeju685yXg5Qhmtxw0O0Mjryzo4StPlUrMUqgx/gjiwQsP/km?=
 =?us-ascii?Q?wII09dZymxt9s+9TMy7gr3WgQdjTfK6Yi95MhxgLRq3cq1CvZUAhL9cSnuh1?=
 =?us-ascii?Q?Y8dpRguqGGBUjmDUOzONGB8+kgq1b0rdaFnlgPu79EzaecpU/ZDxuYbkhKQt?=
 =?us-ascii?Q?RxiI2Uix7pSWzK2VPHG/Vio10vN2R/VgjAa1TIvqZvqFYbv3267Fpr/4/d8V?=
 =?us-ascii?Q?jgjTnCmqOIvi6DA9YMvfK/bgSk8Bk1arC7pa7TOheV92W7ql4o5aYVOyaBrk?=
 =?us-ascii?Q?bilpLf1MrvWYdFociD494i/uympLfJwSOiYWsOBdDEYM8uoD6mmzlWbVwaSQ?=
 =?us-ascii?Q?qhzjGWS6rKoeUsTyzjdTsrNCpHa41wEORREdc0IrzD4GUT4jxEfkddRAjpkw?=
 =?us-ascii?Q?tCWGKikteM3XmFIAO3poqbyW4mCfSFa0nTBzny2BboHY3lcbSGD2AmV2nofv?=
 =?us-ascii?Q?sdy+ieXoKVkg16aaWR6qMc9H46+G9fWABtbSOHnA5BxAKHwznLwl4PYToVCj?=
 =?us-ascii?Q?DlczP6UVlc1iCG5v/2KENcmMHMngKMDkng4q/q0m49WAvoKCUzvcLZU1Fs5u?=
 =?us-ascii?Q?wchnjV+W4BQjjhVat8LjRV309raMGR6G0IAhU3A6qAvToXJyzZJLYLWei9/o?=
 =?us-ascii?Q?XC1e51Mn2+PLj8BnorC+uNGM0s4LILt9ULYxKMkK232dX+iHv1AqpgS++kKY?=
 =?us-ascii?Q?chyoTZcWU4+vKyic6Y3dLrfZBhLEgi+vRx9zZQSf0v5hsEyfepoxrb1J8Cpq?=
 =?us-ascii?Q?fDefi94/l+EHGL6rL72Uxt+na4NMX9kEaYNmWdcUqXtb8RWjLlOXlwj4BWzv?=
 =?us-ascii?Q?3xvf7GcP0t9//ArT4TwqIf05W1au0gRCI4CfE+NUcWrOuXJmlF/AXakIqW6O?=
 =?us-ascii?Q?ltopAZMMt0xT5hBlnzLPFiAOv0ICtl90DG/zFfq2OpdMvePNIqf5eKoArcbr?=
 =?us-ascii?Q?pRlF0yFjuMEqqek5XfbYimNdTfV1+PuFiKqSOx9mNZbd97ASwDSmh+BsfbHZ?=
 =?us-ascii?Q?XUyF64tkKUDybTyxvRS1L9p/aQetyfPFT2iXlCnM+dtr+p+iQ8LLIzeaU/3j?=
 =?us-ascii?Q?msjwrrZealrF+9Dkbtoy8FdLUAcXtY3lYaUm+34nuQCSXGtD5okuurPMzGM8?=
 =?us-ascii?Q?WC/1aO8Buz+nZMFKbisYS1dvCQY2XaTq/WBVk/xfc9IzBnydLC6z3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:42:53.6956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ba62c8-62e3-4df6-9448-08dd20b0c464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
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

From: Harry Wentland <harry.wentland@amd.com>

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7d4b29c0a0cc..f3391602a577 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e9f5c1adc2fe..4084a7438032 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -36,7 +36,6 @@
  * enum drm_colorop_curve_1d_type - type of 1D curve
  *
  * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
- *
  */
 enum drm_colorop_curve_1d_type {
 	/**
@@ -56,6 +55,26 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system.
+	 * Equivalent to H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

