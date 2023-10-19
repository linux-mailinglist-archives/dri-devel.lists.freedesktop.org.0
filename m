Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C067D03DC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B610E56A;
	Thu, 19 Oct 2023 21:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CB910E55E;
 Thu, 19 Oct 2023 21:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFF6NSOkSIxxD2e86z8kAZ+yDycZb3s0o4H5GCXDMjI3DolRGJSczt+oRyWiyQO6ojHfotqcwGNFu6x9/TghMUcfS0RJZAaL1NCCKoLyAYHakeVOaCCNftWV9I223UlJzsorqoUepq5RHLm85E1FERHXbiPhbyDNWMr8sTJuBZHilpEqQEgM4mQrnI4qPou8zr2kkmGn0HiJBEhyAqwpkoTkw3mSOE9r7B0yRvcHwGYgGkMnqGzajoYFBwyT5E+BE19h+WYokHwv+8s6rzhNhJWSYLnWnuQ/kJL7g/NiefthfhicvdyuDODVwxs8KGOuwd00aeGsPsWmMtZgfRzNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EvYN6XvGkXknfyJzGpmQnPnHf752ScvE6yDm6rs2yc=;
 b=USw1INJx9+jGfR6uEXDqH4jplW3hutQdGqcyOPL23UYXf0WxqvX+QSrzcTINEiltj8VljoUsRZdu2paYSEKYbWe5kfIs5VRz380hjyA7w7uw8BBMDYdq3Fy9rgF2Jwf/8kiDPzhEVgIFBF/xW/KWRH+roGg+Q96vrs9rQBjClootYDx2aRy0uS1k0ETA1gzdelwQ+2z80fdtRtGisLR6otiNRD1wvintebqvXLm5u3mpiXheVy8HC2h31iTCjlUoqzEMPrc1BUl5gKwGanr4kwZSoYbJ3+hJxWz3+U8Oxw4RN7SZlVxf5NEKq008GG+WotPNm+RG8+YXyS0isC+9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EvYN6XvGkXknfyJzGpmQnPnHf752ScvE6yDm6rs2yc=;
 b=PbdiWOguM47vCKdVXXSkRonUa0gR5RgpGc9nu3QbKAO8pIEtkzgzUF4tYVL+QIkSWf1VyZM63FfiMxs73qPJrPg/l5+hMdYNVvk9ForlEQf/5BhcvwyuM9Qh7dOeVT16W5FytmttK0DMCSKS+SseEsFmxWSrgKGsvwGz5HZCtkg=
Received: from MN2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:23a::31)
 by DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Thu, 19 Oct
 2023 21:22:53 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::c8) by MN2PR03CA0026.outlook.office365.com
 (2603:10b6:208:23a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 21:22:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:46 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:22:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 15/17] drm/colorop: Add NEXT to colorop state print
Date: Thu, 19 Oct 2023 17:21:31 -0400
Message-ID: <20231019212133.245155-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|DM6PR12MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e370bae-b20f-4b1f-d797-08dbd0e98e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXSPs7ipnMUr30Yv9V+P80B6Xum1U5iubMsO5vsV+EKAahIP6oQsIDo/qrbvcQXaH/HnNY5O0NMzkGMjNG30S8h7nSxSIUvqAXwIocTNP6DN24pfrVU0bGVgLkgY1PMaDThP47XCsixMu3se8BF2W7ba/X/JRlbklu10x4UDkks7hOO7geBbl5a/AD5ZVSp1lbCFzei9qguRRkkANGYkoFOZDiu30NgyqPm1RCrgg+a1+z7fzRK7+ioNE6IxbcLuHaI8EqhQPusixxP8cHk9Csf3K7oFqf3uUYC8C0/HMasHBY7xzVmXsOhI0ahfykLA0ywy4MWVZPjlcOn0GxehtpislWKEiVtxuzZAk+J8jiUiJzqTYRAmoIJnwcf4qCf3vHkYFVm6Ni1DzkgEyHliCpsX2+ZLXtBuAzC4Ir4H6RfExOyPuLwb8hgufPpN1+mxkAPUe8nOK4k48O1gnUc/STHnZIOSVDFui2u9VjgXADLpgx1EUgFNe/A0WrmmVk93Fc1Txmdwpuq0kbROZBjmOvi4861iA1FYKdJLLkykpeeqMIzg6v8iA+tPu7dMPEgHgJoniGOwA5gJVYwhuBwkY5eNXeEFYSHo3Hac46XzTgfsWbHbRHWeLipHcYlGyLqOHZvcy8cNfqNwNs7G0eFSWCCytR6GuNi7DiILOuq9pEZ5ET4/uDqXIe07tKXbup8Oule2+W8JTFA+ObAa3LFrK6jr44F8y405pvwHaPpFPRrexjiZszJQsZJSCOSvmGwll7+97HdffgXtbRtBDuVQHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(41300700001)(6666004)(8676002)(2616005)(1076003)(70586007)(40480700001)(82740400003)(36860700001)(7696005)(316002)(478600001)(44832011)(86362001)(36756003)(356005)(81166007)(40460700003)(426003)(47076005)(7416002)(336012)(5660300002)(6916009)(4326008)(8936002)(70206006)(54906003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:53.5225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e370bae-b20f-4b1f-d797-08dbd0e98e41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/drm_atomic.c  |  1 +
 drivers/gpu/drm/drm_colorop.c | 42 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 781bd3aa1849..cfe9199a15d2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -803,6 +803,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
 	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", drm_colorop_get_next_property(colorop));
 }
 
 static void drm_atomic_plane_print_state(struct drm_printer *p,
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1afd5fbe8776..ff6f938cc28c 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -340,3 +340,45 @@ void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_color
 				      next->base.id);
 }
 EXPORT_SYMBOL(drm_colorop_set_next_property);
+
+/**
+ * drm_colorop_set_next_property - gets the next colorop ID
+ * @colorop: drm colorop
+ *
+ * Returns:
+ * The DRM object ID of the next colorop
+ */
+uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop)
+{
+	uint64_t next_id = 0;
+
+	if (!colorop->next_property)
+		return 0;
+
+	drm_object_property_get_value(&colorop->base,
+				      colorop->next_property,
+				      &next_id);
+
+	return (uint32_t) next_id;
+}
+EXPORT_SYMBOL(drm_colorop_get_next_property);
+
+
+/**
+ * drm_colorop_set_next_property - gets the next colorop ID
+ * @colorop: drm colorop
+ *
+ * Returns:
+ * The DRM object ID of the next colorop
+ */
+struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop)
+{
+	uint64_t next_id = drm_colorop_get_next_property(colorop);
+
+	if (!next_id)
+		return NULL;
+
+	return drm_colorop_find(colorop->dev, NULL, next_id);
+
+}
+EXPORT_SYMBOL(drm_colorop_get_next);
\ No newline at end of file
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 622a671d2458..2ba506a0ea4d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -228,6 +228,8 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop);
+struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop);
 
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.42.0

