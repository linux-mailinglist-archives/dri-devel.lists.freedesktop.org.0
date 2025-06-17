Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4F4ADC03F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EC910E4D5;
	Tue, 17 Jun 2025 04:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Slk/epqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6568610E4CA;
 Tue, 17 Jun 2025 04:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/VxM/uWxpEw9xsx5fenMP+UqvFG/05zqOUcJq/aiiAMTm7M0SmztwgZAWr7eNYgwV04Q7x3ssK1WMFP7yn9Ha6Jxmn64QnyyA3vblFTtOkVXOsPG8ppjOd8ZrCsucfz+zay2JAWWPncCH2MB3Q5hdVG2vr120kRWa/drsQr94bGlDEkrlRftEdFbIPDrcQngDBU3vQprb5sWZd/P+3CC7nCcpP8aX7c+Ts/7MmxViEHLKatcIIdP8V0nvteMCRVeZ/RCu/zxUP2z9t/+281qCCOvQONzscy44e1euORbQijMMy/oXsrGRJKgRimlaCrchvNwHojOPdN4m6we8NXaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVqbvDALOF/DUMHs0xbNxrBTY4On3kHTwei1eVNN4CA=;
 b=u3vF1L5M2JPCSMkkj1N88e6dAmW/hJyRfnmIol89p81++NMUqk6dCwkTtGVG7nUJitHK8F5CZBTW5obf//IFoELDRm1Zr8THkDknazcfItA/CMJ+VRZB/zO+9CjyUjpKsUyhMma/xHaNSpUvYdZG9RWza378/DrHtpjhZ41JV1d0DKzz0hpE3NlVHw2W656j3qNpX2/kfVSwd3XfmY+4b7nXDYinhxFLUAQ0dvG9jZh3+jrkT5HB3KtvdJKI7GZQ3wFUSi9YxRvmhDqUuQ0VrDaNGjsIMDtpsoKAAlsKlldIS9sRVuK+FzaQFL8RgRIo7ON26pIP1L4yFqL5F4mrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVqbvDALOF/DUMHs0xbNxrBTY4On3kHTwei1eVNN4CA=;
 b=Slk/epqWtOV4xBC/lyl8ItbIf/VOELHv+1QAItncwyQwDgOhxv5KcamEkeURqHhlq0DVqhXyKyOOMMxOgvt7t/vO0CaG2ChuZsy05GpyaXs+OpadQyKb7ZjTnKDmjQlA+vo5lIDY25whMnibmxWxgz1Wz4t1ZjPcpY1YsWRvyco=
Received: from SA9PR13CA0146.namprd13.prod.outlook.com (2603:10b6:806:27::31)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 04:20:19 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::25) by SA9PR13CA0146.outlook.office365.com
 (2603:10b6:806:27::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:20:19 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:20:16 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 09/46] drm/colorop: Add atomic state print for drm_colorop
