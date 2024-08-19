Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF895761F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F89510E3D2;
	Mon, 19 Aug 2024 20:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QpEvCTex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7235810E3D0;
 Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOE5sS2YwEh4R4xI76RkQy9zXDrm5A8Pk7hAEwNm1L+X+NGtZxeSFbbwjknLnFpSi0FNPDrXAQ3PKgCdN9Gh256xXeHoOrYVcQKJRLJGQEncbv5MbEQVMWjj92pgVcWOiLU+OlJ/opnWWqKggbrF8xjk92ZSWrIp+w6AILFtceQYkClkq7fCLSBGSwutZ6lt9jYNpybRmAPrgn6ycED12z/j8q6pzi+lSHYLkd7i2Rsk6PNAh53Eiw5ZTi4QbFwIGQ3GDfmBzSd89hOGBaU9O04wIv3iNy+1o8RhKiwBS9D5YAAxMFJihgDZnhvBZ1JdpE5bhTq6CzMHNbEQZqi9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmWAM8oaaqnw6O0O8IJXiUla8icNPtv6FEqzaJoxGHc=;
 b=qeLuFD64aA7rlve4GJ+enypYMxh8MPHvBZAF2AKRgFdH+xJU/UCgiQsCojR5yLMa/yGacN1NAFedvrybD3SK9FRGq2woMgE6spcqE7AEPEeSg36eR/wJNx/+KOYZIujqw8rZZOvNXM8QWvc6tKsfB4RqpKsz0YhRtJh6a85HjXrec/ovzgvV42UVB4TQq9STr7q0lSIlnlG1lTijLwk3oTzWKgOTIgZj7fWrUORHP0qC1f4NWCHCKgR0mXF+uEbrJuAs0Smp7+ZfwGKLP4dlPD+xgYctiKcfVjMP59kuIBNxGCb+LW7l5KjdndKz1Y1JmqoM60SJjw9Ple+M2CpQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmWAM8oaaqnw6O0O8IJXiUla8icNPtv6FEqzaJoxGHc=;
 b=QpEvCTexMuiVwi+vi2un42I9KK09+s71VSyBgumD/UPOcXXtz2qgahb+iAAnlJJaazmgsVDWPGOoTXVVST5Q5glRaUhsYbsjdjgm+Mg4DiURN3E9Jv2vajksv8j98EsRXaZVUTLjA4T1WuXc7s8n6QzNfQA2LnIJQJieo87WLaI=
Received: from BN9PR03CA0512.namprd03.prod.outlook.com (2603:10b6:408:131::7)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:40 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::14) by BN9PR03CA0512.outlook.office365.com
 (2603:10b6:408:131::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 30/44] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Mon, 19 Aug 2024 16:56:57 -0400
