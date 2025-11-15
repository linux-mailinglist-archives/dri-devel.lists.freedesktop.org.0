Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5453C5FA92
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBF510EB95;
	Sat, 15 Nov 2025 00:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fAPewGI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8010EB79;
 Sat, 15 Nov 2025 00:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT2t/IiYVal7uv2UHhkDhBH7oS4XXi3OMrn/xoXfj0UP736P0Tx9vpbN4dRoewTDADgDXRhdNNLwbgZigFtCUADvmhtF1KONGXzJIhpqkUeNP7rcqhN+ulkRjfWg41PV38M19cSx0n2dxdK87/T0hPUysx9HkggqMFazZXW2W4R79PJLhMMecgAA6/5epouIKQ1+6HMGarr17os7ig0OZ1gqWnzs6xrdsxOXwSz8eQH+4bsF9RgQCWNl+5MqH5H2Q1m4Jb9cpSYt6GlpLCQOx7zP5ewSy9i9aGbc8h9Qs+O1k/rT2UtkTthxYn/RlizwPLDLaMHpo31DJjq+1ZOMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkLQGHhaFsn7Otpo0rfZ0/1MwkdW37M2eolC9EbSl9I=;
 b=blg2OvHfpd8MpG7xSXygEnKZs5kuW6kWB+wWkCl64N1DTKw5FewCZPHqm5XfqjliGCKQmuCXaU3Q4MbabHV+lRLfaPzu3314nEF2JpsLruaKJwtMJ8lQdZXMrsoBin3ueOju4CenIjp59Ii313qAZUFxH4QmTQjYApxRv/MHPRdycOZAIunZEiP5v24hVr6exYoRrkZiZ86zSAW10vuxC13h0dX7RHWDMRE9TKDRdPnm4aRbOCHpzje4PWH6UGfmwdaRLOjQoy5ugQpkfQZzuqB8rz8fHSQlus6VAwGPrVBaViHQLReK2EQWnjVkW3noUyHhfRXeuby3CjaymEHUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkLQGHhaFsn7Otpo0rfZ0/1MwkdW37M2eolC9EbSl9I=;
 b=fAPewGI9oQkk4JjcX1T+XicUvqUO5sq8fry8SHyepzmS5rC9AcIPROadSR/nrHYPj5ulMFjCFCiHio6iEI8veGwarZ8ggwBb7ZJlcoVIvhJHQt8d+9GUiN3OrCCOpZN6Zh4JtwcG4x8yQJO47RXvFXzro1QTGmucQQ3eJSZZxhU=
