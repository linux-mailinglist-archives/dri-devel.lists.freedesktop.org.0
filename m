Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF15B3DB2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18510ECC9;
	Fri,  9 Sep 2022 17:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569310ECD4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:10:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeAM025YYptQqc/XWnQ2C4p2ycCKWKbBjNY91RC4FTJ+SVL+o0HZLnwPGuae5SXCIRdwOfu2i3ROu5qj8fJTtipfbNpQ+XVG3io3MEcEaCB4Py8HqaIfWEQOyYW5TLO/JgwXbfbaeX5EpeELqePAV0RgFPvkjzWtFMy1PzlNDnGxWypoPGxpwaOx5uwyMqI9F5iUBAr/RAJnIQLldn/8Wej2sUXt+r933VbQAdU3rCxwFCEllJgr5LFn57vPeljLV+Fm0DvbvEGGUiVLpDYd+ETASMOExreg3IlPGR2JZp3HH+nfvTOtSyc/S6HTq2K9fvXU6Tqgq959kyEBdiEkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KDqZvVZDFvsAWz57T3Mk3Zm3S5piev9yX54TmYPZng=;
 b=ROled91Rqfr4v3Jfiyc8/IH3cXvJ5U3ZyP1gUfCKk21paidOJBuQCcd2aZCOkTTcT3ENkxNnbOlbxqJiX14AdtTTw/r+sChXjbX/R+zBjiTwFxIswIuh15m+GopFOIWoYgsjPlcz23at/ZBJcxpDulsou+de9ZklQ93jDdwWEh7NpNeGBT0g1/k7uLIe9UOKXbMr5CrRGJPwoB6idAK8Ji/XzcnsYN99vDca0MTbHhvz7BA+x0fhHOAdCsdazYnEVDxOIAIRhGaa9AZDWem2ldS16KSSwwcVr8uNYyprJQylWVq7hjXJM5dOtMueYbyeaTUZEYI7qnD1fib7zwfy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KDqZvVZDFvsAWz57T3Mk3Zm3S5piev9yX54TmYPZng=;
 b=CrX6VGt65v4HqSwXcFHB7pnm6ixBgmGYG2T83d4jlihnI9R3ATpq6DDjxg9uIaWtq9Gl3IRfcIGF0BDF4T/t1nLWx0g8pF4orkovmnQYQEfMZSkB2KPO1YNgL8eRfR8rTyeMbZ8tXJMlQRoBKgSNoNctK8D8S8VLNu2piWTHxME=
Received: from MW4PR03CA0120.namprd03.prod.outlook.com (2603:10b6:303:b7::35)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 9 Sep
 2022 17:10:29 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::71) by MW4PR03CA0120.outlook.office365.com
 (2603:10b6:303:b7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Fri, 9 Sep 2022 17:10:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 17:10:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 12:10:24 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/6] dma-buf: Enable signaling on fence for selftests
Date: Fri, 9 Sep 2022 22:38:42 +0530
Message-ID: <20220909170845.4946-4-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909170845.4946-1-Arvind.Yadav@amd.com>
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 497bd7c8-788a-4e80-fd92-08da92863227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dbS5v14vlaPOOcsz2oTUedXveSQKwDXxPVP4GPbChJmohrzUOmK+S7ZBBtugHkpx1SDmLXPUMRRMobMDWrRqWhBUDufklMwudphD5fco++axyCwImNlaDqUWszHmvtX0oWyGZogHFSg4glHl49kXZzfPHEHNdcA76N85ujl8wAI6lX21Q7ggR/mMkB/dAPNhGxUAoGEBhoykwYQ1c3yiug/xQaCZRXFmq4rUXDOuFczbzuDZwV7BT+eL2M6YtzJKAj8pYKBzaeCSCcEvKbGWyATTextFOqqJMYknmlrGZ0nDB+qt8ePWns8Qq0p+tjv8GzUCpslylwBf8eWB+c/wL7Ma3fNWNGZ/WfRbSLIECrtxeVYkiGbZzuf6fFpXYhjniIFLPpdJFGaCdIjU4xFtIQbAhnsjBNdmAne3Ce8omrxs7Slh4ovy0/JLPre3tthLFBiv4HVoAkgvRAfoDwpeumygnTZC1SYO0iITkU1r4F5BRtWV5R7NgBXnkI6eOW2v6EzYWPVlX73+nCGnLPCx03dKCgfnRJ/C0KRJ8PHywekj3xenbEJBnyKfJqxUW+KpdFW32Wdlnrq7Pag7RN47o5ucsCbkGyttUtd7SY2IlaGcP3RyOS4nj4gppnBrNlZxdtdXuEoOw64AwVRN0xrQjXoAK4wfmcjxM4J+wVwXbXVfpSMeFDGSq0XE6QWxyd+1Nna0zHzC6Wfo6BBmh6D1EB5757oSzNHM0MgD9SWoZqhV4JmP9KARNZt7YDAzam6s3gS/QM5iKBMtSRmBZ0dzaVv03Of6kCo1uJCjoJT0MuFXjqaQmbZawSk8gf2SXJ4rRM5U+P7YwMPFKoYPOBsGfBt4ZnvPezn/iIRnWKUkYW3TGyWBvk1jjUWyeEHIzhdW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(40470700004)(46966006)(81166007)(82310400005)(6666004)(36860700001)(82740400003)(356005)(1076003)(41300700001)(26005)(7696005)(83380400001)(426003)(2616005)(336012)(47076005)(186003)(921005)(16526019)(478600001)(316002)(8676002)(40480700001)(70586007)(110136005)(70206006)(86362001)(4326008)(36756003)(40460700003)(2906002)(8936002)(5660300002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:10:28.9226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497bd7c8-788a-4e80-fd92-08da92863227
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811
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

Here's enabling software signaling on fence for selftest.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
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

