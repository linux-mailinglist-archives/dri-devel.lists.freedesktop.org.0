Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D005C51031
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A02910E19F;
	Wed, 12 Nov 2025 07:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xvGcVPOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B837810E19F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWuAqhgQgAw8lYMr/b9VyYN98w1ox6y85SsEL39kqpNGXDeZ8uHq4qryGcP0FSx0cP0YRpZ7DZ//2bcCovBvD04IETe5qjiRmaPOnEBbDUXrQi3BaDSzCpeiaPi3hhBUddXmhcV+JFZ6bJq+vW9Yr4FXq2ZfUQPabqaay51E6lqzeTM5CGEtrXFd795kjDCgXk9nhRnmm2FqzdBL4WuGh4x+Lva9+0VCC8hlsH1GsIDWmGrQBBBq9MsDTirYLKZlZtey+l0O4z+TiejwWswTSeDREO0cDng24o5gNbR8LoDN075rk/Y+xVzboRZFoT61uZ3wpPvrODPQdC3rUyNsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ8ZXd2L8ch/2ZCm0u7EeWmsvqVHah5l2CR6xMBIbaI=;
 b=jaGrDr7jigOxsG0+k9sbhWrsnxXf9r2yzS54fkbX+3HcuhBHujNKP4tmRrB3flgYsHbxEKcqvx/9n5zw2FaJRcfzkQ8K3B2YLcqmQ4qrF+kVPRJHQnew5+fyB/1iK3PkNRQVJ3TnFpCfyEBx6qMrLOqE+qf/JvfyvVl/Xl+LxgY/HM5qEv39w+syUgdyP9I2QP2LRYzxdM+/Yz5HCZDKfzbcpqCOZ/9xhNjAJI/Y2lKCBK9t3dhZIlwh3gVLRWYSafDVISlwObs7pdahVDw73kXoN8CLKKBay6+Gv9342+p0AmoF25MPJsCnLrAc4/Ir4700zwsYvq9ji5No3Mwbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ8ZXd2L8ch/2ZCm0u7EeWmsvqVHah5l2CR6xMBIbaI=;
 b=xvGcVPOtTgOaR6iWJ0xbV+unrdKrC49ttXpccB45g1a5QMR3cqIKH26Bkl2/UnX5/SCaDVsLQbckniseLFApcK5DvcJlhKT7GMcgzi+MRWRRmJnPRi46tRpKXsm7t/5G2VbDse1gQXDFMc+cXY5h9mehFLeAnwIRHnis5L1Vu5o=
