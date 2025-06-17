Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E248AADC035
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC1D10E4C2;
	Tue, 17 Jun 2025 04:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mKWzlrgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761DE10E4BF;
 Tue, 17 Jun 2025 04:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocPCcfi0C+9ZFiUdmp1EKeHlVnM6YcoORljdARCaA5W6eMih14fK7+Hup1xbN8pG/qprY6DSOt/xmEe+p7sE64sTqZoUiNbEUzRbYhcsK7cqVOrhlD5r5pRplDcYKNiVFSF3QsHzWMbXmUTnFAZPi3HoTZOSs6bToNjujlLNryopqM76JsapozRbsUTEzi6pAawAj1qVE+xU4x9ach/d18QC2DpdqfFcTsCIyqjYhETSVRxvGzvRQhBt4SByc8irv+n39UvZ9yjVHjXGyI5G3NXG/TLRqfJI1/EVXHdeE3t0+vRhnMWweeHcQxlDjFvJu4VGu4zz9IDw7WGMnc/0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmT4K4U8mnbQ8FtNdhSJJ2QxhgJFIIaSpx0rxHaZ1js=;
 b=f6ZNyEHckSAYN3HcacmTT2/LnGPouecnqoKClaDLHHAMSIMlTFVnjA+Le3HuK8R09IQPLye49I6/TkdzlUmqeXtwVHRL/MXgLihHhG9bmINDjjpdvddeRiTHmuWhOOKSiGkvY01HxihzQ1EB7Hzc0+Rk5coaagoORVNPQaWrlC9i1HfYKBggei6258YmT6fSu4hsviDd6BezAX7jnYDQx9K4GZlx3QRRJ9x65aULi9lNhJIrm6dwv1kthDFfPeC+48gEG//tIAtBxIbsPx1KDE4c+5yWRBK5Up/d66bQSW6JOZO+RCqbvqLYcowxKkaU54WBAa3I/2uqQK8MA6bq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmT4K4U8mnbQ8FtNdhSJJ2QxhgJFIIaSpx0rxHaZ1js=;
 b=mKWzlrgoz0tQ1Vp1HMeARdt8o+Rxu7/DH9uasAbnfVIzRRwsMd6IRx+/hamRlgA+o/A1W/VYZLYAgLXc+ukJQhSlBpiREMPXjRV5w85HIVL3p/7fOQkERhPgVQ7pMXiJQ+hSR7buxbYP1fGWf0OXJDqhxhId5mTDz4GpwLJP8qU=
