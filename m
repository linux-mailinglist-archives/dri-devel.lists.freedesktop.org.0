Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36ADD22F96
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D05D10E6EE;
	Thu, 15 Jan 2026 07:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0mrsvXK6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CEC10E6F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUfGut88S18oXfyNACt1zcxvHXIYqNNVxTSFjQYZ2701C6NG88dsRwMe+eRt67MK1EjPq6Gb2HiZiYMLkI83u8fenTjVRmwyVBytxHh6YvqLPtw5VhTYTdPy/U9TLg2iGETBcfmu5wY1O2/y1m/vlM/Wzpv3mvHB0+u63hHv7+m168c3ahh7apHB87Z9QSvkzAIrv1xb+0uSgJ9o8y2nxQ7r4BjVppfx4OSgFWvCGSUPerCzdWWIa9bhtUoviftVBjHEKOwVS021D/pR9xjBdmT10VevXn9R32fxKAXUTjd5Rzfv8vHu8JRF9cXWSO3qJWXSuuQxR6PTLpp8jwI80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqnVLMNuY1jYUU8e4cyzf+geGe1unRRVP9RYvnLkKW8=;
 b=lnmjqs291HYzA/iKJiIqmk8G/0g0dDfR1KGFUo0pok44MbEKHxxQUAlIGfNAQ3WHWItIjW9xWgxLtk3jXBeog9IAfcjx9gHLFFyWrBx9vI6dOf58LDC3jY/mVZBGMMMVQZoaYonndCl2po5o4FKWkl8QnnKMquou29gztjj49EujwcEautDW7xSKiDCG2mzgR+TevursG+AbeDoLm/T1qR9HR5ePnSjcAHNPnEPKyh+vEC2CYIOSKT7FAlDkgVXghlyv9Ah036lBvXhD2qfJoJsjYMm80siCs9FYoeFNrb+ghkkhg+TUJX2wxiQgRBzc7ckV+TFuBp1Id4s5P1FnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqnVLMNuY1jYUU8e4cyzf+geGe1unRRVP9RYvnLkKW8=;
 b=0mrsvXK6G1N8usFjq2OYXnrcwxUPaePFtv/jYHDquLdUcaIy2XkccK74FPZ9fswntIxMD3SylgU48aHu/wy3zDJWEqnQ9AfmS2iKYQ5jVToQ7ZK59ItKNcNBRca0lrxgz7iOUpVYFb9ydMKjwtb7lk4p2DygoYpTBxw9VejqjlU=
