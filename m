Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F769F8B57
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CD10EE74;
	Fri, 20 Dec 2024 04:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iLikSWV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381910EE74;
 Fri, 20 Dec 2024 04:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5CwMBgQpG60NdfkAyZT1PG2dHxCdKPVJDmt57er856ouPk2M+pChYLBpNk2O9tRyZc6u4q7a333iz43663OdGIwEtogSaBrvACx6EpVUDOsk4olHccjlEKh2oR+1WpDdWdOEuxPy+48UUUPuXiBr5H5Dsppugrzh4Di0KIwxqpKf5urwNvAI+y64W3AO/t53ThbV8nG9nidYK0p3xNIAFRbRlktLmyv1sUmkf/8LGZVRnZXhctbVWfncKgRlxxG9bANanX6qcejwWlQcATEblTWvIPyDTcmAUnhm2lD3kwC740Eb2KMMTvMny/dspUjii9k+ZrfP31Ocnw9p8104g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhZ2cxLje/C8wfGl70LOTg90GCpyqLKr4KR+tYWElj4=;
 b=OLsosaZmOmmlnSDa1uChTGp/Pj0li0MSmhFCgckFRyA7FvCiDJd4deldXncy5Ab3W7ORvxnjB/HY5o3TNFfJ/ZQjj1OD0WSMlH3NTX9WGCCiykClrlHBucQHhTZ2DIBkRFQjkWxwKdvjtWScpF1ftfnFDkCCJD8Spx7c0uUel6UvDBE4rEoz0cptRW8/7bnCWkWfrJB4pRgXfeVGXMsw1b4pu2aIH9VmJuIW+peHy/InpyH2lBT/L+eaFMAq3b7QPQecoZtZbRfv9kHMbij4FlSGneodNnd1oxYqMdHTruDo++wxDhQNjZdgmniWYLZt83HVIbNkIpVBhK/tLlDkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhZ2cxLje/C8wfGl70LOTg90GCpyqLKr4KR+tYWElj4=;
 b=iLikSWV86LSz2mML9Aa8gdT3CqL10usw0yTyu+WOvnyvpfJuPdwgvwgSnEjwtPci5V8KV3lYJIoPwhQ4udRdWfHzTGde9BvHy6dZqt2vjUMSzvG6Lul1MXs7WedYz9gSJUIb++tET1PlEB8WwdkZk+eanQKEZ6ZKt+7hLR0wPsg=
Received: from SN6PR08CA0002.namprd08.prod.outlook.com (2603:10b6:805:66::15)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:38:12 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::8b) by SN6PR08CA0002.outlook.office365.com
 (2603:10b6:805:66::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:38:12 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:38:02 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 10/45] drm/colorop: Add NEXT property
