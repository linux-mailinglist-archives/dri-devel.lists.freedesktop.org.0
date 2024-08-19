Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4D95760F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E7810E3BD;
	Mon, 19 Aug 2024 20:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iYBBZwTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30E110E3B8;
 Mon, 19 Aug 2024 20:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFjoQ27Z4XrUXfzpFIHkjGX0qB1nnusqpLn3wcC9JcT7560haXUcilPrzZvmxRIyiJcgt4v6H6d306ccbowAnd4RZDe6pc3ZafzbzMy9/SB02oR3yHLUHz7Gj2IeAtYx6QhDWfKy/HLbCHMFLW0j/iYM+2dWh2coGuvBb0m8O1YhthZjMh57ib8UohP2L9SwYu//nxpu4gNGoZnkl/8KfnSHMdNoXCagOKFQgpgdmUBH/9zFYmdE2NVrzW1dlWz3Z7iTe2LnosuzU3FSeYcj9cw9AFp7f/puG6YGp8iWsZd/cBG5sLOyjSdAYB4K3N6ISQTPp/v3bH4++J7swi05Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A0lmG8FkzUkxyYjPT3tozJ3yI3G7YnxHuUd19NOhlQ=;
 b=cklA1XuHTOC4vq6BnK4rpkh2iQZnqk0yUXRvmZNGr93cUzSeB/Vvy7RskvNLRAoeBq2Z5IwR8SHm7o/bwSRPJ0jfyVGgEC5t7kXB04jZcrtLtzAzTw/2pi4kQz19Jc8SdVseZUF0cyFX6qAlr+ZXkkGWICXFINeUnnPIpmeNiAZ4AWG5mA7CSpM3KhOBQw5Ei9DJa0rI2w0EDHxbt6QFWMz7POpQ+PZbFWlAg3QiAumxsMkLqaHmQpAgpgRP9zwm+I2c94Z1ZOu26IixRGG+6jztQ9EW+NiQa1Xp0SdIuAfjt58qoToX0W+DbQ8efZqssw1mlnr3/a/7kIjLT02TUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A0lmG8FkzUkxyYjPT3tozJ3yI3G7YnxHuUd19NOhlQ=;
 b=iYBBZwTjiiu0uzfWxearnOPQjk+nSlOy/1ecOBK/JEpAB1LW/9zE5/Xy6lYK9S92OsxAkOL5W924J3ursRof4iEG8dDsNEow9ws7PJKZgcAULdKSn5BmyqJlMDIma1hmkWjMBb0R0NTwKcJO4o0zIz6YZrka7eIi+wYloNejDq8=
Received: from MN2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:208:15e::39)
 by MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:57:28 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::82) by MN2PR17CA0026.outlook.office365.com
 (2603:10b6:208:15e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:25 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:24 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 10/44] drm/colorop: Add NEXT property
