Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE4C1E3F3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715910E8A7;
	Thu, 30 Oct 2025 03:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1eGi6NgK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6A10E8A7;
 Thu, 30 Oct 2025 03:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR6kD10uzj7DGLKSG5CLCc0/3fkTteZuHPXGR4HU69Y7iqI7idQqlfS/aP3hWTEU+RyhTmwZQub9GhYXwGvSDVhswoxm6Ll+E1Tz2WmddO0g53ucfG7xra9kggfjW3SjMzC40rlrsJFxBiTCwd9Ovp02q8p4+ELaDByVJsVT0IMuPjUwWIMoJLrL25C3QOqzi2wRWrONEpVvmhCawBEoEWqTRHvBIag9cCmKVPWQnC4f5HFXKJhhwsd8tIjxcE9B3Xf50UAI6r99AKmyQE75OBivUE+Z8Ls/UCQ1wSB9tui0FdqdZCRllGGRtEchm9IJAq/w+i5cqmSD7RCC1xos/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB7afy9okLOHwl2j4ZqFQEmFj+l7DuLEb3kj7joVt6s=;
 b=UmLIIdX6QhlakgbUVeEct80N6jsdjfNYQJumRF+bianpcajg6RZl2kOhUtT42wb5ZUOeoVqmCsUZVwJqpMJSAVehiC8RZ4DNJIaUZD/KnTESD5+6nvsG9KnIgcE8CDerSHp1FoBCJUYDQcmnwc9Uug0gnYS5hmsjmf9EN2/eVz0UyTiv+5OkUxkr2RS9NZYgM6mvs9dFUzoCtaLyJ/D0wdC/W78yJu/bokTW2D5MWlB1ZAuBIcCzInCLef68825AAKKYqtAwjrsXpFFq17rR4f3/JNE0C2eSq1frZTojMVxnVNz6rQvZsAawEX9JTCr3CXaPH/5Mzn6szZtcJtcU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB7afy9okLOHwl2j4ZqFQEmFj+l7DuLEb3kj7joVt6s=;
 b=1eGi6NgKvmB0aUKlOM5FYCAP7oYEpUX1tH463/dC6/tqfLAyJ+9WS2ZIjLi4oIybVPLvopo7UoOvPEgVHeoVf+QpdoOdEyj5e4UDwy4D1Chy3uc7NgUyAIF/tL5USJ73NBTnkxrheftyk4Y6MYgtdaPzLp57xi9/Y+5htKNuc/k=
