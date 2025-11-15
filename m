Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A6C5FAAA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9610EBCB;
	Sat, 15 Nov 2025 00:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ne89weV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECAC10EBB6;
 Sat, 15 Nov 2025 00:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWKFG1LZ7xfKntILTNKswdM2BKoAxNrFbj/83EZWRz6dfk6SYxnXGsNb2BqRqRq9yUz5m2GhXbpOGL1JyWxQT66qG+fJwLTGCWouONAyyaLK9N9MsDdW7WffbKmlwGwwxLoS/jHPIk76GZdgWvBKjB65kFGmye9Ec+g1M1HacLwDbdZCPlDoonMWLmidRW+coQ9BSsy5u6VGk63/4T+NBC4W2tZhdHZt0xb/NeqJbRk7yNbeNDWBWczsSEFdYLESrWn4WSWzwck9XVTIdHTdBE/+RDEqA/84vIkNOzo0WQ0Z64QZTbjiGT046SbmRDYr9thJTg/ya1EtRWOfcBpaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33wecZ3kUikF1jyZ/6ISJ/nY9vgLLzL5Qt3ebWd8Pfc=;
 b=TxbyG6i2blAZlSt7lc/hgTYyrK/u99mO/swU8QKepLe/y9SbFOfDG6qxDS3BkgS6Pw2dFB2wkDOxik0LBZnf2Uj0+8gKKpnoOOQ+Poa66iPBoEqFeQw8z/3P88EAl3VdFdazzC5z2vktxlsx+YBvTDOOAFXyUPx/LkFcgWpxbl9kjFGEtfrO+2B4EXfoU6gzrEYVABoONU2Kn9/mSkSNOXbzLF6OA39Rw979PA6ZEyDfXGlDGVtAL8eTbyAjfmoW+ee4WpMzrBAIJH4JTiOPR+mmdtM7ItPLgRxTmyq6DUiddLmJc7uESe+GF9XnbycaHZuNttsiu0s5kcg5TM5OeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33wecZ3kUikF1jyZ/6ISJ/nY9vgLLzL5Qt3ebWd8Pfc=;
 b=3ne89weVNplLmupPqDcG6LCOAJfwsPeYJax1UPMMzfONaenqm9qyUSe/F6zlOhRHGn3uPAL94UUvRjJ6XHORndRmYVcimbveY9QWnDtav5nWWBqXzpCEosyyUFOt1GHgwRzUhue7Uf5BUAnk4L0VGC8kAb8bpb0UCBnxDgJSYRQ=
