Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38325B8D60
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CC610E98F;
	Wed, 14 Sep 2022 16:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977F710E98D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:45:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVxetlU+uOgHWViT9jwU345uTFS3xdnGLDaq8HgE0AkYEjsJJX9hGoFWukfHON84Xu90b3j2bKmBvcS293GBlCzwC/9lFTb8Z2YvUO1YD1MevaTsyImG6l9nFmE+DmGfvHdbMLkZPNNNk9ZjyfL1XFGpqhcrCmhu0oXWPt0NysIghte08p1lXavqigm1F4vGyTvYVqqFkCuoijtCzr4st5Q1v0odOLP5sCIYquI4Qk3H7Za1TC+6XL2iMQ4VwlNczMmI6+Yxi5ZO/3znqdaLzTluyYtSclK/K4Do35cdELkdfgfV0j+JBWBpgtUkilZUkrmeREwnmQow2rK/YlSG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBSapcCiT/BYGpsHztm/uk8Z1kATGs0rsIgxxHpXsZU=;
 b=g2Tal5JmDO5VJgsnc3VYqkGLQoVBGkrANHWWM5WE9wobOByPWQrRo3MS3napyOX+eDJxRJpjYyrb+eunCLcH2ye65CZ5e2b/MUJUM8hObcMx0NUR2/6ijUuRrerWvV0KNgBIkYkd6MLWkf9esGr7S2apAjTG8MGLUMmtRpQQUktKzZxONXvPdQxeJloj28OG5nKrNQoqdA0zwEWunHmKxGtJ9ytuA3Jpgf/QA3ids7Efq8Pl5qJWYkLq0839yuXJJczRgPFcgy1QGlFu0t/u0CNv/0qHysIr1a7UZcSkg28gWcMs4QrksZCJ/dQm+nBaugKpaFPGElbZ9nZFXh2Onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBSapcCiT/BYGpsHztm/uk8Z1kATGs0rsIgxxHpXsZU=;
 b=sViw5iIXknSjwiTidbaUaxhKT5Yl3E2cuIrNGyYqivg9m1HiFUifpAq5qxvssTerWkpYzMcjh8lkb2Nujw+w0OzNAaHK+zJwpyrKsn7xrXEJ90S2pXgbyx2/47E/3+aHhW3CwqYHUrToNJ8G3oDEL74BoZsc1tPCj8pjqFJkPbI=
Received: from BN9PR03CA0589.namprd03.prod.outlook.com (2603:10b6:408:10d::24)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 16:45:03 +0000
Received: from BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::e) by BN9PR03CA0589.outlook.office365.com
 (2603:10b6:408:10d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 14 Sep 2022 16:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT096.mail.protection.outlook.com (10.13.177.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Wed, 14 Sep 2022 16:45:03 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 11:44:58 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/6] dma-buf: Enable signaling on fence for selftests
Date: Wed, 14 Sep 2022 22:13:18 +0530
Message-ID: <20220914164321.2156-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914164321.2156-1-Arvind.Yadav@amd.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acdc078-57f5-40f1-1dec-08da967078e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDUII2ZbnIWNGl3AmYZmZThP41o9gJd4ck5VSkfbTK0b+v/V3Iu43PRwsrgRsW8vBhGt3gWatv+WwGhHczahUmh2Gk0OuVFDdzOzMMmFXIY+ZT7BJsgCA5+p3ZsxVrcEWA0ET9Rnng3ZeAgIaF8GjWUJNjNpyW1qLWhx3nRpqmIe79SEp9iugc+Pr9QbZnSL8nOFRBEU209nCAAQSTj5KeF/TZj7V6YVN6qHjfc1LQjkvIMTAxipLEdVNUWMImNNQIsnlHOT0+qT3GvimwhTCDqNupsXlUW81G/QR2sgXiRTIMfz4ZolVsQn4eNeZ7oHcB6pGlILsANvH8kg3grTzyF6g7w7LP0hO2RtLMTroOfULqFvLjMiY7b5aCSvXKO89RNF0aNEL2dOat6l87kjjXzKyPr4iJvTUVzONyF7xNTGgRYfmPevMHS0djJcP9gySHW50p3JYPcYeqkAMFq6KfLSAzKIV6mOSOAlvTB2gDZ4IFIHOU2Bu9P/pL5ox9N+X9SlKHDzHOZ5qeDavNTSgWsXcC3QBRRpjOwuMoyQTag4v3X+BMZGfD2Qhf3yec2Bx5axfeQF+1u2gZmzJTpMkfQ8XDQ5wXVApPDzf3arkLRUHSW20YndGyI5E8tcMCfQ2+I0AO65v5ASqDKLjNHosujnnwqhjRoetRSIbHEn/oEMB0pFknmrz9gTO96DT9t0W5KPWg9ZRO1NQDzcrWN8fuYuaDiVt87198Zqy9vgEvi47BHkcS7DX6gdjBnj/VvZoSOzFD5nBAVgspRDS7QzZzPOsxNCjnyj/zQTFnjjGKbcuiQ6qxKviDPcqLWXvty9oP+tcae7fyyBGIzMqo3kbBCilFOf+JHnOePd2p4l6JHf68nIdjkIXHMBq2icKG1u
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(40460700003)(110136005)(5660300002)(316002)(6666004)(2906002)(41300700001)(2616005)(478600001)(8676002)(426003)(47076005)(26005)(36756003)(8936002)(70206006)(16526019)(336012)(1076003)(66574015)(356005)(186003)(83380400001)(81166007)(36860700001)(70586007)(40480700001)(54906003)(82310400005)(921005)(82740400003)(4326008)(86362001)(7696005)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:45:03.4309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acdc078-57f5-40f1-1dec-08da967078e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's enabling software signaling on fence for selftest.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to remove unnecessary callback.
2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
3- The version of this patch is also changed and previously
it was [PATCH 4/4]

Changes in v2 :
1- #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH removed

---

 drivers/dma-buf/st-dma-fence-chain.c  |  4 ++++
 drivers/dma-buf/st-dma-fence-unwrap.c | 22 ++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c        | 16 ++++++++++++++++
 drivers/dma-buf/st-dma-resv.c         | 10 ++++++++++
 4 files changed, 52 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 8ce1ea59d31b..0a9b099d0518 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -87,6 +87,8 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		err = -ENOMEM;
 
+	dma_fence_enable_sw_signaling(chain);
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -143,6 +145,8 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 		}
 
 		fc->tail = fc->chains[i];
