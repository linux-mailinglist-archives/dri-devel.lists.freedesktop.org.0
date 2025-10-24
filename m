Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4CAC074B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C7F10EB0B;
	Fri, 24 Oct 2025 16:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i9dhLTHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A621610EB0B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P42sSlec6eArqZgKyrlmqAMc46i9PmxEN1wOJOw/ntpR06AIKfTN47+dZBqfEIZCM8pPxAOLn1/sH/wEhTqu8dhuY4CHC2zn5Y+zQPhuWywHDQ0IsL4FlTvS8BvOCe4uVT0ySTXGMX6hfpHHYn3bqLK+JnVh6zOUzGc9B3gFhI2uonC23xyI3iR9768Grtf8r2Mm9IOciRuONyoaE5u8RC/obmICYZjmeLoj3dm9b6t4BXiDKHUqrJP7gFBxWp9RLc7gqnHUH/835/flAGih4GXeUzEi5a1vUmJIwPzcWuISqpEJrZcnqZNK1MhuooXYChDw9uJwDo037q2QErV+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSZqMUyIklJC9OM/R3204fnvdeFGvKepVE/CGvKpHuA=;
 b=u3N16BOylhao4Rwk+iBTAWE3S0NAUd9sAvyHf5oM4cqlg6YcibdGnlgNgaKUbwEVi6TBwBCEHDGITzTgRUqQKGBy5VtAG7cH6+R6XuXb88XUEZN2UYTJl1tKuXcOKkMbgAw5Rsbke6QJAMsLHKWpiNV/O78mpOavtrMVIG9dDuB4AIHYPeafY63SxkxDiGclpufjbXq8rBhRwAZYJqxXinGc4HJyIBnuTzz+RtpElsq1BjrT5AG/Crzhl3G5wm9iqn2mjpzzgQUCzsRmXjdHCS3YHtwKDolbnQD2vsiwpkswFeSBG1sYD+T3K+ZwEFQ6BLoFiiMJWYyd17dwIrjauQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSZqMUyIklJC9OM/R3204fnvdeFGvKepVE/CGvKpHuA=;
 b=i9dhLTHEnjw3xX7Rn1Nbhe70BldYNF6FyYvb0eJ8rfGm3Fco1qGMf/18ppCHyGoNN9SxS1q/lJZLV9ZhypEhwhtwBDazp+kC95G0UYVEIPit1fGnT6ElRJjyk9Lv7OKlWpibgc+32D7sDkCIqTjEPZKtwAlEkvckhCr5wBVktqs=
