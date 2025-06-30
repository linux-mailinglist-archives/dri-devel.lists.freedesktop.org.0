Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F94AEDA1B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49BA10E404;
	Mon, 30 Jun 2025 10:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VfEZ5c2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BD810E404;
 Mon, 30 Jun 2025 10:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVuFRBppVchSfZSeK3geucfn5LjJLtAHYAlWW+1l/5ed4gDgv39ntjG0fnkVN2XHNnv3JFsOXt0K99vDgm/FduWsOv0QSaXhfHA0XSJbWzaTs4fz95lE8BU5ZHck1obouSFN/qOcn/BSd7DWnMAQccVPUEt2GQlj53OqVtihNiC8ZUronhWDN80XRSfUIX8IOW8S19pExy03GyuBuznAXx4O6ppDjrBGk3zi5ac73LJcoZU1die00N0SuJPn4fpLGus1udJx/3yLCtqT1Fye94YMy/jWc9dWx9uWGixnS7NbZFEED5JwQg3AeMLD/viodcX8nuKsLftjFz9250VqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjitZ801ujEKLUDcwxCjZHouyz0X/iHMWMPwrlHhPzI=;
 b=fPcBZTYN4asBXVzw/UBixzW7UA8L/cpHcaOAPeun0OpjPE3sN3Qer2+ZyKfiHpoHa3tG+DGlRR9vvRxn8WIPn3OWTQFXNPVqnzuF+jmPNoLP88GWt0ATLDHQtygfxporHLYHAOaUvm+JiI9lm7UxouwQ6FH9+YsN5DVm6hDhAEsVtrrQoMRlSyMiKF2Q0f0Q1b9RNMw7E+ReLKPgn4U8yf0DP2o2sRnHlecRK8g4+bl6Ny3PuhHhlrvskCwCb5I1J785unSZ2FF2PKbQGJ45Ji6LD+/vIGP69CMQzlZgJaHJmfPlMRw87/hGDqE6X2RdCrEy7w40/lQtHAvKqfq+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjitZ801ujEKLUDcwxCjZHouyz0X/iHMWMPwrlHhPzI=;
 b=VfEZ5c2uWju+XoFueQ95KSzXjAwGN6jo+OeHFSZbt5zyMwUeOfoVhSoeF89Voi4HNlTfDWDlkn0VXaBi7iI8zNijyvpPKO7FywZIINaw1/VEI1Sm560FU0WtJcoj/QfYXSKvQ1F2Cj6t9E7abvx0t6VS8uoO/FJ6Y2VpHrXT0h8=
