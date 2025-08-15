Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB46CB27740
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57B710E936;
	Fri, 15 Aug 2025 03:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SrPBWSW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35F10E924;
 Fri, 15 Aug 2025 03:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGqiSiCH40eQ+Z+/nmA/6GCPemfN6wczu3f0q/8MLJwxlmzDvp9jlrdgBYaHeGE/pcT7VKTH4s5DfI+25HQEEpWQ2x1ml7a9fuR4OplQ4xZu6cMaWQmJjTg/RKdiIpeAzL5cfGxGzT41y0iLG3bHeP9W/3b9dUuTEhEj2SxTAEqq4at6w8tEj6gwy0KIKLttCIZrAGLk4dBlgDkIVGzJ27jk3SlubYsWYqEbi2tAt/U8R0VW41U7Mk2Sxoap7Y9seFu3hLHFi24Rj4G6gZna8wiravqDvqDvgpa3gI5gyjsIC0RxQXXaC4UZFvdlxJAFaJi1gde9CQ5NiK0uW14zPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYrBuuusOZj7te+6jVzpVnq4HsvpLywmKa6NHef3HeY=;
 b=v600jy77vkv3mQnhp4PmX7hwVK1gGpXgXhKYz58gjfr8Gl1V/EY4Kb1Tk0E1vmX+i8JWcU+sU9DeeTjeU2T02t5BUFKhMQYD7TdPEBol5paSaD7ARiQxRoA4H1cLsfZNBPXas7detN8aSBYzvF7//FLV8zdrvm1PSP8tvZ+IDHNDR6JYgXthYZMUFRY0HYSIoVgpQzGMoLdAmGwWBuVW2Qfnx52YQTFgwpFYPAm9I3RkMlGr3pjs7sLEqXu2avUF08t0PUbAzZJ1bobxW1C/01CWo5gUBQyAuWWLRJnEZ0xwfpCsKX3svYRReUGduQLek80tpEM/hHviFDQJJFTZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYrBuuusOZj7te+6jVzpVnq4HsvpLywmKa6NHef3HeY=;
 b=SrPBWSW+oJIguwE1wy6Y1E9AElwNo9JmvWNlpeibIbDY+JOcKy+tCgd6AbhaNckZWXb/wp4FsfyG5LJHtlJSpg7SmDNqXZYM0AO2csHbGMt9gmFvfFk77LG2XBsN1SL/R7RGrbqa9PEEhN5gzAJD5Q3SZSa+uCTrrAzTMKmw8oo=
