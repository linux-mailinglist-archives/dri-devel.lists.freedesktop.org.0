Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF982EC88F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7896E418;
	Thu,  7 Jan 2021 03:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533F36E3FE;
 Thu,  7 Jan 2021 03:02:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvYYCzgfOCfvtYIDPF+8idR93DXLHfoTyriVSEuauEOsjFEmSVJTB7vFEpDfqjeSPdl0TkLlopP9OFUvWX3LB9IrJNQEM31+TS/zswFgSVN2Dt7mYCjn3GJ5jjI/Y6e/q/goGYJa/tL5Ry/zOWLXjUYUhQtkh1C6wG6IG0FqQmSVTcZ6NVx/mK90getp9QNI+M+VlJTFOHl62A0wIoqCqSD3L9xxkHWXaWBNOjnQF8qYx5limZ1Fdu0l0YK6aUbuMF2nTvnJchXpLQ5KtwXg6PfdSIyKhy3Tl9pxCYgchDPHdyrn+hbPjKbCv5JwDXyPmhUiZ59X4xVkQ8ESvWRVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTiJbcNog86xtj5aadqY9JXCKcLd9hOWmovJ4oqdkgc=;
 b=M7UL8299yxcw36M7kIgyhJi1C/Yen3s2K5FD+QnXadEwlAcxoxD9G8PGQ5Mghy27LuL2MDHnclY8slrqBc9RE/OQSs1YSXmhVpq5jLkQWELqTf+7nkjkstlHQmmukGu5wSE3E9nwEKlud3Xv/LAWUanGumMXXFg8pLGUPdqSmZn1Q2R7Fglf3B2x6sX4w8/2eUitN/KbDrBk70+p3g5w31ByPThuSuAKqgJQZ+rO9vv39cIf7PJ63dc/0WIRm/VHbsfcUnIWgyZx/hbqazHapvG8L2SgHG+/uEPYQFnsuxxe5JxbKElfjpS+nMHem4QK6/SBjyDyo8MSfog75JEYuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTiJbcNog86xtj5aadqY9JXCKcLd9hOWmovJ4oqdkgc=;
 b=X4Xy1SkfrUcvo740nUVn6e0KzA+DZ+JIWiQS0zEtQ07UDwmq99l3Jm1oI8xmfkDim7/K61b2nXEQrDgDax0gXg7+c1Vs2Dz/prTHFVt5b3beSYhr1UXHFll3WqJkqvEH+sCP/MgNsbrjhJjlhEF6za1kNew1dV79qMfRsuOvxzA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/35] drm/amdkfd: validate svm range system memory
