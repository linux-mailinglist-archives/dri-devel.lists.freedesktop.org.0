Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C4B07F03
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 22:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019110E3BD;
	Wed, 16 Jul 2025 20:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KXYNVKoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADC210E3BD;
 Wed, 16 Jul 2025 20:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E57U/gnteb2LlevicFLaxiIlGPeqHoW6IlmrWla1lPPVvAQ9UmVZWv28LsNNhtkM4UAKoBc+VEXMxqhWi57ye/yjyDP4yhwxMT82OIHAe7qX3U+c8Bv/7legkDF3iVjZCt8R0VBYljb84d1J9GFCfwGcI7qbWYU9p18vrRbdnLmqYFmW89ztGuy9j+w/i17l/kdo/5RbLcLzuBnhK9U9712pjrEzNlQackKWPovcOt1uagOZK1Dd19y2gvgx7HrVlNS2GdRh1MfnOOe8cKTfqhgFWRJAcq9tMuBDUx3idBBzADnYeSKvJOphz4Mv1z5Uj0VsxmKZBxoBarvOUtHKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxylae/ZKY3dmphg9IY7pAigRvBazhLAYFkR9zpNRK8=;
 b=X19V0cwLnE1BAKa+qMSCse4x6QSGEW9SzIxvXyisaM4BNEF3O1XaAT8bCcNQCIsU/HwTxo5jjX0lj8faygCJdCm7it+YxkZ2TfGqzW+hI4JGmDIJGDDElhkrZVL5jgb+tnGilKIZKyLtRChPZtFIbNtXwISB2KwYdgjeIPaXqA+CC6OpCRydmT2mIrR7n6nFq0TBWbkKaXHTOgol6pHG4oU0tJuvE9ECtRLps2Tee3gY+z3FzHP2lLt2VOzai/3jZ79zR+uI1m20vPKJQn8A0ey1ABzvAcAW4rigOVSjx6VUFTB0LyIk4R7e2gSNnJhCsDwHvE8b67HbFN/VSnZXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxylae/ZKY3dmphg9IY7pAigRvBazhLAYFkR9zpNRK8=;
 b=KXYNVKoM209gl5GorKKZ2TrT3t1AHNsx2RIwbg4XHorzqkjsJMj5j8cfM4ZLgktlLfI+ZaqaoQ69vc0QWrAmyV4xVk94yC7F9XsSIfM+qzGl9P0e2eCL4zhDmsMvlsavlc+ZNJre30RLbS85wQv02Z+OrpvsLCVLLpst5AwYhR0=
Received: from MW4PR04CA0139.namprd04.prod.outlook.com (2603:10b6:303:84::24)
 by LV8PR12MB9112.namprd12.prod.outlook.com (2603:10b6:408:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 20:36:10 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::ca) by MW4PR04CA0139.outlook.office365.com
 (2603:10b6:303:84::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 20:36:09 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:36:06 -0500
From: Alex Hung <alex.hung@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, 
 <simona@ffwll.ch>, <aric.cyr@amd.com>, <aurabindo.pillai@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Yihan.Zhu@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH] drm/amd/display: Fix kernel docs for struct mpc_color_caps
