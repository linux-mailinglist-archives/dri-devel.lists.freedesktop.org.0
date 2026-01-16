Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E1FD2E22B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3698810E827;
	Fri, 16 Jan 2026 08:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KLjpQ1IK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D16A10E827
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WekdkZkkjF1/E9qa2rRzyv+19VzAJSKsRCwN7XbGc38iop1mLIEbpU5U2Ftx09U6RNesJgyLY+QuQuJM59YSpLzd/vFf/wBUUlgFhit90t20bM+cBPHvUW9KXgnVE0GHZN1OzD7/Fl21gPtoFguWvrQ/S1V5YON47myS+E9LNFlIJDqm3bL5921I9OgnfHaOjJ5agll9dGaHQvp5pLrjAYFtoo2gA0YMltm76Mr8igRTjTXF7vKqp57BbMu2xQkzXg85QiQ84hwwbCb7H7bZjMFN0ItPeESB5gB84gRQYiiPTXWpTV6wpzazFO/dgGmhIWD0ps6MWs3FgzueCaMWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDLRZqoqML2TKEsSTD/WTyVtKf+9dN6jwciH8XMVVb0=;
 b=NDHM/uNDdxhe6/ygE6tokzm/pI9rwtIRtZqgDXAxbQ2dUCj0pEOvoAOn1l1MoaTg7kM/8Mi0jkEhQQkHOHJCil/Vmo1fb56Icj757avN5ToH54ZLf6dqeSJvZebv4UowF60/f2KteOALOW/APJRCyyViakf6TeDAGRkm7axtq+5oMvOhO+cZjk0nn6W8mFQ45VNmekSpvkk2VJUR4oYfaaw0Lzm9uEgtjF77ceeNGriS3g7JtxMr5o+V6Vr01fKqS4Vc4f/X6vSsKxqi+uM6Cfmp0Z+VBua1cpagHEvXIgF5L0shywtLq4hmI6Vlcnu1QMeIbuoE0v4hUtgh7KgyVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDLRZqoqML2TKEsSTD/WTyVtKf+9dN6jwciH8XMVVb0=;
 b=KLjpQ1IKwtRwNd7Lk0qMDZspfePgAIQlVDZDhy5Q/ewXV+s3cFenuVelAP7f6tDVDQvYZbN0l43XPLpzd1DEZ+oxEzMiGiWxi3D5lkF7JJJFiXjhI89FhDBcL9jzZsJTIVJVc3mVLnVq9X+rWUHAnwnJ188BJsolhy5mtnSOs1Y=
