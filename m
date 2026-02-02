Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBhdNzYWgWlsEAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:25:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2DD1A55
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D3C10E2BC;
	Mon,  2 Feb 2026 21:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hfXyYQDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6D710E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 21:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G80FqSX4O/37jFFhGkkd1c0g77TutsU+10XPfa7zZLKwY3HDNJq4DmoWMUIfi/T5T39xeD2ASF9h35mkVBqlSilVDtogIkBuJiBfhLr/gbJS4bB3BV4uWa0lpbacnKEU+SyGbsiODKnxiTkIdsbAZa10GGMVOJD9FIF3XMt6waETJyje6lDPQ20PHUZb5iQdYUSUKCw22iFJLI2M9u4imqk9qFMO6glOj4UOo7IeI12IjjKtchbEtnIDzU+Xa7iVh2J2Le9VnajCLbd/X1jKyMrX46BWC6on48g/MrWf/O/SUwtztQmyVE6NyYEWYeQXGrCudLNaQuhbEMpx7xgloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atHWOpA1lrH2WHY2WqL0dCawLwnH48NwfBpEQKNdimc=;
 b=Gcar1ffjHMZmGLooSqPBpVnzT6VdITOKqUQaLb2IYi6Obj/PYcgu/Bwt+vzUsj9tMYAeSkEPlwzReKxcU5jI8G3Dt2E1E5GqusP7YHKBlWQpByenHadYWuXXC00cHhH4kvn99YOmkkD9uDHlRN7wEhRRenRS15/a1fiwJIvfjNGy2/K4EFQ7mQev/ZBBzTFF3kZfiAQenWnFLHUaaqbJaJpSF53r2ZQsrg6y734JGzYB9ks+N/7kzo4932hVQPcYM+8N3fKecrVC+YqBcVmLQj13kxDg9OHvPdqgZbhIw7WYS1IQw7U72B9TAUM61eREP4apFpMTmvNi25PgbPKQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atHWOpA1lrH2WHY2WqL0dCawLwnH48NwfBpEQKNdimc=;
 b=hfXyYQDVp6dlzCG1Qd+DDyEE0zUVIFQUyGARfLU4d4HQiVm81Sab8aOGLuG+y29xy8XN+m8pZ/oU2jytauOfSSrbqjUStmSPFRobFbvM6saNaGcC3Yf2ARqEr92RgQAc29lTkpUdnf4EHaw5j0KVX3w9ziZwX9+JY1fm8/LLXhE=
