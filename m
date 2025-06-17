Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A62ADC076
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42D410E689;
	Tue, 17 Jun 2025 04:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qZTIsrLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A136510E5F5;
 Tue, 17 Jun 2025 04:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHocrdkpDzNXiSUJzOS+jdhfQ3sDVeaMrVkrtOLNcKm8BiJt4zi9WnOc4jSMZesEK5qnPdWLnmkAoc5P4nHBBTbZ+UmPyMVGv7ZbJdwOeBbffxsMAcuc9pR61KOUK8aK5LjmKq+R7wWxp9s9tCLStqffrC0AtHg2kAtg01x9kHj0eMnoBJQXgpfXrpln14WX64jvuQ8weWOV1tpSvVprXwi+6WUKzh/tqJr5lUGBaYleKRrnQmnYneUuNZKGPb40aW5AsmcmCap1556fALt8UqMOlKvb+p7bzmy2mQcYV0Izn13BDnKiozpmGwk8TngYC8TxdpfMW40rDKd1uG2UnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XFJJP5KccmXnmbWbnSF8K7l7lXhP22b2oawn4FNvlg=;
 b=i/wHmnocBPINy60IeQKQXb64mdJrzohZsZs5TMIARD8azcUHkqMSr3GGJsOYdPPOI3Zn4McBbrxmBKiGURGXLFQVWlt4ejKgNu9R9PydQBzeQxIqgLXidmrIZeDvcM/BDMUnD2DGeEIb1bTlZvyMa4hkMvRzP62qu8SWhtC6+RcRpMSZHpYOa1b7luZTHTk2urTKofVkIpsBiNtLaqgqi9olxHxgIOBYQsr62DWQqp1bmViMt53tew8tPipLq8RT1cCV1TPA8u6Ng7EZKbpPnoYmJ7pMrHyCYk0PMWLYglsQZ1MA1DbucfGSA60XwSSYkNGBLUguStdbxYlJ+eihLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XFJJP5KccmXnmbWbnSF8K7l7lXhP22b2oawn4FNvlg=;
 b=qZTIsrLyfOlDAvgqQSx8BunF6uyuEm9TDS2b9YFTDRX4afW66VlDFZQMUxqc1WHTMdq5YOBXIkKkIDyMO2yOc9HGGUOA/fMXq+Ncrjq38OQrgcC7fsWOb6V8Lu0f5iHBM4vkRWhPGEub8eIV58ezk9bl3NhADQLchZbdj1frg44=
Received: from MN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:208:52d::24)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:25:46 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::a9) by MN0PR04CA0025.outlook.office365.com
 (2603:10b6:208:52d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 04:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:25:46 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:25:32 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 31/46] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Mon, 16 Jun 2025 22:17:13 -0600
