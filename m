Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D9C5FA7D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CF410EB77;
	Sat, 15 Nov 2025 00:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vFMKhbNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010049.outbound.protection.outlook.com [52.101.85.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD0010EB77;
 Sat, 15 Nov 2025 00:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAZ4gOe6v7UQKFopcA73GXncy1W+TBkryp//0HizWWqSC6EaUadItRfu42z64K6ryWkJUj9dA4mCo7b796xPDoGP+Ux9TXRH0XdvLejDdEygym4NFhSKs0oYoqXTvfb9Hf9OLvvw5Oq0KawtJRRQFvAe5wLbmannMssu6eyk/2ko4LTnleog5gG/f5BQlezQWQYgTW7ouQkyJewWO40Dd54eLs87sA5fnWrF2zOjMBWJmsuCdH8HYr6urKfksJpfEkVHv0FL8KtwkpkkHdVsPFHsIEsAJnsnW7JULMFT7p/jGymMB3xRI1FX5JI84eod082iuFWRTfRB41cMvSgM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CU2Jv77UOWFvKXg0mtkaiLMvaxekG9CVzxffOpMy3w=;
 b=wWLahDhfJbYdnz5oVeBmeC464Lse0Vv0K6nlyjosLBQvslUuNMD7tI82fKKvsY15koq2VUHPl7uDuWoXZKqtatYaxhDCMnLWTgdgDu9RD7Nw1qZgr+ghCacqfb21ttz/eV53DElAtyEZXcm5xeapM4VxrrpFX6VbNP7vAU1aS+J0pNQqNsE5IFCD2hE78GLWNcP/fV1IhQq6B6HLp1UlX+54tUCsoCpY8LROJ2oEnRSAcEzoNeSuT4tk7qL9FVoHTBVUy17jLLUQdSjkqfBvhbxT4y9L7RqcCy6nIBjXpOcsx4vUfytEH94+ZBMO/VOAiU76S3S9xvjkXgGVmuTFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CU2Jv77UOWFvKXg0mtkaiLMvaxekG9CVzxffOpMy3w=;
 b=vFMKhbNGQ84eVNLlAGawz/IdyDFIQPgMfHa6a5xFAIvbN0ATAKsYQyFzBEsVNSo+P4Sqp85uvNTA3BVA+qE1pg19ZjOALd/VdrmIkvUz1rzEv74kMEMU4Q3XcLtt012LwEvqbVP3U+s1Krr9Fd2mapT3OFZKLv2FbzUnj8x5iwU=
Received: from MW4PR04CA0362.namprd04.prod.outlook.com (2603:10b6:303:81::7)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:05:18 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::39) by MW4PR04CA0362.outlook.office365.com
 (2603:10b6:303:81::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:05:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:05:09 -0800
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
Subject: [PATCH V13 06/51] drm/colorop: Add 1D Curve subtype
Date: Fri, 14 Nov 2025 17:01:31 -0700
Message-ID: <20251115000237.3561250-7-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: ced1a157-03ac-4ec1-4d34-08de23daa899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x61HJZ8Te1S5zlgqp8pMgrVx9bODN9OikwCU30HfHs8vHb2b7a6gmjlhMPVU?=
 =?us-ascii?Q?8IgWQ+zLYzy+3FeN01Ia/YMSG/KlhLPIQqpe7GXpqFbggjpWdTtrQ9Jx8juC?=
 =?us-ascii?Q?mHis8vYb0lqN0DAgXTTZc0iG6JE2p4x10LqLzYTJ8C4rSF0izqQAsC5DUyCX?=
 =?us-ascii?Q?A+0F2qnZO9+bveS0uPI40jfCI+IgtqTq5mYKhNDpAP3L1ksSRwS4uCsjIMkS?=
 =?us-ascii?Q?BaEF09EuTeX3qeA431Qvyodm8Giq2rFxmDbB/rTuAOTSut1dyLgiixjIERbS?=
 =?us-ascii?Q?nYDgHgudDGA2dO2bgMStNLDK2UrlhxOObXVbuDG7qz2M/iPfXe11iyTELL6g?=
 =?us-ascii?Q?VX7G9cfBBgvlppYXphe1354pan/OXo/IIF1Q7STv6MyVS4dtM3B4Qr34Jqep?=
 =?us-ascii?Q?+4OD0wa+V+DQaaTTD1RtBIBYAFG+cfZQXOGMq/hdW/pG6g7lovZPwvmxxjDz?=
 =?us-ascii?Q?RPAdYT+mJL2DAS40X9+duS/bGuNLGRpZmNS7yA1yOYVs8m13J9IHEsxArta+?=
 =?us-ascii?Q?KE2MHwxoBNo7b6xsS8E0xnq08C/zQ9hzoNBahEdKpagxDxYpe+nO9diuHGUE?=
 =?us-ascii?Q?L5XM3/lqu+XJ4HmWONcWqqxLWgZRootetMptYhiDLMsQZx41s3onc99Zd0J8?=
 =?us-ascii?Q?2to+4YHU+49dkf2O0Kw4xE9sN8I43DWWjjUS1KBY/MH6VzGc9faOmELkQXMv?=
 =?us-ascii?Q?kKkArlwgh3l3SDDbzWv2d70GGhYkEa/KzUfUiqnliYU5avoQcaBk2GP+GeKw?=
 =?us-ascii?Q?otMa2ugsUYNTfcnEO3zXgMVw51Ktm1JdBrk9rBDnDVQbhQcRpdJmzyI9ETpE?=
 =?us-ascii?Q?79iXF+9iwrq/7DIwGyPSU3128bKjqamEkg46O3Up5dQXmMPNHeVEC5Px5vTk?=
 =?us-ascii?Q?8v5RwZ/8K8RKucWh7kcWCB/+t95ahk4LFe1YpXymsHkGHXDVlVhRg6rhldZD?=
 =?us-ascii?Q?sbZmS6otnZ/KUMjLUhiE5CeWVzhZr6jXEhcNXtcV1AKRzJbpWkuX4k6fv7Pg?=
 =?us-ascii?Q?lhlhwrAem1CNz4G/STqpnPlAHFc8Uu/zr0f9cPsbKSrMybwOh68c3q3cdbxx?=
 =?us-ascii?Q?Ikgq22r7hHcXCl0G3F3ygLHeAIBgxuPC5cwF0WAMccmDgSsf9+B56AYWuE8U?=
 =?us-ascii?Q?9MtzjY6F+IFIzRMSJYMYZPYRqimjYSPYTXpH38ZLEyu1Oy/KC2zMU4wNV3aP?=
 =?us-ascii?Q?hiRMw6y+44lRmOzTy8qWhMu5B/xrZH2NgFzaESIQK5Vmn0hOV9SsYqfghbLI?=
 =?us-ascii?Q?fL2nuc0ICx47vLidmunfsdFodrHCoCtqFIcoDFhb12NTxikgxVf9GKLi9hAP?=
 =?us-ascii?Q?+3YMGJ3g5+GBz8M2+bgerQ2fs9puhEs5CTlNiFM6D/DwI0d7ISr353LFN4RB?=
 =?us-ascii?Q?ZpoX76wzas4ERko3qYQxtU8qOunoZGet2fYlTypJjWd3hVoJBknM8g54+7GP?=
 =?us-ascii?Q?+VsvSnIFXLKnhUSq7l2kWGQNSvXjazgCz0AdGDVrIuXuyoJTJdTZCgCFxlhV?=
 =?us-ascii?Q?9+5wmUsUYLcIZIgU6qZEKWynvwNXmuXlmtOYw2tdWaOiO1PG0scBAIBYOxOQ?=
 =?us-ascii?Q?ml2wH6FK3L3Cv/HfwRU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:05:17.0298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ced1a157-03ac-4ec1-4d34-08de23daa899
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

Add a new drm_colorop with DRM_COLOROP_1D_CURVE with two subtypes:
DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
V9: Specify function names by _plane_ (Chaitanya Kumar Borah)

v5:
 - Add drm_get_colorop_curve_1d_type_name in header
 - Add drm_colorop_init
 - Set default curve
 - Add kernel docs

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

 drivers/gpu/drm/drm_atomic_uapi.c |  18 ++--
 drivers/gpu/drm/drm_colorop.c     | 134 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  63 ++++++++++++++
 3 files changed, 210 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2e2269b2ed37..2d13614d7730 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -654,11 +654,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int
@@ -668,6 +674,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1459a28c7e7b..6fbc3c284d33 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -31,6 +31,123 @@
 
 #include "drm_crtc_internal.h"
 
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+};
+
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+
+/* Init Helpers */
+
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	int ret = 0;
+
+	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
+	if (ret)
+		return ret;
+
+	colorop->base.properties = &colorop->properties;
+	colorop->dev = dev;
+	colorop->type = type;
+	colorop->plane = plane;
+
+	list_add_tail(&colorop->head, &config->colorop_list);
+	colorop->index = config->num_colorop++;
+
+	/* add properties */
+
+	/* type */
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->type_property = prop;
+
+	drm_object_attach_property(&colorop->base,
+				   colorop->type_property,
+				   colorop->type);
+
+	return ret;
+}
+
+/**
+ * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_init enum values,
+ *                 created using BIT(curve_type) and combined with the OR '|'
+ *                 operator.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -70,7 +187,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
+	u64 val;
+
 	colorop_state->colorop = colorop;
+
+	if (colorop->curve_1d_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,
+						&val);
+		colorop_state->curve_1d_type = val;
+	}
 }
 
 /**
@@ -114,3 +240,11 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
 	return colorop_type_name[type];
 }
+
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 9c9698545f63..fa167e642e0d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -31,6 +31,42 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+
+/**
+ * enum drm_colorop_curve_1d_type - type of 1D curve
+ *
+ * Describes a 1D curve to be applied by the DRM_COLOROP_1D_CURVE colorop.
+ */
+enum drm_colorop_curve_1d_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	 *
+	 * enum string "sRGB EOTF"
+	 *
+	 * sRGB piece-wise electro-optical transfer function. Transfer
+	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
+	 * to H.273 TransferCharacteristics code point 13 with
+	 * MatrixCoefficients set to 0.
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+	 *
+	 * enum string "sRGB Inverse EOTF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_SRGB_EOTF
+	 */
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -46,6 +82,13 @@ struct drm_colorop_state {
 	 * information.
 	 */
 
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -127,6 +170,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -151,6 +202,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
@@ -191,4 +245,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
  */
 const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @type: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.43.0

