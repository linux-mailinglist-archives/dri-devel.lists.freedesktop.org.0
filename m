Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B96798977
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B7310E904;
	Fri,  8 Sep 2023 15:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C16C10E8EB;
 Fri,  8 Sep 2023 15:02:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwobJqS0Pex360jeb/vkXyhmtIZawM8YFzC8pFHA1Q3wWPSz0j+GAbzmYkS8nbp9dwswHW51mjCI/7PrVxBlRe3W8e/oryx1l+EkPYyje99KKi+LnFl4IGPd8IBl+VK2qgFpvDlt2jIwVSIipcNpk1o/YYaQBcE4qVer2QxFkPMi25C/CuPpz1OwJm6yXHJk40jz+cfWzImWeldnsdAJ+Du1yXyRhNT4x+quPN4nOKU4AlrP3y4XNX0ITt3Q66D8jcZqW5ZWNwgU7JEWgOGNlL7IapwKETng3iWrwpLDnRSTcuOBEqloSf1qr70MF4ZSHEr0/+pTC5PHHTUOwOe6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AyHWE16a+ZcbZwTDyfYyqBwyEeb91a2io25NiAzqmI=;
 b=LCVriEwS/idl0TXst7al5rCqk2YzOU5SJ2jWoQuk71tCU0KJ8hZbc+8UjmERKyhi4pWKDzofK1EbSm6mUhbhngA41ugCMFTy25XIudkvhzaiodW7tkdN6FM4dKhvod+lqoUvfnObEG/opAuxuehhqPZHCcwkJv5jCysTWjnasO+7qxPOyz+ErF/BunPSFssArFoW2vXeasjB3tmvBIJvDdi9UZCEWHNE0kp105Ju/3aZz0gqKpDfs4oq9TnTuYVYuUZIvQdXa6bM3aztpVYACApW9NJaTM1QgO4Q59qY4BpDizbmN+8vkzXtC+PvmbNYPGBfId1WMY9MfXuQcfAS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AyHWE16a+ZcbZwTDyfYyqBwyEeb91a2io25NiAzqmI=;
 b=FAXbADWT1dUMBfY4urhVVRAGr/UBvmb9iFGezbo/fQWA7rvLm1VT5DUkHFns3tvcRQoavtKNybVTM9ZuoQEnXtudRIvvsY5lVcq3vyPLaujsyEpW3Tkgbwr92kIuSlobA/tW/sqH5LkshszwzoqVjpAp0PxHuE7bQ/Iq6sxsCy4=
Received: from MWH0EPF00056D0A.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:a) by PH7PR12MB5783.namprd12.prod.outlook.com
 (2603:10b6:510:1d2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:02:50 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2a01:111:f403:f805::) by MWH0EPF00056D0A.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.9 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:49 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 06/10] drm/colorop: Add NEXT property
Date: Fri, 8 Sep 2023 11:02:31 -0400
Message-ID: <20230908150235.75918-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|PH7PR12MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a05d02-abb3-439a-1836-08dbb07cab9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdOexHxuQc/fo8+cQ3X6eZSYnuOGmzubk9oNJAONiuZZDOup9PEhCIhjIWCUyZ+89nr4OQa1/ojydJ36JdM6vPzL8DXOjFex8NkEBjcJU2nvmRBBwG8cgAJYDskqCyO8PU7TdAL+OO+5DUWWBJGxVF3oOZfHBuV37q0cvN6pvNFRsiCrhh/tD3eONiWfAJTdRcfN9UECX86TQLjOuNMDgRjXqokn+Q9WijIIYVI7HSLHoY/WIVz6FTCM6MjvhjT8RUkQT9LsQeZ14M+4udzaxw2fuhfZ7M0mKjR/N6ZW5sLiTfY5yqLSRerCpLA2W8zI1ZHDOhYsjaJ0DGJCZpor7IEFXRMRS4XyvggLu+7edLs9ag5SNNT09nIFgaYTdae0mNYvtXFDSRnA6eUnyAkdb2Ydhr4dmpdzMxsqQrDTMViDAbWNhAqioNf6rUUCasRKntfVWU5npf6roUSVIkefwAE38gunrt9rwfPvbv+Mo9unkbT4niGSxuRcJkMvnhFyIPogSDpCjroVYdYAcXI8Frq6wYk1gxpgbIJusTJIRT40IJOwOsycwujgSGBpt1aDZZshW4hrialvMuV4UxByh6DHLv2HKZ9x+wguzy217XcyHAJXEQVQmxXKXcKmq8Ax34uRXPo1Ex0x3hys0BmT/M+o36tekixma+8YHhfILW9V1YjgiBojM9FRhxtmXXxL/eT9a6ESrrtYtt91kFGjlugv2B+4Mx+1Nh0FM5mDGAItLaCWIyEsRvoGkY+5dL0NJJe05Kj1iEa7kWyDL73jGw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(4326008)(8936002)(8676002)(7696005)(54906003)(6916009)(70206006)(316002)(70586007)(41300700001)(478600001)(2906002)(6666004)(1076003)(2616005)(426003)(26005)(336012)(47076005)(7416002)(36860700001)(81166007)(356005)(82740400003)(40460700003)(86362001)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:50.3258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a05d02-abb3-439a-1836-08dbb07cab9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
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

We'll construct color pipelines out of drm_colorop by
chaining them via the NEXT pointer. NEXT will point to
the next drm_colorop in the pipeline, or by 0 if we're
at the end of the pipeline.

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
 drivers/gpu/drm/drm_colorop.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 409df022b256..a92e170aed87 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -104,6 +104,15 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->curve_1d_type_property,
 				   0);
 
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+			"NEXT", DRM_MODE_OBJECT_COLOROP);
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
@@ -263,3 +272,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 	return colorop_curve_1d_type_name[type];
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
+				      next->base.id);
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 69636f6752a0..1ddd0e65fe36 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -162,10 +162,20 @@ struct drm_colorop {
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
@@ -212,5 +222,7 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.42.0

