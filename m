Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8635FF71
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF6F6E9D0;
	Thu, 15 Apr 2021 01:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F6C6E9A1;
 Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaA0tjOw+lmzPT8ZA7MAiELY/iu8Rp6v3RHgI1yoTVsqLCjtx+QXj18qD0b4HzKgMENERYmef+mI4E+HCYSYNZfR0XyueFBxxHAOMbeVEj1sSq0Rm8XjZJqmc/Nk6kp1WasqbJX7VEe6RQSoDwiOpu9uzJePpLpTHlGuqkT8Q+5LHFpza/vcV/eZNrY4js5QHUPH+kA8tGZFUOjd5qfiKs03uJDxrwNI7hJ8Ye+bLb5jhOlB6VaUFZiGEakNtKEH6o5vKfo5xoNmDCjvf5i6spxhNiTBTMwv1wMXKOIAnk18jKdbnSiEKFQUHuR2EDE3F6gatDoKMu/ys6k2kay9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/iH1M8hsqshY6G356Ko4yGQsYmHPzg3yCM8SkBVMbo=;
 b=clOJ6yqRt6+mupd/hkjJbTfhc5sE/VaUGc97oUivlYDBzYZ9JYEbzGZoJHNUWkm01WAP9kGMBHqVHvoX6RSHhv2tjI7CU26WTDKqW4JfMdbxO4rBjCioFnnCzOJV576B6QdqtAXe2y3FXNZNe125d8VuMjIYugI6MbLc/3ERyncOTU2kctNHjRpxbiQgmuiii5QKceJoqJxmhgDtyydT7T6QRXbjzVF5P3r72kFFwswV9vlnaVS7GEnMN7RMCn7OKnDXKxRcUpLb1IdWWQ3ssP/HaJN3iayBzppuCjJTCdrMXfW3Qor4f+Wnfho6Eeyy5KzDl0zD1BJZMs2SuNT2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/iH1M8hsqshY6G356Ko4yGQsYmHPzg3yCM8SkBVMbo=;
 b=q1bUW8zUHgX8yAnfSo4PxXQQHEmH7r9Am4BgKTq0/wraj8TTGHx1QxPnTMJ2eASxCGxx0oojxUewT+AN1m811T1uSIzMHHBU9mF9wzJLFrI14IRig9G7+MgFtNJRE//nB19pNd3MopF7oUeTL8jo+Z+GlrArMzzjZytS/uINaR0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/34] drm/amdkfd: invalidate tables on page retry fault
