Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A3A72742
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069A10E7B0;
	Wed, 26 Mar 2025 23:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Smbgl9cM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B20C10E7B0;
 Wed, 26 Mar 2025 23:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCbqYJMYmtTQU2qeNO7kLfWDzQR/hDjhysyBlQdk5ipi8EVFQ0nWwzrjjBkeK+Gjcrrw/wCE9TUud3rczFJAv+VGR7+UZeA5EY3Ye8trbr3960Z4KMijkxfVPlmSK/VYAySqXtDocfy8OsS0FmzCh5wbEDAmLz3QwkFwuM3mmGEcYfvVkC7toMO2PejETx4zCPS9s3r0np7ucCCuzGhKd/6pZ63xJwxMDfdzInnhYmaScFBNvmEu+qQ+q6QpnGy8l8kaG7359MNz5RHuCwxlZxI4kZw32KtnO+SsLXflOnRr/ZByjTcWD0zf/wirLlx40e/IVJ9fdZXpz3iwRftriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfzyYK9QzCBYaN7bk7lPDtDH2GYBGr6Ilm0Xs0FO6fI=;
 b=eKiYV2H6ABrZ7eUO38yX7hFFR8QZyjQjoDQL9kHwbKgVMtXxQAL65GsTE5xC6cQ3oqgc1iVKuWdbTguYJ18CLaBYUzAZMIFORuFRIe8q4OKkIyRE0KoZmoyV5vVVuKP4H4yfvgFXw4T6RkG4rgz3KGsPpwd9EhdMb9UlPFAgjr6pvY6m/sPJK4REKWejDdyCLsHbTlMdQUd50ZctuqVTcEYJnqmFMKEUOeccK6hSjlFVvqx/WPABaDgQpqI1pqhyZmqYN/BEY5HMa2iGDCCpBHOOt1tSUiuL2LWuwFvqkUjkQBDJNjrBI8Gkwb0So/r8iLvhKLyrKpmCh7ye9EpDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfzyYK9QzCBYaN7bk7lPDtDH2GYBGr6Ilm0Xs0FO6fI=;
 b=Smbgl9cMUDYzzOnxLllfgIe+dphjKKhuQIvFjqA2M217SfdYYobS3AmGGJwEbPgWqSw9hkyaT9Blpwp5LtrqfD7LfI2YJLXCY+MrIMKkVH1k9gE08NHd7ajs6GKFWH7IxP9TZItqQ3Z02M5ATxGltGxv0Xwl/6+080nxGhOQBNw=
Received: from DM6PR06CA0064.namprd06.prod.outlook.com (2603:10b6:5:54::41) by
 PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:49:45 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:54:cafe::5d) by DM6PR06CA0064.outlook.office365.com
 (2603:10b6:5:54::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 26 Mar 2025 23:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:49:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:49:42 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 05/43] drm/colorop: Add TYPE property
