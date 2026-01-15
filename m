Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F42D22F87
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1410E6E8;
	Thu, 15 Jan 2026 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yg5gFf+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBF110E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAtySSJy8MeDQWBijrzps59qlI7+cXQRq+jBEoSV2d3GrySI0VOnfQBBhtQmuydOTZyx0Y9fMMuZZVxy3yFvvP7GemCwKID3hazh/ITlRI5npLkUE8J2AUiph8Zze0zAo7itVPGluwBP5zjR+Eb8nG/zmlbOMaqj/eGPr/AaKv+YQyhKYkS4jaqvJXYjpSyTTdEz86BdASezBDv0kxwl/pkXLA5qVM/oG6lm1VCUZDgDlK7qOv+2B4N3Fg9JhnlliHNn1PORkFkoiSIS04V5380NdspfIUKk9JnjmtH8aw0ly2STja+jOGiFWLX6sdkZds3m6DT8o+JuEjDRjWvGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1N9dN5//qjChI8ChPEys2xZvHlmy6W3R2NnUmEMqNY=;
 b=f3onQRkTGlZPEihQwz8qp/PX3hdFBj4dq3X6FymU/lNInTq+aOE00WMsc03XRrzoZnOR0bx1bDU52oK/f8WaLu5+9Ia7rPSxoP4VH84q0ezaha+f8rSBn+tX7vBY2iiG+5LKVmfGE8vHNXFyvqVVbKpAGfO84eI36qg3Uhpyf1T64xmyI5q2qJR1GYlexTetQqyozD8W7xUfTPBi6jYvSyPjnw30sqdYjR0r7+WuDB/Q8FgWVjFtK1tbx98edtzVuNpJfbNqZAXTv1rmGpP4UZhM/st5WzExdSAqFoIJnVrP7fEiOenEWbfwRrZ91Wg4n0mJY5OCByKW/F0uZlpatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1N9dN5//qjChI8ChPEys2xZvHlmy6W3R2NnUmEMqNY=;
 b=yg5gFf+GrJpwx4wsSEh5v3nHydP9sXhjdlap8WlQCJZ/rYqMJJm8Yw8Svam20gWwf8Zw0FTt8HQPC+5fRHV4M5zi98ccUV9JqTRgepj3srKWrdhFltzBAmFLMzGYrKujLVyxneyergdPbMJGzSaTh2PoF8maftSYaDKh80Xt6rY=
