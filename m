Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC69C1E404
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351010E8C0;
	Thu, 30 Oct 2025 03:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Aqd+RZSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820710E8C0;
 Thu, 30 Oct 2025 03:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5zYWltm2mKH16SP+Z3nes/F48nGb3RbzkOSV0PfMAQgkszw3mvj4SaQPCw8P9XJtsbDg3pP5bBvSlr10mfcuVV660QzJGjVD/O3x1vhIqoAlAHZLmkSZoE4xg3uNNYmwk1SoZL1S1g2WpNhdNVH7clsLthBy3L8IX/ll3CEq/lGnrQKgi5iGlRiX37A9UdrhofrZdxKr/9HN3r4UVgersENTrL6jkQGsQ7fMyjdWtRtcybQOiwIozesKLU407PqTGWBM9sqE3jXxmmA82J+wOUUO7VevN1pMSxpRkO6MVtWc8Rb+ICvL4fga686PskA/fEDYAsqolBR8CNncCvLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzPUNc7faMW9Kxjnzf6FaJtnS5LaY4uuz8i3a9HNPEc=;
 b=pNBkTUekiNloZSC5F41AO6NaVCBsnhVBP/IeBaw+dn+MUN/J67kOM+JE6ZtXOaPOKA0aSrxNM+uoiuPvJN5LH6/auJ9H94FkKOAku6yGYhj4PeUSrZVAfaTSIK8vJpIFCoEwJc6mUY0z3TeEh8mLVR66A24kK+wi/5tDumdx2RbNvpZ3jSKyIHv5cglinJbkKq+BkFPRtoXCuIyKXZCZvVeqAYbVntHwIKmyEdRrW3lv83EZ9cpKVsvok/Eo6AbzKDiKWRHygOH5O4/5eqXW7xtgJc5wlBq4Uteb3X6YFphHeVyDVUGYIal4K1Y5UlYmZRFIrq7cQGLDto9v7uLH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzPUNc7faMW9Kxjnzf6FaJtnS5LaY4uuz8i3a9HNPEc=;
 b=Aqd+RZSsCDJic6VJ525EtbC+n8w0U/PVs6WpWhz0Wv2RufHU6BV1wLfsnvAH/nIU6mKj88x7LPBUB/Jusw1LJkURgoX5L5OhZdTOy6He1WjC6QXFj8MEghPSNz3kj+wP5HILvsYTN7TVuPOvnmXFyHLl9LY7PfWPBMdTXJkcp0o=
Received: from BN0PR10CA0009.namprd10.prod.outlook.com (2603:10b6:408:143::6)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:47:19 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::f1) by BN0PR10CA0009.outlook.office365.com
 (2603:10b6:408:143::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:47:19 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:47:11 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 11/49] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 29 Oct 2025 21:42:16 -0600
