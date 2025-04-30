Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F324FAA403B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8CD10E60A;
	Wed, 30 Apr 2025 01:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Lan3Oxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9B10E609;
 Wed, 30 Apr 2025 01:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjeTpXG1vWVAeSz1Ou7n7z3QAOu9V7QKB4DcmvzXBVvwAf/4q6rNUAjP+7fKkbOazSZjcaht0G51H8sXkmzwVuFXRskgA3sQ06m9Gx0jqzJFLTGI4yWYPTuulIPTzg/d5eVL/repSwZED4T2onGTZe7r42d5eq7NAAi6JrmGT04ImROJGR8Fa+BCVYo+cCskpKRo1DRIUSD5uYF6Sy9dUqoBUbbN+J90wsaanZsFr2MhR6Uu4jJIRkgvwxOB1T1q7+1GQSIxJQ6S5R1gzOqCZ8rABMAPlotlEt0jmdWnLtcRF0oGGBYz8DfJbv5ARn4ob0ItURnyIW8pcEf5YJ97Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjpoWWwxcYml9rBVY8Ka/8EVMzY1kCpmRSfQIPDJrC0=;
 b=c6K6QaGUE3kG5EjqV9YZcSOoQfihc/1YGoEAi24vH9mRDbQKe+UMB/uShPhfFO/pEhdrIl8w8swifl+91pOjWQPUx3o1mQkYfNTG1/o8+tXLL4CnVtT4+pBB2EZasJhuIurujotoK8OviV3Ufv8yVQyvoisZ7g70RcrsqYhuj4tYzA23KECAbSFawsvlEpXOTETicY6OKdrNgTvFdHq3kXygIrLFRqWjHqKpE26gaheSxDgGBb89ZX3icopF5JJGPrSkPGMjevFCLEbfSekfzPGjEa9QwOofvZC0zWcDfedRy7wHnGe+iepxl4tpY3d0ePnPcNZfu/7YCNz7O3kvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjpoWWwxcYml9rBVY8Ka/8EVMzY1kCpmRSfQIPDJrC0=;
 b=5Lan3OxipnljB7J9eTWpWMJQTd9qsoFmUgsAA3eRd7x2caOv7q6tP9ksff/t8OUgj4RLlm4zwKpWSBn+YJYt6arigUZUcOxYNKOCHvIqw3pvkvn7UX3IGmNcH/ixTXKijvfQcrnRqEh1GOUf+YQVwFes92JJENp/r6qNpd6NKlQ=
Received: from SJ0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:a03:39c::23)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Wed, 30 Apr
 2025 01:15:08 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::75) by SJ0PR03CA0348.outlook.office365.com
 (2603:10b6:a03:39c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:15:07 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:15:03 -0500
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
Subject: [PATCH V9 13/43] drm/colorop: Add destroy functions for color pipeline
Date: Tue, 29 Apr 2025 19:10:43 -0600
Message-ID: <20250430011115.223996-14-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: b699d01e-bec6-467d-bcf4-08dd87847225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E0DHCAe1ip5awbvWrjNCaViXXFpY7s1xKMB3XLjuSaDuIswow0u1UNiXt2f+?=
 =?us-ascii?Q?FjFlOtSvqbK+DT0MgxFW2us5tL0jfMkflEIkzrgAqkYmxrlhCL5aWk/S89Xk?=
 =?us-ascii?Q?yCccYjb+IrJQNZq+Ht64TisG/VWud9zyz4L5VaaYG1NY74QtEGp386aharwc?=
 =?us-ascii?Q?XaO6JHwrhh2mXFPcUpSOxioAmvM9gIDDR2vNQW+dplCAzkW6FtndryH6/zTR?=
 =?us-ascii?Q?aBeytjfQs86jJaJ4HnMmnSOgTyfhGPH/KCZy2ZxNLUx6zY+mB50scGdSqFiO?=
 =?us-ascii?Q?g7RIxP/sFf3ymqiOdstNQkYMm8a9MvAMnEleSdRX1Iv9XJ6INHqCMmotodxr?=
 =?us-ascii?Q?rDiuxZ3uKLA6DqzZFIlykZMQQIcsa8webJL7SRS7O840EPHDmbFlLUOVEIhf?=
 =?us-ascii?Q?kRYcYAWp2WibbJz8/RD2SrF/xJ/6EVu27InxygVDJxW7vWocBYV10nZRSk5h?=
 =?us-ascii?Q?6OAtvUolx1a9NtiBs6nGU8PacGFRv34TBmu6dTqsF/QPruhQR4hZa+K4a7zg?=
 =?us-ascii?Q?sGjP2JU9/Y5ROhZMDTGiR/yMja/5tj+Ty4q0Fdmpvenr6R0k9lszFi5gyiIp?=
 =?us-ascii?Q?mIhLhRsoV7w51JB/opdsAuh1PHdN4R+ZAbtMvzE8NTZArJtpf+WP7rXIWt+O?=
 =?us-ascii?Q?4A7f1VTqm9DtJt994ROFJlqHNBCMT42Ej1r0ELj3NDaOD3YsBKPNNv2J/uXK?=
 =?us-ascii?Q?MIrjjCrxkgCWQdRYFj3obGF898BxpXsz/RZ72u/ttd3Da30FLtcMyJ0T1ruo?=
 =?us-ascii?Q?ZWvq6nxMIMbwKsRGU9ewBNCAaho6mynrNIxOpMxGBK2q1wWQDwMMhGeL5woc?=
 =?us-ascii?Q?IAlPOalWJmNwPmQ/TSI19ZlQZFuJzRaZZsJXM4O4TqLAiI9AcgPWYo90vD+i?=
 =?us-ascii?Q?k7amwUP2ywDrknJNbi3pfjGlLHbxQmhsNxld9fNzsn4t0FBT0lbNB60kbypk?=
 =?us-ascii?Q?XTvJoAgk66rsCe2o1B7qpcuRZ7rww10qbeWP909XzAkpa1rrt3DXy4siDomk?=
 =?us-ascii?Q?c0XJCO2GWA1C4AokdOHrA8xtjHUewGYZ839yw2gk9yzKtkBuv5dGKMOO8X7F?=
 =?us-ascii?Q?PGHdd7jXY/lX+DlYi8Q5fSVri3Yexs2BdRVITWAnpiYlEVeSuw/MR3Rbrx/z?=
 =?us-ascii?Q?wsKtDmIEkSWMpzMcCBSEeMaEEbUX2YtVqPz/YqckzdlEUbiWOrCTX87oJacD?=
 =?us-ascii?Q?W/afG/CnfeJkV7IpKvrLXgehRNsSTf6dBcj0KUKeq4B4wcyFfWEVZiFw/30g?=
 =?us-ascii?Q?HKo5PZWb63/mjypnoMqBlb2LclJoxxx31XztQ/zr+KQQjD9BXqZIu5wnawKs?=
 =?us-ascii?Q?nVUzHSs36QV7gP2ntaoqI6JvuBlQ/aApbo0dWwpqtSlheGK03gdH33UGGEfq?=
 =?us-ascii?Q?UGY10fuLW+3wPravB6oHfi8quTs0lnIibYTyZ+u+pEkd7HxJ2YcCUR0lfwyP?=
 =?us-ascii?Q?1kbruV9vl5Ywci8w7kdjwmfQC2NRXimSYgI8xzv275ZOyLw5t8DLXkoFakTC?=
 =?us-ascii?Q?C+lO4UIQHG7Rw7DgwbFVJogysl3Wt0H9HIuu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:15:07.6187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b699d01e-bec6-467d-bcf4-08dd87847225
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895
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

