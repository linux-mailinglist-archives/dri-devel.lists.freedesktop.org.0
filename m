Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE8B98F78B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2F10E90D;
	Thu,  3 Oct 2024 20:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WIn1ma+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93F10E926;
 Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7LiLUOBJf4254YcYJjPSj87ms2oPdUE/dBqieo/J+nbEoVKGvpU0dn0NSvORIJ/xdB5eZthg70NCJ8lf7ncGuKXhQJbfnp2kclLBLJCMJqBGU/HDfS54tFCWF5mp2lG7suRfOx88+147OnnndQh8suMMf4wYPKpSv4AY26Fc4byIiUxXytzOZDcB/8Z52Mvx/rfpaXof1eTEZ+5RrAqE10pj3iyjAw1lJe5O4fopEbcgI7PTxiAtqw6GUnqqj1nEsTgZF0s8b6UFtRJZrdOL3zLXLoYEVBz1agcmlniJV6Hm1fB0GXxDmIIapjraiVvU8jCjG2WuCG8/9UjTxSecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM9COioS+jk5xCSfeg/XvtNzNkQ1CrWMeHhNWPN+39M=;
 b=EHyPDXb3Wy9YxXfENNFnshr8kr3mtbyifN9/eXN0J5eNkEW57MpR5OVAXA9xbNaTPfrWSBIG9djiLjUUR/G7Zwm9+zSjXV+yk4ZC3ZNwk8teTiONLwGHRZc1BI9aGLPEEfnpURu6aKTIBygJxCZv2+bmoOjxvMdHZJcZi064vYC494mORCQRYa9YS8uiSeUKE6H3IzeHKI+vg+464o8ZwpVlibSlK6HQ4YNFNfQ36Uos71VjqQqCwfRX9IKpGEmQPsBAOzFqXgCXhSCZzEDjYqw2b1/bzgqp0197RE65x7j7AoEiwBDA26LC1BTdo2cAAUivqgC+kX7JnvYwJVgx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM9COioS+jk5xCSfeg/XvtNzNkQ1CrWMeHhNWPN+39M=;
 b=WIn1ma+1MHEv0vlE3Se2lV2k9JBYbvcl3MQvnagXpAwajOqeHGXl5CJKI3oUNitdGGS4GO5CJ5QHGBAdhCcDdeK0FiWKwTg5ziCG2yOxVAIeYISxVs/W/oTcS/efqRPSa9hcZL23AN1cz2wi91x13wc85FnKlhfTnWiUON3brVY=
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:44 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::e9) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:41 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 16/44] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Thu, 3 Oct 2024 16:00:58 -0400
Message-ID: <20241003200129.1732122-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: acfaedce-fd4b-4fe3-d033-08dce3e63454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DoDrfNAJvGnzws9Gcu1Vy7l47i+SBNEWywK2BkIw8snx4n/LOMaH6r0HVnwD?=
 =?us-ascii?Q?XavdwoxfjrhIeq0r2PkJVaOIxsTm3IW1EGAgLBAh7jGhL+fAWWY+dzh5PoT5?=
 =?us-ascii?Q?Uo811nHt5oN5uoz/5IR4Ac+7iYo76I2+0s0IigcokYfIjrXY2iiEjyKoJyU+?=
 =?us-ascii?Q?G3ZIZletn0D7eXXxunc+kIKk9+zQGcVeKyipn6cHOfdgtllePdLc8qBxetbB?=
 =?us-ascii?Q?P5RwajsQF7QHqzRxE74T1Ma0R+QxyFuqc0CNv8wzTtJdyoXRTqkjBgTI0nMl?=
 =?us-ascii?Q?KMI2kp57cT4ZzpoOg4IUgXkjooAAZICoxeGM8zXDjvbrMPMHQF86TGIQMntL?=
 =?us-ascii?Q?3SpX/GF5SVo7Ye+2Hx/KHVFbYbWg/0zwoi2hA2Kngol0DUiQg4eQqeAGzavP?=
 =?us-ascii?Q?xD9+7ub4gA1nwY5T6K5O5h4UlqUKNql1QdILJl0aNEZiWnH69ilGKbenPYDE?=
 =?us-ascii?Q?crxPgwcOC7mli2nn1k/pTUCqzC8Uy+x6qyCWmS4TZXIJYA9Q2s0l/uxOjt5/?=
 =?us-ascii?Q?ViVm0X7RT3235+ybdLNUHRyHPKhho7mWxjHISVSVVl/Zm/K2KjQJR+wYATqO?=
 =?us-ascii?Q?BZ2Z3C2+yzAQceHaKnhyy8FYGkvyUXDgo0EOVJVr4Zr2fbu/sFoFp5m1hXc4?=
 =?us-ascii?Q?O4pvJU3w2fF0Gf2biSURiGpghCQ/Ynb+2SPR8iw/GYzw7OTE2jLv8FONi/1m?=
 =?us-ascii?Q?x3FitOpAu/qaTKKwwy7A3lBzXaLDGsx4YkO506uw16BPukVAzmj2tS/VeFuY?=
 =?us-ascii?Q?L2INJCfAtOdqP1uyHP6Fq/i4AgKEw4tp8+i08iGcLXeU2RIEQcqGPA3pzuYI?=
 =?us-ascii?Q?idhyxnEx+4PaijYDfYOv5ZeREPRuyf2FcytcNNmEvdp3/wrupkVa3ic83GTB?=
 =?us-ascii?Q?/DjlJrZDW4u0N4eJZVyWKmeapoJbqkmo3ovBQEzct+762didBub+/d/HgbWq?=
 =?us-ascii?Q?DWxDGP10xkY7iCuoP65Ky/PaWFVqLtH2tn3XjMnb/AQ2awlly4Y3WNPxO9P1?=
 =?us-ascii?Q?/rPOtSZ4uNgjVdZmc37mz+DsC7n9dZVOYNtgGKZNrgpcQAdUdrDXq5RSOi9k?=
 =?us-ascii?Q?Huk+MJ1t0seBgMZjAp9DN+wz2z3EM7xkvNvNdVaU8s5xr7rkOUcpBbtF4aZO?=
 =?us-ascii?Q?695uY+WSHaUKLNAsJXR+FH0gmTDqzVlp3t5/2e6ZAVCmuT7BwHStrsmZnlff?=
 =?us-ascii?Q?GL0ZKoFSJQIW4W/law97p7Yn8osAA/U7cVxxVyWt1q3tc9WAa4r/1d6O8dgc?=
 =?us-ascii?Q?8fuNkq0wcBvxSPqCw7wK73OuvZQqOeVn8iTHpaBCHBkj6vWlUm0bHLfPzkzh?=
 =?us-ascii?Q?s5gHwQ9xYJ9asMzqsPrVR+ZZ2taaBTiT6FeA7srwYOPzRmS4H+Wwus3U2/BI?=
 =?us-ascii?Q?NuikDjJjzoKceHYzgebkVdDWdoP+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:43.8474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acfaedce-fd4b-4fe3-d033-08dce3e63454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883
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
index c927aa65d286..a9a95431c31f 100644
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
@@ -1179,6 +1185,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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

@@ -1191,7 +1203,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
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
2.46.2

