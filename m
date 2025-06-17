Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2807ADC064
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5849510E57D;
	Tue, 17 Jun 2025 04:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PF39xm3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEBC10E57D;
 Tue, 17 Jun 2025 04:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/EsQqbyw1elhsGKVUOQYoIoB+FbX5X5/WWNCRZbkv0zHnMT7dznuttmwO48Z5NwoA5587Pxr3clx6nx1f5ZWPAgnvkXGJFHfnx/rzYu6u/7Kk1Z8lg6H4qLukxZRAGzwWTpQYd3CNMgMMkG0h9OkEhkm1KtOBL7Csk269mfr2YfKxV4ZcN/kJpSlNdAQxNokiYov8aROOCxERqQFFRVc6Ndcb8vc09bbwygNDLE0/yPVTWhNW4E+UV1meoI9YoOhbGALmIVW5Actf5g5fEcDwhG0A5XZdv5PRqSb3gXA4E9Ok2zZaCQMG1wJnpDCFPA1BAHnFdJKCIYOKKrn1T37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY8UFniGffRF3FiXKM3stRYw32ZlZOc6arCEftBC1+w=;
 b=DWfgX/XfD5B/h9wKHU1J4HndJNNIoGERy1aJQsXCvrjzRTvwEHk7BOEACGpZSoL2wIdv/ZTrXQPAf7zhBm6mhju5Q1Joc5tXjtD+prexyOlT5C+fxeXZCAJh/DDmf2VIRFzTcSLrtfsnJH/uaSpiwK4WSUqDB8OdFhQhVNfKJ6Lp56wqRzpotq3QBDBauNQfSCoAk0YmMerF8itcDiIIBWAzBbCT2ggPTPDmrANg6CtE1W3f1ZpQ1bHUk1uFfehNp3XXGFc6ufKQY4jr3ndSS3vgTWagUlFfdUGK6O6jkanoN4fbTFyzm1RclagRfnElYkUWz+lYoaWmJBWh/xQN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY8UFniGffRF3FiXKM3stRYw32ZlZOc6arCEftBC1+w=;
 b=PF39xm3Tgazt3kFQWvmwN1vUZEo1c5Uz9wywZG0UTESjha2IsAY6eKxPQ9E6HtS7wbjg6/xdZ+50EKHGUB1i/zhfa0ZWoLWERhBzNMLrAt9mg+iMcCQCI4dE4t8IPOSslP5WIh02wOgwvVPkLi5DbsfOiOhsx87S2lNspHe6lO4=