Received: from MW4PR03CA0279.namprd03.prod.outlook.com (2603:10b6:303:b5::14)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 07:51:54 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::c0) by MW4PR03CA0279.outlook.office365.com
 (2603:10b6:303:b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 07:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:51:53 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:51:49 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Honglei
 Huang" <Honglei1.Huang@amd.com>
Subject: [PATCH v3 0/6] virtio-gpu: Add userptr support for compute workloads
Date: Wed, 12 Nov 2025 15:51:35 +0800
Message-ID: <20251112075135.3719490-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e9fc99-f74e-4a72-8e3f-08de21c058ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+2BWFQ3amlIf2qGtKtN8FCXtrpagt+ckKi5Yec4C7fBCpGkdzkyjgTiput0P?=
 =?us-ascii?Q?jhNCs+klTCT4E6KyLVCZOX391QIqfSlfZVuei0ZC5LH/rgDQgJw7+yDBhvj5?=
 =?us-ascii?Q?LK5/YP/O7ncKEzfoPsX486UvhJqUeqiYBpEyjpb9ubtHIoeAKfc83JVWrxaH?=
 =?us-ascii?Q?9+zMrOxYRP7lEDxSPfcazyTwNEq8ClC3kxVpXOCOby8435FPV7iqbiaipqrx?=
 =?us-ascii?Q?kC45EV8qomsEJk0XUVwe/DeVzn8D6rWxLHamrIQQVppWkt/VxYwa7XusAE0f?=
 =?us-ascii?Q?bBJXr9REqJW/S8gZRTfx38lJOpu1KauoBSvITJblyqO5vCqWHbI62nnLb+X1?=
 =?us-ascii?Q?CYWjbIvlExT+zAC9ZYN8cweHAsuwRmoA9A/AgYD5t8W2wvFO/exixxy50gun?=
 =?us-ascii?Q?pPXJOMjYrulrj1E8eeoP6O1Ts7Xs2oNAZrFVZ2bQgfZZ/nGmGkYW8lvRoJvw?=
 =?us-ascii?Q?G3z8/DTnqv8OVD0De3zLme9CVmbYgPRB5E/qCYhk7uhUHiPEs4zMIeh9/j+B?=
 =?us-ascii?Q?IJZcjRk/pmy3GQLwrEdfFq6qSBnf+7Ej7Hm1bqrcvSjQJlrZshRzlrvJ+iJP?=
 =?us-ascii?Q?cP14jiaWt8aSvbUoI94KX7AfI1DTUnTQUqKcArswRmBiNrVTrJc8gTMfFh9z?=
 =?us-ascii?Q?9/viG8XSBbdlbqLCHnkepgKQ1CAEz/pUuHQ1rVtgXPtQD4ZxNpyjdNFRzN0M?=
 =?us-ascii?Q?a0Ket3rwsRNZD0+mXvc7syZbucBcwU1qPgnZRvM/2PcrvDuRalXyZv/kdOn6?=
 =?us-ascii?Q?6rXcIfug3fFmVbN+i1Rrx/rKBWR30MfI06oueCao/uSuvyCbnwhlwbuwJI1a?=
 =?us-ascii?Q?861poWNa0/GzZu0unfmn8AMq+NFZLQ8Tch8B/ky7uEe8in+VddHAyY09Wt0s?=
 =?us-ascii?Q?6JE/bGBpYMoHoHcwwz5VdvH/fiWcngpPxNVIl447Gozf1tsa6o/+WrNmMZ8F?=
 =?us-ascii?Q?NnOcBQQdgIS3khyTki8JojsMBJAuqqo8SNzuYXU5UIH5XbXjq7I27PQIle0m?=
 =?us-ascii?Q?o30K81AovFKcndETnqReAsBWXW1pX5P6cgqZBgZQW57FQ8Qxc4W7mkAb7lBk?=
 =?us-ascii?Q?JkVtpGUH4AfMlh4d34nozm9i9zcq9BHMhtn5zjPVfW8O8sedxItbUGIOhPZJ?=
 =?us-ascii?Q?NPuF3seG55KTJydpRgIQ3BkU4rQzQDZUedboAqbTkqgXYqqV6l81l2/SSA1O?=
 =?us-ascii?Q?SNmV1MIudPuAlIEYQGKaO5PX1nFTlRbN1pkJuemhkdI6+8ErYDCPKI3roGNt?=
 =?us-ascii?Q?cCXk8vK2x36ZrFBV7AM8Jyf0dkNt22Z0ETIJoK3Nz+ms+k6VdBkGUxBaQrmx?=
 =?us-ascii?Q?prNkgFIbyPJpzwhB4gBqfrm8RzECriYcyS7hclbls2q/rtDpiV9GCBeKOQC2?=
 =?us-ascii?Q?5Jd9YFyD0NyBBwuOROVrujabVSF8h/5P4Sja+MbPep5o+Sx3UspGO8k1+30N?=
 =?us-ascii?Q?ntgACi+THnjiPwAXo+r0yImUBvLvYX2Z7K64CNx4YVMIhNVggpSR2J4jbeEt?=
 =?us-ascii?Q?Ke5CnqrTyHnyo7xdydj01rhqlOC78UxE0DbjOJFa+T1sdB7TbE57wke+s0+c?=
 =?us-ascii?Q?dt5i8FjIMm+PgSigfdY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:51:53.7125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e9fc99-f74e-4a72-8e3f-08de21c058ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
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

Hello,

This series adds virtio-gpu userptr support to enable ROCm/OpenCL native
context for compute workloads. The userptr feature allows the host to
directly access guest userspace memory without memcpy overhead, which is
essential for GPU compute performance.

The userptr implementation provides buffer-based zero-copy memory access
rather than SVM (Shared Virtual Memory). This approach pins guest userspace
pages and exposes them to the host via scatter-gather tables, enabling
efficient compute operations while maintaining memory safety.

Key features:
- Zero-copy memory access between guest userspace and host GPU
- Read-only and read-write userptr support
- Runtime feature detection via VIRTGPU_PARAM_RESOURCE_USERPTR
- HSAKMT context support for ROCm/HSA stack integration
- Proper page lifecycle management with FOLL_LONGTERM pinning

Patches overview:
1. Add HSAKMT context capset for compute workloads
2. Add virtio-gpu API definitions for userptr blob resources
3. Extend DRM UAPI with comprehensive userptr support
4. Add feature probing and capability advertisement
5. Implement core userptr functionality with page management
6. Integrate userptr into blob resource creation path

V3 improvements over V2:
- Simplified implementation by removing interval tree management
- Better patch organization with clear functional separation
- Improved UAPI documentation with detailed field descriptions
- Enhanced error handling and resource cleanup
- Removed complex resource deduplication logic for maintainability
- Added runtime feature detection parameter
- Fixed memory management issues and improved code quality

Performance: In popular compute benchmarks, this implementation achieves
approximately 70% efficiency compared to bare metal OpenCL performance on
AMD V2000 hardware, achieves 92% efficiency on AMD W7900 hardware.

Testing: Verified with ROCm stack and OpenCL applications in VIRTIO virtualized
environments.
- Full OPENCL CTS tests passed on ROCm 5.7.0 in V2000 platform.
- Near 70% percentage of OPENCL CTS tests passed on ROCm 7.0 W7900 platform.
- 50% HIP catch tests passed on ROCm 7.0 W7900 platform.
- Some AI applications enabled on ROCm 7.0 W7900 platform.


V3 changes:
    - Split into focused patches for easier review
    - Removed complex interval tree userptr management 
    - Simplified resource creation without deduplication
    - Added VIRTGPU_PARAM_RESOURCE_USERPTR for feature detection
    - Improved UAPI documentation and error handling
    - Enhanced code quality with proper cleanup paths
    - Removed MMU notifier dependencies for simplicity
    - Fixed resource lifecycle management issues

Honglei Huang (6):
  virtio-gpu api: add HSAKMT context
  virtio-gpu api: add blob userptr resource
  drm/virtgpu api: add blob userptr resource
  drm/virtio: implement userptr: probe for the feature
  drm/virtio: implement userptr support for zero-copy memory access
  drm/virtio: advertise base userptr feature to userspace

 drivers/gpu/drm/virtio/Makefile          |   3 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  34 ++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  14 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   8 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |   7 +-
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h           |  10 +
 include/uapi/linux/virtio_gpu.h          |   7 +
 10 files changed, 310 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

-- 
2.34.1

