Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11679F8B95
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DEE10EEE6;
	Fri, 20 Dec 2024 04:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4EhChwY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2DE10EEE3;
 Fri, 20 Dec 2024 04:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZYe07jDW0OpKrcf0o0GJAioCyOU1GipKshNlaeRjr/6A0rFNz0q9xMHs1afc6OR8RI85QoqlzbQlLk8v4kNvaW0VZtb0eJJqn1kFywuXUXWSJb7oCk4Dmz/4NOgnPTeJB/npWPXB47lcHje7Ld3XEK6bo8lZYKroh7LM4VAqOJZTntHpE61SZ1kR0GGG1iKnpOyIiDcneqrS18vy7l/plja3FmTiG2tEqKEOh4rT/MCBISrDWA1lRqNY6ExNyzPipMeI37g7IGF0L3iKAjivuebGKS2eALa792S80x05ywLZSBCtG9Ni6BVCO13UwOzLpbQW5GtQ+txMKkAmv1Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHQznEUEWnnBjCNLDldm1K155HkEcknI6BDyuVO9eh4=;
 b=t7f4rgnlPENwP7iNk1/NUrv630swL4dAaNygVvauXNjNkybC2QxICacWX2JuYdPqN+ofV4C5WTe+YTTJF6zU9ITxz75vfAN8CsCriSWspqbceC2GSx41Cq7kj52sPe7TDNg7uTCuthct/m/+YDq92EcaEavTUmLl9GH5vVIGO9ek2naQ+/GsA78xBfrK/lDQe7OKIgLNGPkO7EyT/U8hU/2TEGZ2oVu2b27TSRGAoaZ3gxOTRgjY8i1aoVGMb7OOBGMxSxx6mCTRDi9h1mpme5k8dtJV9CHiPJttCTdpfQwYVl+GonwkC/I47/ICHcqs7+C4h9amMsiKY+Gp7x6NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHQznEUEWnnBjCNLDldm1K155HkEcknI6BDyuVO9eh4=;
 b=4EhChwY0yDNxP/HdOUQ2yF4Ju+tmZgzHa8aeJiUsW8gt8SFgatBAQAeElJgk0i8h6cmAFJnrH9OrukEO1QVWytRVSAFdeos+c8GGcy7vM17LzIOcrPmfzfuPUbcpTOhGgGYQPAS2dwJOWJB3E8a6xnkTg7dw1n/kDsBCG/msfuA=
Received: from SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:45:57 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::a8) by SJ0PR05CA0079.outlook.office365.com
 (2603:10b6:a03:332::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.12 via Frontend Transport; Fri,
 20 Dec 2024 04:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:45:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:45:52 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 37/45] drm/amd/display: add multiplier colorop
