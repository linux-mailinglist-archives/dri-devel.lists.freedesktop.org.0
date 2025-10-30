Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3AC1E3D7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE62410E88F;
	Thu, 30 Oct 2025 03:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KasDdfYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12710E8A7;
 Thu, 30 Oct 2025 03:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7q6Dx7aiQpEMlsQnpuSLMQ8Kc2ozXffqZ+Ee7vAqCoVzak4SdAcIJCUt7qCtARfymkGfP8xuC2d8cnUz0xbuC3HGYGY3JUiIMB9eldLprM9uBNTbuyo9sT8CtAJELlLgbYayaKpU24QG/GjAwjNQvbUUMU9/7zMEz3zgB0u+up7V9DJLoaX4vc+aodn2S9f+6FinJS2iv6oQisqJU0X0sE/n5BlmoxR4SaiQ3aqNl3eahya678q4vhgP+Ir+AlIM/FPytKE+3KrI+8W3I7BPvARyQCrf8UPxi4ulllXFsbSb5xYwnDGFQSfAb2oJfJLkVqVK5p3IjK86cjjkKR6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ydnj1cD88FOW8CUiW6ysoBv3O+VekNXZk++vXNr5V8=;
 b=OAtxqCAAxy7Dl1vz6VXWoMJZMhe1rseSGgZS6/2I1UrshutPkLb9OhCWriw9wLYeJUSdZnUvzManRoBbUYxCwK4gx7WrVjxxlugIhWnAhrfglpkWV4JDRAkurNkghYtDZNEfmsn6X9XPxe46w7MWYoGMPBlMXjrzYMGoJuQqnhqNUgPo6mLRdDCqCKX1xXNlkP0FK+f0ea2zRGOXAJSVWMnja/oIVJ+Lo9IXFsdWBneM2VEydhV2P3Dp2dJa/0t29N1Yvde97En8ehb2JgzuFlnBo2SB3+UyjRURpWi/6vGDUDbIT8g33QXYzx03bTMygPXYw9Yi+avewpPfIEcPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ydnj1cD88FOW8CUiW6ysoBv3O+VekNXZk++vXNr5V8=;
 b=KasDdfYTeL/huqIG42ONEcWSafUlf9U+wNyvTTS9pKLim9zHo+gpMlAD8MqgaaZFlIhDXvRgjnToKWx/cz7Y1746fGqi8L96a7DpsKTWF4NaS605zPSG0d5YUlbp0Qv+FvK5KMrzcEQGjoJ1zz4A2nhpZ4F9wu+bhOsuQTxkqGQ=
