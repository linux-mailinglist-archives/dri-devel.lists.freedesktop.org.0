Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA5B194F4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 21:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0564610E0A7;
	Sun,  3 Aug 2025 19:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JCbPdghO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C8D10E0A7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 19:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYrXIo3ZvZmoxWf+Oxah623rnp2qxsY1bNvIsXtQ/z3BpejsxyThAhY5Hk63ododt/bESpIYHzz+gM8WKhQBHUb+cGPOKw+u6IFrPI5bvLYXgwstwShpO1Conrl5+bODGqBPPO4niqTt45H6A2P7sdAmW2plz9EOAyZXczpMpTwoAD7KO+0pBS/3x4WYY6W6LuGXPuH2dRXcs3AfS8at97KmndrFF6C9+5nQqisgW1eZrJBmEXQE7QOIsbKy2IpWZWv+59AVtUB4hcbjQdiN5fLxpmGF7bocccj8HZ9/2usJWo+NGNc+43lJfk6H7Vu2T65ZJ5XjBQx8CV0nKZbwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNSZPXl/q8+MhyJdw1lbd0IxyBZQmwNHA/sIrPALYDI=;
 b=HYpCm4tIUXd0TsnUdF1O+OU5JYV8yefPOs2J9g7QjzupAwO5SkefJJF4RlNYi4YOCpKoKaIri7EWuygs+MKYwtT5aBuiOKKOWXGy+wdiVYqRup62VBqqm4hIuOydcObhUi7s1ahI48Mk6HuokbVx/dDgkm7EO4hKWkmBUOdoPA93irOcPN55rTa+u74q2PI4VKXMwZL/C9cHPARxq5UVJzdOclESm2rPMNy5Ze33oJbmqUhcb+dLdqy2xUZYBZgTQ46KJzuDkTgo14+fQ/q/fthXpIVRGGMCdacvMizM0TFHgafzMWnG+8c+FNm9RZVQq0WIMXc+VeTMejReG4e34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNSZPXl/q8+MhyJdw1lbd0IxyBZQmwNHA/sIrPALYDI=;
 b=JCbPdghOU03RjXnhKA1UA1B0wKXk5yPP3JM2z2ibwltaI7zifGy66FOEsBQy2R5C4TjAD6zBujB2PrfNWXnmv8gCoOqe39BqL/0EytW2jId1G30rS2BYqKt/8bni+/pAGRr1T6MZakgRHA/kuhnppWYbWJ1rVAecakKmqpPgbJ0=
