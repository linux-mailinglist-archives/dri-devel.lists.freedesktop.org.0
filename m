Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EAA72749
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F8F10E7C1;
	Wed, 26 Mar 2025 23:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t0MDPL9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3810E7C0;
 Wed, 26 Mar 2025 23:50:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ9xJOHrpQSQZioUpQzD5+6p2O3V3ODlYoo7f9iLLtlpTMyJu2bO/MpzqLS5b3mHfv3PTJm440bxCsBJ+oelyzU0PKLYzIxc4vvWYuUi8AHy8M9PSfARP4lAoVKmVxmMLeCM8JgHQmyzW8T5IM5Xg4Ux8+xXEOLczvUm8lbeJj907nngpKMfUh9EIvGWSSIxen9rhcUq6edFysqWCKKeyO7lWj3SaOsYeCUbEsh8aXGYNUQ2wNaALqLxjzFh4kdEaM+bnDvC2cm5z+vPgZcag9/cqcTSRWLQbuPMEcgay4mo1jY02Dpf0jCCqgS1wuxRJwBfms5e7o/Gyw2t7PKPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7GjNM9Dwg7Cnw+xpDhP9oD4aGxfqZAcbaHoRf0aM/M=;
 b=G3xej3MYsrfvq1gZoQuu9CGTCMzCXG0DnqhjvK61k1PUIWAWstApWcEPRGW3q7bS4EcnKtBwpSZftMMG9Pnu9PmcSOjzYaUHXKisbnpWyvjVLMhI3mrsHdCIylFOvYU83thRPsC6Yh7nEcbEaIyCC5ZjOP+e4msS6gVN+aJGwyvsq9DbGmiNvxZBF/zpMSji/wHHE+7Dk/ojaS30jxott+GclzEam5DsBUalwHNODzZ3QyUW/ugNyYclcukDO/FfSWFfwg/jdfUyn0mq6QebiZWQfWASDgTfIkIXtVo1FXwRWUdxlVOUyV911g45RpLGc8nsbRe5i8yxuJBQxOcYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7GjNM9Dwg7Cnw+xpDhP9oD4aGxfqZAcbaHoRf0aM/M=;
 b=t0MDPL9+KoKiB8zb3oInmoKkMWK/gPl78eMUOJ0Juoh2IEL2sJqmzP4z0Zv4CEuI45QHKP4TFymAkmui2oCDneTu4/clanpRgHPOa36sbriRc0XGmvO2a1gl+EMzpYTMYD2D90PJELItHBz3pwf5Z9fP7AnyqEuYEwYEIt1Reww=
Received: from CH0PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:76::8)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:50:27 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::1f) by CH0PR04CA0003.outlook.office365.com
 (2603:10b6:610:76::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:50:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:50:24 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 08/43] drm/colorop: Add NEXT property
