Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B849D1728
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545210E546;
	Mon, 18 Nov 2024 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PmWDI4vH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16C10E53D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 17:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKXS9niXI6GxojOHVp81ntkLLht8H8Cyi5lWvaSGhspAtmYcNLmHB6+Jrz0p0fyRxFWFSWOp7MPfeXLZmy8hr6rAbg/wmJppffYxRL10fkaaM4MlqSRp9NgFuCzFv/WexDbpJ/exoZkbiH7hdmVE+y1uHv62O8ThDMfjgapfQH7elhua7d7mjOZqbhjWFBNniPj4r6EdXq+YxMw29RnXX1pFuHuR+GteAMfEqUEq/QvRg7qF4TZX0nmZYIlLN/6WBAEnkF2maA0/hiiBa9A3mqWAWRWVYQ53yH8q0i86SHTd7iMNc+EnEQBhnUP+DaknQOVVWGwiLzZpbEpysGBnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK3TsF8iySAEorzkhqwe5APda/dE7A0rZlnbr/ozR0A=;
 b=ERnJVRk4op88rqtx4uzgRRQ4F5CY5qQHI8z/6jt+XqB2AkoZkV8D0IXKpnIFez+pqKGSA7jXncgccd5t8DMX5kpZB1XY4KIUIQYdDwKmkIZ0r866F9SywvAvU/wehSemeJaD31MbtXsOfWHP5WYiZ76QCTT1h27hRtRTtqmbVKh+kKa+KgFv0Kd2jF6BWMZffiiNagH3PBfF6Y9nDL9NF3fyRDAs/pW7UoizRSYZosIUGE2Z2MXJi+ngPDOhLVpDAdxiQU6jIhJLiogg7YuXPhcbxH+Y0vnuJPZDBy4ERA7nQkNd+25Q3JSNpHjBYmhK/aMYhakMiAbwf2krVEs87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK3TsF8iySAEorzkhqwe5APda/dE7A0rZlnbr/ozR0A=;
 b=PmWDI4vHjYXhl35/hDDlsps1wNsj10tnuNZxwP8UJNYqGY9p02ki4kwZKa4l558YmVxqeqd1QbYGdr4sDaMgSLDcppeGR8BUm7h0HsS35WyET7vFdOtXj1oE6r0DoKHpYbJfJOpNnlazBtLKDztH7w4XxTMXxXTWlHJ4VyYVvLk=
