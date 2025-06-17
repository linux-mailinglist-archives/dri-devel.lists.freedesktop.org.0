Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D371ADC044
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55410E4E1;
	Tue, 17 Jun 2025 04:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GF23dQkN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8826C10E4CB;
 Tue, 17 Jun 2025 04:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZF7bwQgyu9RharEOrfk2+B1oPTi79xsk1pW25H4xbU6PPXIfWQMQFZDtExkwWg6mAfLYJtOkBC9tiAgxoDlfEN5yEzBr3IonQoHGFkMgtTfsPR9XKjOSTixvzUSjkKjtOEXyjaZNDXja/cQGXoG2YW+UwTzhaLTYpf0sOOlpEeqC5pNM70P//I4E/fYF+afRY2mjGRabkd8kaqe9iO2CDpiDggNmhXz2hPMrPl9ua6abLfeKu2pFfppLgyT3x9JkgS1oCoeLuJm1DfstVtNxa5K4XkZaE7sSQucLPpzOEcLzX6f0g2O9yZQ5c5SIr1+YoLj+Aakr6ypvCrFE2R3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX7xmj45fpJ01V5SMc8JIO/qF6dMyTswRUsuZIOZnLg=;
 b=Djrh0muEVVc4Gk+w4v5udZebClgaRzjV4GtO9bqH8M/Jq4nwrb2YUYPyJnmlLZBv9xkPSf6aisP60EEFtxwMKsbbAz5EGp4CHDpi6GuBnL6cLwGKHJL0n8d9xJbiD3m6NSaQG1kITqBj0KDAMo3POKF/sNzPezK1wwaoDtwzxUeZZ1HmwyUzeavyEYZ1YDXJVOpxy6LeCJrqyy7EZ3/8BBIDqy3ow/tJUPxrORyRRZ+X19J2ciBM/KSnJSHlXikN8KUBtuyE5yNCa0BU9Mj2Ptz0DsBz1AuLMenGOVqbi30+EhpI0+mwDHd/C12Zy9d/Y1a1U3MFZf/r6bMVrnhbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX7xmj45fpJ01V5SMc8JIO/qF6dMyTswRUsuZIOZnLg=;
 b=GF23dQkNtGG/aVA0UVt8meWVOxGQRKQ0HyGZALjmo3vWtDQX79M5fyMvyBFNefM3P3faysAaievZIiGqM+aWvx9GxHMZ66/uM9N3TshM9fn16X4whWosrvJv73MS36fLYz5CnHucwHk+Fx6JEuaB6l2iGiXp4/rHmpAUeRfcung=
Received: from SA9PR13CA0146.namprd13.prod.outlook.com (2603:10b6:806:27::31)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 04:21:08 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::d1) by SA9PR13CA0146.outlook.office365.com
 (2603:10b6:806:27::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:21:07 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:20:44 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 11/46] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Mon, 16 Jun 2025 22:16:53 -0600
