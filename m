Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644527E5B66
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D810E7DF;
	Wed,  8 Nov 2023 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B67A10E7BA;
 Wed,  8 Nov 2023 16:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVZgu1X6FIbCJKs9VV4dGKIXzT+Vhw81i2ZQhpuh4aWjOUJ/nM6LlY0fabk09vFWxH8xsC2qeNE50Gc+7WWZLIbMK8X+hmBCmLdtQblACLS3bylWqcWFX+zugsPSemvVD3x+XeAqhLLI/NB48INC3VXM525uIVXtnQVdB2G0nKpX2wKGig6hEHKVTzRK0adpEofGtJMMxijlJxYZTBtPwwbfPpGZGbcTp2Rk5QX0s+WFUA0FJDanSE29OtnvAiRnysE9ZijkDb2Nky67IGFzkqBz4X7rj4+QsSOb9468pgZEkumNKH73SO7MvcCj3ySswYpncuNlccItcE5o2liqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oextzXVcZQ68g0HSx9pK6YlGc1yv5V6onlMIuD9kKVs=;
 b=ZC0eaApDhh/fTCoCmXcdl40nMhgrrbYlBS094ZmcLs0BE8qO9hF+BKMcXgxTNnEIAIQwNjYfnYxM92Pf4PKuwpDGbfiHyUspnlhMEUVke21rt0Th530Bkt0+xLKOCMdcnKwcbXJ56C9CD75uNFIYpkPDnxDPHyRebkVFaMcRDTWNtxJEVMvm+kWXnD8S/LpsjeKu1DdTySXGvfrtgXKMinNVl42MNtMRvfienZ0yHC6NCwg2GqZaZY9DBDZrNPAtKdmjPaZSp88gM0PSeQfDyGsZZo6+Zk6VmhpFsNc2D4LP19XZbzflxMGlYDA20L2sCLt5/k7GAp2RGdj+cLRbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oextzXVcZQ68g0HSx9pK6YlGc1yv5V6onlMIuD9kKVs=;
 b=RTJxZEHIwYXhpueZO0+b4PifbRlaQmb3dxQMprGmZj8gFvJs8s/GcCYYNL6fuZMK6gn5XcJVnUAnH5BNscQDghfISLPzw5ReUWCklkg5GRYE1DdfDLqrH2QvXgwZAXWS23ZKPmD/q/OwBvQJqhSKtlsylTJ7dmZXD2Ye+u6frDY=
Received: from DM6PR07CA0118.namprd07.prod.outlook.com (2603:10b6:5:330::31)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 16:38:00 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::5a) by DM6PR07CA0118.outlook.office365.com
 (2603:10b6:5:330::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:14 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:14 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 09/23] drm/color: Add 1D Curve subtype
Date: Wed, 8 Nov 2023 11:36:28 -0500
Message-ID: <20231108163647.106853-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: 2309460f-03f1-4c2b-0a43-08dbe07911ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dKTsUA0GPhwN0U3NQt64rrrfovNogcJaB13mcGb8onxXde9HkNGQMkb5cSC+Osof17djIJjreZ/F1ErKHsrY9Ksvmjon+TVjsC7awAN00Wh/spclkZg1rVpXDIec2cTGolbxwBESIFvAt7KvzokUVNJvqJtoS2cISXnqA5gqIMBa0n9YxwlnD9B9tAFIWmea7U/a0rdcWpf/8dkxugxSa6RXqaND/tl2QmZNKOgMO4DWPSWHTqA8FMDPWmkMgF5a0R82KLRSPvwZtW904uUnnUCHsYmDG4FjsXrH5omJkQQxbxufYIYylV6zd4NaPoHKoBxEJbq+aSegUetqSzsx5BgyeC63n61F4EEm0AC1phuPBr90/JpJbntPp174wHhXwW0bevOaYUZQTxbmVwp8CYJOXcxN7JO/cU/klmshDFpA4po5A4/ZMYaCIdrqbhlFtkd9fAML2BLbnPVlo7f0z1FGwOSCFAg1W/ExrMv5q6MWjVNGjJI9YXBvqOpUeAQdzLOvJBksNEAjm4Y+p3tut6A4qTAny1g+YdAoxKyNyX4ncB3n51CUYLtMdLmvcK6G2EUoskvf+9FjA0lZI4Ks/3SpHju/ZWiMOe8VIJwKmF8enYx4IXRsFdQ0zs6tEQlcu3qjClS2TC19JYf+USlXFQ5IdPB7tkbw06l+8UzjALk3X40CRFvSLXqIkCUv4gPXt+bpPVX64yB3QPNd/Y2Yl6e34ZQU7QhpFa8hWXb8XSZnA/gjN+RRxiXw6uUu1H398E6EmcpmdOtwzfMKR2bfw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(2616005)(6666004)(83380400001)(426003)(336012)(450100002)(40460700003)(26005)(1076003)(4326008)(70206006)(8676002)(44832011)(41300700001)(86362001)(70586007)(36756003)(5660300002)(8936002)(2906002)(54906003)(6916009)(316002)(478600001)(36860700001)(47076005)(81166007)(356005)(40480700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:59.9555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2309460f-03f1-4c2b-0a43-08dbe07911ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++----
 drivers/gpu/drm/drm_colorop.c     | 39 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f22bd8671236..52b9b48e5757 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -670,11 +670,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int
@@ -684,6 +690,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 902b13e300fd..b1c271f90a16 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -36,6 +36,11 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 };
 
+static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_list[] = {
+	{ DRM_COLOROP_1D_CURVE_SRGB_EOTF, "sRGB EOTF" },
+	{ DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF, "sRGB Inverse EOTF" },
+};
+
 /* Init Helpers */
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -73,6 +78,20 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);
 
+	/* curve_1d_type */
+	/* TODO move to mode_config? */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"CURVE_1D_TYPE",
+					drm_colorop_curve_1d_type_enum_list,
+					ARRAY_SIZE(drm_colorop_curve_1d_type_enum_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->curve_1d_type_property,
+				   0);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_colorop_init);
@@ -177,6 +196,11 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 };
 
+static const char * const colorop_curve_1d_type_name[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
 /**
  * drm_get_colorop_type_name - return a string for colorop type
  * @type: colorop type to compute name of
@@ -191,3 +215,18 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
 	return colorop_type_name[type];
 }
+
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @range: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_name)))
+		return "unknown";
+
+	return colorop_curve_1d_type_name[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 0386440afe40..965db7ec488f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -30,6 +30,11 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+enum drm_colorop_curve_1d_type {
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -39,6 +44,13 @@ struct drm_colorop_state {
 
 	/* colorop properties */
 
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -118,6 +130,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
-- 
2.42.1

