Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64155C5FA8C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A775610EB61;
	Sat, 15 Nov 2025 00:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aX7Ojlwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81E210EB61;
 Sat, 15 Nov 2025 00:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUjpJd60dZcEP3p7KghkZ5FwpPZ4veW4derfGrBP+f5LNEU+xZamcr3OEApIc3m6InnJuL7hsethvFKH2MK4Fr14x/hAH3/4X8cjtb6MwCspvaS2Aqex3+wQr91PIhXHIV93n6k3/etGONXzxXSzFUQjYv2wTolok52arhPXtIrVavE0J+ElMsSmEj6apx5NWCvWaBv9R/W7q+7zTJjMLD6sMXZvq/2CrP7n4rJZNuCAn2oKYgFjQxOIwlB6kk+54J6KXeJSgQTXPa1+eQY9DByo0CyJYPODNIr1jjWjqTUUC8YUwV+IcyDa8czG2XFF68prb9Ge1Vyrpp+QgizXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB7afy9okLOHwl2j4ZqFQEmFj+l7DuLEb3kj7joVt6s=;
 b=mp2qYJg5FJDl7zEiB5eeLh7zzziQ94XeuNEDdVX/nxa9yqsKNdtdMpQyCxWK3f9CNeB7t1A2BpBnb0rSc5iiWo82WVyZdKX6GHSTJmkLQnX5zra9W9iGHPHkLE37CeEw89hvJLtsadHA+zxe8PfPnhQmLwU/bCXX8xqK/4tL37y7CkLKsNf1SFH/XRX8Qmt0YyLBMugLEO4STRcOFtVabs/HIZOtXmjetyx8hvrqmeFTm68YTMBpAzX5lo9uzw50tso0fHfiEj5C2ne2EVKMBDBbUjHL0p5HvpSjs0Bf5zOFipzr9/ZGTzfdaeYSPgjwpFyKrvmPBw1pbeBiuu5KtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB7afy9okLOHwl2j4ZqFQEmFj+l7DuLEb3kj7joVt6s=;
 b=aX7OjlwaZbPgNs0diMKAn306U+/Hkif+SUzZlTmbfSrVOilR8Cv7xTKpihb/4oflSToFQvhOjsqZ86IctKni1+P1CKFdENtijegcnyozxpPDsXH2brtGf+ln5p+Rpv4yUl3sPyAZOL6j0PFcLCJ7PqkmqTcPsfSlXW16qgqC0A0=
Received: from BYAPR11CA0078.namprd11.prod.outlook.com (2603:10b6:a03:f4::19)
 by CH1PPFDB1826343.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::628) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:05:41 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::30) by BYAPR11CA0078.outlook.office365.com
 (2603:10b6:a03:f4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:05:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:05:38 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 08/51] drm/colorop: Add NEXT property