Received: from BN9PR03CA0754.namprd03.prod.outlook.com (2603:10b6:408:13a::9)
 by MW4PR12MB7310.namprd12.prod.outlook.com (2603:10b6:303:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:46:28 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::1e) by BN9PR03CA0754.outlook.office365.com
 (2603:10b6:408:13a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:46:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:46:27 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:46:22 -0700
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
Subject: [PATCH V12 08/49] drm/colorop: Add NEXT property
Date: Wed, 29 Oct 2025 21:42:13 -0600
Message-ID: <20251030034349.2309829-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|MW4PR12MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fc9f0f-feaa-4e92-de36-08de1766e7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/fARgxFN2scOwg2bx/14eO1BgTikywcUC9Q9YL8LpUIy31Q2mareFf3ou9iX?=
 =?us-ascii?Q?WYLbVvmr7AaA+TUqbt2sM4+jqzzlkQDFe33YnBuOtwmog9xntViAuQEusnM2?=
 =?us-ascii?Q?ZHuHZrPDukqe7eUG2tyd0ZYqRqnhO59OLO/ZvZbLOeXWwojioXKY2bCJwn0H?=
 =?us-ascii?Q?yRMyJFA8/kupDVej+wihJ/W0WEvWB4NErRyCzwzXfxfyGnQB/my+W73gPWtW?=
 =?us-ascii?Q?UeJoCLThMGKM2YGeGW+54Aq+Ef2n4tIu4cOq8f7g/0rE3WCWPpPDauW91Qpy?=
 =?us-ascii?Q?HhefuFr4bqql4wap8UISy1J9rJAz+SHCH1wQZyUEeTMuNeU+XuGSIWedMqn/?=
 =?us-ascii?Q?lFSRn73xsOc5AhuK4M+29QsE7oAUI/rH4iD8+jC1OQEszJxB7rPbcRzkXw5/?=
 =?us-ascii?Q?P2x8jiGOoF9cHAxNHj2AZY1m+zKdT3hJEv6mAd/jxInE3kw55o4olxmOgkEH?=
 =?us-ascii?Q?qaZZshi2mQNVr1GUyoNj7n5t9LTmg6eqjlpXFAoZDyVOcZ13vV8hAL8dXtOF?=
 =?us-ascii?Q?d59qFxXlgPfhJ86jfjFs1h3UHPcd++LtUL/kw5+3eV7QE2r1U1uXioPulXGZ?=
 =?us-ascii?Q?IVVxVSSLw1h4R6ckflfBYrKHLXrxHNGeO3ltAwqDmaM+fumiVvpdTVXnqjXD?=
 =?us-ascii?Q?26uzTIG4h9uDaDaC5o2aTPEJYadqLxqdhoAeYW+U3DmLqWL6+UFrME9fCqk7?=
 =?us-ascii?Q?D2nSOXvh3o0XqS6bImL7dgxL1+arya0srMF6IMWKzzfAlicipmc8RfdEce2b?=
 =?us-ascii?Q?5DKCizKDk0+fd5CFzmVhigOdfucfAVvUg2IKjgMl+vreDEPV7z9ttHY4xdmj?=
 =?us-ascii?Q?izzg8pt9H98rLbyuw8kgB+hqoeLkbs02meuvCgLn2bEPxGMbFBc2kRNmtGSu?=
 =?us-ascii?Q?0h38yQBbCa6dEo7N6DOCJxwGcHjGGp3OMztm8KX0pJm7Ug7NHgP8Axv+I19y?=
 =?us-ascii?Q?PUDkS3M3qkHfqjOJM2u2GLF+6nG6PPXVj8ZV4VmKJYT8pFzfs86p0Qspp86w?=
 =?us-ascii?Q?hoQrUtkK9QQnLaeK9zE8vmmVzbW7BYSfDnEPwumR9ZOMUqsm7ks1v+ikA/iD?=
 =?us-ascii?Q?CATuPdboYwhcOPLwRTt2MEwOg9Cpt3LHrJpmAySZ/1JYGyDW32a1VxAwmOf2?=
 =?us-ascii?Q?GAc30nsmyQNTrirn6ZARXBzJMl9Ev/4vL+FzqShfE7EfCau0Y9N/xN+h8SrT?=
 =?us-ascii?Q?Gt3PIe2h27+BCiIO6+VojgDChj/Apk2TMdFT581Zxhy3Bn/rLXfRxZydC+Nl?=
 =?us-ascii?Q?eH65sgZL5bcuSCxUccBLNS5gSGIXMBluzEKvKA4UYiG+ISaAInX//ghHonYK?=
 =?us-ascii?Q?6QyTAwY0+WIBnJRz1zdgpoDEwKxt063loci79+eZLNJZtz9NA6N2ieagU20f?=
 =?us-ascii?Q?2BDatlhd7LaN3u1pvgq2n7OwJpOG3q07jcyrmCq1dDq+ZJBAVYLy18rwgfZl?=
 =?us-ascii?Q?RTIeUV7511Y20u1dz1UBaiJ6E3h5CJ0/hx/7R/BBY34+GBqDqdqjn3Ec6myx?=
 =?us-ascii?Q?cPROKbJ4IZxXjyxvPORqUDVp1SMWwo//YhBiXN/RTx4dJVJkm69Jvda4eRk2?=
 =?us-ascii?Q?Rr9c6MCrzFpAzwfUARA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:46:27.7869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fc9f0f-feaa-4e92-de36-08de1766e7eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7310
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

