Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9E5AD79F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B9D10E440;
	Mon,  5 Sep 2022 16:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CA510E440
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL80ONFEG4+AtvQqykHDrKslUKJY5CA7i+x+/TcQs64t6JU6USe7lrKyjDFrA0+6THr/AZoUcflp7Fg6gnaKmBAnuvlXqSecHy6LFwWH8ZqEJnd2ZYqbfRd7AYCsC0G4lnP6aj312e0g13kKtOHLnYl1q3Xo6Dd74S5AIkSODgDLW5IB6Y32Hya3qx/xQk5qg3rtH7rkW42meIASWrvOdQoaGQAJiSbqlFpBC3uUI2o+cvcA7hUg2uJoFxxBtwQCgrIkhe7PPb48W002pefQA1+MmY6ypeN45c4dzXavga0mOk+Sm3CTqV44ahLXa4diuZj0i1IdxL/QsNH9DRmRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfSAYE1i0cUT0eLksAphUwmCclcahVR0SXZSB8TKhb4=;
 b=BRorr3Fz+qeqkMjOCViEQTZcvBo+ircKzawHbqLDshxSBJ7jl8qUGGaFoPA6VNWowktcpuokQRw7HblcYcoWEFCyogM8Rn7CKT/a9uXFt7QGj1ob5cFapO3GYAu9a/udAvdeY02hmXe8nrZOcgsk4oZtAlsfPjVvERpDnV8i3ueJuBRhjKAksV8liMa1WzxtBFVzaaEiuMhYOzStj2ECcc3rpfc58Wsi1x2EZfPFRTXSxkWpMiXjabn6mu5r1AVKZVNvR+ebvYgVIyL+0yZbupWreVJtxVcWWtsyq4Cvo32uSKJqyuQZcM1xBIP9ZORFDUgcjgn3c3jF/YFpXk8UQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfSAYE1i0cUT0eLksAphUwmCclcahVR0SXZSB8TKhb4=;
 b=5Z0YchZwQWWoPD3v4VOcMthQNvj4y7lGk2K0wKjqTYdQ9MYWWWiIjtvag7TuGEXEe5jfyMsYjSWWNYYqwWKyJRjcyiu0lFyXjqS0dFIUygOrh1ksSWs2WCBK9WQQ+j+WnGoK8wH/R7z/Zcn8wDgyjwmiLWP2VeUvtiZPs27/Jz4=
Received: from MN2PR02CA0022.namprd02.prod.outlook.com (2603:10b6:208:fc::35)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 16:35:58 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:208:fc:cafe::70) by MN2PR02CA0022.outlook.office365.com
 (2603:10b6:208:fc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.10 via Frontend Transport; Mon, 5 Sep 2022 16:35:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 11:35:52 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] dma-buf: enable signaling for selftest fence on debug
Date: Mon, 5 Sep 2022 22:05:01 +0530
Message-ID: <20220905163502.4032-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905163502.4032-1-Arvind.Yadav@amd.com>
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 84eb3842-1a79-446d-5a5e-08da8f5cb620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61+UJXtAIyFy+/OyMSz8B1oNDT+2K3MXZWhVSKmQdS5LpDE6cv6a1fLi0N9esuKdvd2rUZz9t5WNDE475E1Wd515oLPL5kOcJ4WtKM2ufPONfxkJNr05D8JpLQ0by6aCmnVuDwfGTHPJi4RgtVEBYe7S7zBbHkbMpYpZkBDiiWFHQMB0j3Tnix8ErfdlJbcJJjBTJpn0DQ8UrJUsH/gTdHClimb9cUt7f4a8P5kFSgdyNxIRH2aCvCGyd0NRD2vNrDV4MJUKYIol7Y7oZFVg9DFxzKvGbqMjU4OpNePRSlM4OSwVoWPkH18MDDudpu/FtSaoq3XS/0DrOSQSY3Pzem91M5telJODM3aQrsjjXXk6zAHn4I/3ZKL2SAPuJ6t35ofEHnzoQhh1VzkIkkJwk0Cp8jy/qY1x49IKsg8n/k4zd1XnzT4JUD5Z8LsA+79g6ob9xO4F4GB1WlUh6vQCngZZDhXOAImmGyS9zcAePKpuPsBVq5zmz9TkeyY3GzbXiNXjRUE327Esmk1LdNXINukvhBNVjihx8CXL/uPt+Xx3Hj8FggWzNL5w3HeiQCFHQfB/mm5AZ+KvUPwApbh690TdU9EJt7/PDj2T2Y4dTY6eX7DB1ixV4NUWtUpy6XsYmADQBg3frjkVeAALv50TYWjZRPx5dfwlRCG1UtJh0k8u/04xrWcJTf6niGZBshkZoq+1GnGs860gEbYbzCHf+zpb1xT8Jp8rDOJei/vKtArTponZL8l+i7kCOiE6ttBFL5kxVg0MlxWsn9bzCIX3M5ZzT0aDXWARK5WsV7db9x16WpxwZVRZYg92ADBAZjb9HdT3m5qtDaumr8U8t+jraLl1dO+xfdvcmArOUvSe5JAEqrACnYOEH6QWIDnd6T09
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(46966006)(40470700004)(4326008)(86362001)(7696005)(82310400005)(81166007)(40480700001)(8936002)(70206006)(356005)(110136005)(70586007)(921005)(316002)(8676002)(478600001)(41300700001)(36860700001)(82740400003)(40460700003)(83380400001)(5660300002)(2906002)(26005)(36756003)(47076005)(6666004)(186003)(1076003)(16526019)(426003)(2616005)(336012)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:35:58.0901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84eb3842-1a79-446d-5a5e-08da8f5cb620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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

