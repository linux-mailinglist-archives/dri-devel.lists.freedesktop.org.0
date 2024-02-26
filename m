Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394686827E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EDF10EFA5;
	Mon, 26 Feb 2024 21:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YntE/5tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66E210EEF5;
 Mon, 26 Feb 2024 21:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6rnSRsrPv92KqRmEGzuVSAMMe8N8JuR9uWv65wcvLgu+tJPhO5IP9yD89So6y3N+Vo8ssXnVfQVsldhceac6/plm7c4VqecKnQfIqs6F1Cpx3fk+/H4xWsfn6cKLqjLo5NSGj9OTZS+5LHASMcBVPipbu8W1PzZRLbm1F42k7wCw8Ed0b6RTKcvBwCHUNEQmHtu/sZOkktReZEIrEhfIkX7EJUMLUU1IrOOtETpKJ+ml7RlJAcHXqYHoPs8ZvJb7LiD3Rynm+zKVXK79eCPTCQqdK3O/lryZYxrCGeg25O6Yiw2VPW9lVGEQKKSU2QHIALf4Hcm5hfc8o8+AxhdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjlDu+F8XSl/kzrTSOE9IK/DCNWAhH/qsazqhLognAo=;
 b=JSlNs7/AIpDLhTIfDGzwQNH6QchoEtKn2jkbFP15oRHOBRuLw42F6PGfYvdi5jQgqqSOfaS92FbsDNZ4fmSPWa0JdJ255kIJ8lOIaXCb/xdxWrYtA/OmbqrdcMCu31XVogVPEWrOfNwSKDxeV3oAPFzUodua/m1do0Upeqg95MCzDbTwmwIDNTr+9CQEL4oasInURvrQbZS+w9devkUIFoxKrpW3ixsXTLsNljXd/dnAUXQqNZGNhYZiWJ+mpdtKE/G30zkmTFDSF6/3A7E7aO5RJEhKwht/2zYMktnHTMN6NbncTExjtW5BvdBkxX5iVIRUClyCLiIxluWd5bJBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjlDu+F8XSl/kzrTSOE9IK/DCNWAhH/qsazqhLognAo=;
 b=YntE/5tjyUS0R087kCQeM4TblCWi5R7nk2+Rpp/ceFJspS+VV6fM11LaaMtF1MpyEWCMzSmaaMdZdIxK0Pq4YxFhgOBRWy2Sd+K0Ubio5Qngg868pre19dVay4nHeuBY1RIvU9pHJn7t8GuiAtUIrZpRK4xy8LGE8RyOsuu9Hl4=
Received: from SJ0PR13CA0068.namprd13.prod.outlook.com (2603:10b6:a03:2c4::13)
 by CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:20 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::2f) by SJ0PR13CA0068.outlook.office365.com
 (2603:10b6:a03:2c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:14 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:14 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 14/42] drm/colorop: Add atomic state print for
 drm_colorop
Date: Mon, 26 Feb 2024 16:10:28 -0500
Message-ID: <20240226211100.100108-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CO6PR12MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 336f7f72-8059-46a8-7e7d-08dc370f7aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQ5NGOfD3dW4mrs2W+yH9UF3/6vhwPgzEQQsH7FQJqeqqqJCMbxkEN09GRQxP6TZNpEd11X9MQ2Qqc3VBjm95Lkw1hExkItpf/e9HMLiU6UphsGp1LHxN1NtCyyjEj3I6oQJOiDLDWTOWoq5OprsxPS8Si6DBpxa9v32Ypw4X9LVkzhvmpVew+NQU0Siga7HlEgED+S9ZwmtkhZqL0+Gapqa8BGvfP8PsBgIYMm7d8uvUuE6f/1IemWCSiOKgYr9fmW/PkkDWzg56gv8U1vCfAKORXyQKT0KQNXPjs7UCzYigO2RyWyH6fqEUsHBdBK1BlADsK9CihUZvJwqRt7WB+pya9HUmWIpeNcj+Epjpt/yd7X+iXSDDv3X6D2INb7075KBUfJyj8bNDnH6ezLPtCsaq4Eb0RFfPNMoZg23J7e8CnZPsQDsEbG+PkVwoT5JT33BOQ7JtT+CZRrr5u825sc+5KJs/UtUIjKIvQx80/lIzcsuk09bULt6/vUDzK63omAiHUDp1UKyv/e58HrpIjAnCWnkQic9GzNaGOmIo2ytwy/RM8P/8Qz1QMKyvwhfIUB7MlUfx5DM97gYVN5bpa+Hu/p8HZHFQNq5gtr6SbQQg98HR4OxItCwOV9z/RF34wA1S1L6FU+s3Fq1zg6UXduYp2D4/h4UvBUnQ7Xss7af8RIh2JtkBOLIeFHhg6/ttndh1JeQen/9+hMQkxKTNLmEJncu0gBzC9xF8PRHJgqo4ryYrq0XWUHskrHwuL26
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:20.4899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 336f7f72-8059-46a8-7e7d-08dc370f7aea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5444
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
 include/drm/drm_colorop.h    |  5 +++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b400e32c9d39..3645c36d63b3 100644
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
@@ -804,7 +817,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1840,6 +1854,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1849,6 +1864,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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
index 8060988b5892..fc9a28d138b8 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -231,6 +231,11 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+const char *drm_get_color_pipeline_name(struct drm_colorop *colorop);
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
 
-- 
2.44.0