Message-ID: <20240819205714.316380-31-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a71480-823b-4e29-6a39-08dcc0918ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gDcb4hJhNzWSi8eQmkLsa7fQCiyYeFWuvvQkG+6T2ZgezYvCXzppklIM9Wr0?=
 =?us-ascii?Q?nsTkAgraWL8b/pqKjuX0fMXzv2b8He+yzzBkRwLj9plVapwahkHzcJjwdlBt?=
 =?us-ascii?Q?WILzqRKuDCK5ieEFeDNojW7AV+TpdgQpYXkcOHg/OzYSIHmnYJxALFZcpFg+?=
 =?us-ascii?Q?SJrSfyVc0fE+43aaIdJln/d8RfPyAuXzvo4LW5vIRQIbA9J+kpoHoGfSLuF/?=
 =?us-ascii?Q?GFUryrOcyex6ohCirtnKEX+xdwycYUF8+fdjecb3AiYnpkKkv/oiyppD9Vfz?=
 =?us-ascii?Q?tUbFeMhPOXc8plRmaTQh0dOo4zDaKoXnximwGKFnRokMGAy1JEeZ/fdtkhVp?=
 =?us-ascii?Q?k/5VXriQ4+UwFtLiRQ8K/5IB01B23JZqtrAjqa/m0TlJ4zvYWb+GjgEGBLRt?=
 =?us-ascii?Q?cpBaBCqqgJ0YroPIUpnIKNAknUne7V6vE+mDZagVGiP9UN6fzqkvxbSk1Pj8?=
 =?us-ascii?Q?6rLgWU2WLmrhh2pi0ivPDrWYE6zxjzaUrGE3evOidPmxywoqFM9wlZAZpc8y?=
 =?us-ascii?Q?DLialg1Ax68aI3Uqwo61Ali5RnoKbtLJ786uIJSeasqgxQ6HW6z25DdjlzvT?=
 =?us-ascii?Q?ss6z8oIZV9p6U4gnKuSiDPN63ybMIyrNml6tXotZ2h2gY4XsKloUcSv+De5r?=
 =?us-ascii?Q?kqZgVQ4l1XMeNLMG2Dvw3YedU1V6tImKSZNkSrQA0WBryIbh1stupOuBVTpI?=
 =?us-ascii?Q?uF6YwgM+LBIM4++Up+n17cOSbqhzpPT+POQK9dNN5VRZCyWFYVBFVFCOH3gi?=
 =?us-ascii?Q?qnaks7UUCpU7pXyoTZWHzB/WQuz0Kr2Lf6C+p65WAHL4WrA0CWHAn3zPpvLl?=
 =?us-ascii?Q?TW0fsEsCtGG8vAZtX7BJJhFB5qqgp+LeWYcyYIOEcK5G5qoZBAS6E0BiwSwU?=
 =?us-ascii?Q?dPUGcEfNBVAoHhrr9GY1ueX14wZFxbx2wcHO4BLnEjuHNYia4RMofRsYw7DJ?=
 =?us-ascii?Q?y8jBUgO/d7rIBIYOleNlz/JZt85iqsT+bIJQeqhxi7JeJUmAvMkYjSLLU4BA?=
 =?us-ascii?Q?D+3vjxXR9ONgiXat5KJa9duXkf02F+zF8oMe48cjGcwIvovmRohln31mITFQ?=
 =?us-ascii?Q?qFPtGqZc8+z1+zhFAxCtmIX730zVLWbO6vbqV4noHLHN9Oy3dWcsnPjvlkw7?=
 =?us-ascii?Q?UekxzTQXN9JEnAAVk5prMJ7Dt/bZV4tjPR9CTZ91dHWTdzQSUXFgGZK86GqG?=
 =?us-ascii?Q?uh8IM7Pk7KbtOQWAtDgiUGPwfh9VkySGl6IuDbI2nfAKwv+RkmI8MPr9PxvM?=
 =?us-ascii?Q?zkBOuqlxbyRsf4R0g6GS+19/62jpLZO+kOzmhmTZRZQE5wJPy0NcFeRgCjEp?=
 =?us-ascii?Q?dpoJmdZybOQNVpmQWiM9Lh1/j0Ov/rPpnxntCJ/ksGkw9kzE5XXdcV8a9cWh?=
 =?us-ascii?Q?Sep32sGCJvpPUZv7exz5d2Oii21eNFVHGAS6EWE5InfdFLfr0ExqBb9/rroK?=
 =?us-ascii?Q?dsmPjRN/G+DlPJGFTjNI8HmFcTUesSGM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:39.6871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a71480-823b-4e29-6a39-08dcc0918ff3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 73fd4b7a4ce3..f9dcc522c94d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -69,6 +69,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1566d88fd018..d953d16c32f7 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -35,7 +35,6 @@
  * enum drm_colorop_curve_1d_type - type of 1D curve
  *
  * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
- *
  */
 enum drm_colorop_curve_1d_type {
 	/**
@@ -55,6 +54,26 @@ enum drm_colorop_curve_1d_type {
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
2.46.0

