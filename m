Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F147DC14
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126D310E127;
	Thu, 23 Dec 2021 00:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A510E125;
 Thu, 23 Dec 2021 00:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ/Ijojn3MINV2cgH9nkMlUJU6t0+Lh+b7b/fq8v0bzLj87HZ8rDJ9OxHDZZVB+n5qo9quccKM4SopxUpci1y2THbg9KcGedPzL6Vb4IJINvtuhu7vrGXh5dur6HR3XAkd2+K5CCFNlclb6freZSiZzWgQ3FbPogJSugShpexQ5/sn6JKjUGi3BjbEqtKsjHoaAD53iY6CBX0nLSXFVx1un7Ob/nRSuk1idu6KabIt09wgGpKutvqpBIq8qHNmWIj+YU52Kt4JnOhhycJWJxCiuzX3AXRB0yi5M7++v+DOiOjz+q+/1/eHj6Z5wpzIsEa8wu/grhc3wCgFxXHvvMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6McupS8kxodcg04lsoGipCUfh+ApS16Wf8EW5EskkSg=;
 b=Y0+VdBXWtQ1zp4JukF2IpPnoTfjHA+0SejnR1xQCxBdBiPSOF6BkJydy0MMse90PskhYfiDR5t1KkkVJYzQCU1TETN+uwrmjzBjFVuXBeI0Z7bo5WUUJDDORnOptBYu9AAo9wyQz5J5MtVOq1uIjwNTAyQzR+P9iuT80nW6F/BRYKcwgyvgbsLE3OwsSYQ6/PLLS/v223CQke9j5jmFL5ZfS5uLdQNtlYlAsyPo50hsyNKxl0uS3785aIFQWHptatz07p38jVdQsbF6AlzEl6bYjWq7uorUaUpybmnk0zr67edxQmhXtuRWQl9hCyd8uqMVWcbxctKxvppzHePFv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6McupS8kxodcg04lsoGipCUfh+ApS16Wf8EW5EskkSg=;
 b=saOwuVzUfbqf6AZ5BBbk1eMcSsnssoqoJkTNb16o2j1R9+hoo5t+C7bG7dQPUATsmfKBuzIxcW/TOSZ3Me5apfRv9up30Z93uAElJ2tKTB3X/Hcjpepv1EoHDRaSyOqc4KaQPEqwN7Cad2OmKhZn96fzBhufjTxIF/I4hrf9dVM=
Received: from BN0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:408:e8::17)
 by DM6PR12MB4281.namprd12.prod.outlook.com (2603:10b6:5:21e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 00:37:24 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::f2) by BN0PR04CA0042.outlook.office365.com
 (2603:10b6:408:e8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:24 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:23 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 00/24] CHECKPOINT RESTORE WITH ROCm
Date: Wed, 22 Dec 2021 19:36:47 -0500
Message-ID: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e833fd23-7245-4d6a-37d6-08d9c5ac6377
X-MS-TrafficTypeDiagnostic: DM6PR12MB4281:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB428123E7C86EC15B8FBFBBD1FE7E9@DM6PR12MB4281.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbfxSDHXMVETay38UA/kM0oM0Bj0XJJAioeTBHWRO+YUnpdZ+iI6CeUwxMk/ZUreyo/M6ae2TM42UHnxDDt+Khcrv+8RoWfH2hHF8EeSq+1jdTKwjmXBGYYJcB83fQcgJVGIM+fQlbNaXumFXmcIwk3ReqIOOVOWdKR52KmaJfVcV+ETJ4H+OE/X3Fhj7MdQ/cpiBzL1OOZuDCE+0hRaDkuElk4/SAxD21tJNxyoqTrBwBwEu+oGfgfcwDK4dka4vz5JpBzOcz4xibGbV7RU3VxbZX0i3oCNdJEnv+QvJahHkHHq+z3+HojD+QTU9J53rN8xwmiaSYr4/kctiGDIJ+12cqv26oLCt1Uu8Lu77EpOLeOXXSAtoBSg9JtONREDy6HHV50uibKOx1bjJi8LZN+HGH0SYdrjfEHL77NbKhON6HSE3wnbOeVRkhQWY6M58DmpZBlHs3e8PDbT0BB020H6xxxwh6yugwIwW9Zy8xNGs7f0yQ5aKkF775/mD3ylPEMOC6FLvPthReHZbHEDYHzOTMLitwDe5G6n/S/v3XNzMFP7JfbKbCfq0qU7PeF60kW9ndEt6b/mIDpWHCN1go5PLGZFcEHTR/broo19tek8tXdX6R1K/hHYCITsDqVK6MQZNNAMnvz48bIU9FJml7zbpdfBqdf5HI/aVXtMMIjv/D6fXiuF5fJoQTSPQtiUcuT0d3cskdEq/3TPf1sUmbHY///ogoV0dyrPTWlhniUW/cxQPONWPh7MMr19S3GtcZg7LLtGyWpcOAvSI2rF2PhQqt7vjq6fZ4c6hkOJV9895yKxfIgcV2HK76ET0gHG5EMI/XBCxj3JFa+6DMjEXu6mjonjjZT83fWT5+6fGSYSVtKacYJ8VmzBMz+3LVbo
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(47076005)(8676002)(6666004)(7696005)(316002)(356005)(81166007)(508600001)(4326008)(2906002)(110136005)(5660300002)(36756003)(54906003)(336012)(44832011)(1076003)(16526019)(83380400001)(40460700001)(966005)(186003)(26005)(2616005)(70586007)(82310400004)(426003)(86362001)(8936002)(70206006)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:24.2971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e833fd23-7245-4d6a-37d6-08d9c5ac6377
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CRIU is a user space tool which is very popular for container live
migration in datacentres. It can checkpoint a running application, save
its complete state, memory contents and all system resources to images
on disk which can be migrated to another m achine and restored later.
More information on CRIU can be found at https://criu.org/Main_Page

