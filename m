Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B34957611
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500CD10E3CD;
	Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oGe3hRy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED910E3B0;
 Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtVUNZ7IirRh1VrKDfvt21ZPwrujZShV9oGaTHOiO8Or5G/SjT27nOHkNvruFC66Fm0hnO3wfbaoa+s8e3QnogZM/uT3IxTGe39IDj5FdfNrfLMJ8aTuHUBck1jDvr5KmBUIkPECRk5kYN0ornXKd6xZ2jAUIxP727UupupXq+yVFMk6YISHNZUm/t7MqvXqfvBfugMzVtYgq3mK759Lmu/TUNKr2MIs75E5UZI9CcJNo6e/Q68qQkgQ1WTm6Jx7JexoTRvRLuVsGo2e5nmaOoISdC6Oc5LfeDEeFh2FEn9wGOdPo31c1dT7k4Q6tR+KZKhCoI4c+QsyMsM0aePYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z55sLYxWjE6PT0svloGxpsMp01QuFttRX/J6IGmWFME=;
 b=GwyaZkEmx0tS7dUxwsJc8UTAqPPZBQK9uhadCKsSECdFq5S3Hb1UBSIgSQOtPdj55yV/zpYwY+V7P/9nzprfkHr4J4Q3w5PzIqC9m9qyUpxSDwfQXGgGoeN+hWWy/AHGvel9dJI1HaM2wfH0ms/U/P9XpMUsx0ovqjwfSydq2U4602wl0agiXkC6QLp4waNNgmdyLUEIllgEoQ6RFMmaXTJDD8Qu166rI0qluRu6zHKjcUUsUOxxNhCXossXuRZLTZhXOKajuqs0giukSHA6W8YWcLOYKtPf2ok2JmfCRwiyj18Ik01jP8799D/7iRHNstOLONx8ZAOUVFHfKctF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z55sLYxWjE6PT0svloGxpsMp01QuFttRX/J6IGmWFME=;
 b=oGe3hRy7uJLYkTSgRrTZsEBpu1/kFZDmUFKjf9GSDWJj6z1aNL/VmkMnmaY+N0bwV4Cvnj9wghD6KDBFPF+Q1QkMKfa9LtLvLZMTKnSuwvvm5IQfdwupf8lnD7gwwZPLIwrxn4coAv6EG/Xz/SV2g/8ZSL7O7LX7Vs8Fdxy4GUw=
Received: from BN0PR10CA0001.namprd10.prod.outlook.com (2603:10b6:408:143::31)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:57:30 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::60) by BN0PR10CA0001.outlook.office365.com
 (2603:10b6:408:143::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 17/44] drm/colorop: Add 3x4 CTM type
Date: Mon, 19 Aug 2024 16:56:44 -0400
Message-ID: <20240819205714.316380-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e29d07-af5a-402c-e0fb-08dcc0918a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Z4caCoXxWoYdB7l8QJuq0BZPvDPYTv4HjjWgHydoQVz/t806fvVnFk1M20R?=
 =?us-ascii?Q?REXbhcRhfY2wLyynnvQCzIVROwO8QOucmfbrvfhSaPaIWk3xvLIYZTDeOp5I?=
 =?us-ascii?Q?5Zcv4eNdv++IbE4QcWv0A3+OYkrN5PyZYbxETATTurT2x47xYDlWiwcJY5X7?=
 =?us-ascii?Q?mjccSA0clRbapZdsLdWy5RcU+5aw6xUdD6lZYBeNqnuohrXnhVBQOLTPC9wr?=
 =?us-ascii?Q?nle7Bj2iqz5wZqLnlECYU47AOyItz12MEoRYqevabTwflVu1pALRqJS1KKVQ?=
 =?us-ascii?Q?6RsW4cOwvGC7/ActWJ/H2DhC9By+ji1x79NC2jitJET/FLOsxFdZ5StHf8ZQ?=
 =?us-ascii?Q?nuQW2ypFwDUnmZvQ6QIS35BQ62f4dM7YJ+datqsNV8pWnXUfg/kqcv4g7WIm?=
 =?us-ascii?Q?NP96YMCvQlhawJyytZOmxIi0XMe7DfmB+hJPkokJBW0rgUj5JlShs0zs7JkA?=
 =?us-ascii?Q?cFGAGzEQg4l0jkzoKU1SeuCzvnoaRDN1CuMIQpfh7XtQ1mwNq5GWHG5mP14T?=
 =?us-ascii?Q?l+QQx9VaAqP19cd3xu3jEjfqy4M/75tcBkd7ymmBmSpQh5/kB2OYhdMvFVGS?=
 =?us-ascii?Q?pfSWgyy2N9Qbwlp+MX3YHEj2Hf6hDAafKe6Dy6cnzAnfIT6GPjKGalrMVBb4?=
 =?us-ascii?Q?cyD9dV8Mo9CqKHNC4cbYG7PW5nLa/O9y/iht9Ojvxpx+mklFwheqI1/DmhGb?=
 =?us-ascii?Q?PTty5aKcODQ4BGNQB+S9kuUI1LraWy7vOuEuAWqtt6H7qnIW0Wk41NqE3Z+0?=
 =?us-ascii?Q?uMSy4JBXV0TuTqXAe9Bg0tmOh2WDG5iYGqiP02oh0aHkwsP1hV8D0m1+/mbh?=
 =?us-ascii?Q?gp6s49SoVZzgkgjsStQWfT7uQu+hNx3QvV8EaXEFj4/tUyJPh0aBTa+t0jXv?=
 =?us-ascii?Q?eihqMrQJ20I0RO6cWe0pJABfebfuYDdBxtp0BG8LwkZjQHSmA2tl9uHbUzri?=
 =?us-ascii?Q?McQkks6q+dhBTsFpaCXgHMLx4iLkHGaIZfTlhdi8dttVCvbplcI8JncsTaNm?=
 =?us-ascii?Q?ZdW4vKkmR1G5DVGbbVZO3XG9ErhAVA+cTaKqpmPaUlW9d+Ia4bEPpew+OwCM?=
 =?us-ascii?Q?gVzIINfH4sTq6hTWAiIKVNXLf8EZ2B5B6PIjp/8tZblVZjLB//0pE17tbhGw?=
 =?us-ascii?Q?xFfq6moPk85V2jcx6kryyldTDTXnbVFKdH8wsNT4pBL0IV5a1SZoh5nUDQLg?=
 =?us-ascii?Q?+LwPuPjXXKnaEkEq6WqBbT9Odua4WUN21b+K4k4335c6U3ii1fkT0YLqMT/d?=
 =?us-ascii?Q?E/EkvdggZqSHMsEOnKLtdDjYZE4AGNHCDGpMyZ/Rppf/UsmK+coWcWz1CaE8?=
 =?us-ascii?Q?oDt2YmwWAhwqMgu/suhaXTJq1fAwWf13Yechj3GPoPqAcuLoOhEJoOX1v7Yt?=
 =?us-ascii?Q?jd47rVF31Q31be2e4QR6EdoCbWjq116bNdVV3nPhbTbqA7yrkEa5uPfRM+Hz?=
 =?us-ascii?Q?LzOL32F8mXawbOZCAlYb3zF4sGKwhjAX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:29.7574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e29d07-af5a-402c-e0fb-08dcc0918a05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
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