Message-ID: <20251030034349.2309829-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 2579901b-e7e6-40d9-3498-08de176706dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pQjkE++OmcQWmEQ1LlYcGdQBQs0zWdilzyZrpm/xDTaRC5pZsEytqFC5rqe/?=
 =?us-ascii?Q?XdMDg/p8Zalh/mV497IgjYcsSspr0hybl9jQK3kr2SkX+yXXfFnRcNqT6RJg?=
 =?us-ascii?Q?nzSeh/exvt794V+BylJldBSYEbFJVasJNXGXOaXJfZuJjN5+SOO7aE2LOyxy?=
 =?us-ascii?Q?6lcVGY7jF1YgZz528PZhArXoiebCxqqzd/8sybBg7+MXVHJoV9hXMruvsNYY?=
 =?us-ascii?Q?X8iQxzNhQYtlexg07VEck0Wv3WNEUVPTuYo9dMYStNp77sMBc5z7FZcM7LIK?=
 =?us-ascii?Q?5AFtPwxvpJ4AwB40tCNDVjbImjjWmcZJPWQR2a6PuX8VeJjLV03CSR9u5r3l?=
 =?us-ascii?Q?6P5YBE5kB7Ayq8KfgDDacB+QMqLmgE6LcnPF4MsSCXbCuNVMwe9rbn0nzYgD?=
 =?us-ascii?Q?Lh/LB0EHVbJUGLHVp089xt9dPg4gAzP/UjPL+N2pwIP00Zlhc3MYzpjJfc/F?=
 =?us-ascii?Q?ZZC0EzQP3VCCxNFXTv/L/Zl+5UPH0KKEhM2IWRoBXUxMFTDyJUI9/XZn+Y4d?=
 =?us-ascii?Q?uJrMva8glIS7SHLZsJRboH79LMOIGY+B6ZE32ZSa6blwUS7VbU9rco/rAVxD?=
 =?us-ascii?Q?cjRrhBS8HxM9Q/rHVzVVhYUSJ7MiM/VYPRaqGzoPAodn3hU2XGE/DHz6JH+q?=
 =?us-ascii?Q?BCMH6W3+S5qrw+PrLAEJuarOGM3uYTcL3UDB+MchpiMQ9MF2zNBh7v4Jl461?=
 =?us-ascii?Q?fi7RURzCe1lRUJxdlVHkPzyoR4W92np+3svZ2HYd8cIEsm3BkQODwbS9V159?=
 =?us-ascii?Q?WLayqzr2yewCBygwFOPRcBEFbGVW9hw1GKUeKhAO1bSUT/kxGW8VC/prjrPf?=
 =?us-ascii?Q?4TMj9JxLIkPoxxcYt8vyydDsuLGAP9jJgSw3d61dZmFwA6uOrHBWZEnLlY7N?=
 =?us-ascii?Q?QKlKOfTBHXuWKxVe4o9U6OwWmvUgsp+Pj5HCc0abSI+3Otls5FBGyJj1GF2H?=
 =?us-ascii?Q?3wrGY0kyP5gMG3XmKaYxWPWRnfzlqTL22Sqsz1RCY2tuqRPzlpQGTpv/zSxy?=
 =?us-ascii?Q?+L6OWYgAsok+rxZCfs7YzOP9aqi0uFrkVjPhWVwTIspPQv7pNlvW1tfZXBGs?=
 =?us-ascii?Q?WCTrNHCFA9/kcBUBL2GRkrQj9jUA6UUFrEdfq6MNoPxgbcEbY3gOIDu7jmqP?=
 =?us-ascii?Q?SW9UBrjzX/5vYnTCrN8pK4mqJ9EJFMH5kJUZQIjrE4kzcIk84xk6l028ZY+w?=
 =?us-ascii?Q?CfvdugGVqrUraDs2s8Q550Ta9QW+NjEctfCfGOChABpipGSi0F6swwhDHShb?=
 =?us-ascii?Q?aktfNJnnopM2EHkV8F9PaWXnJpfsafv7/LpQ9TmDlfhf27bjhDtccAg0LNU6?=
 =?us-ascii?Q?ri5y4tGEc3i1S7dvThuxjV4S5K8mfHx3KXgUQi5zMDRQN96L7mbUs+KJ82kR?=
 =?us-ascii?Q?fE+RYTyJLADBJ8XdyH1w6lhT4gvUPGVq/TF3HXKc3Goq9HVEe6W/moLhRv0q?=
 =?us-ascii?Q?/Sbjxgj+4F8RI8RWpj02uHsjBBn3E/ZGWc9j73iqeQiPimKibsYcnkFR9NDZ?=
 =?us-ascii?Q?CAPRCpxSYCyzKCE58BA9NXSKy+LpHb3W33yVG/LGoM1q/zOS7cAyCOCHTWDT?=
 =?us-ascii?Q?wPeYOUJMYX7NQQFkKsE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:47:19.6925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2579901b-e7e6-40d9-3498-08de176706dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
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