Received: from BLAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:335::24)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:59:14 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::3a) by BLAPR05CA0041.outlook.office365.com
 (2603:10b6:208:335::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 07:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 07:59:14 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:11 -0600
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
Subject: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute workloads
Date: Thu, 15 Jan 2026 15:58:46 +0800
Message-ID: <20260115075851.173318-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DS0PR12MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edf8c63-a0ee-4c53-5224-08de540bf9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0/356FSm+DtFeRUWtBsEQXkEGRxjmFL7VGukdF0jpuEWXntwlWxIYijBb8c/?=
 =?us-ascii?Q?ATQZUzHha5xN2wssvQi6/v0yGtDWyo041eSgnEVjBQzyhVh+Fs2FR1cCT5FW?=
 =?us-ascii?Q?zYQr/8f6TPHpY/yuVfOvb6hD93pClB0BI2sEJhMa3szcRNgyC0Voa8gMtNiC?=
 =?us-ascii?Q?bLzIwVUx9bFH1hOEBc7vter93Y9ZTkR55Jq+IQWXwt77+CpQCKHNZO7TmRMt?=
 =?us-ascii?Q?Oai/VVIsu0pbBoQTk2/qgyaUk0x1DCK7ZN6rK/K7aiRC0eQLJYGTWlI9XKyS?=
 =?us-ascii?Q?DRgAmmxePym9KTbr7sqo/h1G5iTVXjP7SWVbs3t7VQubHyKd7reiA5c7AdfL?=
 =?us-ascii?Q?WjlnqRZH2tZjbamdP5ZMAikJvfqhDZ9NMcYqDikmsLdZJW/VA1oRu/kwFrKR?=
 =?us-ascii?Q?QMq9nuAMRKmRhNWQzWXEyXa1n3zSDAKvQm/KovUu9lqH5K5QS97oCDrh3GfT?=
 =?us-ascii?Q?TWz/2XCTvkqjG9mI1UuqKcl0Wue5cKkn6c0LvNP1ZldV75Lf5RIWDvYERrCF?=
 =?us-ascii?Q?CPC+QLq5Pzx1sT2f1zPoTO4Ysv57XTggnZ8dcDdBv7VLvJCUWDIecrLt8t3r?=
 =?us-ascii?Q?sjtaUpMJ31IR33yHaYl9QoLxUzUhU+G/XorSvjKcP+LFYDGTENHyvKAFYdSN?=
 =?us-ascii?Q?ohap7a0748ugsQPgc1JmzCxYX/xm1bXzbB+v26m8plnss5fATUCCAwO+kUkc?=
 =?us-ascii?Q?xfxh5Lx2vwLd+RfNmGMoixvE0fF5hpPdVngFBt3KtvfDMFVUiTg7VwobllXx?=
 =?us-ascii?Q?TiUNSS0Ppkbiq6x6EBDp1kZPb8YjrJPV0sdKYxEqzMHCp1Shlqz8wkAX9nmw?=
 =?us-ascii?Q?1zf+vRm6QWMRFdYFwZJy93+3jnhOUxeNmChIPvAe9SlWveT4cWpuUlbWf/Vb?=
 =?us-ascii?Q?GhVjTarOzKmxsmEwXhngouZhBoZSByvR59oSOxheAejg5Sd7muSLoFR4uwiM?=
 =?us-ascii?Q?nxHXpgM61UxLgMOtPwkJodCVsP/J/AgA/E4L+fcFOQNgiGfkT37IWXUaxT80?=
 =?us-ascii?Q?vrZ++dbD8Xs77kX57jPxF/VGXQYhan7RoVYIgs+lZEzQPFREUEJgZJyJEsoy?=
 =?us-ascii?Q?ql1XfYy0HMpMHneS8Bkd8BGk3SRifv3ZEKy9Lp3qtfs4/COBGyk243KfTAr6?=
 =?us-ascii?Q?hwihjs+I0qHa2rA6HTSJ8GD5/rlSHZ4xy5CkU2WLmKnTAEoHPReorUpL1EMI?=
 =?us-ascii?Q?YUP/M+qyBCDqAvDvrbZkok6V0S1AJhv2c9UM1ALkUa3qxBf9zm45RUsm8RIr?=
 =?us-ascii?Q?h2cZkiD4LYWVEa1JZV5PHPQNdhbYj+9DTBPuyhhOoCLBKk9WzDoZUEepOBUh?=
 =?us-ascii?Q?fxjpIa8FPNGEh7lREPKpnAmR3BOr2shlY+0zF7tTUq7+m2hb+UgZTeKgzHmb?=
 =?us-ascii?Q?xHgxeN0K7EBM6sKxWx7VNO5OCQOyiKhxYCGnDtygfJM8iXdNMI9ZPs1Ruy13?=
 =?us-ascii?Q?9CBwEARQRadvee5FF3QUoIV4y15Muo+9CvbnZaoeA0YernqikF5/StpK58aZ?=
 =?us-ascii?Q?ni0cc8U/CpK9zkEJLoMzWZMm24vDAAbGIU1ATMAAcGQVc9VZcRn9y6re7kVg?=
 =?us-ascii?Q?wYNq2fqryrIL7g3MeUDusliW7nbTZawbzn21bNAZ8n0Aod/VszX+1BmcuJeC?=
 =?us-ascii?Q?37FFnPXBdwKjHdWcEP5lOIgu45IsfJTsoLLsJUDM9RfQq5UBNOuSsEVw2GIg?=
 =?us-ascii?Q?6fYAnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:14.6421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edf8c63-a0ee-4c53-5224-08de540bf9e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725
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
- Runtime feature detection via VIRTGPU_PARAM_RESOURCE_USERPTR
- ROCm capset support for ROCm stack integration
- Proper page lifecycle management with FOLL_LONGTERM pinning

Patches overview:
1. Add VIRTIO_GPU_CAPSET_ROCM capability for compute workloads
2. Add virtio-gpu API definitions for userptr blob resources
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
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   9 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |   6 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h           |   9 +
 include/uapi/linux/virtio_gpu.h          |   7 +
 7 files changed, 295 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

-- 
2.34.1

