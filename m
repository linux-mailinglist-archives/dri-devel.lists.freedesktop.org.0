Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8AB27746
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B309410E978;
	Fri, 15 Aug 2025 03:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AaMM7eYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3E010E978;
 Fri, 15 Aug 2025 03:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz1jI9fadFRW3YkOQHy/hvzMdHIJavye58WxB4sHRVrRvmL1nsYsQTefDyeVyHZ6ImtWKHfBAHTJMZldHqiWK7GjbQRCCHVyqsQsGjWzZyCfYUEPDEc6aZGwTLNhJGhtO+X2wN7g+9cf8bhtqsOQqRdthTeCU9Jwsf1rSqpZtbPDMR5Ytgi6f1rt9MP4raOkt7FRdeIOy7UPM3xg0kIkOxLt1qbej2zg3GspF/hhzMQRYfHk5irhMHPLkuVM0KsmZ/aOFXAl/lduOFIyC/gVNZUkPdYhnrHNmBBxuJp3myhsPQNE4o3RlMvz2Wuzp7kl4TChfYqQFLUwMwPFdJKsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43ol8ZAsAWI8Xs17fbsLSxg2NyPmnozxCCVACZ+7LP8=;
 b=YHg91N9Xk4mXxvvJTJ5Bw2GS3CFpTmNudNxTqEmZkhzY7Hm/hulmmKd9kb+nBR48kjSpwVlll3eW2Hyr75B8NbeLryz70IuenTsFQvvxhgTF8VbTxKAwNwr55+i3UiUR2QKHTg3CNj8kf3IHzAMaxlzU5KUkDBriwBNwGIt2/elYi5/2T4pE2TBHBrAJubrzbRFPtb+caqn281vL5lsIICxLYbCcB3YiOlTslReDIGf4PWKmbKy1fJadLyLqOGimEtuvb3LGvQJ5oE4ZzxlymFaXrlah+Vxz5/53bDURzkIlBQoazj8aYKM+eoZD1Cw1//Ss2ptBhpQyMl3gHsazRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43ol8ZAsAWI8Xs17fbsLSxg2NyPmnozxCCVACZ+7LP8=;
 b=AaMM7eYjxmLr9gUpwqPTOlUjz4ZWuayfFcuOLSC6deKBXjeIKTPn0APVvG7zYeehIiVy4eidvu91GZo4XpOfe6rPaatNtx4qkz8m27U4U3eR2qYMRQS/M5DiG+/pWDd4FGssJeO7KpZt/LKR5ccRFbeq6Zz5juPZNLDh7felUWU=
Received: from BY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:180::36)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 03:54:47 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::bb) by BY5PR13CA0023.outlook.office365.com
 (2603:10b6:a03:180::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 03:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:54:46 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:54:42 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 13/47] drm/colorop: Add destroy functions for color
 pipeline
