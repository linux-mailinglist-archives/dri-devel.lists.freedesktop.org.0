Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B379798972
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FCD10E8F4;
	Fri,  8 Sep 2023 15:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F22A10E8EE;
 Fri,  8 Sep 2023 15:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjhBMGBMpbt+le9BscVSzcqkpJ0F0NBVH/KZ7rAMPsaHLAoVgE1rchi3egIKXUS5RpW6n2STthd2vDZpABbPilUN/8lAkOK4s22KWOnPZCVCjj2PO+XyvCcUR48jiNgTiEgIX9O81RUEfDllin/YleQ9CGWDm++MJLwHc/I8Hvy/ZEiz8NiPy/L/WR20SHvgeMCiDFN4/JF+2PmJl55bs33Wbhs37zPlt3f5blvrYs5ku7ioX1+ZEORLyGiCzm8mVBdBW/VlX2irpY606f54GCvi6M+je3k1RKXVxeJJaGpvYYB12F+9gwT4byC+b7DcuDgOqD5NUY+rRwzRIEUICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmpUnDxE1/dF7nQ3VvJIbQhffQwnJJS0FXOlqkNV4P0=;
 b=OFUj+QUHNnNtd1JS7qDuTEcXLc2YnOlTW5aZGZUfYrhvEEIEhF2bj8f85WbNE32CUIkIrNa1xZxaV28eXDYi3paa1aQkm2wgXLwDBnIEWJRg26XHH0SFcuMPnQoqFHB0kKreVW2tISSVj5PCYI6bPul3czv2DRScv9+iI0iaSMUlr5WHD91CoiheSjg0i+RmDem8ME2Yg5cwyrhR8fSq5DqNo7w6CcApO3wEo6VTSdipaQZqfTR3CO/K6h1iUwX6/458pbwRU53UZVoX/a687mn8tI4Or2wwBm8U9GY9772C8nQmF3NyOx3pWWzQnfh5iD6viVN6chLBS0PXxhEW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmpUnDxE1/dF7nQ3VvJIbQhffQwnJJS0FXOlqkNV4P0=;
 b=laojvoxpbN/8DLJfAxff0UH3Tp0R89VTYjJ1fGymLGE8/StZPQoz5bRLbd7Ledz1VZKtk83pX+z0IuyxcUETHoUaS1nRHF+SoztbMPT4ebAfhus4CWD/ANWGz70oKHFTn0QFWJm7gJR3kfH18U4JxNTItFB7q30GzSsLoyo3HLU=
Received: from MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::16)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:02:47 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::fa) by MW4P221CA0011.outlook.office365.com
 (2603:10b6:303:8b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 08:02:45 -0700
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 03/10] drm/colorop: Add TYPE property
Date: Fri, 8 Sep 2023 11:02:28 -0400
Message-ID: <20230908150235.75918-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c389cf6-7bab-4b02-99b4-08dbb07ca992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydA/kIB9uw7Lj5a64jjZ47pYMcHMA202aDLmJVfTF+8Xm1bHCVbeq97LX6ACPQBb/CRcHoAvGzTvn9UrQjkbwnAoFs0vycxmO7jkfC2l/gG5j+PlWSmi2LWZfNyvCs2n6ngL+8aHDkQA1zjtpDNsBK7Er+XloJLcSBT0jLLYMd2pGWN1reWhn/eEbrsC6c/sG8RnBFFM+HsWorocD0mmwMC0koRtq/7zAGrqt1VKvLENJQCF8C+C5SbJ54ISxK1gZdx2HcLFDjud3oasP2CpsErwk/n/RxHijBBFxbtcwYCD+qDXE8Weee6KcVy8pdlGel1RMLocsqZ0tpVIDi9+TU686J51A0QMaWqHaFx1xc9W5ddKnZp/32EabbIqGWEA6wrAiZk/vtuyszSa2Uu0bE0kkH74MGXrilDnMvuh9bRkGTwyzfu5oSobzTN7APDDOYv06MbSui+zWFGkZux52DQazWQtWBZIuWTlpIGdYYcuAahOXsvTKyi28tYuHqDtGs068wV2TopfKzWc6e2xYQc3NMs052oKXPX6JIEjTNIy4ncP2CqYBySCDBp34fTaBO1QJQW1Q3wQZHK078WiTHn9vDYqwQ5+/BiKq9Z6/stzHeF+qKbgrZ1+4XB2r3zaR52SAnO7xhtk8y73eCmTQ+6UhUB+PfR1zAE9DrOM8Y8NWgIFuseFOg75OwJB3lZ0BF5qcWnKp0BzZYud5U+0/NIgZIQnzeY4URPqSb0Cpi0oj7Of9LWJPbj5XHajGYZ0H85gVmnbmemCZyY5iOPHfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(54906003)(70206006)(6916009)(316002)(70586007)(478600001)(356005)(81166007)(2906002)(7416002)(86362001)(36860700001)(8936002)(8676002)(4326008)(41300700001)(44832011)(5660300002)(83380400001)(7696005)(47076005)(6666004)(82740400003)(2616005)(426003)(336012)(1076003)(26005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:46.8885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c389cf6-7bab-4b02-99b4-08dbb07ca992
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 +--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++-
 drivers/gpu/drm/drm_colorop.c     | 44 ++++++++++++++++++++++++++++++-
 include/drm/drm_colorop.h         | 21 ++++++++++++++-
 4 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d734e9d5bfed..8a5f8cd22c8d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -627,8 +627,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	/* TODO is this necessary? */
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index b1aa752c1848..51072fe2b548 100644
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
index 78d6a0067f5b..c028d5426d42 100644
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
@@ -167,3 +188,24 @@ void drm_colorop_reset(struct drm_colorop *colorop)
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
+
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

