Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CC957642
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8937A10E43F;
	Mon, 19 Aug 2024 20:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HUxRqLVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B187B10E419;
 Mon, 19 Aug 2024 20:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJI/YCbF7wwvugZQlLPTbKmZKJOATX44HrQnkNnW2DdJ5Y68CAt7dT8b5TCQvSiQ8e3WeNEfdq2ax6tHn8YYabEKrn1jsID1tK44h5FQzjWBU5Tnd8Xxk/Gq4aE7O2ANGjMV/WUhsuV1jEX5R5frlQNrGs8UdJdZ4o4ZmrtmTU0KxPXD5O5PA7YO0T41X5S2T5BfNhUVzVUTQwVuOXNEzA0ccyjgz66UFEj0WUTC1r/bmmvpTLN0ddWcYRhgAtR335Qp4aFiVY7U5cxDwIBDeeFnIqwcZvusylby9kg2DmOcxo7E16IgNZ+dTREgw8tjaTg+iVEpFL/nsFhuxzYcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/wHRVL0OOAYUeF8Mhl+JQy4T5ApcAAIfiJSxt6OxZ4=;
 b=foIA4AcB9vlLEO83V2JMZVyOc6I0JxCXghzeWxX9I1ttXP00EqSgRnXJIqLn2rV97O9HCVPA+QTHMZvo0j3BoYsGlQT8sT4sTKbhdEVy2ENcX3UOAtDjQtKvfdEsTKR0MMoth3hg/Sl/FXuXBacoa+HmmI8erJXKgI+ckNMpkZpYu5dkvS++9oQeZDQusRQG+igr7YTznIAmw5MCg4bnxve8XqiMVzfwASPRE16mv4LMZs2oU9XO0u+UIh1k0c3k4jTzflRpbpN3itZMyYazQfQ8BpXZI8Hu0lUuka5fvS3XHkda58bL8nAUXFz/PD7ptiF7abpWPmW7X01z+653YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/wHRVL0OOAYUeF8Mhl+JQy4T5ApcAAIfiJSxt6OxZ4=;
 b=HUxRqLVs9hyWltN1cg8w/4eqky0H4mWjdy1S+jT5+YpsLIi7TkWS9jOAaQIJktuDGgVNAAqex1e8SEzpK9uAOlnmtG/sVaJaKZo8OQ5fSYLTTaOc/7xnn9xE56y8GZ84vnL+3Kb3tKzYJcouE0LeNwy744ZexRZf65FTo/TpK+o=
Received: from BN9PR03CA0659.namprd03.prod.outlook.com (2603:10b6:408:13b::34)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:44 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::8) by BN9PR03CA0659.outlook.office365.com
 (2603:10b6:408:13b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 38/44] drm/amd/display: add multiplier colorop