Received: from BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:26:16 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:110:cafe::2d) by BN9PR03CA0723.outlook.office365.com
 (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Fri,
 24 Oct 2025 16:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 16:26:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 09:26:11 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 09:26:10 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 09:26:10 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dan.carpenter@linaro.org>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Fix incorrect return value in
 aie2_hwctx_sync_debug_bo()
Date: Fri, 24 Oct 2025 09:26:08 -0700
Message-ID: <20251024162608.1544842-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: debfe578-cb20-4091-f34d-08de131a0d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GBRP7xk6zF8awIqnB2rBzi/jMAiFLsYkKODD8b0pyaMsVJFJZCdPvBbT2zC/?=
 =?us-ascii?Q?jQ1uqcdU+ZWEPdn4KHYZbV41ZH3lUSLR9w+X6zFXwh7VxqGRMAILbO3J4N5S?=
 =?us-ascii?Q?wq0gAcFzGcNlxHv99iK/TS7ntzbbXXo5kkiBXNOOlYKRQfVQDDHGsueZEXvm?=
 =?us-ascii?Q?tSWVGw8zR4U5s+Psvn1T8ftbPpaO+3c+kJtODoPqhHcY9jUUeeZw61J6kBhp?=
 =?us-ascii?Q?+lnpRyC6c1Pqo3IgPRD/0GcLaD8HwBPZUSNTWyniUIazlAwSE28wT7G42SZp?=
 =?us-ascii?Q?wxgFidL0hJSYsPOFSmIUOTxaQZ744cqCK9zXRNkmGyoMaiySrMx2VjlhvqGB?=
 =?us-ascii?Q?NdNVPzrazo6csn8GDNnFEigljxss+fYJ027krZDmwiIXhBwUC4tx39+izZFr?=
 =?us-ascii?Q?bxwPSvH5UOcDJ3hrel/M10XqAJWcRsf1Bd4C+rhsO+1c150uweQ5PKJIIRBG?=
 =?us-ascii?Q?dOsY95h0b4M32uifI94vAIAzPy6UJ21kE17wQJFijtQhf6QgxSE2kA1qP2K4?=
 =?us-ascii?Q?MGkEtAopJBIUTv24/io6ohqp+v3l9fIH0GtsEVyROnLbzPdSb29Wi0khYD9M?=
 =?us-ascii?Q?k6bXFw0BNucx3ARVe9VlkKk0zuABSpA9JTfye3piEnreG+qs8+qwhDKPu5OC?=
 =?us-ascii?Q?5hoIGsINLdxO6I0rGL/AbCeNNNZ0lSXVVmNujx6x9SAayW9f9eeQJSznlhy3?=
 =?us-ascii?Q?umqj6tDJ7ZZvN6zxANUFSvmCUZFFFfKZ10h5L+pSANSvkDAXSGzhZoQ6Vehh?=
 =?us-ascii?Q?OjpY4aH/r6NUjwxqDexbJFYOBOz/bjO5c8KGttSFFkfSrBUgoRj2bDY9oX4j?=
 =?us-ascii?Q?YJuC/VxKhlnK4aAlL2h/gFh++0wXzcJDzQAmZerKgj4nmwk+2eM264JuBRWk?=
 =?us-ascii?Q?db0F+S/jqfiyvLgMXWyiR4Tzwu0C9IAS1i4gydHah+I72heR0UmHNHODYaR5?=
 =?us-ascii?Q?fPAkCfIXcSFLAd+gTxvdHmLNCkmgrFbAhAgHZGpYFz2hACpTWPEiSBFjkpbr?=
 =?us-ascii?Q?7oLRKlHzVUPq74YCH+WECvTvk9ShUWNDvZN7MSdj9oQ/9GX4SRQBZGBPYigK?=
 =?us-ascii?Q?Pl8TDcWtcNnI287M6IHdQCuABA5JN91D69U7CWIrbUG+RZ6+GyNTNqYq108P?=
 =?us-ascii?Q?QhfLoHujT2WdHQrrMqaYJHcJbSKASuj8e6trHZL/aMJ7d2tev7RNAiimC7tD?=
 =?us-ascii?Q?vUfKdzYljGf7URClpbl2SKg5DzgqZtfcoF90ct2b5xpbq4mOUX4k4U6+DE0D?=
 =?us-ascii?Q?U2LZSXgNMmFXO9brH4erv1muXwj7xUEuUPT8xY6O7PqGBiEpFxAZQyw1NUpH?=
 =?us-ascii?Q?3en6yJvBjpd9kbrZVvHr85TmUhf2FMepWCikucQf/JaSEt1H4ik1v6tJGpAz?=
 =?us-ascii?Q?/ss97sgiqNHC6cMgOUdhS8j6+ZH+y+o91G3vrGT45o7GICMpaiozI2r+lCPq?=
 =?us-ascii?Q?TcDmxo5hqGoViG0Yieoe1BYJ2ey5qtgYuWcQfnqZVNqsZ8+4EJfRL3yQOc9q?=
 =?us-ascii?Q?9yDmwHxZbk7DyBqcXz+nmvbR/HSLLtQ81GmnRlQGyA1M8NlGn1xm3064ukij?=
 =?us-ascii?Q?2nkwCfa5WDp0Lk6BQyU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:26:15.1330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: debfe578-cb20-4091-f34d-08de131a0d9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
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

When the driver issues the SYNC_DEBUG_BO command, it currently returns 0
even if the firmware fails to execute the command. Update the driver to
return -EINVAL in this case to properly indicate the failure.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aPsadTBXunUSBByV@stanley.mountain/
Fixes: 7ea046838021 ("accel/amdxdna: Support firmware debug buffer")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 63450b7773ac..c6c473c78352 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -879,7 +879,7 @@ int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
 	aie2_cmd_wait(hwctx, seq);
 	if (cmd.result) {
 		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
-		return ret;
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.34.1

