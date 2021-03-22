Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34B343F4A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33776E436;
	Mon, 22 Mar 2021 11:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF5E6E406;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaGN+iRTZ5U6/b79ik0i2URYpQ6IjyH426ofgz44NMuzUpJGJEjxbBcXV6fOWBwH5QYBl45+Cq0Zr1hDHKvhkorZ8A/ImW5qynkproP58Eru676xp/E6qWPUDzuj8EBdmx7BwzoI/Yi8x5H2Yiur0RQokVxk1AevP9xwMOZ8V1XfZCHVm1+kIgsmr+JAVzj/Xuw9ojDzGYaQogHCFgYlDhkmRA/jH+kj6MmrnARjId8/dT6eOtQXAOcEc38qzj5OGzLvV6EYaGFqbbQ9IBb0XylP3MmiKkofVp0DwPEkaE321Yr/DWw/v8CTzxfcfojWbIV+zXs+SmKUhH1HLUEr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RCoLsH7sTr9z/n56GvfDtsxb9pzYOKmQXozkxbljZI=;
 b=UuNq5PWPV3OAxhqDFIdiQFgoF1+oaH0V+GvjGCbBCUDLymrLQNf9Y8daehExa5WJIHZzcTeBwR6x4BGC/t/rykJnFgDal6h+HqtGUQH/Bppq5baiVtFWnvd2Cda4eFk2seq/aUZHWyhtEUPLJCUPrk4ClIbrSNRwQQfls8E/F/H57swYyy6H++gApESv1gwHI9hdaj4D1+xuEUKux5+5GQC4DGQl3dmZnjdvF4VmBgtxsghDXbymLa8IspRG0IAt6ZpxVq/lOoW3pH3w0Kfxjs1SKxZ03BfCRy+bNhRDhpeasYkrUkmrNzcIh+8HHnSoJOWx+LougjeCJNLTvVfJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RCoLsH7sTr9z/n56GvfDtsxb9pzYOKmQXozkxbljZI=;
 b=ytPnHo5zGYuwBe5xxirGJ3YBkWk1HDgrdexy23FSmmn60jT1AqG9biFXiqcfVcM9yVYDlhxNymv8B6W/a+f/dRJXWNdXBOd+ttfhpDeGhiFIW2Ogpo447YGEwwSlYFx9Ih3OhYuT7LXa3nhpJhxV7sYABfHnozsaLpvmDtuC2nw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:23 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:23 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 44/44] drm/amdkfd: Nested locking and invalidation of child
 ranges