Received: from SN4PR0501CA0050.namprd05.prod.outlook.com
 (2603:10b6:803:41::27) by MW4PR12MB5668.namprd12.prod.outlook.com
 (2603:10b6:303:16b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 17 Jun
 2025 04:19:33 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::8b) by SN4PR0501CA0050.outlook.office365.com
 (2603:10b6:803:41::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.17 via Frontend Transport; Tue,
 17 Jun 2025 04:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:19:32 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:19:18 -0500
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
Subject: [PATCH V10 05/46] drm/colorop: Add TYPE property
Date: Mon, 16 Jun 2025 22:16:47 -0600
Message-ID: <20250617041746.2884343-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8282b17e-7117-421f-57c0-08ddad56296b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9VluLlvcxibq2ZXlQFa7rXB3TnPJAAi0uFXFpEqvwgTy48xcD/rkkX8gTs2Q?=
 =?us-ascii?Q?MagbUQvNvp87GqNNFHsuvf4unx6S6zyKu/tfkAjjUb6rtDkiiSlB82qCfGt1?=
 =?us-ascii?Q?htFZfIg5e6YiMkyX8Vle2k1sePkk+l6FaHfUeHy8yU44U8QTHoEF0CoF1ZQ1?=
 =?us-ascii?Q?6mhotTrGFDBRUBwmzVf4//gQjqBq6IN5nREvRjLgRnVyyOLvs8e7hVPkHQly?=
 =?us-ascii?Q?gLxTo96DmCI6GMCRk+gvkk6onF6tpgOuCV2sg3OKbdEGN/KugfCXoLSS8vRZ?=
 =?us-ascii?Q?GBLju8mWy4OBaZGXLJM/P4kOV3fyhKnWT+d5lmsJIGmi7p45npIwaprXcase?=
 =?us-ascii?Q?NbZ9FaqOwFAp4LaOJEul4AWSPfS/CUdSNVbAeZRdBI/JhdwsSorhiPTlYZtN?=
 =?us-ascii?Q?LVY4B8xQCk1zWzBSM4dPaK6qec+VXUAO2VEipSrL3TIc+e2uWimSJr6yQGE7?=
 =?us-ascii?Q?9KNv6gI+nZYHrwjGgfqRcV86Dj1AvxNLvlJWQIscvdIcU3C/ZQV+yLMaaxyC?=
 =?us-ascii?Q?HOJyQhn2jvU/ETRDWL93RixZ0J1wX33nYE4lqfqjp851obuTovl2hNVj+rYQ?=
 =?us-ascii?Q?ErycZR3KVBpBgFk1T7KJN+O7D945n+/VesDo/Kdwd/d77WTvynVocQWs3fUM?=
 =?us-ascii?Q?4fkVozvYaJOzTsvgs1672SA3RKWAcD6SqniNnFTBiMVdJXFGM3UPa6IwWsQn?=
 =?us-ascii?Q?mR6UkRrrQ1XGybo6s8vP0wiVAS9aQdZ850PiHw/JvxxNo6pbrazfhT7fLOZy?=
 =?us-ascii?Q?Dzf42h/t3Ir9HkzTVgg24nlXWHWgMQgrDiW2eEQ6+3da/DW+IfRJ9yJRcQur?=
 =?us-ascii?Q?NKNV86WjWkvk8/FRjCyPsbqMwW586Blk0wdmFBloqbkg4oXcmTQtrq/kMr09?=
 =?us-ascii?Q?wG81tMdZoM06ZfNuEKQfc6/banndi/1JXQZgAHnepyJYvfepAb/3O0Px89Bm?=
 =?us-ascii?Q?onRx9PpuAP6OVRGbSFcV9M8zUkUSp4LxxCHHsAJdnDj7oYsVO+Ri+lsGeoin?=
 =?us-ascii?Q?V0/Tdrru0z7zwjwNEEvq+BEYJETkv3WKogfhlplrA9WX1RxKASUNonDmjoHU?=
 =?us-ascii?Q?J52co0v8ApvGdk8DSm1vJ8eDc8eva4C9S2fuBS9PV5w+Z8WP29BjpsA0WdoQ?=
 =?us-ascii?Q?Xabp8DQbqXUMZs5X2d+/I9tsfCYD7jw6mBI5HSh5BYY4oCiuNGtnDYrF4Ztk?=
 =?us-ascii?Q?QfvDsMegTEaKNKpxlGTtcuN7jXCfLNzmy36YSpMkk28LnLZ+OHuqYfil+ySk?=
 =?us-ascii?Q?JMmK3gdVYDRwsnAh9g5Y0d49GGgjUKeawkETxA/n/rfwi+xzwavrN3ZvdL12?=
 =?us-ascii?Q?lVUQt3IsXDSqXUEGN0tSu7RsRshiQ/kTKHRTNeAPvLz9XFkL8nrRGUf5lEoz?=
 =?us-ascii?Q?cjbNTchvjMbzXDuf+ccOKnuMLQbNLlsbIZF0Hn0lkBPswXIMJW8TOTwsZJlB?=
 =?us-ascii?Q?6XxM+Omp+oj9sGeYB8LrtkOtHcmNGob6SCaE4xesHbzoCAHrdAAO2q0nGUyV?=
 =?us-ascii?Q?SxlD3T6+pgX3hvreCXG9BM2TDDPnffkafErk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:19:32.9439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8282b17e-7117-421f-57c0-08ddad56296b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
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