Received: from SJ0PR03CA0146.namprd03.prod.outlook.com (2603:10b6:a03:33c::31)
 by SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 19:15:01 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::78) by SJ0PR03CA0146.outlook.office365.com
 (2603:10b6:a03:33c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Sun,
 3 Aug 2025 19:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 19:15:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 3 Aug
 2025 14:14:59 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 3 Aug 2025 14:14:59 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Unify pm and rpm suspend and resume
 callbacks
Date: Sun, 3 Aug 2025 12:14:50 -0700
Message-ID: <20250803191450.1568851-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SN7PR12MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd7b5c1-be6c-463a-56c3-08ddd2c20b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XqfBw89a6kiiVukJ+lj/Oi4j085K0BkeN8lkiZuu58oeIs76Nl4AyueeEgtS?=
 =?us-ascii?Q?w8fBlVu9htnmr6Jwi8yFStIGJyZQDx83IdEoAgxUSU5Y/yfbE9EFDiCkmRMU?=
 =?us-ascii?Q?Y+6z5w+WBvCRBiAr4Ail3nBI27CTBEjxpzuGru6cF3oqjeQg+4rxgzcpzIkF?=
 =?us-ascii?Q?+RkNqvcJMY8DClxr8htaxL8IT9gW9zFzROyD9fmqaa+SGj6SiYMsz3bLoI4Y?=
 =?us-ascii?Q?SU+rydUV1eS/rqVGy4+zj2pk2J6ZhzRd1AbUmLlyIRnC4iwHvPdTa0itz9yv?=
 =?us-ascii?Q?QUzUuL3OmFITQUzVOKY0nUbaNeNVU3mtgr3qL89/ELJVGFbY/t2d9BFPZfTW?=
 =?us-ascii?Q?tCxUi8r2z/VTnMvmuRklQQEeC7wMid6/NEX90AUMj2ndd09e2WvwQ+u87lkz?=
 =?us-ascii?Q?BWO+hWy5eLqweKR0pXc6ctshJF8k0GYH+XNesm1FbkYKJI89GV4S/HY00dh9?=
 =?us-ascii?Q?302pWbp67tKv3B+Qe8jnS1iPmKry9mwI8+RC7rqkALtljogbq93Gmm9XeS7V?=
 =?us-ascii?Q?tPhaR9XJP5vs8zMLBxZWB+K9RLNssaEYXj03HxHN8V2/cN5reCfur6mxdA6H?=
 =?us-ascii?Q?1oHA6E3RzGLUVxQtfOpCEvPiLznkAa5Gq0kNm3ZzKXSH/FLlxuO8GMWCCLGX?=
 =?us-ascii?Q?pu+aytWUeZA1n7R9qBmwVtemmRjZBBGqDJ61HQqyk/kzZWPBR3g8C2non8O6?=
 =?us-ascii?Q?a9pji0r06CYeAGs1OEgobH0rREw+FmYZwPPKiWMM4kYGmweBmnnulab1QgOX?=
 =?us-ascii?Q?2+E1S9JHFcjIKi4h7Xgkc0Ifg0um3dSqTbpeaESXvGJH7xiatMuk5ODArj8O?=
 =?us-ascii?Q?rf/FejhVerufonWYvWPAx9qqCnJGpxsFgCsKrXoKJAfvwL8o0Fwasl6Zq0Yc?=
 =?us-ascii?Q?PQ/inWuBT9pE5bOD1aO4EuiPCHoB8CbIFD0KSJrhzdC0gUKv4GjbFCkZspQJ?=
 =?us-ascii?Q?pVtuItCbgMqrtW7utOtYD75wOjl6cKbJHRQspm2rBQzY9AZISSZMuHxKBnNi?=
 =?us-ascii?Q?FjPuHvfYZU+xZjAm+HbhEbYp2wFzOr08fiO71OwhmlkkMpTcKz34T/doxiWO?=
 =?us-ascii?Q?FgwmpV8i2nj0v5xUM5dLUTL3wpu8B0cv5AAKdOtK7FStui3heDhwMh5dAfgv?=
 =?us-ascii?Q?dDRt4g2WGc/y63ELPmy86O4uCBHUtjHcgzc1li2uVs9KbAfK0hok5nl+cvm+?=
 =?us-ascii?Q?GvABI05XX1+dD8iUhiLYArQ3DH9yCXnNRv+HTd4CjmuoxT3Sqq2uq1UtBS07?=
 =?us-ascii?Q?i4RlWXhvJKWNEZEON8AUB4VODLfW1XLdetN3x5yFD+0Ci4UGzZxP223bZR19?=
 =?us-ascii?Q?v0hXVITtA3fUPkm0bXYw1IKy1LrlMY74S7egj04NfKv395g9GZA94jiOtPOg?=
 =?us-ascii?Q?Br9d/bJ+PdbaRR75fWueYhFYvxt66bQHvtr3SGJqVGbZP98/ARZhCivBy59O?=
 =?us-ascii?Q?gqs/6BCnQk19F8bF9AHa2VZx4ijRzI816buMxCGZFaBSzo7tU9EcjfiV2RFM?=
 =?us-ascii?Q?wqoSxBYSbeyLtimM2YnUH85Lm9IbCbyj7XTf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 19:15:01.1213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd7b5c1-be6c-463a-56c3-08ddd2c20b60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7276
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

The suspend and resume callbacks for pm and runtime pm should be same.
During suspending, it needs to stop all hardware contexts first. And
the hardware contexts will be restarted after the device is resumed.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        | 59 ++++++++++----------
 drivers/accel/amdxdna/aie2_pci.c        | 37 +++++++++++--
 drivers/accel/amdxdna/aie2_pci.h        |  5 +-
 drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ---------
 drivers/accel/amdxdna/amdxdna_ctx.h     |  2 -
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 74 +++----------------------
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  4 +-
 7 files changed, 73 insertions(+), 134 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 2cff5419bd2f..910ffb7051f4 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -46,6 +46,17 @@ static void aie2_job_put(struct amdxdna_sched_job *job)
 	kref_put(&job->refcnt, aie2_job_release);
 }
 