Received: from BYAPR07CA0037.namprd07.prod.outlook.com (2603:10b6:a03:60::14)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:54:18 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::bb) by BYAPR07CA0037.outlook.office365.com
 (2603:10b6:a03:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:54:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:54:18 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:54:13 -0500
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
Subject: [PATCH V11 11/47] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Thu, 14 Aug 2025 21:50:00 -0600
Message-ID: <20250815035047.3319284-12-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DM4PR12MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d10a677-2af5-4aea-8d55-08dddbaf68da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MH2C2c8x2xNLnywzQV/r9JpiAtQyxz6GBwP2x/lFebWWGaR4AwLbbpBBzCgW?=
 =?us-ascii?Q?/3DUHFpx+5Kd0Cia0DJ5N5+SnLfMD1493nfj8W+hobh7eV6Ggv+P+0KXq49W?=
 =?us-ascii?Q?zCKoJ07VysOd1NhxAHGTj8WDRs3J6hZCYcm6ljU7SUDW7en84m9CFRhk+Oyt?=
 =?us-ascii?Q?GJher4Qu7CZO/5PLQDqwRGcOwEi1s3/zWA1BNhJXq1ybJnOOWqxVxOCPZtpl?=
 =?us-ascii?Q?CZSksmqBLYU/VT7OVr6pC6/Fuq8SCTQZx72dVfF8RHQZj+XNjWYGucGo6Z3I?=
 =?us-ascii?Q?/IPjv9MgmkFbtQw6zZjtI4vpqBlNmE8n8qyDtX+TY79zkb6Vb7D2UHtUdN24?=
 =?us-ascii?Q?+dRy2JI5ZDJDiACyvE8uIxkz99JsK0hAQuNPLItHDXkbhU+JKFfUt1QUf4Lt?=
 =?us-ascii?Q?bsTqd4QbF5w1EmvsglUDpwJDF8Fx9BGYmv7SmebG3Zlk5Yod+yLXRf08kjun?=
 =?us-ascii?Q?L0cXjVQFLkrraAdRboxBGWpBY8znr7taE8y9+sLFznIS9nE6zmtIOgThzgiN?=
 =?us-ascii?Q?t/614gGZBMfX3Q+6wSecPLh1YxnDH4qJNHSZMx/GdGkW6M/ysrGh8iupgjUT?=
 =?us-ascii?Q?Fj+PRhpZl2+bjKG4bMWrIDloPYrYL51DM3IvPeoWZ+jcMM+Seshmcx/56LJc?=
 =?us-ascii?Q?bto8CkAuhw6PDa3akGBfHTtDexYnGRGSeDXfrkAaroDZn4e0m3rn4HWHWuWE?=
 =?us-ascii?Q?G/JFR2js0hcj4Nb8zIzPASue6P0D8kUfCl2pmP70r6Yl5cIYRHMmunn5g7wE?=
 =?us-ascii?Q?LtlV5p2FBoumpLgX50HJH72jhqjagP/30IHvMCScHr2pwEgx4ew+2KoaOhFm?=
 =?us-ascii?Q?yQqD1cxmjJuFpliPwyyUgVIVxcPOkrW0wXdIKM3B5vaJM1WEKSQp7SYs9mb1?=
 =?us-ascii?Q?9Z9A7DTtpDKX7JiVEVjUMWl5PaHRcH/W5EC0BwSMk8NuVi+VFRQ4aGzBzEm9?=
 =?us-ascii?Q?eKz32m+yfCAG6+JleNo4HHqCde52eZJ3CzCeDcZx+l/LLELPew5rSp6lhipO?=
 =?us-ascii?Q?ub4qctQdKJkrkIMDTLKSle7ZkH2zmzrgNMqumNqx8npsJDet8w9TkI6lgpzS?=
 =?us-ascii?Q?MRWWHxoMWAlnk/VUsdSmQmHyDDkFIWZzg9bCYoKOLt/hzVkMNZVPXRdKxwds?=
 =?us-ascii?Q?TektRPA4VV7ecEhbiOMBPfBQ57XP3VSvgzi/gHgIaxrrWPzV/NlqRuergBfI?=
 =?us-ascii?Q?13pfrCFMjMncegfG0yO+/058WIsVpqXfegCfEcGUSuETljjLmVAXp4HGXbGO?=
 =?us-ascii?Q?LrHCCgZZEyA4KSI+Kb5kileh0e4UyYE69lWVektb5201Ap3ulh07pYwEYuqE?=
 =?us-ascii?Q?Wr1J+vq/R/bqURZuwEeWWmGCUZ02UFpvKeBiLumQI3UKypGRAmls83t/cW3I?=
 =?us-ascii?Q?yggpijSEkhzl6ZZHswRzeI6cTsx3UBtyB5hZ2pS69b6dG5s9BX7VQ61mSOGz?=
 =?us-ascii?Q?Ylwej/4O8K864XFq+FN9au8oY/R4gKSHT9jz5d/hzUSichie9jRfRJ2w8uT7?=
 =?us-ascii?Q?4AA6+ie6YOxFNcWjmdheeAwjoDbeLNxehuYV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:54:18.0501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d10a677-2af5-4aea-8d55-08dddbaf68da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277
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

With the introduction of the pre-blending color pipeline we
can no longer have color operations that don't have a clear
position in the color pipeline. We deprecate all existing
plane properties. For upstream drivers those are:
 - COLOR_ENCODING
 - COLOR_RANGE

Drivers are expected to ignore these properties when
programming the HW. DRM clients that register with
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will not be allowed to
set the COLOR_ENCODING and COLOR_RANGE properties.

Setting of the COLOR_PIPELINE plane property or drm_colorop
properties is only allowed for userspace that sets this
client cap.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v11
 - Skip color_encoding/range_property in drm_mode_object_get_properties
   when plane_color_pipeline is present (Harry Wentland)

V9:
 - Fix typo in commit description (Shengyu Qu)

v8:
 - Disallow setting of COLOR_RANGE and COLOR_ENCODING when
   DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set

v5:
 - Fix kernel docs

v4:
 - Don't block setting of COLOR_RANGE and COLOR_ENCODING
   when client cap is set

 drivers/gpu/drm/drm_connector.c     |  1 +
 drivers/gpu/drm/drm_crtc_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c         |  7 +++++++
 drivers/gpu/drm/drm_mode_object.c   | 18 ++++++++++++++++++
 include/drm/drm_file.h              |  7 +++++++
 include/uapi/drm/drm.h              | 15 +++++++++++++++
 6 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..4d6dc9ebfdb5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3439,6 +3439,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	 * properties reflect the latest status.
 	 */
 	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
+			file_priv->plane_color_pipeline,
 			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
 			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
 			&out_resp->count_props);
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 89706aa8232f..c09409229644 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -163,6 +163,7 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 void drm_mode_object_unregister(struct drm_device *dev,
 				struct drm_mode_object *object);
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
+				   bool plane_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d8a24875a7ba..ff193155129e 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -373,6 +373,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->supports_virtualized_cursor_plane = req->value;
 		break;
+	case DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->plane_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index e943205a2394..b45d501b10c8 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mode_object.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -386,6 +387,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
 
 /* helper for getconnector and getproperties ioctls */
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
+				   bool plane_color_pipeline,
 				   uint32_t __user *prop_ptr,
 				   uint64_t __user *prop_values,
 				   uint32_t *arg_count_props)
@@ -399,6 +401,21 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
 		if ((prop->flags & DRM_MODE_PROP_ATOMIC) && !atomic)
 			continue;
 
+		if (plane_color_pipeline && obj->type == DRM_MODE_OBJECT_PLANE) {
+			struct drm_plane *plane = obj_to_plane(obj);
+
+			if (prop == plane->color_encoding_property ||
+			    prop == plane->color_range_property)
+				continue;
+		}
+
+		if (!plane_color_pipeline && obj->type == DRM_MODE_OBJECT_PLANE) {
+			struct drm_plane *plane = obj_to_plane(obj);
+
+			if (prop == plane->color_pipeline_property)
+				continue;
+		}
+
 		if (*arg_count_props > count) {
 			ret = __drm_object_property_get_value(obj, prop, &val);
 			if (ret)
@@ -457,6 +474,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 	}
 
 	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
+			file_priv->plane_color_pipeline,
 			(uint32_t __user *)(unsigned long)(arg->props_ptr),
 			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
 			&arg->count_props);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 115763799625..1a3018e4a537 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -206,6 +206,13 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * True if client understands plane color pipelines
+	 */
+	bool plane_color_pipeline;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3cd5cf15e3c9..27cc159c1d27 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -906,6 +906,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_plane, as well as drm_colorop properties.
+ *
+ * Setting of these plane properties will be rejected when this client
+ * cap is set:
+ * - COLOR_ENCODING
+ * - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.43.0