Date: Mon, 19 Aug 2024 16:57:05 -0400
Message-ID: <20240819205714.316380-39-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 2241e0e7-b803-48a1-18f5-08dcc091927d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bjQGzpd2zSCN+cg9Jrsud+tp91HaHf77LWLnZzqm0JMT/WcTG0T7U5Kq6Vnm?=
 =?us-ascii?Q?Cgn85R68BXzpDhnrV5MFdW9NrpNZqvz8oXmDomsTMmLd2eGwKpujJCbdwUkJ?=
 =?us-ascii?Q?6C9brHHHjJjQNbDbSOVg5DbOi75/KDeShg/h/UQ88lswu9AhrD1AE2428dDO?=
 =?us-ascii?Q?Rfw6KZgPF7k9NXrLp/IHRhznLPiYujzh2InSzkUGHexPrezlo/TqOHP87mI6?=
 =?us-ascii?Q?zdNvoNOGI87vtRPXhQxlpz7E/pHoLT1AkBBvklf/HzM5ooymr9pkRMl8Jabj?=
 =?us-ascii?Q?en/S3BNgAmz1GOTsfax6XNPcdICN38C91LuDgIb2KAPwZFCS0w3EaDtBi4h5?=
 =?us-ascii?Q?YH8UbJvqzdmtcKNAH5J9AwhOfdrrhZUGh2t6nYpNP2qIshfGljaZiXDR7+2T?=
 =?us-ascii?Q?U4MyTUV2WCRkztlRy6t5b+O5Wj9PtxgHhEwnGTnHx7vLBWyd7B9XG/KEzvSZ?=
 =?us-ascii?Q?/+zGuYM9LJLEsxFVmCROgR3TtfuzPeSatNe1+haNpDrJ8coXieWUsPGLA+c8?=
 =?us-ascii?Q?ZAMNjwkLForpQ99AiX/6Cx+7Who+lT5pSSVZv0KVWkkd6HFJrAO2ykGDyTcA?=
 =?us-ascii?Q?YbjUgGbUFqc2z0Jm++6zOUyumavUOIe+CKhgP3tUJLfBsm0EqfC/3mK/B3Tr?=
 =?us-ascii?Q?aZQCWr0MQ4IkVo8eUKGJWecDEmeXxMdZNmopD1gZGb+gJI5P5LiXrtqlCmau?=
 =?us-ascii?Q?eHEczsyDjP5ZHfJBh+LogLmSWFgI0P654N6QCY3SZ4Jd2BxiGDk59M9MX//M?=
 =?us-ascii?Q?HxQ6deowUxaUnnuUZHILff7+SwcIzr7tNP0j5B4g/tdH3B+jfpMq/KMhd/13?=
 =?us-ascii?Q?sk7e3ZYXOtw687EJXjDNCBajkZXI616zq2dNFdXe7dM77l1t5aHPbMiO+kae?=
 =?us-ascii?Q?5GQGqttM0GVqQ/lHTHcpdzqy0/KvgA2bm+Jkr8tIV08mbKu76mc2tVfT1Si9?=
 =?us-ascii?Q?RnpXKHbdT3qFnnRdajkZ8rTGcdSaKGKpBCK3FhhwEBlzX7P0tF/KBNl4hZXs?=
 =?us-ascii?Q?3ezknNLk+hNUTbaFRDrj6pRJnpN+znkujfPGmgRo402KEiDpv8BKMDGWCGk3?=
 =?us-ascii?Q?AjQS7HcRDPJCRvlPhpoMMGDP1vSzFktcqwDxbfRSLNcvQCbFt+e4GNnT+iFS?=
 =?us-ascii?Q?oFLE4rj+/qN7y4+qtvmm0ffUtoDnwThtXzXN6bSaEhPr4fp+Sv1fcBtWPqU7?=
 =?us-ascii?Q?bX5p9Y69fVElWB50fCpsLEI/99oJ03+iJqTvn4h7Di5XYulDCXFwr0S4A29s?=
 =?us-ascii?Q?p5TmHUnCbN9ylrH/FRPRGsxrLrIjRyhTFWxAQ5bIXfzpM3Qbu+Al9blJ9v8k?=
 =?us-ascii?Q?ysjGGa1SWapN9mc8uH9f/v+vkIB6Ha7qQ0MQpI07C+UEXl5o0apm9TGw+6bE?=
 =?us-ascii?Q?6iEclW5K2m2Pxj/LoxPcJ8DHXV1IWSg8/MFqJPh946wbA/a9EC1P+NMFEaG+?=
 =?us-ascii?Q?HP0ILtCisAKIgwt55jEOCSqwCPuzlNTT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:43.9605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2241e0e7-b803-48a1-18f5-08dcc091927d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429
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
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 +++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ea9bd287cddd..a14dc67dbbdf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1251,6 +1251,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
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
@@ -1461,6 +1490,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index ba42f1f6b620..b739d6cb3e6b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -84,6 +84,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	prev_op = op;
 
+	/* Multiplier */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_mult_init(dev, op, plane);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
 	/* 1D curve - SHAPER TF */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
-- 
2.46.0

