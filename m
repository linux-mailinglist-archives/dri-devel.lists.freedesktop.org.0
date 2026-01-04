Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4605CF0B66
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 08:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77EF10E3A1;
	Sun,  4 Jan 2026 07:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P0OWxGep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BA10E399;
 Sun,  4 Jan 2026 07:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4px8xk5Odqhjf0drNe499jFEnvnCup1jFi2TMuo7xgxgq2EwXCEWGnNLF/ojzoEwCFqimLOd4HDteVUhayj6ty72mDf6DDeLDF/O8yivSG0SIrR4BC6ZktFpYS3zo5ry1Lbh6/BeWfqI/oxfG59Q2vUnSUWRlcWBY+g6VrZE964X7q/zZZXnN8zytvWTcGqjD0ql01B9pKEYHvrE5G/zMQwbPuwMnc7VF48YjBokPVkl0lTgPEUScpuuWOQ5LNKEzhNPajnRUaytzA+9OS0u6d2Jlb1pv26ZskNvQ19hcgvoTv4uAVbhN4rl9zxva6ctPDzmCNA98XWdzTuZHuLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dpLn5Z8YcZXnKrImFME3nTGScrYCqcOuIPhOYRuvzE=;
 b=HqClIdxu5ic/4Vw2o9WPOPF0957OzlZtd/ORZubhfUs8cBRVk0zOO/xC/Hizfjl5IbIqTmHPqzRdzhdetjjq2Bzr+vbBz4P3RqUHiwYTHklFcJ3pxxrzya7Y98nPfGEJ6e0Mp3sBhA/vUAr6PLawucH/4Re8WPA29tQ+QX0FwK/L3Uc0aK69ePtn6zEqxRf4fJ4y4I7MPDeMQmde92PRmjYJEzoqMEgNCIhiUbPgko/psuE82i6wt0sSH9BeuX61hWHgIa2NubYVpfZ+RAPfZxIFvZgqoL6ubHYScbz60xI61/XRf2RCSE4tjZua9Ov+wceP14ONfVcs4uH0kfICHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=collabora.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dpLn5Z8YcZXnKrImFME3nTGScrYCqcOuIPhOYRuvzE=;
 b=P0OWxGepKC+PsUjdEAeqq7BuR5xuK3vB9mpILOLT2M5wh4RSG5N8ScnT0MeO6dmJmuhQmqwuN91+p+fSgMdZUvOvM9tEoEvgKF+lAk1je9s4KC8P8li6Rp1tZ2uO4rwvcmcoMzm0fZgPJjkOhtM3+Qok+U4SaQ3IvKaxk87aaz0=
