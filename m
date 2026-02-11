Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5R+tKGfsjGlNvgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:53:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7712789B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B293510E64A;
	Wed, 11 Feb 2026 20:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I0lQpuIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9D10E64A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:53:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v53TVLvUWSwaiU3R5AP/1rWfPxmIpcsqheph/TaDHcMGxesO/Sd219CWZDM5rx6pcYE2okxJDTD9ZculE6mclAOX/iRwQLI4D4irgXmmBDLqgkH7JXTI1VJDN+yh3IOH+u6/O6UBGCmdzXTRU7cUkkla4vDv7K43jsHjOIg4rpl+ssOLe/pLKahC6XLUaO5WPOa5dl2wCzn4pOBSvrrPI8vBPVqEniB9Q4NSEbqjq24CGk8IEztDfqi4lHxq2olLEnrOELAGRhnHZM61pMXZQ4XavKpWMe1o5QaqR+GtJlXkyIsqI03IUt9RnKkhXYCrfLd/iM+G10vW4IRJFKxN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyfrq8lxHJU48BKiTMmNE/Tkwm0YJeTcAIpDnT7J69g=;
 b=nUNOdXZuYlVXyTR5ewdfI0B5FCH8Z4RTqNZ9uSbE68+i8TTnv1k8O+9wlEE7MJGBS2vamgrLoBCpG/rfBUSktRVN6CPkZMAmvD6z/7tLFKKTDJACxnP+UGRiffvyULZSqGj7VsA/jH0GSSWTFAVNAVe0X31M8r0xv0tAXRP12fTTKJy0q48cDhqIXOfy+plQZU9WKGOES79OYheFmJvf74Z5SZLnZekzZ2yTLwITtcCNAy/MMlYtNPtM7F1HDkyTGDdvvefZtBwt7YV6WhUqJtEXMlASxAAckP4KMMe2f3YLTa7uvBe4LINM6sqfJSvpVbk91tfUhctzwSq3g55AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyfrq8lxHJU48BKiTMmNE/Tkwm0YJeTcAIpDnT7J69g=;
 b=I0lQpuIWbrn+LI0U7DXitObhio1n+pbnLa5Kdg+XuMgQyQ5RkkWpfdJYmB476frMqiU9cUWg7pRTb7glO+m2XI1I+YLHevzXCvD1XwatXORIUcP3juFxbIe1tuRiKtMsO9Al3a8Sp5MkegMPJq7991T+HG6daOn0jb33yHHkEdo=