Date: Mon, 16 Jun 2025 22:16:51 -0600
Message-ID: <20250617041746.2884343-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ee94da-ca1a-488c-8819-08ddad56454b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DI81yWWyVA09/DkKyYyxvKtn5w9Xg7iYVlmqBpmM0LZUBKpAhpkSexqr4nFB?=
 =?us-ascii?Q?Y1oOr4AS2cyjQU/KT3PRunchM6asx757DV+XMa3c+SRsQBp0mbZPrK9qyqxt?=
 =?us-ascii?Q?rKDMVKKV16j/0EK/8EZzKVtzPkIiPUIPlGrDIp99o/utKpGhv0r4xLEAdSdZ?=
 =?us-ascii?Q?88TIOiKSfCuNqgwPHkcd23fcOAPylVuQF9T560jjzy4vYMaKaRJMtwvtb7Xe?=
 =?us-ascii?Q?ZSiYd2MGhuAiDuVj3Y0SZeCYSGc7V18xVpWmKZw9nRIc2PQMS4krw0DomJ2L?=
 =?us-ascii?Q?bEJB/0yNgoSh8YZqzcASXnN1AlBuH45SDmCDPysNWn9H8ma5Kjh6T6w/E5+o?=
 =?us-ascii?Q?ePUWgCqXRZpJLwPzfNMpCZtGl67q/pUXENM1d7uSn0muoxxRjBiZQvUlanQM?=
 =?us-ascii?Q?DDvBitIAetA1XD6sbuk2FkHtSPrSgo1ltniB3b3oRIMLWfyivyRWGVtZOp7w?=
 =?us-ascii?Q?HKsfdcWH0rvoMh6F6Jx+sny3YW4skykD23h/pbkkX13dS6L2NZAMsLuZwdyn?=
 =?us-ascii?Q?wIKX5I0ejb8NueY9Kph3Jx8RsoKz3qmfmrTllX4TmfgbyIB7I4hLhviMbker?=
 =?us-ascii?Q?Nolx3Zoa6GXwIwzZLah98cT6q2YF9RQ88eCFfZ182xIFf0w1k33OaQ5Qiekq?=
 =?us-ascii?Q?EUdOihUYYWWyCowfJiQSaxz4NF7ERF3A27THOktZBKnKReW8Tv9g250JN2l9?=
 =?us-ascii?Q?uUm1znTBqnx4S87n4INtl8Bc/T4R5N6EvzSo54dE08Kclfqtlacg+XqF1CDK?=
 =?us-ascii?Q?WDbHUj1ViTHCcAhdu8Igjy04JackB1AtsP4CEQf4GjJBrkKL3F+zsSuM1oQ/?=
 =?us-ascii?Q?3kZzO1c3ftI1PypBoPjcMhMFCs5ByGeSV0FSlgwxkcTZ2xIUOXH1fC4TUyFr?=
 =?us-ascii?Q?ZkKO01BY0L3R8xtzdjXVmdRHUEsGd82xFYpz5TSlvbQCVJSNXzekE+xhL36g?=
 =?us-ascii?Q?LqeAjWvZ/lfcxqtyik8WEF+TC2p+mjudo6sIvMqKhxfp56BUpcKRI4dakBTr?=
 =?us-ascii?Q?3hkD4hmg7bSBvrGvHx+JjRN/BaasaldKePt8DWQvznvso3RPFtbznvu/T2SJ?=
 =?us-ascii?Q?Mjty7i7b3a0M9fEsG5gEXQpxNAhvli3JTynZYFaYS0DuMUhviTgyfXO6HxzD?=
 =?us-ascii?Q?1LeVW2Bty+o4vL1lu3RlK8ENcrbv5cTHdOE7Un5h9xpfcTiVmQzCsdUtZ7U/?=
 =?us-ascii?Q?rZ6U2xOsGhVqvj2GI56iH9+zW/Gu0pTt5nodR3L9PIPp2ZnRE83IbKk/QMBV?=
 =?us-ascii?Q?DgVuAaB4ijn3qrjmuNLgEllLdWx3fzQFUbBHkz14LDan9PvWnZVoj8v/Hhvx?=
 =?us-ascii?Q?rxxHgt/yKuqyCnqKvJfpHp+/aBB8lRUy6Q3JEJ7jx7RkCdKgGXAxuDX7lVri?=
 =?us-ascii?Q?UsQK12vzDT+6bZJPh9mIOjcC8QAjVqE+YNOq3g/1E6HPSIHOEHQXO5+5W5BL?=
 =?us-ascii?Q?i54/W+r/o2t53JNl6U+3GSjLizdy06TSCgQYF75cI65TznrRWUeHTABx7f+d?=
 =?us-ascii?Q?0oKIBPDdmLU+kusclTLsktmhE78RbcH69mPo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:20:19.7113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ee94da-ca1a-488c-8819-08ddad56454b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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
---
v8:
 - Add switch statement to print colorop type (Simon Ser)

v7:
 - Add a commit messages
 - Squash "drm/colorop: Add NEXT to colorop state print" (Simon Ser)

 drivers/gpu/drm/drm_atomic.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 886dc8b28abc..dc679c8b904e 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -777,6 +777,29 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
@@ -798,7 +821,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1903,6 +1927,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1912,6 +1937,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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