Received: from DS7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::23) by
 MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 17:30:02 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::72) by DS7P222CA0006.outlook.office365.com
 (2603:10b6:8:2e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Mon, 18 Nov 2024 17:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 17:30:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 11:30:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 11:30:00 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 11:29:59 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 Xiaoming Ren <xiaoming.ren@amd.com>
Subject: [PATCH V11 08/10] accel/amdxdna: Add suspend and resume
Date: Mon, 18 Nov 2024 09:29:40 -0800
Message-ID: <20241118172942.2014541-9-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118172942.2014541-1-lizhi.hou@amd.com>
References: <20241118172942.2014541-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 6490e70b-e14e-4a8e-4613-08dd07f6a28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SxhsYAhMJjbXXl1SRi2aNNCVXGElHSNiGuc+rIg24+fYAqcjq8P2PVJECfFu?=
 =?us-ascii?Q?w5MmCQqQxk7AmjKiBgkKqqTmuTbzK9vIFjxLQSn39/5h7oy4uvqkQ+GzX5EU?=
 =?us-ascii?Q?No69IN6ZMj9ZaA2z5M14ZrZ65R545B1j4RtJ3adZoUWxrk46WjbIyCgoXT/c?=
 =?us-ascii?Q?eqW7+gzFGnsr6PqiDhDaI3LoRmxEg82dGPQJvfs5qGiSJsWweMs/5Wl4+a49?=
 =?us-ascii?Q?kAG/TUei3JVOckvekJOn4cKxcXQxLG0vOafXTZNRoKR9G1fBjalXW51O7rli?=
 =?us-ascii?Q?4fxGd5C/zGcU586OYCw3Jgc/a09bK/JRIZH3E4F27XSEW8rXlBfx+UzHVSWt?=
 =?us-ascii?Q?hDpBERjCA8KsvfYcox7GGxxqFnoyF/frs2RsmusV/q+EDOWPLZwIDdQcJISh?=
 =?us-ascii?Q?TFUplxIHFuGofg51N5Gy4IwpPFJgs0y3wKzHiPRjmx7HumJfS00RRjPNIUAd?=
 =?us-ascii?Q?LduihsAZ0SpQE4tDj3I00GJvdFbtDZWgJbUHBgKFlF9COM3hqOkq6J8JlGFV?=
 =?us-ascii?Q?xwxwQRe1ApLu49ImzPchFFl6LeDIY+6EDmUGZuy0k89ZYKzozE8M71wAO95J?=
 =?us-ascii?Q?NmnAL3rhIgAF5UeoJgaoINvL3K9ezKJ2jcd/pb9MR46+iuHFUMzJwfu/iOxL?=
 =?us-ascii?Q?bNlwfAqMxjZMvzC2KqK6Y8yK3sanMmXNTmQTng23xM0OjcoSLx/CKb0t2Q6g?=
 =?us-ascii?Q?T3fnxHF+H0bjc43XobG4lWmthkKQF1mSk4CsommLyEAa2I2svftHZ6UwhiTZ?=
 =?us-ascii?Q?0izWmoZ+2QpSpGH5yUz7nATwWaLtj36ocXkPEsmUoG3Q1MXP7Cs5xkmZTZXg?=
 =?us-ascii?Q?M4oiyTC/s/b9UV2329CpDRnSbv9aXkoZ0SwJy+9haUTk+Kn+2JU7XaWaYcta?=
 =?us-ascii?Q?N/frnGzQ48etxN72beWSwZJbaSUM1l3G0vUCspxF7CwfKTFcLvw1s2Plo9NL?=
 =?us-ascii?Q?p/UuDP2ufqLjTGQw5SzmEGp4lnwmQBCNsQt2n9IIb9qo8TWjvFEIkhPpZQdt?=
 =?us-ascii?Q?lF0KeDdYiDWLOQeXxbPOCjM64yy/fy1Q8eFNL/gnl3JaRz5Z9/nlD6oxf9Gq?=
 =?us-ascii?Q?bo+cdrHyKIRUNQDYBWCnnDWamXZipTYoDKZdcSDx3eIXUinUPHxZyiZWjXFz?=
 =?us-ascii?Q?NMMupg/BuCBGx94PpIpQNAVaNCph71mHXhh8ZHXD0btSVGGNBWzu+irm5Kn7?=
 =?us-ascii?Q?fBy2GAqlmZiL95xrk5kRZtulRdluPK1dj1OK8TUZWqSouI2s4yNf173644Tj?=
 =?us-ascii?Q?FMML4OhK+C1yP9RoVXLvefyJbSXdcS613UfdmUJwIvZxDZjJlkIIJTLeHKSS?=
 =?us-ascii?Q?Pk7Ptiw3vE4OCxewdo2bxTj2TlNNQ1ctixB60MaNE/vbKSsDE/ZKK4Gl56id?=
 =?us-ascii?Q?zTy/tlVk5UGbe3ZE+CBuRlq3TI1jKrieY2TOmSjF7o/WEmC8lA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 17:30:02.5876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6490e70b-e14e-4a8e-4613-08dd07f6a28f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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

Implement PCI power management suspend and resume callbacks.

Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Co-developed-by: Xiaoming Ren <xiaoming.ren@amd.com>
Signed-off-by: Xiaoming Ren <xiaoming.ren@amd.com>
Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c        |  30 ++++++
 drivers/accel/amdxdna/aie2_pci.c        |   4 +
 drivers/accel/amdxdna/aie2_pci.h        |   2 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  26 +++++
 drivers/accel/amdxdna/amdxdna_ctx.h     |   2 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 120 +++++++++++++++++++++++-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   4 +
 7 files changed, 185 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 2040a01256eb..90e8d87666a9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -137,6 +137,36 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
 	dma_fence_put(fence);
 }
 
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	/*
+	 * Command timeout is unlikely. But if it happens, it doesn't
+	 * break the system. aie2_hwctx_stop() will destroy mailbox
+	 * and abort all commands.
+	 */
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	aie2_hwctx_wait_for_idle(hwctx);
+	aie2_hwctx_stop(xdna, hwctx, NULL);
+	hwctx->old_status = hwctx->status;
+	hwctx->status = HWCTX_STAT_STOP;
+}
+
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+
+	/*
+	 * The resume path cannot guarantee that mailbox channel can be
+	 * regenerated. If this happen, when submit message to this
+	 * mailbox channel, error will return.
+	 */
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	hwctx->status = hwctx->old_status;
+	aie2_hwctx_restart(xdna, hwctx);
+}
+
 static void
 aie2_sched_notify(struct amdxdna_sched_job *job)
 {
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 465764712040..803ebb237971 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -496,9 +496,13 @@ static void aie2_fini(struct amdxdna_dev *xdna)
 const struct amdxdna_dev_ops aie2_ops = {
 	.init           = aie2_init,
 	.fini           = aie2_fini,
+	.resume         = aie2_hw_start,
+	.suspend        = aie2_hw_stop,
 	.hwctx_init     = aie2_hwctx_init,
 	.hwctx_fini     = aie2_hwctx_fini,
 	.hwctx_config   = aie2_hwctx_config,
 	.cmd_submit     = aie2_cmd_submit,
 	.hmm_invalidate = aie2_hmm_invalidate,
+	.hwctx_suspend  = aie2_hwctx_suspend,
+	.hwctx_resume   = aie2_hwctx_resume,
 };
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 9836f721fc9a..72691c9eebd7 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -240,6 +240,8 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
 int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
 void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
 int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
+void aie2_hwctx_suspend(struct amdxdna_hwctx *hwctx);
+void aie2_hwctx_resume(struct amdxdna_hwctx *hwctx);
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
 void aie2_restart_ctx(struct amdxdna_client *client);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 13cfbab9caa0..5478b631b73f 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -59,6 +59,32 @@ static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
 	return &fence->base;
 }
 