Date: Mon, 22 Mar 2021 06:59:00 -0400
Message-Id: <20210322105900.14068-45-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 32e7e30e-316d-4bb0-426b-08d8ed22bcb1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42553E3460C066C6D115A24C92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SD/CFpV5+eHsbBbCrd3wDPevIdQgsgnyk9s3/kcm3tF4j5zcTLGiuCmRjG4rpzl2d6r75ftHUJHDIB4DH26xledPNbgs2/wHrZFb8iGn5inMfTFJen3akIZhqJXrCKI+KoPOfimbPNS3vmpVNpVUinB7RHbe257KMtv0ic+WWhVXnssW1XUYO3JOWe5mQojnRzyi2ZTe0adN+aQIkiC9BJ9lWX8s3nAUVe/WglQugDncwvnj2PLI8GwQmCbR2L8ipVeN4nEtJklZeQtQC2R3LxUY0MQzImX8QFq6UqArJ4W1PECwENCehF4yevZv1Aq5Nf8GIKRMjmN+yAJ29W/tHijxVNFSSQfkWPq/5kHYVoXYbXxQXqpK+Rm0My86sSaO4ohwo0XU8D8JDttsCOZY5w1AU2k7ZeeM0FEp+OW7dzPmY3qUekbFPaHlY26fVJBGsM+qqAx3Z3onAfajmUrYuHHJnO9XYyWQWHgLT8RwvQoQXB1hcIhVc84pSQETiwIMU/1MeoOFHQOwoABF+cQ479K+C3kA7989UlD/E104V6F9qmmSI8GZbrhn1bQLvZQ9duA0p/IFard9VSROzl8+kcIP+VvAeasTxyinglBA8/fdlgFNr822Tv3Znm1Qy4/fTabjJNgxT9dXuaKZKLS25lGgSDs5x7ThZrsu7LfuNEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/RM9hJQsXr+yLRe1Mp/qPqcIow3BpQ4rVNeMpejan7qlXh0hPLMc0hM7T/5e?=
 =?us-ascii?Q?VzxsmYI1uP/N0/K87j4pNmSrPkHOK4r/yUvDHuLzFr48nuGG7SaN22pmsTMW?=
 =?us-ascii?Q?eof3EB4N3lKobVBTkuf0TD/Q5Nk9JbORIlICoPzneQpWcVcvPTFflfW+ChBr?=
 =?us-ascii?Q?sBfhlO1wrdipCzt2RJZFc6QE15bfgIRouIg2yKI2MtuIEbChno4FfKLJrkTp?=
 =?us-ascii?Q?X2eAOHW4hluqChCLkQP91nMd9qns2dhZo3YFuSHeRrzeT4s/y3f8L9qRgFTo?=
 =?us-ascii?Q?NFEIrdWu7A2RVaj5BARi2LU5dw17xWXGi2TMal2Ikw7a1/54HP3gjQhnDpUB?=
 =?us-ascii?Q?sxelhs4julWdQhpMJsC3Os0ANrZkG7gExakvPVoEFSI5+suuD343yIxKKePr?=
 =?us-ascii?Q?xzQbKxMy4Hf9m/7WXjqhpd3krSIASYsM9tI/0voo59Y2GVPRcxy4k5q/cQhA?=
 =?us-ascii?Q?JP9M7NdePey83SYXXsePdNHCvo9NFMvXFNkht+TjOnOJPz9BGwACNfmhRX9q?=
 =?us-ascii?Q?OjYBya6O281/jPV5a0S0XMJlGOeHZK5qSfjiVFFwfaYToTki2kaahzYbm/Da?=
 =?us-ascii?Q?8b3ODPudOAKCLWMaUZDvsU7LrNSY5rYyLXM7VFnvk4B4yV20AVOwIANqPyYy?=
 =?us-ascii?Q?f1WKb7n3lw9clo9lMYf6XHNHaKByBpXnVZzF+iKkzgFQHGrR/1UVQCzREh9b?=
 =?us-ascii?Q?zceqMPzfLxsVB12mRTS5JV7/MrVmypHL6Q4OgygHxji/hk6jHuYS860XKXBD?=
 =?us-ascii?Q?AOeRLnHO29TojdUzWYkVwOr7r45MIoNqfeyV5w6NS2sqH/dTZw9gpyfEAHL2?=
 =?us-ascii?Q?kRGW3vTVEHULBDzjKK4OxaNkfcr1y5xNSfjHSh8B6mtJPV+hiUXtR5QQzCKL?=
 =?us-ascii?Q?uwC+cJLNMyl11oIj5OuKCgpQpNzab1sI1urnPqw77B2wQh6CWDTKWR0NWcMS?=
 =?us-ascii?Q?JT0/+pUsUfZFtplnuQRbe+OoeXo23ubphJ3DxmzgtEgtkKzpg6fJ6qStcHdF?=
 =?us-ascii?Q?QOZy0JVfWCVCh98+P0p4LfIvgHMWRGkguc9a9jYWKYiFItUvj3hrpAhIT8Aa?=
 =?us-ascii?Q?4mRqH5Q8lTZNRp/0EH5ZtArXqrrIB7QWsLPhNDFg3IDSlj2uBFEzadqN8Hwz?=
 =?us-ascii?Q?Um+SBVf5qvvF5s0t9L8XD7+0vioSizQvYAFyCDJau8a1ZvEauWPG4DAsgn7B?=
 =?us-ascii?Q?5XaKrptOxeUXSy2rEyBEPMEQoGBoIRLrrI0pu6j8fLNnInezVWD2WqBGEua2?=
 =?us-ascii?Q?CWO4qmf4HpdkybVL4fnVJVWihhwthqBxaEhjGYOcZO4cpdHPsUVrOOn6hfYR?=
 =?us-ascii?Q?eQxbxy6vxLFvvsL54saclFiM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e7e30e-316d-4bb0-426b-08d8ed22bcb1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:52.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIj4hc8Bxj6JhnOdb0QUf3c3sQ6XYiuKPKTTyMJipVPE5I97y0NSAnN9TB9ytTPqamLz8t3VgfUVUIVsQIPsGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows validation of child ranges, so the GPU page fault handler
