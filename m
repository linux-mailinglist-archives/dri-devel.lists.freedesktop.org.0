Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4395762B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB6510E408;
	Mon, 19 Aug 2024 20:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W8Fzzxd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DE510E3C4;
 Mon, 19 Aug 2024 20:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Syiak9zENwvdz3OJuoTd6kejWBnLUUpsc0rrqyPrxzRwIJeo9VHiQZ6Wxx7mUrZugi6UO7EngcNKyL03KjVZFOuuuhXVjZ9cbb/LpQoi8jbdfS4o0s7EgGNSg0vdyul8KDexejFDXD7j5wFhQoB1bQKMLGrm4onn+Fd6uFK15aMX2pMeGOtTUqOy12uEsxcXJ/ClhmZ1VMJjrSCK9+czo+8u32uc51f/JGGIb1s1LUOxXxBanO1Fcfnx8zI4aWVwhZiqY/TFzFnFJYUjfRopOv2XUSxRZE39W4ViYML0m0JW9JEBE/ycxPDf+739mcg8HD5wFFOzGtrFg+usMEhYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOJI+7kQiXlXmRMwOzpm2Dgw0wdJC4hjB4+brhM3Bws=;
 b=kfzsjHVKXykz0L0KvDyt02qo15msnF5vmgHzMtQzsVC6/lkoI2a0ITPawMFQHowN8AhVnCEqdxolIf8dL7xYEFQvXxg13VD8bgQu8EaHzvfZzGlv8BoTjpvB60faFPrcZB79hpPRGojh0EeglOWwq2HQt487jhhJQw6EidINesaKaa3zdvR6awW78L67GFNQLI29OOkcKNFUdH8E6/N0/G5n5/F4kDb9FinhoJNS2DLJ88n8znYSmQkTWg40y8k8/B+Iaqg1GxlLeqgnRdzIYrRHhQn5CAf9yu2VlZIY2bw2MvDR0VpFiuGCzSq4mNGkbswR0/JQRBvjfrl0OGZiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOJI+7kQiXlXmRMwOzpm2Dgw0wdJC4hjB4+brhM3Bws=;
 b=W8Fzzxd0j9EEMRyRIvDf++Bk592tQS5z3iOVp2LdYeHTZMso8zgVPVp6nt4Cn2ChrTkA5qyFZvv6RtAIrcoN/ymvhNOsrSiGNKshH8vnFImauoCXOfzAxe3wGNOGa5THpYamWLW9v9UVMBf+T2oa8KwRJY3U/XkNCTqBzgRShfI=
Received: from BN0PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:143::33)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:35 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::f) by BN0PR10CA0015.outlook.office365.com
 (2603:10b6:408:143::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 24/44] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Mon, 19 Aug 2024 16:56:51 -0400
Message-ID: <20240819205714.316380-25-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af64171-7648-4f1a-8403-08dcc0918d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fPYNWJkxWtY7+31WYLYDIV2eua5+2pkCQLLLcc6y2fqp6cytUNtiBhFkWTH/?=
 =?us-ascii?Q?gHssLb8coLEg5TQN67qJMR5rjn2Ql9HxkrPgTaa4lGZQpUfsRWixMARnkSY2?=
 =?us-ascii?Q?L6ArLzKfM/L07aeE7BN4YjAdrT2GJ5znoZbNIMSouXXVLb52gInopjjhcwrH?=
 =?us-ascii?Q?cg/ANU9ET6JTG78mRDncG/YMISSqDpCHZ11nHsnAKVGz5YxXwb1v8QP9IpZT?=
 =?us-ascii?Q?mssVOYbTBbCoBmgJrIBCQo8lCF/H7iIHbqzhe7Hu0pCt5+znSSUtea0YJeLd?=
 =?us-ascii?Q?Q3g0gLohHSasif4eLMoqerqsFi8sfPFJvA8nHQFpFhZS/oMH2JAEu6ECHj7+?=
 =?us-ascii?Q?V+V3NdKDOtqNNwSw311rOfl3Qn7U8AaZbLIJJz2luBfiO9ITlDN1k0+asCR+?=
 =?us-ascii?Q?g5Z8A2ANxx/n+y16gj2PAFDKL2aq7CXvyoqVska+dVJpAUm2PND28rUptM3t?=
 =?us-ascii?Q?4XlajVNzanRdDt7XgnveSgHFoJWuSxTt/gVZwCO6xjy+1hgwDk7oH0ydlv9s?=
 =?us-ascii?Q?COIAOISi2ee5pIjJi4mpPOrp8QSp1xVlYrzJuexN0Eik2U/aqqXD/fXest2j?=
 =?us-ascii?Q?5WTVbVWzwqgP7vR90leIS/BUL7gD7B8h360Kr/y8iRuE4cxeEtLGgXoUgTRe?=
 =?us-ascii?Q?FwN7S6bCNktMUKYgEjex8d3ikE0TzxPELXDgSBMxcO5/rpdddKLoYSJiTJ2y?=
 =?us-ascii?Q?yQbJU2MOt1vfrLvy4If8a/SSqxRz/tgpWF6ndNXOGQ4Qh2KBnrFxPQf0Fpc6?=
 =?us-ascii?Q?E66T9q93L3WVgfxhfjxBJ8akcSfyqNauONzGFfKz2JGboFR7Uhd36szSzyH+?=
 =?us-ascii?Q?oiT6VnlEN7XfP1SPTQUNQKi8HrOSfSkxQhrJUORURbYO9+31Ny1GudAffAZm?=
 =?us-ascii?Q?P02KSquLHfytxfC7W4dlc5RJtru2xJG8Zh7hrb2QHTCYQfGoNyF8vT0uNED7?=
 =?us-ascii?Q?3luC4ROvCp0lhnbmZwZ+9UWptMDgOmXw0YicYozwJ2sCX1hu0Hqttvt186Ac?=
 =?us-ascii?Q?KT2PeCRlYOOaJ38kDuqxG7yBvKq8aTr+OeAY84HFKyOAoaQdB8lua+qJ1zYs?=
 =?us-ascii?Q?WmpIkF5CuujqP0sPeoH33PYlMbe/zort/akOhaFbauC33ytumZBLPyPIRvim?=
 =?us-ascii?Q?n25FIRYjdwcSecQHnpiOkJwfpSJILiJPUcjnE8OM9Q2rFGPWQ6KPCpCCL22D?=
 =?us-ascii?Q?9vSDANzIopXc/AIHfYBju0aoLzPGmaxU6y8lyPjxdLvlT6sh6hy09+xYzoy4?=
 =?us-ascii?Q?nRBjQtW4XaJiWEkVuuHUTacF/2BG/umIOosJIO6s+i63cf6sTEcbgWa5I3e2?=
 =?us-ascii?Q?0Nk4JEncJ3HrTca6uFGdlOsdAgMQTm7C6maP5QFnPf6IqPzwgTBgApJlPChI?=
 =?us-ascii?Q?sF4fG94c2O7xtzAYOJVjyBAwGtv+eHKxsa5nW0j0tQv2HQaXjPUU3dMgfkc+?=
 =?us-ascii?Q?AP2WVH/+44GtXlTj2PITkRCspWZI5T5y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:34.8512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af64171-7648-4f1a-8403-08dcc0918d11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7e7929f24ae4..3257bd22bf6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5319,6 +5319,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.46.0

