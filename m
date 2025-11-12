Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E4C50FD4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A82910E6CD;
	Wed, 12 Nov 2025 07:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ncP08JMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814510E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReF0VxAoNo0gXmTF09ShtZ2HTAvJan7StMZd6CPjghR8yQ0ACkYccPjRH46TlGEhh1K425VTh/psgVswK5/9rc6ExdmnoEegRZzrtfoZqVeamb/cD7sI+06iptoSIIqShtqWboyGcrlY1EAALQQWpCZj3uMiK+ki0497pfGk5rSplav1Zr77nXGwg1iQkY9LtD7JpUmqhBV7Ykdf08CfqcYu9kzEfgEXVVIEGdQ0H0/yd3VVvSz98so4bOLIMdR/LsgsnVlkpjFADuhQx4SlE3h5W845tNLRwFCNru27QT4Fj+xzU2hGYpHmrGiIMIqSQbP+HQPu4ABTiBWObjiz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/3WPXVEv5oQYVYVvngG0UqXbJBNDxv4tPEig/EbZp4=;
 b=KjWmrYmAYCzwy3+rBiRCZvT1sSEbiseiGCg/zqP5L0CqnmtaH6zbkSqiXJmON3LNG+Bzf2gBKpLzyT8hMomeWcMrZXdgOOHGuOjFt7/aUKW8BMMX8ylLMIQKxAI3NOd2K0M1Rg2y+vVGupZTqN0McRW59XulYSTyu4mBh0L3j8sNotR9OmNWmKqvgQ9gFCFMwkdSeqPmwNc16LbGN72MKLDNW6lpQoudlNseUQMKWik7uuhbMDNNy7tVKH81c+pB42vjwe6qE5yiBeS0Vp+aTZA/647tGf7wEWBQtDHaWHlTu2QKbLDgNM3xa0HZxoaelOJ/2WhyJXgywsdKMUVmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/3WPXVEv5oQYVYVvngG0UqXbJBNDxv4tPEig/EbZp4=;
 b=ncP08JMDCzlARoj8Rz8yQtfqIp39eypdjuOxGQnIJei2sLovR710aNokglfuYRTVZu/LtDowl1VQ4WaPMWRLoTcigKEEHfuRM5i3V9SwwJXCHuYgBzRnOxJMbOz/vyvDG52EAICvCUf9FN5XAFtMqsda01Dpe1j70+xOG6k2KCQ=
