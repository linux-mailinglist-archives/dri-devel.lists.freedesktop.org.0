Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74653AA4026
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642DC10E247;
	Wed, 30 Apr 2025 01:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G0oIJ7Rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59510E23E;
 Wed, 30 Apr 2025 01:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmlAJPPIC0hJrw2u+BMasyd6r01mTNkNfvATnfNwrf5Vxb2Zj+4rz97Cr3z8zWrzxZ7Yq1hr9OOs+5XdJu2eGSh2BKxBmhmTCf1cpVWxlINcTxgHRhLf+BX6Wkfcr7Ra4Luqfioi4pfnzBxCd3BG7pfIkf4CZAC6bQGwQUI2SG4ladhdEBu42U3v7TeRvsW3vB1K9U9OuFniE9wIvKx8V+xfXVmODnzokXk58xAHLzncbmb+gfmFXdAz+l+YgPQSQ0jzGUaNnb1lvzTEzhP/SQdj+Urc/9stXMzfjji/mWNNM0gccchmWeRvoLxgIxefY+/z++OgEh7VPkLPZP645A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//vZkaQ04vkrsRftfDNNWW1DuniatIeXyY3WRI4G2ws=;
 b=sWlYriXGIF/511G4/QzPjQGRnHEo2LVTB8RmDci5tsXWvoio91Yk+hPthiq4XwRAPL2OrXhhD0jt9gFqOrWnyBGw1EDcv5aGgY6X+4jjTZQJcQ/6lSwGtURcWfhdlzImK1Ltls1/yW+RJZEl2mG+LfIaCr9ZnHiQXws20KXz3y9yU7U5XNxMWKwkhGVwyPfCVx9pcrB+7AaJxwzgGPhx5uWCq+B822/Tg33vAvdquep7J5T/hlwgDq36ym/28HIfAz8xE9+dLdfynvC8q401v5/R+C2c9La4BhJTCgjwxJLBYAJxoJsZwnCRt9b4nr9UkKvTUePRnaG/zblXC+f8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//vZkaQ04vkrsRftfDNNWW1DuniatIeXyY3WRI4G2ws=;
 b=G0oIJ7RnOq7AJa4Kax1Eoq+0ZmRvd7kxe3lJB2hIx26hevQSBbkN3+78lo2+kIVU4ePOUNNBBN59OmMb43Um0MfEw9qcTBmjVGhrW8h6bnn6yxzcgMZ28jqR0u8L9d93ml5Ap3ygOhtFGv0qy8L1YiriUWM3NUjPPi9Ac6jz6PQ=
Received: from MW4PR03CA0232.namprd03.prod.outlook.com (2603:10b6:303:b9::27)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:13:08 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::d4) by MW4PR03CA0232.outlook.office365.com
 (2603:10b6:303:b9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:13:07 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:13:03 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 05/43] drm/colorop: Add TYPE property
