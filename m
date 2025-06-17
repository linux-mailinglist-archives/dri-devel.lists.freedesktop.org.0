Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0967CADC05C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5514D10E580;
	Tue, 17 Jun 2025 04:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0PCnPv8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0585A10E57D;
 Tue, 17 Jun 2025 04:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FX5cGxBtuN3w88TppUPri4eyv6NGl+4U7wDlSbabgepEmbRmxHyf2+16l47oIS7SI4fGKQgsiOZFYx+jv7bf5sc76s/LUNKxM2RZxCTHn64cxRY3j0GwSN/NG7S8yU2i57cIaVRjHDEHNLkfYoPYRNN0TVLyljSyFm3c+wTnkOq8kSvOKPe7YXnyQyIZyfbuDHkpqjDlXK7SSlaKbvZvnAwFMOUid1tu+eQTLfWbEd2jCnSwKUgYSnlFSoPoA7KdOhB1E0I+HR7AlX4OoVWzmpoJlKqkvW5MXfgLP9MHg5h/4rpjIemrogHFEBUkuy5T3bMzK+bs0xjkhjOWGiuNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg2Evnxw3X9L/IVeydY5W4cruup74/W+ZEfVHt3FFX0=;
 b=wPfxVPQ5ozAPUVR5Lk40LlVMAypopoZx6egswkFon5tmzAJYsMIwUq3Z+01eymKTmI7IcS9O5VEY/nsfWq9YYOqUblGjChTQJ+R8yb7uVEWyLV/yLqs2OS9Pp5lrrKwo7nsYyWHNC7+6poNpwmgkMF4GVRdoEaORVCVbP+++qess3pMWR3itD70OIilInndAIy/yfHo2m7L9fSdBVEpxEqBvByvGIIi/Q6OcnYBPqYsBwjs4fsuwW7Xv0h511vN37YNSB4zL6IphBhIx1nWSD4LsT7RxVdSxXdtcJAePLaL1fuis50rVfOOLqttoh1dCA+XCYzjmiOkk5qp3FVYCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg2Evnxw3X9L/IVeydY5W4cruup74/W+ZEfVHt3FFX0=;
 b=0PCnPv8h7tDUeKwRn7H20P2QrI1nPYtw6uGphglfX4to/oGMm/2uWs3HDb9kc8T1yp5l6JKLbfXsaEes/vyMwBP/CmQzfXrhgMRy1b+YWowKSX3y7nUrIxbJpq/J3XI7KFHG+UMZJq+U3wqMhxk4abNYFGGlD5k6sLbtvsms8q0=
