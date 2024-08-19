Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154B957602
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34B010E3B3;
	Mon, 19 Aug 2024 20:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pjfRtzwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD310E388;
 Mon, 19 Aug 2024 20:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZv3rmy+YULW646eRql7UdAc9BxTtPrxY5Z3BUa3y1gBmJVyVsV3X/qQdJGijbF648uyJswy/vjrWhRD4WKUAR7Q2FXWWNI4bBrJg+tqEbkSrxWVzRHPk/n2OS9lEH5M/jzSORNxQhI1JwJ141o/pw9vdKng4DZEbRoaIEGgrsYEEIpMsmIrawMCdZhaxQtApq+xaAMpuFgMRSQ7HAZ+dsMBylIvt88X+AacX9MtRlOXwTNiDNixYbWznWEXsUUxlAi60bmDArUoYVt6Gu2LeewmgA8PxP9wvnoxLda1+Di92Vlny3y3GzA0a4Nz441ykhTsz5XDsuAdW7u9hGcPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+sCNw7U6ENgKe6mWjYz/wgHkJyIgKmQt1cFOMp/U1Q=;
 b=BZunr3BpPRlXE2Uzi8k/yR4sdNT/VgAB6KY52wWLprvKJCnCaxlPG7Vh46xPNOk43HxDcHT78vEviISEZckRT++309E2tYtx6fWjy5rmu23xJb+KBnqjMXxxqiP4O/gA2/Wz21k18QieLaQci4J/uvSoJ3gXllxeOCtCYiSFkjo6oWSxBTK3x0YEUWeRHKE3uJsaFRDPT/P0dODnhQQvJrka3tt/D6qG1HFh/dR0HRDhyCNPvgN60J6U0xhEyzzXCW9Vqu/WRfcJuI57FI6U3FLDCCVHoixYPEAyfuxO/DB2MOTaxsh0VKUoW15rHY7HIruygMz2OrcuUW5i6qfxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+sCNw7U6ENgKe6mWjYz/wgHkJyIgKmQt1cFOMp/U1Q=;
 b=pjfRtzwlmVyoPO0/ueefXEtDzTmuSHrTP7Mi2Cl36osMxny8jKafkJijKFyOC6hpzD1th9A0kTKIZKYb7muKFVeeJ7hpmtR5eJlCTvZRy0FT1sbA0pkE+mlxAiavnzHMlafDg1xbJcZExR0lnM/ESOd2mPO63UyoPWgoM39vZew=
Received: from MN2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:208:15e::39)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Mon, 19 Aug
 2024 20:57:24 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::82) by MN2PR17CA0026.outlook.office365.com
 (2603:10b6:208:15e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:22 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:22 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 06/44] drm/colorop: Add TYPE property