Message-ID: <20250617041746.2884343-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|BL3PR12MB6594:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e636851-4181-4c3a-b170-08ddad570826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODPt6bP4wVfPlRQWAKJFWOmUd3NX2bTOGI7PSl5ODZW6WF+i1tUm0XyvZxkQ?=
 =?us-ascii?Q?FS13JtGsn5Z3t7HRL5tsD38qtHdlRJFYqr+OejmX0rZ4gxDombiiaQKi6iZC?=
 =?us-ascii?Q?fAuyPEN1RY6xNskhCfRjeTHuwPVamx1dcWdeY6r9krtwVUpT4+n/r/Y8d3nj?=
 =?us-ascii?Q?HWHpyOT6JoKOHWsJs4jYyjyzvYIqvmhWquw4KG0l9OX/i1cx6iafbY1BRDke?=
 =?us-ascii?Q?U4zwPRtnSOe0K4fbemy6ut3VNOFSOyGu9dkGefRPfw1PnddO8PfXtL6vpHM4?=
 =?us-ascii?Q?ySoQXGIsmeXaO/CRWnZgOq1aXmrx4xrQ8hh5SJmJU2iLyLkjxE0vM1NKWt6/?=
 =?us-ascii?Q?R1gi6RfWkStb2ZGqQ08ehYzq/Wb6dZ2L87o2olVhkhPhLU0lbg5m8mwRjpXp?=
 =?us-ascii?Q?xKS4qyxCeWmOHZLcFjBiokPG9hiiCA67v/cdxBiJFXZxmSH6QN48j+IZ68UY?=
 =?us-ascii?Q?BoJOmhD5W059ekkGjr14+sEj+Vq9h/xsGzFfoz6P9xgOxn9Lm1GPvI4wOA/h?=
 =?us-ascii?Q?HQK86fr6CdcnhiEFLpYHHeaF9oyigtICLeiTGkqMBalNN0DosOwNiYpUY21a?=
 =?us-ascii?Q?6rqp0m+p2Wf2CTDK+9J07/1vEZU/aEwisOMSqrrOe2LgyTEeIEvQ93HP/Egw?=
 =?us-ascii?Q?wvxD+jx2m/0vTpIVa3UE29+WGDZr+AEVa8qJHWYBVl2rwLysV2nR9vFgguX5?=
 =?us-ascii?Q?IxaqM3eSMFq4unxgdjIlebfGnJ8RQtOND0XcDbAF44pwldCmCx+cNE+Ex0Wa?=
 =?us-ascii?Q?qEC6LivexOMAi9FZ3JjcA59SC+kGN0g5traU7hHMbqSQaDlSNJQb09HHO6rQ?=
 =?us-ascii?Q?eCpYVGSAI/M3eLNn3LQCuha9Xnn8hNUhABFZ89bv5K/2hOGZzdGn+5lsXfBf?=
 =?us-ascii?Q?HrlwgaoN3COtxEfbB+QXVRxGrpuobUzI6wGfWXu8IH3THh4ItXeAEmVLGeOA?=
 =?us-ascii?Q?AHUT+lipPhaQVi4k506iq0k/wCkalXYD3hjfSVOpSB7LXWn8Cg/SEutOAJUJ?=
 =?us-ascii?Q?Jul8V0y96ajXtJIMol8tDr7ZIYI6g2tzYRmYzblIYmJpjcwNXMkREhh0jJXU?=
 =?us-ascii?Q?ugmLQVn8fRR9KqWpqRqmzTPF21cFJ4OK7zrvP+BaiLCdWpj8YYI9s3f99cp4?=
 =?us-ascii?Q?mi5onCQ9sWksXu7RYC9ypUyuJTfQ+5zW6qVes5GzkOmBc4ficMEOYQ0nJ+vI?=
 =?us-ascii?Q?HuMd6vqqnFNaEf0hVjFbMJhXcUdnBL2Rv7udSD19IRjc+zYq4M7tFYzLvBo7?=
 =?us-ascii?Q?uFEDmLXRIXPdNEKp7yDOVIUgDPgw062bL/K5ZVe59ELG2us9KrrNubaypdvQ?=
 =?us-ascii?Q?rrnV7Axeg0Mv5sfE6y+ZpixMSO9MCukcUkcL7980pYk+r843lDZanWGPyE5D?=
 =?us-ascii?Q?7ujJ+6jz+eLzwABAH8RQXjWBUHsglr34eDu546jg+cnSGbKiCdPZaCjfeSqx?=
 =?us-ascii?Q?Bv9Q+/EUWH1AJ5spqchy4Nfj4kp6NIKVMak1IkvJrsaCcKW8IlS1ytFKSJNK?=
 =?us-ascii?Q?1xQl4t9lyJnScYl7CHdPeKlOmXaLPY+WiCga?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:25:46.6561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e636851-4181-4c3a-b170-08ddad570826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
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
V9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 9ddb3dccaf72..3ae4a93f0200 100644
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
index 40d70d4a34a0..766caedea2f3 100644
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