Date: Tue, 29 Apr 2025 19:10:35 -0600
Message-ID: <20250430011115.223996-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509f7b7-8996-41f5-1ad8-08dd87842ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3DaPRFAtvZZkikon2wJBnIWkmwS5VogD7eO7MXcCQLJXsLcY2XQQNGpSgKaK?=
 =?us-ascii?Q?eK01ZS9NNeQU5YZccRd+6UvsmNWYQqxInd/ca0jX8iL51CDkHIsFXUmKE10W?=
 =?us-ascii?Q?p2D/Sk4ZldgfeFzPeVizUJbkI+gIof7ocFcXOyJoi45tsOG4H4dG0DmPMOXd?=
 =?us-ascii?Q?m6ROFAeZhY55LvizV8k5BzibY83+I0v3vyr42X13kBJoJ4dB/YjGzi12N6kN?=
 =?us-ascii?Q?8wEoFBgyGR6vUo3gGDDUAWpYkzd5Zj6ZR/11OaUfMkp3Hjb8sqxmugqsn3XR?=
 =?us-ascii?Q?anf7muR0JtX9ztpqZnIkRImCimcXRSu8czipd/LHLDT3YH4u2G2HUC9dJ6m3?=
 =?us-ascii?Q?QaODuPJ9BzuTIFzLPUL9s6Sm7GSTpv+m3GSKc3TIK0BUQHAVXABxn3ONAQ5x?=
 =?us-ascii?Q?+RbJ5X/KYtuDSyvhEfSER8AaqIBSDm/GHJR91u0V43OxQpS/hdQJ4MMkIEgP?=
 =?us-ascii?Q?gWe1zEmj02NjmzFADIturUsEmtSD1zKN0sxjvgNr0nPgelYlN2wuo4aclTK4?=
 =?us-ascii?Q?YkwAFPnHYMH1nAmtjT3wpisWfdHDYdbvvInakG2gPMhG06ENgLBBVfMsA7RR?=
 =?us-ascii?Q?3741qZ8oNhzeH5bhRIJS1pOrGyPsI9zW1Lr2lTEOl0Vlh+f7FR2qw1vM8b3j?=
 =?us-ascii?Q?OVs5RXUltzezibDK0h3lg0qTjptO+4p+9zARVeJBxwP86QDkEf5L7gyV6SOL?=
 =?us-ascii?Q?JR8IyOWmszQq8p5gRLUJ89ABCcfJTTfA8Sm3SenpmUVpDhnC/ZX+RU/8B6a+?=
 =?us-ascii?Q?7/CZ3uPZqlsvpYmH7p7EpTOkW9iJbhXZcJKjCRJaoa+EpN4sLyzy8uSl+I/q?=
 =?us-ascii?Q?2mULgWf7XxqNql8sa0reOrZykFplmYcSFYf4zFcZQa4Lfv1Yt8b3aiB8zyVo?=
 =?us-ascii?Q?u5OPoUtmRkpOv1QprVuziwd3iwaLmiW71nSPwFbwtTciSuWNp+lvST239BgK?=
 =?us-ascii?Q?Jb1tgkO+qyNhwisJj+1iTxA2Q5snAB1EO5zANJNPR8D64rBgI0B00L3/GouX?=
 =?us-ascii?Q?o88jpVi6iCzapzwie5prksY6Vu5xhG1ZxnUQvDbx0xBJoZbPBSawNKT9F0vq?=
 =?us-ascii?Q?JPJY9EV++7Va8eThHTDXGwPGc89vivzubEWmh7GJwpheiGqRwZtceMr/DWVG?=
 =?us-ascii?Q?3Gi2qIWOiN+Eus8b65s42Ui2ETS12D+ld7QxCBKYCCXF0i/zskBTbNiGtix8?=
 =?us-ascii?Q?3z2kagHIfuRaY1263EVfYDtm4u5GHXyWwmTWlFWKLsAEY/HpTlky+yRPOgo4?=
 =?us-ascii?Q?AJOYn2bQN98CMRfUBbJDLGbAFsASvEjNoQ4aGsyFd4N0uWoRdRouheeqP1rL?=
 =?us-ascii?Q?5tP7Lh7+b6cTTpPEXW9NWuzMXr/ox86m2f5Sl0kTw3Y6wPTSJuxz+fsF0Fdm?=
 =?us-ascii?Q?fYgiWr8LO3Fjw/8w6QRxNXrilAQu0PHOteIPKGlyN0eOlhzQyBOuZbJIflaM?=
 =?us-ascii?Q?/mvyXrwT2IRV7mjNeBQbKwZtTGV+RGhaTQk8T5Acznmu1kA/Ep3vI+++mgvA?=
 =?us-ascii?Q?8sXh+Kj5bAY+41msBmHYTpdg6LtYBpZZtm2Q?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:13:07.7711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509f7b7-8996-41f5-1ad8-08dd87842ab6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v6:
 - fix doc typo (Alex Hung)

v5:
 - Add drm_get_colorop_type_name in header
 - Add kernel docs

v4:
 - Use enum property for TYPE (Pekka)

v3:
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - Fix drm_get_colorop_type_name description

 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++-
 drivers/gpu/drm/drm_colorop.c     | 12 ++++++++++++
 include/drm/drm_colorop.h         | 23 +++++++++++++++++++++++
 include/uapi/drm/drm_mode.h       | 19 +++++++++++++++++++
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 20d6393ec72c..886dc8b28abc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -631,8 +631,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 10e625c17f90..358a95065459 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -661,7 +661,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		const struct drm_colorop_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	return -EINVAL;
+	if (property == colorop->type_property) {
+		*val = colorop->type;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int drm_atomic_set_writeback_fb_for_connector(
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index d215e22c9d20..1459a28c7e7b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -102,3 +102,15 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 	if (colorop->state)
 		__drm_colorop_reset(colorop, colorop->state);
 }
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+};
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 008665d2d960..9c9698545f63 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -112,6 +112,21 @@ struct drm_colorop {
 	/** @properties: property tracking for this colorop */
 	struct drm_object_properties properties;
 
+	/**
+	 * @type:
+	 *
+	 * Read-only
+	 * Type of color operation
+	 */
+	enum drm_colorop_type type;
+
+	/**
+	 * @type_property:
+	 *
+	 * Read-only "TYPE" property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -167,5 +182,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 
 #endif /* __DRM_COLOROP_H__ */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d49cded6c568..ea6d88f683cd 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,25 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * enum string "1D Curve"
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via the CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

