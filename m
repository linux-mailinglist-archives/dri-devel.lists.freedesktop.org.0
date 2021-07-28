Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CAB3D895C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 10:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509D6E59D;
	Wed, 28 Jul 2021 08:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 08:05:37 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260656E581;
 Wed, 28 Jul 2021 08:05:37 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S7hLi4015607; 
 Wed, 28 Jul 2021 00:58:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=trabcA4xa8OijUy5BhdAeboaO0JZyDCAmlEL3syPf5s=;
 b=drph/+9qdFCeOO4UmEw9B0HZ87oR0cYvH3JoqQrpQ3LkhRFjdMH51vT47MZMf/oiLuBU
 59BCRJgfM8XnicCiGyIIh5HgbOnnAYqTYGxzqzWqPTfBys9SIw8/06LSGgRMi4LyrnRl
 hCxIeBE0DtUUzuSlQrNyDojIw18IuF3ob7F7GOiSwfnIvIQre9/rLQexWXHtKmnP/a5O
 NxwSRR3mUV5Ggla+zirDqF8BYb60y4jQWXz5y1Ww9PsUzpHLtpAJTUnhlt3J7dOUibyw
 +6K4wV1Jd9Iu16i8TbCmMe9ZuGYFdnNQ02xBrxPxJBmsIUFGx/eZOZ0XMK2oAvNf8INo 0A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com with ESMTP id 3a314e82x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 00:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESi4buvTZLb5jmc6mEMm/DRIb4wVm9PHkNrmaksb8HxIifH7klbSQxbqjq/LkoxM/J+ld/tKTycINPaNMPTdvxW96lkHQWO3R2cVRoGyEcmi+yixnHCly4b3PAr/gy9b3oMkFNdN0fAFetqwi1EuIKUG5SMfL1ZjxKOKsOOZsqKVHo0MlJ7htUbA7beFtTq1tifS1yQWfWS2wrG3dVvdFD2OY2AoOG3KLFOEEXZNpu4ltV1WKWz376GlNUMYfb5fdjLL04Y2aIp+4tb7SCy7vqDqCi24qYwDnOdG1PhzrFDswoGRQ85ieSvL3jKjSQ1TiBvvG27Vl4wc8k+KVBFzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trabcA4xa8OijUy5BhdAeboaO0JZyDCAmlEL3syPf5s=;
 b=CRN9vCxXuFx5Os98q4SaxRdYgB0FpsaYSmYh6EMeZ5sUnfsrElpn0OUJw/atnEBjidhMgkWEIvQDOy3EzkP0TyYuWWAxfdaQBYfHoepNTmuWpKMpm8LqUNffnzf1HK/9iok9LfnJGN1YIF1rv1KXUfE5HcBWbaXE5kpxz2gJhYj1sJ3Hs+JtkcRWQHAenbDl9YqaJ2t2nGLWnF0HNVZIbksRzsiCOkG9mrH5aPLSLxdnhjxzRVeZQ5p7Q2wCGCKpdHQklUy8SQzxjMjibZtlbkle4l7sU4DUrchrY5etNNyO3oONao/ElV5RImntQoUs3dT1nQVgvl7ePVuOn6cVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2587.namprd11.prod.outlook.com (2603:10b6:5:c3::16) by
 DM6PR11MB3436.namprd11.prod.outlook.com (2603:10b6:5:65::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Wed, 28 Jul 2021 07:58:21 +0000
Received: from DM6PR11MB2587.namprd11.prod.outlook.com
 ([fe80::7071:ef90:3130:cc76]) by DM6PR11MB2587.namprd11.prod.outlook.com
 ([fe80::7071:ef90:3130:cc76%6]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 07:58:21 +0000
From: Jun Miao <jun.miao@windriver.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/i915/gt: Fix a lockdep warning with disable interrupts
Date: Wed, 28 Jul 2021 15:58:07 +0800
Message-Id: <20210728075807.2784314-1-jun.miao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To DM6PR11MB2587.namprd11.prod.outlook.com
 (2603:10b6:5:c3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp7.wrs.com (60.247.85.82) by
 HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Wed, 28 Jul 2021 07:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b54ff30e-a5bf-4d86-0db5-08d9519d77b9
X-MS-TrafficTypeDiagnostic: DM6PR11MB3436:
X-Microsoft-Antispam-PRVS: <DM6PR11MB34365AED5EF01D8E609690718EEA9@DM6PR11MB3436.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kE7DLAOsD9Uxqa+n0lSpawW2Uc5kV1eijkuG8mVwzn4Q350+xCrXe8ytxpHxDtYxD9vX1FDx2kU5vkLY1wIj7AlaLqLGHv/W7QBevNrb9dScvA3teHG+bO0Ix+RPR1fEqAd3ud3hLxTHz72cEt6sMTQPA91zaYwXQAC8Bouk/ezIp4Hh0X6s6Cp4s9YIGOVQMhfRIggwYif5G4ZJ96ckrOrCVmbXHfHLvr9ifdESdEYupgtaMp9Gz18tG/QWG0ckf3w1oxo561ZkGx91vmtRqyPINBv/h+/pVAvW41Tpinv8SmWAKYGMtXz8jw5KH7sJiSMZ0e8IaLEPrdSRJKQ/sbtTowSr6YzztQ9ZLc3ehi7qftA3++jKqMq/TFhtSE2CAn2zYfd1/3RYxM3ybdrQ+oBa6RB6Hcn+fmLFz/4jZXbOn/LNQN/KbjVAlmSfNUIe5GJ2cw02FJXuhc8UIax/zUVAlo9yEYEyP6LZ5OA1YYyTvs+JARTcwqmrK3Cdwva06dTXZMNbAcyecLYwqJs3TD/BCXgDMyvZh0gwHU86MeWZQyGGO9INBbYsyp1QSDNSRbvEmwnSQRXJ8dCTjo9BzCVhHcYk9hOS3YHqxxyesoMtwqzxHhOj2e85PsCZl8nkDUzjGlsbmF9c2QjKhRIg93iRf1oc5nZsRcQ8u5uSxMVoYxjQobq9et1fm7Wi9eSnh6IiOsf8r+V1TsdIXBKg4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2587.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(956004)(1076003)(2616005)(4326008)(7416002)(5660300002)(8936002)(38350700002)(6486002)(44832011)(36756003)(38100700002)(66946007)(8676002)(83380400001)(52116002)(26005)(6506007)(66476007)(86362001)(478600001)(66556008)(6666004)(186003)(316002)(2906002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEte2dbmwQuIUoDJQ68KhP9lAVZpWMjvJsZlq2MII7GmKtCasj2mcJ6a6xRE?=
 =?us-ascii?Q?fU6btUj+ryLlUEuGltgQvwVDjZhZEJ1AZepkdJEb5jHNa/soHpTuxKkB6b4U?=
 =?us-ascii?Q?xdmTSBMAmFg10kfmgdzspEjHidu/tTZzd1WHBZVpAgSvYrv5g6yD4Gn3dBji?=
 =?us-ascii?Q?1Yyhe8hXR3TgS7xZ3ulSkVPPVALqaMiCnuXcgxhkcMg3VPbRtRqspi8d9/v0?=
 =?us-ascii?Q?KwwV0HFSJgixgorSxgshjP7tjf55rtTiNbIKt6jQvyb3+IGtxcqR05L8Jm0P?=
 =?us-ascii?Q?/ZqyQyyqNk/7a82gMMyuatnV8pMdq7gtstKFhGLv6pm3HQN4D9iPkkUop2Qt?=
 =?us-ascii?Q?UtQVnc0WSNjouqERI1wFMQAHs2nw4E53HDWSJkjuTDGcqBnhjHjhEbuO7yC6?=
 =?us-ascii?Q?WJB9i3NC4FQY+KDdtEu4KHSGtYfD3BJ5N8ITMFy4NY5CzHoiEB+LgVH7sanL?=
 =?us-ascii?Q?pXXjqL4ppB+4SPjaWugjonlVrNu7A2AnrbxYlKnYmU7GTDKDEvOM76GC9xFX?=
 =?us-ascii?Q?ixJOTZshklyORR5XxostP8Yjs6ik9xxCzEjWzpR42Em11mj3q5XAX9eGYzUk?=
 =?us-ascii?Q?fZkkNPCTSJydMuzkUcniib6oJfdV98h2AbydQkWiEa+Gh+20AAqgygm6/mDl?=
 =?us-ascii?Q?s+81onexE9j74W++yaZ426bABMQq5VVWy6UIAcME1MboXeyZc6SuYFQm97ix?=
 =?us-ascii?Q?7w9+uDaYHxxxqE+vOiPJJFb9OSoMd6JK68fnax5OxsfEp+YTA2jdOYpU0s4D?=
 =?us-ascii?Q?1stXGbhThgW8NhQo6ppT8w9+9U9hYw+pJACwQPGoUfNupraCvPRppQxhMKtQ?=
 =?us-ascii?Q?qBGd6uzdm3B8jB8804SWzl2+N85UcTBiqsSpsaJcqS4SYjI9B9En17HsTQ9A?=
 =?us-ascii?Q?LMsqTKJ1yMp8cHe5qDajenINHFyFoCztNZ8o2imSbQaRqy6Qis4vCAY2zvyB?=
 =?us-ascii?Q?GF5QCZ86yMwIQb/0fqIt4tZi8jM8GmjlFKYWDKun25ajkZADDucCptF+AgoZ?=
 =?us-ascii?Q?INmybi6Z0LPUKdupmBQHlWcFi4vZZkXqvIYe6C1LvnL+09W9+TObQSMMK1eX?=
 =?us-ascii?Q?vlEEaGzv4TGO891Rgrvx+XZAKvZlWcQKGbNjEl4xlUAU/rYoLREJWq5EB69x?=
 =?us-ascii?Q?ne92wPJxjvMk8FED6l9VCj9o1Km+ksRmYhNNRXU0go5Iay+5Q3QyUrG6SpLF?=
 =?us-ascii?Q?qc1UUDkotCsquRHTVCn6Br96SGt7putsXmNbSEi2ppaxf2h/xsA63qJ3tKbR?=
 =?us-ascii?Q?qnS6VqLA1os2TdzZAtKbLTu46KMOumOxz8v6X21dlnLBoG72MaKSHsxjiYvC?=
 =?us-ascii?Q?AkjV3Ec7345/F2BikxcAGcmV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54ff30e-a5bf-4d86-0db5-08d9519d77b9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 07:58:21.1196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ie1D8QBiX/QvWEufBdxLwFL1828hFE0UmIS5Or6y5b8ifHbKoEWqD1RBmaS1dejmaQJ7i82+RedIfhidGVNZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3436
X-Proofpoint-ORIG-GUID: sj5Fh2icTv4A10NHj756aWb7D2jaoUVz
X-Proofpoint-GUID: sj5Fh2icTv4A10NHj756aWb7D2jaoUVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-28_05,2021-07-27_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2107280044
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When disable local interrupt irq of CPU hardware, some spin_lock
are called by inside signal_irq_work(), intel_breadcrumbs_disarm_irq() and
intel_breadcrumbs_arm_irq().

RT complains about might sleep inside interrupt disable by spin_lock, so 
switch spin_lock to spin_lock_irqsave with the shutdown interrupt at the 
same time.

--- ---
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
index 38cc42783dfb..9b74d0a56bc5 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -63,13 +63,15 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 
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
@@ -84,10 +86,12 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 
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
@@ -181,6 +185,7 @@ static void signal_irq_work(struct irq_work *work)
 	const ktime_t timestamp = ktime_get();
 	struct llist_node *signal, *sn;
 	struct intel_context *ce;
+	unsigned long flags;
 
 	signal = NULL;
 	if (unlikely(!llist_empty(&b->signaled_requests)))
@@ -259,11 +264,11 @@ static void signal_irq_work(struct irq_work *work)
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
@@ -318,9 +323,7 @@ void __intel_breadcrumbs_park(struct intel_breadcrumbs *b)
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
2.32.0

