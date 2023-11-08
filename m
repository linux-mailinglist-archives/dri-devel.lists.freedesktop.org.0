Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD417E5B6F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C24A10E7D7;
	Wed,  8 Nov 2023 16:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5876E10E7C0;
 Wed,  8 Nov 2023 16:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGcjQgJS++Y77c9aA4BVCBHiiTsmRm1xuwQyVkuQbxVRb2Y14KGWb+RG1261HPRiPfw6i6IoF+zdBBrt/t2vsXF01slwu25xtjO+HtenngagidIcE6Y8mnNZlIzZ1rU1EjcZv85miVT/myjZIHqXhBm0O9iX0AtSw2KUT5zxVzg4jRFu4IHW8AdxSUITSuhPJjoeRCErXHhf1oPByVIPyW3bRFsHZSOZMsBFC2o8PTwGelKaPOQSWV1hPKKNQ3j8n9W/4BLxdjSGOq/Yg654rio/Hsdwozbtrn7MHs6JgYUFw76482GHAF5f+rUosWPC3a/p4YyRDA1dBNtoAj6Xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nE/NovshWiCWlaDdLm6M1K8ppc+YT9P2oFtnaheLsc=;
 b=nBY+Tc4oLHdwdi9B0nURhmYKSyobZu72dbgXFgZ6coDnXX0aG4J8Pkwh9egX72NCQ8vJJLBKrSR790l2JhfZoWrpU3m8jl/ABF3eupUyvocVDHSpl3ioxIMUa4OJS3+jBHUf9SnjoCJlGsPQa05PBUCEIjoAWx0QiId8Aq4l2fIuB77gkuv4i/+W+29vxiTfRIP5Bx+GJOkJeDOm4itaDzVw9reukbOYD2fg238ajCxXuWo5CDgMINFQwaAwXOw/f4CwRQWY41oCQACm+9XoH00LG+Omo4D3DaBnoZ5Kz7lJeAg23ybKHZVqTCcZ7u1sfr04UTNMM3zWYoblVH6rMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nE/NovshWiCWlaDdLm6M1K8ppc+YT9P2oFtnaheLsc=;
 b=EvD0YduvHtbrjAD0jRfwProb2sHKkvNljdaTYM3vnFBuOZcHjSU+CYVG1H9TmSMbpN1G+rB4v0oE6qFQPkQYU47ErIoSrzBGRaOPgeu2cqqdtOFb3qST3Jwj1VOqariw8E+Cy7W1AxiHaSLm89ADeGXngieMiix1IDrax/yjlwc=
Received: from BLAPR03CA0066.namprd03.prod.outlook.com (2603:10b6:208:329::11)
 by CH0PR12MB5283.namprd12.prod.outlook.com (2603:10b6:610:d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:58 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::a0) by BLAPR03CA0066.outlook.office365.com
 (2603:10b6:208:329::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:14 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:13 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 08/23] drm/colorop: Add TYPE property
Date: Wed, 8 Nov 2023 11:36:27 -0500
Message-ID: <20231108163647.106853-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH0PR12MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: f99210ff-423b-46a1-92dc-08dbe0791112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EBoUXUZpF0+zFDQVa6nbLYeCTQAGEOdJlIShl0rzeOP17HMnujCON1Te8BOSZxFBUxI0y7zBs5PBBJOgAEjBLlvgHLpFPBBcFSJhgqHn3oXksUkFseCZYuy4jWNZFQaAiAMCUzitHtclAeDWI9USQIBeqDqyP7KVAd01w1B9H1gWievlgFich7YptAR9XjHB2CIkS9MiKrwTdvl/7wvtRVAFV+IYcPVDlZvCAEZpNNJkuZPUJFhdyb6jvVC+vdnTwe0PbRg4hErLiRr809/4B6koqUJ9L5LwOVWKwgITUUgpvqtztAjQ+GVgeP13Fut9WKYeSWEbEP8fJxWOBiEVlqQwhgGAFFoCg9nzZTud7SpTWlYyfPWy8HZTZBns4CO4Pdi8js3j1RMR+JRDplW5L04Udwa4htccBgPIjh4vZiXBdg82RkneRvu6bKMS6SZn4SKgxWXDiYM+2LXBzkgPnN9jeHX8msdjBDz8w26QhMp/DhNvY3d2ZTinEUUEEzhP6d7gXfC69Wp0bwb+qiZLElbKDuAjd9c9srPBWfGoO5IteE7SZl8EUk8FhmyTJZ1l5DlF1QCTUdqjRcYr6S+g7X2mdSP7fQU1FMB9Kl77v9yl4RaQuVntADAn3GzAgRMXXHrcVOwH810LCP3tsPStNh+MwhOrAL+vwyM4NXEJX5X4SdM2D36iU9q+ku5P3QdqPrgxBsJ/JKV5cbZKZcwMG+tuUX8pptOOY9vBWpETXTk9sJO6PuLvlTG5dQb8fKfvfMC4gzF8PV1xZNt+Wwa6XA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(356005)(44832011)(83380400001)(36860700001)(47076005)(82740400003)(70586007)(2616005)(6666004)(478600001)(54906003)(336012)(26005)(426003)(1076003)(70206006)(6916009)(316002)(81166007)(5660300002)(2906002)(36756003)(86362001)(8676002)(4326008)(450100002)(41300700001)(8936002)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:58.4839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f99210ff-423b-46a1-92dc-08dbe0791112
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5283
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

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
 drivers/gpu/drm/drm_colorop.c     | 43 ++++++++++++++++++++++++++++++-
 include/drm/drm_colorop.h         | 17 +++++++++++-
 include/uapi/drm/drm_mode.h       |  4 +++
 5 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6390443f1819..59e1797d1ca8 100644
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
index 21da1b327ee9..f22bd8671236 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -682,7 +682,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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
index a295ab96aee1..902b13e300fd 100644
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
@@ -46,12 +51,28 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 
 	colorop->base.properties = &colorop->properties;
 	colorop->dev = dev;
+	colorop->type = type;
 	colorop->plane = plane;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
 
 	/* add properties */
+
+	/* type */
+	prop = drm_property_create_range(dev,
+					DRM_MODE_PROP_IMMUTABLE,
+					"TYPE", type, type);
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
@@ -150,3 +171,23 @@ void drm_colorop_reset(struct drm_colorop *colorop)
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
index 3dd169b0317d..0386440afe40 100644
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
index 4e3251ff894a..0ebf0f480dc8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,10 @@ struct drm_color_lut {
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
2.42.1