Received: from CH0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:610:77::21)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:23:37 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::4c) by CH0PR04CA0046.outlook.office365.com
 (2603:10b6:610:77::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:23:37 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:23:09 -0500
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
Subject: [PATCH V10 21/46] drm/colorop: pass plane_color_pipeline client cap
 to atomic check
Date: Mon, 16 Jun 2025 22:17:03 -0600
Message-ID: <20250617041746.2884343-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: f73b1f84-cb34-472b-2ee3-08ddad56bb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/DKnfwywz544iH6EYmlP6XubHOapLH0zvfTs/XCuvpM9TWlO+KJB03LWq0Qw?=
 =?us-ascii?Q?7f45iCPrJ1QiYJhM08sA275miTN6MkIugXjf1vkTH2QrwPPzfLDhAwvsnzgN?=
 =?us-ascii?Q?olmxIkMQRUzSGDDFEp0lod8OLiPDF6iFaEzdF+o62k4WKW1jE8Vk8D7IC0TK?=
 =?us-ascii?Q?+/X/BPLE3aqiynUHWLrHI2VO7KjPHKrHIX8qY5g1uEUbH2BkxlkdXFndKCT1?=
 =?us-ascii?Q?2Lun6Sgpos25NN7yPRo+vY16BuoTNQmA4q+evPIeEUisQkcXjjXSY+/DLcg9?=
 =?us-ascii?Q?CKD+/ddjlUFozWkCWyvAs3D2f2W3Km4uvp4/bE1MiPct8UJap2C16J9pdlsM?=
 =?us-ascii?Q?O1C8VuwRvU4Ax9RfCb2VE/deRU/ytSLR002WCRWJnIs5ZOn2Essybd/43oYP?=
 =?us-ascii?Q?/nnaA3/4Onue4y+bbejFFGMBrxFQd76W0WKGkZDieZ/aMZRucRCGhlqdsGgm?=
 =?us-ascii?Q?kOfguDqNB1xuCuasDiNxeZwrhIAsONGPtlAQqAkmTiPrvs63gWT182oGGtX4?=
 =?us-ascii?Q?s3P/E2MjPBNu3SWBk93gEQm5cDuuznGIdUh79ireYPLcqZFKOJnaQ1SfdDiq?=
 =?us-ascii?Q?nLKS9ZTVBGaNUK6YOuALGz2StBXtN2OorbmxBrXSiHgHmlJQNGCJLWj4worV?=
 =?us-ascii?Q?lZhG7TcW8nTV2t1Dl7m5KTgvkhSS7fTkCPBQHR9Ag0c2r2PV4K39c8QJFcKL?=
 =?us-ascii?Q?NXMaC1Kz7t6C4lwxQsRnfFkNuXtmWBjJbtvt7fNZGHNzqbKbNz6JALnJo0el?=
 =?us-ascii?Q?V1O9EgSgOgSvAtrbhnNW7ytx2WFejuiIyFdMWVUO0UXxkaBrJ5lcvBWPp+yL?=
 =?us-ascii?Q?1QyaZQYNvXJEXkd9ZkpA6hHa4UgxMAnaRM2S80W6mrNq5qCSJtV1fWQPMdjZ?=
 =?us-ascii?Q?vfRYtH/CyvtlEXKRctedayecAEBfbWgWBou0LfWWg2as85ZwmcXeTnOQKB99?=
 =?us-ascii?Q?C7cuVcBnZmFq9WboZlakUBnS227KAchT3Yt9jc9XGK7XID+nBJw3ER191rrg?=
 =?us-ascii?Q?o6lEmAJEN7qkbaYIbHl5Yrj9KOYTuJFFBuIRZ4ugcg/L3Fh1I/CkbTROSemi?=
 =?us-ascii?Q?RRzRLJNPTVxA/ZlwPVsfBcPI6ENsZsYM/s77CZnflw9C7sD03OaFpOXfSowC?=
 =?us-ascii?Q?Ke0JGB1xbPy1vF+k6GXqOGAwZlsUNBOscSispaMymuHrrkZ5rbaQU+wYv62s?=
 =?us-ascii?Q?nYK3xITPSk5i3xJXFS18uxyabrW+Kg8c3z5P6S1WLXja1c4E6OiIpuJKV8x+?=
 =?us-ascii?Q?xEFy3LJyon4YFmMeUxyKjgCihvwfRWxRRlxPomjZUAgD1oi4rplehkD+MXQh?=
 =?us-ascii?Q?/DezoaIsfnEjKfuzlYxxjsGHgtW1Y7ngqvq0KXpKUWYXznKB1cI5xLH0EyRC?=
 =?us-ascii?Q?r3N1qGV/vT44t40eq2xBbmQ2ZiWxVvaJSZqU/aVAxSnimk6EUBBGNRYnAg9V?=
 =?us-ascii?Q?zcYNVKpkIbOOdTNZpvzmP576uV9KeQB99lSsKXdI5XxAAJ3fxe8nimps6sOj?=
 =?us-ascii?Q?3vKx0/YcN6ADRoHWEkU42V73LyIS5zBjGQZ8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:23:37.3706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73b1f84-cb34-472b-2ee3-08ddad56bb19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
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

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index be73cb9f502e..0de0fdd8af5b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1603,6 +1603,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 7904a38caa77..4a30ed8ab1a8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -464,6 +464,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.43.0

