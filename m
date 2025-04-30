Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43372AA4033
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA410E610;
	Wed, 30 Apr 2025 01:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZvkANRbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917A710E5FE;
 Wed, 30 Apr 2025 01:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ51SiD0WvHfKk+nu+fhLHiiRl9MWOBt94x3PWUtD9/Vvnu0khG7GilSR5VvEHgtze7lUigveqDqp9bVwDAGpuLn5OX35R/KEb1v9reybG++7P5epnCLrEex/U1595BnHWeNsfI38lZRJOWpgQrrH3trIRetosQvBe3YirFaOB1wsWM+ElqQ0Venqne5MqWnnMtghb3dU49JdRxdXkQsImBijzV3V7zICnLqqsacVtpJrA12Hs/T9ltUh+UgDvVyzsO5mVjLoJs4YM0owbjE14TKW6UICflcjhSsYbOA6mlaFzV53y6K7P82qXaASa1NYilN33c6pecfrVs5TW3/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds6fga4rrcybYl520W6cxaogemC20tYA9L7rtbPTInA=;
 b=n4SUZKYHVvGdMl8Gbl3gieMx1jIPzAZYh/a/vyvuvuKK5A1T9PzJH/VBS5EGKS8IClkTRDBaDhPIbxzW6aSaJf0l9iK0hLo2pFYVLxpX0lLJsIGotix1o3MuGs1pQkTouk/kzypRSHduMziQzZetMBlWsDHytC9kc+ObG2y76L3VnK7OTPO1vNxo3pe2vN0oJ6I2UTgeuVnP7FNel7Z2NKt7ZkdDhL+YEWp4gwWoIo/rjBCt8PDl5/Yi2sq9OXVsRDOKwcBjU/Aekxl6L5Dysbhr8uJZ5/djEnWA8jCgxgK0XNP7RpOzJL2Rdw/yw8a7R/zfGyWa+kaig9RVgVVijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds6fga4rrcybYl520W6cxaogemC20tYA9L7rtbPTInA=;
 b=ZvkANRbjiVZ+ENFDulIyeS9POdTAR1DBC6ONtmKuL4KzoFZ/RwmRwwp3v/l3S4/3i/6gWiL3kujZW+5CVEq9Gg9lHlLQ0XihSdpVGKOvxqet+nvyqHEz8nvwXfmATaloGE9vOxRheDHn8jOJ6cqOpBCJT+MALdXMY4Udf3igQW4=
Received: from SJ0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:a03:39f::18)
 by CY5PR12MB6322.namprd12.prod.outlook.com (2603:10b6:930:21::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:14:39 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c5) by SJ0PR03CA0223.outlook.office365.com
 (2603:10b6:a03:39f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:14:38 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:14:34 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 11/43] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Tue, 29 Apr 2025 19:10:41 -0600
