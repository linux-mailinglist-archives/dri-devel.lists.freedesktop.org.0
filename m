Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E5C5FAB0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4AF10EBC4;
	Sat, 15 Nov 2025 00:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2MPtLPnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD3E10EBA7;
 Sat, 15 Nov 2025 00:07:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sP2fOhx9tfRD+sAAP54DZou9o8WRka0NFCc6CTH9CrJKBpFJLBIVCJeunPu1dmDZqm9zp6FjgaIwdu8GbWXPHvFRBsCu0OxqweKkKYHbvLwtZzaUQMpn19+GOqAbXcb3KaPbcOIn4AKtnxgDYRtgiVbIdAYOt54KDE5cvEuCNLzMcYJkek73NAH6zARwyjuG8yfhG4lwi8OimMuU9p8D1zYx1YCXdY7kfs0oG2Nm3IOS4bycECM0ODYy+UWA1gE0hDoU0ySlLIxyP/QOcCQFy0+K+k3KEBkOq3kiSV5JIP2/jmIL+j12QnHIF1uEl+OTbmKt2MajGey1vBafs6NRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7WBzsyQd8FA1A3hsKd4CMQgDaw1upcLuihQKfb4OKc=;
 b=aYhnhsseo3iKuyjKCQZ9xqyX0PAFbjMQB+YmNMp4PQA9Uf1noIbl4QGuolEt3Bqbnr3/LWthUuwG87zVUh7y1abOW8VEG6MCzDMTJCoBPJKHm9wky1UF0iXcih2f4/+Ta3B8z4K4g8QHvJkSdEiUGpRoAUbvbuXWvoNJ3Q3UfJgr4SIvrIKMU/06+5BGoi57otv99ma7j9CpdyKmLz7lt+g6cOk7MfrHeFF0obxqk+HFkRfWTkV+ltGJZD66HYat1spie7WyAyB63s92VjYab/MJTniklVWKTE5J4n+uh3EfgiTDrNAcYEc/Tmtc3fxcPqFt0uyxEt8z5Kg1HzD1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7WBzsyQd8FA1A3hsKd4CMQgDaw1upcLuihQKfb4OKc=;
 b=2MPtLPnQhz5dZLLLDLQxX5CfQmtPFPaOYaKiV9y7AqpPJO/vuxCsxnz8lnLE0dADEuuIs0Sx2MXlxd4LjF+SUM7RehBrlTJK4ILWc3tzYa+QhZQK0Yzh8iWHj0mf3xJvSre77FFnPZSHutCdXJGE03PV7Eiq1FtlYJbFGFAuO60=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:07:08 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e8) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:06:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:07:08 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:07:04 -0800
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V13 14/51] drm/vkms: Pass plane_cfg to plane initialization
Date: Fri, 14 Nov 2025 17:01:39 -0700
Message-ID: <20251115000237.3561250-15-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 3055fda3-b87c-4ddd-aa9a-08de23daeaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N/yzf5zydr3Y9mW7ypTvuN3ah/uUSBL90OxyDQSvX6ltlGuxBvGxJOnMF+R1?=
 =?us-ascii?Q?BEdzdfdMhT8R6uGvhiEMNSU/DnubzFxGHI0XEBox0S2VEZ1XXf8ILxmE8XZ6?=
 =?us-ascii?Q?kYIqblWGX0oUbn3PKpr7cIUremyvHKKlGc0P9xDTc6x/oG7QeJdbY8eKiziA?=
 =?us-ascii?Q?X1zxUNwnNWjrtqjemtGg1uYEw7Ak7AbTi4vvAdnYC0qhuO+1VXc+VKCOpnZL?=
 =?us-ascii?Q?08RvO6sK0QOCSm7a6ZHW92/pfbpriSg0vPQI1jJ/39nIUEs/LrRJlXozDQ12?=
 =?us-ascii?Q?zabtFbCrbSgxY6TTyGMyqhwCjpBHUQ+s90GttAodErNbQg+pfo/oNon+D8Ki?=
 =?us-ascii?Q?JJAmN4h/Gt2GAQR4EiwMWoA6L9ZKpqYxgbIYLsqDObonNxWjKXaeQa/6NpiU?=
 =?us-ascii?Q?ByiZktsKNINAAVKY7+XlVLJPh2GCGnUETL1tPFItl+qDGKj/4eZ/nhO9/56q?=
 =?us-ascii?Q?KyQPTLbYjIE72z8RJI3hjF9CY4pe4AozPe59VanRYK2Ajh/IsLzVD1bRwFpn?=
 =?us-ascii?Q?s6AO4cC9u3rm/w/a7SmhwbaUqL68YlWgphkdIyNDG2NdDvQtJlCYfr4RqjxG?=
 =?us-ascii?Q?AvoHwJ0Z4Llrk9YNn/YhhZ7khIQBDCusXo+aHyvL1FJJLhf6++70TVTE0Fm7?=
 =?us-ascii?Q?wZDrMBroQc1yev8GKdRwbLmWGCyKUfo/Mk0+oYuE+xGwWBS4XOo0po2aYcLI?=
 =?us-ascii?Q?7cAr9Xc5C3ZxXE5cJBKSH0RziP9kXy7OVvx+nultGZSYqjPGsVlfOYLg45b8?=
 =?us-ascii?Q?m8JUgoWV5a6a52AnC126jXx1d8LkFFAjmDjwnXm6nULZhewd4WpOFT1C5lUq?=
 =?us-ascii?Q?xiUT0WONlRen+etvxmcPn+DRj4L17iqQo8fA7/yv3FI8S0Y27Q/ax4QLkVNE?=
 =?us-ascii?Q?b5bQfp5mNiqNucQdN8VtYMyCqZTAxqXHYvPo4GV9/VUlYFC7LO8uKVaPD/Lr?=
 =?us-ascii?Q?uRlDhEDvoauMnoEVL5sr3D5tOJzZaoYDRBE06CsD3U850R7j4Xhh1BJqWa/I?=
 =?us-ascii?Q?gnrD7I6+cA5GGMpUduLYore7OKb/iGnNX1NJbRwH5YqYI1UuR4VIklhWPlRQ?=
 =?us-ascii?Q?2wSK+xF95mITVUGMMgBu6wmQCJVbMMX481AsEl2fUOr/dM92mxsK7ybizN9g?=
 =?us-ascii?Q?AjDIjakDxY4rArWk0hI+7WE9ZwC6z7RUrHP7VHr7/I9iB2ldQKTB3TqkZfxV?=
 =?us-ascii?Q?Zzr1HY7MAtzAzLXtlRF1mUgWMtsEBNGWK8AYLoAyElS2LQBSDydHyCoaI4rJ?=
 =?us-ascii?Q?L2HCzDfK5ssYCDwljVg/+tas/fsI7lIoPH9zuWhGq3NBJczCS/p1KY+qZCsv?=
 =?us-ascii?Q?VwkLDh75kGRbt+04/wvzz/luTLcaAGKMJedM0wDnz10tc3WXhZ8OO1JRwGWW?=
 =?us-ascii?Q?R764hTfHwEp6YSaK7FfqIKl+2ta0+zbTgBbUlDowOExRVI/N6H8VHEBR2MuC?=
 =?us-ascii?Q?/9/ltWImlVL7M2U1siTqqaJQSFSovovHbg873j5Neg2uQ1gO7hUSCPpAYrgH?=
 =?us-ascii?Q?SzpLm0NTFz5L8BMDyw0XfWhQxUk+mbyV/RlHf9w9J6glzN9zRhzk5eYiWFps?=
 =?us-ascii?Q?qu24CBBCE9PF33ZbtmM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:07:08.2943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3055fda3-b87c-4ddd-aa9a-08de23daeaea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

