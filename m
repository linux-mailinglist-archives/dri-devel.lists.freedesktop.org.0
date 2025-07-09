Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56BAFE502
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747D10E785;
	Wed,  9 Jul 2025 10:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zBz8+s11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650FC10E785;
 Wed,  9 Jul 2025 10:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDragFtfPiLTk/SxBSgxyAK4MfNy7W0JtigIeYRKRc9oEhHFaqfF6kvoZeT6Ykdc8nsGWuGQueIzh/8yV7xugB0mdXJbt3QEI+pQOfrwcZDGszPGR5Qt0fenuYl+fOsvAJJrwUsZJO3Y7VNLWfklg7tFchlBGC6AIBUNEo+gR8ncE/qoWr3MrxMd12WCf04KQ9VWBpHKIEJ1P7w17BVHCAVVZkBmwEg29qNxlbg0CeY33zhgQpvPTMu4DGhCMlkqNjfTyKiqo7ip6u73+ZorXsT1Cn8yUFyxUmnlcdVldgrW76LxBNNHdIiQ1WyCmqdhCvu1T4DLF221SWCP9pwaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPUolXeLQdrBVInU0Qawb5A+BH4a310feGspIdffEug=;
 b=BnIMYZvLPApaNZL/apQKtPfjUcFhOAOepOw5yG3SmZng3wixEaqstpIga8xFKiuLl0a2kddarb4Z7UtYhN5mcXqK6cRyw4biPkC9jO4s8yzzBQBTYV2+YvsGRUuPe0zfbNdfH/33JJtvmRWXsY18xnzgcLmvRu+P/+4wamgAKnUaUbwmrjR9SDRjn0oLLLWRYDlfoYURrcghMxx0BYuePz+aDkHa9YjxB8IwEPX7BmixnRIE1sedr1FQAsfU2oLWft1n5LUWHGkZMe63w2dlcRhWLy+H4gRv9B9uY5nJjc7mYsdaMXX0OXc28lCMBrCTHIaRjzuO5/+D74HR3xl55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPUolXeLQdrBVInU0Qawb5A+BH4a310feGspIdffEug=;
 b=zBz8+s117C9dylCxk8vpgLcbgqyi1s1HiiqVpdA52b3Fu6lIxfaFDOnnVjOoTPEKwVu70rgKteHvass12rGyntBnafeOim+IM3q88La8MjdP6HphtufQVgLcMp2dT78HejG/ANWkpMyYwqd38ylFRGyXsYIMScXPkHElOnxAC88=
Received: from SA9P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::18)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 10:05:48 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::c) by SA9P223CA0013.outlook.office365.com
 (2603:10b6:806:26::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 10:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 9 Jul 2025 10:05:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:47 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 05:05:41 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v5 3/5] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
