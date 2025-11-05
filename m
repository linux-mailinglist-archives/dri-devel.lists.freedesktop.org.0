Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BA1C37864
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 20:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329D010E385;
	Wed,  5 Nov 2025 19:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lat1qo5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6E710E781
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 19:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeQYl9MQkHiDLgTIHNApFAZKDtd2T8X94+M4WfpH5IETYMtV9ipzLTZdTI4LvmryOKWI26u0QHk/cADdgM9WaTBp6jsTQxuIHyTqHnLqVn3s1sj+5lCmfIG3Pl2NLAnN/U5hIZZMlnk7p/2aEOdtXzldj1nwrzTtNbbO7S/3+sTTCee1E+K8RdDm+9IP/F3hwvGYyBFtyu1EXn6waTStXMinwn89Qe0rqP6cQWazq2jbaeEgP3p7OQDb/4Gv1vspwbBQbGhrjh0Fs/FNifflnUvV+U9/v1IDlF9PU1Ei1TKW4489ge8fiQRRpqrjLKmLOEOVdqGL1Sz3IgRhVCpbCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFMQTxeTbgCV8hWXm41WC7k8bVpaBV9VBn8jQzTeHY0=;
 b=iXedheq8o50KBwBClxqZ0dg0bHQTsRT5ERyzD53lxzYXTA1I4K4YnOxYUf1tX0WUa6Bo/Lebxw5BZrcDwhwBnQ0E6jdWUQMzdq6WZ9D/eg6mcPDJYKQKzxA0rmz+JfBefCMOjijfLVXPSEkFJDoRGEn71EA4xUi31gFFXcfDNvvapbGrbQGrz6qMN7XEpmk0nxjKBQpflmKSQ6n98hyM474Wbqh+Q8x3Xf3trco/iVuQW8Tm6i6f6xciMCCjhDPNI3SrvIFpert1U5xN6B/zN+aQWpzcco26oAUycorS5Ax9NzeGFpZC4XERJ4IBkRoeBH+UhtSjGDQIamRZbHqjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFMQTxeTbgCV8hWXm41WC7k8bVpaBV9VBn8jQzTeHY0=;
 b=Lat1qo5RWAoa6cMP6DNJMcFDNhrZ26OmcEYkeVFkrjdcOsLqrgqGIzrUC66xQvLLnhbEzuWRf4ZjhrrFHDvcmfB7KviKV6CqV+pNF1kk79MnBjncXjqsBLbpVDDqnxI6NxEjZ+qLbTDGWTZfJ9hF0gfZ201mKVNXELPsqT8S/b4=