+void amdxdna_hwctx_suspend(struct amdxdna_client *client)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		xdna->dev_info->ops->hwctx_suspend(hwctx);
+	mutex_unlock(&client->hwctx_lock);
+}
+
+void amdxdna_hwctx_resume(struct amdxdna_client *client)
+{
+	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_hwctx *hwctx;
+	int next = 0;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+	mutex_lock(&client->hwctx_lock);
+	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		xdna->dev_info->ops->hwctx_resume(hwctx);
+	mutex_unlock(&client->hwctx_lock);
+}
+
 static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
 				      struct srcu_struct *ss)
 {
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 18ed9bdbd6d8..80b0304193ec 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -144,6 +144,8 @@ static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
 
 void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
+void amdxdna_hwctx_suspend(struct amdxdna_client *client);
+void amdxdna_hwctx_resume(struct amdxdna_client *client);
 
 int amdxdna_cmd_submit(struct amdxdna_client *client,
 		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 2262157b26a6..c4df674fdf50 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -13,11 +13,14 @@
 #include <drm/gpu_scheduler.h>
 #include <linux/iommu.h>
 #include <linux/pci.h>
+#include <linux/pm_runtime.h>
 
 #include "amdxdna_ctx.h"
 #include "amdxdna_gem.h"
 #include "amdxdna_pci_drv.h"
 
+#define AMDXDNA_AUTOSUSPEND_DELAY	5000 /* milliseconds */
+
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
  * (device_id, rev_id) pair as a key to select the devices. The devices with
@@ -45,9 +48,17 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	struct amdxdna_client *client;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ddev->dev);
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to get rpm, ret %d", ret);
+		return ret;
+	}
+
 	client = kzalloc(sizeof(*client), GFP_KERNEL);
-	if (!client)
-		return -ENOMEM;
+	if (!client) {
+		ret = -ENOMEM;
+		goto put_rpm;
+	}
 
 	client->pid = pid_nr(filp->pid);
 	client->xdna = xdna;
@@ -83,6 +94,9 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	iommu_sva_unbind_device(client->sva);
 failed:
 	kfree(client);
+put_rpm:
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 
 	return ret;
 }
@@ -105,6 +119,8 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "pid %d closed", client->pid);
 	kfree(client);
+	pm_runtime_mark_last_busy(ddev->dev);
+	pm_runtime_put_autosuspend(ddev->dev);
 }
 
 static int amdxdna_flush(struct file *f, fl_owner_t id)
@@ -183,10 +199,11 @@ amdxdna_get_dev_info(struct pci_dev *pdev)
 
 static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct amdxdna_dev *xdna;
 	int ret;
 