Date: Wed, 26 Mar 2025 17:46:46 -0600
Message-ID: <20250326234748.2982010-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 929842ef-7030-402a-7fad-08dd6cc0e2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zJLzH4JAe83FsFnPxhryl6EJm513oFCeX4IsBsQNnB+eZ7WT3lAnyoymVqLm?=
 =?us-ascii?Q?i2gahCnKRCCbQ7MVmm9Am9aNsdrUhpjWEoVyWPrY5JUCBUh7eM5+3xq5egt+?=
 =?us-ascii?Q?m3DfFDdprw0i8w19ADcNSde3XhACH3VIJPjBpnXccuC7uFMee61B85bdEhH4?=
 =?us-ascii?Q?6KaEe9KIEwYYjiIVn7tjLg1PFUZILeJMlZej9QDSHUtFZDn/8onsQcLZVkCu?=
 =?us-ascii?Q?9r3w2Y9mHXG3aNXmlMHNKjjShn064OS/9ttTr/FxeYRKW+RdUvOPdWci97AS?=
 =?us-ascii?Q?Qaraj0mNMSpwd1CrrupR1+RwCfgKJGC1ufnNFc2Ako0nVmfiy7aPqz60+IcG?=
 =?us-ascii?Q?uXd2r+foFB1/wPbGA+JDwC3pnb6T9ZjZWd3EF9c93b1JeAbY4O5PqHf3o5+0?=
 =?us-ascii?Q?lXxAYqA2hytmrK3kP9e5PUWslWs1iV/UdBnlNMJ9/uNhH+ODcjJs/Gw7Zas4?=
 =?us-ascii?Q?aaRcad3VAcj2a9GgdV14LFFKhS8hhraQyzqxfmqz2xcAMl5jpHAcZydx0zxt?=
 =?us-ascii?Q?J10FrHg5ZwxgZGBZah6Klgrd5vU00dkkBKQZig1haHKIMbBBOpmI7Dij8bqr?=
 =?us-ascii?Q?CBQxYNoKaSlxneFeAOYy6XGZd99UMExHje3LB+bOvfw8FcPgSvPL0fNUOg3W?=
 =?us-ascii?Q?cVOOTZLYJNk/WPcp1eZEkhKn5zkdDnfI+tnS8c93v9PVyfoa/r8Dw38CxcHc?=
 =?us-ascii?Q?fXtENC8ydnnLNK2HlOez7xSrRVxXpYhyAvB4D3EZw/aU9t82I0VGxkzYLOKR?=
 =?us-ascii?Q?62cBpC1JQD+TFFqFQpCL2YUw50++LNPU/CuCpKafLEPBu8zi5lA6zMwa9xi5?=
 =?us-ascii?Q?7t4gtrwMLfzOfovBv3Vur5Lj7EV5kHR8s/gODGgHJPlzqGllQ3ATLgkFivCb?=
 =?us-ascii?Q?0zuISbfWEJZ6kQOmq3eOEkFQTWeihzW6joDcmqDceG1xIMrKnrwgwynysVl6?=
 =?us-ascii?Q?QU0V7zd3aeFbWnWKTzkrzuQ1kbjvqMn8dGaLNBwZrDrg8udgXtMx+85uW3yl?=
 =?us-ascii?Q?ujoL3E7TVnDmvcgJ0PrkMXPqVy/SIelDNc89Joec6ykURSfAE2wdyTqWHf67?=
 =?us-ascii?Q?4dDOrYwKLRcGqQzVW86aa6ArdhgihVP78sYBHeDYS6mR6LuJckw/aFSFj1dY?=
 =?us-ascii?Q?2itZbCu+uGV8G5fTZSw5H9XQO2y26/InJDzNlGSPVXp93DryWdTdBeczc7ls?=
 =?us-ascii?Q?Ue7vEeUqpDMSF3SekOkbgzfdaoHc0eVEsUxNveKf5zNXNvkAY22JVY60WQuG?=
 =?us-ascii?Q?2kwbrnxV7kJRu81WaQvju+3IXlp5FW/4ji+P6vKSkmOPwalkuCMQ/fNZVIXg?=
 =?us-ascii?Q?XIq3wGmZEq7wWXAbBSbXpoNc9q/+x1t9zirdtgKhz9fmKSQ9zTEsWO8WgLn7?=
 =?us-ascii?Q?+8vh5r7r8NZoRLf+bMkL+Ny9DM4gX3c+GFuuqh69NlVeQh/J7R1hhYhuxu/u?=
 =?us-ascii?Q?fsSX2brvivN5kpo+8xzvLp3J3008n2kRgTmB3dbiPvXjzEESc/bloehPz355?=
 =?us-ascii?Q?RAAXIBgv3WtZZVY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:49:45.2959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 929842ef-7030-402a-7fad-08dd6cc0e2f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
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
index 85d492a1f3d4..12c313d43e56 100644
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
index cf1772118895..5e8ce781fcd7 100644
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

