Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD501D2E23F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB210E832;
	Fri, 16 Jan 2026 08:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BzXIuAjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4E310E832
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm8GuaTlMqcQAVnONKCoICXlcwAueBlSpVmP/QfSrEa6bv5t2L6tpeU0yqzkOE+WNBYRmEStYX8Yy94aFFeMFacYyLVEXX6lgHOpyPYj/Eul91qzzCQg6nQrqnISHcNEJ4ww2nNphCDmiC3fXhHExJliXTnlg4yHJu+stTJZlqjcIyGEUgSVtZa+qC3J8e2CtVehCFWBMKd0PaNWOTjrpzuRz6WGE1yrh9lg4pNwkWo2FXP4hREF7e4Z2AKS9Y+E+C68WKMTUAxYejTs3vr/yU69I2zYZ/Ixxd8ySJ8SHmCJRY4aggFwDO/kIiV26kDzOQa6D4BFJmB9hTl6Sl03eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqnVLMNuY1jYUU8e4cyzf+geGe1unRRVP9RYvnLkKW8=;
 b=EUckSp6zX+IpiotlARgB0KQbVR9vtVhUvHO+9DFW/LCdkJxNnju7Z5fbr5e1p/4i6bZRkUk1bqpNhAu/h6spbvgDswnX9Xd901+SPtnfilKG14GYES4kK/e732ny1J8ZzjvW/Y0FB1bq3YfndfXQi7PEaqoDTqP7Bs6mKRfMYn+UnJvmEaFkWrdr8qwykCMVNCi7ohPRzB84YDCj9O16B8VqkV2QQIxDr72Awk/JG48VBvqOqRZyKksjUeX3lzdoL+VbFFHQhqSKD80PiVLzDEINQvNKi84NceMqrotW9a1w39rlxEF5XvbpFjeehJHu3Ap41VBdv/8l++wUHpDa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqnVLMNuY1jYUU8e4cyzf+geGe1unRRVP9RYvnLkKW8=;
 b=BzXIuAjhDDXMzVDiRjAbFJptN9Ec2YC2qvCO8QvMJ3bNLsSP1QQqQmAunMOzC/yD5J/rluGJiONp7MrfnVFyn/oK+QRnDErHri8pgc+7vTC9vHNodlUSrJyXKCM+ANZ4zqA5Xg80/UINJtLq97MFodQE/av85gCMO56i1vegRkQ=
