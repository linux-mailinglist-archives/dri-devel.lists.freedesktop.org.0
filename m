Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B3A957603
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6810E3B8;
	Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SOvMflkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBA310E3AF;
 Mon, 19 Aug 2024 20:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8tGUbquVTz0Jrfq9umLQcDAwuFhijBADD/v3SHHjCVPeCGwl9kkiDa234coCCiT/7/zgFYzWmit4qZzrPLz9y9T8EkW38y8N5uevHUyHoD8TUC4fyhkHnLxiQHnu6SsepQcXyCpMDCGGd+38YKl0lYlTKJAnz3JecKbt5lPB7MvUHA5SZcRGCK0c4PzcevBT8hmGw2VRJz5IBydtkPtfR58x6N7eh3Ez+/4GdOUOYHiUXFQy9cHIjBapBtka+UjUjbuq9OMC+lO7azVkeJ5bvNfD7fdPCfa+wJMZmAEbyuOcrt6vBBkFu4EXb9uScU9KwyC0Y4k9fb7/btrlzMiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVZvcTL4q5DQmNFex1f81yLKmR4TCxhy0f7Zq0xLtKQ=;
 b=rW1b0rSuOsJkmd8G5bS8HeILo/N/bjCfdxTK+DNTzzNQCNcviu91BXMeaHtGdNq6IXUcuKrfxMFytrTtZDRGqwyXHGE6I4ug2t70EX+I89gIUpPl66d32kNDXF3O9lVILs6nr3obZLkDgzWMiKA8R1YgbBmF90uwcYafVAyKsHBWrZfy8qdUxzidcTdwbpufuy4zHeDfC2ShUnZyMlZ5fgVL4sHvVGGX4QJXUa9AiOq5rDIZkMsOwacE0sLnJ3HO19KNy9SI+wzluZEmIp4FMYk3bht+4uRFtMNNXdKyBh3LerIj9ZBtg7ka74tbHhWKRbC4E0elrPSPkCT9QlE38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVZvcTL4q5DQmNFex1f81yLKmR4TCxhy0f7Zq0xLtKQ=;
 b=SOvMflkpGp0DFGE/Ic5+9b/fOdSeUaO/nu7YnysU5XMQ2dNLDIYECJzBZV9MsPrsXLalMwooBwctgbgrYAuqsJwSv1uWoI+GznG7lwq+SzwU0S3l6elwsGf20+6CeuzhFecnnLgfx1Z5zgvO0k3uAkkBnbydkh3F4grRECGiQyE=
Received: from BN0PR10CA0017.namprd10.prod.outlook.com (2603:10b6:408:143::26)
 by IA1PR12MB7734.namprd12.prod.outlook.com (2603:10b6:208:422::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:57:29 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::31) by BN0PR10CA0017.outlook.office365.com
 (2603:10b6:408:143::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 16/44] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Mon, 19 Aug 2024 16:56:43 -0400