Received: from PH0PR07CA0050.namprd07.prod.outlook.com (2603:10b6:510:e::25)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 07:46:09 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::31) by PH0PR07CA0050.outlook.office365.com
 (2603:10b6:510:e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 07:46:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:08 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:02 -0800
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
Subject: 
Date: Wed, 12 Nov 2025 15:45:42 +0800
Message-ID: <20251112074548.3718563-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 993251a6-9bba-413f-dedc-08de21bf8af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+wbXPWSNxCVVkzpyNaZyoDEzNB0sNZt9S2jW6YqAqkth9aB0jGfw5EypRM1g?=
 =?us-ascii?Q?8LcRezQRPyp84M4ttbOTmTyc6OK+n5SQxbJ7LTTaV2gt+h3m1f6009f97eyH?=
 =?us-ascii?Q?Jzi3xgyLadd0Og4O7l877BkYRGv7QXsOwCZV9T77JHggafoa6gnn3CLWEHrP?=
 =?us-ascii?Q?K3aEuqVXvmitvowkx0iMos5O/04I4DCyWKpo//MdgF7U8+w4lqYd+8BmjO8K?=
 =?us-ascii?Q?cVPdt7KOTwi76yFdB6rxLwzck1zOjfAPEkgLRmkHV1svqQtRYSs9edeSucdL?=
 =?us-ascii?Q?KYadX0ltwZDGDMVgR0ek58UJZqPGuPnx00OLWfcADnzf4md/iGo5LXkSQcAe?=
 =?us-ascii?Q?E5oF9HGqUu8kf7r9nvL0URkxY08EyFDzaoMoAjNpqtrI91Vy/RmctvpK9Xoq?=
 =?us-ascii?Q?UNE6EQBta/iP6pu7t9HgSyvbVDgFBHucMLVj3DF+hhzkdKD6mZcACltDNEQ0?=
 =?us-ascii?Q?81TJXU2M5rJci6nyZplQuSTXdPoEBxiF3f3wTCSFu2VXUaxPnuD7tA1kwPN6?=
 =?us-ascii?Q?VqPKYDc52cXN74f+j96BtHy7nLH0fe1xxA1LYxu5sbZ/YrYEd46jMaIomlyI?=
 =?us-ascii?Q?UD2tNeC01RJluT6kUj2rZMQtAVRWZjQc1zWownYO2dQXGNJK3lBxwIQP6Ric?=
 =?us-ascii?Q?O42gwkyHwuqpFazN7bq+jGJajkiNnCqh5C18VnjILrOOuwQ22dkA2Klf0u3r?=
 =?us-ascii?Q?gfBB0lrZ4HwatQurwlIlMWk5OVraErxxFtjlVg3UIC2ItoLNhR6avnY8fonh?=
 =?us-ascii?Q?hWM6n4wPWaSTLXbcVwXA7SUMw3oWdbaFSEXM3hMr+5oMcFb3EPH+buji2H51?=
 =?us-ascii?Q?rqjoY3tHgdSOL/UBFIzJ78NiFvsrrspXXqlsj4vCUY/DlbvM2X/W3BZ59aqK?=
 =?us-ascii?Q?2KKB7/tts+JCwLZRlmDQk4olhe0EmJkQaOAF51IgOXbTSN+Eb7I6g6BG+Vpd?=
 =?us-ascii?Q?GLYbTh3oIVVcZvy/K7oCRLGGA1cwqtXO08FDyw/1A/id8OLXZPxlQLdN++Ts?=
 =?us-ascii?Q?h0Biao9/HpZFE+e0A7YADgMpnf/IOwA2gAJ7LaS3rcT7bTRQMVgX+o1KaeJx?=
 =?us-ascii?Q?crAOkm1uf9+G06ysc9Sq/ejV7wEoWaEbMebFs/Zg5w08SfZ4ykIlRejxRHWs?=
 =?us-ascii?Q?+4t+EtDhghRSkHCzFktMx5ZvavRGT5Ueach/A2L8JKtJi3goqLzMgFRIUi8D?=
 =?us-ascii?Q?gB6GJZTO7v8pT+sPO0LcPH3KnhaQXVoEHHWZmbJKShPZRImaPpUKTJ878aru?=
 =?us-ascii?Q?UWqBrG4tU1qAZv5Ci9GmqjbNQsmBJMv+/MWBNAxYNNdrTF8HpMTJFzZfgN+w?=
 =?us-ascii?Q?PIcGg59V3fRB55UHrMq2HHf2tDq1jv4XU6LuJ8ZjTKUznEqVfMZpbokpnibM?=
 =?us-ascii?Q?WIsQPfim46MPzxyzdmtP/6xxb4Kt6c3m51gZ1hjYd1TPH9/LbDDbLwDes+8A?=
 =?us-ascii?Q?BjpqyhzvyEw3GTU38n/g1JjlZRB/AgCCUTptVVsWmyYdML1fgqWEBKieRsFI?=
 =?us-ascii?Q?BL6zkWH3i0ugsJJGFob2OfXplWOFybxLXHm0aIi5QQVVR5p6i76LB8Dlbfw/?=
 =?us-ascii?Q?tUG2QAf17yqBZQwTuPg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:08.6398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 993251a6-9bba-413f-dedc-08de21bf8af9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002
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

Subject: [PATCH v3 0/6] virtio-gpu: Add userptr support for compute workloads

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

