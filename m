Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1357E5B62
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789BA10E7CA;
	Wed,  8 Nov 2023 16:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D1F10E7BA;
 Wed,  8 Nov 2023 16:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQzNscuxi9tuN9vXWA6a9PokfgY8+CsgIuuXU5ZYbxjPHMY+CfjUSnUhSxSL2L4aajLP2tRekphUidBH5d2Lcxrt0bi1sLHMOrZB40blxFGJvFhOLtIdUpWAA+YiOfn80xvV9ktsg+kjEEzyGaSbbjAcnks6oUaEtb48aTATOj3NqN2tbO1cw5NolUc+arv0i2PyFjOD2sr4voPaIaicjW7UPYnzQwkFDHaQwNowgGkLG11/fMeqTxcXQiO1748DcrnVOfrQwO8iUnF9DGnNoEt8XrqGM1Lk1GN8bM5uvXni+3emFRV0g6qXs5b8bfh8kGZqiJ9NZ3gz2tqVDnFZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pi8JYYiglStzR14jl/L7VEZPuH12EHJQt13mN5r6pbM=;
 b=RQIf6AwAjd/oE9Utnc4UCAwiZPF0DDfW8OtVPsKpFaKJb80txySkekkATuvXwgOmYkW6tneHQzMNU1O/pkivusgTctx+0bTyqV3n0v2DlPL4q4xvo5kuK0j96iieZ5Yjn6cxSNOS9xqXXsVxyYN9L4zqofldvUDgToXmnOLb3343+A0rTPtNxM7D6RmscLhPWBbqSiq8WItDwFuupdx2Pl2CB6doHVbesBzW7WAwbfIZgAY4Ak/5vetYxyxw/7lzpq8Zz0eJSzxm7JcMWn3d56irFCLsiwB0JynA/gUrJ9Gitm7k4JZKhqQYGSfCFKuJXSLhKAy0z4c8VuHZ6yIeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pi8JYYiglStzR14jl/L7VEZPuH12EHJQt13mN5r6pbM=;
 b=2eDKY6LGfRfFy2p5WturUc88uQHUcLlHvZIqzrwVUn8hkaviVd8Okl/DRU+71oe/4yakyPtK9C2Pg9L3cvzTPPD/oN9TOJ15YFb8K0B8Xeev17JIAnQtLXXDO3RUB4X6xTqqVUnLM7mFLFVTsR3OvPVAoQAbe8+9zWuFmFgAlq4=
Received: from BLAPR03CA0073.namprd03.prod.outlook.com (2603:10b6:208:329::18)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 16:37:59 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::d9) by BLAPR03CA0073.outlook.office365.com
 (2603:10b6:208:329::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:16 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:16 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 12/23] drm/colorop: Add atomic state print for
 drm_colorop
Date: Wed, 8 Nov 2023 11:36:31 -0500
Message-ID: <20231108163647.106853-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: faf5e8ae-0cda-493d-9fee-08dbe07911a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRmUTksyLNVMPrhVRNKWi3+MraMHUH0PNsinX2HEvGOHLflseY+hb88woq3V6TMy0CHq4Zx5L5IBDui15yCOdAn5bdpN0KoD13LaSqSfXSgn+KBe4SZsrAiMgqq4in9koDXW19Y1kScR8zORpJPNErvl2zWkNKZZe2ysM/O5Pb+SyMY308RkznuFEBMv4SyOPgX+o6sWeg9SAUHmCdPTYLUd4ip4idVRWGCehfpwB8p80nxZpljUDreS/xQVneNkuMZgNsTVEdDjtjG028ipB7zFYpXlnTnAkhA019oSN7p4smYXgaNfyWNGt9JvgYZLrYJeMM9oEwUJsIYe9sVUFkp0ms0lL2ovvuNvKG/qVNZFG1mDnuEpWkNESDfwPsw3ZkZifeT5M5qBdwY3bT6S1apLtHnvlUEnEC5hf1nNMCsknxZSyKOhu+ky8/aJcPyK7NaHelreJMaZ8j6wPJIC8LUr9qrbdAjTU21j4dpEhbtNa55kFEqZ+TirZ+Fvfu1qydzvC8zkKREI429JifsG7qOI17AU4ueaaeMXK1HGJqipj/A/Bf1goFX5zFYR6WH0jCTxRJjn8ZlnVsOGd6Mu5oj3r4vNHhSNmbvsWPBzWyQYKttyYJn04LjRFH9tFX/n6mxatHxWBa8G1uJnf8JPs1MxTymR9YTK8GncxPrh6Uf3ZmzgXA/04jISeV3a4Gxd/2ITTh/a0mONEd93DNpso0VlV+CTpKmdiEvsdW/eOB58GpkG4rXpZWzAcYMPQ4+KGEb2lXBTtr1PH7agmQ1DwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(40470700004)(46966006)(36840700001)(2906002)(40480700001)(8676002)(4326008)(8936002)(81166007)(86362001)(83380400001)(356005)(47076005)(36860700001)(5660300002)(41300700001)(40460700003)(336012)(426003)(82740400003)(44832011)(1076003)(2616005)(70206006)(316002)(70586007)(54906003)(6916009)(6666004)(26005)(450100002)(478600001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:59.4214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faf5e8ae-0cda-493d-9fee-08dbe07911a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h    |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 59e1797d1ca8..ccf26b034433 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -783,6 +783,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
@@ -803,6 +816,13 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+#if 0
+	drm_printf(p, "\tcolor-pipeline=%s\n",
+		   drm_get_color_pipeline_name(state->color_pipeline));
+#else
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
+#endif
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
@@ -1839,6 +1859,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1847,6 +1868,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index c44f076a0606..fbf7c0489fc8 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -226,6 +226,11 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+const char *drm_get_color_pipeline_name(struct drm_colorop *colorop);
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
 
-- 
2.42.1

