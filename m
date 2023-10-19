Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936A7D03C1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AB610E548;
	Thu, 19 Oct 2023 21:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BB510E548;
 Thu, 19 Oct 2023 21:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SubGtVwiUfNnvCMumNLiaTR+4hu8/77fWffgxJ98LmhgpKMqeMC62NJKzHHJNKpPEzWXWZ/Mhr0S07LBvcLSFUFMje9rpDCJTbaI64gtVZp3Xdt10ZEAuBVgW8TCFDjmeek4new93ILQp28roaaGe5v7b6B+tR8hxCxbCGCOl/OSzslGHYnZah3es3ditRhRJxlHN2XrlbNLJoMQ2zqey/PcNIfdGcTeHm+C2PvAQn7xBZVh5zpbprHEmT9ER9emwWv09eJstSl+alO/A7dBH2sxk/vcxu12gHwY4/bQ45OkR3ZdNIRpd6YXB/puM2QBnlbb+5WvbuSOOXBeUr1Pcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8HqNo1KFeFGWkxo7u+LS0xHnIJKfR0yeQpbK+V/uvU=;
 b=k14JGPloHA6mkhpKm3wS6C/CX0VZrgXpotEgo+ZbGHvHMvtHvMtalXbRQDcR9dXPNHr+iW6Rl7gRq+SC3WZlvUBKaCmn+IbjTtFJHNnZSmAvAfgHEsgK/TplQotKSV43cDe9qZ6Jx3bInPfgFjJsAsLNg0WCqu+I831bfX8RtDqp7QRNKo8lvYmqpxcoEhDDSiRCoBTVMo82aUKeAALZ5SSk8Eso7oyXh60ENoCOa8jY1E4llKugOPHlAcyc25lFIzj+rm25ZjQ/zDCzVJE5pG8utMvc6rM6DEh8QMIQeptGfnzItP++tZXYCWK8hABU/WLqgSET9MXpAadVDaF1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8HqNo1KFeFGWkxo7u+LS0xHnIJKfR0yeQpbK+V/uvU=;
 b=Uqg/xsu7fmCtj74ITIG3Thiy7//l7BwhPGSyzy45HZrCS34FuNGhDawDDSi8MY9BwNZVGGJ82g9uFhZpdF0KqnCqiCTPndEXwnHtLbRxoFlNczC6ZZKU6b15doUfNoVG6XE+EaiUVp+cXcG5wnMjfgt7zhoKM97zjzfWhK6xRbE=
Received: from BL0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:2d::45)
 by MW4PR12MB7189.namprd12.prod.outlook.com (2603:10b6:303:224::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 21:22:01 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2d:cafe::fd) by BL0PR03CA0032.outlook.office365.com
 (2603:10b6:208:2d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:22:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:59 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:58 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 08/17] drm/colorop: Add TYPE property
Date: Thu, 19 Oct 2023 17:21:24 -0400
Message-ID: <20231019212133.245155-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW4PR12MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: b09c0675-2f82-438b-7729-08dbd0e96eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0RjdE6HEm156Evk+TtPH8EjgC2coVeRFVbK9Fh58tBgpAr7WlsbsKK0XquiZ8egio6an5LIDRIeU7+nNHOafxT27h+v84iDVrMmnzkasnHrXhL9cYD9RRVtjTFHlLtAoWiLJQYj/83z2s7nXwjeJ+mm6I7RNN0VC9LRjjgOipMU0eDt3jNjvDiiDWfIHSGmZCXScMLhe72TwsQ3/Vux/rdYCXkIxsGg5LtrDelS2hCMZUhfsSCuoml/+b9odSAP08OjOPzrCImgjrSdMt3BtFMZsVhIQZqrVrE0LF3BLEXXImSLdDHljRTCY/TbTuFRSVKiMcvOb1YheAPXoqFzY3kBwO9pj0OeySp7yvNvmrTkMMtF7IjIRh8cjoBPNoBWgBA6lWdErigkKkYrGZi4jQBBoPGO022RlUt22a8X5n51PxmWbyYidnWqVVtiSQcataunwXeY2j8HyEerjm401MFpFhUA0FP0le1KXbTAiMcudQR+kwbL8PUbfnNZ+/hMkJjXqil7kOfWrHEI/MaxfyQ1uzX3L51S6ll8J4MDBBsfxTHdHcpyjCLXn0WgKEVkDVMxN22lioNAPjgUoiaoU8VayeljJvqVcj0x77tF99HKmb4KnX5qr3Uo42chzVK2GoUAtMJSYBKPUJrP0T7FCob47ZBwwkDVJYQAtJb+EuyfKvW1tFTzMVQaYsnv/2RZM44ykxj+yiAKkLlEE3TIILPc2OTdeMRcwwAHl6NQlI3XPSTmCMmQ+cgjo+LVgLZGO7ffrz3wtt/LevdXTD5pdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(82740400003)(6916009)(40460700003)(316002)(70586007)(70206006)(1076003)(26005)(40480700001)(2616005)(83380400001)(426003)(47076005)(336012)(36860700001)(86362001)(356005)(81166007)(36756003)(54906003)(478600001)(2906002)(7416002)(5660300002)(41300700001)(6666004)(7696005)(44832011)(8676002)(8936002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:00.9470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09c0675-2f82-438b-7729-08dbd0e96eeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7189
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 +--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++-
 drivers/gpu/drm/drm_colorop.c     | 43 ++++++++++++++++++++++++++++++-
 include/drm/drm_colorop.h         | 21 ++++++++++++++-
 4 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d55db5a06940..524bec520287 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -636,8 +636,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	/* TODO is this necessary? */
 
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
index 78d6a0067f5b..33e7dbf4dbe4 100644
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
+	prop = drm_property_create_enum(dev,
+					DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					"TYPE", drm_colorop_type_enum_list,
+					ARRAY_SIZE(drm_colorop_type_enum_list));
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
@@ -167,3 +188,23 @@ void drm_colorop_reset(struct drm_colorop *colorop)
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
+ * @range: colorop type to compute name of
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
index 3dd169b0317d..22a217372428 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -30,6 +30,10 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -103,6 +107,21 @@ struct drm_colorop {
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
+	 * Read-only "TYPE" enum property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -127,7 +146,7 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 }
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-		     struct drm_plane *plane);
+		     struct drm_plane *plane, enum drm_colorop_type type);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.42.0

