Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A898F7BF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63910E97B;
	Thu,  3 Oct 2024 20:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rures5rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD910E965;
 Thu,  3 Oct 2024 20:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezj+TvVVWtGZGTO13e+CYVF95EY/XTRCIEpi/mPhP6quIf0tbMk+wmNAxefB+Wl3zfybqYuh8o3vEA0AdW85hctM3I9H5rwF3lNO9wsDQ1XskKFB81beNrrjhWoKCkI8kGkBuMEX4vPKPxYKKHkRK93NchzvyEhC+3pRcZSRSwAzQqPjkn5r7EgQnfmfpZLXYxaMkTZTJ+PlxzRToUGYM4X952YI6Xu/glA05qTng2V+ZaX1xD/94X2cZcvmeDNOcTgIWdrQdNFJKHIDBhAt7O5WL33+Hvihy4cHetfch9gvodOuzcX2uISigBkDz9fpYZ2g/hTPU6cCLIoLOsB+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylhan1TVFO+eSv9JAnQM9kdnsm/e4LzzQyOa165W2Ig=;
 b=M/NJQ3SkAqv8vQ6IyToHL5l6iJqw0pKl2XPCwy5ryIyqtXMVUoqmiHsoRuLlWRVdKzUvJ7upS+i5K4vHnYA7koAta7lX7M/39ZYblRC3bComF4vnEM6ZNKMTavKStLsQlhZeoQIe+b97UCgi+31NCIM+At6kGNfrcFKWGQa62M+MLg3zX+TLn4jenMQuAbkbl+DMLQjirt+KGXwG0K5COvHJZVjGKlfVmj1NHf71VR3VQoqlvMdhKNt9Uqy4v6DEOi7cs4jXuHE5g5CO1peQb9wl9+92fs9cbYLohhBEMlC7Si9iKqhb+EtwBSFAbRUA+LLk8W1/7ke71ZoOU4ahbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylhan1TVFO+eSv9JAnQM9kdnsm/e4LzzQyOa165W2Ig=;
 b=Rures5rmkV3irdJPXaqmGj1PMxJmNC4lP/mnIjz7EqcEH/kMbT5Ve/tiqoaNSSAc50fFWS8W5Yzq5Gnb3SfQbu8SqKu9Kf+B/j0P7o2aNpR9QI8HhcxS/xldBqF7YyU6ZagOgcH0FNMf7PrImLGEswh/ncbVenjxjyuGqO5ycHI=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 20:01:56 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::6f) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:54 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:53 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v6 36/44] drm/amd/display: add 3x4 matrix colorop
