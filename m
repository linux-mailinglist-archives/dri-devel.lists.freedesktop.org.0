Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B039ADC04C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4B610E4CB;
	Tue, 17 Jun 2025 04:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mfaYnUZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED47710E4CB;
 Tue, 17 Jun 2025 04:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m85/Mh9nA38B73OfFkTW7pQ5qXdMwolexOmbzYeQXd3X2psRy6WeGd7rXLktuzCdUFYnfRbyhelXoNpNxo0PVXtYHQEIgB8FA/jYD4EXADhG2ZPOPfWClffv8QRbYh4ep8Qm/2UnEq2ldvB2qHT12MEJOySZnHx2pPxMWJometMtzH44QX9+VkIoJp0rDU0wTh6OPHFGET0MD3FuBtZr04BsyagHDnW3VRK2QHKCWXDe7na146vH/AXLNkMtk6FeEut10dPa5OsPCNfOCHFO1bcoxiqV/2+aLDOersu56lqaScdaUHvMe9+a9VFdmnuc3xIAE36oNjXM/Ozk9Ek/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4qVng9ps8Dy+HfgTd82e2Wdrhxgb8HEmDQqnxLSFt4=;
 b=njffpP7c4u/GUh4TOq5uuJR1fr9vPQTZeCpyk/iThOXqgBwvOrJ9oWzoEcMOri5dMc9sBPj+RW/b3MZHNMn2rgwwWfnj/cda3THIAxA06W2d7Ov6fn867LKrJqG8LY6qGbEiG70qBp4Fb3IqFGCbTPwrxhBCD5/eoic6kDxZBhwBgtwkWAx6Uw0j6gVkNOwDtXNEI1kdrigdNk1KXldaXPZqgNdTzi/6WrrTd+yAk0qIJnVcElbOn41jdSy13s5RbSeU6dpU0t9MpyVLk9JQ3K0FThdJUAJ4J+PW7PMPUeb9y+K4p7zWgdLlzm+tUAKZxDC14f6UmQqwI1Z8XPw9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4qVng9ps8Dy+HfgTd82e2Wdrhxgb8HEmDQqnxLSFt4=;
 b=mfaYnUZpCmLLFTqXya6kHKe/4bke9ia3hRBO0/OBFf/mEF3K+T6u/uFCFlR/kS8AoCfgD75Cr+ppWmd1hopVpoFKP0Na82MPFeCz/6okhgNMX1IQ9afioMJW67JJt2smR+36B9S95xvG0yhfSg0dvxYS9YpvZRsWwU6M6qVSwm4=
