Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE1ADDC9F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9D810E15B;
	Tue, 17 Jun 2025 19:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X0/8lSQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486B10E152
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2kpEQhP2rouq9sz92APJx00dv80syXGnR4tB0irQRlBObJUaeHaHpmsZfblj8jCkBftSmZhkxP4en1FHY7mlQNC1b8RqPMM31szZl2t1RhCuFKwfwTZP5C4fNg0ntkIy2SMyIxLDBGH+sK7fRr4Jj5Mv6Oj0ZJXRAbcv6KG4/2HdhIHwMdDtyGwSKnExa/tc0olg5uwhG/OOmEAZh0+f0xMwnLAB7DsAyPCRm0bTBmFPGiGvbMTvd1q3iW/C7GX8yeqMhefZpNaRIlDsy4ECouBE3VLD1e5YxEM2pCIFS3pHkLXUu4jNGG5/2ZuITZrPj2WBLB5n5sGYLmhRCTEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6S/p0o31y9sg1s40Aie/Ay3zvEDQzY2GSOHTAicZV6M=;
 b=x42LdKlaWKq+fQBs6YxAu1BY0JVI7Kx25C1NbV3ViFpjNM12KQMBfPh8UW+0prp4s56kAGn1xnY3Jj19dQvGp09UyS7j4ELrXm1YhRF74PnpfDUANU8Yq6ySWyvU5w/P/7i7MPtXT7lNaN+J0cUSZzdEIX0ejXkkuVyvKHFs0VAitnCaHfUkPY4OCUSj1kSncRXRCbAzt9xiB3Sp5zaxkWbYpk7YLbCTwKBKx/QsRf3+0BpywLiwSfzpJc8ocvPDRrq7kSR6GmWn2S4YLBrUCLwxyXjM+uQ8DrpKb3cpDvGzXaBxlAMkCcoPtMEiYJLjbPfYkMe6VyYuYcINgCMmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6S/p0o31y9sg1s40Aie/Ay3zvEDQzY2GSOHTAicZV6M=;
 b=X0/8lSQUCILwE2pJCfK4FSbb8kHo65WIYBYtSfzmYl4xBMG2kHaG2UONMMp0F7+d1dXxycpIfHiYxUP8qDYmqeugbOgpBsiDR5LVBPVPN7tSUt2+Hp89C4CdyENNOKrtguBeZ5d414he4TPVdc7LFI02f7GL2q4eTK1/s6qzkAQ=