Received: from CH3P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::12)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:24:13 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::3) by CH3P221CA0022.outlook.office365.com
 (2603:10b6:610:1e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:24:13 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:24:07 -0500
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
Subject: [PATCH V10 25/46] drm/amd/display: Skip color pipeline initialization
 for cursor plane
Date: Mon, 16 Jun 2025 22:17:07 -0600
Message-ID: <20250617041746.2884343-26-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fbcdcc-c15b-41d2-e238-08ddad56d098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hQ5qn+UuBO+hussFwUjog09de89IqzhuSll2GBRMs9Eumn9cSGsWIO78vvqR?=
 =?us-ascii?Q?MHkCVZSGt0+rq65giHVSTj4qZ40PtO8AvyeK68fozxiI0qN6U7WrkcdNDRxf?=
 =?us-ascii?Q?WHVvsv9X+8t/sjUDbUEuE0IFn8ayiProy4v/uufu7NiXjC0xL011PPj3uQ6M?=
 =?us-ascii?Q?YERv6D/o8pB0VDCJZjSYIRd/ywl1iRFT+uU+UwqGcIYx1st78RBStuKwHvZy?=
 =?us-ascii?Q?Tl3mxutUks20mj8AAr2toVl02EDjSdgSwktqe3wr0o6t7HtcqZK+mKcWtHHu?=
 =?us-ascii?Q?Jhn6/QjuAAmcTQeQS7YiJG8rWIlxtfYPRWoezvIttLMNUc6btSG+NUkNgv/T?=
 =?us-ascii?Q?/O4btzDf2wZtFrn9PLGKokmwnqpV92l4GjKrc12qEI7LUq68u8u8rfgJ5L6A?=
 =?us-ascii?Q?//IPdMeMMcx83kwFea+FtA3kx3UyXrEFr+dbHAglnRVAoj5aIFUolzRBODYm?=
 =?us-ascii?Q?j4LlkfNekXC9zESvoWnRvyjMN5YUn+3lwTOCdWjJnb/11+8s+CiSoH6a4S3B?=
 =?us-ascii?Q?V29bDdQiKwlV3ELC9asaDSGob2DF/fxIPFNM4CIUl2WzpjzWJa8vsBR2xqLA?=
 =?us-ascii?Q?hMvGN4u8D/xxZ5E1pJbiIL2Nl86wtBtlNPpK15y8Z+RgeNuLcaT+4cKGjyfH?=
 =?us-ascii?Q?6Mr2m/az3udML9+1d531zqRFloWcpxYOA57GXHSuBloTNOz9G+7A4MzfvbP/?=
 =?us-ascii?Q?OmaREH2N8UqbjdXGMZ3EjsLljSAks9h4u/o40hXfhsEbzWUJRyfBm0SdAESS?=
 =?us-ascii?Q?LCamSlgQL6WBj/yuadzxtmh4N1UOr4FLfIHmhy1766tGRCUoEH8tfAjU2Abn?=
 =?us-ascii?Q?ITnHX8RbEOlddN3PR22cP+/s0fDgjDqMuply9ACpbTyuwVZY97sOAu4WbdgL?=
 =?us-ascii?Q?lLr4NwYifpLbxURVmPnnSBifxJDc7JTj0H967YLCOpULwEuIZomAL8F2Ah4M?=
 =?us-ascii?Q?5QIu8aHwhVnzqDZomQOyqFOSjx808QwUhvzcn7gSZDcL/YES/aMi6hRyL8SF?=
 =?us-ascii?Q?L5hLFCYoGw5zyBJ55Uw50t0k0g+NTklKRNXOy5IuUq+v/FvGXuNQ32SWZP25?=
 =?us-ascii?Q?2VfuTgYG/Z1mIPMdeRycWbgSC54pc6Dp/H1rBBRzWZVAOlNqBg/yQIQ+uZaa?=
 =?us-ascii?Q?Y+lxYHncB1Fm9DwoTwQk9nK/hx9scfdXBuOHeeuBEUgdTcNX83htzyjimXDB?=
 =?us-ascii?Q?1EgVFe0ZaY9AMI/Ksq7hXPt0mwc4h+k+HYlcqjxk9OFjmGidqPYoZippixy+?=
 =?us-ascii?Q?9GPL69qK9IHjHXgWDDFONxOd8U6NFl3lfafn+jRj/7lDv/sNFjD5zXI8lwJ+?=
 =?us-ascii?Q?b7ECVyltEYGTDOSZdr410yEuTdPAMCD8XiYm1MYvNUPzxYcPBriQIm/VCmN7?=
 =?us-ascii?Q?JNYNUZzAEiSCfNlrE1z6prUnG/rnWKWQPpi6FhDN6AOS+1M5MhqTxkvZHxgI?=
 =?us-ascii?Q?fK8UrYmy76x8pCOWXkNFn0tO6+sISAEO/gVh62FMB7NxQpB+fpPTNxH12ZZV?=
 =?us-ascii?Q?leRPmKJRNJzK0s+HveR1AT63J6/8L0x7uKvT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:24:13.4412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fbcdcc-c15b-41d2-e238-08ddad56d098
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518
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

cursor plane does not need to have color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 580af6e85c81..9a5b184e594f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

