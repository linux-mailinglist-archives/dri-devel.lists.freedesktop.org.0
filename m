Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1215B27788
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5110EB56;
	Fri, 15 Aug 2025 04:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mWkHLAoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A5B10EB52;
 Fri, 15 Aug 2025 04:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De5QkD/WvSCP6NQbofyA8ZaeZW4/Bcm2YPh8OOeys2Z6s4Bab5MXI41p/fJ1LYjf6BkvlwKB7WmCQZbRnw0AnQqjLeGZsgBpK/uCl6mVIJ09i7K4eqUpOVmlX1uJr7n30bVdkpOLJeyKc/vZMSoVPC9pK/rFVPXtAqYIRHgH7oYNtvYzB38cWhCmCqGh9tnBlL4J4UO2v4NLnfQoenw/QkaqsSZ8gADVHczOuDtiOSW5aJtv1EGSZSWQP0Q8Ay4m/SCfm01+BOWCfy20u8GLQ7OFBzA4xJM6AFa4ibpMT+sdscwwegkk6iFkW5CWkuGioBPf5N93AxjyGXDyCVzFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dszQS5+Mfr+FSAASV2YKsZKfxQFh+kp0+mlIgdILGCA=;
 b=oe6uiHiKN7Spg0hE9AdpziD/DqeX6EsyjMwuwIdOj/h/SJDqNiziTfdtS9IjbfnL4aDtWr/K5nCth0KX3KEKRdko9tvrlF4/h4D9uoIptg8mynRx51kIw9oeHzBgh6WmI+0Hog7tngXqc4vrS6+FbkMVaA2zVeqrmEhB/mmtReOSEUq12orMLxPesWBdmeu9SM6nVjxWhfL9kcKDXkFNpYtQbRXO0hGXJnJ7RZbbfZ6vQiOdUXXqOQ19d2FqDpqET5ZDNskt9Muz9QxhJMyRkLoElu7J2BzXf2H6fe6vf869E4oOE5QdIX9IVUfuy81K6z682+zX64YIZc6/Mxu+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dszQS5+Mfr+FSAASV2YKsZKfxQFh+kp0+mlIgdILGCA=;
 b=mWkHLAoTz2r7nHRxEwAyUTjyBC6W+KRLjOmFW3m32en8S89i5QEMsfj9jGwsnh6HtVzIh81ya0oqyQNcUubp0tn4zyzTEMr8CCx8BnOfmyMwUwsUeAOJgcvBNatcy5gjd48HZxN8Gu3/2jDB65Z+TphqN8Q7scvE0yutwOnCllQ=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::618) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 04:01:03 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::e7) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 04:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:01:02 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:00:58 -0500
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
Subject: [PATCH V11 39/47] drm/amd/display: add multiplier colorop
Date: Thu, 14 Aug 2025 21:50:28 -0600
Message-ID: <20250815035047.3319284-40-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: ee39b080-1c47-41a0-f15c-08dddbb059cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FJMsGG1Jt9d5cSfu6A1OxMCRYCFIexVflbAJbWt403vHDwo2jqcSf5AYkmAV?=
 =?us-ascii?Q?tfvI0FtujPS5QtKFUuhQWE4Q38dJk+3E2odrct0KeE90nCyCxjZj6y+3qFlr?=
 =?us-ascii?Q?e9X3YDHmYHONFNxSVU3zI7ary3CgLAd/uZLg6fLEOl/Z1gtC6KVkPvS+woSW?=
 =?us-ascii?Q?OoJNGfStnjtyOIxLwBFaEMKYPflP0gyVOwlYdsG6G59nxzSm9qExMoND0yBl?=
 =?us-ascii?Q?CL2w2fq4m0pxrCyZdwg4e4LHNyCfo/8lM3IolmEkb/EWwvOsgECH1+RZ22nv?=
 =?us-ascii?Q?J35GvGyOpsbkZ9Tw/hZg8qEOW0eJQxFOH02J4O8qjQu5QEAnBsS3PlDvC4QS?=
 =?us-ascii?Q?HPsMfqyjzSfIvY2b1BQ2/kLGR2ET/8MFCP4b/nX7A2MvOlPZdyqO1CpLuDgN?=
 =?us-ascii?Q?DcZ54uhSGDsFwJr6aSyDRGMVpNe46oQm9Gi8QxQC7lacxSIHtCbfrwHcSUyC?=
 =?us-ascii?Q?4obYwZWSuFsnvdf8S0i5S+4xBn59DIDvUKVCHZSycTupdeAB8AxPrjOmoSUV?=
 =?us-ascii?Q?awPZEGwvdxL1jEHr8mJwvOzsHDmLLtgprsZPfItoZ4CTN1k3uq7CipH7e6x5?=
 =?us-ascii?Q?eaoTAHheJuA3K97vId9jVY9Lp0m+q7z//rumCUIb2wiWczEPKSeFws95fUoe?=
 =?us-ascii?Q?rqlgwnldCYePiiscFM+tb1VAazHue58+GsJbNiz2dWK6L3BBppHZa4i8sjQO?=
 =?us-ascii?Q?j0gzCtBQV1qckf2hEB9XXZLBgPKJfzCUJy7+Qqzk5qFo5Fpbw0lTdy8TQN+A?=
 =?us-ascii?Q?sP97YLFmjDXSUKbDLrz73c7X5kVC/awHWCqrfDSHFTX9XNwuwdHhxR0r4zvE?=
 =?us-ascii?Q?HWkfNErj9eopF87TziZbInh/M/2XTXqVBI9KUqTwBVSkdJoFmxT9Rts13WTI?=
 =?us-ascii?Q?bVeoemhlbyrgIsrnkjLzjvgiiBe+V+DeS/QfzjbOV0bA6Sbhq0n4FtSEBEkw?=
 =?us-ascii?Q?55XKUAlHjnfMa6do6DiQ7oe9ue+rbfBpKXCYFZFYMqyNvpwja71cX+Uk8zgJ?=
 =?us-ascii?Q?P5WOXanIXvZs8ak8EdpdmkeQ3YXj8d4F2UeUt+nIqwZYWB79lH2v2JPTPJKS?=
 =?us-ascii?Q?lkiiwkKCdGFSkm2Fb8R0asTCRQo/1BVRn8xIMxuToON5LJxY5qau8iR6xFEt?=
 =?us-ascii?Q?8bLOhQRU1DhpXUVRrKFm64ZBTepaIklPY1Q+BGqUBkh99qD4e0QqR7I8aGpu?=
 =?us-ascii?Q?VzhYaGRFn/kd+VkuFXWNokeZBPscr7kOETYX8a3VBY9O89dk7hmfKlXv0q67?=
 =?us-ascii?Q?xfALuroUh2KRxjYktKJ8qSQroVkLCeAF/kWJfAzwV0sud3LkQsBLVRDO9zyG?=
 =?us-ascii?Q?T2cqpmMbvbBnKhx5ir8sHe0V9XGZt4rRnxie+sqiCDwOiNNAvShs5lyw6A1o?=
 =?us-ascii?Q?jQfOjjXgICoUYJh7qBLQ4ayJZR/rIND2D6EJSKKvPjYK1IFC+BeqL4On9DXF?=
 =?us-ascii?Q?0wpwGAP//8uMdqFWE9YlkwelzXh0VvFfXqUL1yKeMh7ls3LyOmuK6MJq4E71?=
 =?us-ascii?Q?s3UndvXOlc7Ukxu2zn3yM8fqoH29JcA0sTKh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:01:02.3297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee39b080-1c47-41a0-f15c-08dddbb059cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v10:
 - Remove redundant DRM_ERROR(...)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 +++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ec640ad33f85..e28550e8994b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1379,6 +1379,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
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
@@ -1593,6 +1622,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index f2be75b9b073..888494d17509 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -89,6 +89,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
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

