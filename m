Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C198F7AA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3610E954;
	Thu,  3 Oct 2024 20:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ocoqr9FH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1FF10E944;
 Thu,  3 Oct 2024 20:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0fg+qKXV4zP7pZKH3a18MEiYUEaA7um0g16ZFO/OU7HMUy0EOKzXoVC5o3NPRIx6YquBLvDX5EPGKAhrhCc2L8jL7BEyK1359Zke1ZDK7Dnw62d0FyPR9aCJIt7gRBLYVWXqtW9Ej1F138a3o9JqVR79oPCbVsKgeLQRSRdZHkga1Uu046lUKBVghGJHkzqaq23PohzBnUol362wpJklziYnU2RS+XtDPyQCLaGSRrJQ0FYZdUmnjhvytq4tCMVzUTsmnRKB7kHjcSsvbKqinqe6anlVuXr/IhlFA5HcpcW7knABIrltjaGFtQWnpneLCCbBVWY2J3Y6J6t5nTbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE2SiLTWrvFR/Pfag2/eKIdWyTgjnL7nmAmZm/nA/iE=;
 b=tEIIfPrQixMAxEcIMtQLzZ59oqAhSyJmeJLf4NALz3WGxCmaEQOa5eweEePX4tOe0CxVd6CSZmTtT5+BgrzH4k2N5wyks62le3qi5NTMBIyUPnJma3W69sccMCObHPwmhUkreSyu9xUG0nuUzpTQMWAJVdczYggZ0L82wwueBpTU6wuZlrqowBOf36Na1bKbVAaMtxxqfxr24+H1EBJvuXYrd720QmudKKCPmqTW1mn0D2zOP0xuD2XEsgCL/mW7VZhNREh6oLAqEWGuTCUo90tsfz/T8zpke/TLr9RuZLucQlwuiTWPnptSwISzId8THMYrXfGej4ziod4GFZ+foQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE2SiLTWrvFR/Pfag2/eKIdWyTgjnL7nmAmZm/nA/iE=;
 b=ocoqr9FHxZG3Qrjb2OJhFy07ksPyUWtsVlnhriGSQ+2G8Vov6CQTsgQ+zK+3mQ1/qu3v3A/voH7fkJi1vb848G/97UCpMc9BnUC8b+LwPf4DInPibTKuD5ZdhLeow25Vgrykj70y+QZo9KNlyi0BFIKFxstZcLdreSYeWfo350I=
Received: from DM6PR04CA0024.namprd04.prod.outlook.com (2603:10b6:5:334::29)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:51 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::81) by DM6PR04CA0024.outlook.office365.com
 (2603:10b6:5:334::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:50 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:50 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 30/44] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Thu, 3 Oct 2024 16:01:12 -0400
Message-ID: <20241003200129.1732122-31-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af3e84f-cad4-4cfa-52d9-08dce3e638d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eVw5BsRKWOkwVTVNswwdityfV+Ta42b2Ihuv3QV31Yu5XQwFQ+3P4YyKxvFq?=
 =?us-ascii?Q?tqVi2WblWFFWa6eBNMW1/ZGPEih81zXTVTbj/9dD4zdFdgxSQrw9EYNwnwRY?=
 =?us-ascii?Q?ln0spG2P348tEy+Q5wjhU6anrU0wRYLH0uZEJOOPJ0ux8tDIJ06bqXORIkt4?=
 =?us-ascii?Q?VeS8txHx86laI/eo+v/5ZMUFhDmNDDYWEEWVT3HtlOsiuzpt8GlbTSlAIRYE?=
 =?us-ascii?Q?qQ1ZnZDS6RzCysMi7199fj65DRPYkCQUmi9vvbsOXlOZxMDZfizi3fssUWlP?=
 =?us-ascii?Q?ukvQ7lbh3awjLxmJLt0Y3AjuOutXUlrTeIhpYLs0+G72ClAr64S8TyBns+Ks?=
 =?us-ascii?Q?LbsLSddwwTTTU+ik30H8tZwVEJ6f6jZbCFwb+rS5kdfrPbrlrcSmOpsApwWF?=
 =?us-ascii?Q?cCyY7RKP/SEdf06Pbz9agdAl7+KQovb8HCEmrgmHXdnIKCaoe9EG3nsN1Dpb?=
 =?us-ascii?Q?awGr/0gkNzrE2eGDpQ3FRH4/0sIHOqPRv8wmkCkoIig2cPPMLqeQo8FdlHTe?=
 =?us-ascii?Q?n0CIh4+SMuPAa8mLf/Omy187tBa2FCA/NQNyNqK0fgGW/e3KpmNKyBdOt9Dc?=
 =?us-ascii?Q?ZksPBYTQA4OP8Wyla4cWm5x6zgubBynki1Zuy6jtdRp7eOBz/kv28c6wcfQX?=
 =?us-ascii?Q?CEArfipIdlgr/HR3jR7tBUpc77PB3u1Y36MVCWDrGtRsrjB4YHINEbD+qXNd?=
 =?us-ascii?Q?EDeTRxUIgm6ARNt6l+yEjZrf1lF5wsf9aQfsjLazd2RPAWUd2RBvxHAe2g54?=
 =?us-ascii?Q?lobQqtTsIUe8roDnBT7hD1djRX++QFoDnGtcwXyAAOVSh2AIFKqVO4l4jOB3?=
 =?us-ascii?Q?VTg5/ZJg4A3++hKFTinQi7dDDobdNy5yLYXGwmm/5QQ1H8E4na/hCcE326vJ?=
 =?us-ascii?Q?sxnsoNMvcU8SQ/RGi+1fp6+4Wa8D5or2PW0nzH2g8CshhZAOoHcLDm6JtXpb?=
 =?us-ascii?Q?aMCcQILDYrjQDOqFyym3nX85j5mzp+iYzufcKnwh2gqGEYkov6MoQEEP7BmY?=
 =?us-ascii?Q?j1txel5EfsFKyg248/xl0WOaZTKgRbT12y068xwmFx8YudLaWq6Yv7DbzMc8?=
 =?us-ascii?Q?0LRiVXTE4Zc1uRWqU7/s9XXIDIa2PGnaDB9yIsjlYDxbj6AAqyk+c9iSRtAy?=
 =?us-ascii?Q?dNnPXgi7mQ3nYQ+9ITekL/t3cT3kx3cKmC452tEFYzr42gKAgtKexM4t2DVg?=
 =?us-ascii?Q?6iUcGdBpEnMBY9AQHq65qpXcM6He/LyUUSCF/r8kLd8+LYVJ70sTbYCGqF6q?=
 =?us-ascii?Q?+1DOF9yOq4GTctgiWn+l815K6adzqB5QDuodi+3Eu0cKVpg/pbbwQZoRF9nZ?=
 =?us-ascii?Q?HW9UxHFqDaihPjOShWM1eQRJBa4NBcuv8o3sFTrdK1bTvWAgK6oy7dBNgks6?=
 =?us-ascii?Q?wZ1V7Ag=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:51.4005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af3e84f-cad4-4cfa-52d9-08dce3e638d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935
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
index a995a0e25a34..6e1d733ca50c 100644
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
index edad9c579781..f0cd4cbdd99e 100644
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
2.46.2