can be more light-weight.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 40 +++++++++++++++++-------
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 4d79d69d8aac..cc8bf6438383 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -826,12 +826,18 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 	}
 
 	mutex_lock(&parent->migrate_mutex);
+	if (prange != parent)
+		mutex_lock_nested(&prange->migrate_mutex, 1);
 
 	if (!prange->actual_loc)
 		goto out_unlock_prange;
 
 	svm_range_lock(parent);
+	if (prange != parent)
+		mutex_lock_nested(&prange->lock, 1);
 	r = svm_range_split_by_granularity(p, mm, addr, parent, prange);
+	if (prange != parent)
+		mutex_unlock(&prange->lock);
 	svm_range_unlock(parent);
 	if (r) {
 		pr_debug("failed %d to split range by granularity\n", r);
@@ -852,6 +858,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 	schedule_deferred_list_work(&p->svms);
 
 out_unlock_prange:
+	if (prange != parent)
+		mutex_unlock(&prange->migrate_mutex);
 	mutex_unlock(&parent->migrate_mutex);
 out:
 	mutex_unlock(&p->svms.lock);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 0a6e28f0dcaf..bc1a9e9ba722 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1281,10 +1281,6 @@ void svm_range_unreserve_bos(struct svm_validate_context *ctx)
  * serialize concurrent migrations or validations of the same range, the
  * prange->migrate_mutex must be held.
  *
- * The range must be in the inverval tree and have an MMU notifier to catch
- * concurrent invalidations of the virtual address range. This means it cannot
- * be a child range.
- *
  * For VRAM ranges, the SVM BO must be allocated and valid (protected by its
  * eviction fence.
  *
@@ -1568,10 +1564,24 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
 		schedule_delayed_work(&svms->restore_work,
 			msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
 	} else {
+		struct svm_range *pchild;
+		unsigned long s, l;
+
 		pr_debug("invalidate unmap svms 0x%p [0x%lx 0x%lx] from GPUs\n",
 			 prange->svms, start, last);
 		svm_range_lock(prange);
-		svm_range_unmap_from_gpus(prange, start, last);
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
 		svm_range_unlock(prange);
 	}
 
@@ -1927,6 +1937,7 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	struct svm_range_list *svms;
 	struct svm_range *pchild;
 	struct kfd_process *p;
+	unsigned long s, l;
 	bool unmap_parent;
 
 	p = kfd_lookup_process_by_mm(mm);
@@ -1937,14 +1948,23 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n", svms,
 		 prange, prange->start, prange->last, start, last);
 
-	svm_range_unmap_from_gpus(prange, start, last);
-
 	svm_range_lock(prange);
 
 	unmap_parent = start <= prange->start && last >= prange->last;
 
-	list_for_each_entry(pchild, &prange->child_list, child_list)
+	list_for_each_entry(pchild, &prange->child_list, child_list) {
+		mutex_lock_nested(&pchild->lock, 1);
+		s = max(start, pchild->start);
+		l = min(last, pchild->last);
+		if (l >= s)
+			svm_range_unmap_from_gpus(pchild, s, l);
 		svm_range_unmap_split(mm, prange, pchild, start, last);
+		mutex_unlock(&pchild->lock);
+	}
+	s = max(start, prange->start);
+	l = min(last, prange->last);
+	if (l >= s)
+		svm_range_unmap_from_gpus(prange, s, l);
 	svm_range_unmap_split(mm, prange, prange, start, last);
 
 	svm_range_unlock(prange);
@@ -2142,12 +2162,10 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 		goto out;
 	}
 
-	svm_range_list_lock_and_flush_work(svms, mm);
+	mmap_read_lock(mm);
 	mutex_lock(&svms->lock);
 	prange = svm_range_from_addr(svms, addr, NULL);
 
-	mmap_write_downgrade(mm);
-
 	if (!prange) {
 		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
 			 svms, addr);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
