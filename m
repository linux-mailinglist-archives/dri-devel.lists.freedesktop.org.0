Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4809B27774
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8B410E8F2;
	Fri, 15 Aug 2025 03:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R4gFhY2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C52B10E8F2;
 Fri, 15 Aug 2025 03:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIN92G4G55c+JiykhgNMT+nbs7FbP8NVX9/YSjaEa9RhvA5/GvN3C0mla+9o2Sc+a59DTKz+WW77vhljZgjlWiYyG09WhyGuAvTttMruepvR7rVn9i7x/O5do9uw/qSp9Nz38hPibtZ+elT5n91qSNGIqO9qkoL4NP2hLuCxF56kJa060DY0tCpmim81pq4Lw72P9/Rze0ydZaI0vfRIpr6Ml15oTS31/aywdmiDcvfH+Pj5CEKIwd8ZbzS7GxqFMOGVqlVu8IHQvKDokSAw/oNMZIiq8Vp+NKw3CSqmS4/31/MjXHbsQGIP88TPfQhnonX3iRo+sM/Wr3vtDf7dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r65f/0qWnVoSXcu/2SprxsIm66CgowDDCCoywfvEF9E=;
 b=E2hc1OJhTe7I0lnxQ/Sc/yKxvXSFXGUNZ1NOg4RabenahPqDNcVdNliOurJDZ4YHbxKK4mOTTBrDiK8ScDs8edrRnKnmaNZxyVXbX5oCXdRmmuZ8dxCUN4KQ7K8bHFdzGcuuwki8vgmB2qXqW1Pu+FiSuutihXd6OkljKNkCeB6ovuATRd827b+MRg6MSfN2lCGI4PvpYNr4NS/5e0URpBdVVWUq9Rj00uOdlNxjev0E/+OxWMFtX/60RMNV04BwnDpdE70L4a25KsHnRw1Lyan6ni+k67ybRtqzwk+Z/h3e7Z5db61v5bC2d0a0iJv99hpz2XGc9vU64V8zMGGFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r65f/0qWnVoSXcu/2SprxsIm66CgowDDCCoywfvEF9E=;
 b=R4gFhY2CLJrheYHad2ECbCZ2Hb1bfITmG2R+IK7W09iYDqAYcgYbMMRSSW2NPaADgGB7TgWwR370A+W5T3JcSfTstmdOH85KoBvYoI/w0XHcEbYlVvmkINbg6bq+EQVT077zn9A057qHdTA64fRkod7ALp+1zIQ4rWqVAjYH7uE=
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:59:06 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::53) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:59:06 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:59:03 -0500
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
Subject: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Thu, 14 Aug 2025 21:50:20 -0600
Message-ID: <20250815035047.3319284-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|MW3PR12MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d516c2-d849-4105-681d-08dddbb014e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ek/vogWWTZ0Q3LFST9UkU3a6ugoAy0KbgBM/x35yAwgg0/JuBkG3lOsiuItQ?=
 =?us-ascii?Q?rn4buJDdX+zyWybaA/dT47yic/6ODqcZQ/VjBmdFhkpC+Vmf6dQlUWAEma4w?=
 =?us-ascii?Q?1RnbG/421pIAGL8rjF4zn7FBDWRFmWC7L99KRWFOrJO4VYv+08qcs8pQXyoA?=
 =?us-ascii?Q?WjrBHx1hXvOPu3ZxK2+Khg+JIcIuT6P1PY6kZDJ/e5PtRuqr/nhPRo8EO4Rt?=
 =?us-ascii?Q?fAu0HzvcmuOZNrztaIkAaJ15DPAhVzJsg1X0YuXbKG5b2mlAbWH8ZL1yq6g5?=
 =?us-ascii?Q?RHzRZME6IP54fktH9D3iXnUmG1AwFtUxEKAHhkRLdPdWdW+U9SCjDIsVTJgz?=
 =?us-ascii?Q?7fT1A0fxiX3rxj4gWV2ZlNxaSdNyzB0M5IPdGIjOL6ENX8O0jewm7vBI5Olx?=
 =?us-ascii?Q?+4j1hjI3hDg1gWqBkPwHvR0Aiamom2o7e8eu0Unq29uxJb6oxIGUcf4z3HUg?=
 =?us-ascii?Q?EQdtk8mbjubysYC0SibkH7fLTkuTW+MkfTAzsiMFR5QnD9LqI67I2BPDbHjj?=
 =?us-ascii?Q?lX95jU3mjp3vFz/sOmRx4d91VhAKWitIfFEV0lII3xWRPg5P9meUA+VnAVeJ?=
 =?us-ascii?Q?wE82Saj7JHIt3NHzli0qJ327qhiJQ1mqDRu354t/TKereg9w2bUSjPghmY9A?=
 =?us-ascii?Q?zewQIWABIIPU5qr3Zyr/RLelhm7LcgBZgDprf6KpEPEO1yZIykYCsIjckHPI?=
 =?us-ascii?Q?stp54fDr3NmrgUrBMDFNWtDR9eVaPpDCV4HTscmrtsleW660QbupZ2ThhUI3?=
 =?us-ascii?Q?JUpJpzYxulAlK4f1JdV1x1vIUaJwTS/22S3xjyvnzDHiqD4eALk5rmZYj29M?=
 =?us-ascii?Q?76iOG9GD62MowiXI20J1uvkL3VzZp8yXHQYTpFjv94n12l/xseliq2BQJwfk?=
 =?us-ascii?Q?KbGzNtJmAEz8aV6DCIVhFNphdheAVAUV2Ys8MLb6OoPiRljFkeyLWQXqCklb?=
 =?us-ascii?Q?xt0uqo/iT/H30CVCKhRM6qIPtEugtjrJAu3TtoYmMQ9V2Cyaa2tfCe9e1LcH?=
 =?us-ascii?Q?7fQ3KGA9+rU3bsRzsJgoCQrrIbojikHepuI0wXG9VtoIcMNF7hmcPfZxnpSa?=
 =?us-ascii?Q?f02KEEoS0rjtewAeTNzhxbgxb2h6jKwATnKgM2U4VjxBkHk1JF3OyYu6jsWN?=
 =?us-ascii?Q?AEQvbIkhFVTdBEzMN2I6BQb+H4LmUBWMLMjNOM5TC8NhJoBUrW6qmJCmKMIC?=
 =?us-ascii?Q?/HbV2TkVwO2Gg4Z4+w1rIxq/7zedtc3ExUdJ29KfGmTZ2SVW/NHo0aKox/x4?=
 =?us-ascii?Q?bXfsDJt8DoMWcKgwt0MC7aqYivzLDbhVg2+no1AxvbnSN8wDRrF76SQkAD5e?=
 =?us-ascii?Q?8rQhS35Uuqrp01nndr6H1hqQEKhu3c0GbQWJFSahsmxIykV90zo7e2ttZ5JM?=
 =?us-ascii?Q?zKnK54kWKyo+0ozgOOn96ZA7z17lwVZA9C+R5V4HbkwiCYkzzuiXsWAUBp11?=
 =?us-ascii?Q?zKqWWe63GoE5EfBCdDGvVfwAttg7skbKlOMP5lSAgkvWZcomg+SlnC3gv1hN?=
 =?us-ascii?Q?hqtzj1aTIgSjsGm1v99KPAPkvlICwG7CsjhJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:59:06.7292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d516c2-d849-4105-681d-08dddbb014e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490
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

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
v9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5bb45963fa1f..c245a3ff45d3 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -72,6 +72,8 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a38c90f61dc6..c6d2b289e3cf 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -83,6 +83,29 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * enum string "BT.2020 Inverse OETF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * enum string "BT.2020 OETF"
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