Received: from SJ0PR03CA0180.namprd03.prod.outlook.com (2603:10b6:a03:338::35)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 21:25:01 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::9e) by SJ0PR03CA0180.outlook.office365.com
 (2603:10b6:a03:338::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 2 Feb 2026 21:24:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Mon, 2 Feb 2026 21:25:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 15:24:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 15:24:56 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Feb 2026 13:24:55 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Remove hardware context status
Date: Mon, 2 Feb 2026 13:24:50 -0800
Message-ID: <20260202212450.2681273-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecae9ab-825a-4811-ce3d-08de62a1859f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yzjz9RThafyfuKrpCxMgx7SJnaR2G7WHOI3AeLqXGsHPVu6P3nwuNxrMR4Qx?=
 =?us-ascii?Q?EgfFVFJ0USXLPOIRTesovEAH8lVVddOi/ReKp7SwU4mZgqMmaHCJmTkRPIBF?=
 =?us-ascii?Q?y/mXLNuMgqbGjk4pf7JbtOHx5zGeHEMGPo0mfC/+vjb+2kheUkYy9Cll/FFf?=
 =?us-ascii?Q?o8GAbPhCbw/mNfiKF6dswXBMC1HrExZ8wJgy9YTljQVbXxHarENuDfZxw9Ny?=
 =?us-ascii?Q?PlOU/7NV+qPw33byQJYNNKUeqwAHIdmPmVZs/pNCr89EZyGJh87LINgzx2D4?=
 =?us-ascii?Q?rmSuxnhon85jn51kme0v+Wfg7JYN+6Ojz1qiTbvkLlpg3+YL4PkAWsQXvlVm?=
 =?us-ascii?Q?XoNEQpvCQUQc6V8FQ6+gf/8cEH68ufoek6PCf6yNxAEqAbbjV8nBictPAiuB?=
 =?us-ascii?Q?oba/lin0RKXH886qzt0Qo/SA5RP6NDeaHguiT0tfw1bk9Xz50uAsgFd6Q9F/?=
 =?us-ascii?Q?7qc8EABCh/idXtYm05T/F1tA48QuGwV50IQwTVgevKbObic2rMXbM4AGrNVa?=
 =?us-ascii?Q?JnOFuL1dCsoFawvsmvz7FmSsQjR3wuahrIwyOKX7PHUt8qFHlC3kFp81ddBv?=
 =?us-ascii?Q?gjdgjhqY8L9rlbrAT/ZGU0dDvRKBtEYYAdw5WFQ8WcPdkWlffSfU8n855lOD?=
 =?us-ascii?Q?K5MC22Ter0eNqZ/f32pslAkZeY6GRNVMlVAh38KlvDmqdEDAmemO+hHePWcn?=
 =?us-ascii?Q?xSjXwsu6K4wrE3aCCJ2indivfcmxlL6AagyNqlLPzZZeammu//duiGUL2a3n?=
 =?us-ascii?Q?97P3KWOU+o8sCyMtN/BaGv3apYFeAOhz+tfu2/7E6Fb//2r2LlxLmRi2Xduk?=
 =?us-ascii?Q?RH50D2VVKI87NBeS123HMpO5jS/oWHtArNvSPcTm3MadIQqhSwNd4AKqdXpA?=
 =?us-ascii?Q?2B7KYKfwMAgl0HAgM/jf+ZZ40fatLKp8haeP2TtXv3QTmiv2/SDztbxSKDDY?=
 =?us-ascii?Q?rqgakeZ10AfP9zaB+hsF7nzpAs058Qwjkx7q2ATlKxnaO/Oi19JrXpyiwk3p?=
 =?us-ascii?Q?z/c9FiSLk9FVgpEr2+Nf19mUYHuorzKPouFtLLydP2wPyVEoLjPf9B+X0naG?=
 =?us-ascii?Q?eB7p/ZebSuOW/WiWqr2RA6/PluKtzg0noT0aCht/Y0MCqIxXy9XxfcE3qCJZ?=
 =?us-ascii?Q?a686e3jRHWG0DP9rcH9LNjn0z7txBjWO4RvVoxWvzWbB+7qRepe1ZdSzz8TS?=
 =?us-ascii?Q?ynwrwfAmmqsECdRnUruYjYgrgeyAYNu2OlxS2f7LL73Zk23cq8tYFTITfZUF?=
 =?us-ascii?Q?pCak/s5lJSyRBeVG4UMnEr6sSy/fU3k57kLPdrynXP5RA8Z+OGwBL111+NIC?=
 =?us-ascii?Q?9LoRCdYjQ8cielAB1WeLZNm7ldicZAOAHAEgDad8ymcqyEt8jdDgOXd7Qc7j?=
 =?us-ascii?Q?NSGWyQ+foBAllVycBMAPHv0v8ZfVSVhSPdl2L+Le0GVrdUKYtVvukD/4dSTy?=
 =?us-ascii?Q?2zd3D0jA3SB4tCUWKSRmISG4A9Ebui1qiP10ANc4WjEvE0vgcFmnD02zKs5l?=
 =?us-ascii?Q?WtlR3HPjQa77bFi8lQr9Ithhb7fdRKOv3P3IoUEkgeDru3RSE55oG1pRZnhi?=
 =?us-ascii?Q?lebnJabVN0lK4Sq7cEdHtsS/Sqfzu/NGYsk+WNPI/l0Q9QoH9S1wdADNMChK?=
 =?us-ascii?Q?CJDxev01E4THm2scv/wyoFzSrU+b3oBKmzetRMw2UWpxGg3rPtwHGiR31C60?=
 =?us-ascii?Q?MAuCmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rMXZbvRlymJ0LVSaNtFKKRXiPDGE7DUwUYrdrgn7fIOikDP7gtzxjw5uxrEmbkUierIs1rFVFNeZTceF8MxlO5A42Fg1cnBc5KhYSBVzfl0xZ63q+O4tmJ0TOthvAIituORLGpBju+Nx5uNAW2QJoS7wnbmClgKXA3nJ4MLXzsQyEnAQUTx5+CGK8yXJPt46lhqS9h1Cl+TD/o69Zdn+QCwZf86/UGSI9K4jktnNxEOHtdixkWYUfncW1I9BMLTT9j9xLCkgJKJPzBb2LDS3IzZtKgap61PIvxBIs5xgjkI8uRe8JQ/En2yzNZMFspJ9wIU9IZFhTqhgwfzOz3RCqkF0PZ5jXiWPQYczS2pfeyo7r7/GvxdPO45QGNs02BU5D3vW+aicZfsOeXPJknojfURPWF6SGdzpJ+ZRsH81Y9kjHgdWMqFe7Io9c7qMAZ5y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:25:00.2950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecae9ab-825a-4811-ce3d-08de62a1859f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3BA2DD1A55
X-Rspamd-Action: no action

One newly supported command does not require hardware context configuration
to be performed upfront. As a result, checking hardware context status
causes this command to fail incorrectly.

Remove hardware context status handling entirely. For other commands,
if userspace submits a request without configuring the hardware context
first, the firmware will report an error or time out as appropriate.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c     | 25 ++-----------------------
 drivers/accel/amdxdna/aie2_message.c |  3 +++
 drivers/accel/amdxdna/amdxdna_ctx.h  |  5 -----
 3 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 208ac5b0579e..db0658fa03b9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -56,17 +56,6 @@ static void aie2_job_put(struct amdxdna_sched_job *job)
 	kref_put(&job->refcnt, aie2_job_release);
 }
 
