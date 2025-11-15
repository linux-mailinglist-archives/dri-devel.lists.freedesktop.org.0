Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF4C5FA9E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF9310EB8C;
	Sat, 15 Nov 2025 00:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZPHL7aSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012035.outbound.protection.outlook.com
 [40.93.195.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C1C10EB8C;
 Sat, 15 Nov 2025 00:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzVJj2wySQmFS978bdYU5+ej+7D6blz7oZeIm6KYdzVeUdilcR8Uc6XrrvWAkehNEZ4hiVtDj8wKe/wGn1eIOywZwnOwB2TjzMkewABODlvjogq3snxfUyYx7Kb/ARG2PPsZVzHnHvxVthKYGjZQcJmQ4ZsG+6jy0xgxzxrWTwoEZ5RVs3N8S+taFWdnTo58YVfv3rKomcUw2aIe6/OfDEBHLlLS1N47pjdxLlW656iGaHeiV8vcVusDhhJ8JeQS7rqZrmSk+Aofb9MJGCXxjEJfAdD5baTMUOl9dmgCMdHxSMgc3p8Crn4MwCJHeNoby6luoP5Wr/ObkRFt9kACzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzPUNc7faMW9Kxjnzf6FaJtnS5LaY4uuz8i3a9HNPEc=;
 b=FSNH0sT+B6tabovvG7vOPCT5SZHur4lamLITRiujKwOoi7hLMnuFsqmW3UkmsascV4hevvJIWlp8fEp6BkXZas+jjdZEcfmCzXGgiT8MQNbvO15maPn2ne6ZLzpjh8JtQ0eQr0QgZ+1UoqFLhn2Vw696bTX9Tru/+S1kG1boym+FPvKtUJXn5sZhJA1PiGrYaOvFde0csGDgpBmc7U+btAg/MhigaKFkzUmTevYWBitAjTTvXR6MjUVkt3u9wO8MWpgD6VzaSuSYgcFckKfs8QZkmGnqNV6cuiU6kAMZ3jDaKgJfVTtNb/E2GUdJt0kkqeXr1Ac43z0IpSx2TFwAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzPUNc7faMW9Kxjnzf6FaJtnS5LaY4uuz8i3a9HNPEc=;
 b=ZPHL7aSlJzk7xkSKwDUMQjrddndaU33B90Aqx6qfY7KWOMCa9+3Gtu1WBGs8L5IRVroutONOm1X+JPsmIrxNe3xjZAuvBhLb4xVlg7Axq3u5SEUUh3k2RbOvACHUoOn+7NWWRzX5YENbohQtrwXKiC8mNHbkAqbnHEI8KAT8tzo=
Received: from SJ0PR13CA0051.namprd13.prod.outlook.com (2603:10b6:a03:2c2::26)
 by LV8PR12MB9420.namprd12.prod.outlook.com (2603:10b6:408:200::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:06:25 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::63) by SJ0PR13CA0051.outlook.office365.com
 (2603:10b6:a03:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:06:24 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:06:21 -0800
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
Subject: [PATCH V13 11/51] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Fri, 14 Nov 2025 17:01:36 -0700
Message-ID: <20251115000237.3561250-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|LV8PR12MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: be0af0ba-f869-4794-2d23-08de23dad113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SjFueU5A4hPMsdNMn8KVMGH/0amWfnsjBbqEM171xFyu0Z/5Oc7p/oP2JhAf?=
 =?us-ascii?Q?aeo7QYbXoe6RSEDUkFW/qRd1SkZqm8ye8sMi0vuOpeTzU1/k3S7srfMNvQr1?=
 =?us-ascii?Q?x6c5gaoUUb/rzx5eLt4cDxpkWkJyAiFXVtys2jtJyKZIwlQrpcvJ4LwKeNW8?=
 =?us-ascii?Q?zS8BKwo584u6lDwfhMGeuK8NuGWm0o3KCo5F9hrW00DlZNK0lCaFR0vyetfv?=
 =?us-ascii?Q?jauSsQb/4rweSdxnqMIG/MptMPSiaTO4IC7Z+tNqTEzxeR/JqBvzwSYIh0Wx?=
 =?us-ascii?Q?VJlgB+QAMxFleVbK4h7MP4+i5CeSNh1Co0aZ5CK4AKC0nWNDoUvat9cD2lla?=
 =?us-ascii?Q?tAtM2ZQF1jUwarG2lRwDkakDPIaQ/hxebBoSBWmprTYiC69+nQqIm+XXryID?=
 =?us-ascii?Q?i4vBp1F1GiGtanR9Rb6duJE2uFc0QMGMNDjoO/bxC8VIJ37S6tUbK9rpVBfP?=
 =?us-ascii?Q?RWS0JR4uz35OAZe2eLChu/joTiqLRXybfD66ahJ79Og8ehg+/FYkHLe7EvXJ?=
 =?us-ascii?Q?MQd+zaoPZ1K0gt/yONIIVQ1L+g5kpfNt1VtZi8Uxt7thbTiubs8mqcHrIgyC?=
 =?us-ascii?Q?k5LBZRDMr/u5HCsW9GHQ62QJde65g58n0e9XlzZ3VV1VFFD6tG7w5N2pDpSi?=
 =?us-ascii?Q?zN7kMGlcX/TOGEmem/XRQzBXCf45ormvycl839mWFRb5FwHEuWiMGrQwegls?=
 =?us-ascii?Q?CMDhP/dn1xhADvBfkSeOeRXh7Lco2auaw+DTKdyH8SFTQEiygWxbNqMnJfpB?=
 =?us-ascii?Q?CbW+f0gJeX9ez2En6D88RXXaw0irGxIm6kbrvbGs5YOlH1oU/OEpQLdwPS30?=
 =?us-ascii?Q?3lZgjnjeGjQGA7kpbsmzQ+liFBxRdaRBasBNYWFVGDHgtNBFqZ1p+T9IAC7A?=
 =?us-ascii?Q?HJvsz0cb14axQvct9+R3gV9d0oNXKBRZ4ivOB5zndy2ib19nv4zSLgB92c7U?=
 =?us-ascii?Q?OlnWXKtG2Z7ppu1aYllRSZbfOpNwQJ1bFwrYHgag2RJgMXisCd71npP+2I99?=
 =?us-ascii?Q?phN0iFMLLQN/iKasAYUIhpx1CjkO3E+Sf3QCwO0QMkMnisaYmIhB4DuVZUl1?=
 =?us-ascii?Q?pvnJB9Nw5mue7gd2JcZ6KDTcJA2VgP+3ABSOgJnlCg36NdC2TcRmTKC/Mh8X?=
 =?us-ascii?Q?mln/oq2P4xudfAmqexNIlfbfEx8svLwBR4dDXnmPKc4wrRc1Q6NqdibaV9ac?=
 =?us-ascii?Q?+15E6+qUCbFu0A1aaKdTq/hYSeEVSWZRYM1UPGu+t/gBgZVtAbthO2ds6MXH?=
 =?us-ascii?Q?T7NncINDp9T0nnNLOwhCPJxd2D2T/ms0QOFp4TocRYB8agq8aUj+AbbVMj/g?=
 =?us-ascii?Q?tOVRl5tWUWZLOSV7bfTRi7Mv1tS/hOPrD2QTKIg001uF5bHnfA5Yv9MROO9c?=
 =?us-ascii?Q?o3lHxWYFvNRxccFpDq0TNUWcbPGXk4l1EgAAC2u7GSx/pqWMSlTfoTKzKw5s?=
 =?us-ascii?Q?/pamPxQWMx89kiaHyHFgE5Wh+MBTdfXfDob1WYXtFdcurbfA4sYaQ12brMXE?=
 =?us-ascii?Q?CrUIMKOZK0pjkFeA3JoRk/0LhjsGZ8gulVKovvlzh1sHy4UHh5cvranhBkIJ?=
 =?us-ascii?Q?9ieLU6lxe7fhXIqj15g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:06:24.9365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0af0ba-f869-4794-2d23-08de23dad113
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9420
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

