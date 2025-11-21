Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F392DC78652
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F58210E80A;
	Fri, 21 Nov 2025 10:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b8GGj5QU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013032.outbound.protection.outlook.com
 [40.107.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00E10E80A;
 Fri, 21 Nov 2025 10:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ/Pwb89uwfWXtZRoUhUBbjDaAmWtuxystYeJk7XIOJ06EGTqThzh48p87RxBDfyRdPu+vf6ludiaf9zwnwW1y076dWzX3ugkBH0AsgcX6RDj5U4qtP3Btjz+G1eNXwdl/7A1ls14q/YS6X3NcF/fzTtabCBtxBgaatvMfALSj+2Fn/r8KvsgDsbhU6iwd7b4jzgIfbD97bxUZrAxzIVNOPWAxZqf7YshMNGkzG05y7ihoxHYZ7Of95zdGsN0YhRks1ASHqD1LaxKhtkgZ9xmZiO51IISluChSBFwp6V8xiTMnpXPbePmoR1DbnY7dpf4nNF4e1DUBPowQcvs71ZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ti2X8OKZMN3PWx7PBO85DE8vYBsMmapKXvKyrVJ74w=;
 b=XmcmLecsEGIPaOQvP2dgX/CHUn4elsN0TiFqZ8+dO2vqrl00TM5+N8KERz+s1z5Qy0XIiiG2kAnXeERU/YLfRjTihX5eKXkpLCON/pggjrpUn2dnq8uqUQVIMXnuv+w7HUeLnMB+e1isjO6XXqCGDKphJY4hXxdoXilTJyXPdVLu/7M7CqSFu3OduhL/QAYnOVzeeifScevlQqKZgP9AAJuYa2sCY4Q4IqIqfm/abl7SsKjbqJZ7pHAXmL+JVX3n6Ta/phx+z6AUFG8TasYI19J2LElciz2DtnRYW7t2Ljjh+lA+ln6gVAxuihrfpMrvulYtAavCEhVILammRIYdHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ti2X8OKZMN3PWx7PBO85DE8vYBsMmapKXvKyrVJ74w=;
 b=b8GGj5QUOa9LIJRpsmWT++QNszV43cwRk8PJXXlTY+JNmSNHo27NfOUxBTE2PUE/tdAc5aMFpaeLWRwyZg1F0rQWDmtp6sy75LkR71L0aNIMkxd+pBPyv/fpqN5v2gd1UCe1m0sy5Qbq41FokDoc8pjRHs80CWuD8aWRKzTsmYI=
Received: from MN2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:208:1a0::18)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:13:55 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::e0) by MN2PR07CA0008.outlook.office365.com
 (2603:10b6:208:1a0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:13:54 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:13:48 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 01/28] drm/amdgpu: give each kernel job a unique id