Received: from BN9PR03CA0157.namprd03.prod.outlook.com (2603:10b6:408:f4::12)
 by SJ5PPFA5F0E981D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 16 Jan
 2026 08:39:12 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::31) by BN9PR03CA0157.outlook.office365.com
 (2603:10b6:408:f4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 08:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:11 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:39:07 -0600
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
Subject: [PATCH v5 3/5] drm/virtgpu api: add blob userptr resource
Date: Fri, 16 Jan 2026 16:38:06 +0800
Message-ID: <20260116083808.325180-4-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116083808.325180-1-honglei1.huang@amd.com>
References: <20260116083808.325180-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b447e76-d6b5-467a-d05f-08de54dab8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zWRSoqIV24FK+yrR5fIrllyQcbyP2nEqjkaiiD+yHdQnNx6tUciafTINdS5/?=
 =?us-ascii?Q?3OUAl/Z7pcygh21Kz7PofyphAZnMSZwsIZ6eyCZiPNa1i1q2fjDGDzVJIFhG?=
 =?us-ascii?Q?dGLb/Ma6gBmkQQZr8ZqRbXkxuTzXseGbys13SH/XnVdTKEbFSaNTlR2Rt6jq?=
 =?us-ascii?Q?5eo3o82HdqEKer/3lelMESUoMk/G+xP9rkE4mbDXeXYQ8+vKESbXyNzYscn+?=
 =?us-ascii?Q?bdPTdEhROKVI/4unvvjJsY0YD48AIbhE56CsARKKLzEoPkjerrJhv+3XQtBZ?=
 =?us-ascii?Q?JgeveMebdEjlfRmCsHPhHncScbXAjWKJajx9j8+5Wrlaj9ltbQ09RQ5dWjq4?=
 =?us-ascii?Q?h+LaYGCAdkKzh9IaISWpL6fNoP377kZmsRHWDQh4r1s6FXKnGcv6IysXs/0K?=
 =?us-ascii?Q?yTyGSvYPaJ/q2rEO/8DNVckZsR1RJbIfIH04ZR5y+fonig7dt9ErTpmzzAe1?=
 =?us-ascii?Q?LODZU2wiO90dVDQmvf6gmlq0nzEVL/MBsipSbsw73cVFmkd/R90bhFzOIgMw?=
 =?us-ascii?Q?bNfLt2kYkM+vWZadtzIu7AvMrG7KBLEA0OcyUCWGzlM8IAJUWmwO4SbqhX4s?=
 =?us-ascii?Q?TUhJqr1AI2CqBSg8XObOii6caVl3FouHOrEW3fHC0W9isr8mBJAgwKzSaSt0?=
 =?us-ascii?Q?FQH2hIwDz9J+YEoBsADuNgECafN9LX8JimPv2pfn0fMeMAzaPqb5WyV/IP57?=
 =?us-ascii?Q?w5nYnBqRdbNBBwuU55BwlhVY9GjlJqdfFgoOl9vPIqVeTbDO6og/npgr/Yc5?=
 =?us-ascii?Q?rx3oFvFIMHoTTbVXJ944RVjcZ/iovm/7S5xpVI1/KoG60X3R7oJuPo3/g16v?=
 =?us-ascii?Q?c5r0F1k79Uf/SwKQYYw4pofv55y9NQUER5HYXkpNklP+hxVQYlH24iqU5Y1R?=
 =?us-ascii?Q?54WyJR3rE6BygXBqU8u4IB5+L1ZWfoGN/i+kNi5rWt4xENKuMbY+DrwV1DvF?=
 =?us-ascii?Q?oOgAkFaYT0eMLozLTUFJgX7yaqzSUNxDgxAAYun5tbSeytp/9XOOOl9i/8Nf?=
 =?us-ascii?Q?lBm0FVhzTZhFE76RxnQV2h5MwXjqM4Yqhb+tQSQJ2Ij386bIieCIW3MwuO0j?=
 =?us-ascii?Q?FlhBaL7yXUft9UWqB+I4xrxlINt06iTrJf5q3ttC/4OVXjh4JjZQPslmbH7c?=
 =?us-ascii?Q?RXAxay9rkTGrVPs9A8aRNIFW7QfZB/e8yyzyvNpWx7x2f9aCspCS2ifDk8k7?=
 =?us-ascii?Q?5pk8l9a/xGdobrJNoAQQ4/fgAKnkRmUwIt6pezb8y0DUCYZrIOQiNne58xgt?=
 =?us-ascii?Q?gMpdTZJPgypFMovVOzy19F2N65WAWGVQs88BEzWM4Jlo7nhm6Vn++mce6Czk?=
 =?us-ascii?Q?Dv5pjIlDWepRMpTymNC69u66DUPnPWLSr5wKdSrr/LAIYQ2Xb3w4lV03qcbW?=
 =?us-ascii?Q?IEwTIw/QPD7aeqDAamM6vLQC5nXgBf0t+TcPNwNbRksmXwDqyAZJOHp2dAuZ?=
 =?us-ascii?Q?aflG8QolAH8uiqEGlv8em8ekk/vN/LWzdgC46++t9fx9EhiXZic2SRgTziz1?=
 =?us-ascii?Q?eTb/khlW2F1MzdYFVrNtk2C6sH1Vj1jBL+NwouVV0guVFkQeF+nhxlBT/O+T?=
 =?us-ascii?Q?RMwZLG0LpLcSI6nqyrfewF1Kcrd4FXg1FtcpsZ/+kOeZIJQeMVums9iGozdk?=
 =?us-ascii?Q?zJ4yvDTcidyT+YTAZ6/y4+4pZwcnP8orLkDv5KOvkulwrgCaRj7VZzkCIcYI?=
 =?us-ascii?Q?RtZcWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:11.2836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b447e76-d6b5-467a-d05f-08de54dab8cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D
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

