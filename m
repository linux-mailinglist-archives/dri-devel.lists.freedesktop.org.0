Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915986827D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782010F0A6;
	Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FUmV9Yh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114E910EEF5;
 Mon, 26 Feb 2024 21:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc7uKLZlo6wnpHuIFKzPrGqMwXBD6iJlWIoCnBz8R9ikBlosa1o+62CYUYlaSee3hrjFtTWnzY3UNZfJHLH1286IgO/S9KD4lgNv+oMApBimBVrZsLUX6EjpgBiOlIhItSZE5W52M5qA87TQcuq9yHpvIac09BB1+gW4+1mLipd12rmkO/1QV/3iBVAnLQ/jasqg4zn76CHXM8YfEknZmyN516Y0LWiF8Fv0/hCqz5+q3DGJ27go7Cb+ir6Bo4mDDVyKZw1PqTW3zkYzFJ2aswU54lXN+eSePi1e1slDS4ScmEbCMhOHGCPbVMknvjlV3OLWdNYxISY0rGMpzwugIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9l7oMcfFSuPDv7tw0NGXi84Q3nR+W1keSH7dlgGJ1A=;
 b=IE9YKIr/zkN8jlnZbdNfiD2OuQvSGcX63IZ7xjrnLxa+j1pBGky2IwlR8bs44iAeS1t5mcKunKd990/YSaX1j4etoWHHQPZvHzkR+XxGrjn/HQst7WZk+uTrPSCLhUOwTXGqzGbNmu63mB/5ZcH2z+zJvnWefyrnH63h+dPIu+2rCL/MeB0j3pZYLVpIxb7YbBtpC8wGi7wbmM1Tx6oCzyeT+hvq0Tj7Z/mc72OdZUuPmPc3dKcJMcQk7KYHy5AzOyxqtCW8kAThh3iM2OC+SdSRRGad7UeaulYLGq4AuX+Ggli74ALVjL3cBHuRjTOoOIrBNfZYQ9xzNXAy+vDe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9l7oMcfFSuPDv7tw0NGXi84Q3nR+W1keSH7dlgGJ1A=;
 b=FUmV9Yh6D+8N8ago9/4JbUxAMByUx4AiZvw40EKRE1XmUeWXLkIuuGLHqmquAnfAp/3suSo8LlMgHC30gnMNWOwqBzOhOS/Y5b9sI9uRIHAQlNhhLy3QhnIJ9t6j2Rvkkepv6TGy9h4JSiQZxhZ7syIA+t5fVl7VZ4db1jYckpY=
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Mon, 26 Feb
 2024 21:11:18 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::c5) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:11 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:11 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 10/42] drm/colorop: Add TYPE property
Date: Mon, 26 Feb 2024 16:10:24 -0500
Message-ID: <20240226211100.100108-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 30221c8a-8a2d-47c1-b304-08dc370f7950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwFEa9cCTm+6RhJFJ320xbJNqMB16MkfG2+sB8nv7OaWUIJXF1l/A7EsYqqmstOAi7jUoE2BbcPJdGTghkQlC8N8Q+o7u6z7iWyC5wAV14pFzah6YWId6nOE40zuNHjuWOJdp09hCzs11sCTYlJG+rDYS4ebwA328Cpch4vCj2sdP99fTgDd0dX4eotgfdUYh2Sbxsramo7DNWXanhnXMtr9gHKVbNS4J0yfVP4ZiSwIoWGSVdLV0yUxef8WX1LsUpGf86GZHaPTd2XqJIdQ6zfFLm0Qq/md5DEsSuBiTmu/EYJPq74fq5j7B/k/kq/BxVQwB1IE4DtArrmK035l5haNS+PM/GXKBymHWS27L0LsQdMD34+KIfJYw4HyBZ/ehJjk7OfzS4F6vvRKg2DwjyxTdSOY1hLmF9NQZdU+LmRjN9F9SHzKvT8opK/GdwWd3sX6b6tttdACPqqsZ6gLYlOFho5ZpEs73YyQseFumIFtVoSQOqIg5xe7SHtnhWZKCMx/eeCD6u3CMpvydAl8/wtSjxSSORpb6cU7kXZ8EKX1EIv9CaZyNAts5AJmrTSzu2UxGKXoy03gAeZ+q+/Zfs4hDhZ0/15LL3TJoBup5ShzcIloy1zUtfduofdcIxvxr0nqkmQrU/Na4Of6xic2mXZeBdrbwHS5Hdid2uoBieaV612wD9G5OM8Qk3W1ZBl8GiDHZgIlr1CsV0L4yJLsAiVgak02p755dQttdOReo1jKx9x4CjgCfIbOcxpCBzB9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:17.8355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30221c8a-8a2d-47c1-b304-08dc370f7950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
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
 drivers/gpu/drm/drm_atomic.c      |  4 +--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++-
 drivers/gpu/drm/drm_colorop.c     | 44 ++++++++++++++++++++++++++++++-
 include/drm/drm_colorop.h         | 17 +++++++++++-
 include/uapi/drm/drm_mode.h       |  4 +++
 5 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 62e87e6a9653..b400e32c9d39 100644
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
index 1f9b6dfa8ca7..e3067c095c72 100644
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
index a295ab96aee1..3a07a8fe2842 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -32,12 +32,17 @@
 
 /* TODO big colorop doc, including properties, etc. */
 
+static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+};
+
 /* Init Helpers */
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-		     struct drm_plane *plane)
+		     struct drm_plane *plane, enum drm_colorop_type type)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
 	int ret = 0;
 
 	ret = drm_mode_object_add(dev, &colorop->base, DRM_MODE_OBJECT_COLOROP);
@@ -46,12 +51,29 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 
 	colorop->base.properties = &colorop->properties;
 	colorop->dev = dev;
+	colorop->type = type;
 	colorop->plane = plane;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
 
 	/* add properties */
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
 	return ret;
 }
 EXPORT_SYMBOL(drm_colorop_init);
@@ -150,3 +172,23 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 		__drm_colorop_reset(colorop, colorop->state);
 }
 EXPORT_SYMBOL(drm_colorop_reset);
+
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+};
+
+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e611f830f986..cb98c55f8387 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -103,6 +103,21 @@ struct drm_colorop {
 	/** @properties: property tracking for this plane */
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
@@ -127,7 +142,7 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 }
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-		     struct drm_plane *plane);
+		     struct drm_plane *plane, enum drm_colorop_type type);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 9e8f383935db..0cbd6bef52bc 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -866,6 +866,10 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.44.0

