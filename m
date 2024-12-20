Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262ED9F8B4F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4984B10EE65;
	Fri, 20 Dec 2024 04:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NmU50ekn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538A10EE60;
 Fri, 20 Dec 2024 04:37:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjKvAs6xxkVvMBPfqGURNtzEKrmA1pi1u2ottAXOz1szukjbqShJr+NEpQNs0pt5qFRt07QwZ5wUALb+ddHkXV1BDAqGUABa7PDGVUAluJrAEE1RZ3My/Fv6BvGy9hyiIqidQWLKJZLsDS7Dkp5XUB+SJkTdLDOBN1UJPpqu+ZB2WSXzTFzVXpaAGB/yYaA34Tdpd2GwR83NwivI52RFH0ngADoaRzY4G0U2J7ZU2vR3SwJwPRgsDy+p5lMjuhRZg0YsYmlOL8gBHA0WaTKqDdoMant5hQywB2aLnyXwFGvk9CqF3TYW1jWxC77FJGRX183KgghaWxB02yZ9arlQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJfk1mzfhykdPpM3Yto8HWxCfeiBufNMZ3j7c7BcLKc=;
 b=JoiZ4Xui0gw+p4LkZFD0LxBkd70PH79Su+HZhjUe7fy+n1/k+cg9JPsbpm4E60ODNXzOvtbfd4ufl3kqTgcv6bl3grqj0yyPKW6rKPxHUXGzRZTFppLgoxr+px8s4k+lhLgHOPAoMXDrXCo/E6o0/+KTTsA2k1g+aKJwLDXOt9HI0Jfs4oPlr6MI50pfAtzrVn+McmM5qlj4kxIWaQxxLDKoa7Q3uYrWu7SW8VXVyjjDRS7gARRPGtO8b4X8cFLZutBZ1lGHM/5/i/8bj5T+VKkPO9KMOodatLvUjV0HaIt2CVC0J2U2ROugAxetUF4oUuu5VCCFEKsuAOSrMa830Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJfk1mzfhykdPpM3Yto8HWxCfeiBufNMZ3j7c7BcLKc=;
 b=NmU50ekn+lXLmssqfrZ2MW6N1q2GXVmesxCVAV8DCPm0nJVp4uP2cW7CgTxF/HCC3JbqqjImFWK1NTUOjNIXWR4vbtBPRsozxTd20tUT5hLDpJG7wG81JDNKjTEr1q+eSuMejAxxs3pIfkQx8URrQKJ0UE3AC0HMhNGwFyaDVeo=
Received: from SA1PR02CA0021.namprd02.prod.outlook.com (2603:10b6:806:2cf::20)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Fri, 20 Dec 2024 04:37:13 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::87) by SA1PR02CA0021.outlook.office365.com
 (2603:10b6:806:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:37:13 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:37:11 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 06/45] drm/colorop: Add TYPE property
