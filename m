Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAXEB81gi2nDUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:46:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F211D659
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867E110E5DB;
	Tue, 10 Feb 2026 16:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3S24FElL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7B810E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMX6XEbR3WWnOKz0b1rFloAHH4qmD2DaYQQQCIADq2/H4Zhb7Qze1UJ1W1YPyaXDDp00SAWTN0xh7t/pN4wuOvNDI3Gw6ejnX9v01VtLGi66FOYvxA9b8/1JtqTrfOjorl+ALIhnwEvrQ8JXobUZ4dp1HXjg3L+CUsclXFkg/KGjmfYrThkwPuppVRRR0hgWeJZcDqytBWwAcUKP+L2usyhgiFmYIw0/67goWOuGkQrX306MjjNS4IRtXP0vXN9/nV/lDLc6+9XrSkOaz7KYFE7Mdkjw0wyqZzThUYj2MiRT+C2s6ppJN/X5drpY9lcU+3siOUxqZLwn4WBXw2QeFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JlJGI+2K6Up85LfB8ZwabohR7Y1GMdG6xRVYcS5/Bo=;
 b=RSP/AVXVcCc6zs5Z21RjAwspL2D/rIsvWeZd5KxuL2IhcKSL4MyB4h2kozZCmU8S5tssob8zbZlB7CFOcm+QNs6rVomHBZRxRyFgP2iuIkiinrawRpRAvR82JFD0W9NZKCfCPInkamh2useqBJI4tD1E90o/QBTS9v3RwYMGG35+zJZ79QCPzbsze8Ud48kzbC1kryZ6iavsWzEodDB3O/EITmNhrfK1Ozx6sQoLob5u+mgzi+vjOhFlE5aaxAW2x2abjwXeOiUAat7CH5WNmZv09uTZFKBrESoFTiSSvlRK+k8bUag/vlKkeEaGW+tJUnWtd9006MWMGfXD4B4xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JlJGI+2K6Up85LfB8ZwabohR7Y1GMdG6xRVYcS5/Bo=;
 b=3S24FElLXKMSWSmSSR8n6zLeqMDR6DJsvhKcy4PIywN52zSNW95QNOsu2eTyjDRzFl07KT+0nU5So9+Jp9s6ljgfMlJX1Y9EQBl5+sGgz9CnJrBy1AExSC2Wfmin+aRxKpDa1+RrpuGL9CKkhErWX9p9g66Gq//5xldySO0H4D8=
Received: from SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34)
 by CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:45:52 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::40) by SN6PR16CA0057.outlook.office365.com
 (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 16:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:45:51 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Feb 2026 10:45:47 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, <mamin506@gmail.com>,
 <ogabbay@kernel.org>, <superm1@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] accel/amdxdna: Reduce log noise during process termination
