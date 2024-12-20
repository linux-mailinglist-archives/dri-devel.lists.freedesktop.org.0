Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC5E9F8B5E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4110EE83;
	Fri, 20 Dec 2024 04:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EYVoD2kV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD1110EE81;
 Fri, 20 Dec 2024 04:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBDzwV2uvvBElxHFtWjQg3FX/f5qR3mDyajGwYhYsxrMrkL23i4rTVCr3EM37FiWX2z+4cu8fmHJA0drhUWiSv9zI1R7i4OtKWFij3YDuEI/OwYpNMHPxDcGm9w0fwnlPg9DPOA3yqtFPEkZOZGqriQYZ+nlYMLfZqRJOEN50UjxI/KEAhOePbrjrka6JV39P4D+qAbh6DOJ/1y1k8yHT2Srt5126+rW0+0APi6SMUWN+U0lsONjhMFiuAoAcTmjKAKCty3R+SIVXGjaiJsYWPN1cvO3GfabRZKnWk94MWCEXjFP3V3CQYzwmIoHjRW4BKFrxZGhAGodLrujzqIZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8zvYcnxPCxVFJCw4Qe7YPUWHBYxRVq+nd67ibSPFUE=;
 b=EXTCFm7qXickzxY+6/JV8TGPj/27C+vg0tHW24OfedKOjDp1jxn3U6xVSrEweLMLI5QQiE0O5yB6Dh3RixXoXR9ZR2xCIf0MwNgPw1SEWlsuVXOMHw22+pV479nv44L/3q/IZ9V4zSUTNFFqzYt7YJhQ5aLzxaPitX3zyLEp6uckI9OhxInMZMBlJYTaUHLCRJafX4v92RwF4O7ReY7VuPJxDXEwt8JfCZ8594Xbbwk4TB5aM6108lUD+HBSNlBF7OXcnSIqSVufQ+HFDQBY8jssOEfYLz8st9gFHmOBfiK5CZR2UF3Qx0zoiZhES9mljl+z6aDaKvtSIMuwPVOS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8zvYcnxPCxVFJCw4Qe7YPUWHBYxRVq+nd67ibSPFUE=;
 b=EYVoD2kV2qD8ReKT6nUnM+YQRA0j2GzCJOHLK/U1NXU3UIpZ5U4HE7xUkPrhPONU0MpaLcSjK2yBr8lj2vfjfSsKXlU4QpOyGMO+9H4cuR20mY9EO0hnrYnVOmCCyTVXQd0AHnQ/cAh7CdIL/VO5PVuU2xfvqm8PHJOGHC571Yo=
Received: from SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:38:49 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::e4) by SA9PR03CA0006.outlook.office365.com
 (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:38:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:38:47 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 13/45] drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Thu, 19 Dec 2024 21:33:19 -0700