Date: Fri, 21 Nov 2025 11:12:11 +0100
Message-ID: <20251121101315.3585-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd90008-eee1-4513-ab29-08de28e6ad22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nvl0lgyKiDaJHFMpRxpRmCQQi4q9QPbXLrhAKeYv8zkR6dJ9Fwaktd8Mz/V9?=
 =?us-ascii?Q?ZiIp/AHLojV1ZgBExLeZHd++O52VtutEcVupEp2ulVJZpU6KK0IpLBlZcV+n?=
 =?us-ascii?Q?EwPXUurbF0O0zZmXW2W/yB/aQJ9KZNzGzDPj4oepE0Tf0A/KiLa/7hMu8eEB?=
 =?us-ascii?Q?0+kaIpCDJuWOhqBO+dXHdrKlTnq2IS6iQXWe0TzBbEWeTcelFZcS6iw09oI9?=
 =?us-ascii?Q?EY76paTIJQ2KZi6swdegHhwmughgfuLk7uBaOI8VbbLTVXOzAh3MGbHcLTfY?=
 =?us-ascii?Q?HIZC8u+RHB/xzSVVfnRDRbB5afpR9BJ3LheoEt8pZ1ilwAvBZHQkWaf48NSP?=
 =?us-ascii?Q?WyM0xoCeowW1qcY5ht613bbo4/Qr17B7CqQXna0E4KmGfH3uajjcZFIB6qOf?=
 =?us-ascii?Q?eMmL5QFBxTnvsSVrGIs8hB3PrebYoTQEB01swV5mntU9jh9Wh9hu283QAPzf?=
 =?us-ascii?Q?Qwl5eknmZaQTNSYxj38/dn5+MC3zUX6BDHci01F2nAy5KUi6RURaJ9uEFbzy?=
 =?us-ascii?Q?443u702MjTIqNqaTvm2V3Y0ORjRXBUcxRKtIR8gMpK4hWQb2KvfYsplWCK1K?=
 =?us-ascii?Q?/GzFNomqslrnnD2rXQBn95KbuvHkuIjJe+Rzvy14hby0+7yMjw1uJfcxM5Su?=
 =?us-ascii?Q?y/5YooEpy43DGP5x7TmfnFtxvHHParWcsSDL7qPEmEoCZHVB9w7IZ9r3+9YL?=
 =?us-ascii?Q?aDw7LmvqJSuRQvnf4F7/a8s6ODWBvuYa1vJEx/gc0HiO2atDO1ETiUjBkt9J?=
 =?us-ascii?Q?geuulh62+Xln89+RgKwythiM/g/XvPr9C2LcMzWEJmdKDJGY/a4z0kPxQMlz?=
 =?us-ascii?Q?eolIty5r0yvbXxbR3k+S6N2+dtfcrqrhH6avV1QSjE6tU6bvJ3KEU6vN2XFl?=
 =?us-ascii?Q?eK01tiBmAkSpE/V73ieBV4tP77TTG/69GqncX3rSBhzUzLszh/EmLd54Lnqv?=
 =?us-ascii?Q?44WaIk7yGVv5VnXALXrI0CfvbFMq0DDMkhiVuB2qoxdO1yA98qWevxdlRx9N?=
 =?us-ascii?Q?tXElJ8RuboU8Mb+8E4DXqka76B1fDNYQ0ESpPEhQYy03n2fdH6IRI/31+xz7?=
 =?us-ascii?Q?fxk5yGJKSvob7AA3sCO6p/9qYw2SrE5UUVtZAQn+0U44+bFxvdfRYGbxHM/O?=
 =?us-ascii?Q?Uy5y9gJ5XZeHDm5jwoeOFhMag9cKCYqRWCp9Vo4SoPzI4vYw8hNo+2lG5gd6?=
 =?us-ascii?Q?dZB2kvG0w85uMVExi/cT3pr7KCBDABQhtGTyxS1eAboQTBPT/kuVBUV9iO/W?=
 =?us-ascii?Q?xVBvHukRofFA7RVE2BETbsTIeY1OT1YePDbVyAOZ685A9jizD/tSP+Djiv4d?=
 =?us-ascii?Q?pQVhnHfXnyO53YRckFaUis+flqvjoPQf2oYlkw269oazUVHC5qLxArXsU03n?=
 =?us-ascii?Q?M0OhNiw10MVj3qqZbUoQ1BPCxR34aQCCM8TTAXAb2Nn0CWiCNbySN3rXoxMj?=
 =?us-ascii?Q?aBL867jUa/hQ7YQ+Di2wN7i1WXD9Wt91cH4DK65s7Ez56M5hmVQfNfuThyM0?=
 =?us-ascii?Q?4/+c6o95iJ/XfmlRYRn7/RCPXIOhA7oZ5YSR4c6xfW+Q7AFN2KtoQspxJBWx?=
 =?us-ascii?Q?zswVltHTk1ZKVKYlRlJLTwb1HBbxfwkZ4E+pCgxA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:13:54.5104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd90008-eee1-4513-ab29-08de28e6ad22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853
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

Userspace jobs have drm_file.client_id as a unique identifier
as job's owners. For kernel jobs, we can allocate arbitrary
values - the risk of overlap with userspace ids is small (given
that it's a u64 value).
In the unlikely case the overlap happens, it'll only impact
trace events.

Since this ID is traced in the gpu_scheduler trace events, this
allows to determine the source of each job sent to the hardware.

To make grepping easier, the IDs are defined as they will appear
in the trace output.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
 19 files changed, 84 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 5a1904b0b064..1ffbd416a8ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -1551,7 +1551,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
 	owner = (void *)(unsigned long)atomic_inc_return(&counter);
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
-				     64, 0, &job);
+				     64, 0, &job,
+				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
 	if (r)
 		goto err;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 0017bd10d452..ea8ec160b98a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
 	if (r)
 		goto error_alloc;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index efa3281145f6..b284bd8021df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -232,11 +232,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 			     struct drm_sched_entity *entity, void *owner,
 			     size_t size, enum amdgpu_ib_pool_type pool_type,