Received: from SJ0PR05CA0121.namprd05.prod.outlook.com (2603:10b6:a03:33d::6)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 19:41:43 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4a) by SJ0PR05CA0121.outlook.office365.com
 (2603:10b6:a03:33d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Wed, 5
 Nov 2025 19:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 19:41:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 11:41:42 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 11:41:42 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 11:41:41 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Fix dma_fence leak when job is canceled
Date: Wed, 5 Nov 2025 11:41:40 -0800
Message-ID: <20251105194140.1004314-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f57c0a9-740b-4af6-7fe0-08de1ca35927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dhwSOlA88RBOoLXHCOjpEQ88Ng4sFkUgHoixg1CHN2PBx5NO0iDrxVVHhwTX?=
 =?us-ascii?Q?id7toU89TdDcv2WoKsP3tmIQds7ZID7h46dR2xmJ7pk4wWYk5C1GQ+W5LCtZ?=
 =?us-ascii?Q?Mu5hJUVMnjuvqxK6KNsz6xZhvib7Z8LnLhOoT35fIvK6IT/Pr4MpvsTUa2hN?=
 =?us-ascii?Q?BWXdkefNyTwpGqwOtXIaD2ffd+lU4OHf46iaPJevfvfJm/5EpuC2FSgPAzdW?=
 =?us-ascii?Q?6Nfp1FvcB1SEZo1IxKrxXqxjgKvLyNF7NWa4Uf4VIlLxPTaRRdxSryQmDB+D?=
 =?us-ascii?Q?lzPlkRtI1B2x7Tekwu/4iFPfjO9/w9FOh3Rjr4JggKGFRPkSR2KUwn+AJS4l?=
 =?us-ascii?Q?RlEU8bHpnXj47cxO3rXdtgSx+glE/0zc2aiCsk0lkrqwXv1GXgz3VNvTqT27?=
 =?us-ascii?Q?yrPCqAbEO8gqluuO3pxEBVw1tWdQQ3kJl76fRhrhf1WPMXkMmNfoIg5EFuWO?=
 =?us-ascii?Q?1K+dGoVAateiEMBsvhf9NKsw5n8zALvHb7n6319J2Sa8qxqVUjG2vfkVzm0l?=
 =?us-ascii?Q?O/rayBvdNynORWObsdppt5tqfKYbJnb+xy2iAdSrit+HsiOnWiF1gsBTkhMe?=
 =?us-ascii?Q?1inamoHnMJC/EtQr+dFM+XNpydpBX3fbZtOQGsgwewM24gYRJ8PxfzdXbDK1?=
 =?us-ascii?Q?tBhaRv8yKVf0HYoNbJ7qwVf1b/mlKTmOz40K/W+Xxqf9pSYKg23IzWScFQO8?=
 =?us-ascii?Q?ZoHBVXUpaUM7aF4eGVfHb5hGjxM3kZbAzDPM4+dLL/4Rq46kyPANxPq191XB?=
 =?us-ascii?Q?8SgzhnEIq3eybeL063OYutzucugQyN+9bVH/z9X+yPyjxt0Maa26PE6y4+TQ?=
 =?us-ascii?Q?Ad2IgfH/Q6h659eJN+Fcygw4j0irLtyADSz/UJcfj9aDejeAyOcUNQA6t0Vp?=
 =?us-ascii?Q?q7FTO2PbioJ8aSUSpTkisTxhOauVQ+krg1I9iyl8Oc/6EojLBTO4l7+eMwdZ?=
 =?us-ascii?Q?q4kfv9Ec5xg48gPRzE8CV7jt00CZOuyKUJj1moMq6VAh0jBq5GInCe+zqd2i?=
 =?us-ascii?Q?52B+31NicjXSZzaIdQ2BItuDPQ33DZfWZXnbdi/EL0BZ4CHHuxseEykPWPts?=
 =?us-ascii?Q?kDx8hYVWHR2XLGxQRtE4WBONV7rkanOCaFXvaQQsI+2Ye2aX0+h/LTVXpO1C?=
 =?us-ascii?Q?rbO5tkDWpEILflPjXivrxFKryWNHHfgJnztwyPq8rnMRCmTzKljT873cdSzt?=
 =?us-ascii?Q?lp37zVLuuL4jVymOLbwtKYkryjXlgj+iJA0bCljg/0XQPG6DU4IN60iN3ML8?=
 =?us-ascii?Q?/VBF75PbjOdEUKIpPb/E22U+H1uJhq3G3IZwOqoqPY5mT6pycyvVAJ0D20WG?=
 =?us-ascii?Q?iL4527kxQlR6EXDlPXTwV6qqPeAVbkHpSTEr8JSAnVBqwq5zcXt6o+dnn3gs?=
 =?us-ascii?Q?ok7t/npYTHOAbsXE0lmOdYmcOZRO3AaliiVa7yFysw4/olt8kU2JTszjo6T7?=
 =?us-ascii?Q?VUrU72oDx7A2LEV/d9obf4gLy7H1UuNgjTKGxCQODiGD/Zx7Jx5hVT+kMOm2?=
 =?us-ascii?Q?Ep2H9v1bSHdQF4Xh4sV42ajNcpCqDtV5OQQMyAP4yrn6HhnTT9WZKgifU+nZ?=
 =?us-ascii?Q?FuQS7frDlGVNJrbgehM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 19:41:43.2841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f57c0a9-740b-4af6-7fe0-08de1ca35927
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909
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

Currently, dma_fence_put(job->fence) is called in job notification
callback. However, if a job is canceled, the notification callback is never
invoked, leading to a memory leak. Move dma_fence_put(job->fence)
to the job cleanup function to ensure the fence is always released.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 1 -
 drivers/accel/amdxdna/amdxdna_ctx.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 2b51c5211c2d..e9dd9e03ef07 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -189,7 +189,6 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
 
 	up(&job->hwctx->priv->job_sem);
 	job->job_done = true;
-	dma_fence_put(fence);
 	mmput_async(job->mm);
 	aie2_job_put(job);
 }
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 878cc955f56d..d17aef89a0ad 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -422,6 +422,7 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
 	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
 	amdxdna_arg_bos_put(job);
 	amdxdna_gem_put_obj(job->cmd_bo);
+	dma_fence_put(job->fence);
 }
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
-- 
2.34.1

