Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E947B361CB5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1536C6EB49;
	Fri, 16 Apr 2021 09:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647E6EB49;
 Fri, 16 Apr 2021 09:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0wRyAY64PAXg/t5rUYzfIi/0dBGGN1t0m+A2a6bOBnqqGRg4qWFNue4+PkSExDjbO1HfiioOPalBRn6cZ/YR5b1SWrx8m+VDwukCNHQnB8h8g7SJFwQiC5obEClFkZe9j0y6MFUXHz8typ5TXVh4nJkPE+xOnLwlG8aPdbk6THge76QxbqZPlUI6bVWolhBZFju3NQ84a8AzmZsRaeySNhuHSvp3pLOX+l5HMUPcpKSF05bNxKSw+fD/lhyjwygdnGukMTqvgDBnFXXe0uudTj7LupmOGcHYjc2mVou+I+ynESUJjH9sDOnxBoIhc4wEM7yYwpd18ZfBU0rRjCH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OES0ImEFg731tc2L0xEM/XywpjT7zHh5PQxdSvG79NI=;
 b=Ma2nxkHUC6I9D5EqoaFiuyxmyFGwZk/Oj6x1g6uCCOrj19xg91ORPcOv0XjjYBrZvnVXHjd2neUPCvvMsfFQucxlEmgGJStPfENtbrMOthK3wUuwS6f5Nrq+bnmv6EVOlsNd43qax/8JEjqBK3DeDB2wPMD9tPSP2x1O3DBfkH6arxgqQm7CezwM++WFsDFsnJf8gYJ6ImjEVztCWd/g+leJg/rPxBbYi3CAhJluFWHpFn9cxyzwD7eDCBNxKWRNTDz3ybTgYkLfv9hNuWnptgDriL46/vNErHnHDj/KYEGIZR3Vdl0rz+Kj0QJ1+A/5xAjexauXbxFcQ3XGCstOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OES0ImEFg731tc2L0xEM/XywpjT7zHh5PQxdSvG79NI=;
 b=H1/Z+oxjRwr7VGKvItMfSBFU4/kfOMkcZKKudymG2ZyqTq4TYfzjveVXW0ASVMa858MU0b7lmGqmRiSyzO9/q6in8LpvY2l9dtvwsm0W16rbFcfpXRfoI8YEITWHcdcKlvXpgHIhFMrMKwfCt8BYhcVdRDdy2E0W79hPqd0zPJc=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=windriver.com;