Date: Thu, 14 Aug 2025 21:50:02 -0600
Message-ID: <20250815035047.3319284-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: bd716543-3f58-4b35-569c-08dddbaf79a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tys5ZEw0WmRDN0cyZGROMzlpU28zRWswRkV6SCtSaTFGVHljQVUvelU0RWJH?=
 =?utf-8?B?Z0xLQ2VTd1c5b1lLMTRVQnBRNS90OFZEM1gyUzFMQ0NnS1RTaDR4QXdJSFJx?=
 =?utf-8?B?aEt1ampqTWYzd3ZrTDVQbWRKeEZ3RVZsaFdyNTFWYU4wYnMwU295WGRESTB2?=
 =?utf-8?B?RVpHa1dWM3lOYkpTcWRGZ0JwYjVtbVM4TmxEelJFZTZWUndYYXBha0plVXZY?=
 =?utf-8?B?bmh4UzRiS0JYYTBmelM2SDBhV1BQTlZPYVpaTkdRME9lY0FHZGZnbjB5a2hy?=
 =?utf-8?B?UkJycUhNVE9hNE91cW9EZE9XOUluaklkd1krdW56M0gzMkNjUm9kWWVNSUtB?=
 =?utf-8?B?dCtldDdHcWxBVEtJeFBYUW5uQjVCNC9xTGx5MnFMOVFNbmxyY2UzbmdkaDc2?=
 =?utf-8?B?M1k0S0t6VC9FRzQweS9sZVVtazVLUFpNQ0FBOHhRVVU4YVUvZUdpbEN3T1dW?=
 =?utf-8?B?ZFpBVVF1eWZaNDN0MFhIZjM4dWYzOWdtNWlNQXFDQ1ZqNnZHYlNySEkxdzFi?=
 =?utf-8?B?cW43MVZ5eGlXbkkxOUFJRFZiMGtXZVp5WGlRWmNvbkxXdzZTcW9MckQ4bkJY?=
 =?utf-8?B?b2RYZzZySHVWS045VHdLVld5dURQdHR4eUFLS1dOS2FoNGlCLzhxeFNoeDJk?=
 =?utf-8?B?MUo1NXJ3TWxJVWFJcUpMTEdZT1lqWnpLZ2dFVVM2K0tzUU01UmFVL2hoQ01K?=
 =?utf-8?B?MVVOUm0yQmw4Nml4RjRWdXJ4NzN1eThOa2l5MUVJbEdtQllxNWZtalBELy9v?=
 =?utf-8?B?U1ZDNXRjUGYrckNUT1lUQTBZQ2tzQ2hTUGgwWlVYUEJPZURPYWFOT2pBQ1ZB?=
 =?utf-8?B?TUpOQTRqbWZOYVVLWktGZUxsVW85RnVhd3AzU1NMRHl2SERleXJKVHZ6eWM2?=
 =?utf-8?B?WjFkQ2hnRURDUndWWHlqb01Mak02VDhKRkxWd3Q0RmpLSDRsaTRSa1Vla2Iw?=
 =?utf-8?B?ZURqQTdoZFZOWndvSlAxSVY2UXNCSEpiS1lSVVh3Y0NIbXpJVDRvSzJ2Wm10?=
 =?utf-8?B?aE9ENmF6OEVuTk5RU1pUeitTOTdpaUxqSXh4ZFlhYXdwQmhCckQ2ZjVQT1Fu?=
 =?utf-8?B?WENWZVpzWEoySGs5RW9vSTBmalFCUzVUZkNZZEtmNDNCdURvRnloWHZ2Vlln?=
 =?utf-8?B?UmVCS1FKeXh1Vm85d0RrTDBpZjhoN2ZJdlQ0bW1NamFnN3ZnWmUyUlVIdFoy?=
 =?utf-8?B?WEIyRjN0akpSbzFkTUNPemJFWkRiZldubkxsRDdUbVE2V0pxQUtiMTZnQkt5?=
 =?utf-8?B?UWt1RXNvRkZrTi9NR1d3eWVjeDIwSkRwc29hTzBXSEYraThNWEoyY0xxYTBo?=
 =?utf-8?B?MmZLTVZTZFRpYU5ablM3bm42R3Y3Rm9GeGZHWjFPa3hYajc2U1ArZzZScnVG?=
 =?utf-8?B?VzZ5bk1GRW5RWGNKV3JJMjZ2N2Z0OTRKdDBEMWFCdTRNbnB3M01GK1QrNHVR?=
 =?utf-8?B?cE5EeTdRcmRkZG8vVHpFUmVZWmZnaHpETmtxbEI5Y3VZOUtsR1FTMnllZjJ3?=
 =?utf-8?B?UG1PcGFqV3dBNExTL1VUSlIyV1NRYyt6YjUzSTg5dEVZZHU0SmxOeDZTbG03?=
 =?utf-8?B?NWNhaURoVUdqTGZvOUdxcEkza0FWVnlhVWFtNmVCTXFKSDJTK256UWt1V1Nz?=
 =?utf-8?B?M1ZXYVRvMVlQcUJ5d2ZmY0ZmaUltRERRTnA1UVpJNFAwN2pSSjR3aE8zQVU5?=
 =?utf-8?B?NGhjb0pSc3puVnBLbnhmR2dpUmtXSkIyUnlHUHBGMmNQeWc5OVV2UEptbVNE?=
 =?utf-8?B?dWZqYjcwYVUrbEFBTGZYcHpPNnRyTVRROTFkYWRXbHJERk96cTdsWWpoY2hr?=
 =?utf-8?B?cWxhQnZLVHhkMWlhNHpwWmM1MUJFUHdwYzBQWkt6ZnNpUUtLSlRGdHNmYUt6?=
 =?utf-8?B?dmJKQjh6ZklsVytnUjFCVnEzNEhENTVtQzNmZnJKdll2ZHdyNkRxTk1iVUR3?=
 =?utf-8?B?eWdMM3hmcEtLWWhiWEwyK2JhYVorSXZaSDFOSXp0U0t3SEZwbjJYTzhjaFFy?=
 =?utf-8?B?dkYzZ3NJM2lGNTdkVFlWUzE0UGMrU1VqUitldkhUZlJjNVZPQ2R3ME5BQk1E?=
 =?utf-8?Q?qY6qqk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:54:46.2357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd716543-3f58-4b35-569c-08dddbaf79a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942
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
v11:
 - destroy function takes drm_device *dev instead of drm_plane *plane
   (Nícolas Prado)

v9:
 - Move from from latest commit to here, and drm_colorop_pipeline_destroy
   is called in respective commits.

 drivers/gpu/drm/drm_colorop.c | 35 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7b3ecf7ddd11..6930d39c8ad3 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -135,6 +135,41 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
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
index 791ab940c158..0ea1a01ca04e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -239,6 +239,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_device *dev);
+
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 
-- 
2.43.0