-	xdna = devm_drm_dev_alloc(&pdev->dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
+	xdna = devm_drm_dev_alloc(dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
 	if (IS_ERR(xdna))
 		return PTR_ERR(xdna);
 
@@ -219,12 +236,19 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto failed_dev_fini;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, AMDXDNA_AUTOSUSPEND_DELAY);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_allow(dev);
+
 	ret = drm_dev_register(&xdna->ddev, 0);
 	if (ret) {
 		XDNA_ERR(xdna, "DRM register failed, ret %d", ret);
+		pm_runtime_forbid(dev);
 		goto failed_sysfs_fini;
 	}
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return 0;
 
 failed_sysfs_fini:
@@ -239,8 +263,12 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void amdxdna_remove(struct pci_dev *pdev)
 {
 	struct amdxdna_dev *xdna = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
 	struct amdxdna_client *client;
 
+	pm_runtime_get_noresume(dev);
+	pm_runtime_forbid(dev);
+
 	drm_dev_unplug(&xdna->ddev);
 	amdxdna_sysfs_fini(xdna);
 
@@ -262,11 +290,97 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	mutex_unlock(&xdna->dev_lock);
 }
 
+static int amdxdna_dev_suspend_nolock(struct amdxdna_dev *xdna)
+{
+	if (xdna->dev_info->ops->suspend)
+		xdna->dev_info->ops->suspend(xdna);
+
+	return 0;
+}
+
+static int amdxdna_dev_resume_nolock(struct amdxdna_dev *xdna)
+{
+	if (xdna->dev_info->ops->resume)
+		return xdna->dev_info->ops->resume(xdna);
+
+	return 0;
+}
+
+static int amdxdna_pmops_suspend(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	struct amdxdna_client *client;
+
+	mutex_lock(&xdna->dev_lock);
+	list_for_each_entry(client, &xdna->client_list, node)
+		amdxdna_hwctx_suspend(client);
+
+	amdxdna_dev_suspend_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	return 0;
+}
+
+static int amdxdna_pmops_resume(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	struct amdxdna_client *client;
+	int ret;
+
+	XDNA_INFO(xdna, "firmware resuming...");
+	mutex_lock(&xdna->dev_lock);
+	ret = amdxdna_dev_resume_nolock(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "resume NPU firmware failed");
+		mutex_unlock(&xdna->dev_lock);
+		return ret;
+	}
+
+	XDNA_INFO(xdna, "hardware context resuming...");
+	list_for_each_entry(client, &xdna->client_list, node)
+		amdxdna_hwctx_resume(client);
+	mutex_unlock(&xdna->dev_lock);
+
+	return 0;
+}
+
+static int amdxdna_rpmops_suspend(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	mutex_lock(&xdna->dev_lock);
+	ret = amdxdna_dev_suspend_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	XDNA_DBG(xdna, "Runtime suspend done ret: %d", ret);
+	return ret;
+}
+
+static int amdxdna_rpmops_resume(struct device *dev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
+	int ret;
+
+	mutex_lock(&xdna->dev_lock);
+	ret = amdxdna_dev_resume_nolock(xdna);
+	mutex_unlock(&xdna->dev_lock);
+
+	XDNA_DBG(xdna, "Runtime resume done ret: %d", ret);
+	return ret;
+}
+
+static const struct dev_pm_ops amdxdna_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
+	SET_RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+};
+
 static struct pci_driver amdxdna_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pci_ids,
 	.probe = amdxdna_probe,
 	.remove = amdxdna_remove,
+	.driver.pm = &amdxdna_pm_ops,
 };
 
 module_pci_driver(amdxdna_pci_driver);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 30ea8da55d69..52c59249c8a0 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -28,10 +28,14 @@ struct amdxdna_sched_job;
 struct amdxdna_dev_ops {
 	int (*init)(struct amdxdna_dev *xdna);
 	void (*fini)(struct amdxdna_dev *xdna);
+	int (*resume)(struct amdxdna_dev *xdna);
+	void (*suspend)(struct amdxdna_dev *xdna);
 	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
 	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
 	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
 	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
+	void (*hwctx_suspend)(struct amdxdna_hwctx *hwctx);
+	void (*hwctx_resume)(struct amdxdna_hwctx *hwctx);
 	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
 };
 
-- 
2.34.1

