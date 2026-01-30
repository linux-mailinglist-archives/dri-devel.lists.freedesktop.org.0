Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGsLA0T8e2n4JgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 01:33:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721FDB5F15
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 01:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C193110E067;
	Fri, 30 Jan 2026 00:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HroWjp62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013028.outbound.protection.outlook.com
 [40.93.196.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CA689A5D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 00:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+5lw2bsBZUzYDfb44sBvlOKbdyEW5llIoJaRRV49aEcqQY69gJGhMQJS6nV0pHnTsxXyocNMVk1/+gMmSVe2PSdYOJBbzogXSIV19rVDhEjmPUJ+vi8tLcCT5l4P5XwyaHKaCvNmikJqVkiecQuReMo+GUdjh3nIy9sA+KMCxsDJ18P2z+dVorcT8Sbv9Cz2YnHKmg9jj9N5JM8w4I0th+3iiDsWgqkox3+txJZcjl+qE15NB2zthhb+b0EhvcgUOm0OZ8yydjKfoMC+q2KCTAxwFiLNnrD3etinYeHZmIodiK7HPq+3oRroWUaG9vOwAfASDjqalwF1geH61k8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWTI3dEyv7sR9mjwePaPBljoh37Bmky5HQKgv2cpzI0=;
 b=o3Df+jtA8984/L079WyACj71/Hkanmbn8VtJMo/XLrlliI4MyPECwNeNjUneY+g2520epk5gdYinHrQpQFOam/nHjrbWW6g4n/9fBcxJG9qQVYsXuXAQCO0u+ViEiN9kYXV47sUz7PswuY7v682mjBAkSrVL3ObLBTDoFwrzKImLfNz5Tc2mVHiLSL7oMgUYzQTjT+MpuyIr+7Qgrk5tV7xufy6dBHjdo9OFtNZC0arnwss87Fsr7DKqtsghmEH/90PRFQtMzhL6qFd8Po0sMY38Q9CSPG6a60Tde5bNDjM2Dhvjg9wc9ol2JVivavQP/53Kt24pH/O6x2Eclh8K7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWTI3dEyv7sR9mjwePaPBljoh37Bmky5HQKgv2cpzI0=;
 b=HroWjp62S/IYRXECxdlKDtIM7o9MGWkHiQm8XuvAUcKroRBpdFk0uyoRWufuaD6ZkAlTPerCxvyADnwvNHxKIpXU63GN43JdWd9Glx4wx/kPS5VpqwJp5Gb15BY79ZW3TBIO+7B1f8WSgeeuUkrE6pNrhGCovTWbYZTfPZIs3BQ=
Received: from SJ0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:a03:33e::9)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 00:32:58 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::83) by SJ0PR03CA0034.outlook.office365.com
 (2603:10b6:a03:33e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Fri,
 30 Jan 2026 00:32:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 00:32:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 18:32:57 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 18:32:57 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Stop job scheduling across
 aie2_release_resource()
Date: Thu, 29 Jan 2026 16:32:55 -0800
Message-ID: <20260130003255.2083255-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: e3648a79-fbcd-47df-c3b8-08de5f971e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o8BEkRhSzOSsPcg1cWHZ/bPRyn5IIykyQPCubuJ0AE61zMuKGi+0v/KD+zzl?=
 =?us-ascii?Q?M4m5xGi4VUhu4WyUOR//tLluN41uMJB+hOpD6mT3V0fvCDJbx2bZRhXBDo0s?=
 =?us-ascii?Q?5pq0gCfJspSe9BvnEQx5i2gMAjcHExFYRbsdE2SF8ega22OAXed8myFfd3ts?=
 =?us-ascii?Q?tU57NHV57+685yGcSeqUivL/TG3UEvi6l44MSpjTuc/OUEzf291tfazXO9C/?=
 =?us-ascii?Q?o/T8/36DWARCPEl5L/ti35waagKMUTJj0UEooXVdt7pegu4734DaOocYIiE1?=
 =?us-ascii?Q?2XeXCrXkOtxL1MkXI+X+mZIPM87eLCxqh3cMCZM78VWiNpLV3HSKeT8o8lQ7?=
 =?us-ascii?Q?FxEjsmpfkCmcSt9D4YVkWy17MjYkjEc4awqiCMAPS3+gJhQgmaVX6SuIfF9Q?=
 =?us-ascii?Q?4lnNYLOs4bpE/qVIj2Z2Dd2bnyyiwXpkKIWNO5KWPaBa2MN2hX7jelYJiWmI?=
 =?us-ascii?Q?Set0f90GvSj9WN7G5awVEUZH3XqQRt1GfzmiKijEdrKmGzQuayPTPjRxDPRM?=
 =?us-ascii?Q?d8L/uRCc5muFhqjpRvTLrJBh/RJGkEwemZixgkiU+BdXlwUAVYJDeCNSNlQh?=
 =?us-ascii?Q?KcxMif1hWHgUTqY79vsLsXy+uWiNXPadP75RZyP+ncO9J9UyzdYVSIFdMw22?=
 =?us-ascii?Q?cizaRVN8ImRNRfSZDoHHHQxfoX3Ofgd+AxfoIR74aAhdJ9+jQyJ6QK3t8/Wg?=
 =?us-ascii?Q?T+duFeH3GltdFIACebAvvUXgamnr7d4Arvbr+bOzg60POFM4H8HtnFgkbGDk?=
 =?us-ascii?Q?xQEfN0cavzLe3/xPuC9a8Jf3ujGdtyZ2XH7irokMpIeqIpHA+H+AogL+QV0G?=
 =?us-ascii?Q?CbVuz32PUUfNN0G5qtsizBckrdtc61rdw19Zj8Zltre/qlgz4jC/X748J1Fp?=
 =?us-ascii?Q?H8VFnQpJnM75YLLm93b/jvLlH+UWog/OsZpQLJcNoVlXHRfMRID6h805PRjS?=
 =?us-ascii?Q?7TKb9jPMK0IIJ+LtyTwHfdtfLb3/PtuMGtmhANJYdD6dMq8WKXDc32BVwJcY?=
 =?us-ascii?Q?Exrbzx9DM7mV5x0gqIvjINB8epg4Yb6zlz9c3IfmWQGns/2Ju1B1VTIzYOmK?=
 =?us-ascii?Q?RtjZosQN8yAaRkKLFHTIXg8iQSbees/V1nyJSu9qNoU3ra0PID12q54ccqJY?=
 =?us-ascii?Q?rQ7lVNXsme8nIRFTyG/i2k2zbwK2IcRMOvFksjANn6jdcQ4mm56g6XaJT+L+?=
 =?us-ascii?Q?RBR6c6fJI9Ml4N9+F+RCdAbTKMhZfBmxDCcBGJVqDOnG8ZYvPY1A+4h9D13J?=
 =?us-ascii?Q?O4TE4bfEzUEh0Y9S/MsYZodkV+tgcPB4FHhTtcY9GI1VDscOHZLKL3FB8OFo?=
 =?us-ascii?Q?gVDy1g6MQH0lKIE95SXMeEXHT2rrdxdFnmgzyfxRXSuaSNcFYRhSNkszuYbu?=
 =?us-ascii?Q?TzBPd94vbixDWaCRaJPpQLbtlIfeyLLsosQNVF5iTdjQ/cC1j0LzQN7Opukj?=
 =?us-ascii?Q?ZrDOYn/2qYiOz550KYVKOiYVlaeTG3HG7KyVCoH9XnG4BAHhgH4et6D8Odc4?=
 =?us-ascii?Q?wSXWOx3ZRX9oxm71oMFTKSfYNqTXQk7WgkbYMonYdQF0GHnUfpZaQf6B6YUn?=
 =?us-ascii?Q?VlBuuOuqw/pYx6jk9DiHTALe//nOCbm3noGoT4WTNgC8RucP6WATIrpWhFcV?=
 =?us-ascii?Q?Hboe1Uof2jlXWDqRgKyDmRQf2F6TM6DLgL7QirsoK5mHYS/lBBxXrM0PmkES?=
 =?us-ascii?Q?ngKliw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PbMGcLBhJ8Wl3k7M1aZiVuDIxEn7QnplgRi54jWiRyltqM6EbpWFy1sUT92fUbBHtp0b9RFsN4JneeLod3olbQ6kvhJnJwS5sOuWJY+ZBRDAEypMoEBhcQdrfG+706SoucRKV7srKrt+D+N6lseX1uYuh5vbbgmWXICjuvO5+kvEWSnS9ZsDvpr8oBA6LhG790fSn6n8vssH8BPAJMYD4SoVRwc9QQ5MmlgWHNVdLl1qm6u2P7rJqAIUlO+HV/ploPzDRIUKpG8jIsdDcRanRr9iJA8Oz0cYse0BEOKc8m9bLXXSJZJ9mxNAkVULITGvtKkbmHLGMPlBPEG4n7u7qjy7/8ABPrzDyX3qWF0AtkVDMDc7sK81qWEWAp1kn7GDzPc15dwfXl/usUlSTtfptg95nQNNIcV03SAdjC15m4czgNstzBqAGU1BrNDEyjl0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:32:58.5489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3648a79-fbcd-47df-c3b8-08de5f971e55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 721FDB5F15
X-Rspamd-Action: no action

Running jobs on a hardware context while it is in the process of
releasing resources can lead to use-after-free and crashes.

Fix this by stopping job scheduling before calling
aie2_release_resource() and restarting it after the release completes.
Additionally, aie2_sched_job_run() now checks whether the hardware
context is still active.

Fixes: 4fd6ca90fc7f ("accel/amdxdna: Refactor hardware context destroy routine")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5511ab2ef242..c4a58c00e442 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -315,6 +315,9 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int ret;
 
+	if (hwctx->status != HWCTX_STAT_READY)
+		return NULL;
+
 	if (!mmget_not_zero(job->mm))
 		return ERR_PTR(-ESRCH);
 
@@ -705,7 +708,10 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	aie2_hwctx_wait_for_idle(hwctx);
 
 	/* Request fw to destroy hwctx and cancel the rest pending requests */
+	drm_sched_stop(&hwctx->priv->sched, NULL);
 	aie2_release_resource(hwctx);
+	hwctx->status = HWCTX_STAT_STOP;
+	drm_sched_start(&hwctx->priv->sched, 0);
 
 	mutex_unlock(&xdna->dev_lock);
 	drm_sched_entity_destroy(&hwctx->priv->entity);
-- 
2.34.1