Received: from MN2PR10CA0010.namprd10.prod.outlook.com (2603:10b6:208:120::23)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Wed, 11 Feb
 2026 20:53:45 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:120:cafe::97) by MN2PR10CA0010.outlook.office365.com
 (2603:10b6:208:120::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 20:53:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 20:53:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 11 Feb
 2026 14:53:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Feb
 2026 14:53:44 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 14:53:44 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix command hang on suspended hardware
 context
Date: Wed, 11 Feb 2026 12:53:41 -0800
Message-ID: <20260211205341.722982-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: a6831f5b-0f9c-4403-2c73-08de69afa5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZQbj2M1QURGaeA+/sJu913zSqV7J/FKJnhbskvXNDKIdpy2N1YqO240WPyDj?=
 =?us-ascii?Q?SbPCzEBEx0iSFBfvaiPJjd4fcFcZ+/OvZzgIMvvgOoxqnQ9PfmhhEHMkIQ2o?=
 =?us-ascii?Q?aljhzuFmr8bDLN7SfB4pJ1KpsHXDIKBJJnTQOcuA1uGiOVmDSQTuqVd5Ygwa?=
 =?us-ascii?Q?hEr/nS8UJcvzaX+ZVXzbFq7ySF6vEhhLfUKzmRGgCHOj2OLSKrVuS4IuTtI/?=
 =?us-ascii?Q?S0yZf52i9YILQP22lbLPP5Ka0jsWvlY4Ix2FxxfrrOPH1DQg475Dh3Jw2ePX?=
 =?us-ascii?Q?JzsAL6vrcp8jbKEWVEGXMs62N+2P7xOWN16W4j1Sz33uu/oS7i6lDlrx2U0J?=
 =?us-ascii?Q?OfiP/Boq00jrDDjXUvWqZJr/u5mOs4BBUScY7ULm+hRa8ms8fUY1kySfMH/m?=
 =?us-ascii?Q?VZUyoeP4S/RcALkGUa91bGdXvABIa9QWGI96hINNv0IUhF6JCNtNSBQ4ah7z?=
 =?us-ascii?Q?eXxC9Caxkhc0QQkyOFCuls+eMSryn0uuuawZMLOqtvdvB7LpFKqLUn4Jjs0r?=
 =?us-ascii?Q?teth1vzxc3trr+pHm8+eabnecbB/hbOUvLxFi0fE1G63hat089wNzvHM/n1k?=
 =?us-ascii?Q?IN+l2mljBvCcF65tGL7TyYPFbPrir7DcjvNpkjUUx6SeUHi1a/to7iKDAj49?=
 =?us-ascii?Q?Eb5KiYh4CxDqMv64unHPdpg21DY0IJYiHSVqSRNNiw6i0yRWaqyKl4J9l08x?=
 =?us-ascii?Q?KWb87HaxEDtkmLE4JfBQTnD5W+fCSE2bFGtgnPqGnHx45NVDNh2KWudeqUWD?=
 =?us-ascii?Q?56P82CZ0rkCJmDubnHIQ+gkC4cpbG8cXPi8YMZAF8lLAgRhmZNGGScO2Cnja?=
 =?us-ascii?Q?lDZCjVkXa1cumZoR4lhe+57YogSNgW+SirZiOipAZxQPHBX4WFxMgU7XCOiG?=
 =?us-ascii?Q?erbCojBtKBdMMJfCwVsWks6MADBdxbT3QD1ARz7sdftB50flsWyE6cs8NFNi?=
 =?us-ascii?Q?6A8p9ZLHy7I8iWKkdjoIUIQ5toMdpja9xvpq8yZzwR+tpr9hKWE2aljSNZxm?=
 =?us-ascii?Q?2uLEcajLVN2jGFyA9jYB5z8njzxsfMPxWrciIbCrsNm+ZV+6Ui7oVMeumV9b?=
 =?us-ascii?Q?jxa74U1XE/LS4v8JSEpqyFKM70V/fUGnBVutVNS+CyH5DNRQVpi87cxkgAkd?=
 =?us-ascii?Q?xHQeGIva4wNlhPXhinoM4pC/E6xlzV35Zs3zLwyfJSu8axjzvtE5y00eHXO5?=
 =?us-ascii?Q?A4Tna0uYtKmiiD799/LyDfFNhtSbF5djBXj8p+X374ptooAKfNbM/NUGy+Za?=
 =?us-ascii?Q?F61gwDutJ64b5W2KDlOcbYL2474V4tcnmx9NWHa2Ku/kIh9uoEWM++7bl649?=
 =?us-ascii?Q?CMoOqUifj3zMkZY7ABOs65hbxePQlg7JAb7c3gZJzVkh4pJAYKNP4AzKGtJI?=
 =?us-ascii?Q?e8V1wF9AOjM9e66cp482GipZhbQ6ixp8y7MJCeHzvwyWx9z31Nt/baE8s4A/?=
 =?us-ascii?Q?My/0tcf4zzjhhDoES7e/FvJS6C9KgBLgBiTmBrNH9pAGOcwsGst6Q3IKUZ5q?=
 =?us-ascii?Q?lsX3LLTqNfLedUEOfIu+m0DM29M0xUsOVW24P0atufuUP2nn1E2iPcb+7lxg?=
 =?us-ascii?Q?gGM4cWyW3RqWjaMsy3j1Etq/TCLBKJH2H2+/xsIr9aqcodlKdN2aZjfCdYr/?=
 =?us-ascii?Q?aNn21+5qFXMFdX+Z8j42DZpD+yhH2p6/nfluW1dJu3SFaMG+LQMcxr0pEksF?=
 =?us-ascii?Q?1Y2zpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zJbAiAH0Rwl1ew8Ok1rafy+/QNFROP1/9OjuOwXodjQ8q7eFkxrBg87RdEbFs+AveOAgNoMJXmLWVP6ecM/DYvv9aYF+cjToncAsiJcxnmAWbtMevG2unacavYMvflvbnt2h4gNKRKLVEAZ86/UYdrN10mvUZn//yNxTOiKQGoRKjFgdbBTAYZuTtR7vbnZfYU8STBOSFGASVW/CrAwBJ+pxghUgTnNawSxmbXaJ/GxzeAtboEDb4wNg6h3wrwhrFVwOyRYqQi3godi+X15Ud9xiiPFLPy+4/9svxFMPtk3x1qlAo0FbYaC1l6At52ujsTIj8x0d1g1KVDEcn9m8dfarUbFu19qt/2e+t7Zr4wRY7vIfOnplLskbVnChyt/gvQ5sfqK0eucVr9NmQKrp5B+e9AyLUZXftPoYy02usXT5WMmO9kkHN0in+A+157zC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:53:45.2269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6831f5b-0f9c-4403-2c73-08de69afa5a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DCD7712789B
X-Rspamd-Action: no action

When a hardware context is suspended, the job scheduler is stopped. If a
command is submitted while the context is suspended, the job is queued in
the scheduler but aie2_sched_job_run() is never invoked to restart the
hardware context. As a result, the command hangs.

Fix this by modifying the hardware context suspend routine to keep the job
scheduler running so that queued jobs can trigger context restart properly.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 89c0ab896f92..622ddbf7fb6f 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -53,6 +53,7 @@ static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwct
 {
 	drm_sched_stop(&hwctx->priv->sched, bad_job);
 	aie2_destroy_context(xdna->dev_handle, hwctx);
+	drm_sched_start(&hwctx->priv->sched, 0);
 }
 
 static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx)
@@ -80,7 +81,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
 	}
 
 out:
-	drm_sched_start(&hwctx->priv->sched, 0);
 	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
 	return ret;
 }
@@ -297,19 +297,23 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int ret;
 
-	if (!hwctx->priv->mbox_chann)
+	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
+	if (ret)
+		return NULL;
+
+	if (!hwctx->priv->mbox_chann) {
+		amdxdna_pm_suspend_put(hwctx->client->xdna);
 		return NULL;
+	}
 
-	if (!mmget_not_zero(job->mm))
+	if (!mmget_not_zero(job->mm)) {
+		amdxdna_pm_suspend_put(hwctx->client->xdna);
 		return ERR_PTR(-ESRCH);
+	}
 
 	kref_get(&job->refcnt);
 	fence = dma_fence_get(job->fence);
 
-	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
-	if (ret)
-		goto out;
-
 	if (job->drv_cmd) {
 		switch (job->drv_cmd->opcode) {
 		case SYNC_DEBUG_BO:
-- 
2.34.1

