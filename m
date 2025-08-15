Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECEB27730
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF10410E90A;
	Fri, 15 Aug 2025 03:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5coP+8pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990C10E90A;
 Fri, 15 Aug 2025 03:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RThButDewLoE7driHMZ7asXXQ1Xh+oD+VrlOXbrCAGkB1JjPkIgiPjbE2+Q+zYQYXr1/3Y1oAToLD3T0Ngk5er1alMqYMgIjMQ3ZGTDtyuS6NzPPYASXCsfLZkkuhvX0wCr0EqKN5cFKYv+6aHDAlLKu7M81Cfiw6mLn/2qGCXjBnaHMa/U7MIimKZBVWMCw8kIiN2G/P/WzGS7hQKmeEltaNWjr2t33Aceg95lFRjeVAONvDE8gvW1COOoK9Tl2xvquYLKi2vXLWpBJULhEhCNgZLN3ZotdQ9qiydU36bmFkkhQ1btxA45hdnpa4Uaf7jx7e8viEm/utbdoz5GxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKf6jTr1Tl+6HL7kplbumn+3ll0Dp46dblWaN3s9gqI=;
 b=cHYV3w/SIqckK5YXhm9ELoU4oqGerFK+Tq8BD3DIgjmLJoJDW1bL9vM++LhZZGMrgjBivgqtRaMSau5AR0kTOTugooXhOUQhjMwLJl4SVI9AdxTfREBO93yLqOdm675BZHphPJReu20ft4CRFCMKBGxBwzKgc9hPhqYVlteWRps+GPef3+Iyzau8H+q4DlECyBrHk6k14wSvbsvP88bZINURN1IXiED8764gbXWq8tQd1pbQ4g9eS3U2jYK5oy6a+fBnvUVJ15GHpem49kSq0fhz2uyBYFn9i6QGhEqH3asLtOYM4/ZvqxIuWeUC3R9TP6bApBrUPbUyFPlkyhrSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKf6jTr1Tl+6HL7kplbumn+3ll0Dp46dblWaN3s9gqI=;
 b=5coP+8ppKMyrdWpedVsPTEUUbEld0+/rNAqZW/81cEFKsmm+WlrxmDtaWP6+athx1lQqof7cQ0PYFZ3vhWx3uF0pCVxjM1HR8q3thuen0Chu5mU7E6gFT9rFnSzIC2oEXfBaneAm8VotXnHhO2dwH99zWkeTscfQ4uuUaG485GA=
Received: from BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17)
 by SN7PR12MB7179.namprd12.prod.outlook.com (2603:10b6:806:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 03:52:51 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::61) by BY5PR13CA0004.outlook.office365.com
 (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:52:50 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:52:47 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 05/47] drm/colorop: Add TYPE property