Date: Wed, 14 Apr 2021 21:23:24 -0400
Message-Id: <20210415012337.1755-22-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 028689eb-d091-49a6-0ba3-08d8ffad285d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208B296F116498CE314A446924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+WmYQJ6InzRkZcm2m3AqZymqpTA/1PZ3nDDnNVOv3oIyBLWxHp7O9jFIunBOtMdOWnKUVdT9w16PbqZz5Sm+natX+Uyl/uzz8V/1dQPRo4WacjpdAZPZ3hLkzscWZMXEF5ojDeCb2j8SVO+poNIIgnSQUphmRgaAEUxlF51znT8TkDWHH7gEXIP2aInB04kNy1fHht681c3ufGzJb0OioxjHKiBZJo3r238seT4UuJsMbj32/SxKnTxBx9SnUQkvXAqJ0288zWeHT4qRGJk+3E4/SiFlyXi6uP4iT13wd+ZjGc8bC/6kUDKqnZqbIvhaZLx3rqDMhyz3aucOoOflEy336iWFHZquMwgy+dJv1fEcapWyCcmiFuCZ2VRyLotsfCfABXDHXGr+VTbOj0o+FyqsgAlWgjFzGy6BoW6acVx1z+DRG8gLyjKWwXLNTVIDBp4+2PEpaHHdPYNB+wZiSndqJE4lGOaemIf5j+JUmH+/D7KE0W2tQfMCZt+2PhFuaXug0p8eLNM+3Q7xCBfARc2Uwv0ZWa0fWmZyGzJ9nMxNrs3fksgZLe74TA9HJds+1FS7Snt1bnCw/tjQ6b525LXjRXS5cFuS7T/OBG9yAvQtD9PxWp+Qb55AWDTn/RtH9DgIxCPKzqDfNBMS61+e+gqkRxCFpmeG9KY7RGlFFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(54906003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?flBRF1gu4taa+YcV+ZVgqPCw3SL/u5ucIVVlwODrqoAc/I7PzKNUAuejLV2k?=
 =?us-ascii?Q?NylO/vSlt2HJWe5tqYFoRlBq/cI1wYK+VwtR9JuwnRUptY0R/ek+ZNcSa63d?=
 =?us-ascii?Q?9t1AjslKlC9uhwWoUO6Uq3tCa53b1X3ByWE28lejB8JQ4VYsofslwkyif2NC?=
 =?us-ascii?Q?hEzZUlbspU1rQzhwhg7i0pMJ2IeXn1N3Ti4re7QHf7kVUwnmLTKiUykjq7pC?=
 =?us-ascii?Q?R/DTT+bDbtn9kdE65UnahvtSeycOvVm6uz3n5RsVQswATV74AL4JMcMXDbFu?=
 =?us-ascii?Q?VS4O5yMY9c6yfLB4Jix117oN7Xhi3Mxci6RqYzFTaLaFhITlCc7C8fLHpUMD?=
 =?us-ascii?Q?QMTz42T+CxXirkdmdB26b7cRr+b2lcYcUjfY5uww3Sa1CccUV8zFrzSN5/Mc?=
 =?us-ascii?Q?WHHjyU1FFjtwCta+hu9MkAXg11Yjd/JauraOiXA33Fxd4PkTQshdo2aFvYjh?=
 =?us-ascii?Q?mna2SDUJKm64lSSvORToXu24bn0+GOc19aOcZMzlmzyc8zh5NOUXGfooMgwF?=
 =?us-ascii?Q?hTuM5uV3Fk3fbQcNowfelNJ8urJPSteKf8o9V8WGdDWiHlcLvOdLnhM6HzvO?=
 =?us-ascii?Q?0X4Xat7QmIHtsYKNw1gQihCAwy1+t6wH0xoqk8zuVc1fEmFheUzehJk9srow?=
 =?us-ascii?Q?Y2roATwT4LF/z37UirGHvPwGC+C3S39rcmgYdVeugJlTCD0AMOD7dvEQ560z?=
 =?us-ascii?Q?6YkJe9sVt4SZ5ZZ8qQKH9zxDJelQ0VO0IbbwIuk4nehWvS6y3P7X3SYTYJRh?=
 =?us-ascii?Q?GSnMQsQTo56uMjOZNdN4X06mskJAD0VARYygqdzBxHMKmpXYtNix0GzVVdhK?=
 =?us-ascii?Q?fpQVj6FYd8YcWkijIn0Vdhz0h/OxkMj1HqpLP+XirVRD/FTcldE1YJr1EIDT?=
 =?us-ascii?Q?l6RGeNyi8TWNz6wEgHZSaeeK9E46IMOZ+V8c3LEk3+12NnetV1EscIf9Nrcz?=
 =?us-ascii?Q?Po/Fv9c5FKhY2+80Y8g20DIWagxDU6adtw6RYwT0+HGzqLCcbiRLSvCSgyUF?=
 =?us-ascii?Q?vfon8X+ahdEXkXFTLxo91GVpVHfypFEUfFFYnHGXabJrpEbcD06WXDTBBGim?=
 =?us-ascii?Q?Zay87RFg80Hu+/WD87eLhCe27VeiQeLkOgmanrEtCeOLz9miZeAEs3TR0yv1?=
 =?us-ascii?Q?LbsY8ii0PuD5vk9alMUHQRoOjhfC35y/Q9UI9I5JNFwrlVboqz4yH/D5fvHj?=
 =?us-ascii?Q?GGA6RXs+AK4bokxp89n+SU59XvhAlPD2Sc7W9l4I26BEnGO8yTtvNKeo4M+L?=
 =?us-ascii?Q?vOWFEiaLNhlmURjONcoPtV9UqkUTwckkiKrlMCjgt8DaB7McBchahJMvVRXi?=
 =?us-ascii?Q?J5kOvCZc4Fukdu0eVn8VDkGI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028689eb-d091-49a6-0ba3-08d8ffad285d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:04.6607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SapBmtLZ1JRL+dk3vMxiOstmLHAMqCC+/CrCgVcbp20whC0XRCKNgexwn6Lhjuh+7DkiNklDNpxaJt1RmtMy7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU page tables are invalidated by unmapping prange directly at
the mmu notifier, when page fault retry is enabled through
amdgpu_noretry global parameter. The restore page table is
performed at the page fault handler.

If xnack is on, we update GPU mappings after migration to avoid
unnecessary GPUVM faults.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 77 +++++++++++++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  4 +-
 3 files changed, 70 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index c47a673ef24e..5e0fec5dbcd6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -808,7 +808,11 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
 			 prange, prange->start, prange->last);
 