+
+		dma_fence_enable_sw_signaling(fc->chains[i]);
 	}
 
 	fc->chain_length = i;
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4105d5ea8dde..f0cee984b6c7 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -102,6 +102,8 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	array = mock_array(1, f);
 	if (!array)
 		return -ENOMEM;
@@ -124,12 +126,16 @@ static int unwrap_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f1);
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+	dma_fence_enable_sw_signaling(f2);
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -164,12 +170,16 @@ static int unwrap_chain(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f1);
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+	dma_fence_enable_sw_signaling(f2);
+
 	chain = mock_chain(f1, f2);
 	if (!chain)
 		return -ENOMEM;
@@ -204,12 +214,16 @@ static int unwrap_chain_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f1);
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+	dma_fence_enable_sw_signaling(f2);
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -248,12 +262,16 @@ static int unwrap_merge(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f1);
+
 	f2 = mock_fence();
 	if (!f2) {
 		err = -ENOMEM;
 		goto error_put_f1;
 	}
 
+	dma_fence_enable_sw_signaling(f2);
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
 		err = -ENOMEM;
@@ -296,10 +314,14 @@ static int unwrap_merge_complex(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f1);
+
 	f2 = mock_fence();
 	if (!f2)
 		goto error_put_f1;
 
+	dma_fence_enable_sw_signaling(f2);
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3)
 		goto error_put_f2;
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71a..fb6e0a6ae2c9 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -102,6 +102,8 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -117,6 +119,8 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	if (dma_fence_is_signaled(f)) {
 		pr_err("Fence unexpectedly signaled on creation\n");
 		goto err_free;
@@ -190,6 +194,8 @@ static int test_late_add_callback(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_fence_signal(f);
 
 	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
@@ -282,6 +288,8 @@ static int test_status(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	if (dma_fence_get_status(f)) {
 		pr_err("Fence unexpectedly has signaled status on creation\n");
 		goto err_free;
@@ -308,6 +316,8 @@ static int test_error(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_fence_set_error(f, -EIO);
 
 	if (dma_fence_get_status(f)) {
@@ -337,6 +347,8 @@ static int test_wait(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -379,6 +391,8 @@ static int test_wait_timeout(void *arg)
 	if (!wt.f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(wt.f);
+
 	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -458,6 +472,8 @@ static int thread_signal_callback(void *arg)
 			break;
 		}
 
+		dma_fence_enable_sw_signaling(f1);
+
 		rcu_assign_pointer(t->fences[t->id], f1);
 		smp_wmb();
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 813779e3c9be..15dbea1462ed 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -45,6 +45,8 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -69,6 +71,8 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -114,6 +118,8 @@ static int test_for_each(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -173,6 +179,8 @@ static int test_for_each_unlocked(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -244,6 +252,8 @@ static int test_get_fences(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+	dma_fence_enable_sw_signaling(f);
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-- 
2.25.1