Received: from SJ0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:a03:3a0::34)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 10:41:39 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e2) by SJ0PR03CA0269.outlook.office365.com
 (2603:10b6:a03:3a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 10:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 10:41:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 05:41:33 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 05:41:30 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>
CC: <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Zhang
 <guoqing.zhang@amd.com>
Subject: [PATCH 2/3] PM: hibernate: shrink shmem pages after
 dev_pm_ops.prepare()
Date: Mon, 30 Jun 2025 18:41:15 +0800
Message-ID: <20250630104116.3050306-3-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250630104116.3050306-1-guoqing.zhang@amd.com>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7cdf9d-e649-4017-171a-08ddb7c2b1b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cl40Nlh/S52VhsOgrbyUrmGDp1kSL4U50NvogG45yprhcuXzUyaOnZrm3XW1?=
 =?us-ascii?Q?cKv1hfH7VVYvUxGfYiwKxfclAwL3XC2qVW0MWv5A65R0ZCjUqOgfCGrAcMos?=
 =?us-ascii?Q?tEKJgqN0cbUe+8LGRnzlwJS/LPoD83j2JNGEW+3t3wv2pW1JrQgMEUon/Qq+?=
 =?us-ascii?Q?2lq+xhEShYIOSuS5jr13BlKfmBLM3DywlLtjSISGBl+EqiOny/EMXAh9iESG?=
 =?us-ascii?Q?YvjyP+KaH9JT0NZ71LIXnSeJTJt27DNMmH2KEpjqjeprB9sRvBDgjL0mGyl2?=
 =?us-ascii?Q?L1dMbeKDAksn84aK9fY6MezSt9dV4QgeIoNWGYFrZRSXvbjjQza0/KqBZmI5?=
 =?us-ascii?Q?3VWd2pKCPYQZg8wBX9LNK4RrAslmr9Nrdwif1dsOAGw7LyYymFwr2v6pcLb5?=
 =?us-ascii?Q?fiYOdzuX4aYGoIaWhXfNLY5thTGvgd6QggC1+bD8z3hXEBbNgAxVKKAGmzl9?=
 =?us-ascii?Q?6MbBnbF49shJfds2BMWY3mW0PxXZ0iViStURFPq0/d4QFxrkXdScZGvclSJ1?=
 =?us-ascii?Q?0Te0/uDjK8t7aB47N3T9kOEpiGhScnOFM6zJnM6HxCnC3QfrIQshlonWjlny?=
 =?us-ascii?Q?nRfG1jyHbi8+OZmmuBzoRcK1biPJQZin2qI8i4OcU8m/e6sNsixFekMpP9WH?=
 =?us-ascii?Q?PGEcW0rkCJ/qifIpDzgaZGFf6gXkJjFcyzhYVRuwvJ0J0NtcO33Sg5cuYYDM?=
 =?us-ascii?Q?XAat7iC22N4i+E+4Zx/5DutaUSmooDgHG28jiICJI6Qs9FA0g5vLvPr0x519?=
 =?us-ascii?Q?Mpv1I24nzEKMXZ6y6UUi482EvYy7qQ/qsxsDlpRc/0Tp+i2RoTpS8Dl7y0Cv?=
 =?us-ascii?Q?zGBaJQQcOHNfZQyVQ6HPMWY84m8pcyChCRJTcsWQ+i0De83EF5n7mHnxbYbo?=
 =?us-ascii?Q?KDRyYyMgfQYekxZsTU3yHOJ3pi9lbdTKAlWZlG4QzJMPnjAKQfIFjAWk2aoB?=
 =?us-ascii?Q?nKOjWKh0WbeDvvp76RGAiPQHFrAA9fsWxRxTNLrVuflF4926sH0nO14K+BbO?=
 =?us-ascii?Q?LoT6SfYgClNheQ0Btxokaqpg6Pp9gQ7TFmVg8REf+fY+lRRL8WUx5YR9tNGG?=
 =?us-ascii?Q?IzU/9E/++BO1tT0uiJ8oq74Lg/T1V6bqzMCGR6b0JPaU6/6xZmkYJyUswCA6?=
 =?us-ascii?Q?zAGg0NAxu4u+HRTwudKBI5Fk4UIHKWZ/g6UMCy2wYXlxo9r8FKcaObnWEVUV?=
 =?us-ascii?Q?RKIS9ZEPBQKqQ/N5CKAqYBF1cY9iBqgCKm3hoKj9ZEoRSd97C14liku02YNn?=
 =?us-ascii?Q?o6le0Eb5Tzno/rQwDp38xv/F2oX8nVVqb6klnQRevhzMTJ6RIfjSZxHoNWUo?=
 =?us-ascii?Q?XevoiEJNPufCQP07ckO1yvBLE6pRd4bv04qd0p7kKzd2oiKN8+p1lKaRZf0/?=
 =?us-ascii?Q?ddrP/eaBLtsMpcqYEtl5AJH85+i0C3lnV+54azH08QleigmKxtXooi/wTA/h?=
 =?us-ascii?Q?OCsUornVBO8w87wk3iFcQEpW7zRuJpJQvB/7Xr7s32ixsU2JG9r8WJgMzSMT?=
 =?us-ascii?Q?Yq7DuqvrhMCaK+f/6JcDVelFkcmIGR5g5drf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:41:38.7858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7cdf9d-e649-4017-171a-08ddb7c2b1b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
---
 kernel/power/hibernate.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 10a01af63a80..913a298c1d01 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -370,6 +370,17 @@ static int create_image(int platform_mode)
 	return error;
 }
 
+static void shrink_shmem_memory(void)
+{
+	struct sysinfo info;
+	unsigned long pages, freed;
+
+	si_meminfo(&info);
+	pages = info.sharedram;
+	freed = shrink_all_memory(pages);
+	pr_debug("requested to reclaim %lu pages, freed %lu pages\n", pages, freed);
+}
+
 /**
  * hibernation_snapshot - Quiesce devices and create a hibernation image.
  * @platform_mode: If set, use platform driver to prepare for the transition.
@@ -411,6 +422,8 @@ int hibernation_snapshot(int platform_mode)
 		goto Thaw;
 	}
 
+	shrink_shmem_memory();
+
 	suspend_console();
 	pm_restrict_gfp_mask();
 
-- 
2.43.5

