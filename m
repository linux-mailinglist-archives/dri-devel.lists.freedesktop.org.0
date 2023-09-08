Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A7798973
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB40E10E8EE;
	Fri,  8 Sep 2023 15:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1582410E8F3;
 Fri,  8 Sep 2023 15:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmhMmiLuVEHgDsNjOuy8d1FvP+Z331uGL08aik5oHk2R1ImSqZzRrFdEAvg9gZgR2Qurq+PpjzM6wvQ32hWIkKNXy7Ey9hdPZ/27eYuRXzpoSeXJgZDamn4oLfpasKvCmhDDLwcGuxPD4ehs6qXNVYesddYw3owZYPTUZ/Grh7Jj/F4M8Esm+YPWfEe4pu5UUjlGuUCrBxyU0HeEjljJ4F0BX8K/K5GiAR5kHuzF5w8ole809skQtWNPLJWdcL/7eVbsuGgn3sOUP2hpYu+4VexJguSr1o+/S2CdLuey0itEJsF6uJCIq8Ux8HogcUg2jVBgvVzEVUyMgnlNp+/iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41QjC1S1t7lsapX3L9Nq80bSOzoRSt8WGAN7fsGmvCI=;
 b=PQRFO0AWcBDCWZN9cN/HdBUX18IPEysg1zernKsaOobBXec7ZYgsoszxzLlDraEkr4tz4n7s0lGIo8ErhkDpEusvI0t1JqUD3u8emu0iG7QqyjAGf14YEAKqL1EY8rwn+3gaCAG0UC4t56RAmEYnuWVuRYRbQO06OoGEdXtLuf63WYVcuLnJp7LH4mR1j0fHy+9tfHtIWvDPC1G5VwTejYYJQ4e79OzimLYJLf4JX3ceIv3QRSZ8fAC4QqQg3XiP7wf2oLaxmJGU259zBSRcQZgDXkQamYi0tAXyf91AdxDidghXSz87yybmDO2ZPJB4V4HO8zyvVEOr141iBIRpmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41QjC1S1t7lsapX3L9Nq80bSOzoRSt8WGAN7fsGmvCI=;
 b=0rx1Y4eYobu0zTktBo6CPgeRBXJ8LLnlOsZ+G2i0RupHtQlQ6kgzBbllf2/mZ9VVfO+/zZrIGPlYWKwhF838c2HBFj759FarqoGSCkFSB8V/lsdSIjE3LBjcpfifJFTAO+tA2EGB8NydPjlU/V+Mfw2MaHxFK0atuzfzhLppBmI=
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:02:48 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::d2) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:47 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 04/10] drm/color: Add 1D Curve subtype
Date: Fri, 8 Sep 2023 11:02:29 -0400
Message-ID: <20230908150235.75918-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b899bb-0333-4937-15de-08dbb07caa4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtMSl3AwRVWxYGgXCd+sygRp6a/4pn5WwTAwyipJ9BTNCROoixAbudjwxWg8O7HVyeB4YQGWoaffH0ntDRiunYQQ/XV3hwG+jE/V1yVcrg6PtIvFBlcFFc+7b+GLCMqDr9/N1rrxZ62PRge7Jm2wtc9AE2E/b2tZ7lFqp2DmufZaZCQyuFEQB3mNT8z6RQL5QghZvYwWnd0lIILmsNcNgbyybejD/28nrApVTmY0e7UIQUUG9qm4aeDN8eiZYNYiiIYg/EMYVA9ZU8X9Hii7DcIAJH/KoJrBFFwOia2RX+T+KhzLeCX9LH4dbHAtjObaHJQ+Bqt97K3THCIugCBC4xn2yJ/MfzZbPstUky9s7bXS713KZxXU5ABecpKij3pULuqF4vy9vAz9RPgfH8oKCYws/TuY+ucDzixPJHpxWdmuIrsflnuxJJMOiVBvepkK5Qr2UCACaBhkgWfCYimaVXq8HRp/9XvPNF+qvHo71+NsVg/pH065T6BZx4VqJd7+0QWMwNv39xU8iYBKjhbDOCAWEkFjTx2YepGqdxODKyCSp6/4HXFUKrNE2TOTyXpVaOugyCPiX6E8iNvHtxiTKPX8sujEDCFv2OPplX+pNjucR6IzgIBksxiVFC2vbXmn7FI/umc+Voyvf5WprQuALHg4Pu2hvg7xGCar0vgQ+scSaL9xIn8PXU1CeF4KQ+ZQLvdczG6XJQ1a9EZEpx3nbGVXz0GPZ+FbUNiTJ2nrZLAnCeJbQBC1QeV1FPRiQQozrRhHf/k7XkXkRCQB/kbj+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(356005)(6666004)(7696005)(83380400001)(478600001)(2616005)(426003)(41300700001)(336012)(2906002)(7416002)(54906003)(44832011)(6916009)(316002)(70206006)(70586007)(5660300002)(8936002)(4326008)(8676002)(40460700003)(1076003)(26005)(47076005)(40480700001)(36756003)(86362001)(36860700001)(82740400003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:48.1197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b899bb-0333-4937-15de-08dbb07caa4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
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
 drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++----
 drivers/gpu/drm/drm_colorop.c     | 39 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++
 3 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 51072fe2b548..9b01f234b04e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,11 +648,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -662,6 +668,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index c028d5426d42..f665a12a214e 100644
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
@@ -194,6 +213,11 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 };
 
+static const char * const colorop_curve_1d_type_name[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
 /**
  * drm_get_colorop_type_name - return a string for colorop type
  * @range: colorop type to compute name of
@@ -209,3 +233,18 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 	return colorop_type_name[type];
 }
 
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
+
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 22a217372428..7701b61ff7e9 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -34,6 +34,11 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE
 };
 
+enum drm_colorop_curve_1d_type {
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -43,6 +48,13 @@ struct drm_colorop_state {
 
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
@@ -122,6 +134,14 @@ struct drm_colorop {
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
2.42.0