-	op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && parent == prange)
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
+	else
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
 	svm_range_add_list_work(&p->svms, parent, mm, op);
 	schedule_deferred_list_work(&p->svms);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 5211e7dcf0f8..4e3156d891a2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -912,6 +912,13 @@ svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
 	}
 
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && prange->work_item.op == SVM_OP_ADD_RANGE) {
+		prange->work_item.op = SVM_OP_ADD_RANGE_AND_MAP;
+		pr_debug("change prange 0x%p [0x%lx 0x%lx] op %d\n",
+			 prange, prange->start, prange->last,
+			 SVM_OP_ADD_RANGE_AND_MAP);
+	}
 	return 0;
 }
 
@@ -1452,25 +1459,52 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
 		unsigned long start, unsigned long last)
 {
 	struct svm_range_list *svms = prange->svms;
-	int evicted_ranges;
+	struct kfd_process *p;
 	int r = 0;
 
-	atomic_inc(&prange->invalid);
-	evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
-	if (evicted_ranges != 1)
-		return r;
+	p = container_of(svms, struct kfd_process, svms);
 
-	pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
-		 prange->svms, prange->start, prange->last);
+	pr_debug("invalidate svms 0x%p prange [0x%lx 0x%lx] [0x%lx 0x%lx]\n",
+		 svms, prange->start, prange->last, start, last);
 
-	/* First eviction, stop the queues */
-	r = kgd2kfd_quiesce_mm(mm);
-	if (r)
-		pr_debug("failed to quiesce KFD\n");
+	if (!p->xnack_enabled) {
+		int evicted_ranges;
 
-	pr_debug("schedule to restore svm %p ranges\n", svms);
-	schedule_delayed_work(&svms->restore_work,
-		msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+		atomic_inc(&prange->invalid);
+		evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
+		if (evicted_ranges != 1)
+			return r;
+
+		pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
+			 prange->svms, prange->start, prange->last);
+
+		/* First eviction, stop the queues */
+		r = kgd2kfd_quiesce_mm(mm);
+		if (r)
+			pr_debug("failed to quiesce KFD\n");
+
+		pr_debug("schedule to restore svm %p ranges\n", svms);
+		schedule_delayed_work(&svms->restore_work,
+			msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+	} else {
+		struct svm_range *pchild;
+		unsigned long s, l;
+
+		pr_debug("invalidate unmap svms 0x%p [0x%lx 0x%lx] from GPUs\n",
+			 prange->svms, start, last);
+		list_for_each_entry(pchild, &prange->child_list, child_list) {
+			mutex_lock_nested(&pchild->lock, 1);
+			s = max(start, pchild->start);
+			l = min(last, pchild->last);
+			if (l >= s)
+				svm_range_unmap_from_gpus(pchild, s, l);
+			mutex_unlock(&pchild->lock);
+		}
+		s = max(start, prange->start);
+		l = min(last, prange->last);
+		if (l >= s)
+			svm_range_unmap_from_gpus(prange, s, l);
+	}
 
 	return r;
 }
@@ -1673,12 +1707,25 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 			 svms, prange, prange->start, prange->last);
 		svm_range_update_notifier_and_interval_tree(mm, prange);
 		break;
+	case SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP:
+		pr_debug("update and map 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_update_notifier_and_interval_tree(mm, prange);
+		/* TODO: implement deferred validation and mapping */
+		break;
 	case SVM_OP_ADD_RANGE:
 		pr_debug("add 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms, prange,
 			 prange->start, prange->last);
 		svm_range_add_to_svms(prange);
 		svm_range_add_notifier_locked(mm, prange);
 		break;
+	case SVM_OP_ADD_RANGE_AND_MAP:
+		pr_debug("add and map 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms,
+			 prange, prange->start, prange->last);
+		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
+		/* TODO: implement deferred validation and mapping */
+		break;
 	default:
 		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
 			 prange->work_item.op);
@@ -2301,7 +2348,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		if (r)
 			goto out_unlock_range;
 
-		if (migrated) {
+		if (migrated && !p->xnack_enabled) {
 			pr_debug("restore_work will update mappings of GPUs\n");
 			mutex_unlock(&prange->migrate_mutex);
 			continue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 37cfa1689c4f..d88926d2855f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -44,7 +44,9 @@ enum svm_work_list_ops {
 	SVM_OP_NULL,
 	SVM_OP_UNMAP_RANGE,
 	SVM_OP_UPDATE_RANGE_NOTIFIER,
-	SVM_OP_ADD_RANGE
+	SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP,
+	SVM_OP_ADD_RANGE,
+	SVM_OP_ADD_RANGE_AND_MAP
 };
 
 struct svm_work_list_item {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