Date: Wed, 9 Jul 2025 18:05:10 +0800
Message-ID: <20250709100512.3762063-4-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709100512.3762063-1-guoqing.zhang@amd.com>
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|PH7PR12MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e45c198-6233-4c32-d577-08ddbed02d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dIPOuKtr9/Mj7XJWpk0ODDvEPjjOA+E6t9BEffBKEr0radT+4/IU+WrB0W+n?=
 =?us-ascii?Q?8a7zEbuErG8Y+mCFcXyGNovliKgdhB+lc+bg2K8Oz+gznlniQ6MJEjgx4HcH?=
 =?us-ascii?Q?3BOYKhOCvqX29Z//b0MFzvApbinVIQmARXSIw7epEzoxZ3RYb/jIvrGG3Mod?=
 =?us-ascii?Q?l/YFw28b+lCtSc1KuwJklyZv+kpHRARhlM8g6J2MR9KUU2pgCwBb060tuOmt?=
 =?us-ascii?Q?9pujxFwuktohswOhYGrLDIA8FTcsOJ2DsIQHQZCIfVRjkPTH+9H+HBakO8Sv?=
 =?us-ascii?Q?Mmw/0/cdiq/ugFSQUVRTKVttxCHIhgmB6CHF7AnVEunj6a04LkXWmuEjAupZ?=
 =?us-ascii?Q?i9yhegYsHGrnG1UhIZyDMHVlF8T2w9maAzGEcP3Y80ibzzfIGlWQHTdNBAIU?=
 =?us-ascii?Q?In+lLl/3l9rwKUb6XG7bt4002aGKTMglW4AtCd4jgPri7tQ7lf5VFJ30LA5q?=
 =?us-ascii?Q?NPTdDEqcc/nkLjcooASD6i+IZjgS7O0BAeUCqsCoRs/nsdZFGbnReX70AkZZ?=
 =?us-ascii?Q?KTX/LCZJimO+8rpobcf1HyoA761n5zLUuoDfgukCAlfHSaGOisfrnOt73se8?=
 =?us-ascii?Q?kvFcFpowLmUWV2Q3g1OU/63JuecIBQ63EKX4yDr5P/1gEgr77BahTLI92ORq?=
 =?us-ascii?Q?o1RJ2HzIXmsKzbiAAQdxufC8qIrg/FaiP0fyn5itlqDGySqgWtCZxcIyfV/K?=
 =?us-ascii?Q?DUuy9dqI3Mvp/KOe2utBE7slkBa084u9seQDIJGVkqvQ5EjJzPfgGtK7Wpwu?=
 =?us-ascii?Q?0WSB/IZNU76Sg0RNPg16CIbjZhB4IoZ3gpsdoHZBqMjy5CqccwZhI2ddFDPE?=
 =?us-ascii?Q?pAHzQGJdRzH3ewKH9ZMEh964JZqD0Mirt5VVwL1vvFHcdP6tO1Qx2vrXUKVz?=
 =?us-ascii?Q?y3xbn/ct04ouXNEynwnguVC+npsRioed7b4RrFrAYua+Aqe8p8lCf10py2pg?=
 =?us-ascii?Q?2etiXQZiXhWlUEy4FGGRsA7+8Ay1jEjetl8cB8op2pYh2+OECcgrjO4tlGwz?=
 =?us-ascii?Q?1pCfvKdGU15ZBxhoyFzMTPkbYz50r0hj8ay6ofU4MNz58uWbAFnH4lcpzFhy?=
 =?us-ascii?Q?Vb2i1o9I68QR0YWRps1S2ancUN893T1dZSSngFGunz8Bw7vJFl1jF+brnr0D?=
 =?us-ascii?Q?aLmnhckjPqApcJ//hWj29CaWGSmQv+hNHJJTAzLlBjt++AWNAuDAZjG1cR2W?=
 =?us-ascii?Q?1zwOwukIjFgYXf6QbahLLahUiJm89Yo6EhX870CaI2ytSKjOcXB/Y+MzhZWr?=
 =?us-ascii?Q?jN6qMAWlgUbwWnMaa590xSXE5QRiMk/84aYXjqYPP4ZMDuEbO6hDR+9jV2aq?=
 =?us-ascii?Q?sit49abGdJAWvDvtaiNn/dSxtC6PFJNUmG8OSpdoZEC7VixxuzInAQpuxkIL?=
 =?us-ascii?Q?+kBERAmxvlqFEE/CJWksFqao8Glq2qNCg4FyNCKzEPEtu481hbsZNDG2hbKf?=
 =?us-ascii?Q?KVuMNEJjMd+4H6aSBc2circVEfVESVKFz6r6t3Kdy2+QdhOsBpLpLk1Jwrq2?=
 =?us-ascii?Q?+fQTqaAV6E76DT08UUrlN4KZGYeqvfUJ0o29tK6jqfC+arbZ7AnCA6GZfA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 10:05:48.0585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e45c198-6233-4c32-d577-08ddbed02d70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833
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

When hibernate with data center dGPUs, huge number of VRAM data will be
moved to shmem during dev_pm_ops.prepare(). These shmem pages take a lot
of system memory so that there's no enough free memory for creating the
hibernation image. This will cause hibernation fail and abort.

After dev_pm_ops.prepare(), call shrink_all_memory() to force move shmem
pages to swap disk and reclaim the pages, so that there's enough system
memory for hibernation image and less pages needed to copy to the image.

This patch can only flush and free about half shmem pages. It will be
better to flush and free more pages, even all of shmem pages, so that
there're less pages to be copied to the hibernation image and the overall
hibernation time can be reduced.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 10a01af63a80..7ae9d9a7aa1d 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -370,6 +370,23 @@ static int create_image(int platform_mode)
 	return error;
 }
 
+static void shrink_shmem_memory(void)
+{
+	struct sysinfo info;
+	unsigned long nr_shmem_pages, nr_freed_pages;
+
+	si_meminfo(&info);
+	nr_shmem_pages = info.sharedram; /* current page count used for shmem */
+	/*
+	 * The intent is to reclaim all shmem pages. Though shrink_all_memory() can
+	 * only reclaim about half of them, it's enough for creating the hibernation
+	 * image.
+	 */
+	nr_freed_pages = shrink_all_memory(nr_shmem_pages);
+	pr_debug("requested to reclaim %lu shmem pages, actually freed %lu pages\n",
+			nr_shmem_pages, nr_freed_pages);
+}
+
 /**
  * hibernation_snapshot - Quiesce devices and create a hibernation image.
  * @platform_mode: If set, use platform driver to prepare for the transition.
@@ -411,6 +428,15 @@ int hibernation_snapshot(int platform_mode)
 		goto Thaw;
 	}
 
+	/*
+	 * Device drivers may move lots of data to shmem in dpm_prepare(). The shmem
+	 * pages will use lots of system memory, causing hibernation image creation
+	 * fail due to insufficient free memory.
+	 * This call is to force flush the shmem pages to swap disk and reclaim
+	 * the system memory so that image creation can succeed.
+	 */
+	shrink_shmem_memory();
+
 	suspend_console();
 	pm_restrict_gfp_mask();
 
-- 
2.43.5

