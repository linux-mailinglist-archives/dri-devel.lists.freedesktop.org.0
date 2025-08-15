Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB1B27770
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D27510E94A;
	Fri, 15 Aug 2025 03:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qu+pRA6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A2C10E94A;
 Fri, 15 Aug 2025 03:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hd/qyMWmQ79oF/DZEwg/moFdHM/dzihyKh3+/wDKOyc3DMIDSUPvYzXP4vf01A7bNgss0OvRAUhI+3i7Oed8UeGDoUq7F1cgfkc9Qx+EhgyA/pJpeSHnRVeWNQDTeQISX3aWIU5DJaTR8+j7kiThV1Z+WWqqVLAFYSptLdBoU5Hu1SsWzBCG4lRaBlNLdgO2SD5J5yYdZsI/N9hmKouAA0rA/fNN9rrPqrS2+24YQ0tJ9n6OiFMy3RpF0KSNvAFX59h/1MshtFEBC+jnc9+YyNELzBzl+Ai7y2P1Mwy51OlMgrAvYG+5W79cacMmZLC05E7ZV42H0zRS4RLjs5ew0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nZqVevnxgeNmzy4BhpZqkowEYrBPMfAU6v9MF3CGQc=;
 b=CfmmXsvRTb2wbsO0AVmLA3w9qIZI6H7R7Gj3SVVm7oup3IWrubuGJMIp9VYgkpCNB06IU4TMoh+kaDzFerW631b9p2rPsOtVoGquuQwtGl9vl2wv8d+V1nwCP11Vjx7dPmx4Tc9nmB+ji8XepZCTN0l4bO4un3fNcHL81bLyjzyjZF5m4rnLlKJupYzc6CNtYXyDWwDed21kIimZpIsQlbALKYtwrD+g7q7SE5TdNSSbergmY9pUwnDNw06ZZzVQ3tfPbpDc/9cdsv4UMxGRqeknbQ88PRib6r5PEYX1OQrJBD0+PFc0PZgB9hfKNyZfI1gMIxa8ve3Zh7lFMomUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nZqVevnxgeNmzy4BhpZqkowEYrBPMfAU6v9MF3CGQc=;
 b=Qu+pRA6EVbjRC3njdeO/hh64i5l86++5a/LQ0HEkx2J/4isOoOKlDDAV5JLjfY6cmi1Beee5gVehJUZU2yO93Di2V+F3SPOuSTp9MmelpxUKv+rc9bMt95d5SKW72mQ+uYsdLdTn7iOVEXH9qk44LuBMt/swUaBoIdulJ86i7Lk=
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 03:58:38 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::83) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Fri,
 15 Aug 2025 03:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:58:37 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:58:34 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 29/47] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Thu, 14 Aug 2025 21:50:18 -0600