Date: Thu, 3 Oct 2024 16:01:18 -0400
Message-ID: <20241003200129.1732122-37-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 510f1706-2708-4e21-f7a1-08dce3e63b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jA4pbgP3dCm3WqwTUvYv9O6EWrcM5mrkE709xIXaA1TEW1nfk5GXEN+HS3AY?=
 =?us-ascii?Q?BJTEUMSpz5dJM32c/xGnP0H+9c9/trneEajyouJXkuXVU2V3RtK7PRnbcor2?=
 =?us-ascii?Q?Vge/OjgxPilL6egPF4Aht2Fxoc7LxwYlsmBkACPYN1l+C6BMeukOz34i759G?=
 =?us-ascii?Q?nR2dkT1osRx0nN7w0wOnm4kPTNl/WG4/kAXwUWavuSN1n8GSAJ86kntD5Jdt?=
 =?us-ascii?Q?sMj4GRK8imO6uUsNA2Y8c//tfneOckQ0vF0G5YNKXwO2nuy7JU8GVTzOjEiX?=
 =?us-ascii?Q?lmjzBXa9gAQ9b2/5j6knVVTVU+EDPmQHwDaGvdWcLKuNoUSAbZs9C3wX+8s1?=
 =?us-ascii?Q?FzDSugTQucoXWFNjdEnlaAwLW66VcG4RK7DEhxkVFrgBQGP223Z1On/y4m7H?=
 =?us-ascii?Q?gz5dg5+aBcymjhwLaxbHmyCnNDvCN57AVgLwLR7BXnmyWZNHXTt4t7/0T659?=
 =?us-ascii?Q?Vc/qjVFpNgj4nPUAtOgix0yIBkWcGBU75GsuuQALqEltr+UnM6G5uTa6eyRh?=
 =?us-ascii?Q?ugOsKdYoIkVx6eAaQ1JGNAqnMbvmPFtftqpnYp8CiKDDxmfqJINng99RZLNJ?=
 =?us-ascii?Q?V5tB7XOQU+Lp8YvFgowQDDezGEvym6TbSi88BaGGw4OTzmYawVHqaZ20Kw9Y?=
 =?us-ascii?Q?j5qI/DmaFxDHEUlmNnlqMRnA0pXYf1oAZFo1LkK1pN1NlVxVrAU9HFymV7nq?=
 =?us-ascii?Q?u5HyAxlEQBTGtyQXje8HvR90RN4mZ48zjIckilE8QpTgDRY+LTfnJ8ErRU+6?=
 =?us-ascii?Q?Bo0oTXV8RNH6y6jvUNfk5GDzbJU/0KruRUJCO4h2PTBdIVYvVXC8aaatnosO?=
 =?us-ascii?Q?Cuukfz9Dd6XnE4ovCXMgQrefrVm5rJyIbhTdEVa3snkRknKjfh8eSYguB+HD?=
 =?us-ascii?Q?JEx6WyJwj9zRRfK3KYOGvqYV4KxT0h1t+hVmsqm402IWflGShxqdxsPQ4nGt?=
 =?us-ascii?Q?JNkAxZUxAYauaQN+GncAxa2pxZc0/3Ll0R5HhvXoEvmuE6X5gOe6MmlcjD2g?=
 =?us-ascii?Q?Fc2ZQZMU1vy6p5NFFXIn5Bs1xCDvR/pVoassM1zmXvI4JVqnZCYSxgStM5/Y?=
 =?us-ascii?Q?3bob5LNNZuS04VAaEM0Ix3nirjMvTQeqTCrPv0R9uIF7co0gYWgBZsL7ADZi?=
 =?us-ascii?Q?LvbDjQ1S6rJsVL/ltKU6lXzO5xtyCGMhxvdhX7nFdkEke3gw8Ux9Es0PUiDV?=
 =?us-ascii?Q?bLhhc4ytNRocVDEThQVZ6flxOfRrTgcjr578xQ9vIZH/lj7SWNPSPYtqlqhF?=
 =?us-ascii?Q?A7igxKg6dr1zDagp5jOofZbMvNJxZ0+ECyyvvDiHTxRr2t28jRrfCaFcsLrD?=
 =?us-ascii?Q?UUXGMIJq26/jh/KDfa1R9BGY7bA+Af0i9ROQeZlY0fl1io+QOZKCP4+b0+6+?=
 =?us-ascii?Q?Ozn8PlJhjWSgNkdgMnxg9KWbQYKR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:55.9317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 510f1706-2708-4e21-f7a1-08dce3e63b83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009
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

This adds support for a 3x4 color transformation matrix.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. 1D curve colorop
4. 1D LUT
5. 1D curve colorop
6. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 50 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 10c7a37262ec..9861e2608d16 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1212,6 +1212,45 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }

+static int
+__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_property_blob *blob;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	int i = 0;
+
+	/* 3x4 matrix */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+		blob = colorop_state->data;
+		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;
+			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+			dc_plane_state->gamut_remap_matrix.enable_remap = true;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		} else
+			drm_warn(dev, "blob->length (%lu) isn't equal to drm_color_ctm_3x4 (%lu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1411,6 +1450,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;

+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index d2423b98da15..9152f0a771ef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -75,6 +75,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr

 	i++;

+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
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
2.46.2

