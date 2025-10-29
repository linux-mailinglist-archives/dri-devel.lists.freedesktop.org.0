Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0AC1D045
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4D810E828;
	Wed, 29 Oct 2025 19:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cS3bv9Zx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380A210E220
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qANyv63VbxHZTR1ueAcf5bNqrYXnNwQGDDYOxZA6RRZA8qMiHgEOjterLosdFEiQYclDWgXFUa0D5YaASpZoB8lVxW/bn4VNchD2Vg+7BS//NFvY5pYTx5EaacGiZERvPUy2KQFngMdT7HnjNmHS3ygdpvbw1LauS+sIcsm6NRVEoCR8ygFRvrPXFTPMVPgrvxcjQe5UHvDy0yCtlr/GqYOnEBivWIHvAEgorHqCdEOYXkTI1gihRlLFX/5nFDTgsfrbRlvnomrQky29Xm0leCUFjFz2vlvI6ew1yTjwClTNKNX8JXOf3UAfuGqqZjIzaOd4ZC6vv8usSuCxReUDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqB6fFWEnxXfAYiod5n2sTbFz9fV+eIVZs2RXbMXHm0=;
 b=HgiKE6fq84jBnBqbVPNBchwsX796+SjRPxSDLNK7PQqh4qr1yERDgfuDpy5eLwyssK1VlgHuMz/4WtuZwToiV6p0Z5n6Tz73k5PfoEupCi2hP+kCce2i8HIxOZoRzT3tbFpw7vU/nY8+qqQxIf3mX2XCoAa/pWLVDD5G8S+N/MZ1C2IKoWvwcQpA6ds/3PJISt/RfZq6px9GQqgzqWUD8LojyX4e5JG9ESRI7uU6+Q1XquUBVHXXOv4ShJHOBlUpvE/uSJXSfHt/FaXn1ZjkxkLpqLilatz5fU6jH67qkcpW1AlctBEggvl2QruHU6ubLrPvSsU9nY3MEfO3ORduqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqB6fFWEnxXfAYiod5n2sTbFz9fV+eIVZs2RXbMXHm0=;
 b=cS3bv9ZxU4wzb7gqy7laZDFLpFxOd47sS0cIhBxx+03LtyjgJzbgHVMkbvO58V7Ns4YAB8OEUCVRY7F9SoBkLDh8vLlIq0B5gXF4u7vjRKuxnc35XCWujnsLmcuQIvkjpYGJpNAiGqRrR/7XloDEc+cuMH9KK6K60cMpSJWZRrQ=