Date: Thu, 19 Dec 2024 21:33:16 -0700
Message-ID: <20241220043410.416867-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 532ec76b-2e76-43cf-4f34-08dd20b01cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nai9qPPHFvH3BKShscw8Q93m1waobmUF6HA1EjDBvinXApt+E1x25Uubtrkw?=
 =?us-ascii?Q?H2MYKxWk1PmipJ7vvkf/t3/d/c+L0Oj3AiQCnnphuktCtmBlO9m5Kfo2Lfyj?=
 =?us-ascii?Q?gJPSjmuMXLrsvhZ/e5u5W3Rh8Au2YUL1tqHXtYNODfGMXvw7I2q79aJDUxLu?=
 =?us-ascii?Q?utYk6DFEHmX3Yb0SrNclIoOh3zHHEE7PuIcK4MKJH1c5Y4gBBJjmlkKtCvcR?=
 =?us-ascii?Q?Qwi9Kn5Imyfjgxtwiw2XuUCLEaCGlB6P5Jaz2CK9eyzjRqxm//JEXWbOg0Om?=
 =?us-ascii?Q?LUkQKTtwKFPF3wt0Bjvp06mnCqbiGNWudKTv96yR8EMqS+/dbsaP5Kj/wO4F?=
 =?us-ascii?Q?y0n9M5p6Z9J+1bjqi/BHmPqi8Q2qYZdESe8TQcxeihoUQ6ZAuDxzxJPYcyHS?=
 =?us-ascii?Q?rZuMu6nigo3FQOv8mOHazZalzCrYSBN5pNlJqjKprV6aR9rYR3dzlscVJ3pe?=
 =?us-ascii?Q?MJj16s5WfJPEEPpcvyboWM5pE58zFsH+xq4skhO8iLNiFxE/Mfwl9nUxlmdB?=
 =?us-ascii?Q?w9HDzSnIrQnBz9XOkVg2o0+UYpwJ4KpGWfYrM7/DxOJWC5suP20kP0MeTxGy?=
 =?us-ascii?Q?EMuF+rIdE+jwVvXb3V0pAfSIQYpZ6833mzb3MkvrwmGPWoh4VmIjjGeCy3aJ?=
 =?us-ascii?Q?TlP0X8eVKZSaMvZ7asfC4RlPePIFU2251PaH8BHHa+bMML8puUqlyktHNANJ?=
 =?us-ascii?Q?Bawym6dHTSLc1rOnvS/t6VegGnTvD8vNEY1tU6jd6T0CqpG3t2KIeZbJH1pw?=
 =?us-ascii?Q?KzvGZuBWVcJkFESdQ7inhNAGB3NtrwMAoVf/+7faxIsqBTGHqYsOI4ensVna?=
 =?us-ascii?Q?+B/kdNzEEf5rFXpJiUSEkJYuoxxZ/n0QnqbCroKr7/73PMl/ZnWGAXRnwXlc?=
 =?us-ascii?Q?HAvRMrSFrfM4JFBji610rOoePfAd4ecO6D7XpnEJT6VmZJiqlErCm1Pkk23y?=
 =?us-ascii?Q?31vc+Nxf6kXyVrUl9NCGfpiqxBGSQ+Rm9v7197f67Kn1psjHiMhHXLvYpiIb?=
 =?us-ascii?Q?9iJF7BjxLTdjXInWR8zlDiaJzktFjIOcb0izFtX61WJJ5gTPhsSMptCZR2ZN?=
 =?us-ascii?Q?vbiGklF+perbSiRP9jOxMBxX5xC+TON9T9QeT2Ki3umKAHdGwkslPnBLLNTb?=
 =?us-ascii?Q?4wvAsrbkvqSSELGCDIS45e/gYP9hUIjqTwhm1rxfsGxq0lpKahgFZC63ZxE2?=
 =?us-ascii?Q?nozM6izft3dLA2DoHE9OpLzr9I5qMt13gybViuOzVFoU00XWtK5RDIs/Po1R?=
 =?us-ascii?Q?1PY+8g8xng4PEBfqEGW9d4F6+0iG1JbfUwPqBSag2FHvGV39fA80ZdMY6pVB?=
 =?us-ascii?Q?tIogu28ThYQgfEpeoeqTgbQsK8abN68z3NcAu+txC9VZ+VLjw46bBgmmK3//?=
 =?us-ascii?Q?Zwqdzl0TGH3juv4c0XCCp+d2jMbrYYvP+n5rf5a7czNjSQSaaB828qui9Ewn?=
 =?us-ascii?Q?lCX+MMndaypCLK7pqH0COZelwf3+1zfMWEepFJw/5dRBqetr9v+/VSvJYZQ+?=
 =?us-ascii?Q?x2AnkfwVaH9HzXs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:38:12.6074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ec76b-2e76-43cf-4f34-08dd20b01cdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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

We'll construct color pipelines out of drm_colorop by
chaining them via the NEXT pointer. NEXT will point to
the next drm_colorop in the pipeline, or by 0 if we're
at the end of the pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v5:
 - move next comment here from Add 3x4 CTM patch (Sebastian)
 - Add kernel doc

v4:
 - Allow setting of NEXT property to NULL (Chaitanya Kumar Borah)

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

 drivers/gpu/drm/drm_colorop.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 01cbe90635e8..954acd09673a 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -89,6 +89,7 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -121,6 +122,16 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
 
@@ -294,3 +305,22 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 
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
index 5ed24d60a99e..2f0572be37bb 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -165,6 +165,14 @@ struct drm_colorop {
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
@@ -192,10 +200,20 @@ struct drm_colorop {
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
@@ -268,4 +286,6 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.43.0

