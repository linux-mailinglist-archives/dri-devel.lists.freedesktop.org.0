Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB2B27736
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8237C10E902;
	Fri, 15 Aug 2025 03:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vK7lZ6hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2710E902;
 Fri, 15 Aug 2025 03:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ie8ZwSIsGzoQrKM2dxmkbie+uaLTHyfCmxEg6+wPmI2dD69zuSsS1CoyI+wAHcJTQ3BhNgjSW8/LWoUFnHFxBcw7owlf9spq/yliHLHZ2qh2jt+zjOnviRBUOSxYzdAgHmfAFiqZmJEkHvAjXxAw2irsAD4lQgoegtrIZrVKR+rnoy2V9Aqd65gGZ82aasbLZSUs9xC6ZoakmY5f7lA9ohWFEHcUGN7Byq+c4Vs0i3fU74kp4uj0jISh+qukKAYP0paHM+duBmmj28kI9ZYTxAd+6KgUkjmqDGpY2/EWs4CFPjgGxa5R/JwV015WIcQZSDVUOrtH0PtIAf8vZPDsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtpXml/0OKcUUmXcoOJlEBDyUEriOZgLulMENI+Imuc=;
 b=eO1GL4Q6Nv7VLvzskdhclbkEomaCLMT8jJh8Bf8OCxp35lXsfbU01d/FmftU0RrlX+YaQa2pKiGL0dc33iZipFl3hA1h7KqIyBC+Q9o3lMBx6HqjV/flE1xmkvkhEWjSRUwPA7thMLCmXXp0qGgN0ohXhkPvbHSKpeIHvKHjUa8zoEcZvKwapARHpXUaIwBsEsjGSp9ekQZVAqnHZDoCWAC5nwNoclNblmln07cQ52DIDNFv089lUIbKoQMyeY/iKmqjW+lnf8K28KmaJwb+izkyWfurRAakBHNU/QX4ETeVUrGL4OO9t0DwTgXIXgxvXO8W0Iyu+J5pTfM5antCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtpXml/0OKcUUmXcoOJlEBDyUEriOZgLulMENI+Imuc=;
 b=vK7lZ6hhFN4LEHACf0aOu20E7TjmuSBW17fCUtTBEZczZp+UthVENnuLKquJnx2fNUgNcQnMLoa8tvn47+9aJkgIzFTBwfgH7e0Wsz/cDEC/RfjdQVKTtr8lhYrTFaOb0QE8yX9qlUkmadYhHdQ89GKW3AjCQjHVC52qP0NKo1Y=
Received: from BYAPR07CA0054.namprd07.prod.outlook.com (2603:10b6:a03:60::31)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:53:34 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::de) by BYAPR07CA0054.outlook.office365.com
 (2603:10b6:a03:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 03:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:53:34 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:53:30 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 08/47] drm/colorop: Add NEXT property