Message-ID: <20241220043410.416867-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: aba98038-4f74-4fc4-dc59-08dd20b032a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cB1xzbkGADeR5elYa429AQv9FnVe3DEI3KkjqCH29tfgh9vVu/NAdzzoyTch?=
 =?us-ascii?Q?QluOMv5BJK0HyZ4Y27wBVR/6wxFHrNDhtgk8UD1R7uYRpej3HEl1vaTbtF78?=
 =?us-ascii?Q?BTuG47zTLI7Ue+hOvGt+Le/DI2xwEGYXPmWX8QQNP+uu+fhQrPg35yhZrClB?=
 =?us-ascii?Q?4zOzRU6o1w/ZaPGXyg+GuX6waw+MN7ODIkV6QFn7RaD33RLrwvdeJP35nL6A?=
 =?us-ascii?Q?CXHXP+HR4CKPnaWEZDLaqkmlu3XmleggQUtumCC2qQGpyQUL5UOg+H03k23h?=
 =?us-ascii?Q?lOOYWOJzKKz+vN3wMG2FqmXiRcBZLGbL1BjnqX10UyWL/ct0p1f36ukP28f2?=
 =?us-ascii?Q?2+kJtAQiVWFMPsF8aqazZx8tXMr+X3Hmvo+FpCrVJvSenhp1AXiNAVJ5QJcn?=
 =?us-ascii?Q?Bss0GGItBcgGPtYDoKpY6eX2HD+UoUXILtPnubr50jwPwFSG2F9PvH7mJkIm?=
 =?us-ascii?Q?qpVStDs4/b3dRL9j2WXqvpGBIqBFkV4qG4xRLPb8lyUHhyiUKcNe0MPFolJO?=
 =?us-ascii?Q?0LE6/vI2j5bkkDAjb9YPbd6EIP0w3JCl7xoMDCkVzTgmxdTP8UUwRsx5x4+E?=
 =?us-ascii?Q?hxUakbaQFj0kSsjRtSr5pEPVmj+ZuKEpRadACES+8Q/INZLtKzT/h2RqI/I+?=
 =?us-ascii?Q?Ha1FhNOpnhW8d5yyrBR16I6YfrWNSpETRekHF53+TujR9dDmIkYnQlzhE3Ti?=
 =?us-ascii?Q?0w5QQ05yUimLVPMJ4ybZJC1VTrTpLnEktqeBloj5fBRaPQwhint2tu2SNckx?=
 =?us-ascii?Q?vR2E/WaDbfcX5ftWbtsdSks/gEX+h1hU6QYoGx9jurflYugrqB8l8cT+UF7T?=
 =?us-ascii?Q?oDmf/laccT7sA+MpNvhTC50vXkAS+OFD6TswuaxSd9nZxJhjjzkySiP4laZH?=
 =?us-ascii?Q?j1zCuKA2dt129NaVbDvTCTbKTuGzP0YnjqloJ56GFCmzJcJd357UFCmgT8Y+?=
 =?us-ascii?Q?evx8efsCIg+CSGEvNw7bRQ36MtQWvzcvSMkkcsMLpeKY3a5/qzDcQWDpC8cl?=
 =?us-ascii?Q?cK6Lct3g+02svLU3wGqRYIwfRJayV8gsyLW+jJRLxmlR6XjelSw4pa6X70vT?=
 =?us-ascii?Q?JaEIjKCpBQfnoiegzrkEJN8vThl3p24IE7nCL0oxpjNfQeNbzXrvSg0xqeTp?=
 =?us-ascii?Q?SK6QTf0kVcaWt+S1x9jFoEP1PiQcw5/4e0STf9GTI696vNAAjqucZN73bT6B?=
 =?us-ascii?Q?ka+uJ6jOrtR8pGxB0fZOk+1l+cq0cHLeowdMQ/mqsfKn9ii5XwAC6ONwz5Wk?=
 =?us-ascii?Q?ED9PwJ35730jbfnXRk5rPCo2GhAEQoGBC65aV+PY0pLiwxA3heuxs+vyNfvK?=
 =?us-ascii?Q?kMMF9l7x+GaxMG9v1UliRTuUQ8JmKO36qZXGf8hrqe5K0jUtnWS68/+NShKQ?=
 =?us-ascii?Q?kJxQMnmy6cpbDWnOeTQRrXY0XUZwCApMBU532CeUDKjoDxgtJDN9xkhMhNKH?=
 =?us-ascii?Q?Cgwtbkw4jZIxQoHXd+F2kqYmTSXyUujvB8pa53pN288sdqx7TFy0OyFie/ox?=
 =?us-ascii?Q?M25FylC3T1x+e78=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:38:49.1670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba98038-4f74-4fc4-dc59-08dd20b032a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
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
programming the HW.

Setting of the COLOR_PIPELINE plane property or drm_colorop
properties is only allowed for userspace that sets this
client cap.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v5:
 - Fix kernel docs

v4:
 - Don't block setting of COLOR_RANGE and COLOR_ENCODING
   when client cap is set

 drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++++++++-
 drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
 include/drm/drm_file.h            |  7 +++++++
 include/uapi/drm/drm.h            | 16 ++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index f2503f56fc82..f0c22abcc28f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -570,6 +570,12 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->color_range_property) {
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
 
@@ -1180,6 +1186,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
 
@@ -1192,7 +1204,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_colorop_set_property(colorop,
 				colorop_state, file_priv,
 				prop, prop_value);
-
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 51f39912866f..6b5021b68e35 100644
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
index 8c0030c77308..6d9a1578c7dc 100644
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
index 16122819edfe..a2fc85ecdea1 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -875,6 +875,22 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_plane, as well as drm_colorop properties.
+ *
+ * Drivers will ignore these drm_plane properties:
+ *  - COLOR_ENCODING
+ *  - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.43.0