Message-ID: <20240819205714.316380-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|IA1PR12MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 9676d6eb-0fb8-46d0-f7fe-08dcc09189bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sfahkEsZ0ut3L/DaxjQgO4vNlIsA7F3mW57fuvlJp1uef+3oSMeN+n1SqW6q?=
 =?us-ascii?Q?6myJG33Lgff580zZaZ3/DsIF+JQz+7I8EYelFmn6g+gyKjjmuhIP7/oCCq+f?=
 =?us-ascii?Q?zs/F4nd3tR/HediRJShcQw+Iex6Gnkq+W1J4MiAJ3wfQrMfv4ws7He7cknNP?=
 =?us-ascii?Q?mUP3v3O/sPT8kSIK713yakqfmHANAFgfzGhLYO74+hG55pvhs1LTXGFQDI9e?=
 =?us-ascii?Q?hA5JLIoHO2k7bDJ+L2IDy3FbnSqg+C6WK15AKWfwnA23fWmkVM6Li27lId6K?=
 =?us-ascii?Q?7RWwImuMlyqUtofDtCTl2xHqdfWfV9+yovsEWAhTHRLC5Q5uSt/6pxAbJBJz?=
 =?us-ascii?Q?YFHO80fXdUVZOtiX9vzONFoltYvLAOBOcDyccAdDluiUUXnV7gwNlZxzqtPN?=
 =?us-ascii?Q?CbheED2X/cb1e1XSKeTjEoRc4BQvgKR32rrni28c9FkH3mlHTV6CQiKUdDFY?=
 =?us-ascii?Q?4oFSU4cOBMLBdlsuOM/18Me8HPnLlxTMyGiDLY+g6XkpnHcF7SJHAgKEm3YI?=
 =?us-ascii?Q?Z5panFJb6UN2yCDwAfD6nJFDK01khcpE2LGlC3FDlOpZyagu4HIaAkqrWm9y?=
 =?us-ascii?Q?WxIKLVCd/12mavXoeW97iuF+uoRdXtfaMrrOesoxxjVzmStpSuAM7WgXj2rk?=
 =?us-ascii?Q?h+xdotnskW/aUi6t42cO6s4QNelr0SGSk8cmGpCxlEIO2yOb0O+RinntsK7s?=
 =?us-ascii?Q?zR+QS85GBj5OHxpJ6FnPCug49DZW8N6WVzvs2ATF+j8RSQzF9W7E51YT/MPb?=
 =?us-ascii?Q?GX9ZxxDXnziM0ROhghzAsS2qkbunbAAcDiAFMfyGre9ND5lwMH0/NHx235SJ?=
 =?us-ascii?Q?bCdl3Rw083V9wFrIALtj6TsAut5zPmrMNd/aFq2Ff/Wm/iiJVT5DM1AARSYK?=
 =?us-ascii?Q?2TXACs+trPWLBQg9cyVvWp4MbikbUrRIiok7izd0uB2hq6/uyMk6eFjvtBha?=
 =?us-ascii?Q?w/PxkPJ9Uq2r2SBbx8XpI81QpJy7OzrVa4OHWHJFTTw1n/+ZOViDAZxGwUTB?=
 =?us-ascii?Q?RTryQ3wfCOqsoCPfTZfGdp0B2XtWC1oVBJ8+AJgymjIRjXgXiylnnWSV3ill?=
 =?us-ascii?Q?zv1+LCIlGQTNL+ZdQoxBOMnU/yaVRE0RvXbYE8lNppGR4GJRcVB7nR5F1GkV?=
 =?us-ascii?Q?K9Bupre91M+h/BBR0EAAs8m/2/vphwnkhS3wbWBC7xqdX/T7D01Fz6rg3aVJ?=
 =?us-ascii?Q?hhjzmRkFXRusKFj9tZJQRMopR/olpGHutKo1J7pbsaeBoKa580FYrpZolhma?=
 =?us-ascii?Q?k6XTNc+sXVj81FHJwiQOp1Pv/cI4Nmi4G0vn7sJYIYh/IDEun7Go91n5EcoN?=
 =?us-ascii?Q?olGjw9kRGOcifd1jrogdwwMtAiaKnDs0phHQ2UyBJZahmj3uMw6K91yYFtHz?=
 =?us-ascii?Q?cptxwflHzyR+xSidPB1tQlzs50aG6uS8KfCsLljMuiLoQVTkMamF0dBXeIYS?=
 =?us-ascii?Q?FF5Y5Lf3UW94wglOU5vFDR4PczwBHpvc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:29.2731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9676d6eb-0fb8-46d0-f7fe-08dcc09189bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7734
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

v5:
 - Fix kernel docs

v4:
 - Don't block setting of COLOR_RANGE and COLOR_ENCODING
   when client cap is set

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++++++++-
 drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
 include/drm/drm_file.h            |  7 +++++++
 include/uapi/drm/drm.h            | 16 ++++++++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d8d5be358b3e..5dd834e3979b 100644
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
 		colorop = drm_colorop_find(dev, file_priv, val);
@@ -1186,6 +1192,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
 
@@ -1198,7 +1210,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
index ab230d3af138..63c1d29b8520 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -204,6 +204,13 @@ struct drm_file {
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
2.46.0