Received: from BYAPR08CA0061.namprd08.prod.outlook.com (2603:10b6:a03:117::38)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:05:56 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::57) by BYAPR08CA0061.outlook.office365.com
 (2603:10b6:a03:117::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:05:56 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:05:52 -0800
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
Subject: [PATCH V13 09/51] drm/colorop: Add atomic state print for drm_colorop
Date: Fri, 14 Nov 2025 17:01:34 -0700
Message-ID: <20251115000237.3561250-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: f25958f2-086c-49f2-fc5c-08de23dac008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RJAzLwE0e/jJ4z7cqr0Um6exH9SZrAuF1WniJucA1yDV1SyqDY/NRWmTdLVS?=
 =?us-ascii?Q?KRRXP+f/L2STYdACPcEQSUvyTKX0Vdg7yQe/vrVp4pZ0hCnPgBMXKM7WdxDk?=
 =?us-ascii?Q?mJZTnZ/A2JbWyrigTLIrCkdIltpMD7PJK5Kbwrq56Wewk829IAxj8N0ozWxd?=
 =?us-ascii?Q?Gnk9QsytSKGvYWl60ZoUolnuv60WaUAGguh2IP125u4RjNHsio+veL/b2uQg?=
 =?us-ascii?Q?zx3qbQT/yR+Bvb15i3SRJQZgbw6yerrkew8zio5NhEqFRW2ZTwNmBXXJSm/A?=
 =?us-ascii?Q?YaKrSoTT+STncU9UfnRpSvmCJ/Cc7WyY8suFtX8RcW8n6TsAUro0MZ4+lv/U?=
 =?us-ascii?Q?QXi5UgOcnr7BCoFvmMCVZNiGFEJw3u0JR+rVIlicAbG/amN8pQRRI4t+xVyc?=
 =?us-ascii?Q?dyaWHhwazMHLPKCjauxfdsBW3tD2yIG2dDEu65jEAIFOFXNGN65UQYK9sX1T?=
 =?us-ascii?Q?S/lYfkRV3JnrTLUsPcMUD9MtOa3IlPVcy/vB3qfQx6X7GUPzH91cyzH4Qmop?=
 =?us-ascii?Q?/+BakarvTwW8FAm8xkhDRb1rV8oERE89Q3oLqTeL1Oi4t1JZttp0vukfSIV9?=
 =?us-ascii?Q?eXpL7ay2iwP1cncBTR8Q0knPONz6UQ574Q5jUH6jDGFIIKdy/8pEvJTkMCgl?=
 =?us-ascii?Q?sCbpVx2ikgIuFLA1NmkqgWHwORY/c9QbYOtk/1KUAQbGFnfactsd/UskLPX9?=
 =?us-ascii?Q?uF7X7f/Q0w3whNDNTAN3+O/7RNY2aj+ElvrmVr8XBsVmA/a7LRE22jX0+jza?=
 =?us-ascii?Q?lss+kPIZgn9OXqI6DbCxnO3PfEfgM+W7vuEtllTnvGVJSLwVFByY2FC/P+jR?=
 =?us-ascii?Q?vVKA9seMQkrpd8HcFZH3H/vMnOijd9fznQStKseFdpmxDMJtQ/KCFiYxunsg?=
 =?us-ascii?Q?akS074SGiI/iwlYbTPqFeGVixtyh5CFx5QzpEJ3OZ0uNilVjTkwp7c0+2ZSa?=
 =?us-ascii?Q?RSwk2YAE7d2VXVuaFV9w0VBz4hw8lfMk2jIzlDlNy3aGT/E0OzjY1sLVfOwW?=
 =?us-ascii?Q?nKig+47Tlfc8RT47vOBE4l8wnfDlpqqKOm17iyL3tYXoLFjgsfL/0Akklpwz?=
 =?us-ascii?Q?5BYnn4kF2nG6oe7vNU2g2wrxZ4ugJOvFRbqlJl7PsIKq/QjXaLk88uFwSJge?=
 =?us-ascii?Q?2IPKKhBWqh6bCoFa0cVObJ/kITbpiLrUVOHP8ilLdvkwakNEQn6hJfjR4ocp?=
 =?us-ascii?Q?mvHhPut2rFT52CJvgg7PaBlFUqhW1uW63Vgtanu/S/AVdC8D3w7+HU1zArAb?=
 =?us-ascii?Q?wbA/uHtVZdEpvOnD0sjBYf9ZdhQCgCcsjAzoMuzN9cnLluLN103I3vkm2Dii?=
 =?us-ascii?Q?HJU2KJRQ7bH+FbsxB4tIz+jGLPkeiSey1eOkcJfmNvTIOvDJBXhtEvvuT7Sj?=
 =?us-ascii?Q?WOWVxIxDmjCg17IeaqvcEUVZmwja5LK3kPeTS+fY2ZQCGKdOhEeTdKAYVlAB?=
 =?us-ascii?Q?e4Wm/eZR+ffmYp6sYGG9I3WjUs1pHXyQbdqHMR9/9s0R9a2Oa07Z2bVSJUb6?=
 =?us-ascii?Q?IebIRNhOl0F0x/pNrSRkuqcCqHv13LCnPBtxouPh0RrVurjoD6c9mtpiqyzK?=
 =?us-ascii?Q?8OI9bS2qjFL8rkyrx+0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:05:56.3503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f25958f2-086c-49f2-fc5c-08de23dac008
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
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

Print atomic state for drm_colorop in debugfs

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cfd3acdeda75..3dacb13649c5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -781,6 +781,29 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+
+
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)
+{
+	struct drm_colorop *colorop = state->colorop;
+
+	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
+	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
+	drm_printf(p, "\tbypass=%u\n", state->bypass);
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	default:
+		break;
+	}
+
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -802,7 +825,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1913,6 +1937,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1922,6 +1947,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
 
+	list_for_each_entry(colorop, &config->colorop_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&colorop->plane->mutex, NULL);
+		drm_atomic_colorop_print_state(p, colorop->state);
+		if (take_locks)
+			drm_modeset_unlock(&colorop->plane->mutex);
+	}
+
 	list_for_each_entry(plane, &config->plane_list, head) {
 		if (take_locks)
 			drm_modeset_lock(&plane->mutex, NULL);
-- 
2.43.0