Date: Wed, 16 Jul 2025 14:35:46 -0600
Message-ID: <20250716203546.505788-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|LV8PR12MB9112:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bee458-ab9a-4632-c1eb-08ddc4a865f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?34uvy7qOBso2p9MzHNx/CFOn/XGR9qoTiq2Nl7jqCUODG5LdoMenpz1lmTrW?=
 =?us-ascii?Q?Bxj1FTbhpdzFKO1qqvg/qiLxvIzx3kzH6jHy23O4YXMm2FLGxqRNaH6l3HxB?=
 =?us-ascii?Q?/l8aEh6pW8nLIE6KTvInfG46s7i09ZTtcgP3NBCL2T5AX9H6uW0v5pzyFGxQ?=
 =?us-ascii?Q?w0GGdKqsYrxwhIrqQixOm+jiSo69j9Y6GnZNAwEoDeS41eKYP7tsrjGuinG5?=
 =?us-ascii?Q?vNobQz1leGKPKlDb9EfzbHZkn6AehL9agq3yVO75CiADU00IQ6FDPLVtnRTY?=
 =?us-ascii?Q?+J1JN0Sv4ZWQ6Lms3TVN1JICjkbcb7LNAn6WkhsuNGsnJ2PKcZhhnqHqMWZd?=
 =?us-ascii?Q?Lz/iRKjPXZH+VoiBxowmqqcoWlXzTZadLJ9CJzVPp3t1Ms26FtSzcxetEBif?=
 =?us-ascii?Q?iWJZA6DbZw5wCkzzhSYbuYWL0OxvDy9TlZTnJtRgIs9DK/2Ou5YyteIHwgQa?=
 =?us-ascii?Q?3kep+DJ5L09h55SpIFYU3SCWc2LBF+jjDZVWUa3Q9izXcJApdoiASWsOtOyd?=
 =?us-ascii?Q?FoQkuXCUCqTdcod3jddu8ZMHlpqsPcEPqVO70MiXcFEX/kccAFpW8ZqCJTFs?=
 =?us-ascii?Q?jX0Kl5oR7UZzlcHLz9qATvR14XCci+IhMVKinnfRj9amIkFL6cObblHmcdPY?=
 =?us-ascii?Q?i0LH3bYHh1JLYNZEladi/wYWF/w9Tby8HIxHGnJvcOitmjcTMGCYpCtm/j9O?=
 =?us-ascii?Q?MowitJ/008yLn63Z5x0ZiOM4RWJCc8G1tNfKGLjKlIf8yApc1dybVoYfZ3gM?=
 =?us-ascii?Q?PJPHiaQsagMJIcbvlEO53yjpo/g1zFUWbKRrtXM8C/yhCR1FUDygNlqt6EwD?=
 =?us-ascii?Q?ky2MPMUl6ChbmO23+Ye19p8+77HNhM1KD/pzd5u/cEk4VhRgiBPHYrRTEVSD?=
 =?us-ascii?Q?MyqMDkxXeIZ8BujQOcCvmCNhNNef/oEuFVzTYVpFM/elJlH2gxjrzTJKDYU2?=
 =?us-ascii?Q?0Oqt7fLkUe/jTsQG4peXNk55JsDpYqG0O66L3jdzaYo8W1fuHsuPilz4wDPo?=
 =?us-ascii?Q?AfMejwl1/IWyFHWq83+OUOumiy77qxAoxh8okJNL9E6tNScxexY+2YR32f3P?=
 =?us-ascii?Q?wDrnqgKQagEF1Kjzlf5tZE9FGdKCGIKorDIY9zgYy11QrDPTE3xR/WbIW+Mv?=
 =?us-ascii?Q?LobXs8BXVb89KwDoHRQEhweM/ZLMhj8Qbt1TdWE20CJai7YydUAQucNvDxJH?=
 =?us-ascii?Q?vAgwR1GiZZcpjDRn+VxObvTMMsqJF4vN/KfXaGyDvcGYcJgXSWahYe6b2TVz?=
 =?us-ascii?Q?qrkuPeA36xpGKhxoCkh1VzMysdOUqHCkuOgeZIFRXmm6bYV8JLpn8UxwlDFr?=
 =?us-ascii?Q?C3xdlBsXTx4QQoU0j4u5Yt3MbMHH1Pc7RRq3BDA4OXa0plqKv8g07FceEr5q?=
 =?us-ascii?Q?jNanTzvjm4nIdxrKjnqTpJ3wC9/XOdEDTZ33tCMJbO2NVr59wbf+sE/OlHxn?=
 =?us-ascii?Q?Alx7OU9gbF0pt2TPOqugzEycd++MdvHCENykr2n7CNZE3SS6TYpCvdY6DBJt?=
 =?us-ascii?Q?5qb2pcbMA+7/CDUGBpgcmz2KcD0ysho1R/aCaiMiZz87lewnTivgUqwKGw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:36:09.9161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bee458-ab9a-4632-c1eb-08ddc4a865f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9112
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

[WHAT & HOW]
Add kernel-doc for a new struct member "num_rmcm_3dluts".

This fixes the follow warnings from "make htmldocs".

./drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter
or struct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'

Reviewed-by: Yihan Zhu <Yihan.Zhu@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 59c07756130d..fac976b2cbee 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -234,6 +234,7 @@ struct lut3d_caps {
  * @ogam_ram: programmable out gamma LUT
  * @ocsc: output color space conversion matrix
  * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
+ * @num_rmcm_3dluts: number of RMCM hardware instances
  * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but single
  * instance
  * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
-- 
2.43.0