Message-ID: <20250617041746.2884343-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 2845bfd3-8a40-4178-8766-08ddad566210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gD9cSXnsvcFz+NpLLyNHCV8tBvj+jAbZBJCseelrsyTczXRKwbU8L0CfmFmO?=
 =?us-ascii?Q?6l1N6DlCq0pE/OwU9giwBNxg8YGfa25aGidR9ZHoqoXUuxImJVn6rU+XGIH2?=
 =?us-ascii?Q?avQbc9q1vL0fXVhkgKXOSwrMp8VQR78W2rFss+aTZ+NIWC2dxL9iN6HJnbwV?=
 =?us-ascii?Q?hWfiK3b7TZk9fCjFt+z0PhExUi19ly1yapkuWFdSuEg5bzNwUiUJ52Pk5QLa?=
 =?us-ascii?Q?G7zfBFrViKx4V7GGwt9rX696viEaEWaoq9SuuFClN+S8/l3lYoGJzbXm3/zP?=
 =?us-ascii?Q?9lNMD0QtzIwZQgcrQOAIgu60VTNowlGGFLeIA1jns6iljitO628BMVq3JGrw?=
 =?us-ascii?Q?bbN8gT3AvrBJBzYmZHTBpCQyGuDJGHz6siH2CHuWk/Dr/XeEztsm5HLdJz7S?=
 =?us-ascii?Q?R6JSh7VJJSKap87CVcQVUxnKKWuTjaD66dFa1lZvgW83xvuCLcq28/m7N9zr?=
 =?us-ascii?Q?ryKNZHVV+WO0uWb9Gfgr5nTgox7wqT/MLfXirCxZm1u+ZXNuO0Lot72RRqXm?=
 =?us-ascii?Q?CRljLE6zkOMRAU88ch7XZ/RuYhknlxhte/fDc/vI1pXVF7gwPj1D+GND9huP?=
 =?us-ascii?Q?Txk+auWTZzR7s7+cmX9L4ZXeO19NqmQsNcLmQ2fRNSJ3fC9es3pBJiSmQhYE?=
 =?us-ascii?Q?zOEH0Nz3v8ExePXgAWO2oU9OiGOFnweimpkqKIrRfRkBvUvGaIjaMLXShGbC?=
 =?us-ascii?Q?PD0U4fC1bbSKWtmXieJ4mNp5E9jGacYWPQWWHYHQYomZIwvtlIFQYiNrv5u2?=
 =?us-ascii?Q?u8yMEOgNhaPhwUqwdm4ho8PciZQlKaNaiTnxi7rBNDcugfQsa1lHLA/uYR+z?=
 =?us-ascii?Q?BBPvSvbloETLV9dVYJu7M5QtNMqrtGGYo1BV1PgTy4eQqXFQRIW137Yvzg07?=
 =?us-ascii?Q?3rxeV/pjNgRnagYSIZLM3ugoOD0aB2rI9oVe8dve2Zq0Li7d55Ch5NHvVW7x?=
 =?us-ascii?Q?dXeqxlODtRnBQgoUZVlrxrliTFoAzAx7au2I4jzkz/uJLqC4vIc/REctte+M?=
 =?us-ascii?Q?Dj36qHHrO1zMsa0NNo18ji6fTo5da0pf+ajEJraJdy8FRKoFWYYMfXl4hTly?=
 =?us-ascii?Q?9CP4jHgJQAthqjP/bPX8eN6qK49y6q/G9A5yxRgpdrcuRkv/lwnMwBCeJ7/I?=
 =?us-ascii?Q?89qHQCHAYdCAu3T01KfrV/jIOiN85a4uTIP/YRK4IbbJ5Ufp+GSTJsQd0SvP?=
 =?us-ascii?Q?97yEigW74+rnE4UZ005UaTOF1c0XBBpiOGmCq84fYezwu4DUjm25XHDE7EJa?=
 =?us-ascii?Q?VaRwPu6TtoU9/BjqPqKYGP/tnR4xT0cLUBgN221q0aZHfWA/ARYdreZBSTYI?=
 =?us-ascii?Q?3E/fsj00CZnTyrliOJdLPUOZM1HMca1h35QC644BjGVAeN59M0zYlEfokS46?=
 =?us-ascii?Q?WOXFvuR6Hn4tFy2CY9VLPxK73+kbfjaqhgrzlebE1m0phBwumC2PNw0+2PKq?=
 =?us-ascii?Q?A1Ug7uHc/BjiP/8Pi/SIgvNXuRHMsn0a4JfyZISVbl6COhF3MFC/b2mzM842?=
 =?us-ascii?Q?2RFNPoaEnzIqjfv6ZBFjCgAzMBSNH1qtoA/O?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:21:07.9870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2845bfd3-8a40-4178-8766-08ddad566210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458
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
index 5c3b2aa3e69d..5d57a17502ab 100644
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