Received: from CH2PR02CA0024.namprd02.prod.outlook.com (2603:10b6:610:4e::34)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 19:34:31 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::65) by CH2PR02CA0024.outlook.office365.com
 (2603:10b6:610:4e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 19:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 19:34:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Oct
 2025 12:34:31 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Oct
 2025 14:34:30 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 12:34:30 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Fix incorrect command state for timed out
 job
Date: Wed, 29 Oct 2025 12:34:23 -0700
Message-ID: <20251029193423.2430463-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9300cf-a39a-40ae-f5fc-08de17222ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IAfbBqdrYcWfN5DVozG8upA0a+KGMdSCfmH+eV/3/pvPq/zzPq2zhCQZ72gC?=
 =?us-ascii?Q?4iU9OOk5J3JbWG+36gKbBi7LpnHm1+hLy2IoKESgJuU5CUVETTUbVd2iwdd8?=
 =?us-ascii?Q?Ji0UztDBdinNcI8lmMtW36CjsWE0NE9JVEIohIJNeg51M/bzJPkjH/n2raw2?=
 =?us-ascii?Q?xBBE3Ch/kOrkFLjrWSM1CR/Wdq3Kqod4sDyPYub9gjThxpLH6+pvyrw+zOHc?=
 =?us-ascii?Q?7lDL79wXWTtAC3dUaIB1AWO7seK9NNKszzAQ5kmX/2/JTHyRcPDgb/fbg3tH?=
 =?us-ascii?Q?s7OPDRmbnpv0ct49tgBmM0sJzLS1qAInWOOkAQOCLcK2zveYVi0ZnQpEnRD+?=
 =?us-ascii?Q?e493x4m3taeuzfRKc7VEI92gzzNZEvtn0xIR6ZG2bhDWTNlWuoCKk1AWXgVg?=
 =?us-ascii?Q?It9B7OsslNs3cWSkfHrn9Kferz7C284cUEE6qyAG4+XETaRODV1H85rHyKvp?=
 =?us-ascii?Q?dmcyRqO88fVz5dSK13h4+1k44zMIF2ujP0BQlcXL51JdiszXND5GiwwKzkAg?=
 =?us-ascii?Q?CEbQktDSzWd9bssfokownDO1IkMCripRDa+2GGQnvMW2rnEF8ukX41cH14y4?=
 =?us-ascii?Q?oBvZoP1dA9b5Pa2pTTfbOrVgANGsK+3ALw+SKyVudkK6e7flh5kvMvmTEc/I?=
 =?us-ascii?Q?DCMmPNKXrs3rgGX25sJhoVleq4coHRBwLomzxwRpuIih28yp39POYM6dyVfI?=
 =?us-ascii?Q?wR2hMw55XDwpf+xx6oSggfmyKTgAUKMt8GIBenQfAQZQB6uuxCL7wxxujcpE?=
 =?us-ascii?Q?g0RC5z09WCFO2TZ79lZMgsjN1tZ7PBAY30s0hRJRWKsF1/SinEWvR3gECep9?=
 =?us-ascii?Q?v59waXkCtW17PVqzqx8F/xpfh3WN1Em6YKcEce6Fny1feP1KfGhpXKGxy3X+?=
 =?us-ascii?Q?Ie4cw4eNWrlL06hTdhOOhXiQsDwzmS6ENeQkqAqJjM+UMmeEVUNde7eg1Dt8?=
 =?us-ascii?Q?Vpl3oz0hcRILRvbtRcx5vHXtDYz9N9f5hokmt+0GPGxvogTXlSAWjVxG534e?=
 =?us-ascii?Q?LVHk57ePxoJ+5Zwn3J6oxALco16pFqid+XYLYSynLpGs4N7J2mFOi9FS5FSo?=
 =?us-ascii?Q?Sdjk1whk1JxaDl6dHfpAZU+y2+LyOip35OdpX0oNCaub1XqDyKvENqPLfkuG?=
 =?us-ascii?Q?k6bCEFy2pi3gLvW8xcgXSXNmQXw00tmqPI/py2jS56rm9JuK3JAgwYMVtmxC?=
 =?us-ascii?Q?VSWUAjZNmVxOB/sTDEgwiwEb15XJb/qQfAJu/Pe5mUN7gBVM2eT2L0IlWWpr?=
 =?us-ascii?Q?Glj96AbKVwFAQS8EUPoKu8GpjXZcV9PtNZx2fJEQWrwTenNq1L+ox6eeDEAj?=
 =?us-ascii?Q?n5XkGCM3uYPobJLrMP6io8HrCg2n6lu2P2gqtPDQZjaCMAWVFynyIIk60exP?=
 =?us-ascii?Q?8elyABG5Ux7BBMVPp4ezGYRbbux21fAnqD9S3wG72+d8NLsS8KYVSPNBPGuk?=
 =?us-ascii?Q?+6ZmR2nG+RRmO0g6tfY6iUivT1o//K6F0ezw+n49i3f2TmJXvw2cyJHkn0m0?=
 =?us-ascii?Q?sQgzPjUkjrXGho8KSSwcMV7hhTECpfl7SwKaCHr/GXo9Bv4v9i6vsaShZdS0?=
 =?us-ascii?Q?TrvGLk0cHDz7bEW+3vw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:34:31.3447 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9300cf-a39a-40ae-f5fc-08de17222ec5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
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

When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
commands that are canceled due to this timeout should be marked as
ERT_CMD_STATE_ABORT.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    | 15 +++++++++++++--
 drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index c6c473c78352..289a2aaf4cae 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -204,10 +204,13 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
 
 	cmd_abo = job->cmd_bo;
 
-	if (unlikely(!data))
+	if (unlikely(job->job_timeout)) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
+		ret = -EINVAL;
 		goto out;
+	}
 
-	if (unlikely(size != sizeof(u32))) {
+	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
 		goto out;
@@ -258,6 +261,13 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 	int ret = 0;
 
 	cmd_abo = job->cmd_bo;
+
+	if (unlikely(job->job_timeout)) {
+		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
 		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
 		ret = -EINVAL;
@@ -370,6 +380,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
 
 	xdna = hwctx->client->xdna;
 	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
+	job->job_timeout = true;
 	mutex_lock(&xdna->dev_lock);
 	aie2_hwctx_stop(xdna, hwctx, sched_job);
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index cbe60efbe60b..919c654dfea6 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -116,6 +116,7 @@ struct amdxdna_sched_job {
 	/* user can wait on this fence */
 	struct dma_fence	*out_fence;
 	bool			job_done;
+	bool			job_timeout;
 	u64			seq;
 	struct amdxdna_drv_cmd	*drv_cmd;
 	struct amdxdna_gem_obj	*cmd_bo;
-- 
2.34.1