+static void aie2_hwctx_status_shift_stop(struct amdxdna_hwctx *hwctx)
+{
+	 hwctx->old_status = hwctx->status;
+	 hwctx->status = HWCTX_STAT_STOP;
+}
+
+static void aie2_hwctx_status_restore(struct amdxdna_hwctx *hwctx)
+{
+	hwctx->status = hwctx->old_status;
+}
+
 /* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
 static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
 			    struct drm_sched_job *bad_job)
@@ -89,25 +100,6 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
 	return ret;
 }
 
-void aie2_restart_ctx(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
-		if (hwctx->status != HWCTX_STAT_STOP)
-			continue;
-
-		hwctx->status = hwctx->old_status;
-		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
-		aie2_hwctx_restart(xdna, hwctx);
-	}
-	mutex_unlock(&client->hwctx_lock);
-}
-
 static struct dma_fence *aie2_cmd_get_out_fence(struct amdxdna_hwctx *hwctx, u64 seq)
 {
 	struct dma_fence *fence, *out_fence = NULL;
@@ -141,9 +133,11 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
 }
 
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_suspend(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * Command timeout is unlikely. But if it happens, it doesn't
@@ -151,15 +145,19 @@ void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
 	 * and abort all commands.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	aie2_hwctx_wait_for_idle(hwctx);
-	aie2_hwctx_stop(xdna, hwctx, NULL);
-	hwctx->old_status = hwctx->status;
-	hwctx->status = HWCTX_STAT_STOP;
+	guard(mutex)(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		aie2_hwctx_wait_for_idle(hwctx);
+		aie2_hwctx_stop(xdna, hwctx, NULL);
+		aie2_hwctx_status_shift_stop(hwctx);
+	}
 }
 
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
+void aie2_hwctx_resume(struct amdxdna_client *client)
 {
-	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 
 	/*
 	 * The resume path cannot guarantee that mailbox channel can be
@@ -167,8 +165,11 @@ void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
 	 * mailbox channel, error will return.
 	 */
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	hwctx->status = hwctx->old_status;
-	aie2_hwctx_restart(xdna, hwctx);
+	guard(mutex)(&client->hwctx_lock);
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
+		aie2_hwctx_status_restore(hwctx);
+		aie2_hwctx_restart(xdna, hwctx);
+	}
 }
 
 static void
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 3474a8d4e560..6fc3191c3097 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -440,6 +440,37 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	return ret;
 }
 
+static int aie2_hw_suspend(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+
+	guard(mutex)(&xdna->dev_lock);
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_suspend(client);
+
+	aie2_hw_stop(xdna);
+
+	return 0;
+}
+
+static int aie2_hw_resume(struct amdxdna_dev *xdna)
+{
+	struct amdxdna_client *client;
+	int ret;
+
+	guard(mutex)(&xdna->dev_lock);
+	ret = aie2_hw_start(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "Start hardware failed, %d", ret);
+		return ret;
+	}
+
+	list_for_each_entry(client, &xdna->client_list, node)
+		aie2_hwctx_resume(client);
+
+	return ret;
+}
+
 static int aie2_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