Date: Thu, 14 Aug 2025 21:49:57 -0600
Message-ID: <20250815035047.3319284-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: ef81f94c-8b0f-4013-f034-08dddbaf4eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QFTJ/r0coRSbg0CVxd/BYMeIZWczqFtSazKxUvZlDriStOOsoLYaNN6Qw0nY?=
 =?us-ascii?Q?118b8rCZyAcWQgCElzqIAUIBr0kjWw8P2SGJz1dIKkXdUnZFcJ7urQSQa94K?=
 =?us-ascii?Q?bMgXHM2yrwpTU9fo8vWOm0H0Zx1uXtKQac6gkRnBVMeGE/XxkljdRTELWLHT?=
 =?us-ascii?Q?f3PRGFiyeF8srvQ8LZ+69QFiAzAbri+QHjkQkSLUdE97MsBQH1nW4UKkeGsR?=
 =?us-ascii?Q?PfYXeDBJDNrb60jtn1y7dTLcVpAKvSfWBHbXlAoYnJpRn3xM1g+IuDEKw8sY?=
 =?us-ascii?Q?8eG9BW6AsoIWSV6EEvD5icyJtvN8MJlzHTPkBdlMTF0IX4RBUMlmaNAMhpU5?=
 =?us-ascii?Q?dxv5l+Gsv7+iVlxKLvKEveNaeQdBGVvgsO/PF5naJhWE+hxG326HvGaz+0+7?=
 =?us-ascii?Q?1BRWxltBBgftUbntUKJNvgxr07FcBiRbMRmWkBpF837HKxNTm7ZOd+CflE4W?=
 =?us-ascii?Q?q3IYZ9TFAbaI3bgu6IeieIlyzQq+kCHLN8wJbp8y1uJ1wTfgwYL+3vLKEZX4?=
 =?us-ascii?Q?IhSDL+kvrc8dcwpW2/nE4MHknwD20L2+4ANqb9nAenRwVf2++Ndq8BMWvC1F?=
 =?us-ascii?Q?ILDmnb1todzGjXo98mFIWmU9J+shq76xdTlqnqc6LiD8zABMRM94BRf36tNH?=
 =?us-ascii?Q?5OOaRO584wI+7vANkfOwyHMMgzXl8TIxF4xFdchreNUyjF5bZpXf4AMihvxs?=
 =?us-ascii?Q?xRd9Bp/IbIYOqV6wAb2Z8Qx+mSApy2p1z28WLaeRFwzTUWj4WyCeuumwF3jF?=
 =?us-ascii?Q?nUHFhGZRcPHVDlhEbbxK+My134M4sv//b8cY1UtMS+kKMkceiQNmaM51VWfZ?=
 =?us-ascii?Q?GN9lZyWtfcQxuh+ohPCqeq2QnjWvxwXblrt6dzb/GWf/n/GN/gjDERXXEc42?=
 =?us-ascii?Q?rmd7qCt4K3UtBS7TwEfdbs7rZgbcTXU/H5vD37BLhnZIaOJK+AEbLbj7S9k2?=
 =?us-ascii?Q?lwn1I8geKWMdGBa15p3+/Qm0FrX80LgN1lyOVF23i4hFpmJmHi7m/Q/zPOBu?=
 =?us-ascii?Q?QvJth6TVxj4EjY+cYMHU4cEJ7gwM2Y033zo9EeqgZ9/pFY2q9EEzJZGhBQLo?=
 =?us-ascii?Q?hUo75PaTU9hCLy/vyOUsC+dCFTyYrZfpxbgXpt/XDaGKmNxxRxK2qurZgg1K?=
 =?us-ascii?Q?YQn3I6RxyalcwbeZ/J3zG8ntgPWEI2JLNBwqjkRQL0juzHqZTEyhv+2vPUDU?=
 =?us-ascii?Q?DmgFa9P36EOAUQqopqAsYEhNYNWtLI0BN7hmYZD5KoUGASnEB2gtfuqj3RSD?=
 =?us-ascii?Q?3t0p5D/JivoiMhg8ZhRVP9MvxHQEo9PCHCRnXTtuDBi2E3STVObXyrO2IALv?=
 =?us-ascii?Q?ybt6JZHNzD5ohO4ZsG+Oju1PXJW2zhjewR1+oVn7i82yORqJhyVwYfNwzp//?=
 =?us-ascii?Q?EuoOMND+kYdvG7k3M9GGTvc/T3LGWg2bU17iLGhRHdSsoSnBeNrsLZv6fhK5?=
 =?us-ascii?Q?QcVAdVVbwTYC8ecnxZ0PyPWy/YA3W63JkfzSfX8U0UtAKoSdVQWikYOp0aV5?=
 =?us-ascii?Q?/BQQhITQBLL5dyssQlWKtjkCI1FWDj9um79D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:53:34.2018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef81f94c-8b0f-4013-f034-08dddbaf4eb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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

