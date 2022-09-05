Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182785AD0E2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9810E2F0;
	Mon,  5 Sep 2022 10:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E854B10E2E6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hL7SuwZUs5GYrIAb21YW/7rwpuByi0MoRuU0jQsoYIDV4PzEAH+Sf8TF1CIx+6Sq0ufB3NPDxYeVF1Cq5hB6xQJc/Z2ofoiR3MeTpHis3JDvItycEvcBaBsleLGojTXYBrqprqqhiOAkLkpRV35ncUBFh8BzwklkPczVudEqNwk4S19XSNxERfSvj1zgsGrqiWYJHqsjB01PP5bURvWPIvQWZ9EsrZxx4Txnw6Leo3I1xfY3bJJHgr4j2OOsH/qx6AYWHmiYJMNY/C5ttRsgR1yYIUSB7fRzrTYPcZUN5M/avTqnLQ/5/Y1Y9OWrblk1oLpUxgDls67GBH56IuK19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+86d+YE+hPaWE8HohimmzLAeT0xeEM82WImJePul4U=;
 b=FZC83QGtB33FCA+lFO9Mp5mfx8ZRhDhCAhyvNM/Hgp/sWtssC9MkcbdCOkYYJXelv/tS5WNQjAhDsKhrkew4prGPkmu3Av+M+rmPWeVTg0M9gC9DEEzSzQy8Qwq2twpYWAwyr5wjKOwuGOOx0v1kq/oYqtRiyGzJTDdqrhDO8w33wHJH+HsmgYNj2N4OJ808CBy3lX6e03VCSsKtI8tii1Eewp1KmqCwFvvUBCZmFObXeDNrb5HFi48Qi78ywYUZvopivL2PTE24DPxAdVwyQfbrNRzRq/Nu8dJHNM2h8U2zeGtf3FIRAyiMaLR8ygx/FBjg/WxIxd4+linfQVWLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+86d+YE+hPaWE8HohimmzLAeT0xeEM82WImJePul4U=;
 b=QP9wcIVdl718V4sJWfjIGzKQWYnll1jRM/OFTwPfV9BsZ8qGAnjeau0yGrVsK0iCS1febY2oH1I7aJ7n7cCnYcd+Ls8KPpWxfGMH+m0yWG2sTsAKH/3cKVyA8F9PD9v5TnFm584fMIB1RuivgkeuDz1ypRpFeQ0LdzBDDGdO86w=
Received: from DM6PR07CA0038.namprd07.prod.outlook.com (2603:10b6:5:74::15) by
 BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:58:21 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::97) by DM6PR07CA0038.outlook.office365.com
 (2603:10b6:5:74::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.13 via Frontend
 Transport; Mon, 5 Sep 2022 10:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:58:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 05:58:16 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] dma-buf: Add callback and enable signaling on debug
Date: Mon, 5 Sep 2022 16:26:53 +0530
Message-ID: <20220905105653.13670-5-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905105653.13670-1-Arvind.Yadav@amd.com>
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa7a37eb-d71a-45d8-b9ba-08da8f2d8c3a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6pZdIabnuyzg/tjkdT50fSdP2h7S2l11xYbiKJ5fqaQEkPpTFyMNYq6ce8hULcDb7ahugIHgbJsMKbTAillsIpzlDZM31OzEOJN9+jlwgC/bESDLByWTTRxJKLKhVIi/CsyZ81S4EumwRFFvSuj05CUTZn3oRcb9IMl0Xfo0Hgx7HN/P+LELU5ZnAbq+whdvWl3CcUgMm5M2t+/SEorEzELC0OYSt0RKYaAyvqgEECslagbb8eevAbdmZ5aLk14P+U69srWyEKvZcIItG1cLBKYEsfPKhfBDcoAG9tZLEAYO6SxEU9pTjen0RuAM3yR3RA9IHTH/8ishldAgQ7rE+cWUukRRAO9qYLLU9IejdvnoOOjTirp662pOLemPtWghqfjDVyBldqsJCma0o7yM9+JDdlcFLN2WUvWgVCq1nWlBL1DXMykf/S178+DDREyujQpiTGVEkIfffjDA4wwxG/L+0vM91Z3q/XQJ14qOCEo3SJMs922nbWmTz/a2Ot3AWtiTUK8Ml20pEb3EW4rSRHed8czgIhCnaZ7c7I87SrAqDEvDwt6oIz7JXUNRQ1Hq/qM0I8ghX3nsdFt7C25VA/S5SUM1eDS/QFNd0gOETTsn/gB6Gth6r15kn6Ix/EVnxpMpfohGGBnn/Nf8SGe9VB7mHoYBC8h0LiIVxFhIOyZy+YhMMF+bJCfOPi9BQnW5jElvCNZePS28W8rJGFqLDWEK0YJ5F/A4a2r27vc0CF8D/rlWRumPX2Iqiyl0Cj5u/MGVmVvR5dVAHS0c+QlfU2Vx7F9NNxAIGpipC9lHlc8XaoynlEb+Pha+Oy+MOyZhMZQBVGYY4psn+78QDxjeHWQuPQX6dlKVtO/oBlrwoSGjX2fFB1bEcb4IDGVKX4az
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(2906002)(36756003)(81166007)(47076005)(426003)(356005)(921005)(1076003)(83380400001)(16526019)(336012)(186003)(2616005)(8676002)(70206006)(70586007)(40480700001)(5660300002)(8936002)(4326008)(110136005)(316002)(82310400005)(26005)(41300700001)(7696005)(478600001)(6666004)(36860700001)(40460700003)(86362001)(82740400003)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:58:21.4368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a37eb-d71a-45d8-b9ba-08da8f2d8c3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5320
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's on debug adding an enable_signaling callback for fences
and enabling software signaling for selftest.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/dma-buf/st-dma-fence-chain.c  | 17 +++++++++
 drivers/dma-buf/st-dma-fence-unwrap.c | 54 +++++++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c        | 34 ++++++++++++++++-
 drivers/dma-buf/st-dma-resv.c         | 30 +++++++++++++++
 4 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 8ce1ea59d31b..ffbb24d6a890 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -32,6 +32,12 @@ static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