Date: Thu, 19 Dec 2024 21:33:43 -0700
Message-ID: <20241220043410.416867-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: f06ec9c3-c061-43da-ffae-08dd20b131c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CjYAd4UtYLYxeAkUYW/XRy4xZuTaQJu1ElhXyg2zcBVHa6vWCN2C82PBrKbU?=
 =?us-ascii?Q?9R3YmOaQDctqwhw7YGmOHhCMl3IxiRyb6OTnKT3EsmA4QOYRK7Pm0m55jRoz?=
 =?us-ascii?Q?CNwrvlk0H9oKQy6xeloDMW1yMLUKAX5Fgtw+WbFYGpSy57u7SqnyHOlQqVyS?=
 =?us-ascii?Q?Rmj4xHTU9XSrLhNp2w5kq9T16bu+fBqvgwkopbHii2kHu2JtZLMhyjIyNfbB?=
 =?us-ascii?Q?jLxdX/Zwh5uXRTJpc64XZZuj8M5nDkFvOn9GzaUvy6BCmrG9G6IhoOTF1BZ7?=
 =?us-ascii?Q?qyyYfz2jYEMDPsMDBn8TG85+DnWbd07XZqjADGSfEqHXvo4ZCPCMgrvh2HK2?=
 =?us-ascii?Q?n9fNsSDo5TDoi5MrHnW3lOUSfccTUp8hGsNFD8ogaYQr9iZ5w1n2xiVELANd?=
 =?us-ascii?Q?F+2MmQMVyY6ZgoZIVZwmI45BmMC0ghlXyob9D1Q8W44RUVWA2JNtQUPHrLCG?=
 =?us-ascii?Q?4PnA+a7rirKLmJ00YU5zdg/DzOu4rS2N/r4fzwA18eGANso2Sl+pfKmkZw4p?=
 =?us-ascii?Q?pWsvk0mwVza8vDqWspLPYpQ1p6BwxvZIm7jV2PU3P9KnZx3IoRgmbRQj9gTC?=
 =?us-ascii?Q?1yC+WaS8X/bpfMOJRDxbMmwU7haOy81TxnY+zg7exPuaxIFqB73Sqq3DuULt?=
 =?us-ascii?Q?qLM097I1NGNvQnSiz75gJ4Kdvh9pVESDdKuuwPz3rGcR17ALvj61rJo4CEo9?=
 =?us-ascii?Q?9dSE0JdjfzXYDtQr4VNr2iSqzc+CtMi6jN/di71jpA1fCnmKVCPQaOqy4whx?=
 =?us-ascii?Q?cilN5Y3ANI0fyK5B4rRrwosvrYSvBgjwCqsU0USudyCpE6ZmdCvcxcn5JTHs?=
 =?us-ascii?Q?XisE3JwKyTb5bbcuKY2xdFQdaKjVbLXa3xJLFSjtwyUxLTFKZYsrsMgvgOgH?=
 =?us-ascii?Q?IDrpHq3zDvyW8iSw135vSZHwoaCx2MruB54giF7kZTsmKh7cWR5ji9LhMNg/?=
 =?us-ascii?Q?KayjYS1j3CxTGJNUKlgXb3UKNzMZskrPrJNLNphnVDyW6aUrMqyavxjcNgX5?=
 =?us-ascii?Q?NEZ91QkVcfSCb6bDdQKS7SBn852nwoxMWhxEkZJwOmebxWxlfVtoVnJ/G5B7?=
 =?us-ascii?Q?iSdKqYK/ezXdyazFHP5k1jSjc7mrWlH84lwUX5BJJrS3eIhRdI9hAW2ePOO7?=
 =?us-ascii?Q?dY3kGdFLyiiOSFmVyu14yElpwo8msmC7P/6Hyx2Qlhl0aL+d45TPdeQkpYK5?=
 =?us-ascii?Q?QtaggF43GZ/BemIHioLKJ//EGzR4E3SzIaxzq/rrOCRGZqSmf9WlfbLSFUfA?=
 =?us-ascii?Q?RlTsZJWWVeuMCJyfk5WA79EwVk7pgRru1p3gytpz+NL1d0JtKN4zWiRiQmel?=
 =?us-ascii?Q?YXnJ1DL6LruUG+i92JQ8BkEAzxu7IXhlTrXKKgxGFbpBz/jlwyXguSItbJkB?=
 =?us-ascii?Q?eNluu/N2VhTOhN21KL/IqiU9OUEPt3zauDRI4TVUvdWTG00rj6Sjq56KyLE7?=
 =?us-ascii?Q?+ftZHF89LAfCXrOB8oNUanvpZS9CoWZ0jyTm6K7AnsL2I04/NLgJ90GoqCzS?=
 =?us-ascii?Q?wNFK3v3l12xLuhA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:45:57.1406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f06ec9c3-c061-43da-ffae-08dd20b131c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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

This adds support for a multiplier. This multiplier is
programmed via the HDR Multiplier in DCN.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-multiply_125
kms_colorop --run plane-XR30-XR30-multiply_inv_125

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. Multiplier
4. 1D curve colorop
5. 1D LUT
6. 1D curve colorop
7. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 5d6effe6f90e..edf05290d441 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1250,6 +1250,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1459,6 +1488,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 9a9386bf85ec..33156531d751 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -91,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

