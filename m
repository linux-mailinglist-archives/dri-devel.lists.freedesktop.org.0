Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E265735ED2B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7836E452;
	Wed, 14 Apr 2021 06:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F7D6E433;
 Wed, 14 Apr 2021 03:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYZWZTTcNiSudsa3NWoyRZEAIQ3EkNFA+dfI8/PpaaCMbB/RJVafGDDfUr6avHSnv71hedhMBEVauN3gHqZmKw4Rk42tlBXQtlRddjyLmTQy73jzedUQFW8wNis9ZfwrH7zRJ4lRvzVdekD9w7n6MlElLhswwvBSXGMC88ROpljKOCRxFzUAn7++2NXWIAuAdVX4/8XBhtLWl2xzHpT0bT+FzSJfmNtalURAVwe4sG+HNWL/B0L5ubDGEdQSsCmCFYSsOMuX3sGiGMFG/AGN7pwwThxbmaZqxSg3TcAaA3fmb6nn5eK5MjlPbuBATbS5fXihirC1Vr56N6PGXY3QgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/4JiPwwWK+uIF10P0Ic0bqaO8Im5G75k3t4+mXuUnw=;
 b=aJuM8AvxZ3SBFvZWyxgYcKR3FSxNK68IP25/xvQ6WRfKCTpulA4Isx9xujlVPPd5DNw7GFVE7LVfJVaKDICWUqnokcxeKvE3qwW1iN4prekf1vJRPmm5H/JswiDCwqFdmYFcwlKRLwNNfSvTcqILTTkFFg425v8YbY8nkc/2LHSp8m79tZNCjFRiQ6NC+gQpABeXVPCdPY7jbst14ajyOpkacCV8zEPSNkqrCaZpsMcgK0p2SL1116V5+QU2FgDIdM+PQSIfef93QYegdRdMrrUGesHGHlyFGskLTKqj+LBTVpRUM3Ax7RKsDfh7X2aRTFR8FmW/op0p2kWTNiNleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/4JiPwwWK+uIF10P0Ic0bqaO8Im5G75k3t4+mXuUnw=;
 b=E5ZMafgqxgDetOto1GJEc9wMKeen5bHZD8GzzPYIjYdCEGYc1Nssbe9L2rlrg6nG8XYLeVtFMnroKYQzao2/JbjZy4XRbf1+dOPXAJbUK8fmgBDd+yo9cwxPzE3ECXMervW69bre0CbEwhp33Zm7zg0GWyqdvn9TEWdgpGq+hfo=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2579.namprd11.prod.outlook.com (2603:10b6:406:ab::21)
 by BN6PR11MB2001.namprd11.prod.outlook.com (2603:10b6:404:49::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 03:29:42 +0000
Received: from BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b]) by BN7PR11MB2579.namprd11.prod.outlook.com
 ([fe80::4c79:805b:e69d:948b%6]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 03:29:42 +0000
From: Jun Miao <jun.miao@windriver.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/gt: Fix a lockdep warning on RT kernel
Date: Wed, 14 Apr 2021 11:29:22 +0800
Message-Id: <20210414032922.12639-2-jun.miao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210414032922.12639-1-jun.miao@windriver.com>
References: <20210414032922.12639-1-jun.miao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To BN7PR11MB2579.namprd11.prod.outlook.com
 (2603:10b6:406:ab::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp3.wrs.com (60.247.85.82) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 03:29:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63e401c1-9da4-43aa-c287-08d8fef58a0a
X-MS-TrafficTypeDiagnostic: BN6PR11MB2001:
X-Microsoft-Antispam-PRVS: <BN6PR11MB200198497148E0F2FDD696D88E4E9@BN6PR11MB2001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8O8gWu/cvqj4fIHU/TXdq14ZmYkdvspLli19KFRj9Hi/9Y7MDhPSJ2BhdGj1dgzfCFaaag8pXu48Ugbg17wuGgTGJFjRl6FpsCHiE6XbEHt7AA1HCD5v3vilbortzfTqT8jCUaPvkMk/Cc88eFpja9r6BouzGQUyPgLoFhHpp7mxo24l0Nmk18McQiWEUMZaMZrbiMcyz27rPBNGzREjy3XLZOC69pO6jhwFqsArSABLCQ7GsRT8Ll3THPY4ZTQz6te4VDlUfgwUzm9VCHoah8W9CIoRns6kf7Jn94oj+VPQlwVNvwq7klMVKy2rEehSaDN7pJQu8JYfCc0fOwYpfBxJZPQfkzMg0vooEVpb55f98upIgkm1T8sz3QUlTB5e1TpEKXkDI4Mg2rtj587K4bChTn/0Uj/H6pB80sxWO2u+41EXhKo2kSmgGbSGI6AN9KoQm+Br4QTvKJV5CtmRXeDMfcmUxiJ1n3gUHdsIcqLaLNqGKdFcflvVXYHNwxLwrklimlg4H/MF+o+2lrFtJhDODpjlhRL1Vg9K3Syy55BoKbElUu7WLZDmNzJREFTvt9GJZNi9UzmZXzofdcDi6uxd+mGvy3U7DomuSUVlDdqySnv7VahFCPY0B+2JBW1u2/WBS+jXFQ+6/lSAd0n4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2579.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(6512007)(6666004)(36756003)(956004)(52116002)(5660300002)(8936002)(6486002)(16526019)(2906002)(316002)(83380400001)(86362001)(2616005)(186003)(66946007)(478600001)(1076003)(44832011)(6506007)(38100700002)(8676002)(66476007)(38350700002)(26005)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+raxFJxYDcm2Fhn1GSpAx8k0Mejk2ehptriwFleyv2d3epf3DAXu5R+wIdOL?=
 =?us-ascii?Q?+51flyZsBfVWO77zf4Szpx7BwfKvWYQ4lxIANKXpLP78lHmRKHI+0M29IQwq?=
 =?us-ascii?Q?Vv9WMldGoPJ0F7q93ikTUQp0yPcFxSUX2thHEyInimyoQZovALBhVy4TubyJ?=
 =?us-ascii?Q?vQz7wfsIRo5/lxO60nwExq6uh/hnmCAFva+m2qXpWmMkYg60wKoNMLuFcVVV?=
 =?us-ascii?Q?BXiLbHjVLodynj5nPvqBcF0oOwGenIQcH4L+L/XTXajkqq3l3IY+KhrBzsxb?=
 =?us-ascii?Q?sMj+wjQ46CwG85zOiCbCGrIG1MAS5OpgcwrC9pAvF8YafmhLRUG0+8UOVN/9?=
 =?us-ascii?Q?2NnZ5YOs6Nr5uWa1UCn053SVrwDFDlnHldoWELOYIKQjR3j+JCmYR0ntMU94?=
 =?us-ascii?Q?0zbbYjBW79jMqlU1yo/bR7SBlQzdF009PUYxWG6UwgdybKjse8E0F2zQEnQG?=
 =?us-ascii?Q?pJE2v6t5NIhHOwC4+INIp8ywvTbIsCv4wNCpkxr76wxqPn6LnOwLVNSj2tn8?=
 =?us-ascii?Q?kcehcm5LjV48K7A/FthsssSHYQyWVxX9K/oITI4RR6S1vg5nvGJE0b39wO/n?=
 =?us-ascii?Q?SrTwq1GfAQGLuXGncbsUfcE550JQd4H/ohxDnYIk7xtDizq4Xkr2MwYTxZ9W?=
 =?us-ascii?Q?edODyp+XjOuCZZlWsWcmIOr9UATGWHEw8MunNGrl3XItLNp6qK2FZKW7f5OK?=
 =?us-ascii?Q?lZV5HqE5kg3BkSxhGpoDeRdG+OX2Y0YjcudxSD7Nj0RNe1BFwOQnW1kKzF86?=
 =?us-ascii?Q?nmUOG3n3aSC4fyOmath6FLtt6qoBxNW92iR3EEj8F9k1b3Zl36EBzt8pMGt5?=
 =?us-ascii?Q?F+g/BPsQ7djDpm8Q/LgwHTAhUQL+gMP/WjSzF5fPMyAv4QT+5idqtfS5N5A/?=
 =?us-ascii?Q?ujXmX9IHRZHuTaewJAAsfBVdoxmy5vc/xLFCuBdUM6lGz/w9yV2anulsgAYB?=
 =?us-ascii?Q?szo5q20QcgYQB4gkWdTkkHpwFizetHTYGwiYAKOwXoq02rk8iB750oA6F9AC?=
 =?us-ascii?Q?rGVZFtJkv0fMEGn6WBvNwjVkhrn70TiPgu2M/CFBjwTm7kmd664eJ93zwfvZ?=
 =?us-ascii?Q?JwlS6OypqhJTaXcOuh/dVn16vBCAzU6fqaYNTIcLfaxXVIiaWDkatcAr52w8?=
 =?us-ascii?Q?j7OgwP660Af5iKHmhl9kNNY9HAyfbLwGzAA65Pqq9vgZMLYIupSBFxu4vLCr?=
 =?us-ascii?Q?ZWklt5OGBAz7Z9raEb/ITxSJe+5zcVI2hj/+iO042n3yKPkb9csT6h/xRuXJ?=
 =?us-ascii?Q?Pi5u/OTr0XhbQxufx8ghaK4f9ojT3oqr4miCNtlQc2Ci8iRJ51nMHZieXlAk?=
 =?us-ascii?Q?K+txACFPTp2miEnYQbgcDacH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e401c1-9da4-43aa-c287-08d8fef58a0a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 03:29:42.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+6AP/qKnSahPNSn8uYZsDj7G0gDjM3iAqERecBveXKSpqMU/31bLVxsBUqjh7FK7oy52NyRQRstuPFotGxAcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2001
X-Mailman-Approved-At: Wed, 14 Apr 2021 06:22:01 +0000
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don`t simple disable all the HD-irq, should race the region in the
intel_breadcrumbs_disarm_irq() only.

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
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 0040b4765a54..89c2874ecc76 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -103,10 +103,11 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 
 static void intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
-	spin_lock(&b->irq_lock);
+	unsigned long flags;
+	spin_lock_irqsave(&b->irq_lock,flags);
 	if (b->irq_armed)
 		__intel_breadcrumbs_disarm_irq(b);
-	spin_unlock(&b->irq_lock);
+	spin_unlock_irqrestore(&b->irq_lock,flags);
 }
 
 static void add_signaling_context(struct intel_breadcrumbs *b,
@@ -342,9 +343,7 @@ void intel_breadcrumbs_park(struct intel_breadcrumbs *b)
 	/* Kick the work once more to drain the signalers */
 	irq_work_sync(&b->irq_work);
 	while (unlikely(READ_ONCE(b->irq_armed))) {
-		local_irq_disable();
 		signal_irq_work(&b->irq_work);
-		local_irq_enable();
 		cond_resched();
 	}
 	GEM_BUG_ON(!list_empty(&b->signalers));
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