Here's on debug enabling software signaling for selftest.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---

Changes in v1 :
1- Addressing Christian's comment to remove unnecessary callback.
2- Replacing CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
3- The version of this patch is also changed and previously
it was [PATCH 4/4]

---
 drivers/dma-buf/st-dma-fence-chain.c  |  8 +++++
 drivers/dma-buf/st-dma-fence-unwrap.c | 44 +++++++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence.c        | 25 ++++++++++++++-
 drivers/dma-buf/st-dma-resv.c         | 20 ++++++++++++
 4 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 8ce1ea59d31b..d3070f8a393c 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -87,6 +87,10 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		err = -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(chain);
+#endif
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -143,6 +147,10 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
 		}
 
 		fc->tail = fc->chains[i];
+
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+		dma_fence_enable_sw_signaling(fc->chains[i]);
+#endif
 	}
 
 	fc->chain_length = i;
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 4105d5ea8dde..b76cdd9ee0c7 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -102,6 +102,10 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	array = mock_array(1, f);
 	if (!array)
 		return -ENOMEM;
@@ -124,12 +128,20 @@ static int unwrap_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -164,12 +176,20 @@ static int unwrap_chain(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	chain = mock_chain(f1, f2);
 	if (!chain)
 		return -ENOMEM;
@@ -204,12 +224,20 @@ static int unwrap_chain_array(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		dma_fence_put(f1);
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	array = mock_array(2, f1, f2);
 	if (!array)
 		return -ENOMEM;
@@ -248,12 +276,20 @@ static int unwrap_merge(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2) {
 		err = -ENOMEM;
 		goto error_put_f1;
 	}
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3) {
 		err = -ENOMEM;
@@ -296,10 +332,18 @@ static int unwrap_merge_complex(void *arg)
 	if (!f1)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f1);
+#endif
+
 	f2 = mock_fence();
 	if (!f2)
 		goto error_put_f1;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f2);
+#endif
+
 	f3 = dma_fence_unwrap_merge(f1, f2);
 	if (!f3)
 		goto error_put_f2;
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71a..b7880d8374db 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -101,7 +101,9 @@ static int sanitycheck(void *arg)
 	f = mock_fence();
 	if (!f)
 		return -ENOMEM;
-
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -117,6 +119,9 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_is_signaled(f)) {
 		pr_err("Fence unexpectedly signaled on creation\n");
 		goto err_free;
@@ -190,6 +195,9 @@ static int test_late_add_callback(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_signal(f);
 
 	if (!dma_fence_add_callback(f, &cb.cb, simple_callback)) {
@@ -282,6 +290,9 @@ static int test_status(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_get_status(f)) {
 		pr_err("Fence unexpectedly has signaled status on creation\n");
 		goto err_free;
@@ -308,6 +319,9 @@ static int test_error(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	dma_fence_set_error(f, -EIO);
 
 	if (dma_fence_get_status(f)) {
@@ -337,6 +351,9 @@ static int test_wait(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
 	if (dma_fence_wait_timeout(f, false, 0) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -379,6 +396,9 @@ static int test_wait_timeout(void *arg)
 	if (!wt.f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(wt.f);
+#endif
 	if (dma_fence_wait_timeout(wt.f, false, 1) != -ETIME) {
 		pr_err("Wait reported complete before being signaled\n");
 		goto err_free;
@@ -458,6 +478,9 @@ static int thread_signal_callback(void *arg)
 			break;
 		}
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+		dma_fence_enable_sw_signaling(f1);
+#endif
 		rcu_assign_pointer(t->fences[t->id], f1);
 		smp_wmb();
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 813779e3c9be..bd7ef58f8b24 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -45,6 +45,10 @@ static int sanitycheck(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
@@ -69,6 +73,10 @@ static int test_signaling(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -114,6 +122,10 @@ static int test_for_each(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -173,6 +185,10 @@ static int test_for_each_unlocked(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
@@ -244,6 +260,10 @@ static int test_get_fences(void *arg)
 	if (!f)
 		return -ENOMEM;
 
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+	dma_fence_enable_sw_signaling(f);
+#endif
+
 	dma_resv_init(&resv);
 	r = dma_resv_lock(&resv, NULL);
 	if (r) {
-- 
2.25.1

