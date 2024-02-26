Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D385F86827F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46810F04C;
	Mon, 26 Feb 2024 21:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mooWdgRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C8710EF86;
 Mon, 26 Feb 2024 21:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I46B2Mumceqw1xiKhXoVw1e8iJLPNiN25CjHwtV3gnHsiXM7q9hBBVRU7SPWtbe2LJFiebC0aNDwLyAnhqazJv9/0tQ1X4xjvr1iKptOqvY8eOnaYiBlvzQAqXsGFgR/iwRDhDIyV6VnF/D9Vl4csnAeERdm/s65YwjA/sh+ep5xNmgBo9790VRCljCd0J/NA/F/+V4EkUGoxrQ+fgeHUyGDgf8SOo7zMJTcZzQCURpbpAd+BOd8g2PAUPPe0+C1GLPl2j0hLlvZQlAKTVXxML0xcTDXQwtTlQcfaXHs1ekdwt2mQhqGz5UzKTpKWLbgGte3t85gephVLzAJ94ZLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCGIeP6ar6cw4vStECmweWwmdDkExkAYndnfE6xUzis=;
 b=DCkdwUEz0VNpaLtsf5qid7Dd7F+AuUqIr31SZfrDVdOncvPn5SMPOv4sEI5u+ywWbEGCdgOpuslfOahhmoC5HxLgF9+dhHTQRpnaPN/zyfFnR6Vd/oAcFJRx+68AbGNS4lhutplvslQ/Dopq8Vvd7hYRAYYAbjZMsuBsTPhbgAcZur9YBVGPaasg/cfhyhNYebtyuBqm4yhrsNnd/KSNuDbq6+wcUkWPbK7n6w5QuUCz6twvSXnDuJ/EIbBKPYIzueXbceK6ChFiuHEOOuQvF6oOcCpLlJtPPNHtYc9fhHX4b7kh5z0cdnGwXx92BGuoVUPuySa0OVclozyDffpfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCGIeP6ar6cw4vStECmweWwmdDkExkAYndnfE6xUzis=;
 b=mooWdgRNBarQks3RXthUfi4nUwXC4yS0B39ewRzDG+KlvZVaMA0GTLW3Ai1sm3OoxGqjoqHIrWMvwcWYkB/Ko9X6AUoUDK0roMYhTo6BQhDwdeUJPYAQk5Nr8/KuEN/RBGImM/jssvEnpF7RAaanNd9c0hJ2gE/d2SIY++FIDWA=
Received: from CH0PR04CA0066.namprd04.prod.outlook.com (2603:10b6:610:74::11)
 by CH2PR12MB4135.namprd12.prod.outlook.com (2603:10b6:610:7c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:20 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::f5) by CH0PR04CA0066.outlook.office365.com
 (2603:10b6:610:74::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:14 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:13 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 13/42] drm/colorop: Add NEXT property
Date: Mon, 26 Feb 2024 16:10:27 -0500
Message-ID: <20240226211100.100108-14-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH2PR12MB4135:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2bb166-c85f-4fba-cbb2-08dc370f7a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKv0RY/tQTyx6djcuua3DdbhiD+hxe0u/SdPRVrGrY/jHOeHI8nYqokjATCl1ToUnKbni9e9OK8oWkbZK4vQORKryvZJj6KOPffLCfIEHjLl4kd/tM6enqaeq0TXj9N/wO1sarTMQdcYEMbQYUGfAzEUqDaw+N4HFzTbfKp0+iolpQYZOsUmAPyR/6N29Y81jYvlVZ1v9zPjx5+hoGmnClrVSVcSXrSXVmPAx8ma5AzqeSZpfbPk4GieYQ7Hjd6ELT4f9A+xm5dZm8f9jaIoJe1MVW0mBu1Z+LBfdPmH99CVXVkFNrOM6xpDbi3FDWJJZYMVEjigCR9bVEGCK1pj61IdF4iapS/mOW5NKOHGlLR1QDoYKvjilXWbvBZda/lGWjPigomxgp/5ZdY72Q3kGC+GLR5ZmjCNbmFhL+EwLFPU3Of5A6Mrli13lWMPSWw1V3N2ZV47pkJCF+n5+b0ubBsEk/kugyZxTQCBDk+Ygw8/D/987jT7C6lhwzhj2BK36bgziNBK3awjRD3HM3sNGi4F4KhI1T3OGFB3kMsEbo9/cK5N6tugnK10GdNSap1neqitHRsrASzv2d5gh0i6YXfPPFKOu6EuYjlgwTZpWT5onlWpysTkdv01XLaar8rudu2V7ZY2Pysypu5VaQr1iDnDELR90PomxAHZU4anmGAlY5ezYe+iB5BIGYXeRrFEYrNgHG+5AQnAlM6cnslI3g+8vw5m53tOixd6fZgcbWXXByVtcKn3K7T5dLd7nARt
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:19.9137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2bb166-c85f-4fba-cbb2-08dc370f7a8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4135
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

v4:
 - Allow setting of NEXT property to NULL (Chaitanya Kumar Borah)

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 29979816a2d1..71c2286333a1 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -59,6 +59,7 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -92,6 +93,15 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->bypass_property,
 				   1);
 
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
 EXPORT_SYMBOL(drm_colorop_init);
@@ -279,3 +289,22 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 
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
index 28aa5c1c309e..8060988b5892 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -132,6 +132,14 @@ struct drm_colorop {
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
@@ -159,10 +167,20 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @next_property
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
  * drm_crtc_find - look up a Colorop object from its ID
  * @dev: DRM device
@@ -213,5 +231,7 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.44.0

