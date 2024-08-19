Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D72995761D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183BA10E3D3;
	Mon, 19 Aug 2024 20:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lyw6YJ6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5710E3BD;
 Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nb7WAMrJava1KeVBrDonQfX/rECM1e6Sa60Xr7G7q4AqpI7eJS2vIN9LvkpSy+6dXWuiiZqI9QY4MoPaLFA8mdJetyYLcd+C75h5l87jDGwafGwEqZK4Vf5XsaEau5u4GKApOCeKg4/2l+j+nzjQJ5+DvPZt1W+tRwgiYGB7Rh1+3QuDbNSL0foby1txjac0qykihBCxennbG5sZAUh2EQwmHzQVXwsh71FSLqrQEisp6VuPlnvwIwa+wnguteHjZOIexWQNGIps/jPjXFY7eJZMOeyyZmNd0aUp2QTBr9wSgcB90wjKdtY5frhJsrSmiwenaLVTaHJxDWPoxycrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgLXypULA9ybvyQ71jO4wTPotC3ses0X4HGcH9aREi8=;
 b=T1YlDyAiTFmVmLEfU5ouygJDO4mX+/2XQG3yUBoWR1uV1GbakUpCdmCUZdnaIibPXsNDO4L0bttlF0ylB/TDJcwt2y7VVageDV9iKV58nrGaO7MMWRDlH010WvkYIerl6LVR4cNPRi2ANzv7YLxsHrsaTYH+dnoJgnvtUl/9F+n7LqDX56jMCdGTLGV8UR1xnyq4TtForyT9sBu/XVapeDPcDpziH75um615FFDca+3qiruJC22dgSEgRH+GaNEpgbXfNWRyzFG35hewER0HOpmxchHeoA84YktkaLIsbTarsUv9aicMH5CnmkL3s5L9DHQBsWngDL/ak6VxQxz2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgLXypULA9ybvyQ71jO4wTPotC3ses0X4HGcH9aREi8=;
 b=Lyw6YJ6BNRqhbo/iC+0KoEHnWJp44fm/PIH9JrHstCVWsnuxBtyLURnzwDhcT+RQVNP92fbVpHIhQ1sRoTWyu7TmJte7g8Drd/tQHVwDGr61fJhvDWyYLH9MbWbvJ3ANAi3I/3rAeDTAoKfw8ycg2EXtxq59y4sxvDc4IULHdmQ=
Received: from BN0PR10CA0013.namprd10.prod.outlook.com (2603:10b6:408:143::17)
 by CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:36 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::dc) by BN0PR10CA0013.outlook.office365.com
 (2603:10b6:408:143::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 26/44] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Mon, 19 Aug 2024 16:56:53 -0400
Message-ID: <20240819205714.316380-27-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|CH0PR12MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b15e62f-dda1-49c8-6795-08dcc0918dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3W7lMuhj6K9Z25ydEShzsiVWCRU+FgpElbYaKzXWoZmk7Y8oSjO3ylImSzx?=
 =?us-ascii?Q?QWub4wPB+A7dWQ1iu7Ty6XtujfzPGR2Fa0wCuB6qAr8lyRY6ZeUHqHu6SewG?=
 =?us-ascii?Q?zLUxWDz7rmDfnZ7IxaAhrCwyNLtKkKIrEy5eXc/0eZux+V52KNy5v9+vOYcK?=
 =?us-ascii?Q?sL+t287AWs0atHFji2/+eTx1jKri+4Xs2pZ+g1st05ZzQXbABJLJR5yHVaxs?=
 =?us-ascii?Q?DyrgvXfhST79LlWnc2tQt5gEn+Dtl8VOOrav094uo3raLGctJacG7wG5OlV5?=
 =?us-ascii?Q?KDwQp3T/ftT024jUJ/ZrgfzrNsT9edDItIvv8w45WIQ3i44kXkA7HXjJhnJm?=
 =?us-ascii?Q?2xxM360HCPwIXK2/3TvUfLcosFOo4Q0gnoyyx1uo218o1Oziz7hy7j5jpT6I?=
 =?us-ascii?Q?PqcjW2j33mZafc0mynU+fz69k30PBRmd4vcitogvnqxmq2Kb62zAq/LlZGTT?=
 =?us-ascii?Q?RKPSRq/W+cM/wfRHyFFZsV22X7vsnd/fth0xTva4WTb02FmpjcbvZzDNeunk?=
 =?us-ascii?Q?AumbLIZ9bj3edJJwkQWsDKor4/frN6D+U6UE5pClReSH1w0dzB0s+1cZFXA3?=
 =?us-ascii?Q?priBB1t/ffu2q1I1xn3myNIHDKWdWBmzRHE4LsgkB3I7WazckbXwYsuZ+/sJ?=
 =?us-ascii?Q?/Ec/ZYax2DgWqlDzJR0oSrXO6lWZmQQJgZR1zUNWExqmUeFcnl+fWcuKWrWS?=
 =?us-ascii?Q?ODI7o3lHbbOlVbDgLwVaVIaGqo8TvqrARVicHuJmd/AMScKA+FB845xK3nZ8?=
 =?us-ascii?Q?WU3ETC0d1a1+MTjKftvfuq+dYJskMKRY9CerkvF6c5//BoLNMoznf598cGQm?=
 =?us-ascii?Q?TNEgFq3p0kTAk/mrlKhFfKVd5rkUZPltz7n4cMm5Xs2l6W5IvYnVq3sRkFiP?=
 =?us-ascii?Q?aMb9tc0USbinbKD+53uz8eaqO91pXebHyvXF2wNgHFmdqF+HcxV10uusLSXd?=
 =?us-ascii?Q?MCJXc2C7TXN07s4jbRu0yXuw8WxiJwvSdzUqG7JTrcQaH9aeYm0hT02INESv?=
 =?us-ascii?Q?pjz815zLaQyXa2+2XT4xCEhjbjKWOYG5tP1LDNrxZMu9/p4LELkUm5sBNhG+?=
 =?us-ascii?Q?KpPwAFdOhiHKS4LxIseUChu22o/rB8BJ3YCio5QL74Q9wyUaZ5Ea7IT/5jQf?=
 =?us-ascii?Q?VrmEcPnJndrc79T5ya+GffMX17u4c8xvrrgq0ozhd8QczhwKBy40OhZuoJDX?=
 =?us-ascii?Q?2wboBXLp3iWG9aSHfqtyFTtdF2eROXRabFb7Mthvzqhpnfl9T/SMWWfL1Pld?=
 =?us-ascii?Q?c3S2TP4+2yjMwar+x1lkmMbZ35eWXNKHIuvpEs6j/Bi0usOFLQaLhrGfTnb6?=
 =?us-ascii?Q?iFqCjBMImMeI8DPkG95UOH6SpZdh50jSneikRarGewG+yP3ScXIt/WjlVtpO?=
 =?us-ascii?Q?Ef2wCixfs4aSiJ52XXjTqChRCWq2SiNGMWssvzpwhhKPXk/TWz/+JFLXRGaZ?=
 =?us-ascii?Q?6dPzdEeD1kURShiZl19R659iR/DDDSRW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:36.1637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b15e62f-dda1-49c8-6795-08dcc0918dd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index d260db42d407..8fc0f73fce33 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1754,6 +1754,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.46.0