-static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
-{
-	 hwctx->old_status = hwctx->status;
-	 hwctx->status = HWCTX_STAT_STOP;
-}
-
-static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
-{
-	hwctx->status = hwctx->old_status;
-}
-
 /* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
 static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
 			    struct drm_sched_job *bad_job)
@@ -93,11 +82,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
 		goto out;
 	}
 
-	if (hwctx->status != HWCTX_STAT_READY) {
-		XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
-		goto out;
-	}
-
 	ret = aie2_config_cu(hwctx, NULL);
 	if (ret) {
 		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
@@ -149,7 +133,6 @@ static int aie2_hwctx_suspend_cb(struct amdxdna_hwctx *hwctx, void *arg)
 
 	aie2_hwctx_wait_for_idle(hwctx);
 	aie2_hwctx_stop(xdna, hwctx, NULL);
-	aie2_hwctx_status_shift_stop(hwctx);
 
 	return 0;
 }
@@ -171,7 +154,6 @@ static int aie2_hwctx_resume_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
 
-	aie2_hwctx_status_restore(hwctx);
 	return aie2_hwctx_restart(xdna, hwctx);
 }
 
@@ -334,7 +316,7 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int ret;
 
-	if (hwctx->status != HWCTX_STAT_READY)
+	if (!hwctx->priv->mbox_chann)
 		return NULL;
 
 	if (!mmget_not_zero(job->mm))
@@ -716,7 +698,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	}
 	amdxdna_pm_suspend_put(xdna);
 
-	hwctx->status = HWCTX_STAT_INIT;
 	init_waitqueue_head(&priv->job_free_wq);
 
 	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
@@ -760,7 +741,6 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	/* Request fw to destroy hwctx and cancel the rest pending requests */
 	drm_sched_stop(&hwctx->priv->sched, NULL);
 	aie2_release_resource(hwctx);
-	hwctx->status = HWCTX_STAT_STOP;
 	drm_sched_start(&hwctx->priv->sched, 0);
 
 	mutex_unlock(&xdna->dev_lock);
@@ -805,7 +785,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
 		return -EINVAL;
 
-	if (hwctx->status != HWCTX_STAT_INIT) {
+	if (hwctx->cus) {
 		XDNA_ERR(xdna, "Not support re-config CU");
 		return -EINVAL;
 	}
@@ -836,7 +816,6 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	}
 
 	wmb(); /* To avoid locking in command submit when check status */
-	hwctx->status = HWCTX_STAT_READY;
 
 	return 0;
 
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 578eaa7bf137..53e13858077b 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -493,6 +493,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx,
 	if (!chann)
 		return -ENODEV;
 
+	if (!hwctx->cus)
+		return 0;
+
 	if (hwctx->cus->num_cus > MAX_NUM_CUS) {
 		XDNA_DBG(xdna, "Exceed maximum CU %d", MAX_NUM_CUS);
 		return -EINVAL;
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 4f641926a272..e90204edfb7d 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -107,11 +107,6 @@ struct amdxdna_hwctx {
 	u32				start_col;
 	u32				num_col;
 	u32				num_unused_col;
-#define HWCTX_STAT_INIT  0
-#define HWCTX_STAT_READY 1
-#define HWCTX_STAT_STOP  2
-	u32				status;
-	u32				old_status;
 
 	struct amdxdna_qos_info		     qos;
 	struct amdxdna_hwctx_param_config_cu *cus;
-- 
2.34.1