Date: Thu, 14 Aug 2025 21:49:54 -0600
Message-ID: <20250815035047.3319284-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SN7PR12MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: e7afab49-cf26-4b67-c426-08dddbaf34eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OooG1UECMi4+w4f2pWeT9BXW74xXiIXipPI2FQWBg2cJC2a0fVCmaq12ES22?=
 =?us-ascii?Q?83XU4yn+483G98EW8yRFX2k8ILtm0yCsh5lr+Que4xrx2U0joECS6h7dtNbp?=
 =?us-ascii?Q?gwTCg5YInMiSAF8Y9kRJv3O/1aXWcNLhzTtNSECvExakrwkIZghGSG0U1z0B?=
 =?us-ascii?Q?pi1PuVl5w0Kew9AoOuSl0XLz2KGOSx8DX8cylYdr/AKbsYxyDcUwERD06Xx9?=
 =?us-ascii?Q?e/un/pcm87QP1mGLA9B2YTSll7E/R2JLQFnbjufPVK/Jl4pnpPKzT5x0AHMY?=
 =?us-ascii?Q?KOpeL3BSQIolUzoR24XSJcudwgG/STrD9fp8ygrE4F2zC8InDMo8vbjOOj+7?=
 =?us-ascii?Q?EFE6ggXGVv08vjnDbv8OmNhI7diJkDmK3kURYm1ggFKETh8thldPH1vyW+ns?=
 =?us-ascii?Q?OUiNO2CFvQaoDasc6sobqQK+xAA35j8Cc9Hd3cQakQH/JSA/AWnlkWMVDPZd?=
 =?us-ascii?Q?nYCBP7e4niOaHFQ0RaIy++8ptjW+81UKNarxeTmI6fqvAG4JYhS4jTUEFqiW?=
 =?us-ascii?Q?HpUAXNvGH8wxV2G0wdGE7Q6II6ym7SuQvVYZkQrRsyjc5UVEJDnjY2cBroGa?=
 =?us-ascii?Q?xLZD86Wwww4KV/qb+kHB4Jj2JEPgW4FotPXc7CsxISkDbN9hRibI4/MYIUCw?=
 =?us-ascii?Q?YAj5EU3/+TGj1dTyJs1QiOs4SJWIhmjpo18MCLzjxwXRpk2fDgeYidKyyBx+?=
 =?us-ascii?Q?fs0Tprq5rdtqXG1JrG9cqmsB6pRnBq4OGRnw6FKRjXRkLTV/hA+gEAZyg0aq?=
 =?us-ascii?Q?i807mF1E746+clEtLVbVK4qSq9kr4xjegXHVyVpWqNEeoeMJXluClzJUlyUL?=
 =?us-ascii?Q?J4UWd6T/FrbKwprCV9jZANpXuPpvG7RCTH9FbADwe/3dwsObIvB71n+YW7YR?=
 =?us-ascii?Q?IB8TIEeg6egbtRvut1Rby5niH6ydghp3AfCzjaj2XbHzAv7180zBnu31eehw?=
 =?us-ascii?Q?4kx+2VCLpFFxL3HfD/eBDBWTzZsoNGkF+0qGQQgUur+oZrwazSh/jfq6TCp1?=
 =?us-ascii?Q?txMFsOY3MJFUTfiVoRr9S2ZIfkHOkchshGx4rA2XBi1xwac7fB6SdjW2yXGB?=
 =?us-ascii?Q?k0+CG2TJVDe2XHXMCncnKh+3vO+VjVqwj5jj37sSpNTZiqCN1325hmXxU+OI?=
 =?us-ascii?Q?UWongxgzdWO59F5J2+zCSRRAZ0jez9rVomDq9xcaF0T6YjqtlOlQiYhtBod3?=
 =?us-ascii?Q?v9NnHnX7BkPaH4hrcvNnP8RozAm3k96Pbluk8kyurje3h0DMsILrPRTl4r8C?=
 =?us-ascii?Q?2E10QV84DdPUZHL6p4qhxOTPlwQFtyMUnwB1gQYB0nAdaBggnGnQMowXNmDB?=
 =?us-ascii?Q?JgAnOF7+tdPaLgCvcIF+aO5CDHCVH1IHxocAdMHGL9ULuXhVkK/rgrHAF9Jw?=
 =?us-ascii?Q?Wg19nWplN105szKyP7RvISitTh0IqLwso+0DuFl/29Up1OcO79NJGczYl2v3?=
 =?us-ascii?Q?d+Z5SWo13wojZuOnONLDJMEX3cIV7PY84N1qU9Zv/P0NP4Cc2yasjiZYhFpW?=
 =?us-ascii?Q?zivKghBmfb3Y1KpZ1ruTgD5R9pwrkxtR/G1+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:52:50.9222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7afab49-cf26-4b67-c426-08dddbaf34eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7179
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
index 055d7579f72e..cb7df543bcdb 100644
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
index fad1e3a3c37f..ad2043f16268 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -662,7 +662,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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
index a5331f045c47..1c84384b5e8f 100644
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

