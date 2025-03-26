Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19BA72756
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853C710E7CC;
	Wed, 26 Mar 2025 23:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4co7M7Ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8EC10E7C9;
 Wed, 26 Mar 2025 23:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3gGxSpK+wAdW1U4a6vi/sOEuywgME0LHBTTWJM09XhLwr//8B8/4do+l1i4HeQ06gbedjio4w67L4SoZobZhRfmTrDYqG4B5+5HBAROPunOLEqURnN9LFoqo0ztq0AX96sC0trWV3jSLQ0cKHj/eYq+p8Pjc0JF1AHtgUO6sYlFMK9XMtRDkT86oHKBcSZLc5lzx1PUwB04S+O8+pld3YOTxeTS7OY2+1EEP0ayGMxYpLCnj+RfHMEutjo8L3Tu0ksSDUPdA31EjbNP9bLfQAkX+3b5gpkTdmZF/FQdqp3l48TtFzqVex+F9v95CPGU3IrAf8auIMwKnfC0Na2bWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7Hcp3Fju3yZNSamBW8diTsGn4JFlBMFMsRilYXt1EA=;
 b=BVcpa4BXKkyphLW2HEYQzdnmOtzdlPIZ9ho3maOj+8YRZFK+aha3D0Oo9DceX4Ed5uXNYxoKDJbEhWFruqKg+0imApY1H6vH7iD5vwM2eoZ1CLbs35qDz7UgZhok6IeWdf6siRY57yMWW0PyihahogsvXoocGN6GNYV9vcrdgSDZfHlKrT3UkgAQedjwpRfHgIv5io5AO7Znnw3ndCtK09Wx66bh3Se1u3iKGB3/TnlCY16t8+Yqxx05Cvb1tUhtWWt5sBxNGEHq5GUnNKZevK+jRr9IQ5AT8lO12rxZJiQOOx9aNsTBnj6rsy9HkXuQ0XfklsF4zzgyIfx9rgaSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Hcp3Fju3yZNSamBW8diTsGn4JFlBMFMsRilYXt1EA=;
 b=4co7M7PhJEQEng86P460ubX4j+uRVwbKjMsdCOvcCvtlUGdcDl9bpsmHt5u1dW1ZQI81MD976/S9yK0QeC9BllawhV6ee1RfOyRtbE+poK15BNH09ObrjcrKYqPRZnt09OvjGyq7hIPO070nVpeBrWFkiJ5Km6nkL5hwq6BdTCI=
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:51:11 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::60) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:51:10 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:51:07 -0500
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
Subject: [PATCH V8 11/43] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 26 Mar 2025 17:46:52 -0600
Message-ID: <20250326234748.2982010-12-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 10402bab-20cd-4f44-9d7b-08dd6cc11595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Su76eTMhpxgZA0S++dwb9WatAe4hff6Lva3L2lAse/RJn0FWrkf0sVFTBCl0?=
 =?us-ascii?Q?dmXXUWvDCeL9Ir5Z3PCSHqyxUxQqncJ3qlWvZ4nfU67ZcmXQXqjcZ0LzamIv?=
 =?us-ascii?Q?B3VxZFoIEaP6iHfhxA9XBqIMxoDqy0wrT5MaMFJ00WqgFQ83cTyudbf7Z9jm?=
 =?us-ascii?Q?57bUwW82f73bmvKp9yaZwvS39kSp7f+FlgMNRPCWIThhaVA4xqYhR9l2eM0l?=
 =?us-ascii?Q?kdWQ5g4O8N2efzlpVJFuXQ9FA1MUDhYsjvJNqQTPjSnS+Q2kj7Ad8ZM3VQze?=
 =?us-ascii?Q?pILOVDU4r1OT0cn1n/Ci9Pj90LmMUSdX2WIozSr76BwwBioqAj3dTxNVnGrV?=
 =?us-ascii?Q?6nKW6UO1GcDqBq7zuELWFFl/y8KbXoHsT2z/7ogdakaIN+mOM62YN5OToVXP?=
 =?us-ascii?Q?u/mx4b0uccA7IBr3yrszYQiBP9N0q6humVl12T8Vp7mnytpqPZVtZwNenr7W?=
 =?us-ascii?Q?Q2zBY7cTJFzC+jyVjH23xpI2TMH0ghSMO+YX9jULikltR/baw0b8p8Jpd0rv?=
 =?us-ascii?Q?V9hf7J5rO0yUFV8FlU5ATLn/GS9Id7ATKlKGzM038z4PkEfEzvuEi3fGYZBt?=
 =?us-ascii?Q?grkt+CUleQejgt7voGe8Fhurva9td35ntFCvxtqW9vM9un9kJlePxQ/QnMOp?=
 =?us-ascii?Q?u+kfaF4qHFICsGq2S3VTQKtyyKY/DBh0Wxc7RTpHFnXoSRw7iu5gLDMKQkng?=
 =?us-ascii?Q?y3PfSyfCd5tgJz0Nbwe/hOhT8LwXS9dOX9QdKQU40Yheww6Dx1AYf+pFoNJ9?=
 =?us-ascii?Q?1dV106eiI72jbY0A6ssUmqhzD1I5ANtKfO4VbDWKOUAWvEJFls0BYyUUyJDh?=
 =?us-ascii?Q?++P89TtHfxIcBX3TdbC/G9VgSDTyDIi5oOS3HWBpgockhA6VJXk71+rtDeSd?=
 =?us-ascii?Q?iWN5EnGUw+RVbh6RGsCw4/k5cn23A4+EYvHYIlQQgVdaWQG5eA2y32Q1e2MB?=
 =?us-ascii?Q?jjhUscxn7jOcZHpnn7iyNAdSCO8cgezFRqd0nhNSEK1ghywrypX/7thY8iB0?=
 =?us-ascii?Q?rGvil8hE6/c9lYEZ7ccTo1CeRY/2aF0tQ+a9Y4Sscn5bB8i7+2QF041rXg2E?=
 =?us-ascii?Q?CrbdIQnV2NV6IizkvmadnePJacHzURtVxAlCZu7lACA2dNGFFInTWj4bwgK3?=
 =?us-ascii?Q?thhNbGHoGaEQWn3XWOVq/hltt7+v6+SbbrIOGkUXWgcNF3r1PwyHOH9nd2sR?=
 =?us-ascii?Q?/wvqystXMxmZ2rgu9C74XAVJKxzAnankRtbRbnJMhZkaIbhC9qHDlXvSFn1y?=
 =?us-ascii?Q?9pXs/63XrhOow6cfwGvF++OfbXvfEC3sUFo+op4uXYNVPzywAVydZCZkGSBW?=
 =?us-ascii?Q?3/jjDtSsBspcKswTcRd0kM33voE8psdZWlBEqm/eaLSdEqtOI9CmSW1sc0Sv?=
 =?us-ascii?Q?KvPP44WfLKlnqIzDDgAl6aQvWOFGcmk1m63uv91W4oCmIqmjR5Xqe9IiCiaT?=
 =?us-ascii?Q?7oe1chD0Xjrg8xHH9ZeDrIsxqhwRmI56oAWoi5pbKxjpqVTOXthQQit8Fv6r?=
 =?us-ascii?Q?sK08GhVgvmipLaM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:51:10.2624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10402bab-20cd-4f44-9d7b-08dd6cc11595
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
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
programming the HW. DRM clients that don't register with
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will not be allowed to
set the COLOR_ENCODING and COLOR_RANGE properties.