CRIU currently does not support Checkpoint / Restore with applications
that have devices files open so it cannot perform checkpoint and restore
on GPU devices which are very complex and have their own VRAM managed
privately. CRIU, however can support external devices by using a plugin
architecture. We feel that we are getting close to finalizing our IOCTL
APIs which were again changed since V3 for an improved modular design.

Our changes to CRIU user space  are can be obtained from here:
https://github.com/RadeonOpenCompute/criu/tree/amdgpu_rfc-211222

We have tested the following scenarios:
 - Checkpoint / Restore of a Pytorch (BERT) workload
 - kfdtests with queues and events
 - Gfx9 and Gfx10 based multi GPU test systems 
 - On baremetal and inside a docker container
 - Restoring on a different system

V1: Initial
V2: Addressed review comments
V3: Rebased on latest amd-staging-drm-next (5.15 based)
v4: New API design and basic support for SVM, however there is an
outstanding issue with SVM restore which is currently under debug and
hopefully that won't impact the ioctl APIs as SVMs are treated as
private data hidden from user space like queues and events with the new
approch.


David Yat Sin (9):
  drm/amdkfd: CRIU Implement KFD unpause operation
  drm/amdkfd: CRIU add queues support
  drm/amdkfd: CRIU restore queue ids
  drm/amdkfd: CRIU restore sdma id for queues
  drm/amdkfd: CRIU restore queue doorbell id
  drm/amdkfd: CRIU checkpoint and restore queue mqds
  drm/amdkfd: CRIU checkpoint and restore queue control stack
  drm/amdkfd: CRIU checkpoint and restore events
  drm/amdkfd: CRIU implement gpu_id remapping

Rajneesh Bhardwaj (15):
  x86/configs: CRIU update debug rock defconfig
  x86/configs: Add rock-rel_defconfig for amd-feature-criu branch
  drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
  drm/amdkfd: CRIU Implement KFD process_info ioctl
  drm/amdkfd: CRIU Implement KFD checkpoint ioctl
  drm/amdkfd: CRIU Implement KFD restore ioctl
  drm/amdkfd: CRIU Implement KFD resume ioctl
  drm/amdkfd: CRIU export BOs as prime dmabuf objects
  drm/amdkfd: CRIU checkpoint and restore xnack mode
  drm/amdkfd: CRIU allow external mm for svm ranges
  drm/amdkfd: use user_gpu_id for svm ranges
  drm/amdkfd: CRIU Discover svm ranges
  drm/amdkfd: CRIU Save Shared Virtual Memory ranges
  drm/amdkfd: CRIU prepare for svm resume
  drm/amdkfd: CRIU resume shared virtual memory ranges

 arch/x86/configs/rock-dbg_defconfig           |   53 +-
 arch/x86/configs/rock-rel_defconfig           | 4927 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    6 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 1453 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  185 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  313 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   14 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |   72 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |   74 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |   89 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |   81 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  166 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   86 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |  377 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  326 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |   39 +
 include/uapi/linux/kfd_ioctl.h                |   79 +-
 22 files changed, 8099 insertions(+), 334 deletions(-)
 create mode 100644 arch/x86/configs/rock-rel_defconfig

-- 
2.17.1

