Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK/qEcF9g2mHnwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:11:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2EEADF9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE53110E6DF;
	Wed,  4 Feb 2026 17:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L6D1VoTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012025.outbound.protection.outlook.com
 [40.107.200.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162710E6DF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 17:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDZlEJ8RhDILv7HhccFNgetYSAg6Q5i8n+2RnwqfFzT8VEq1d+/bG7n6b6aBcU47XoUL7EBRKtFf0vgQiFSBIrGueHKrnBsLzaQ1RtrXjYX63ovjdsmAgyex9rgBF4VqkZb5Byz6ETRfk9Hw0poQY/utYgC0gL/qb4k58/bVIkaBRZAKz9nQoEAYNwTpaOhToS4vNjy1pIp3BD1i3a2O/2FES52AbRcciTWHDMDCorO6qn6BHev06McWYwcUb9PaWB9/V3uW6YLAoChRKD2guiZisMHXkKMrzBwU9FFXQxD5vq34sKmzJBzt5h8YaKkIXG7PXYNQsIjcQkLYozOcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdT19pvI9TgK5Ur+VU7BdrVCV3DbUGYLQxqQmXkRSC4=;
 b=acUhf+mDrbTBG2bNMDQ48pUmWw1nyBrFEcdUIR3biZZWYIcWhMGHWXdzkcnqdDVeqRxhjZH5jwE+ZEodbovxHJ2LDE2fhZGnAZ7gjD/v/myX+GwoggPE2zkqFBcThZBwkDh9n4kyL6erwJdOBpuaEhsQvvoa800ykHEEpSbUtpV2VBSu83te3r+JuJynBk9WJ7XXMUBaN+hQ8CGEtR1mnXE//5vx4eALhI3Yb07RG54sqGwHGMGSziVY5UrsFASSzA3E876TjcGhAFYnw7RswAmofWzF8L3q4MUlErB/ARaxTGcMySXRAdIh1D2R3nOOt6Gw3oiFjMzLkS/uis3LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdT19pvI9TgK5Ur+VU7BdrVCV3DbUGYLQxqQmXkRSC4=;
 b=L6D1VoTogxw3OAVm6G5CN//8LMkgacwpOAo2VH0feBuBNsT/aNt+DYncRovTUBDA2T6dBMUOgi+Mt9VmHjQ/LHcC+OdO/MjpVTg/EF0C3jscnfeGRHuR8a2VQi896DbPEV3XOwDAUIQbA0xoPYA+SFlD+A4h/z6W4iHDhbOFG4Q=
Received: from BN1PR14CA0018.namprd14.prod.outlook.com (2603:10b6:408:e3::23)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:11:19 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::d2) by BN1PR14CA0018.outlook.office365.com
 (2603:10b6:408:e3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 17:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 17:11:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 11:11:19 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 09:11:18 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Move RPM resume into job run function
Date: Wed, 4 Feb 2026 09:11:17 -0800
Message-ID: <20260204171118.3165607-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc0c0a7-7a1c-435c-03da-08de64106a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+oGjU8727U5EXM8+3i0Y2kpu8fqJ2ZI5R/iISWI4/tPyvfU0aH3spNc9rVnF?=
 =?us-ascii?Q?0+yqFHliPMbiC9qStu/cqR1Pw1heE5Nr/q9BTWds/U+MkwjE+nRyHZRupPyK?=
 =?us-ascii?Q?4E6eR87gnM2YeWNYI9DfS1B/a2HcDNn09uZff3ls1l7xkRKJovG3hgbSvi2B?=
 =?us-ascii?Q?NJB8YgcMVsxhcLyuQT+waZtZc29upTZj0BWwNB745ngfHhUBwI68Dm55Bm65?=
 =?us-ascii?Q?o7CIGnXJE9LAoViH76Cr/A0HRSN42Dp8l/zujl3XAVrOKTRA10fLi4O4nmTW?=
 =?us-ascii?Q?KX+2dudx50Ulca3fSld4x72/iL1EIp05MFfAH3oMzPQ7geeC/nSHadH2qcMQ?=
 =?us-ascii?Q?oswICz0JbYo+xG1M90smqtFnhEq8rQLsGEjn7sLEbVrtfG+x+L5GzQLhPwNb?=
 =?us-ascii?Q?wt9P+U0POpmZiOamamhUa0J4Jmljzsfq7pksxyIijM5Jc6Zq8mnjjObD3iSG?=
 =?us-ascii?Q?07UCqAwMHAm8cX9zIBxtoVxoX+yVWnlXguZh5mTbdRwQNe+02Z35qHHIVkXu?=
 =?us-ascii?Q?WvwoqFihWVy5E1Bdam+uhC3V22LesrY+6WPazMb/B9qtDAD0psxfVG37+mEU?=
 =?us-ascii?Q?Cv/NKK+8oEhn4+IcyJ1IoR36rFEDmbW9ParnYviHMkgLtlf7tJkblmXtaGGq?=
 =?us-ascii?Q?rvsGn3ENaY9YmMIVACxfO/RUOhCbYuSIXALGaGGrbQYTOKiIScDyvAVQ184R?=
 =?us-ascii?Q?zcxdy/B+sppFxT89hmBkVBg24IoK0paRmPNCafx/vtXBZGl7e9hhrQqnOidz?=
 =?us-ascii?Q?ekBLoq13BUVI3mAMsVoAMcpbdf2sfpTAsxBf9L/e+N/S1gLrjmLq4LYsroSj?=
 =?us-ascii?Q?2e0d/WD5Sbi55gerJYcqIDfYlFpwaBJcwpNVJopLgUPQfciK0Duo6lSQInCG?=
 =?us-ascii?Q?3TPz4sJERdS0Og620NF46an/x49TKoUCcLPv49xBJ40VWJGxs74q1jUFNpdk?=
 =?us-ascii?Q?PnVIFLxlVNOaENWOSEYtHHC6MeuWYTB58cnlJZtzdFxyfjAkeJ0zboaWotCQ?=
 =?us-ascii?Q?uKclf4pC/Wcgoz/jaX+v3ujkx3oVqnEvllE/llnVn67wBMDF7EtJ9TVA6kLv?=
 =?us-ascii?Q?clJ0yLLhzlw1nTUTXgu0dBHIKpPRHRzwMKD/j/Tme4h0ptlTeygo6EW/DJ+X?=
 =?us-ascii?Q?MDLI5WVuLjbCL05BT1HBYJXptLnI0YMjSffQAtUk/6AuuX7pbmFXId8cb/z3?=
 =?us-ascii?Q?dIFFkKA181mdpEL33qF/FqcVV+1103n85w47KJXQavT4jMB3q+ALix2DYRwG?=
 =?us-ascii?Q?UAb5nFipWlyWvgUKlWOSn6Swjl2lC0ncPvYqZ1kugLLUBU52KFoZpfma8kBr?=
 =?us-ascii?Q?8RFJcolZo9vVOV13ZrgwP2v+K82N7Y+oa+hrkoqtej+aDMkESboZfJH8mlEf?=
 =?us-ascii?Q?OT0ezPoICSaHxWICb1C4T8hb5dRqaaiX3lcXp7nA0J4ZTP3tRtK3QDY+1ki/?=
 =?us-ascii?Q?HThqKYzYM7GEeRIksp3vHmYebJsRIL3lWUqa6hRAikYTCQ0U3yJ64cKYAQxn?=
 =?us-ascii?Q?CnlsaP4/Zv8rnouz1uxXaFrDHTJzh3l2kgbm+o8bzsAArkJNIKFwTNKc8WPy?=
 =?us-ascii?Q?pgh/U1a0Mp+E1162BZ8AgiiwSwdGkZdOggtM9GbTTqTcIbxeD0bbdYYASlk4?=
 =?us-ascii?Q?kEbhuUhc6EJEOO2NOqfxcHrEPJ0yr60p6W8Z+lD/gKWqsR0hc3WokYBpJKF9?=
 =?us-ascii?Q?cmvjsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5MwbE8iljcCpTFezNLXdTNNgkdal/XZM/Qva7wMmtenFdol3Nbj9ZpILA2HXbtql/s0GVR6POE2Xawo/1XsgOWsKpkbcZpCUSv2GEqTKqF8OgYP84aBiOtptzrjd0Sn5lHeSO0KDDd1zYIgvTKFLNqnTk+QekNG9Sz5WkYZbmdXUK93o6QVFa1Lc0SzYu9At5nLPEv11cQSQcPwwRl8uqTX+8Ei1VmjV6muaGjBdBYA58wb/jkv8fsRjdpX6VVzUl30lMTsTF9KqWUtJea2fXx6dGZ+VMl+jHRULJTpd1zpebDxDpvCH1XXUlafpYanXdcxLs+glfaDnF18b9/xQ0uE6nyMcOh6Y3DS8If0ltg+wu5r8+lTdnWuBx8C+BnqVTBH/8nT7OEgzL0qwQFhuvlrW66nD1h38EmY7jRUS2prguI+ABGINuSeh9kqzF32M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:11:19.3539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc0c0a7-7a1c-435c-03da-08de64106a02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAA2EEADF9
X-Rspamd-Action: no action

Currently, amdxdna_pm_resume_get() is called during job creation, and
amdxdna_pm_suspend_put() is called when the hardware notifies job
completion. If a job is canceled before it is run, no hardware
completion notification is generated, resulting in an unbalanced
runtime PM resume/suspend pair.

Fix this by moving amdxdna_pm_resume_get() to the job run path, ensuring
runtime PM is only resumed for jobs that are actually executed.

Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index fe8f9783a73c..37d05f2e986f 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -306,6 +306,10 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	kref_get(&job->refcnt);
 	fence = dma_fence_get(job->fence);
 
+	ret = amdxdna_pm_resume_get(hwctx->client->xdna);
+	if (ret)
+		goto out;
+
 	if (job->drv_cmd) {
 		switch (job->drv_cmd->opcode) {
 		case SYNC_DEBUG_BO:
@@ -332,6 +336,7 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 
 out:
 	if (ret) {
+		amdxdna_pm_suspend_put(hwctx->client->xdna);
 		dma_fence_put(job->fence);
 		aie2_job_put(job);
 		mmput(job->mm);
@@ -988,15 +993,11 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		goto free_chain;
 	}
 
-	ret = amdxdna_pm_resume_get(xdna);
-	if (ret)
-		goto cleanup_job;
-
 retry:
 	ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
 	if (ret) {
 		XDNA_WARN(xdna, "Failed to lock BOs, ret %d", ret);
-		goto suspend_put;
+		goto cleanup_job;
 	}
 
 	for (i = 0; i < job->bo_cnt; i++) {
@@ -1004,7 +1005,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 		if (ret) {
 			XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
 			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
-			goto suspend_put;
+			goto cleanup_job;
 		}
 	}
 
@@ -1019,12 +1020,12 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 					msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 			} else if (time_after(jiffies, timeout)) {
 				ret = -ETIME;
-				goto suspend_put;
+				goto cleanup_job;
 			}
 
 			ret = aie2_populate_range(abo);
 			if (ret)
-				goto suspend_put;
+				goto cleanup_job;
 			goto retry;
 		}
 	}
@@ -1050,8 +1051,6 @@ int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 
 	return 0;
 
-suspend_put:
-	amdxdna_pm_suspend_put(xdna);
 cleanup_job:
 	drm_sched_job_cleanup(&job->base);
 free_chain:
-- 
2.34.1