Setting of the COLOR_PIPELINE plane property or drm_colorop
properties is only allowed for userspace that sets this
client cap.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v8:
 - Disallow setting of COLOR_RANGE and COLOR_ENCODING when
   DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set

v5:
 - Fix kernel docs

v4:
 - Don't block setting of COLOR_RANGE and COLOR_ENCODING
   when client cap is set


 drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
 include/drm/drm_file.h            |  7 +++++++
 include/uapi/drm/drm.h            | 15 +++++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5738b1c18755..e0b4b122ef6b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -567,10 +567,26 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->zpos_property) {
 		state->zpos = val;
 	} else if (property == plane->color_encoding_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_ENCODING plane property not permitted with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_RANGE plane property not permitted with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client cap\n");
+			return -EINVAL;
+		}
 		state->color_range = val;
 	} else if (property == plane->color_pipeline_property) {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted unless DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
+
 		/* find DRM colorop object */
 		struct drm_colorop *colorop = NULL;
 
@@ -1197,6 +1213,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		break;
 	}
 	case DRM_MODE_OBJECT_COLOROP: {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(prop->dev,
+				       "[OBJECT:%d] is a colorop but DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set\n",
+				       obj->id);
+			ret = -EINVAL;
+		}
 		struct drm_colorop *colorop = obj_to_colorop(obj);
 		struct drm_colorop_state *colorop_state;
 
@@ -1209,7 +1231,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_colorop_set_property(colorop,
 				colorop_state, file_priv,
 				prop, prop_value);
-
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..5c89c586da7c 100644
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
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..86929ca667aa 100644
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
index 7fba37b94401..3d12fbab066f 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -875,6 +875,21 @@ struct drm_get_cap {
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