Received: from BN9PR03CA0077.namprd03.prod.outlook.com (2603:10b6:408:fc::22)
 by PH7PR12MB8595.namprd12.prod.outlook.com (2603:10b6:510:1b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 07:22:19 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::4e) by BN9PR03CA0077.outlook.office365.com
 (2603:10b6:408:fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 07:22:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Sun, 4 Jan 2026 07:22:18 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 4 Jan
 2026 01:22:15 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Ray.Huang@amd.com>
CC: <dmitry.osipenko@collabora.com>, <Xinhui.Pan@amd.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <akpm@linux-foundation.org>, <honghuan@amd.com>
Subject: [PATCH v2 2/4] drm/amdkfd: Extend kgd_mem for batch userptr support
Date: Sun, 4 Jan 2026 15:21:20 +0800
Message-ID: <20260104072122.3045656-3-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260104072122.3045656-1-honglei1.huang@amd.com>
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|PH7PR12MB8595:EE_
X-MS-Office365-Filtering-Correlation-Id: d32fb6cb-018c-4263-77e7-08de4b61feb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qRZhiBxtowjhctkdDZlpFW+lXnxMq44KTGMFvDBqBBArhQQM+VGP2qIXA46J?=
 =?us-ascii?Q?ZUzNFhth8stlwWb4v5sjIU2YnSifA2ni08aUOYqKQCqCfH5dBsEztYYYVoaM?=
 =?us-ascii?Q?IdQEnU6lw+0CL6TOmS8XHs0ws62uZ1rUcya6IyWOsJGN+uWAUsnrE5yw1saP?=
 =?us-ascii?Q?VL9SZqolNh5xG3jPLf7LShySCLyDWskQm8Jme3rLEtYpIif6xKGyDgQED1vj?=
 =?us-ascii?Q?kgnMdUk2l9f2bPxzDrz8Nta2XkgVrBhbw4n0U5Aww4Um41GOXao50e0+EsrD?=
 =?us-ascii?Q?U2Bbj215UTjYCQ3zsHpcGlSWrWwGgBYA6ftIvlcuvlNzxdV4StrqRBHZ03jg?=
 =?us-ascii?Q?aNcsfCAbgMYjQi/6UsIYbY2RKUZOSziiKlDVgbJ86JCfHyxfQKwHXGPte8Kh?=
 =?us-ascii?Q?qwTHGeInthP/ru8+ed/8AiddIcY7djQUxvJHuT3DxbKOIL6MSxy4QnnGk0qM?=
 =?us-ascii?Q?pN1YuBlOOhIHfUOONu945WTgKqIgrWC3WExNm3v4RjukbInzKd3ksdytFvdH?=
 =?us-ascii?Q?dRL8R3kUyG87OlCS5MIVzfWXLvCnGy2+CtVYS8L3IeVUBy5Huk/yoAf0EXii?=
 =?us-ascii?Q?Fk5yGPIKhAB80/2vPSWLa+1yx3YC8nx3LcYNeGK4THggZVDOaDTwj4Yd7IKV?=
 =?us-ascii?Q?3WvNjMC7e1gAfCDdALnifun1bETXxcKCZZz+gyCJvjPgCq5pR1QQMkQUtM9F?=
 =?us-ascii?Q?4ANhTKolCvs5BrfXwsQ92kwHBrpL2iVvXFjQiQU/ICC1Ky6Zav4lGrJoFkuc?=
 =?us-ascii?Q?HneE2t2wco0G0zes2AqmwkH7rcHbLi0IMcvZE0d7ZZ70Bx4UZsBCZPKbLeUD?=
 =?us-ascii?Q?ZTvq8rC9cu29mjO0inoHIrThTrMExjLvZrgv4n22OfDw3o1SY3YprxfoeTP3?=
 =?us-ascii?Q?S3i3fMGpeepCqhGu+n+Xn9GdEWLcXig9Fp1NZ2azIomPRJ00yGqvbQ0LbKDk?=
 =?us-ascii?Q?y4ZeNvojxEoDB2+hSnmE71Bj/LCd0QJ3487+szxPV10j7etXhEW2PmW1OYUZ?=
 =?us-ascii?Q?XcAo/8fSNixMe/ixOH56ITsWoBGYY3yDcT+5XZFjS81bUNCxbBSkYho7thBN?=
 =?us-ascii?Q?n1j1s//KxMIyVtX3TWKvIEMRnbGvn+ptn0DoNESCHl9cCOWWhSa63EbLPwQm?=
 =?us-ascii?Q?zcuCH2ia5JJkkeNRADU+XQFnwBJ9e5Hr6D2hr3bTKUWXywluhD7CoalYfBRs?=
 =?us-ascii?Q?xsWJwciHN4BwpWV4+qQNwQnrya2EZA4tstijt7GdER5qSIORil5LC6DHU/J/?=
 =?us-ascii?Q?YB/tNUIDv8uggizCCKskw0+ZYYd6M+D1v0yy/fr2LSa5+l8GffGZUL0b4WWz?=
 =?us-ascii?Q?dOjy2/GWcZvY4djwT5wj8qVIrfidfvwryeCtOCbtJKPcE6jFbN1OWY6/F1A8?=
 =?us-ascii?Q?uUiOlZ6fy2S3XF7hB5/1UI7KUBnUF56oIeoGnVH3nG73D/uVfq+MX3Hc5YMr?=
 =?us-ascii?Q?LA6SxxdgfA5HbmRKYFf4md81+OTAmIn9KQj5a6BzLab19hvMnpUEgNiJ3KPk?=
 =?us-ascii?Q?j6Fleeteix0BUtYYPULHssV/3y6mPT5PKdfyfy5onF7AFujJAV72wVihwwZg?=
 =?us-ascii?Q?lyL4+NR5XwZ/XVB7luI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 07:22:18.9857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32fb6cb-018c-4263-77e7-08de4b61feb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8595
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

Add necessary data structures to support tracking multiple user
address ranges within a single memory object.

The user_range_info structure tracks individual ranges with their
own HMM ranges and MMU notifiers, allowing per-range invalidation
tracking. The kgd_mem structure is extended to hold an array of
these ranges.

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 321cbf9a1..1883833a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -48,6 +48,7 @@ enum TLB_FLUSH_TYPE {
 
 struct amdgpu_device;
 struct kfd_process_device;
+struct kfd_ioctl_userptr_range;
 struct amdgpu_reset_context;
 
 enum kfd_mem_attachment_type {
@@ -67,6 +68,15 @@ struct kfd_mem_attachment {
 	uint64_t pte_flags;
 };
 
+struct user_range_info {
+	uint64_t start;			/* CPU virtual address start */
+	uint64_t size;			/* Size in bytes */
+	struct hmm_range *range;	/* HMM range for this userptr */
+	uint32_t invalid;		/* Invalidation counter */
+	struct mmu_interval_notifier notifier;	/* MMU notifier for this range */
+	struct kgd_mem *mem;		/* Back pointer to parent kgd_mem */
+};
+
 struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
@@ -89,6 +99,12 @@ struct kgd_mem {
 	uint32_t gem_handle;
 	bool aql_queue;
 	bool is_imported;
+
+	/* For batch userptr allocation: multiple non-contiguous CPU VA ranges
+	 * mapped to a single contiguous GPU VA range
+	 */
+	uint32_t num_user_ranges;
+	struct user_range_info *user_ranges;
 };
 
 /* KFD Memory Eviction */
@@ -313,6 +329,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct amdgpu_device *adev, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags, bool criu_resume);
+int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu_batch(
+		struct amdgpu_device *adev, uint64_t va, uint64_t size,
+		void *drm_priv, struct kgd_mem **mem,
+		uint64_t *offset, struct kfd_ioctl_userptr_range *ranges,
+		uint32_t num_ranges, uint32_t flags, bool criu_resume);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size);
-- 
2.34.1

