Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C393ADC03D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1AE10E4CA;
	Tue, 17 Jun 2025 04:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J1k5/1b5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B352F10E4D5;
 Tue, 17 Jun 2025 04:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3dGnYftMzSFof0PcWuP3jsLK0CepFsnX27px7WML43U6HYO10WabbEG+OAkdofT5zgKB9BhrDkwmYrSO1t2K3HaAAKcjxnAaD2b7so+xyfBy6S6tklEz/gM8wE6O/LWeypZwyvNWaC9QpiJsxOqOFAGbNTQLEShD/PDZGQsFx75Z42xugIxLVf5V/lA2dtzxw4raVxTEPf8e6/5zifqxuwxsaqM9DyHUix4EenYslUK8yTI5vS/252jFYFvaAAvnyAHYnMKrIA4pNJu8DVcKtKVhi0PrRY9p6w0M7T8qjh8i2BKbC+DcgCX4ndtBEFO8vzIEdXIcPRwF9vuRHCAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtpXml/0OKcUUmXcoOJlEBDyUEriOZgLulMENI+Imuc=;
 b=aK9/yzKSfXVOYcS5mPITEJon32Ju/ZvUSU5w8lNDfplHfwMFB0UlaGQXtethrUSGBzYq+X4BFhndp82nsoYICEjptZreK1Y8dblEj+tM6QzICoNuVqb6hF86RZLizjSRi+L/ZRnq0CnqhwQ5aL6YrbKx76BuiHw7gm9VzNs+bfl8J1uCQvZWKq22hheRGjM3kW1QY8KU1EBuTxx2f5BDMZMsIB8A1Q0P6FeMuFdvc6PoyTqVtFn8740HGqJi45klMzCsfH+yuIapNe9xhMNgC9b0pAzLBGIyPJUEyIG2XC8G+VbOE/DkIZ3S2MHRooKVU+7OmJIq9452ORmgM3iPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtpXml/0OKcUUmXcoOJlEBDyUEriOZgLulMENI+Imuc=;
 b=J1k5/1b5LeDrZxkzBzkbpA7g4WbIzf+RKfODf/ucMPJroJgFECuGZ5fCOESV69nOKjs3nE/4WFk+yXtTGNkJ+LfhIPgtV2+7y1uU6uj/P1aNRgxW+S0Pe3zeOXa3lXoDISxFeaAD2djIEIioiGBR1xJGLr9U8odV+bWcFeF0/GU=
Received: from SA9PR13CA0138.namprd13.prod.outlook.com (2603:10b6:806:27::23)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:20:17 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::b1) by SA9PR13CA0138.outlook.office365.com
 (2603:10b6:806:27::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.18 via Frontend Transport; Tue,
 17 Jun 2025 04:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:20:17 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:20:01 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 08/46] drm/colorop: Add NEXT property
