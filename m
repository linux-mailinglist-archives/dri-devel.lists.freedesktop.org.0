Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD261AA402C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7DE10E5F5;
	Wed, 30 Apr 2025 01:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w5HVxjUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDC710E5F2;
 Wed, 30 Apr 2025 01:13:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Miwync+Zuby+cozJf9+QskJmCBK1sptEZavUqppgyUjOixEXAyAmc72GWdQkvcj0PAWHFvm8/KpdYJ6pXLHsh0zscU4GcTibqDypiManVTGlpDLnqVPTK8IXK6Y53dDr4EKNq2zN6OEohHKg8K3R+PfYWIg9UddFn6F++ZbG1rMV8hUhOKJ80v7QZaKw0VDdWU81zp9pZz9w+NcwFh6OyNpw4hZs6/KeDKpFb1vHo+lYFFgl5U3/4Vo/DNxyPQTFkkB6b9prsd/igdB/qT/BwfqUBucVR6KR/BmLzafJr9bHO9aQLYaw4cCwv90Hmk87oj0RhboMzdpH++iVm6MXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcmM952xC/apnn08QIu0yXNLsClTNsTtZQaPSUr6v2U=;
 b=n3i99U6c8p2dz17QoJO/C/t+LS5L6+qUB91foFr903yIbJdDollwx5rSVm+l0h00fita+96/BD64LWpknKsGVTMG88wPclEe67CVaC+GMevDrNDYrLZz9Taqil1QlK/11dlaJeREs8NZKrXl9u0U2GUcdzVaRWGiJ7qUEGFhKGjfDupJpuONVNfE6/O5IvoQTg7d8FH9A+3XoxNFtrC+ittOQrmsjfRD+wWw6OIM32e7Bm7PZoN/BMLXy1sM3xKkLZ+lD6VUOlf1f5DRyxtp+N2QYHNzyFCG+dGQpiZ2UsNnNb2J/2EhPSmV3j1fsa9JYEQDExJTje+ZH9K6KDEH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcmM952xC/apnn08QIu0yXNLsClTNsTtZQaPSUr6v2U=;
 b=w5HVxjUuu4/BVz9AHpzaPPuC5dxuiT5LqM9yHWYgm2eAXKh+knjeAog42mi3n9vnE4VF2zLjyDJ6+hhMB2YNBvmdD+rbUHcPKtUTp+Di9HGJ+lD7Z3RUoJHsw6/1fLvi4BpxNd1dJXeQRDNsX6Lc/uu+LBNw2SKWGDE5EWdwhtM=
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:13:53 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::25) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Wed,
 30 Apr 2025 01:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:13:51 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:13:48 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 08/43] drm/colorop: Add NEXT property
Date: Tue, 29 Apr 2025 19:10:38 -0600
Message-ID: <20250430011115.223996-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: aae3a514-22d3-49cf-6ca8-08dd87844507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YVxgdbvRxTNmCCAQejAVK6J4tcHYsvlMhYfRcQKyAgRD6OaIQA647UFJsh0Y?=
 =?us-ascii?Q?qSl1R1aVjc9JOW44QNwbLerSOVDfDixicrwLf6UAomqTrCeuB0RcUu5XCLwN?=
 =?us-ascii?Q?+rCuxX8yAkR0ByBI+njVrJxhsi6s9E3umiXug6DjOtwlu+J4QO8AWkZTx+3P?=
 =?us-ascii?Q?dj2e9wNNCMqE5dDsA0wspiI8nPVrOIuZHIoTSe7w8p/azL+F2dNuh61BTIxc?=
 =?us-ascii?Q?msl0D2xB8u/ZUPFp8/DrJWcP8lPydCo5YAD38GDd/J7fc1XW4kSdnYYcc+Ei?=
 =?us-ascii?Q?4r/1f5ynLfIxpOf9PHGhPeqlJk+/nyrUjU3rh6semZMJ3xRDAFFEY7ZaidbW?=
 =?us-ascii?Q?I61QmRFYv02eQCzy29GN6mjKTcE4kTH4cqfXgkj8Vy6e9GOOrCE2ww7wOaVT?=
 =?us-ascii?Q?Z551JFj7oz/t5AHXeZFE3XKlNl5pB8zm3KFm2Hp9wLAvxZ+XuMV8lJG02fpt?=
 =?us-ascii?Q?2wn4cHPhZ7Pm4MhGqpgTwG2W45RKPS8J+6zmLti102FqBTLcmdfWJt2TPE5l?=
 =?us-ascii?Q?IC1x/Kt8G8IDgHwhgJgWCv+hyg1ou9Y2nc23ytXuOLhXdFqpWCmG0IWACpVL?=
 =?us-ascii?Q?V108KVvYA1Jn6qvMKMyLdY/0d1lXKAjbMndO6bYyH1g1wghXeda2bS4JMo9B?=
 =?us-ascii?Q?CYDkG+8/GgjgTTMvYHsTbmOULyXiMN5KaadSjWPvI1ClsRSFDcQz89FoWBj2?=
 =?us-ascii?Q?m9mHy/Xokx1K5tBaM/yIMwyvQLv0T8ewqrerfBOzgrzpYu3lIZ82D9Nd3qar?=
 =?us-ascii?Q?bGUNHStMz3onRPC9PWtclKrgVubyD58UxbWr1X6CfBdT0Crx7ftCtbIuRm1h?=
 =?us-ascii?Q?CojzgZIhzUEVSQFQ4nJ8IHJX4LAjDOI8v1QSnOv0i4qjOZK05x3oMppi5u1b?=
 =?us-ascii?Q?0kl8FjTo/qi7hzjN2VADksfyUVld6qlCQZ0F7gazlCtQvEsPMNLO5L6dgviG?=
 =?us-ascii?Q?Byg3Cbw2+15yGkV9BstBFHG0L00LSpQVKAIbnCgWhuiO3fxsRwigRxwlqLVa?=
 =?us-ascii?Q?02+Wz+TD4kR+tCJHVKwoIIoa7m7knt+jfJxQI1+e2Aw5Jx/4ghXDPoygQ9fZ?=
 =?us-ascii?Q?yJosEk/Ldq2g+ryYIO9hGjDQ3PdHB1b90D7XeRHY67548sgEWMzhRTVD2oAT?=
 =?us-ascii?Q?x7/kLBn+RM1UEcMZJToqYCICsqu9d3HQZOZUEdrZXbrs33U6H8w9dM32Atcr?=
 =?us-ascii?Q?8NIMMypYP3uGdhv+dNKrTWjWn6vF4qrpCgY9IyZ5Du/J+DddjRlY86AR7f0j?=
 =?us-ascii?Q?45zqO5QUBaK7p1SJLJOQCs2jiq9pJeG603M3NB06XDt8bm9Jg3f4BbuErIsC?=
 =?us-ascii?Q?yGxEMVzFx8rNAOpbS8xvhLfnjdlREhHXpXoiaoOW7QUrQbrUlJzMf1Dj+TX4?=
 =?us-ascii?Q?YBlHoanFlw00FeUR3G+5diwGO9bAW5/7F7iRwixjjSpbFNvomvg6SnnznyRx?=
 =?us-ascii?Q?zTsSmOFzpjGNRuyLdBwvltzdHXXCyBtIk+cyRgMS8vJghklBOM3HCFNWPGg3?=
 =?us-ascii?Q?DoxICXk9yi9CxKUH0jt56vYlftKl+MLbXudx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:13:51.9229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae3a514-22d3-49cf-6ca8-08dd87844507
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230
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