Date: Fri, 14 Nov 2025 17:01:33 -0700
Message-ID: <20251115000237.3561250-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CH1PPFDB1826343:EE_
X-MS-Office365-Filtering-Correlation-Id: f01987f6-641f-458b-a124-08de23dab74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ZpOAAfbyIWnykGYAYvrjj+BJugBFb3JfRozAcHVd9Rt8HK53s+FmauUaBun?=
 =?us-ascii?Q?MV2YwY3desvxkghPZYJYS+jgs3QjzDsidCYK4WgQxvGCzGQ82A74Lmr9LClg?=
 =?us-ascii?Q?FLT02PkdOm66xy2sZDV4JgyfZDyAu7bdGU0dg8IzQoysRs7uL05ExUNT0ZfL?=
 =?us-ascii?Q?E71rY1I2yP4jQ5gqLfzA315pn6wHxlrjWwNLEiyjG/WlfKzEPmKXePLcrCRX?=
 =?us-ascii?Q?qpVow+UHJIeWtUr0E0+39B3A0GUtSCB92UQ6HE1LBaXMBmUjXgzzNUF2F0f+?=
 =?us-ascii?Q?Xas+z7Vf5QAKx7FUhsHniB8iML+OVHDHq/8aeJEIEsTDDmDx0egQgxapWGpJ?=
 =?us-ascii?Q?dC6lwMmYqPofVj7IqicAC2yCF88l6mjIn+5GlgtEXU2cyBOEVRglyQ9gmHz7?=
 =?us-ascii?Q?WQcY1F295sq7TC5CfFalUgOmJfxKbZHpf7dSsNC3+G8es4wHQpzfV2CU7YDl?=
 =?us-ascii?Q?Vyvre7nYDPJlShn/NXe228quLXTNBNN4R3FvSvquWsB1HkGU046ruDV+G2lE?=
 =?us-ascii?Q?0vHTTWya6YgbqSqYPJ4I27T/vnmYXhKDnk4q3HtcuTbYvtT7U5TjgCMzT4tW?=
 =?us-ascii?Q?W518cBAM02t9Y0cc31IaaEpLS7RgUNMGmfZP+5olJwviWg+yQVgVaPP7I/ji?=
 =?us-ascii?Q?z2H466GY/BENrV6sqmzVuMcm/yBnfp8R+26s1+BXtTqkGQ3to6Dy1uKEa9WD?=
 =?us-ascii?Q?stVWYlJ8p3X250cGeN2PHQ/xboumt3+HjzxuC42DouROKMDsT+S077CXKNjR?=
 =?us-ascii?Q?S5HtdUUbYsr3WksHw0vab1jNlpuw3K2opXmkTDWoQUGcBZp3nyfDH9gSNt78?=
 =?us-ascii?Q?QCTx71r4uAcN1F11O0sTCvAYzmjrXMPlOhR7hPQ7rKl9JqCsL61gSB0061i2?=
 =?us-ascii?Q?275SM8ZeLjHFVbGtTgbVVRnpFUolkpiP1XPiIma9tVs1IC2pPedQe9P0/lQu?=
 =?us-ascii?Q?BmMBT9ixktleNolNia/rO4lFSyHxCgS09kAoOCcHfdwYe8g/0yuLeBN68+pF?=
 =?us-ascii?Q?kgntmpOcGBRntOKgNG0IGbgYPMfhysnPX+XPApcEuEMxCmpeiVW4G3Mz2vry?=
 =?us-ascii?Q?ZO0ERXK4PG9M3a8ujNFfG3ySgwDiNE8PmS2Lwp/cV/WXCg5cTHFJuuWdEGWm?=
 =?us-ascii?Q?/AK9TMnF9rG3GEUHfgBf19KP8ZSG91A+VJOZcBFfoIylju/CcaGKZTmSuLuC?=
 =?us-ascii?Q?dPJtEjlb6W+YWt4xvKMXhMqVUVi9f+Vtdp6Bun8pWrvBSpNflK9n/NhtQFiW?=
 =?us-ascii?Q?TTGwkJohNIBCk2aEPSqlPBLId2S3WQOTUK2Wq35mHrAyow5pjruBgmge1hp2?=
 =?us-ascii?Q?sjLEFz5ernb0x4vFmkC0V0pk+JtYPc6wPYHb+wxRQVy/u7MGvmTBDn7gxQpH?=
 =?us-ascii?Q?1RfAr6Kylu8aDlEFeXrzpaSt8189//wpyHDNqZHTHdwpMF7yYiljNFuqw9V1?=
 =?us-ascii?Q?CZv4RhYTWCu6iy/zScSxuvS/7CD0Gt0wd0S7TcxbN+abE+u6GDKTQxIHgszJ?=
 =?us-ascii?Q?uzMXcOO1zU1hePe0n37xNsuOK6L45zIsCr5PgsSto7qSrX3cDIIYSuz++iry?=
 =?us-ascii?Q?O90ldV9HcJDDXP/hL0w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:05:41.6814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01987f6-641f-458b-a124-08de23dab74a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v8:
 - Remove null check "colorop->next_property" in drm_colorop_set_next_property

v5:
 - move next comment here from Add 3x4 CTM patch (Sebastian)
 - Add kernel doc

v4:
 - Allow setting of NEXT property to NULL (Chaitanya Kumar Borah)

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

 drivers/gpu/drm/drm_colorop.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 17 +++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 11c37916c758..43cdd68a69a2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -58,6 +58,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -90,6 +91,16 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
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
 
@@ -263,3 +274,19 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 
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
+	drm_object_property_set_value(&colorop->base,
+				      colorop->next_property,
+				      next ? next->base.id : 0);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 49e6564c17ba..791ab940c158 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -173,6 +173,14 @@ struct drm_colorop {
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
@@ -200,6 +208,13 @@ struct drm_colorop {
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
@@ -276,4 +291,6 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 #endif /* __DRM_COLOROP_H__ */
-- 
2.43.0