Date: Wed,  6 Jan 2021 22:01:01 -0500
Message-Id: <20210107030127.20393-10-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0af88813-1070-43de-82ea-08d8b2b8b924
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39991FF201730F084732D84792AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JZvPpClc3qBXgfkgzmnq8or4K9YPOriKS0+EUZel9N56ARaRI914FEHNnTZd1prGl3F/tLSpWKk5XFJvFndvCQqQ8GO5qfKKroWO2RiuCJ3FBzMSku+N5in56DXC9qT/gUyLIMkthi9icd+rPx5IDzHHNSyARi0nP1zXnw4SWp7GS4ph/vaAE6GY+QKOHTmqw8tVfe3SbMnR6VOR14yXX3YEpGMhSD8m/1cVh7lk9Rv0XFaTx4PGF60Zef8MS0A95OwfCvEVwq4m9wlWPhchOX0MqQiktRviFCO6ZL4yl58fy8HpUSI1mwFA7xkoaGlxT5yXRee+J6KO5EdSFCPvU55xuFZYzUB0gCO7o8FrzeZyxXQDRKoXLTJJeCskKTTYQN2r/nU7koi1gW7W9mdIUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008)(15650500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xgydw7lzPnxa7Sh22jsl9OhPxEOUB7RCP6v6SGwPjlAvqjzrTeuNApy6eRNf?=
 =?us-ascii?Q?txnJJddh0TqYxY8cRz0KwgjCtu0dflaO768Fy1Zr2xX87CUFrwJDJJyQqniY?=
 =?us-ascii?Q?HjGWLgk2gosCdbNImFDnn19ML7ZuRuIxlaPfvcQEagpTrqz+qUx3rbMBMZpF?=
 =?us-ascii?Q?nuI4Fs6cFbpIkiv9k0Pxf1lLM6S50ztNXeoHwcLK4LM6SZ0VM0EfAOsfCIeN?=
 =?us-ascii?Q?9ES3Uw9IOLZpRNXZxEIJtR6YcLr2PbabpCwJSSN3/3OQDq0gaxZFs0t3Evcm?=
 =?us-ascii?Q?TT3L2vP6F5/OOGTJTZah31aanA/c2P5DJW5VqEzDBfs2eahmbDc2nBFIrNl7?=
 =?us-ascii?Q?Z5SXRjCITcU1CRgSIXnaTU9+MB+DK3we4YMTnNUmAuCo4l1dZFRxhqwe3Mkz?=
 =?us-ascii?Q?pmlEh2MPoC9MjYyBFlryp98x+1uh5nYr1SqQi5ExQQhPsYyixrxtV/I7sHkm?=
 =?us-ascii?Q?W+kQMbDDvJ0HKF9vyo8WCuWitUdW10LnpOJKvInobWVqzSJjf11f4GXIg3XG?=
 =?us-ascii?Q?h4poeIW4AeZYImiePno+SNix6psQwJsRlmtBiRU0Kj7L9Kij//bYCqvA8Zst?=
 =?us-ascii?Q?Ku6hkuNxEmxAGuXs8eQUutk/M4l8KV1NHAFgoCk4lqIPcvOSVxs2b7u8kdA0?=
 =?us-ascii?Q?FOvTLQUfGdS6Wqz8T0oKXvALnwVgOVWUnt9Q20CxM7sxxI5qzDK1Y+KDunCK?=
 =?us-ascii?Q?CsgQWnyvjxvK/9X6WYmjAm8jmBs/DC6Wq1kWkeKFpXknhkCm57xRbq8Ojp7K?=
 =?us-ascii?Q?qc4yxmKXBmYSpNgZ23WkSt09nspbfk/Lj0ElzHV8WZA6NRVgvSLTrj7ls7vm?=
 =?us-ascii?Q?h5f4IKwhm7dnSaFgCpmi7YrDJ48594d/3dwIUWXXDYOnW0xkPLwMj/6E0+Nk?=
 =?us-ascii?Q?TNaQeNWR4u2PV4UgGWC0nynnV6Rp/YW6J1UVvIt+iP8TPyr5srup+295sXdX?=
 =?us-ascii?Q?KdIvGU6PrbfkzYdE0GtE4YhJNFoMW7LcuvjXN/cGQBtvqi6VohXVlLmo4Ra6?=
 =?us-ascii?Q?/A1L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:51.9334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af88813-1070-43de-82ea-08d8b2b8b924
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVjVZRDnR5RI1LAp3nRPN8qxJKYcZRntpcXz5j6GBsuf6M6KpUMtXJIqRSMqA3yxlEomP/cnKY537xCbyJo5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Use HMM to get system memory pages address, which will be used to
map to GPUs or migrate to vram.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c  | 88 +++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h  |  2 +
 3 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index cbb2bae1982d..97cf267b6f51 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -735,6 +735,7 @@ struct svm_range_list {
 	struct work_struct		srcu_free_work;
 	struct list_head		free_list;
 	struct mutex			free_list_lock;
+	struct mmu_interval_notifier	notifier;
 };
 
 /* Process data */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 017e77e9ae1e..02918faa70d5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -135,6 +135,65 @@ svm_get_supported_dev_by_id(struct kfd_process *p, uint32_t gpu_id,
 	return dev;
 }
 
+/**
+ * svm_range_validate_ram - get system memory pages of svm range
+ *
+ * @mm: the mm_struct of process
+ * @prange: the range struct
+ *
+ * After mapping system memory to GPU, system memory maybe invalidated anytime
+ * during application running, we use HMM callback to sync GPU with CPU page
+ * table update, so we don't need use lock to prevent CPU invalidation and check
+ * hmm_range_get_pages_done return value.
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
+{
+	uint64_t i;
+	int r;
+
+	if (!prange->pages_addr) {
+		prange->pages_addr = kvmalloc_array(prange->npages,
+						sizeof(*prange->pages_addr),
+						GFP_KERNEL | __GFP_ZERO);
+		if (!prange->pages_addr)
+			return -ENOMEM;
+	}
+
+	r = amdgpu_hmm_range_get_pages(&prange->svms->notifier, mm, NULL,
+				       prange->it_node.start << PAGE_SHIFT,
+				       prange->npages, &prange->hmm_range,
+				       false, true);
+	if (r) {
+		pr_debug("failed %d to get svm range pages\n", r);
+		return r;
+	}
+
+	for (i = 0; i < prange->npages; i++)
+		prange->pages_addr[i] =
+			PFN_PHYS(prange->hmm_range->hmm_pfns[i]);
+
+	amdgpu_hmm_range_get_pages_done(prange->hmm_range);
+	prange->hmm_range = NULL;
+
+	return 0;
+}
+
+static int
+svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
+{
+	int r = 0;
+
+	pr_debug("actual loc 0x%x\n", prange->actual_loc);
+
+	r = svm_range_validate_ram(mm, prange);
+
+	return r;
+}
+
 static int
 svm_range_apply_attrs(struct kfd_process *p, struct svm_range *prange,
 		      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
@@ -349,10 +408,28 @@ static void svm_range_srcu_free_work(struct work_struct *work_struct)
 	mutex_unlock(&svms->free_list_lock);
 }
 
+/**
+ * svm_range_cpu_invalidate_pagetables - interval notifier callback
+ *
+ */
+static bool
+svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
+				    const struct mmu_notifier_range *range,
+				    unsigned long cur_seq)
+{
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
+	.invalidate = svm_range_cpu_invalidate_pagetables,
+};
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
 