Date: Mon, 19 Aug 2024 16:56:37 -0400
Message-ID: <20240819205714.316380-11-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW4PR12MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: db05491a-0852-4c11-e4bb-08dcc0918923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8cLHCi0XdoyK6ycyBARurDZuJU5Oj9GsU+7of6kxsS32knEXkCyauTDIeQUW?=
 =?us-ascii?Q?fk/JRLWUkB5E2c6qgNspARSLWL6cA9mXY5ZMWC+fX8F1UG55ZjWinuh8re6S?=
 =?us-ascii?Q?mEpFrTb+j95eLmDODXFWxrv2UrjpjY2VFo/dMbD3MJRoEBT2Giy1Tvo3sxpJ?=
 =?us-ascii?Q?faSrEOMn4XjzAEOE40ify0l4m0gpa7Ln0UIz8blXZUEi+LFY7aO4m0qySuxU?=
 =?us-ascii?Q?2u/fTh+2RmXwCJOckn73Pd+XAoLnNdWdg3RNIwg2/2Y+N3l+AGCxGgFqON3p?=
 =?us-ascii?Q?ywwoUEm/fOq1OrgixG3c7l7vqnvF+dkX0hDGZ+XwbeTUKArLf0BR0yb1LUHU?=
 =?us-ascii?Q?zomO/jGwjNi0oWdmWMaS/wpLzI9PZ1ioM1K3lyWIEBlkmTwES6kwoP8aStdj?=
 =?us-ascii?Q?AjUE+QsIQfGaRzmgjcvaWhogZoSysOLQxhcFC+/7p7fu9KTalcDgGX32/9EL?=
 =?us-ascii?Q?pVAWGiJhGdcFp776hQfvx6S0OUzSXV2SWM+M5O1Uf/TivKJNmW875Op/letr?=
 =?us-ascii?Q?stFlzAPxM9TDpGXcS8ID5XzRRSy8UG/jAe/UO7rlBoeFLT4DZjwsyzP6sp+j?=
 =?us-ascii?Q?C2p2Ja1i6sKBzashZN9lGqsk1oRmYVhL2PIkFOIz4JcHEJAlDXndsiuGdN73?=
 =?us-ascii?Q?jlsPmUAWe2y3AJ0m4CtdjMxqFXEcuihIyvYrW+0Wrz3irsB37bsJ5FiuDeF/?=
 =?us-ascii?Q?BjiPPgwXAAj62L6BZ2bPpliX8hkl3Jpbi7ZfGVqcvFV736Na2fSgvQj/8Rok?=
 =?us-ascii?Q?kc++BT2AMsKpvURP/yUqM/L30IdnviTY7v9tyoekzA9TA7lMxIiIJZGqvGYd?=
 =?us-ascii?Q?2i6o3drr+TVwrxDMiZbZWw5WNjwlD9aEENN2ODq3xikMB0hUqW2CeA3yooFr?=
 =?us-ascii?Q?qCcrI8TDLt0Di9hb8qVNB+1CO8KKGOqol8FexAZlyRAIAiHOBKWd+Kt9pwai?=
 =?us-ascii?Q?Xk4fIT3JZJkWR8OnQaacilp4YvTPUvC7UOp2tIAGi1LEJ8v+MEnCFSqCicqs?=
 =?us-ascii?Q?qSLdnfEw9BUnD7hql+4AlKzB24Q4CGVVTm8Geg8psgiCzQHoOOWAZv0RDVxC?=
 =?us-ascii?Q?cX/fYvLgCo97Pu/kmAtUKjNe6KtXyi8zQ1XnDdgShq5zbL6QrQ/vPEdrCU1c?=
 =?us-ascii?Q?+V2aHGeHYi6zsnP3X34kSbllU3rcovq6g3pef/wqHZqXnpYidM1DZPAxJ7Hw?=
 =?us-ascii?Q?z7FPbe23UNoOdleu5S5kJp3SwrWP7lHWg62a0k9427WTLJh5DxZXb2mV3ofi?=
 =?us-ascii?Q?dUDqnwJJutGI4I3h394mHntOewWh4d8GjWwxmMZBVYKIc/cNeAWo+nIYTzvI?=
 =?us-ascii?Q?E35/A9udIEXKnPKBSDwbZc004paQf/lMwLlfHW/RpJWNXPND3DFFALCeMSwO?=
 =?us-ascii?Q?ZLGXPj/PuiEx0gFVwOIr9nk57o11gFFH9NsXaW3ogMXa7z92uPcTdVQEtYcO?=
 =?us-ascii?Q?9VgJLcEbxwc/hz2S5PsNiN6eWZ2MpVwO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:28.2608 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db05491a-0852-4c11-e4bb-08dcc0918923
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828
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

We'll construct color pipelines out of drm_colorop by
chaining them via the NEXT pointer. NEXT will point to
the next drm_colorop in the pipeline, or by 0 if we're
at the end of the pipeline.

v5:
 - move next comment here from Add 3x4 CTM patch (Sebastian)
 - Add kernel doc

v4:
 - Allow setting of NEXT property to NULL (Chaitanya Kumar Borah)

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 054e7f01151b..685dd18126aa 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -88,6 +88,7 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -120,6 +121,16 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->bypass_property,
 				   1);
 
+	/* next */
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					  "NEXT", DRM_MODE_OBJECT_COLOROP);
+	if (!prop)
+		return -ENOMEM;
+	colorop->next_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->next_property,
+				   0);
+
 	return ret;
 }
 
@@ -293,3 +304,22 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 
 	return colorop_curve_1d_type_names[type];
 }
+
+/**
+ * drm_colorop_set_next_property - sets the next pointer
+ * @colorop: drm colorop
+ * @next: next colorop
+ *
+ * Should be used when constructing the color pipeline
+ */
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next)
+{
+	if (!colorop->next_property)
+		return;
+
+	drm_object_property_set_value(&colorop->base,
+				      colorop->next_property,
+				      next ? next->base.id : 0);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 7ecf4e3dca4f..5255cf44f4b1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -150,6 +150,14 @@ struct drm_colorop {
 	 */
 	enum drm_colorop_type type;
 
+	/**
+	 * @next:
+	 *
+	 * Read-only
+	 * Pointer to next drm_colorop in pipeline
+	 */
+	struct drm_colorop *next;
+
 	/**
 	 * @type_property:
 	 *
@@ -177,10 +185,20 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @next_property:
+	 *
+	 * Read-only property to next colorop in the pipeline
+	 */
+	struct drm_property *next_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
 
+
+
+
 /**
  * drm_colorop_find - look up a Colorop object from its ID
  * @dev: DRM device
@@ -252,4 +270,6 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.46.0

