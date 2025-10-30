Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69AC1E4BE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5643210EA4E;
	Thu, 30 Oct 2025 03:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ULV552tQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BD610EA4C;
 Thu, 30 Oct 2025 03:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khwDCroIDomHDWSiBwE1BXAEDAkHKAIEaK5/MVRNz+ZEaUVL9oIaSaqo0tMasve48JgwODqLhYZMO2lxd5AYpl17/Yxkb8EEwdCJyTGbyPhdfSB5vAai5r/1P79Hfn+13LzH7ZHhN+Mmef3d2HLMaqr3sMcF7IgjJQxhju0RsWAFWinoCI3JECs0w8nyWv5lzgL+mY5jQooLu82deZONaOq5PsVAybix/fTVW23tPdFf0Pue23soOcFy/Vbsp194dXx/8ZBxg8cGgJypJhoPx7buwd4BoU1C22HDxSDXOcK7mOFBj94+bfVjGig/p3ubBIVSaDK/WPMjmFqgy3fHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDP0vONkGm4Bjjwm2xgWVC50hf8zbizyHjAfD6E3DyA=;
 b=qo7g9RzuwNwgRptKFNnEjic5SswZXH14qov9wAUVXFmkWJbSE/1rmGfpZfTz4xLrkIB15Zv8lTJT44+soNVw0Slg92VKatrkgyDPz3dvUkzDxnyCjiACccZ1WXnH2Z1khmykBb4yKWPZG1af71oc2YdOF3JbS7G8XuBzL4zfLeLVpYyUGx6f8Ble9u71/SKjkBihe1Hfmj1CUQKJpFHAkR9o8vjoA+fMkhe/aC1DlYp9lb0APH7+jWOtkDEDx6ldSZCTq4gloAxyGUu07PWXmauk6nbHWY0wkTJeauD1J4nvRWftPjk9KcRORx1hd+NcC6uKctCHA3VNRRZ/eDwvCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDP0vONkGm4Bjjwm2xgWVC50hf8zbizyHjAfD6E3DyA=;
 b=ULV552tQeUdHGnJm4L1mfLKhS0TYmEKEj6LvhHG/DEO8AbjgVPM8F5uYWspSSMU0U98g5nWw1ty3i2Oq0N1PS1d+5wjWGVu/QxCzjMbkRfhrU2O2SbyJYlsEDskXoxaSB9Crr1L2bqZsnSsn8Mmx9WQNGpXGxfXjhjxykEJqM5w=
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:54:29 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::9c) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:54:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:54:25 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 39/49] drm/amd/display: add multiplier colorop
Date: Wed, 29 Oct 2025 21:42:44 -0600
Message-ID: <20251030034349.2309829-40-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c08133d-2751-4ab3-598a-08de176806b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOcNtvwwxb7Qu5gr9D/oMJmxbXl0fj5CC1HElB8Ij2BBuSVO7J7SYyJilKLr?=
 =?us-ascii?Q?3wSh/dNCKKTIuuN1J0kdqecceOO0MN+B7QCNzuEZNqcKts3zVd9hbv9JSaNV?=
 =?us-ascii?Q?IVI0yk0UtDlDEQmKWADAiYQF6qTT4jkFSY2hHy4sPEZMWWqoySxf6jfMTzPb?=
 =?us-ascii?Q?Y2wWpdNmBpN1i1uo2U809POU7OfuBBXzk0M9yz9CG65MhOXKFhv4XsyYcxPO?=
 =?us-ascii?Q?k49C/HosJ7/AkjqjkUpp9O5gRoH+CUvildVmY7QjoBNYkw84i4eHQnlIbbf6?=
 =?us-ascii?Q?Njd/WMjwwjB3rVj6HmeT6k3xh58YmilpRfoOEcgqCWrNBOCqUfhKl/yir3ab?=
 =?us-ascii?Q?6BRFiLFRMbpUSRHbDpQ95s97Nr0bZ4X94rwOTifSzdmNxeWSaTfwTadN03OG?=
 =?us-ascii?Q?raGvcBv7OCZsE37V4f4fVESmtp5Qs3vIQ9GSLVFvYF+1gpFrZmbFXDk+mufN?=
 =?us-ascii?Q?YcljQ7gg4LHY5WffB1oSblG1V8BXgtcZbNxZEQaYWrMeeip6PL0pi+d82Cx6?=
 =?us-ascii?Q?6sb3a5tumEbfLioNpnpuAiYsWFZwSlj09UAMhWOGhzcpYR2CIi0P5ULZwSf9?=
 =?us-ascii?Q?koPnRcEIA8rdEn++STHqoeaPWAPiGUfZwuBfQVUHROWfJyVMPVTr6hDerItA?=
 =?us-ascii?Q?c8Br84ceAOCi5MoNJ2ebxA2iGnDfzMgciqqTQ7wb1hSzlL6mexp6M3TCoP2O?=
 =?us-ascii?Q?dTT+dsqemmS61zrMG+H7PU9JDZmL7eCcPxOXI6iny8CGFzvzuPVvK2eKCx8u?=
 =?us-ascii?Q?TnbuNa9G691lVCHVVoouy/jrZ2FRf48TJF58QS+pPvY8mhMvf+z6VTYio17H?=
 =?us-ascii?Q?IkE9mxs2xVxg9w4D/tLRIfV93OiX3LvT46U6/+APQ0RFd4uYfvHric8Pb2sR?=
 =?us-ascii?Q?aaEa8QtgIF0F1+PsNKWKkObvEsQbPjwtjfbbkcK3CJ09O40V9gToppGaUvCN?=
 =?us-ascii?Q?6Z4URh/yK7nbFx+zD6qUVzh/JsABKX867ZH6Vt1foaHFN8NKkbsIgwfpBNMh?=
 =?us-ascii?Q?lbTk10GJHPrYq54wAv4EZ0dOV7GK9MBO8NhtPKm07xOClWQMCsm3Iho2H1h6?=
 =?us-ascii?Q?2t7dT+AuQnmjZMi8+3zJExaKcUThOfpjk7gs+/sl64NpX2YC8Tp6G2UZfgYL?=
 =?us-ascii?Q?4X5xfzaR68BXOTHjhW0PaXhKTirz2aP5wGNpUiqnhvECNVNgbRHz6Squz/8I?=
 =?us-ascii?Q?RoW/Hcs8IFMNdHLt/+x9Xr989z0Eqbw0AVKOuXr0aaOW2cm6ElIFp5ei0i0H?=
 =?us-ascii?Q?kfYBWrWtvzJzb9L1eC6qpctByT5+ba3uJi2I158Q+NAO/ttuc5nA07kqiN3O?=
 =?us-ascii?Q?iZIHiGaBvEasnmELoIH9uOp73N/t2rHnCVgYSV3UhQPdESBj4FCF3X8WZVgb?=
 =?us-ascii?Q?EmVF73ISlI1AABHOfmLQcvZP4wR7mkdAlWVdoJX6P1qNG4sjGuzgg2BOZeJp?=
 =?us-ascii?Q?FuCeZQ9pjJWtR3pmHw5qVTrINHslsQPdKWdHRMmFAZqbNrObCup+y8Uvvjfc?=
 =?us-ascii?Q?XVCWrDnqLGFam2a5Wi+lIqt/yp+pH0Afl6ou/EjAB7wS0O4Vnnu51xHi0I1l?=
 =?us-ascii?Q?anDh/4fpTTNCC8y97r4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:54:28.8983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c08133d-2751-4ab3-598a-08de176806b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
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
index 3e30e7fae0c3..2ec85a830788 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1419,6 +1419,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
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
@@ -1633,6 +1662,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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