@@ -901,8 +932,8 @@ static int aie2_set_state(struct amdxdna_client *client,
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
-	.resume         = aie2_hw_start,
-	.suspend        = aie2_hw_stop,
+	.resume         = aie2_hw_resume,
+	.suspend        = aie2_hw_suspend,
 	.get_aie_info   = aie2_get_info,
 	.set_aie_state	= aie2_set_state,
 	.hwctx_init     = aie2_hwctx_init,
@@ -910,6 +941,4 @@ const struct amdxdna_dev_ops aie2_ops = {
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
-	.hwctx_suspend  = aie2_hwctx_suspend,
-	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 385914840eaa..488d8ee568eb 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -288,10 +288,9 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
-void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
-void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_suspend(struct amdxdna_client *client);
+void aie2_hwctx_resume(struct amdxdna_client *client);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
-void aie2_restart_ctx(struct amdxdna_client *client);
 
 #endif /* _AIE2_PCI_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index be073224bd69..b47a7f8e9017 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -60,32 +60,6 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
 	return &fence->base;
 }
 
-void amdxdna_hwctx_suspend(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_suspend(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
-void amdxdna_hwctx_resume(struct amdxdna_client *client)
-{
-	struct amdxdna_dev *xdna = client->xdna;
-	struct amdxdna_hwctx *hwctx;
-	unsigned long hwctx_id;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	mutex_lock(&client->hwctx_lock);
-	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
-		xdna->dev_info->ops->hwctx_resume(hwctx);
-	mutex_unlock(&client->hwctx_lock);
-}
-
 static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 				      struct srcu_struct *ss)
 {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index f0a4a8586d85..c652229547a3 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -147,8 +147,6 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
-void amdxdna_hwctx_suspend(struct amdxdna_client *client);
-void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f2bf1d374cc7..fbca94183f96 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -343,89 +343,29 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	mutex_unlock(&xdna->dev_lock);
 }
 
-static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->suspend)
-		xdna->dev_info->ops->suspend(xdna);
-
-	return 0;
-}
-
-static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
-{
-	if (xdna->dev_info->ops->resume)
-		return xdna->dev_info->ops->resume(xdna);
-
-	return 0;
-}
-
 static int amdxdna_pmops_suspend(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-
-	mutex_lock(&xdna->dev_lock);
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_suspend(client);
 
-	amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->suspend)
+		return -EOPNOTSUPP;
 
-	return 0;
+	return xdna->dev_info->ops->suspend(xdna);
 }
 
 static int amdxdna_pmops_resume(struct device *dev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	struct amdxdna_client *client;
-	int ret;
-
-	XDNA_INFO(xdna, "firmware resuming...");
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	if (ret) {
-		XDNA_ERR(xdna, "resume NPU firmware failed");
-		mutex_unlock(&xdna->dev_lock);
-		return ret;
-	}
 
-	XDNA_INFO(xdna, "hardware context resuming...");
-	list_for_each_entry(client, &xdna->client_list, node)
-		amdxdna_hwctx_resume(client);
-	mutex_unlock(&xdna->dev_lock);
-
-	return 0;
-}
-
-static int amdxdna_rpmops_suspend(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_suspend_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
-
-	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
-	return ret;
-}
-
-static int amdxdna_rpmops_resume(struct device *dev)
-{
-	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
-	int ret;
-
-	mutex_lock(&xdna->dev_lock);
-	ret = amdxdna_dev_resume_nolock(xdna);
-	mutex_unlock(&xdna->dev_lock);
+	if (!xdna->dev_info->ops->resume)
+		return -EOPNOTSUPP;
 
-	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
-	return ret;
+	return xdna->dev_info->ops->resume(xdna);
 }
 
 static const struct dev_pm_ops amdxdna_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
-	RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+	RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
 };
 
 static struct pci_driver amdxdna_pci_driver = {
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index ab79600911aa..40bbb3c06320 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -50,13 +50,11 @@ struct amdxdna_dev_ops {
 	int (*init)(struct amdxdna_dev *xdna);
 	void (*fini)(struct amdxdna_dev *xdna);
 	int (*resume)(struct amdxdna_dev *xdna);
-	void (*suspend)(struct amdxdna_dev *xdna);
+	int (*suspend)(struct amdxdna_dev *xdna);
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
-	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
-	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
 	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
-- 
2.34.1