Received: from BL1PR13CA0100.namprd13.prod.outlook.com (2603:10b6:208:2b9::15)
 by CY3PR12MB9580.namprd12.prod.outlook.com (2603:10b6:930:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:59:26 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::ed) by BL1PR13CA0100.outlook.office365.com
 (2603:10b6:208:2b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 07:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:59:25 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:21 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>,
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Chia-I Wu <olvaffe@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH v4 3/5] drm/virtgpu api: add blob userptr resource
Date: Thu, 15 Jan 2026 15:58:49 +0800
Message-ID: <20260115075851.173318-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115075851.173318-1-honglei1.huang@amd.com>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CY3PR12MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: f24fe14d-9587-437c-1587-08de540c005d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WGFGd8dLV/lMhX1ZuqrW/cJn82BdzBcO3qmr/egtU04nkSRs7dS6ag+lKF7N?=
 =?us-ascii?Q?7rMHTzu+883IE4QhlvMfKmLsHzF6WjMeTs2dolw4OlySfSBCOvrk08mosdht?=
 =?us-ascii?Q?JLM22wAeWLGlv3EYSbQ3G4HwjNFzQJQ2SyKCIPPLMbhsXSpgACLPtMREhoXi?=
 =?us-ascii?Q?JEBwm0TOtkRvx4wpzNDzC61uDNwJZu3jiCm5rD4Ypq/zRY43bfMeDqVi3EdM?=
 =?us-ascii?Q?86qutBgrInQmCM+hGyK0yc73XoEGFbXSsfZjamQltzjiHYTWkdGLTeC3q/AH?=
 =?us-ascii?Q?SjJJW6rqvJWyndzaetrqef2ViBnFhzvAi41grhgE0RTtaqHdNGBXYISGnulC?=
 =?us-ascii?Q?7WcAaJMHMji3cGgp4p2jZ8UDYQ/P2WGYo1Yffq3hjks/3ub+x53N1p/Dv7Sn?=
 =?us-ascii?Q?M1ApSot1iGu/5uIL3a4DDoWp0LuB8MSHj1o19U4Es2mrJm5wK1cxJZJSQ5pi?=
 =?us-ascii?Q?F2dqwu5A1zIJuQt4yooj5ZD68HNk68txR9+SrZh4LqunlQc4I/NNk5FThto9?=
 =?us-ascii?Q?hYn4t8dlartu5GBTzH71DQW0teV286c/gFVUmFHxdHUovOISnWvV2Bhrz9b3?=
 =?us-ascii?Q?XgPk95ig9PKsJ+38uQErw02kYNyOEQon5aB8Ihpv/IUu15APSS3rQzQSXIvK?=
 =?us-ascii?Q?cvhOVxIeWYAzYHOQk24W2N+SbrtVP+uWJIbMAK0rHhvVUGScGnpcF19yes2e?=
 =?us-ascii?Q?p+zjo2oVaibXD5ycuKxZ255kl4LI3jLf96qvkI7Hc04GfALtOfj85nuXKd39?=
 =?us-ascii?Q?b4yVZqWHrNlq0rjrQ4RKC6ow/frthW/AOotcQjBOeHmjiT/hj6TIWIiBH5mb?=
 =?us-ascii?Q?Eje0KykIOSQN9dLqTr/czmcMDk0vqJIDjmWGR1u58whEe7PtsVHY+uTx20vm?=
 =?us-ascii?Q?whANXCbVcNYZwFDZqXfNLjmdSU8eBcbm3JRMfe11q4JBARaJO2mW/8h/CLVv?=
 =?us-ascii?Q?uova8lknF95iAkOMJyNYUqeFqmSHZqRUu7Lpcq0Qz/J6VTATN5IhUO+m0nqb?=
 =?us-ascii?Q?ti0OOGQrju5yCfFoafwgXPEh84FzR0l83HcL6TECXccqkiCdahWXpjkixKw1?=
 =?us-ascii?Q?+4628zKw3QqY9Dd3TtY+/X0maMH9AfOACyswmvzeGMvh6bp9YMcyeIOaXU7I?=
 =?us-ascii?Q?43RtKuupwDC+k+1v3BrJPS37AJCDwUL4PStDcUX9M88I/iRegnCLiwOWLcTn?=
 =?us-ascii?Q?ftJnrJ9BvLYGLdWVSO842Jg5LxTAOvz4d5zXm4Kmp/LI5hZO/9IlPQCtxkpy?=
 =?us-ascii?Q?NZS4poCnEnk3YscE4BOE+IkS+GRv4FLyTuP/kGE+qulmmGSSh4VjaqsIp6QG?=
 =?us-ascii?Q?w8WVT68CfR0p/5qQEm6sqWDs1bScmFjj10PA+/Tj4dAnO8Z0/zgyDdDQX1t7?=
 =?us-ascii?Q?4hfspysA+3O0B0eiTGuYpPCN9cG3bYxw+3GXMrPccsG1QADewmAmAi2++0u1?=
 =?us-ascii?Q?XfyMSY/CvYIZ2ItkwEVs1s+wif8D12o8kK7muSLx6neCPu31VO54NKrd0qTA?=
 =?us-ascii?Q?8DyNfC1u3DHBw8ZcoVDPP6LiwVc/B9icpVw5VTgAJJYfAhN2EtKyPt0V10yF?=
 =?us-ascii?Q?C4oMOgOCd80vaCYljKAZRD4OYnZRpUsDzY5ktrIhTD/l0bFzOR/vRY5JxN5n?=
 =?us-ascii?Q?TA6bXQkiHWw9aRmfl4MdBOQcUB/44OVVwC93nKKDb0M0S0BymqV+E06fT3Vz?=
 =?us-ascii?Q?2WYXSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:25.5198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24fe14d-9587-437c-1587-08de540c005d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9580
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Extend the virtgpu UAPI to support userptr blob resources, enabling
the host to directly access guest userspace memory without data
copying. This is essential for compute workloads where memcpy overhead
between host and guest is unacceptable.

UAPI Changes:
- Add VIRTGPU_BLOB_FLAG_USE_USERPTR flag to enable userptr mode
- Add VIRTGPU_BLOB_FLAG_USERPTR_RDONLY flag for read-only access
- Add 'userptr' field to drm_virtgpu_resource_create_blob structure
  to pass guest userspace virtual address

The userptr field contains the guest userspace virtual address that
will be pinned by the driver during resource creation and unpinned on
destruction. The driver validates the address, pins the pages, and
provides the physical addresses to the host via scatter-gather table.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/drm/virtgpu_drm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 9debb320c..fdae50e39 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -185,6 +185,8 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTGPU_BLOB_FLAG_USE_USERPTR      0x0008
+#define VIRTGPU_BLOB_FLAG_USERPTR_RDONLY   0x0010
 	/* zero is invalid blob_mem */
 	__u32 blob_mem;
 	__u32 blob_flags;
@@ -200,6 +202,13 @@ struct drm_virtgpu_resource_create_blob {
 	__u32 cmd_size;
 	__u64 cmd;
 	__u64 blob_id;
+
+	/*
+	 * userptr: guest userspace memory address for VIRTGPU_BLOB_FLAG_USE_USERPTR.
+	 * Must be 0 if VIRTGPU_BLOB_FLAG_USE_USERPTR is not set.
+	 * The driver will pin the user pages and allow the host to access them.
+	 */
+	__u64 userptr;
 };
 
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
-- 
2.34.1

