Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A087D03C9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4BC10E543;
	Thu, 19 Oct 2023 21:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324DF10E543;
 Thu, 19 Oct 2023 21:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EK0ca3XsQQ7iVSaNdO96lYC4OO7Mj/SXh3KiGvctTpoHDGthIFVMNlD1KVrI/E5uZ3w+fSf/pV0Bpa4VFGVS1MgUP1BaVvWpKiedmajB6YqOvppjrEbOukICrKu/Qf7b6P+1HcOkKYy89wZXYNlBh3vC4YNoBxKR2y9D0qT5IHrPy54j786NWr4O+coooLGHlVeBbSKi8/TS03oIDoCZS13KJEnjT+GX/ZEsC9bwt9xRhaqmGjl/BTba/9+PM5T128bZSktc3lJbgqd791W337sbywZsHgwsWrdYyeyyhkFfF0RDx/4nwmLDg3pPnH6sUMmxmXOqEhAPkzqkJVOV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pYSasPhzF6O4apvMs2KJGYvba7mLEWPjdgKKnjjYHA=;
 b=WzTIa4ZiioFmrrRz5ISoNSSYV4JIYbKaoG9WvjqRjcTi2co0gjSY/0oDg/Bg5ATUQbP7P1/MVzviYBnKXtcnNTf8KRztl3z/vGkZMqBdBZgWGfy0UEklr3Q28xiVBbSYJyuvn0t2qGX4X8rTzEhrxoTF5AUj6LGnhfNzhx/LG7BI0jTW5j0TxBk2aJstrCuI6XlnRS6kZ9bxZzJJbHoZC6ahbUNFemuI1vK2Ngz/62IWy0aFGKHCxIRNPAS3HjB7ZTYmVpp9FtcFaoRxef3oPSgFdBkqOwrVemx7RpZeKhpE2SBAtB3cqG9qaYA6gti6BcmKT7pIIn1g9+J/yhQ4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pYSasPhzF6O4apvMs2KJGYvba7mLEWPjdgKKnjjYHA=;
 b=EOE/35syLYcTl5Oeb0a2adM4iOXMOfGXbqnfxg7FSyy0yBxCR0GVPQr5XPOcg+3t0A8uNUQQo6fQFtLiDaHYbkm0ZNyxBFQlkYhhK0zsHvejpXKIG8+GUJrcXD4PWOVg8HaZAOV1LYlD308ESK3pWQYlqMJCx6RPwBh5ZvcgpjY=
Received: from MN2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:208:234::23)
 by DM4PR12MB5296.namprd12.prod.outlook.com (2603:10b6:5:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 21:22:38 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::f4) by MN2PR16CA0054.outlook.office365.com
 (2603:10b6:208:234::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:22:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:01 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:59 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 09/17] drm/color: Add 1D Curve subtype
Date: Thu, 19 Oct 2023 17:21:25 -0400
Message-ID: <20231019212133.245155-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DM4PR12MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6960f7-82bf-4a06-f778-08dbd0e984fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYU2gG8lXTGfXoBjJ1+yRcIG/p92MzlI03KtB2PrekuZJPc/GwYSQLKiqnUphMxvHdXe7df3Ybq8rfPjN21tGXwV84ANdcXhWLa3a2LYGUpCm/OFT0tFsXmIsAv5WueWQ//BAaqknJKzDphOJ2CRZDxZhw+052I9C4ZpWqiCc92xrsm+PssDR7wm26qx+PoOzYtrOPUA4jDliO1SfezSWCNCPIlDr6cZblaxMsdonwABrjF3PcL6gVHhPKsNhPxDwos5QNbN+FOmJqo5Ckvl5pey9q5zua1dHOPvwgfZDtPCBNJXvikpXn94WyZI27EN3VOmvREsjACvJXpaeU3bUVmGT/bSLGBd2DDS74KBDe2FR+0OTzND3HKgQMXl3MA0Y0WEI9ukOYKf1ExV5yvYKXGUpptjqMrLXmD/tTh8SxW5YYvm+1TdTMPPLeHV27/1oy1Wil8zqH4MmzYqXjbHNUaK99YTKpgnuwAoP/ghqnrCLzxQxCjtlVyn51gOZt9+WEXO49nFP5eHeV/Ax362yozyaSt56jwQ4412UXVzlFKiYq1Ai0+dgC9I5OFK+D0ILqMPD30kxrITbRBC1wUg/x2thdIsObOpOLe+SR60RqG8hjZvA9sIQFf76d7+ODyw31EskQ1pInbOqL+xQKdHX7sPn0RISSSNaCTujZzNIc/NicK7Y3molwfHHE+BU/nNi+b/qeDmouHGB63XWskx4pBIvbIyyGNt+hJVBxZzBBrwcm8k+mKdLF33lSGSmC8KOS0/d6J38VShptuTxJ11AQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(36756003)(40480700001)(40460700003)(54906003)(1076003)(6916009)(86362001)(26005)(81166007)(82740400003)(356005)(426003)(316002)(336012)(83380400001)(6666004)(7696005)(2616005)(8936002)(5660300002)(70586007)(2906002)(70206006)(47076005)(8676002)(41300700001)(478600001)(36860700001)(44832011)(7416002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:37.9379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6960f7-82bf-4a06-f778-08dbd0e984fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5296
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
index 33e7dbf4dbe4..8d8f9461950f 100644
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
@@ -208,3 +232,18 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
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