-			     struct amdgpu_job **job)
+			     struct amdgpu_job **job, u64 k_job_id)
 {
 	int r;
 
-	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
+	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
+			     k_job_id);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index d25f1fcf0242..7abf069d17d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -44,6 +44,22 @@
 struct amdgpu_fence;
 enum amdgpu_ib_pool_type;
 
+/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
+#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
+#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
+#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
+#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
+#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
+#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
+#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
+#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
+#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
+#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
+#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
+#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
+#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
+#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
+
 struct amdgpu_job {
 	struct drm_sched_job    base;
 	struct amdgpu_vm	*vm;
@@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 			     struct drm_sched_entity *entity, void *owner,
 			     size_t size, enum amdgpu_ib_pool_type pool_type,
-			     struct amdgpu_job **job);
+			     struct amdgpu_job **job,
+			     u64 k_job_id);
 void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
 void amdgpu_job_free_resources(struct amdgpu_job *job);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 91678621f1ff..63ee6ba6a931 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
 	int i, r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+				     AMDGPU_IB_POOL_DIRECT, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 24ebba43a469..926a3f09a776 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
+	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
+			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 04a79ef05f90..6a1434391fb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -226,7 +226,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
-				     AMDGPU_IB_POOL_DELAYED, &job);
+				     AMDGPU_IB_POOL_DELAYED, &job,
+				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
 	if (r)
 		return r;
 
@@ -398,7 +399,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 		struct dma_fence *wipe_fence = NULL;
 
 		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
-				       false);
+				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -1480,7 +1481,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
-				     &job);
+				     &job,
+				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
 	if (r)
 		goto out;
 
@@ -2204,7 +2206,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 				  struct dma_resv *resv,
 				  bool vm_needs_flush,
 				  struct amdgpu_job **job,
-				  bool delayed)
+				  bool delayed, u64 k_job_id)
 {
 	enum amdgpu_ib_pool_type pool = direct_submit ?
 		AMDGPU_IB_POOL_DIRECT :
@@ -2214,7 +2216,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 						    &adev->mman.high_pr;
 	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
-				     num_dw * 4, pool, job);
+				     num_dw * 4, pool, job, k_job_id);
 	if (r)
 		return r;
 
@@ -2254,7 +2256,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
 	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
-				   resv, vm_needs_flush, &job, false);
+				   resv, vm_needs_flush, &job, false,
+				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
 		return r;
 
@@ -2289,7 +2292,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 			       uint64_t dst_addr, uint32_t byte_count,
 			       struct dma_resv *resv,
 			       struct dma_fence **fence,
-			       bool vm_needs_flush, bool delayed)
+			       bool vm_needs_flush, bool delayed,
+			       u64 k_job_id)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned int num_loops, num_dw;
@@ -2302,7 +2306,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
 	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
-				   &job, delayed);
+				   &job, delayed, k_job_id);
 	if (r)
 		return r;
 
@@ -2372,7 +2376,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			goto err;
 
 		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
-					&next, true, true);
+					&next, true, true,
+					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
 			goto err;
 
@@ -2391,7 +2396,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
 			struct dma_fence **f,
-			bool delayed)
+			bool delayed,
+			u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
@@ -2421,7 +2427,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			goto error;
 
 		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
-					&next, true, delayed);
+					&next, true, delayed, k_job_id);
 		if (r)
 			goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 054d48823d5f..577ee04ce0bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
 			struct dma_fence **fence,
-			bool delayed);
+			bool delayed,
+			u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 74758b5ffc6c..5c38f0d30c87 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     64, direct ? AMDGPU_IB_POOL_DIRECT :
-				     AMDGPU_IB_POOL_DELAYED, &job);
+				     AMDGPU_IB_POOL_DELAYED, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 709ca369cb52..a7d8f1ce6ac2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -491,7 +491,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
@@ -582,7 +582,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     ib_size_dw * 4,
 				     direct ? AMDGPU_IB_POOL_DIRECT :