Date: Mon, 19 Aug 2024 16:56:33 -0400
Message-ID: <20240819205714.316380-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0893d3b9-3485-4228-1442-08dcc09186cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mV+rrR3P/Smz9D5yPTyNFM+xFBwJCpJxZWwL2pXwHw0SHIOaZMmO9Yd4KbDD?=
 =?us-ascii?Q?9Of4EBu32UxQ3s3DDwXRRxOVnmYx6cNdYgMdfJ0W5VO8Uk93kZzbgUmdkAqk?=
 =?us-ascii?Q?fPBxKMG2yRYGQwzmk0OZbJCm1BLHL7sO7AQbdX+1ZTyL8BDaEZTfU2L3ljwf?=
 =?us-ascii?Q?6SDs6S67KNOtjsqvedtkEDF4KsxvPFaV8hW97x/1fke4ExO/HYuOypuj7DUu?=
 =?us-ascii?Q?jpvdrUSHwDsQ0FGsFw1fqA6eqy6IAlddj4Y9U4dKeWMgIpMnjPIUIzzdtfeT?=
 =?us-ascii?Q?2xgRD4XEUgntmaRBHhXI9dJ5+Xil/d845U3Rzzn5NKhu2l9JteFCRULQJlPa?=
 =?us-ascii?Q?VNw5jKxmfpv8WyA5lTSJw9CeTQ25fqcynAUmYUrXyzdPQzfAvsyrZywnpXlw?=
 =?us-ascii?Q?11FzeOwjYpiyzGYxe88dFoMYFYJ7WKGbbveoVheCcd2zcWlBJI8FIktkGWVs?=
 =?us-ascii?Q?BFO7NrMkshCZsRBUQIkvurklFnaNzlOOVx93RA9kH5+VX8iyB0Qu0/8Q/qfR?=
 =?us-ascii?Q?VPKnRV0DD8ZL9nsbeeKk0Nm4ucuCRrCLK2fN7HBp8YSa0grQJI7dRZezqSRz?=
 =?us-ascii?Q?9ccoQo1GrAbqvJnOPNVB3Mknj9ljrCKNZ5KfUNPdOpPDMCtIyT4OwX9QfxFC?=
 =?us-ascii?Q?CdLpHA38L+kjiZLrSu6QqpM6xvWcaC0sby+5aO0nHseNrLPKoPfYrdNdROUf?=
 =?us-ascii?Q?LKfWCVjf6Z4oG1PmUJQXcxAKrp/7q5eALTeu9fyCcutw5YBD21kfX389iML3?=
 =?us-ascii?Q?vXygKORbLMNb8Zsb5KMd77NFVWF1a21uacbVKyHSjodUeIqXwAlUZaFtSuKD?=
 =?us-ascii?Q?JI4anpicyYdLMnZ+mJW9/mWBZMZlKApNh37tOm9y3avA1nzfFNPDBeLqTwxf?=
 =?us-ascii?Q?/fqShGIEbxXnxxCLePQkrL5OvHC4I0lF0sKT3hg7Zsd9Oz0yzXPk4AdtCkr4?=
 =?us-ascii?Q?95VMXIIWI3uy3H4G8u+j5T8pIKC8zPKV2QysGGyWke9+IY78VEYzdQ7tj/SV?=
 =?us-ascii?Q?abAZAwwa8Q/rLR/CcM1snFVZgD0yirW/6hp0ZR5sltRcxVpBUVff2dcr9HDE?=
 =?us-ascii?Q?I4qxNi7j/dUlNxgVEzovLAMEUphVDzFJxIkgIF3QlL4Vuabw3cxMu3ScTUNa?=
 =?us-ascii?Q?1QH+BUJOs+OBLtvepkLK4ZUz6WdFCbbV0Iz1/9LoOoZ7TerBHXgZxgRmtHYq?=
 =?us-ascii?Q?AMrFaK7Fb+l7fNxCppUqe73T8O66PdI1T+qM4gWdzuD19RYxgu5j6oeDp9mk?=
 =?us-ascii?Q?2t6JxpFexgj7CDB1655TY+crV0OJde12K2rYD3mwzOn23hnC2rTNQUrUDUyJ?=
 =?us-ascii?Q?ja9Ls2s06tl/1n7uGb9OwixrTyVWo9EHJx+k8fBOfC174PfTr8rr9MuEyMdq?=
 =?us-ascii?Q?Ztesza0tRNYDNla7i/xz/eAjze90/PZtmTyTxG6Y26oJQkkJTijywJ4BAQlh?=
 =?us-ascii?Q?//Xuw92PPPnxRY0PRqgF1DSvrF1F71qa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:24.3389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0893d3b9-3485-4228-1442-08dcc09186cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718
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

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

v5:
 - Add drm_get_colorop_type_name in header
 - Add kernel docs

v4:
 - Use enum property for TYPE (Pekka)

v3:
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - Fix drm_get_colorop_type_name description

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++-
 drivers/gpu/drm/drm_colorop.c     | 12 ++++++++++++
 include/drm/drm_colorop.h         | 23 +++++++++++++++++++++++
 include/uapi/drm/drm_mode.h       | 15 +++++++++++++++
 5 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f82240eccc69..b09db9835e1f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -634,8 +634,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index fce7683e4178..f76a83d79993 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -660,7 +660,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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
index e005aba7d28a..79af42b349a0 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -101,3 +101,15 @@ void drm_colorop_reset(struct drm_colorop *colorop)
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
index 1bd658617840..75ec3ec827ac 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -94,6 +94,21 @@ struct drm_colorop {
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
@@ -148,5 +163,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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
index af71a5c84aa0..3dd89ae6515a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,21 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * @DRM_COLOROP_1D_CURVE: A 1D curve that is being applied to all color channels.
+ *                        The curve is specified via tha CURVE_1D_TYPE colorop
+ *                        property.
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  *
-- 
2.46.0