Received: from CH3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::23)
 by IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 19:46:03 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::95) by CH3P220CA0001.outlook.office365.com
 (2603:10b6:610:1e8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Tue,
 17 Jun 2025 19:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 19:46:02 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 14:46:00 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: Allow kfd CRIU with no buffer objects
Date: Tue, 17 Jun 2025 15:45:36 -0400
Message-ID: <20250617194536.538681-5-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617194536.538681-1-David.Francis@amd.com>
References: <20250617194536.538681-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3133d34b-3353-4bc4-e9a0-08ddadd7979d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ThpWqr6hub46/KOKv/cGa0R8Eit+nHmEzF0D87YnNV6wSAFHUz3Vm0t3+Vu0?=
 =?us-ascii?Q?LFv6J3ZVZVIxWQAW92V7HnrKfDyAnwa3VEe475nAz/T03Td1V7+z38U5O6L+?=
 =?us-ascii?Q?8X8WWruJU2FXtzIE/JCoDF4HEd0CTBsYBAcgjj3ekj9G8DOSTblVq+xcrkBu?=
 =?us-ascii?Q?9YWNioMcapPPKqjj1PnxzU1+DCVaBzI6ttX5qBC7eUttbh2wIVk2c4PhexTG?=
 =?us-ascii?Q?SNAGoLzq9Vs7ia/2R84YKMxnAMw8uSfE/sggfQk1mKPppoF/wsNYlFnbwVpI?=
 =?us-ascii?Q?EUzQ8/R9+h/evXOrgCJvLFDFxO2k63I4PNDD3vWeff8rfSCNJv7nl+RjrpMX?=
 =?us-ascii?Q?9CtM+ILWFYLQcq61pQjVLdF+0/uMtTaAo7GYIT8naYPrcYBDFhtS1un9/Zc5?=
 =?us-ascii?Q?8yJLBjzR5ave3x6Zti3tvoMzSCrR91v2GU0ABdwWy8AtvypcQLzZ7vrgKA9v?=
 =?us-ascii?Q?prqGHmk/S1wo1WOpI9mAc2rzpI8yFFmWaNkv9rjuj680jOXWS6EJnM2oOetp?=
 =?us-ascii?Q?AI2/FtO6hAf4t3gP/A85j4iZGXHGMVn/MJQAWvx2eB+FIwXBFsa0pE0kZSOJ?=
 =?us-ascii?Q?LGPED7WkJN7/zwja+NCtpkkrBl0tKa/Ti9G+bkioctbIdiGBUWW3y1ajbxBC?=
 =?us-ascii?Q?hIS0vTV0IId2T2WKuypsIROeBs4QHHbpbfqBbQoo2VV1fERg8VENZhZYhZcP?=
 =?us-ascii?Q?BYYhUowtaQE+Z/2186k44GsKX6X7Q96VK9p82YR2CUIYqWHu4FEwqvYNTDr+?=
 =?us-ascii?Q?fSPKxnDQSICKMliCk9QDWi5y0/2Bk+XLkL6ZZtOShKZyHTPaDodnZPOtTt+z?=
 =?us-ascii?Q?OHJI/+wHumhv7ZcH0Sd1f3T15RDrwk12q+Z0tSPLEjiPBQt0pHYgO7zjA1TV?=
 =?us-ascii?Q?Nm5dsDoEnWM5HohIKTSu4bGaqqFPXy4g9p+99C/QlxaAJPhtTsFp3igSgsuG?=
 =?us-ascii?Q?4kQYm8zbrabsxjHgICT/hF3tGmj8nEnRw96hTomfeN1TLacPrH+MQh/5hWkE?=
 =?us-ascii?Q?3FnyW2SjZh/LEo5TQSA1wo3CCGdA6dfyxVIzcJtTvZOROZxVTXwwFhjB83e1?=
 =?us-ascii?Q?6DmoScXcjX7XiTS8OBRGO9n6jjcHx91ZXPnJl1/h3inxr0axG65fTL6+6EPq?=
 =?us-ascii?Q?OtySiQ22kl6mrAZP5OmSRUFifh/xImMzPI85F0lavutI2w8jeuvsluh0VVIi?=
 =?us-ascii?Q?Tw8Knl6BWmmHss28JyPHLSCodvQk49Cm+6o2OKjwffPXAVMuxqF4wmItKJ50?=
 =?us-ascii?Q?RvmMJhp7WgtwVYlPu2pUjrFF4oC0GLBnQ4TkyfQEMWXbL3JZ//jBYJ3VRMdr?=
 =?us-ascii?Q?N1PPLYf/maxh334WjhmcXo7Tsc6s3kglp4AsCYd9Gj/dxtH7x0AGLvXqcZFz?=
 =?us-ascii?Q?dsnQeV5rs9uEnXA2uz7wcGSTttHcTs128mj1sY4k6TuzLY6QJeK8hsAzmhn4?=
 =?us-ascii?Q?JObAful4LUhEGkLSTaWCUQ6IQqVOzpTfOgNIVN/3qy6tQiH262r/MA6BGw6e?=
 =?us-ascii?Q?Xn3AZlIPgqlOrS29P/jFBnJs1p77f2qcurJ6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:46:02.9204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3133d34b-3353-4bc4-e9a0-08ddadd7979d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833
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

The kfd CRIU checkpoint ioctl would return an error if trying
to checkpoint a process with no kfd buffer objects.

This is a normal case and should not be an error.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a8cf2d4580cc..9617c696d5b6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2569,8 +2569,8 @@ static int criu_restore(struct file *filep,
 	pr_debug("CRIU restore (num_devices:%u num_bos:%u num_objects:%u priv_data_size:%llu)\n",
 		 args->num_devices, args->num_bos, args->num_objects, args->priv_data_size);
 
-	if (!args->bos || !args->devices || !args->priv_data || !args->priv_data_size ||
-	    !args->num_devices || !args->num_bos)
+	if ((args->num_bos > 0 && !args->bos) || !args->devices || !args->priv_data ||
+	    !args->priv_data_size || !args->num_devices)
 		return -EINVAL;
 
 	mutex_lock(&p->mutex);
-- 
2.34.1

