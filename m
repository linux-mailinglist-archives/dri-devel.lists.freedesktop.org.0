Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA90C3D017
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A99010E99F;
	Thu,  6 Nov 2025 18:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sf8we5YV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012065.outbound.protection.outlook.com
 [40.107.200.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D710E99F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMj3/io1z0W+oWAAplpJX834pHNLgyLZEga7fDvPvYRfyib/JP1DO7xAcUvBEAffJrWLey6qixYn3cMBLptfQ4Kf1EbzAcQK9glG/kKTpuKMiA8PxIaxaLsMS8kfEQbvaQvewetHrpWu+J9BhtuafSeg0+HDAkwqjI0f3JVYw2rrYHHy8eU8a5syZgSv1b86PmcwSiXF4im/OxhLY8b7LbEXK6JbNeq9pBzyZQLzp3UoUCxf5+fCADSPycn2e7WAOJ2pDKvVuI4W3xDA0iA0j9iUCSaqLfDIfNKJPW2XrGEQ2T8kP+edDHDqdOC9PWRveRHH4VvHVH2GKxoG3jQ1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI1klkb/MfxbAwNpwsMC6xzO+lC4p/3IUdE098BucY4=;
 b=HQfkS2KqEHrh/u7ww7Za8JhKL1qe9t8rn84YocPIM4q71O35H+uoX+R0KR0Lc0/chs0oUu9cUGiL7Lfd+YIfNPuEp9KlmzoCuIWyFjkSjOK6Mmv8zA3y002XjJcCLchb0QwVLh4eW3SYmsEgs2mZ3mh0Iqk3McDy7On+sJJ0Izinzrg6kUJYZS7KMJjT48pdiGDN1Ea/80V7Y3X9Aj/to7KRUycVxwd6WZeGjnO1py6+WxIpjE3X8ePpHeKrHZilXxpAekw+m9A8GrTw16MKMNqlHjfYyMq/DSrirFtQQkjh4HgSQdcYsbYw96P4Q/q1IWoOw9G/nmxaQelhYAVm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI1klkb/MfxbAwNpwsMC6xzO+lC4p/3IUdE098BucY4=;
 b=Sf8we5YVdbKbzCM4eJ3bnNWl+87BFNBW0F1B9Anz/HkY7JmAKpTb/cGdNr4RX9KRP+79DYPjjImiuPIXieQdfABK1XzDX+kC2tmn9rk5Vk4WZ7jnKXd2P5/F+mJ6jLwmvsA1K07qlg3l1RxKkJoF5g/nQZUuF4MciBbHpPOAXVg=
Received: from DM6PR10CA0030.namprd10.prod.outlook.com (2603:10b6:5:60::43) by
 DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 18:05:24 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::63) by DM6PR10CA0030.outlook.office365.com
 (2603:10b6:5:60::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 18:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 18:05:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 10:05:23 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 6 Nov 2025 10:05:22 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable error
Date: Thu, 6 Nov 2025 10:05:21 -0800
Message-ID: <20251106180521.1095218-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DS2PR12MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 56812687-dcab-40e2-6285-08de1d5f0ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JrpsN+IbL/Olo78BATkwVEYGJRr4D1QY4dyFZVcsDDIjol5M2s25NfLxE+Z3?=
 =?us-ascii?Q?bRmQXe6shmjYFAl6imkCmWIxp6dQgXq4VSen3vN6zoc5O6r8u2V3N41c/766?=
 =?us-ascii?Q?OEcUHk62EyBHhgf+2gzfKyxWBrqby3V+/8ggnvEZyfft/q5mpr1MMDyZj4qq?=
 =?us-ascii?Q?sFjyn2nL6ZhM9Zh49cpi1q/ojLN3fbvI+OBfH4eBOV2uj0pU8YyCYtb6KEv4?=
 =?us-ascii?Q?mo1RvYLFwKr+tFiIork+5o/b+BZGxLPfIgZuAS8v77i79M6rreAJoMKyjjRj?=
 =?us-ascii?Q?k8kGYXPfS5MOwxTA6LOuP58ZF37pxGG3sdXC1i44GbLXiFI6h6GyTXO5/BBi?=
 =?us-ascii?Q?Ba1Vbs0ZPskKDiIgffd8gS1l6QLezUlWgsIdXeJQNPeDBbphA2U0tTT3jCR8?=
 =?us-ascii?Q?RGNxHu+8m3uz0JK2DVjX5SQz0+HLJCab5GoQizw46lG0xJMf8mtzALcDTwDi?=
 =?us-ascii?Q?hS403MOFeQ5T46BtB6CoxjmyNN62QLZHafyUyW7ESNUpmY4QbPs3jhn4Xsa2?=
 =?us-ascii?Q?4ktFm7CsiX5QcaY17SC0V5ugLRhhFKA9tEOO/jZeLX36lqkQtP/ea9JmSbrG?=
 =?us-ascii?Q?qgvJJru9qAdwA0iks5VKvvoiI0y4Ybo67jPPypSWTWPuu9uB8XmvpDlLFR1I?=
 =?us-ascii?Q?PDI0XtFnD8/mJhWX+AEK/S5fFXrkoSRw8Iz9OyJNM2Ze4QRnVDeSwoipIDxK?=
 =?us-ascii?Q?1/dGP2VpMAflmOpBazT5MXqMdWpDP6vtWe3xZca8UHuuBmv6No048tZQWHcl?=
 =?us-ascii?Q?wNkxrVxLSt4x7ORc7NYj2O48jza2F9uFnrTHUscHG5pXVLYw55owTdwQBhby?=
 =?us-ascii?Q?CLZr47LXCiCpIILxSb1+PHn3NuqVtxcWt3/hp9Wqx8SA3/kjMdOXoOWPIJxR?=
 =?us-ascii?Q?9jHhX/CbhwbSVM5eUakojGWiWwVWR1Us/Yt6StGlwd8BwG90C2cDdGCxs2mK?=
 =?us-ascii?Q?EfWm1/gPiGoyynmGdzi/KeVZpsYL67nu763Rntw8j0hjYMoLDpFpolDeiAip?=
 =?us-ascii?Q?rh+sku6m877oA3yjamnvqZRTuMr3oz6ltCE/Dzz5nabxIZy9LLJjy1b16fNr?=
 =?us-ascii?Q?R1GZqXtkUFQAUcr/FvK2Fm6jhJGye4LsbBCETcV1gEEmyMb0zUn6rfprXc1v?=
 =?us-ascii?Q?x29k7QuSUpDBTbJ8gxn0fBLhVKBrrgq+u1tNNBfvnUKPa9R2XDezPV7kuOkm?=
 =?us-ascii?Q?IXVtjaTiM9vlm6+MY4OFL8KtXSiieTRcW/7/rpq0c8qcioJT4r098To8q/q3?=
 =?us-ascii?Q?dE346RmfQI3JZ6et5HG1wj7ORTRWDfqOTceL7uoYTT6/aUhZzSGpTAdu8Hhz?=
 =?us-ascii?Q?H2zOfsdIbq3dobEYYfmvmChbMKNnu90gAPqi/1WcfQMTlJpsg5SpDMvCTy6E?=
 =?us-ascii?Q?CHrHacLklemyOADcd1DZNFkF7Mx+XgTZJfToBA6rZkR63EpjvqJrwqK6G40J?=
 =?us-ascii?Q?bFJgPja+6ROFIx40tSWvZwX7KnnSPWh7c1r96+n+3zJTFeeac49E6t4Tocm3?=
 =?us-ascii?Q?Zm4iaAWQibzVPPFZI2aZw3DOmvErnGcNeIILnzxYqEYaiL/I2G+JwlJCXXjx?=
 =?us-ascii?Q?K58teBvDsMO5BuBtemg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 18:05:23.9489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56812687-dcab-40e2-6285-08de1d5f0ec7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823
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

Failing to set power off indicates an unrecoverable hardware or firmware
error. Update the driver to treat such a failure as a fatal condition
and stop further operations that depend on successful power state
transition.

This prevents undefined behavior when the hardware remains in an
unexpected state after a failed power-off attempt.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 11c0e9e7b03a..bd94ee96c2bc 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
 {
 	int ret;
 
+	/*
+	 * Failing to set power off indicates an unrecoverable hardware or
+	 * firmware error.
+	 */
+	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
+		return ret;
+	}
+
 	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
-- 
2.34.1