Received: from CH0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::7)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 04:21:48 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::f) by CH0P221CA0029.outlook.office365.com
 (2603:10b6:610:11d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:21:47 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:21:13 -0500
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
Subject: [PATCH V10 13/46] drm/colorop: Add destroy functions for color
 pipeline
Date: Mon, 16 Jun 2025 22:16:55 -0600
Message-ID: <20250617041746.2884343-14-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 84527bd5-63df-4e28-11a8-08ddad5679e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5FOlgeFq7oowIgXeSllNI72Q5sG9aLqcxKFPishuImWvhLvdjfxLyVYFd+O2?=
 =?us-ascii?Q?XTklo1yaDMCF0nba8z2ZQbAhcqHdIPcONkW+oNwxNaK6rMU7hVKG+muFXLAv?=
 =?us-ascii?Q?Rx56Mp+dxVYOw+vj8nBWX+tUHeMJ3n4hXs5j3g4+P7YIk35QctqlfWosh0d2?=
 =?us-ascii?Q?6QQTFHR8k5KI8RM3pV9m7YwJV0XVKdR7aBCJBSEPcKvci0VGfqNn0/qMp4ID?=
 =?us-ascii?Q?0cbFejz9KyXKkt/Glz/xHXMwdFzFcxB3B9I/snSm+CVnnOIGvwqBy4CRmS+V?=
 =?us-ascii?Q?YC2M4QiPT83aBsCg3Oj+QgZyoeICr9qsuciplrlFvHjrpEEozCxB58581qbW?=
 =?us-ascii?Q?/h1Jh/+TUs3j983Q+LeAG4OxoRiEFz2Y9yF4QgRCWVi+w2rWBfFMwym9MQS7?=
 =?us-ascii?Q?jLo/kOFDvQnaiVoZWh2tD180vwjH9si8iTG+h2QNM+sfPyJ50GQTmlIxqb2F?=
 =?us-ascii?Q?s3pFIRutOdYvVuEeDgOOn4h0ozdmHLc5h76uEW5B1aMGOFzHjPksqWvloThW?=
 =?us-ascii?Q?KvsKiS7oSFlEtdnwg4TFPstkdylFPbIzMFfba3aPGYnNsF7k2Ar/46kvOsXD?=
 =?us-ascii?Q?TPgVpZEOKnT04tXuokiMIt+iBVC+7ZVcK+tMnl3pouCv5OtgWkJa8XFxjX41?=
 =?us-ascii?Q?OvkvSAlyCIIU0lk48ZCGsdXg4aM7WJktIluS6hC2xeCTF2NC2SNrTyc6aE4i?=
 =?us-ascii?Q?yhbmJhAQ7fc0oqMb95E329z9qSVZeK99vzt6JtLN1ML1m37w2ys5egxnwAWq?=
 =?us-ascii?Q?cWKQo8HaLbOfWqWcobPla8c/LQpErU9zLZMaVEO8PyGbC2iEp7PDEKScGErg?=
 =?us-ascii?Q?W8gfp6lKMZNCkC/h+amG89FWeWi8ETvPPjQnO91KKthy0qYSCxA3vW7rkbXY?=
 =?us-ascii?Q?IiesfmrLjy6BAvVsqRkjC84be79dFRpxnPL+nseAap+I5Y3uV/csuG4ah7dB?=
 =?us-ascii?Q?mkOwu7yXq5wyssO04L9nC5Kq2t204CuAChdYfZx/u3W5/0vm1CnpC545bdLh?=
 =?us-ascii?Q?NgsUCwxgEjYfSMCE1Ixr5Ob5qfTjiN9tDktWh1ZFYktgIEozzKzgdcL+bDhW?=
 =?us-ascii?Q?L2SBDWW/UeJmwhHV8LkEDBDwduldQHdCru5G1MDEOivLJC8/ZH2HRnAQ76AJ?=
 =?us-ascii?Q?rFFJCkqRMm1wM2K8eBr6lIDQkMyIYdoC0d8ORmdXwUoYPehRAlDveXAw7dBn?=
 =?us-ascii?Q?XmEJvRCeiGgAUazdINGu5/RdmaZVn80DVmlsDUyIm2bUvd3Zzu55mLWgZPRi?=
 =?us-ascii?Q?wnqTJBYkzi6IdwXjyzyrjkxLMAHwHbejTW1dyS2OP+yY1yUHCl1tVBryvj/k?=
 =?us-ascii?Q?GTLcXxu80TOPquFj95SR7MwhyqYi9IXugusNYUlJz3Dlw+lVlDxYOIrKdw0v?=
 =?us-ascii?Q?zr8ivx7FjtKgmMQy2xdRFkeSyyPWBSphGP8C7UW0XRurWB6Fs5a4HTNpcZEp?=
 =?us-ascii?Q?tMUPOnQleEWA7xCdxX0RKjg942Z8vDnr4QHE4w6++8KvkmsCASPcdg37ZZxg?=
 =?us-ascii?Q?VNZPym8JAZ9wavpkJM3qymjsNIpMRORQr6x2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:21:47.9707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84527bd5-63df-4e28-11a8-08ddad5679e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

The functions are to clean up color pipeline when a device driver
fails to create its color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v9:
 - Move from from latest commit to here, and drm_colorop_pipeline_destroy
   is called in respective commits.

 drivers/gpu/drm/drm_colorop.c | 36 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7b3ecf7ddd11..57a8c1063fdd 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -135,6 +135,42 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	return ret;
 }
 
+/**
+ * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
+ *
+ * @colorop: The drm_colorop object to be cleaned
+ */
+static void drm_colorop_cleanup(struct drm_colorop *colorop)
+{
+	struct drm_device *dev = colorop->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	list_del(&colorop->head);
+	config->num_colorop--;
+
+	kfree(colorop->state);
+}
+
+/**
+ * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
+ *
+ * @plane: - The drm_plane structure containing the color_pipeline
+ *
+ * Provides a default color pipeline destroy handler for a planes.
+ */
+void drm_colorop_pipeline_destroy(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop, *next;
+
+	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
+		drm_colorop_cleanup(colorop);
+		kfree(colorop);
+	}
+}
+EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
+
 /**
  * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 791ab940c158..8e4d79ba1eff 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -239,6 +239,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_plane *plane);
+
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 
-- 
2.43.0