This type is used to support a 3x4 matrix in colorops. A 3x4
matrix uses the last column as a "bias" column. Some HW exposes
support for 3x4. The calculation looks like:

 out   matrix    in
 |R|   |0  1  2  3 |   | R |
 |G| = |4  5  6  7 | x | G |
 |B|   |8  9  10 11|   | B |
                       |1.0|

This is also the first colorop where we need a blob property to
program the property. For that we'll introduce a new DATA
property that can be used by all colorop TYPEs requiring a
blob. The way a DATA blob is read depends on the TYPE of
the colorop.

We only create the DATA property for property types that
need it.

v5:
 - Add function signature for init (Sebastian)
 - Fix kernel-doc

v4:
 - Create helper function for creating 3x4 CTM colorop
 - Fix CTM indexes in comment (Pekka)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c | 29 +++++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 39 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 +++++++++++++++++
 include/uapi/drm/amdgpu_drm.h     |  9 -------
 include/uapi/drm/drm_mode.h       | 33 ++++++++++++++++++++++----
 6 files changed, 131 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9919a6f1092f..c2fcde96e218 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -790,7 +790,19 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
-	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	default:
+		break;
+	}
+
 	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5dd834e3979b..4a9cb1f7dbf7 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -691,6 +691,30 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced = false;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_property_replace_blob_from_id(colorop->dev,
+					&state->data,
+					val,
+					size,
+					elem_size,
+					&replaced);
+}
 
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
@@ -700,6 +724,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -722,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 685dd18126aa..73fd4b7a4ce3 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -63,6 +63,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -201,6 +202,43 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 }
 EXPORT_SYMBOL(drm_colorop_curve_1d_init);
 
+static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
+{
+	struct drm_property *prop;
+
+	/* data */
+	prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+					"DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->data_property = prop;
+	drm_object_attach_property(&colorop->base,
+					colorop->data_property,
+					0);
+
+	return 0;
+}
+
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -287,6 +325,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 5255cf44f4b1..1566d88fd018 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -87,6 +87,14 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 */
+	struct drm_property_blob *data;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -185,6 +193,17 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @data_property:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
 	/**
 	 * @next_property:
 	 *
@@ -220,6 +239,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index efe5de6ce208..e44362e74fa1 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1283,15 +1283,6 @@ struct drm_amdgpu_info_gpuvm_fault {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3dd89ae6515a..da2be67609c8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -847,6 +847,20 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -861,16 +875,27 @@ struct drm_color_lut {
 /**
  * enum drm_colorop_type - Type of color operation
  *
- * @DRM_COLOROP_1D_CURVE: A 1D curve that is being applied to all color channels.
- *                        The curve is specified via tha CURVE_1D_TYPE colorop
- *                        property.
  *
  * drm_colorops can be of many different types. Each type behaves differently
  * and defines a different set of properties. This enum defines all types and
  * gives a high-level description.
  */
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.46.0

