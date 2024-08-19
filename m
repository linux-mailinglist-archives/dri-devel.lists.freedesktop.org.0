Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6F09575F8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E74D10E393;
	Mon, 19 Aug 2024 20:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eXj5QzXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A260610E389;
 Mon, 19 Aug 2024 20:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMgHI98ai+UZWs3AlzbVltzXMj0/7toc3rvj+lYkPNTj1jAqRf7Oi7//2+6sQ2us1wsQlaz20DCQc1KxWdYFI51wZn3Zy1O17k2RklXbnG3+MHUyMozhpMTJF5a0Vu6CTAsyUyLniDwsx786N1sgn24CNyRZ9QlptiWYc680puCO2odJBblB6hnPNB5v8HiOpelo5ouwnyZ2LNUy6pq/jU0DH6zEQggtIE52VFJPLWFTpxKVFVRiBHBSnt6jKvbPul234Oa7heYsqe5FPqCBFI9X9t0YoZQIb9XriWKO9SC1Y0GhrCBpF1OOn5HaT++YGujeD6PHYlFq/xZyNiaaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1ZP76XQOOfFYtLmCJK6IajMbcBgGLAT8bfg5aj7guc=;
 b=rU8KFiC0SisyVOUoabSR70wbocRl0wWCaZpjbuVkiqKU3lb+5QxDLqGl0UWVy+emgM/92xpSsXzVPR8/akC5K1TdvqKXVPSTj6v05eIWxzs28/VJvW1ybdiCKIbGWqW7rqn0S88Q7JF4HZ+uKs/FXo0xudo9TIt7aMRIqFtN8vDIiXtTvGNPga2Of2c1INxLSwPwwKVsjVY0QCZTLUZTuGhNi62jBGT/TYjPCFnpi+HQtnyGxWYCz5EpwVmco+7z2Kp/wucJgmdgvZtmsK1Q+ElRZSPVUfx95X0GBjiXUD5XrrmONpxd1uPhPfItuHJfoZ2mIJOkriuFP6B81BMpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1ZP76XQOOfFYtLmCJK6IajMbcBgGLAT8bfg5aj7guc=;
 b=eXj5QzXVukM+GWNsKH9kdVZ2WasXSPm4RLy3UvvISQ0aMCxUkH3uBZ1u2az7CFph5UxkcG+OWr1XohXgUDuJga7HQNVmESg1Q5Ta7KPTU0qCFub+F7cLV/1RXrP8VO1XNtHz0pa3q7ve/sd2vPDB/ZmICtWrX+OBRnBSAwH8q4s=
Received: from MN2PR17CA0010.namprd17.prod.outlook.com (2603:10b6:208:15e::23)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:28 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::16) by MN2PR17CA0010.outlook.office365.com
 (2603:10b6:208:15e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:25 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 11/44] drm/colorop: Add atomic state print for drm_colorop
Date: Mon, 19 Aug 2024 16:56:38 -0400
Message-ID: <20240819205714.316380-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 8975597c-5b18-49da-e078-08dcc0918980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tARhrjRAgOvh2pVxrK2fMAvnGzos+fG6tE4m/PX1Ii2aH7C5oYS3tytv6jQ2?=
 =?us-ascii?Q?vfGapWHpv3r41H2nAch+vd37t/iPwW+TOObAOCT2VpDrEsCMToleRAt0xqH9?=
 =?us-ascii?Q?Q/yX3ex00bImztU73xiwYNLFS/DbYMwnDsDq+2Ms5o6/3aVe625MsmGPc8Xg?=
 =?us-ascii?Q?uk4368N0yGdwpgdqZNcHQYi1bvto/ji4MiwAnCBQ05ZAvra6igOEGYpL5MUL?=
 =?us-ascii?Q?OzzawYfScRZv6ZqnCVLsd+ZclAhTeC6esqf5uSZEhKqqtsXeRKXsG5yq48VP?=
 =?us-ascii?Q?MYhKJtFVMQwOBCbxmjTJgW7XBCzwes2Du6G8kcjUo6epp2CJ1LNXEjw/px9x?=
 =?us-ascii?Q?gtwGrHIKZ0L7/c1qXemaYdsY4ooNDnyVmTjBB6hPo2fW3rGp9jyq7Ef85yoW?=
 =?us-ascii?Q?mVD6lYVbfBRdKEKi5+1mEIzDAET1AyW5v23oD+eMOFiO44vqsXJ2uN8DvGjp?=
 =?us-ascii?Q?RfBm1vwTIaZAj4S3/EqSxRNVtaQc6b5xCfAY/3rP3rIjOCXcmxkl+5EglX2V?=
 =?us-ascii?Q?6zpdPybkxN3L0NjnburkYb/bEy52GyFglNnwBpVB/YAI3u0Wb6KNfe9WqXST?=
 =?us-ascii?Q?ODjZC9n5M6+h4v9Qh0zpZQAdCFVAqg5SxskQYV2dzLUKYN6v/yNrELis8cqs?=
 =?us-ascii?Q?P02lRojs/4lr49WtxtjlUTtgR8z2LV7FTDa3LbOGTHhkuYY4l3nNR3dp9PrB?=
 =?us-ascii?Q?kfne626obZBlNCQrwAyJP2enCUBHrFfiDcCjMEyfDIrIYgbUKQRv0PdQtHp3?=
 =?us-ascii?Q?rY//5rMHrjCEAklcsJa2eVFp1urosavYWgCDPV45AWYmQ3S1eGDzwvod2bP7?=
 =?us-ascii?Q?lc867zP7V2B6CX0GpkkxiKME5dsKOBXqUvDaFCys92tbXIKyFI+Obo57snj5?=
 =?us-ascii?Q?gpXDT+PkblZi9g7LGd0FJiafLBgvTfjiX+tZtc/u+QLzrT3GfmVOBWYtKO0c?=
 =?us-ascii?Q?gb1VHceKNU2Nvg3Zj7MXTQH+WHT/bCS2lol7LT2yINxkz87KDtwUzY8AU6Ac?=
 =?us-ascii?Q?UAlK4ex627GFA1f+CvzmKYuyR3+9XwPwJ9v2TXkwRcZTIapCHmrh4rvqnFXh?=
 =?us-ascii?Q?uT5NKZM0f7QS+/RVZNPAs0yjZe2elVyTH0AUZpD4CAfOMFs7IGwfZuwE3+Fe?=
 =?us-ascii?Q?p5iEutRDfxBTkjsbjp65HhbH00PjWfit/u29wsmSx9phUU8Mh+HxTP/b3WJ7?=
 =?us-ascii?Q?vKSbxcm6Rj1nRz3hyVZCmNmPnRUvIQEztbAX8ah6mFD/fTJbzwRP2mdvKc7h?=
 =?us-ascii?Q?u0VUGzS+atJ7pcUiErHzE3CYNwTxRj+C24+GJuoPz2/MoMz7rkpV4TLJ0NRM?=
 =?us-ascii?Q?FdzjH4SyTIZ+bj6BHjhZStxi2TsWhYzalsA85m49SrUlFLtajiXR4DPNcBRk?=
 =?us-ascii?Q?Nt23dmh71Q5ew6J8sBbGv8PNyHelahcuskAl1OXf3FW6UTPhT8aZzE//de6L?=
 =?us-ascii?Q?99vtYSga484=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:28.8858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8975597c-5b18-49da-e078-08dcc0918980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b09db9835e1f..096460d38545 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -780,6 +780,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
+	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -801,7 +814,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1848,6 +1862,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1857,6 +1872,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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
2.46.0