-				     AMDGPU_IB_POOL_DELAYED, &job);
+				     AMDGPU_IB_POOL_DELAYED, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 5ae7cc0d5f57..5e0786ea911b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
 				     64, AMDGPU_IB_POOL_DIRECT,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		goto err;
 
@@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
 				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		goto err;
 
@@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
 				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
@@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
 				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
-				     &job);
+				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index e2587eea6c4a..193de267984e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -989,7 +989,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
 	params.vm = vm;
 	params.immediate = immediate;
 
-	r = vm->update_funcs->prepare(&params, NULL);
+	r = vm->update_funcs->prepare(&params, NULL,
+				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
 	if (r)
 		goto error;
 
@@ -1158,7 +1159,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		dma_fence_put(tmp);
 	}
 
-	r = vm->update_funcs->prepare(&params, sync);
+	r = vm->update_funcs->prepare(&params, sync,
+				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
 	if (r)
 		goto error_free;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 330e4bdea387..139642eacdd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -310,7 +310,7 @@ struct amdgpu_vm_update_params {
 struct amdgpu_vm_update_funcs {
 	int (*map_table)(struct amdgpu_bo_vm *bo);
 	int (*prepare)(struct amdgpu_vm_update_params *p,
-		       struct amdgpu_sync *sync);
+		       struct amdgpu_sync *sync, u64 k_job_id);
 	int (*update)(struct amdgpu_vm_update_params *p,
 		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
 		      unsigned count, uint32_t incr, uint64_t flags);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index 0c1ef5850a5e..22e2e5b47341 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
  *
  * @p: see amdgpu_vm_update_params definition
  * @sync: sync obj with fences to wait on
+ * @k_job_id: the id for tracing/debug purposes
  *
  * Returns:
  * Negativ errno, 0 for success.
  */
 static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
-				 struct amdgpu_sync *sync)
+				 struct amdgpu_sync *sync,
+				 u64 k_job_id)
 {
 	if (!sync)
 		return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index f6ffc207ec2a..c7a7d51080a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -26,6 +26,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_vm.h"
+#include "amdgpu_job.h"
 
 /*
  * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
@@ -396,7 +397,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	params.vm = vm;
 	params.immediate = immediate;
 
-	r = vm->update_funcs->prepare(&params, NULL);
+	r = vm->update_funcs->prepare(&params, NULL,
+				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
 	if (r)
 		goto exit;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 46d9fb433ab2..36805dcfa159 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
 
 /* Allocate a new job for @count PTE updates */
 static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
-				    unsigned int count)
+				    unsigned int count, u64 k_job_id)
 {
 	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
 		: AMDGPU_IB_POOL_DELAYED;
@@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
 	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
 
 	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
-				     ndw * 4, pool, &p->job);
+				     ndw * 4, pool, &p->job, k_job_id);
 	if (r)
 		return r;
 
@@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
  *
  * @p: see amdgpu_vm_update_params definition
  * @sync: amdgpu_sync object with fences to wait for
+ * @k_job_id: identifier of the job, for tracing purpose
  *
  * Returns:
  * Negativ errno, 0 for success.
  */
 static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
-				  struct amdgpu_sync *sync)
+				  struct amdgpu_sync *sync, u64 k_job_id)
 {
 	int r;
 
-	r = amdgpu_vm_sdma_alloc_job(p, 0);
+	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
 	if (r)
 		return r;
 
@@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 			if (r)
 				return r;
 
-			r = amdgpu_vm_sdma_alloc_job(p, count);
+			r = amdgpu_vm_sdma_alloc_job(p, count,
+						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
 			if (r)
 				return r;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 1c07b701d0e4..ceb94bbb03a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
 	int i, r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+				     AMDGPU_IB_POOL_DIRECT, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
@@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
 	int i, r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+				     AMDGPU_IB_POOL_DIRECT, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 9d237b5937fb..1f8866f3f63c 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
 	int i, r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+				     AMDGPU_IB_POOL_DIRECT, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
@@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
 	int i, r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+				     AMDGPU_IB_POOL_DIRECT, &job,
+				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3653c563ee9a..46c84fc60af1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED,
-				     &job);
+				     &job,
+				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
 	if (r)
 		return r;
 
-- 
2.43.0