Date: Mon, 16 Jun 2025 22:16:50 -0600
Message-ID: <20250617041746.2884343-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: de4ddcf0-ba1f-49cd-a3af-08ddad5643d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FnWNLIFBEAAIHqibvtkD+VgLJ48YCZ0gH0kAonGf4DIp98jXIIOrSAEtj482?=
 =?us-ascii?Q?pcki1qgRFu9PH10u0/1+IhppT6fVW08/KPVQnuhI77bOY/7VSxjBfAHUtwAR?=
 =?us-ascii?Q?lmg5Q96qSbE1MQF3e46QmrGpSz16JmQcu/F/VPZOl8+Uy3apnI8R4QUuM2B7?=
 =?us-ascii?Q?/F40MQYTws2PUrBLjWnRTW1FoKNgig1MuX9v+vEUBhlITgqyqsi7bNmXknrS?=
 =?us-ascii?Q?4F1Mjotyo/gk7+MRmEMwgwj+OC3u4JFpY7ukJsNd9gLGKGwS5+MYNZzWYJnU?=
 =?us-ascii?Q?JXz+RiTdDF+ea/Ot8Q/1fwlYPxz9k8oUpuF1rLVTcATG02y5+rGG/JtTgMVD?=
 =?us-ascii?Q?Tw3Rc98NmkqXJuTBDKP5aw59R3EIr7udY0Ntz9o8ppdWF/TP9vgz3TLYL6K0?=
 =?us-ascii?Q?cOeEdfsyaheBPaAHCp728m3aj0jwY5TTNXFunGnVHTko5ljNfFGdPO2E263B?=
 =?us-ascii?Q?/ybp61/5UgxqFRmjcCBzmYOJ2Hlx1dBpdG2P0bHK94E5Wv8d+WcnLHmPPUOJ?=
 =?us-ascii?Q?pWmMFNcvDJSZUj/40GEAaiGl3ZR0VuKWj/Cv8oJ3BFDWSQ1WRHAhs3towkyd?=
 =?us-ascii?Q?OIawR+s/RBzoJ5xKsEdzgd/WdrhIhZ8AsKfu4XMsAPXGG1pS8IIvHwiV9JDh?=
 =?us-ascii?Q?3OCvQHuySjWp16Fz75kFfh8614tgF+hTdu/JOqZextBXjBKNlinPmoQiruDR?=
 =?us-ascii?Q?N/kXN9lryqUamlWEGQ9He6slA2tC8LO1LFN8MMNo0eCaiq6k2yhazEwsqI8z?=
 =?us-ascii?Q?mcgu+IOr02jj1q2r3hB5SaN15SfzvbqWet2gJjW8iEOJoX6K3ZRttLlYE/H7?=
 =?us-ascii?Q?J5vVuA5uEH+AsvljxXb4qfEqUCcrFD5Vc7x8UMqvdyYmlb3flkJHxHlEPn/d?=
 =?us-ascii?Q?GIqx8/JM601h+l9GLiWLtd9cGccsZIOWCAqP0KAzY8CJVeN57NdVz8KJzUSh?=
 =?us-ascii?Q?0tpACCEl+wCb/8MMuGjp2oEMikDrMI02auBEaAvqVFVTW4GSvtoHDCVs/ph/?=
 =?us-ascii?Q?7f9US1b/nEE7/n876WVmJnCfEXvx+AVVteI279//0LK2CoMGoqePybx6A4qP?=
 =?us-ascii?Q?/M6pBdyhrJuHsJlfM9zGxUK8nNmpc7S+hnG2/101zOgHg/vgsMYpFALRHLnh?=
 =?us-ascii?Q?do/GZiVSRQ4PCmkcIpaWwdFt60KMJXUlSmpTrHit7SN1RPSOSCNOIw1LweQf?=
 =?us-ascii?Q?Hw8aX4vgsy9N3qwL1utK/iIo+cPH6kXIG1igMVevtcWnY5x+ybVD64/vFQaa?=
 =?us-ascii?Q?UJZXnJc3sIeirqomOa1QxB6n9FzRHbEOU7mrXMJ9MC/EA7xzrDMvuMc5RxGe?=
 =?us-ascii?Q?25LEBizO+ZXbdJ24KiDchQjuXa92GbYU7Z3QkgG3yXFUrVCzSTxikQSSdrHo?=
 =?us-ascii?Q?q/pajffCrthC9gntP1Xm/ol2q98lJ3uCwlDkJ7WrhbLR7Gt1GNeYHeKyGgAE?=
 =?us-ascii?Q?R5DEFKZuYE0krbsfyMXWt+tV05dVQplDxIgBH6frZ/wYtH0GQVx4aO5AwbzC?=
 =?us-ascii?Q?Zyg7cmgXVkxKhy68jEn+Zgy+m2EeEeQLXd2W?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:20:17.2505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de4ddcf0-ba1f-49cd-a3af-08ddad5643d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604
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