Message-ID: <20250815035047.3319284-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CY5PR12MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa27a57-905b-4866-d02b-08dddbb00390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pin/0p461lLgm/xIWrUdBJdw0T3ZIDcp98A1K+klHFbaQ+RnupJb8WkGuvC8?=
 =?us-ascii?Q?RJ7gelNr2Tmqc0p8Ut7vnumhFOOPu5N2PvRXDYaPw5lLfbsGendxyEYKilTi?=
 =?us-ascii?Q?lQ7jV3/qyvPSf6ZtBIWMlBj7CbrjBqIKjM1/O6sufMHKEJ2/Ff0933YBilVy?=
 =?us-ascii?Q?qwzMH6Y2GRB8hMkJRgc7QLUmerRgU/+oD002TRWeij5yoRKC5BFCH1C80YRw?=
 =?us-ascii?Q?/rHuPBgg4sn0MccYTkaPWy7aWTFwNRjE7Hq18N/pQaU98RfyctXBNdWUIl15?=
 =?us-ascii?Q?IbleAchp+P9STiXNEZfY4hAdkeJDu+DW1rX8Ic337/jT7rW2DVBrptRXtcO5?=
 =?us-ascii?Q?2O+FQQyRjSlJ5SDcbtNoxUusyBsOxF78W6/QdQHYBm3UNko7GTxq+w3QZ2PE?=
 =?us-ascii?Q?RDBAdLJsJY5PtckJ/+pAoGRZfP8QsWvzRngNyCNOwWPP3a9Ax4+AKD4UE1Fw?=
 =?us-ascii?Q?rdPTHAkIjuKGulg6V7z9IuTvMnbgdtpQK22h0wKXVNZ9eDdQaAVJwYew7lQe?=
 =?us-ascii?Q?WVz/aTqEdBKH61IMDmq/oFM5iKziILlJenCkZdY1KH8+X88/BSPCC5HRuHQt?=
 =?us-ascii?Q?A8eqbjKz14PriOS+4oUY0QWaQ+di81ySLc3rZTIyiXbjg0pCS00DWrJvztb4?=
 =?us-ascii?Q?oLseOcqMYOpsVhJ+KnSXcyHEUB1qhV+KA7e8AFPqDe4FL7DR7ZDroNGop+C/?=
 =?us-ascii?Q?2YYumGQpXjnutbE8IBpR/mMZch3cWtI4a5Sn6bL357Q3tQ4cXWkos/J4QwRS?=
 =?us-ascii?Q?KPftzaVTu5w/R9/qjOf+dhFEDzrsdO8qjy84YD6aYEmSUlE+CtnhwD1WTj1T?=
 =?us-ascii?Q?Huf9P1qI+XBKBlgV//H4eKEFepKMlUKq3BPhx5M8oLDeT0QUiryYMlbI3zaN?=
 =?us-ascii?Q?d9WQY6iA3WWfziFZ0/nheh04AciH2Q9BleXiQ640YpkwRvfTzPy47hvTkkdV?=
 =?us-ascii?Q?qFURchWmBIe0JsOGJ9nKiqclRBpqK784MjT9xpdl6lWdh/jGG9/FaIRdONW0?=
 =?us-ascii?Q?VDcEHNefdXl9ZGzCSJosrTcGAFvxWXwJwShcFRY3vJ5Rgmlm4tevTXioahRy?=
 =?us-ascii?Q?s/MUtC+24KDsLUADYakUoKTd/62Rs4x2x4pZVs2NOpdrtqhRdtGXy+dYmSjK?=
 =?us-ascii?Q?p2E2cB/ryaRd17W+iih9RJ99jlOssdxyex49B3G4K6U2AiAst4f34PEyi8V1?=
 =?us-ascii?Q?0jYMrI2vIhNTKDaYM+F5CvzzwUcprJ6opkGABm08mWLtdZl6NFyxe7GGSPC+?=
 =?us-ascii?Q?Eio24oTK0jXDNKI9N1cSehRG9jPbxBe1UDDT7RXpr3wz/NcsWXp8rvNeUGNI?=
 =?us-ascii?Q?+ls82Wk4c1nwVwJgG0zF/zcLOdBcYGCbMYWFjUqMgyw5RZLXQuZHllxHv1TJ?=
 =?us-ascii?Q?vlqrfydSMqQeXlUuP/BYsW6JPwl0Rku2Bplcwm1mh1qtR644nE1N+Ev2GkhW?=
 =?us-ascii?Q?bH5GFocZ1NGQrzRvzwcUw6Ot4i+IyyJ+A8gNAwYc9Zrw0EgvdHSnJd90qbSg?=
 =?us-ascii?Q?1MY+HFDl4S/zTFLk1dXMUBc4tn6QRtnhsN0g?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:58:37.6602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa27a57-905b-4866-d02b-08dddbb00390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 2d66b9a234ab..5bb45963fa1f 100644
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
index 6e810cb3f8bf..a38c90f61dc6 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,30 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * enum string "PQ 125 EOTF"
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * enum string "PQ 125 Inverse EOTF"
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