+	mmu_interval_notifier_remove(&p->svms.notifier);
+
 	/* Ensure srcu free work is finished before process is destroyed */
 	flush_work(&p->svms.srcu_free_work);
 	cleanup_srcu_struct(&p->svms.srcu);
@@ -375,6 +452,8 @@ int svm_range_list_init(struct kfd_process *p)
 	INIT_WORK(&svms->srcu_free_work, svm_range_srcu_free_work);
 	INIT_LIST_HEAD(&svms->free_list);
 	mutex_init(&svms->free_list_lock);
+	mmu_interval_notifier_insert(&svms->notifier, current->mm, 0, ~1ULL,
+				     &svm_range_mn_ops);
 
 	return 0;
 }
@@ -531,6 +610,15 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		r = svm_range_apply_attrs(p, prange, nattr, attrs);
 		if (r) {
 			pr_debug("failed %d to apply attrs\n", r);
+			goto out_unlock;
+		}
+
+		r = svm_range_validate(mm, prange);
+		if (r)
+			pr_debug("failed %d to validate svm range\n", r);
+
+out_unlock:
+		if (r) {
 			mmap_read_unlock(mm);
 			srcu_read_unlock(&prange->svms->srcu, srcu_idx);
 			goto out_remove;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c7c54fb73dfb..4d394f72eefc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -41,6 +41,7 @@
  * @list:       link list node, used to scan all ranges of svms
  * @update_list:link list node used to add to update_list
  * @remove_list:link list node used to add to remove list
+ * @hmm_range:  hmm range structure used by hmm_range_fault to get system pages
  * @npages:     number of pages
  * @pages_addr: list of system memory physical page address
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
@@ -61,6 +62,7 @@ struct svm_range {
 	struct list_head		list;
 	struct list_head		update_list;
 	struct list_head		remove_list;
+	struct hmm_range		*hmm_range;
 	uint64_t			npages;
 	dma_addr_t			*pages_addr;
 	uint32_t			flags;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