Received: from BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::7)
 by IA1PR12MB8359.namprd12.prod.outlook.com (2603:10b6:208:3fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:06:53 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::e) by BY1P220CA0009.outlook.office365.com
 (2603:10b6:a03:59d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:06:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:06:50 -0800
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
Subject: [PATCH V13 13/51] drm/colorop: Add destroy functions for color
 pipeline
Date: Fri, 14 Nov 2025 17:01:38 -0700
Message-ID: <20251115000237.3561250-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|IA1PR12MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0fcb2d-0e51-487c-e5dc-08de23dae21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHJRelJubVp5YVVQdkduemN5WWs5Y2tyYTB2aFdWQ1BQaHF4azlCUUZOVkJu?=
 =?utf-8?B?Z2IrREZ5Y1RxQmF6RitDTWV0OEI0UHBtU2V0dE1EMGwva3pwSTBmNEI3T0Qv?=
 =?utf-8?B?aUZ6a0tZNzRpcWFrNGhJek9QVmgwUjNLVkxBbjY5VGdJRnQxNXJidmdGdml3?=
 =?utf-8?B?ZHpqZE1MdkZlM1Vqa25JVEtDN0o4MElFSlU4TFdYWDA0QXNlelBPdHRTZVlj?=
 =?utf-8?B?cVA5eG9VVk9QcHVHMUFYSXNmM2phU0o2WGNiNW55R1Y5VEpoSmwwcjhMeHJm?=
 =?utf-8?B?VS9MWFRtVzVIRVI1MWVxMFpFRXVCVk9DeWdyTjlSNUt3SXRvdk5lWU1VNVl5?=
 =?utf-8?B?M3pjVXp4RzJ2V0xEMjJEZDE3TlRveWlscjJiWUhpOE54Zkg3MTk2U1VYM3dL?=
 =?utf-8?B?Y3ZhbEY0d1VxUGQ3QnlzTFJTd1VYaGpzSVlCYTFhV09hdjBNQUdEZThQZWNl?=
 =?utf-8?B?NXNiNk5xdmgrT1FRSFZhc0IvZlRkd1FZdzRiM1VQc0s1b3lJN0N3clozNW9Z?=
 =?utf-8?B?ZTZoSzNvTW1NVzZYS3ViUDVrekVXWHpmVUlJR0RqdWRYU2RrMzNaMGlKTVBv?=
 =?utf-8?B?V2dhbndSeGtrSmQxbE1Ua0NIM2wrZmllUGRsWUIvTmdveGliTFNHWll2QjlT?=
 =?utf-8?B?dURzUTEwVEd0dTUyR25RT0Q2emdXWGs0cUY2aWxWc09iYUxPZUtDbHhuVWFn?=
 =?utf-8?B?eHp3TCtBR2x2ZUxXOHZJMHpvY0pzbE9mRjRnRGp6UVcxL1Z4RmQ0WmhEOHow?=
 =?utf-8?B?d3FISCttSnVuSm15UjJLQmVoUHBmdnhQZDlRaE9DYjZWVzJCMFJ6SUNXQ1BS?=
 =?utf-8?B?MmRPYzNUU0xNeEkzb2FOYW9XbEVCVEFiaXM0Uk16dys5YjRaMXhpV1F6TE9K?=
 =?utf-8?B?RHZ2Y0Y4T0tXMDZ2cXE0SmdpbjdzY2pHZ2NWMEtESUpMY1o3M2l4Ukl5Snln?=
 =?utf-8?B?VnNReXdaakJsUzN5dWdQaHhreHh4bGxNcUxyQUdKeFk2cTZjWE9ObW90Yzhm?=
 =?utf-8?B?M1FDQ3cxMUlVWk0yRTYwZHJMZTc0MklYNW9qL25IK0k4Q3hTc0ZLNzBwcm93?=
 =?utf-8?B?NmdRenJuRXVWUWFsdkx5NG43M0xLU00vaC9La0ticFcrb0tDVEl0MGx1dzNF?=
 =?utf-8?B?R2kycGxiakFGKzZab3lNcklMak9iRmpOREtaMEJQWTNZSkgwZ0RBNzJQR2dx?=
 =?utf-8?B?RjRrMGdZQXJONmRJV3JRcDRJbDRyUFdXOStVWUQ4VUlnRDlSalV5UzYyb0VC?=
 =?utf-8?B?RFNMQ0pIYXhMT1F1ZWpVUXVIV0pQVHp3dGI5UDBmRWpRMzk1Vm41SXdJUFZZ?=
 =?utf-8?B?Y1pzNEhMSCt4NkR3dlNDRFBZdENQVDZmdFRCa3JEdVgwWi90anF5d2Q0R1JW?=
 =?utf-8?B?K3Rwd2NZd2NibVpFM2QveEFzMGlHUDlPQjBWOFZXSkZHY0tBTU1NOVpUYmYz?=
 =?utf-8?B?SS9ncnJwNWI5YUJXTmg3UmhqRkJzeXhjMDRhU3k4bk1kK01PL3duS09BRjYx?=
 =?utf-8?B?NmJ5ZUJYQUlvc1I5RlBrbzJXNXdPSkRDaE5lR0NXa2kzRG5FRkdna3YxZVpU?=
 =?utf-8?B?bUJpV1A5d0JFY2Z6aDFaVkpIZE5PWStkblprcndSTEg2QUI2YkhSdXBSZldN?=
 =?utf-8?B?QmNXdy9DNEZwSlEyNUh2ZkxIQ29veDJ3d3M0aExORmhBWmxDZXVYQnFHeXhL?=
 =?utf-8?B?UUg5TGdCeHI4eW5zZjRlYThZNzUvdHV0WTFzOU5BbHQ5L0lVYUlKa1EwY1Qr?=
 =?utf-8?B?eGwvY201UC9FcUV4U1VNUnhKUThtNnI5bU92WjlMOTdTazVlcld5WUJPcE1W?=
 =?utf-8?B?dDhFY0ZZUS9haEx3R3RJcEhyMGRUWTlmNzRVWis0c0dGZGZHZUkybU9HY1hW?=
 =?utf-8?B?TjFPdkhZdllaSG1GQVpObjFwM2QweEZWTURTTFBlSG1QVXVPSHRpWXJxZVVR?=
 =?utf-8?B?ZHgxMkVvVlRtODdpc0ZBekRnck4vNVd4SkZpTFd2UlpjRFlwSld5UXRjV3cr?=
 =?utf-8?B?VXJoMXI3ZXBSeldaY1NONU9VenhqSW5PMUxCZGwzNnAwb2g1cUdPNkFVS2Yx?=
 =?utf-8?B?TTB6WVRxSVhMcHczOVhjT2wydk91K1dCU2ZaUXllcmU0Q05MQm11dGNZOEh6?=
 =?utf-8?Q?K8NQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:06:53.5303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0fcb2d-0e51-487c-e5dc-08de23dae21d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8359
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v12:
 - drm_colorop_cleanup is no longer static (Nícolas Prado)

v11:
 - destroy function takes drm_device *dev instead of drm_plane *plane
   (Nícolas Prado)

v9:
 - Move from from latest commit to here, and drm_colorop_pipeline_destroy
   is called in respective commits.

 drivers/gpu/drm/drm_colorop.c | 36 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7b3ecf7ddd11..182468eb2897 100644
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
+void drm_colorop_cleanup(struct drm_colorop *colorop)
+{
+	struct drm_device *dev = colorop->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	list_del(&colorop->head);
+	config->num_colorop--;
+
+	kfree(colorop->state);
+}
+EXPORT_SYMBOL(drm_colorop_cleanup);
+
+/**
+ * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
+ *
+ * @dev: - The drm_device containing the drm_planes with the color_pipelines
+ *
+ * Provides a default color pipeline destroy handler for drm_device.
+ */
+void drm_colorop_pipeline_destroy(struct drm_device *dev)
+{
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
index 791ab940c158..2c6b761fd182 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -239,6 +239,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_device *dev);
+void drm_colorop_cleanup(struct drm_colorop *colorop);
+
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 
-- 
2.43.0