Date: Tue, 10 Feb 2026 10:42:51 -0600
Message-ID: <20260210164521.1094274-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210164521.1094274-1-mario.limonciello@amd.com>
References: <20260210164521.1094274-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|CY8PR12MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc5df03-757b-4d3b-b9f3-08de68c3da04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Np3ItZxT7mlie6TBfLpXNFmLfhNrnBzEiZIl3DCe5jANXR64tqNt+ZhSFwj7?=
 =?us-ascii?Q?d9f1vjsz6qweSyz8h+18LJUwXX25TIlosB/Shk9DvutI/5gwetwXKiiz1sRq?=
 =?us-ascii?Q?rhJ/iS36pwAWNjynwhvok/1n1DzW8W7PqIvAAEt4pyyiVh5rTFVKQf1q8fep?=
 =?us-ascii?Q?nSUemu8zamkJ/856yp9INtAfuk7PQziC8OAt1HuMuBNaTcGhp34seR+fkjF0?=
 =?us-ascii?Q?p6LUPegbKRsJl3ozAC9RSPNRZLOo+q8nbQvEYWobOUDgIXIqSu3vXnvfg4u5?=
 =?us-ascii?Q?2WEqizq6TBBaxJagY0NROzUJN03LuXipBU9tIbfUL5OgI+LRNfeuHvE3m727?=
 =?us-ascii?Q?9DQx/o6MaT5TZ5NGhKcY/DuiUKe/vIngqi1LdDEtROpMyG1ux4gmsixFOxYb?=
 =?us-ascii?Q?na/2X3D+Xhf7mCkMKdTeKNYKSj4aK81T10+gCHLi906CnSvid5Izc3i7agNS?=
 =?us-ascii?Q?PzEcSgi9ApinbTVgIhTO3yBvptqatnyFaZkxFiNcdEnyKlQwD5Lb8dVyJI1U?=
 =?us-ascii?Q?iRDxSqO26zG9Z0kRaHVN4NHFxkm+Zprxd06/eUOjQs4KC67IXP4Q7GJWSq7/?=
 =?us-ascii?Q?kNNOJC+PTLSHjRfog33SAi9MDt/pdyil92dFdOKWMhnFzzKYpKErSmO0x+lY?=
 =?us-ascii?Q?UzNaZiAjWnTRhrgS+DlWEp23WviDjd2KZk8T8f6admcnLwtbAUpEnay9+M1q?=
 =?us-ascii?Q?aBWX+Mzs/cLhZLrFVqBmt4frjA0UI6+/xDPUmPjY0xrTyQYmtS5LiIcWZUcb?=
 =?us-ascii?Q?GvK10uE2NBKIHzjTbcFVRFl5dbZCymHPyZ3l2TMfR+hrM7a3hQ+dlHMjN1qn?=
 =?us-ascii?Q?K14uIE0CTGHSL0aU9iQ2avoot84vlnCjxrl1+yoVrrQ/rnYCO4qPo6dBfueR?=
 =?us-ascii?Q?4rkZxvdZ9cszY+HIOND8sLnixPzDR/sHA8j0pFv6VD0OQ4uhGpLmot5PR+dZ?=
 =?us-ascii?Q?Xm82ZoYjU/pWF/IAZTX7jHJeAWpVfQcU5gKKXbrCyjGGCX2UoO+s5frFvvU3?=
 =?us-ascii?Q?fpLiDfqSBq3UP8deG0RpyUPUKOL7IvNc6zpWsaKK6qTtbzz8+YgwoHTkM/ut?=
 =?us-ascii?Q?CLwxB5TDmgo7jxOtxg4IW/pxMy5DSTKdp3Lxaw0MrzCl3VHvxCMneqkg4W9m?=
 =?us-ascii?Q?E2zp5Njxxc7xDdK2bsa5BVhkMDExPMi+h+xK+y6D6C8zKl60iEB9cRX4x0uy?=
 =?us-ascii?Q?Iwr38ZZpKI/4S4yZeeTmYGXFpo4wP+Ci2ovVLtlTeI0xylZLG1kuQIzTPByr?=
 =?us-ascii?Q?ayUfFZyJ2UhqW62xWoRFHiWz/NBjTQ+oDSFSUQkM6Zhjgj2+OnUp7uYXOfC6?=
 =?us-ascii?Q?jYfJTCpDzuwRKBBU6WGddLWq+2FCrslBYGrL9jLr21GS/T0bHGiFmOMZ1iK8?=
 =?us-ascii?Q?enD87Vqw3osi6yeZhQVpNR+n5FSJAxL805zD/OMFc/EsBEzcUVTm4fyICiIB?=
 =?us-ascii?Q?cF7n4Yd28JS1bhJfhy/nHCJN/rbE2z05PzvjO4kmFe8ltee/WV0L5/xHC5VI?=
 =?us-ascii?Q?DWd0R2eqFnDQKOhKuA8I0XUM71LotrzLQwVEfF3u3p8rgijGB/02yrZkZyWJ?=
 =?us-ascii?Q?2lnHJy1ZyWloJfoGXzcVhrMxqIRIwgvDfY094m535VnmpwpSaEoksa0GHvC2?=
 =?us-ascii?Q?TPbZzQu/n6QHz2ntWoVPqGCW08jlKUzNtYS5dfIbJiz3Yy3YHCMskY6oZ/5f?=
 =?us-ascii?Q?zJ/ueQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y9xWE6WX2XCQeMEknHB7LWnMepcyk7YjGwbtIZMjS7n7w8LThRH6nj4kjyFSMbR3Kxg0iC9vf3CpiJdIhcbFnqM3cp26DQCBbBnhWcVSat/lbj2y+t2iuxwhpBzVXx4wgXI4OW1Buw5rc7bQHPIQk9i3meL0BWTmzaIhBzyKcgQhiBMTc1dCHFWhWMnLFEJL9pnDLtarQnYxz4gpUAzfKhbIjDtDTPDBI0TFS/SXAfyCFz/BINu9hXzxvveCTfgEzWVD208cIvlrWWMl4vHEv9EcGyUT3oy+YJJwyIQJ38uaACKrl/G3ljnDmOYqUTU7qdNI7TtY+ohAfQnx2WfxfjdpCFswcCJzhCxouWqyetrjQOtX3RwXDZAYBdKtOCSU/T1YvWvJqA0hSjxLQvL8Si9SPAUI0DAesfj6FfGK+2vW+ZLGtgukq48b+RWLX3D9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:45:51.8228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc5df03-757b-4d3b-b9f3-08de68c3da04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: AF2F211D659
X-Rspamd-Action: no action

During process termination, several error messages are logged that are
not actual errors but expected conditions when a process is killed or
interrupted. This creates unnecessary noise in the kernel log.

The specific scenarios are:

1. HMM invalidation returns -ERESTARTSYS when the wait is interrupted by
   a signal during process cleanup. This is expected when a process is
   being terminated and should not be logged as an error.

2. Context destruction returns -ENODEV when the firmware or device has
   already stopped, which commonly occurs during cleanup if the device
   was already torn down. This is also an expected condition during
   orderly shutdown.

Downgrade these expected error conditions from error level to debug level
to reduce log noise while still keeping genuine errors visible.

Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c     | 6 ++++--
 drivers/accel/amdxdna/aie2_message.c | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 37d05f2e986f9..79f6316655e73 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -497,7 +497,7 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
 
 	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
 		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
-		if (ret)
+		if (ret && ret != -ENODEV)
 			XDNA_ERR(xdna, "Destroy temporal only context failed, ret %d", ret);
 	} else {
 		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
@@ -1070,6 +1070,8 @@ void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
 
 	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
 				    true, MAX_SCHEDULE_TIMEOUT);
-	if (!ret || ret == -ERESTARTSYS)
+	if (!ret)
 		XDNA_ERR(xdna, "Failed to wait for bo, ret %ld", ret);
+	else if (ret == -ERESTARTSYS)
+		XDNA_DBG(xdna, "Wait for bo interrupted by signal");
 }
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 77e3cdf18658b..5697c0c2dd43f 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -216,8 +216,10 @@ static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
 
 	req.context_id = id;
 	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
-	if (ret)
+	if (ret && ret != -ENODEV)
 		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
+	else if (ret == -ENODEV)
+		XDNA_DBG(xdna, "Destroy context: device already stopped");
 
 	return ret;
 }
-- 
2.53.0