Received: from BN7PR11MB2579.namprd11.prod.outlook.com (2603:10b6:406:ab::21)
 by BN6PR11MB1602.namprd11.prod.outlook.com (2603:10b6:405:c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 09:09:07 +0000
Received: from BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b]) by BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b%6]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 09:09:07 +0000
From: Jun Miao <jun.miao@windriver.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [V3] drm/i915/gt: Fix a lockdep warning with interrupts enabled
Date: Fri, 16 Apr 2021 17:08:52 +0800
Message-Id: <20210416090852.3037719-1-jun.miao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To BN7PR11MB2579.namprd11.prod.outlook.com
 (2603:10b6:406:ab::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp7.wrs.com (60.247.85.82) by
 HK2PR04CA0045.apcprd04.prod.outlook.com (2603:1096:202:14::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 09:09:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ee722f2-3158-4782-e9d7-08d900b74940
X-MS-TrafficTypeDiagnostic: BN6PR11MB1602:
X-Microsoft-Antispam-PRVS: <BN6PR11MB1602A5F43DD832570C592B4E8E4C9@BN6PR11MB1602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1Nw1jCWwUum3TP/yhL7Rm9DjWAuEPjMEjoy5JZT2ZDOio6pEcMae7F82if/5pzllqv17bWZ6DxphJdxWi4FGRGfGFXot2GoEgqr2GzknMqbcd1xjspfDSUa+SWqGWZnjVn1l5bmRU+6MtIXy3R9T7SNfX1pIdeJBq4ZTvdJshOYark9RwzQOclce+6MpJj90Oju5hoIBiPJzT8GL6iDxXr3/uk7xuDHbsnvDxOsh8s8p/plWG5FP5Q4+qdKS820cmoKr74PvshkblGDiKkhPNsBM9t/7CzuQtFStMWEcOLj6SpT7H1fI/ZBkqciQexrmWMmSNoAnifewslCunfiCYwgWqJiul47bksoYkssgDXkEyNxFymWzvhScm1UQhuY2vTePKjMi4xqKA4VwN8J8SB93sDQuQOOEhO6IUfysp05WpatiP5TKX7UKZy11SCvbi4UH3ffIGWnbltie/0ifYFQRKcoBOf9G9tWLK36LJvpcVWJY6D5v7KwH3SBW6A5xRB1LWfXHT/pSh9cT3f8saINMDGtpbpg6N1tvbzNWpniFKXVFW0yJUqQLIxNiIh7k1s9lTZPbzeWek2KXX05bMfGoOwhNGj+doFQMFG0kTu8A5w4mHTk48pSyE11+UtOzUnM1rtfGsZlRY0mhCR9Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(316002)(2906002)(66476007)(44832011)(6666004)(86362001)(16526019)(186003)(38100700002)(26005)(66946007)(1076003)(38350700002)(83380400001)(956004)(8936002)(6486002)(8676002)(52116002)(2616005)(66556008)(6506007)(478600001)(5660300002)(36756003)(6512007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ctz8rQxIipl6qJY9VZs4hbJViYfe33WlMmbcK8bfDJuExr8btOI6VMktz+QD?=
 =?us-ascii?Q?9EIfIl6EkyoXz5Htcofgd0bpSbNSd2wBwikoxIzlNcundXUChnLCgWY6rIPl?=
 =?us-ascii?Q?CiJQB5WdPqf2OHCRXO08UEAUgnStBBDH2mD8SmG8IRnqqnvuLRyRgEEsT5wE?=
 =?us-ascii?Q?pQHvGnukGMYeh+cAIN6NFWqBKkmSia3qtGSz3gKkbP990vFvPl+bskzfD4oA?=
 =?us-ascii?Q?gMsWbuG9Lik/19keWS3W8UNn9weQ9sYubfIJiTsi78SH4XQ7TKP3XzUBWhpp?=
 =?us-ascii?Q?u/dk9kZOmHpzG55G3ZGqY9aUv0etUN2yILVUNfhUMXiVsOPprXqS9j1IsdJF?=
 =?us-ascii?Q?NPp/KjiRUCLjOw+lvgJzjiR/BziTSo+Kfu1+NNLz55ZdGLxBh6DIXJ3e4JBa?=
 =?us-ascii?Q?3Vlr7xDOjeiVGkWx5Kpkmq0bwMf24D99NwBjyYuYYPg6x/0YsaLVDwWpermM?=
 =?us-ascii?Q?UsQh+6zw/jhXoHkep+YkcbbnbHitvF2wq2y/BET0jKmIkkYfyRXL2fn7TZoI?=
 =?us-ascii?Q?o7xyrKJz2nRFZzHuiNXDs4DMfbCtz3kBd8hZhxhh23I2JExCMt7MMs8TaMlu?=
 =?us-ascii?Q?Beh2sFkNH95x29uzXADFM2DRJZLQ6pa6Kw1PZ3Aje81gOHxE99RFGkvGcNsM?=
 =?us-ascii?Q?jCfNAY3pxzisvSqgvIyf+CWtcDRmxXe7ULhwMjirXo9hFRMbzFHJTveyhTAe?=
 =?us-ascii?Q?MXFoXdsbLDrLDC4LXfYmOyne2hm9YtqorzFWtVSil95UXHO1/ijxjVRwV4F5?=
 =?us-ascii?Q?CJ6c9Xq4UPtiv200E7REXQ7RmEl3s5f4bqYb4fwyn0JGn2PSgpR7/O2WgIXl?=
 =?us-ascii?Q?UKT+olhAp53q8gqVCt2Eo/7yM8kgxLlSIN3Q4U0wnn4JzFxwteFDH97UdXUa?=
 =?us-ascii?Q?R5ITkijyQ8kJZ3THHpe63x3rTVOlk/h1yJH6jJBTQVI2qav48wgXU2/GScaP?=
 =?us-ascii?Q?DRkAE8wrwAs66HH+WpVEs9uRMdQKO+FJQaI5IXJqB+ZsV/bNE5rFwwerx5Tk?=
 =?us-ascii?Q?4M7h5emYsFBwhQTkUYI+bN5hfygBw09eJJJ88dQ4QWvQHOY6Jx5FCjIEzzf/?=
 =?us-ascii?Q?R4vnzNJTzSokI08gXpnOKHGB0SgE2kaeoHEZVWZDGFtUMnoZrVcdil1+Ioh6?=
 =?us-ascii?Q?dVNpaPSgLdEWOm6Jf8kG6ftSF2jETSL3EH4NCprFPiUVUicpGyOEdi8Y7X9r?=
 =?us-ascii?Q?W0AC5cX0DzLKybX8egF7BxDowgOSFILrgcG8y3t0vx9FE+yqM3IU69T0UIwJ?=
 =?us-ascii?Q?Q2ZGrYydJiZEhHe9pcyZypEkMMhVIb/E3yUEx2e+XaNe3PfDVTJTueX1yT4A?=
 =?us-ascii?Q?3PE7a/R1jjHU3jViiHd1BslN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee722f2-3158-4782-e9d7-08d900b74940
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 09:09:07.0764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jXlLS1Tnlm0+pfydkNE2Jt7uRUq50hrZidZayXCLJuOOM2jnqzWR2ho0FP8UwzvRbeyggkeKfSHQELUM3Mfcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1602
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don`t simplely disable local interrupt delivery of CPU hardware irq, should race
the region inside signal_irq_work, include intel_breadcrumbs_disarm_irq/intel_breadcrumbs_arm_irq.

RT complains about might sleep inside signal_irq_work() because spin_lock will
be invoked after disabling interrupts.

Thanks to Tvrtko Ursulin for his expert opinions and suggestions.

BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:969
  #0: ffff89c4c00ca970 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1cf/0x6d0
  #1: ffffa433c1f53e60 ((work_completion)(&engine->retire_work)){+.+.}-{0:0}, at: process_one_work+0x1cf 0x6d
  #2: ffff89c4ccb0a0a8 (kernel_context){+.+.}-{0:0}, at: engine_retire+0x62/0x110 [i915]
  #3: ffff89c4cf682300 (wakeref.mutex#3){+.+.}-{0:0}, at: __intel_wakeref_put_last+0x20/0x60 [i915]
  #4: ffff89c4ccb08398 (&b->irq_lock){+.+.}-{0:0}, at: intel_breadcrumbs_disarm_irq+0x20/0xd0 [i915]
 irq event stamp: 2126
 hardirqs last  enabled at (2125): [<ffffffffbb134739>] cancel_delayed_work+0xa9/0xc0
 hardirqs last disabled at (2126): [<ffffffffc0507fe6>] __intel_breadcrumbs_park+0x76/0x80 [i915]
 softirqs last  enabled at (0): [<ffffffffbb1099ce>] copy_process+0x63e/0x1630
 softirqs last disabled at (0): [<0000000000000000>] 0x0
 CPU: 3 PID: 281 Comm: kworker/3:3 Not tainted 5.10.27-rt34-yocto-preempt-rt #1
 Hardware name: Intel(R) Client Systems NUC7i5DNKE/NUC7i5DNB, BIOS DNKBLi5v.86A.0064.2019.0523.1933 05/23 2019
 Workqueue: events engine_retire [i915]
 Call Trace:
  show_stack+0x52/0x58
  dump_stack+0x7d/0x9f
  ___might_sleep.cold+0xe3/0xf4
  rt_spin_lock+0x3f/0xc0
  ? intel_breadcrumbs_disarm_irq+0x20/0xd0 [i915]
  intel_breadcrumbs_disarm_irq+0x20/0xd0 [i915]
  signal_irq_work+0x241/0x660 [i915]
  ? __this_cpu_preempt_check+0x13/0x20
  ? lockdep_hardirqs_off+0x106/0x120
  __intel_breadcrumbs_park+0x3f/0x80 [i915]
  __engine_park+0xbd/0xe0 [i915]
  ____intel_wakeref_put_last+0x22/0x60 [i915]
  __intel_wakeref_put_last+0x50/0x60 [i915]
  intel_context_exit_engine+0x5f/0x70 [i915]
  i915_request_retire+0x139/0x2d0 [i915]
  engine_retire+0xb0/0x110 [i915]
  process_one_work+0x26d/0x6d0
  worker_thread+0x53/0x330
  kthread+0x1b0/0x1d0
  ? process_one_work+0x6d0/0x6d0
  ? __kthread_parkme+0xc0/0xc0
  ret_from_fork+0x22/0x30

Fixes: 9d5612ca165a ("drm/i915/gt: Defer enabling the breadcrumb interrupt to after submission")
Signed-off-by: Jun Miao <jun.miao@windriver.com>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 34a645d..01eb18e 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -82,13 +82,15 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 
 static void intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 {
+	unsigned long flags;
+
 	if (!b->irq_engine)
 		return;
 
-	spin_lock(&b->irq_lock);
+	spin_lock_irqsave(&b->irq_lock, flags);
 	if (!b->irq_armed)
 		__intel_breadcrumbs_arm_irq(b);
-	spin_unlock(&b->irq_lock);
+	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
 static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
@@ -103,10 +105,12 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 
 static void intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
-	spin_lock(&b->irq_lock);
+	unsigned long flags;
+
+	spin_lock_irqsave(&b->irq_lock, flags);
 	if (b->irq_armed)
 		__intel_breadcrumbs_disarm_irq(b);
-	spin_unlock(&b->irq_lock);
+	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
 static void add_signaling_context(struct intel_breadcrumbs *b,
@@ -200,6 +204,7 @@ static void signal_irq_work(struct irq_work *work)
 	const ktime_t timestamp = ktime_get();
 	struct llist_node *signal, *sn;
 	struct intel_context *ce;
+	unsigned long flags;
 
 	signal = NULL;
 	if (unlikely(!llist_empty(&b->signaled_requests)))
@@ -278,11 +283,11 @@ static void signal_irq_work(struct irq_work *work)
 			llist_entry(signal, typeof(*rq), signal_node);
 		struct list_head cb_list;
 
-		spin_lock(&rq->lock);
+		spin_lock_irqsave(&rq->lock, flags);
 		list_replace(&rq->fence.cb_list, &cb_list);
 		__dma_fence_signal__timestamp(&rq->fence, timestamp);
 		__dma_fence_signal__notify(&rq->fence, &cb_list);
-		spin_unlock(&rq->lock);
+		spin_unlock_irqrestore(&rq->lock, flags);
 
 		i915_request_put(rq);
 	}
@@ -337,9 +342,7 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
 	/* Kick the work once more to drain the signalers, and disarm the irq */
 	irq_work_sync(&b->irq_work);
 	while (READ_ONCE(b->irq_armed) && !atomic_read(&b->active)) {
-		local_irq_disable();
 		signal_irq_work(&b->irq_work);
-		local_irq_enable();
 		cond_resched();
 	}
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