Received: from BN9P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::30)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 08:39:00 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::7e) by BN9P222CA0025.outlook.office365.com
 (2603:10b6:408:10c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 08:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:00 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:38:56 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>,
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Chia-I Wu <olvaffe@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Honglei Huang <honghuan@amd.com>
Subject: [PATCH v5 0/5] virtio-gpu: Add userptr support for compute workloads
Date: Fri, 16 Jan 2026 16:38:03 +0800
Message-ID: <20260116083808.325180-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a5afad-8a00-487a-a457-08de54dab22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ufg3mYXv3tIDyRBqi7fwg4YOVlsYzjupQC4xkjQfaphjvTFWrxjRRYW00xMC?=
 =?us-ascii?Q?7c352nJnpNCadLnd5gojySk9KfZ6UN3clnQk7e1efuiZ6RfaDYIY5XHJqXZ+?=
 =?us-ascii?Q?ewZbakxpUuinKHssir4HMqJpZ5WoqBrSw4Xagp06haxaURjELHtc9gfAb5B0?=
 =?us-ascii?Q?He870Biuz7dYQUNrOZKGX90uK3itr909IJyCp/KPf9g3mskpfZtfwSgP7DJj?=
 =?us-ascii?Q?w54+Rx0ceEIBKFAMwchy9ggP/vNCbUOl0kICR2fHutnLa4n6a1kL4LP25F2n?=
 =?us-ascii?Q?QdTX3zgmn3V8St1OBz3a6VRL7htL9B9TBmN+3x4T6oNVq/+bSKkxiYCZh2jC?=
 =?us-ascii?Q?699mKI/yYnYun7aFtURgkTo1zn2yEoz+/4Nx/fv+kiQDFitk3+Ap0YugZNzN?=
 =?us-ascii?Q?qcdyTTfF7ecpLPyb4oF/arMeTyrJnf4sR31QHcRQ2Em8zGzbzQSA461IshQW?=
 =?us-ascii?Q?6FzzlP3OIZ2ki3zRj0uhN4wBSHPDv7sNwYYz/EcwFf26TD5tm1Gx6DCElPWS?=
 =?us-ascii?Q?X9RQB/X50F/AJmD5iSUCjLPma5ZRAS5YIwQplOVAjJjXlPeBlLBoUHUDW9aP?=
 =?us-ascii?Q?aa10AlcN4Ky4TMhCFZW2/uf92v0PWCQSzpNQzVOC3s/vcw/L0TudRBRISVZ4?=
 =?us-ascii?Q?K2C1tJXsV82IECJn0TwvqI4ovVpK86O1QUCq0ubf49tZHsEfi52R6zolZXJM?=
 =?us-ascii?Q?EJMOWdiTK+b+19v0TCBZUlMb8W+ZuIP2wznHBGYCrLOIKg2xJzgPVwHjo49q?=
 =?us-ascii?Q?Q+U8bAzvNVn7HcipLj+8615woOsdYtuYCaoPgrHEHqRgCY10dOEwq7QyU2z9?=
 =?us-ascii?Q?BgV227BTa9o7vMsI+ULOhip5LTtNJbrDcyXuSD+sX4Q1a00n5Ob/W+ELWcpg?=
 =?us-ascii?Q?KQ54v1VxnFn/JtQuUWPDp9qd6wAZ4JzznNOuMf6z9+wV0epeAOw03F2lqON0?=
 =?us-ascii?Q?DEwKJTUatOX3JPQuIU9KmVyp3KpA5H4FIyIqD/Ty/fCKsjtR0ILk1k7F9j2w?=
 =?us-ascii?Q?uWAIMvomUm5YGwWsPD3G1MXCszCYLDXB9ZAtut5zZi2CiNErHSpayz5DnCZV?=
 =?us-ascii?Q?NXR5xeOpp1jlcv3X30BVFzfWt89VAr98YYrpGqg/K/Y74sdMEdz5sGKfaexm?=
 =?us-ascii?Q?rrUrPK1D5V+JT1Hmm7WytSEPgZfU8UbV5mFm5if8zZQWJEiGK1OK+cXR5ABh?=
 =?us-ascii?Q?R28zAsGic6ZKTQFAmiCUGCXK4vfO5o/8arAm8wVmJMPxutCFBtd2ToKwOWVq?=
 =?us-ascii?Q?uIuId9Ogw2XYdgUaEQ5n2UT5nLvbqCHsdturdk9Bi8eLhBKliIJVm6N2xp0z?=
 =?us-ascii?Q?B6m8A7RY+o2q9pqL0OHDlksI2h7jFIxjgdbwUjQ6N8xo9Yl3DJG2qjyBIFdw?=
 =?us-ascii?Q?WNzRv+RXE+BCEv2HujiQvt8mQ5muWuGCezRjw1kONkfiPmlJJfU71aSJa72W?=
 =?us-ascii?Q?T+TMBuYBG8aBSXxdIvwExnBFfzDtAgUnhzQWgFoltC6ZMcdNI4qkm+azEuON?=
 =?us-ascii?Q?DOYc1xh+m6sdGoeye6gn9rLyCWmFsCNQnnrLONChMM5NiaiaMKP+Qr9hA469?=
 =?us-ascii?Q?OOYCgsK7KeQ4yCLBqvcLIc6EaPQogF9YCguZWIEbGwWYUsNsLWX2ZWFCcsaj?=
 =?us-ascii?Q?Y+i5GmVfhC51KGqZ/cCF9y1LZyEzsbQP0C+Aoz/kZY9qQmS4GoJLeLGfZrKR?=
 =?us-ascii?Q?vCh9ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:00.1676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a5afad-8a00-487a-a457-08de54dab22d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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

From: Honglei Huang <honghuan@amd.com>

Hello,

This series adds virtio-gpu userptr support to enable ROCm native
context for compute workloads. The userptr feature allows the host to
directly access guest userspace memory without memcpy overhead, which is
essential for GPU compute performance.

The userptr implementation provides buffer-based zero-copy memory access. 
This approach pins guest userspace pages and exposes them to the host
via scatter-gather tables, enabling efficient compute operations.

Key features:
- Zero-copy memory access between guest userspace and host GPU
- Read-only and read-write userptr support
- ROCm capset support for ROCm stack integration
- Proper page lifecycle management with FOLL_LONGTERM pinning

Patches overview:
1. Add VIRTIO_GPU_CAPSET_ROCM capability for compute workloads
2. Add userptr flags for blob resources
3. Extend DRM UAPI with comprehensive userptr support
4. Implement core userptr functionality with page management
5. Integrate userptr into blob resource creation and advertise to userspace

Performance: In popular compute benchmarks, this implementation achieves
approximately 70% efficiency compared to bare metal OpenCL performance on
AMD V2000 hardware, achieves 92% efficiency on AMD W7900 hardware.

Testing: Verified with ROCm stack and OpenCL applications in VIRTIO virtualized
environments.
- Full OPENCL CTS tests passed on ROCm 5.7.0 in V2000 platform.
- Near 70% percentage of OPENCL CTS tests passed on ROCm 7.0 W7900 platform.
- most HIP catch tests passed on ROCm 7.0 W7900 platform.
- Some AI applications enabled on ROCm 7.0 W7900 platform.

V5 changes:
    - Add VIRTIO_GPU_BLOB_FLAG_USERPTR_RDONLY definition to patch 2
    - Dropped unused VIRTIO_GPU_F_RESOURCE_USERPTR feature bit in patch 2
    - Included VIRTIO_GPU_BLOB_FLAG_USERPTR_RDONLY in VIRTGPU_BLOB_FLAG_USE_MASK in patch 5
    - Add check for userptr feature in patch 5 before creating userptr blob resource
    - Updated corresponding cover letter and commit messages

V4 changes:
    - Renamed VIRTIO_GPU_CAPSET_HSAKMT to VIRTIO_GPU_CAPSET_ROCM
    - Remove userptr feature probing cause it can reuse the guest 
      blob resource code path, reduce patch count from 6 to 5
    - Updated corresponding commit messages
    - Consolidated userptr feature detection in final patch
    - Update corresponding cover letter content

V3 changes:
    - Split into focused patches for easier review
    - Removed complex interval tree userptr management 
    - Simplified resource creation without deduplication
    - Added VIRTGPU_PARAM_RESOURCE_USERPTR for feature detection
    - Improved UAPI documentation and error handling
    - Enhanced code quality with proper cleanup paths
    - Removed MMU notifier dependencies for simplicity
    - Fixed resource lifecycle management issues

V2: - Split add HSAKMT context and blob userptr resource to two patches.
    - Remove MMU notifier related patches, cause use not moveable user space
      memory with MMU notifier is not a good idea.
    - Remove HSAKMT context check when create context, let all the context
      support the userptr feature.
    - Remove MMU notifier related content in cover letter.
    - Add more comments  for patch 6 in cover letter.

Honglei Huang (5):
  drm/virtio-gpu: Add VIRTIO_GPU_CAPSET_ROCM capability
  virtio-gpu api: add blob userptr resource
  drm/virtgpu api: add blob userptr resource
  drm/virtio: implement userptr support for zero-copy memory access
  drm/virtio: advertise base userptr feature to userspace

 drivers/gpu/drm/virtio/Makefile          |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  33 ++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  20 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |   6 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h           |   9 +
 include/uapi/linux/virtio_gpu.h          |   3 +
 7 files changed, 302 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

-- 
2.34.1