As plane can have many parameters, directly pass the plane
configuration to the init function.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v13
 - a new patch in v13

 drivers/gpu/drm/vkms/vkms_drv.h    | 5 +++--
 drivers/gpu/drm/vkms/vkms_output.c | 6 +-----
 drivers/gpu/drm/vkms/vkms_plane.c  | 6 ++++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index db260df1d4f6..880a295ebd1f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -225,6 +225,7 @@ struct vkms_output {
 };
 
 struct vkms_config;
+struct vkms_config_plane;
 
 /**
  * struct vkms_device - Description of a VKMS device
@@ -298,10 +299,10 @@ int vkms_output_init(struct vkms_device *vkmsdev);
  * vkms_plane_init() - Initialize a plane
  *
  * @vkmsdev: VKMS device containing the plane
- * @type: type of plane to initialize
+ * @plane_cfg: plane configuration
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type);
+				   struct vkms_config_plane *plane_cfg);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 81d17b7dc0eb..86ce07a617f5 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -20,11 +20,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return -EINVAL;
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
-		enum drm_plane_type type;
-
-		type = vkms_config_plane_get_type(plane_cfg);
-
-		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
+		plane_cfg->plane = vkms_plane_init(vkmsdev, plane_cfg);
 		if (IS_ERR(plane_cfg->plane)) {
 			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 			return PTR_ERR(plane_cfg->plane);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 89a9fc91e059..58815588588f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include "vkms_config.h"
 #include <linux/iosys-map.h>
 
 #include <drm/drm_atomic.h>
@@ -218,7 +219,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type)
+				   struct vkms_config_plane *plane_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
@@ -226,7 +227,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, type, NULL);
+					   NULL, vkms_config_plane_get_type(plane_cfg),
+					   NULL);
 	if (IS_ERR(plane))
 		return plane;
 
-- 
2.43.0