Message-ID: <20250430011115.223996-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CY5PR12MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c6e4d0-2b5a-412b-fc0d-08dd87846101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cFVi5Ry3KkOJyM/LpjAvZt/JMQs+zbOoigZ9DW01Te3FLeJjQDVb8CEwXvm5?=
 =?us-ascii?Q?m1SyVvr+BQtukqEhwyZKLF2FTo7W2JFzODg0Y1DIbwfMZWwJpSZnc0SZH4UV?=
 =?us-ascii?Q?cNSY7NPHqGZAPgX7ID82ZsSFTbuzzzAV35TGne4RctULap9AhCHh4wUcsb2D?=
 =?us-ascii?Q?g/xwLsgjcd+CqcKZrSX2miDIgx5vrr7cPphUp+yBvmt2pKGFGFzN++yyuVRN?=
 =?us-ascii?Q?YzYWOdgP456YZ5wt2xEmCD/fNpUNUwVEiazqO2R1+ZGPr3VwNZT5vLCWE5tG?=
 =?us-ascii?Q?VBoawgsbNtp5rVJSz3mm/nVC0pe2D8JbZDjzo500lm57xs9ztzbGk3nT6ZNw?=
 =?us-ascii?Q?Wv0+s6BH5X4IjLX3MKbogpNxoGGr1CRWRRKJ826IqF/aeTvWbQMGInIPepdG?=
 =?us-ascii?Q?hGRMoJhqVpS6vbYswzbO5IcFVxK/e6IGMkv1lMS4bZrqVsoMr2OzWTTGK1Bq?=
 =?us-ascii?Q?3UOWrCFuEesURQK64ZvuGYwOBCTx/FtOZW8C7K4xP2RVZz3OVYmEOy1nMXFc?=
 =?us-ascii?Q?EMzzg502oLeWw0hELdQqwxQYvFyQufXrFzG5f/TIAtG7b4/PI+hpt1vrRiE2?=
 =?us-ascii?Q?8vK9bBu6N1NDyw8mg2GeNYZBNAAEXOMBQLIbFLKmWU7yEa87gCGj3xuSyPts?=
 =?us-ascii?Q?HMTQj98OuhOmrqX1FniwDKKpszUnZnZYEW9j/JOOwNLrrQM7O7b8R7c8VOZO?=
 =?us-ascii?Q?SfXCAyVMWM1J2JVNC01AroPg8gj+6KuPYqCjOdr6s4fkTyqDb/19tuT2SPPj?=
 =?us-ascii?Q?PA73yhsbjb9O/QJsa2KRCIb8FU+2haAkwbNXJdherr2+E0LlLACywrpf/QqV?=
 =?us-ascii?Q?gu0bknIc27NNz0mNw8klYMuHisl+4YaITVJMaSEuxUzK5IGsd5UZjcvkCM1M?=
 =?us-ascii?Q?WRI/Vu9pH2Gs5vsQ2NjZJiBCky4PXnYOCi8s1IiLbY5B0R/nuarPZlEDeoXO?=
 =?us-ascii?Q?d0PQiK4isc1Tq/8KTU2DgqqTsRPfKcD+ucAWmb2bNrFUgKzd/DPpUqy9yeTt?=
 =?us-ascii?Q?FqNFDH8m4r/UUhV7HbnIVIIqPdH9ukdHFJtM5q+CIontQh8sarYmf+jYRwdO?=
 =?us-ascii?Q?YqW3pFaOk4hX4YNvuTOxUTNbCNcGd4xRj0MycNLS+LX2muiqkJpfZA0+FGoZ?=
 =?us-ascii?Q?YR5iCk006OMpBEzvRmsMdrAKJa9qkgEZHkT+DQpnJ9n0btOyDszEIOMuFTgE?=
 =?us-ascii?Q?EpYZTEcMF1OkJ1EIby7oklF1hMA+wapw43x1/lIT7IEiqJFowJRf55N3tby+?=
 =?us-ascii?Q?KeJUh+an/5BzkIhXvI0wcgTgOB4Ck4Pfjgt0T1kLRCB5UFUB+HwRtJ7VXrW+?=
 =?us-ascii?Q?ISmx5dcpZ1cPmDBcNd99qP9e5uKZHwsdiFtecSBlOcoINFUnEnkHO71yc284?=
 =?us-ascii?Q?FaIRvb+rt3ljrvAFqsxqEHM6QX4a93XnAn6vcOFykAV8+mF1L/4Iwu9IBAOI?=
 =?us-ascii?Q?jXQfH/vMOB9+yP6YQW9fq/UTV5D2F4bfbWMNIr1v/jC7FXXH09yEvODAq4qb?=
 =?us-ascii?Q?e9McefgLuAo9nsaECAI3jOHP10qaL2kDoqfU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:14:38.8637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c6e4d0-2b5a-412b-fc0d-08dd87846101
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6322
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
---
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

 drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
 include/drm/drm_file.h            |  7 +++++++
 include/uapi/drm/drm.h            | 15 +++++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 0b2b3242c976..c0bcaec249de 100644
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
 
@@ -1200,6 +1216,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
 
@@ -1212,7 +1234,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
index e63a71d3c607..80c35ff7f21e 100644
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