Date: Thu, 19 Dec 2024 21:33:12 -0700
Message-ID: <20241220043410.416867-7-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DM4PR12MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: e513f919-1588-4b90-5d57-08dd20aff97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hfPxj5niiaCYtTm+IdKddMnB58b76AQ3imjrmhj/a4rrnFGIk4K5F1/A1I3Q?=
 =?us-ascii?Q?h2EvXkKKIUxVqdyAoRoVtFcylpltkSphv/DFoJXAYldkDLLn+ovISQsVgptd?=
 =?us-ascii?Q?JYyEvhwN6HlACiowco/70YmPHR8CvQFQgsYadccs+8Bxg4TtvNC3B9dWPpEJ?=
 =?us-ascii?Q?QBf+RXkO5DY6Wq5jmYLY5jXPQp1ruryS+gmV0hK/5r2qD1ViPrEgZHY00w8y?=
 =?us-ascii?Q?eaOnRQzTRCcN8s7SkLxA/+//mzCQArLiBt7Ka7oCT7XKmZTldK95AOoduQjC?=
 =?us-ascii?Q?cNFBcbABWezTQbVHJanfgYolgwTgW+BSvktvby+lXZR/K2s1A8cIFVUbYfyo?=
 =?us-ascii?Q?cvKM25GRaPXwyLuJjiQC+/DtsBv/alcvnlPsH9KMa4wXC59Qcc+tFvQI4VSz?=
 =?us-ascii?Q?5DHzxkw0hvLCr6tbmHEXV3/0I2EPBPJSq5RzHg3LlzqpoisaepFW8euvbBZ5?=
 =?us-ascii?Q?EIO+Zzn8CYLjDU1yH4aPms3Xd0niFD/fqEPGN/HVTzJdJgWwoovowCoxY8Gq?=
 =?us-ascii?Q?4lqr7i79N+0LdpPuDW+fJdal5v48FJHpFlSnmicLfkZVtVin2HSbeZokGarW?=
 =?us-ascii?Q?7TaF3BEuWCpSJBt0OAlCCVU6EsIr/VSlwRqjh3DYEB9hv+CUrpOo7ZajXQ7l?=
 =?us-ascii?Q?p0OTzm0cw32JFbFRNUbG3rR7Hkm+Bfu0X/6WU6jd8mWeglBO3lx2/hB8mgEJ?=
 =?us-ascii?Q?iSekpbBd6v3oa1zevMOv8F/ndxmlRooullo5d2cUuEB94dv2mxFSaafVMmjl?=
 =?us-ascii?Q?gV1ZvJ0HelsxqYzV0h0xzIGZiCMFlKSJ3i1a47MYJ4KbL5yr8EojsKdruSYU?=
 =?us-ascii?Q?/1MtsclA5DyubW65qz12Swx9VFU5ivI+F3Tc17+pXs4VWE8so1N+4Codqsgn?=
 =?us-ascii?Q?OgHaGEdol8Agve7zR9Zeqh1AcsQyc01/Lzku6hBrW3jxbscNNmS9l2okL91T?=
 =?us-ascii?Q?5ZXc+DwZ+L4eNaTFjWkxgdMa9dRCJFJcx2ImtlJenAYUr5f2H+cDxkiLQNC9?=
 =?us-ascii?Q?HOkhoYFEtxd/WBOGLoC4afHLXO7OdPtBk5CmyQpsoWpTSVPnP+2CEU11Hybv?=
 =?us-ascii?Q?P2L4x5ZolkUsBPHz74B2nu9ap9EsBcbOcR9WtryhUx5ps8Q4brT8sI6QyDS3?=
 =?us-ascii?Q?d7ETqsFg4LvC+yGdgfhwckmgf8s/CyiHEA8ylOSijaxsK+1pguGwnrmDmfEY?=
 =?us-ascii?Q?xGxP8S0CZdmRD4hiNPmbGAzoeMLohmsfUiW6FJYeMvMgqBG1ptPpqaWwWJiE?=
 =?us-ascii?Q?0021GdP4vhPM81gRxHS/3PHdA7Lrn+Wb8em2mo3Gavzgl0HWrCyqJzgXl8do?=
 =?us-ascii?Q?eODVIUp6y53BPXuR/AYJh+q+kyRV3SfkjZop7kK/625QhXZRZrFpUR4tB1ST?=
 =?us-ascii?Q?sCEkG7n8H25dYJy7+pNYMN54XGGLKzNgKkCerpyKjCcQEIuW0BzxWE3Gzgw1?=
 =?us-ascii?Q?8N4/wT1sUT3OAr3zQUh6Cav6s74Ry4YGr5QxzA0ByUFLdgZW65rSjrRYAF+L?=
 =?us-ascii?Q?ANqCaA+vv9sY+Ic=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:37:13.2780 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e513f919-1588-4b90-5d57-08dd20aff97f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592
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
 include/uapi/drm/drm_mode.h       | 17 +++++++++++++++++
 5 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 327d906c48c5..44c5b5dd8b33 100644
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
index cfc1485b592e..59fc25b59100 100644
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
index cc3e94dcf085..579e72e0b6b5 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -107,6 +107,21 @@ struct drm_colorop {
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
@@ -162,5 +177,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
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
index d49cded6c568..53985d2b7eea 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,23 @@ struct drm_color_lut {
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