+#ifdef CONFIG_DEBUG_FS
+static bool mock_fence_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
 
 static void mock_fence_release(struct dma_fence *f)
 {
@@ -41,6 +47,9 @@ static void mock_fence_release(struct dma_fence *f)
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling =  mock_fence_enable_signaling,
+#endif
 	.release = mock_fence_release,
 };
 
@@ -87,6 +96,10 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		err = -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(chain);
+#endif
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -143,6 +156,10 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 		}
 
 		fc->tail = fc->chains[i];
+
+#ifdef CONFIG_DEBUG_FS
+		dma_fence_enable_sw_signaling(fc->chains[i]);
+#endif
 	}
 
 	fc->chain_length = i;
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4105d5ea8dde..b43c57559ead 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -23,9 +23,19 @@ static const char *mock_name(struct dma_fence *f)
 	return "mock";
 }
 
+#ifdef CONFIG_DEBUG_FS
+static bool mock_fence_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
+
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling =  mock_fence_enable_signaling,
+#endif
 };
 
 static struct dma_fence *mock_fence(void)
@@ -102,6 +112,10 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	array = mock_array(1, f);
 	if (!array)
 		return -ENOMEM;
@@ -124,12 +138,20 @@ static int unwrap_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -164,12 +186,20 @@ static int unwrap_chain(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	chain = mock_chain(f1, f2);
 	if (!chain)
 		return -ENOMEM;
@@ -204,12 +234,20 @@ static int unwrap_chain_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -248,12 +286,20 @@ static int unwrap_merge(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		err = -ENOMEM;
 		goto error_put_f1;
 	}
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
 		err = -ENOMEM;
@@ -296,10 +342,18 @@ static int unwrap_merge_complex(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2)
 		goto error_put_f1;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3)
 		goto error_put_f2;
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71a..4adb763f4509 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -27,6 +27,12 @@ static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
+#ifdef CONFIG_DEBUG_FS
+static bool mock_fence_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
 
 static void mock_fence_release(struct dma_fence *f)
 {
@@ -77,6 +83,9 @@ static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
 	.wait = mock_wait,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling =  mock_fence_enable_signaling,
+#endif
 	.release = mock_fence_release,
 };
 
@@ -101,7 +110,9 @@ static int sanitycheck(void *arg)
 	f = mock_fence();
 	if (!f)
 		return -ENOMEM;
-
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -117,6 +128,9 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_is_signaled(f)) {
 		pr_err("Fence unexpectedly signaled on creation\n");
 		goto err_free;
@@ -190,6 +204,9 @@ static int test_late_add_callback(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_signal(f);
 
 	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
@@ -282,6 +299,9 @@ static int test_status(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_get_status(f)) {
 		pr_err("Fence unexpectedly has signaled status on creation\n");
 		goto err_free;
@@ -308,6 +328,9 @@ static int test_error(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_set_error(f, -EIO);
 
 	if (dma_fence_get_status(f)) {
@@ -337,6 +360,9 @@ static int test_wait(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -379,6 +405,9 @@ static int test_wait_timeout(void *arg)
 	if (!wt.f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(wt.f);
+#endif
 	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -458,6 +487,9 @@ static int thread_signal_callback(void *arg)
 			break;
 		}
 
+#ifdef CONFIG_DEBUG_FS
+		dma_fence_enable_sw_signaling(f1);
+#endif
 		rcu_assign_pointer(t->fences[t->id], f1);
 		smp_wmb();
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 813779e3c9be..fa4e7b09d54c 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -18,9 +18,19 @@ static const char *fence_name(struct dma_fence *f)
 	return "selftest";
 }
 
+#ifdef CONFIG_DEBUG_FS
+static bool fence_enable_signaling(struct dma_fence *f)
+{
+	return true;
+}
+#endif
+
 static const struct dma_fence_ops fence_ops = {
 	.get_driver_name = fence_name,
 	.get_timeline_name = fence_name,
+#ifdef CONFIG_DEBUG_FS
+	.enable_signaling =  fence_enable_signaling,
+#endif
 };
 
 static struct dma_fence *alloc_fence(void)
@@ -45,6 +55,10 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -69,6 +83,10 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -114,6 +132,10 @@ static int test_for_each(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -173,6 +195,10 @@ static int test_for_each_unlocked(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -244,6 +270,10 @@ static int test_get_fences(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_FS
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-- 
2.25.1