Received: from BN0PR10CA0005.namprd10.prod.outlook.com (2603:10b6:408:143::19)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:45:42 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::e9) by BN0PR10CA0005.outlook.office365.com
 (2603:10b6:408:143::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:45:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:45:37 -0700
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
Subject: [PATCH V12 05/49] drm/colorop: Add TYPE property
Date: Wed, 29 Oct 2025 21:42:10 -0600
Message-ID: <20251030034349.2309829-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: b17f1bbc-250b-45c1-13c9-08de1766cc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8HiS2f6OlNgzcjBlZ2bj1fB9gWVC6ht1iFRf+hLktH/UMMkjPCHAs4R5Tswi?=
 =?us-ascii?Q?H0l8vzQZ5M4PKtYx6EmdbUKqTNBMphPLHTGANlRdvO/1K0QiE6V+4ESM6Dd8?=
 =?us-ascii?Q?Q9Kff+ApLCpIPK8nMa4QTzuorJJZ2V28cDjyhKsc/gC3VpLvQhNYLoB4MGPt?=
 =?us-ascii?Q?H072CD4gh/bMsVqDWG0/b8GtGVfEs4JDAI892FqKCgwJE5CeZ7PMlkr8QACB?=
 =?us-ascii?Q?+us3fYLva7nx0/rZ/hB/tfY5AnN3FRPKnFxEeaoQneG/v1hcOB/8KI1bdCKD?=
 =?us-ascii?Q?/TA9br8qFRYHW7d4bg/teTO/flyJSfuTG3k32L/dq0X+jw6TgvCNXxa+syQ1?=
 =?us-ascii?Q?BrdmRQX5yOALBzVxnMDp20fiCvVkqMkx6LhF2OwUHRV9hoKxtMm1H3QlIRRE?=
 =?us-ascii?Q?k+K0pZz1WsqkkYEFu12KU1xfNYNjJ6BiIz+lGRd7bzUy8qQhvub7eBPfhqdQ?=
 =?us-ascii?Q?5LmQKDro1jARAq82dpowt3QR6VMBa5VLM1M3STNYjrPFy8rMYiYQyOSBl29r?=
 =?us-ascii?Q?reUwb2xIpp7qJBs/3Tfm84Q62ARaBiL+wD8xHrEINzn5rGIq9PJHK+2hxaHP?=
 =?us-ascii?Q?DdJ/7DKkRBS7lV0JwJJbfrzkro/PeKJdTBjiQv64iDwolrD9kEO52waDPdPr?=
 =?us-ascii?Q?S6XLArFhreWAdKPT5FAEpSVIg3colDuamXuLIwHN/tSRqg32MdnFb6rJ9i3a?=
 =?us-ascii?Q?iuydsmpDmwrcfo7XDhQSkyIMyOcZ83S9Befp/OYZccWiiHUnsOunBRIHxTMF?=
 =?us-ascii?Q?9KvsABkGcVqtuwQ/KP/3E4sEAnN1FR+pe7EpEsC0RGnKMU2voO+yb2NvoDJa?=
 =?us-ascii?Q?YHVrO7yUDi+zyLL91kLfuweq7a3CmRwhABWjopRGEI8Om7+p2iug4zAjpabp?=
 =?us-ascii?Q?HxqBbd5PATp62lENS2d6UhmAZHP/sB0ilR39VgkUyCGBTdjRODISYmAKTf70?=
 =?us-ascii?Q?03l0+FSLWV9wlEYnlEP71Q9PUpz8Wf6JslTQDrpyPSx00/AoNCXrgEp2Rsr0?=
 =?us-ascii?Q?5Yi55OCoUqPIRH03ql7+qh5H3rbdbWYPRSDJuXXl6BM5v7vUjpwOtCtU6F9c?=
 =?us-ascii?Q?0v1KwsIqbv2GKOzenpgbyCRyPhxSK0nW7ZEZ20n2npX7LCqjkdLFJFiuWtoL?=
 =?us-ascii?Q?9BlPsUruJchiHpmmIsbdt5bS6c2WqMn7WfXUemXJwgrn8xlnVu9+dvkgpf/V?=
 =?us-ascii?Q?riAEkWAAs5Kx3gVUZo4CmV6SmwlAvxONY8pS3aA/W1mJZGjKe7SrccV3kiOR?=
 =?us-ascii?Q?wNabxA9jK3nQoXqgigFN75ZtHqI7B5ep5hi4W9WN/Lnm2DTOlirUXgq9TA0d?=
 =?us-ascii?Q?t8LUeox6WzLsy3fasKaZJ/68gXucizVf4i3GLRTrYDZJPA0AS/m+s92FOfe0?=
 =?us-ascii?Q?D8UPnhQiF68Vfgi6M5yM4we13+M4uFXub0mZKFpRQm2it5otHLo4z7w5sGNM?=
 =?us-ascii?Q?VAznkDdRpX/sUqKAoHnSvkN0dB5qrRQzdoBv43MRDOCOUoxjCvGEKVcN7KRl?=
 =?us-ascii?Q?LNPg4gc/6MuZBZLQG1UiVs0URZh7uzsj9aNGKwcp30j6Zka2wUIW7HYqGu3b?=
 =?us-ascii?Q?Ybol9r0utXQspC3rdTQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:45:41.7674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b17f1bbc-250b-45c1-13c9-08de1766cc7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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

Add a read-only TYPE property. The TYPE specifies the colorop
type, such as enumerated curve, 1D LUT, CTM, 3D LUT, PWL LUT,
etc.

For now we're only introducing an enumerated 1D LUT type to
illustrate the concept.

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v6:
 - fix doc typo (Alex Hung)

v5:
 - Add drm_get_colorop_type_name in header
 - Add kernel docs

v4:
 - Use enum property for TYPE (Pekka)

v3:
 - Make TYPE a range property
 - Move enum drm_colorop_type to uapi header
 - Fix drm_get_colorop_type_name description

 drivers/gpu/drm/drm_atomic.c      |  4 ++--
 drivers/gpu/drm/drm_atomic_uapi.c |  8 +++++++-
 drivers/gpu/drm/drm_colorop.c     | 12 ++++++++++++
 include/drm/drm_colorop.h         | 23 +++++++++++++++++++++++
 include/uapi/drm/drm_mode.h       | 19 +++++++++++++++++++
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 23822f2e60c7..8c6a53ff04c8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -631,8 +631,8 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	state->colorops[index].new_state = colorop_state;
 	colorop_state->state = state;
 
-	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
-		       colorop->base.id, colorop_state, state);
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d:%d] %p state to %p\n",
+		       colorop->base.id, colorop->type, colorop_state, state);
 
 	return colorop_state;
 }
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 4c92598a7097..ee233dab3cb2 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -662,7 +662,13 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		const struct drm_colorop_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	return -EINVAL;
+	if (property == colorop->type_property) {
+		*val = colorop->type;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int drm_atomic_set_writeback_fb_for_connector(
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index d215e22c9d20..1459a28c7e7b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -102,3 +102,15 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 	if (colorop->state)
 		__drm_colorop_reset(colorop, colorop->state);
 }
+
+static const char * const colorop_type_name[] = {
+	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+};
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_type_name)))
+		return "unknown";
+
+	return colorop_type_name[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 008665d2d960..9c9698545f63 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -112,6 +112,21 @@ struct drm_colorop {
 	/** @properties: property tracking for this colorop */
 	struct drm_object_properties properties;
 
+	/**
+	 * @type:
+	 *
+	 * Read-only
+	 * Type of color operation
+	 */
+	enum drm_colorop_type type;
+
+	/**
+	 * @type_property:
+	 *
+	 * Read-only "TYPE" property for specifying the type of
+	 * this color operation. The type is enum drm_colorop_type.
+	 */
+	struct drm_property *type_property;
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -167,5 +182,13 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+/**
+ * drm_get_colorop_type_name - return a string for colorop type
+ * @type: colorop type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 
 #endif /* __DRM_COLOROP_H__ */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index ec27125c2928..c419f93eb94d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -858,6 +858,25 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
+enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * enum string "1D Curve"
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via the CURVE_1D_TYPE colorop property.
+	 */
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