Date: Wed, 26 Mar 2025 17:46:49 -0600
Message-ID: <20250326234748.2982010-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|CH1PR12MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d4416d-ec02-4e30-c062-08dd6cc0fc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aQw+y/q+Hz1jH1ONcqKXo/TTBhAhfvbXCneXyufrBuGYBnFGcnHPfvb58gqd?=
 =?us-ascii?Q?Wzygd1KToZ5Q5Mpjj91/Psi3MSEYGioAEu63HJU9O0Fr8Evxc9Mke78rReNa?=
 =?us-ascii?Q?Cvxt5PVjix05vI+cV0+CKI+92+4+7NhHOdTdN0qO7sQ6j6i7bKVO2krDkpZq?=
 =?us-ascii?Q?gz2CyWSeD39CEBtG/uHQKec9yuGkn7/n0M5pWhTK3U92F9P9jSXRoELE+ozY?=
 =?us-ascii?Q?1LbpjcYDUAt3nt+t+0K39RmREy/o5zh76H8I2ZgYM+WApFUV0oUrBexJTSNx?=
 =?us-ascii?Q?afWnQ//jJap2DaoAgSVbje6L2al1NKaNHHarv5I6BX5/wPISUFyzFfn7R3/n?=
 =?us-ascii?Q?LY7W5G+BnxXRo0ySmVddp6RjMFBXSltP57nRLD84yEZ+8uZLHQxqHj5v0XQL?=
 =?us-ascii?Q?AjgWxof44rCZ4AOor7rQMAmtXYj5UKyJA+IeQN/Haehh4Bn5vqeIk6Y63on/?=
 =?us-ascii?Q?nVrJbpQtn1c8iWDf0YNsIJc2bx3BgBaiafwkQOE2rE3CaZ7dFWyDvodH8j7v?=
 =?us-ascii?Q?F3YHatrYdl2AHNbHmsImGMuG0WYIWBcvWb+UaFri4c/diNh0zPlUpCKgEOEM?=
 =?us-ascii?Q?Zw3aoZIIHvy7F+gyooqEHKOcFomqiESeACf4U9CSVLxhgkWTUieNN2pHRJIY?=
 =?us-ascii?Q?mH9ogQwiXHnEswy6vmbVOgZ9ErDGxkVzuJsDKRLT/OCzA8XrytfmdS9H9BVA?=
 =?us-ascii?Q?6IDSuhD/CLBmGVRoCncErwdGXvoanbZhXUOyIeTD2La2Epn3ztcQSZzpziSH?=
 =?us-ascii?Q?drGT63QVF+iGA0Kw2ccEPcqEHDFGmSNIIUSSWmTJmpdHCK3Hl6IU73z6FdKh?=
 =?us-ascii?Q?ulKnrkO3yzsPfBUZslCSYtqiDRmIHxB1Vyi26K4zwnqdieNDKwIbwNC8I1VJ?=
 =?us-ascii?Q?b2soauWK0xvOrArz7opGmUtUlr56K1wrW71DhUiBP09NIUQ/FVih/f5l6DDJ?=
 =?us-ascii?Q?jwsG+suhyipfhQX4nVZNVeoIJ0WU61CqikYjVBnH+iHeqJsWOgMrVnW1PZFv?=
 =?us-ascii?Q?HOLiv5EBvvUoJX3pjdTpJuZT7674BrRggjnXT9zrpFjomTyP4MEguOBCoxNH?=
 =?us-ascii?Q?hRpffB+MIqubyGggiQztKMkzXw4jJpSEvJORoO9KqXNk1tL1ncqGcJ4+1+YS?=
 =?us-ascii?Q?aiVZz/POHvvMO56mDnP1JrTqRAgbG7y5D20EGCH2mIb/WiuZmYNQD1u/l//R?=
 =?us-ascii?Q?Ywx62ktFDZqK5vmN6jFmruEEe+D4b6v0lNwCT2pjqZ2jeWoNDckNJeYlols5?=
 =?us-ascii?Q?MvJyjzqpRtTuMahtkAt9TVyimOgrAC7mxLDOwY7bhIcA02q7c1PXq7WinZ5X?=
 =?us-ascii?Q?mfY12MAib3yeZnZVFo+sBJjP67zOfR0lf3bxpnOndvCjUwdKxktEJmQn8jwI?=
 =?us-ascii?Q?HxagVZhS2mnYEbOb3Gf1mBX0LKTl/yVYpi4e0leBn3tUXKLsKqiC2AMTNcV7?=
 =?us-ascii?Q?Tgb/JvLVKQnt/qpDp1fTNoMb1yLVAh30zgLLxHJscOy5HFQsRH5+glQLPUBO?=
 =?us-ascii?Q?TTpSrbvkRcJwjH0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:50:27.7165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d4416d-ec02-4e30-c062-08dd6cc0fc3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
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
index 60edf6671643..05de9bf118ed 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -58,6 +58,7 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -90,6 +91,16 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
index 315d748e212e..7948de5c4994 100644
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

