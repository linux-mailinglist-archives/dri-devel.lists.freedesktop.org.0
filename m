Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2982EC8C0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E16E44B;
	Thu,  7 Jan 2021 03:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4F16E40C;
 Thu,  7 Jan 2021 03:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayyEVX/tUOuPIUNdUBq+EKIEtwRg3s5k4JCL/CQItixjnD/7XIsqoFXNjoHv1utKtPxR2HgBijeRSWZAinrOL5r+h3ra/Cd/wjyimG/GRhiEl8V5VsUkYr6RLtzBe2FKvgGAashIXxXKMYgFgfkmz1zFALg79YKjgAgL1BQJXewzJL5mc4sFQiVNnwNw4lh/tDdQMtyVdcC8QjEfYtiXEj3Jx4zhmI5GYJMLc1sGAKUkrK5nWOFIBYekN7xBk63emLhCdM/jQdfdJIP1wNFWM5z5ZLGton8FCAP0q31G9/JGKjPR9hZr2Dmhbnwyt5mlQ9EezH0yphfEmqJGPgIKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8Igbk/+k4mYYYdYkyHsUfG2ZKNxQPGqaws4ouJSqDY=;
 b=SrcJIQKAVq43xXST2hp7T/wf/9HXDHQMHqVfpWQJQQ1yde/ssLDdX7Vgb8utshlZ59TdV/k30b+3Sbhp5/3at0h1hRJdmBbtTFb1A7+wLsDijupA9OQgqAS/mK4hc2rNvEtNSKuCMn4xg31xTL0k2eGNMJQyUbet5jqtLrex9zNjARR1YV5cdG16pf2HP1dCUV8khiLvge1+1B6B6hb/KhbBwSoXaFzgHxTCi0AmIOwvOTXdSfRVzPKl4ZhAsRmFVAmYvjnDRTdRh3s3vJDFgpmLhu2BUHEPMkb+VEcwUKEZwvmVbhBCbgf7Dhu0u8i738le1VJCA3CswQFYIZEtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8Igbk/+k4mYYYdYkyHsUfG2ZKNxQPGqaws4ouJSqDY=;
 b=3vzkx8Pz6T9oflJZfnCC1V5xoYzzwfzPn739whr9m3k8yT5Upb48fK3pJhuy3QUiIEoOYMgpb+SslOJG3jedOdnZuRfF8nXFkDeNYFcj463LAa4g5Nx9mPILcAgAnLsBD6JIae8M50K3/P7Zy1RI+szd6xvUBYbJ1rasoyjrP0A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/35] drm/amdkfd: page table restore through svm API
Date: Wed,  6 Jan 2021 22:01:16 -0500
Message-Id: <20210107030127.20393-25-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c96f561e-3c8f-457e-a180-08d8b2b8bf2c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB440821BCBE8D16062641728A92AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lQnGo1cq3rhsMgkRtr1YPyMNoohWNEjpL+KihwLZ8tcQKL6Nkv6DQ5ii3uLp3mt7cPbEdt2iMx6nAe5OjbsmSvPbZt5ycUWvy/qjoDclY4P5DKJraIyqNr5T3IqDDh2frlIQZZq3G0YvUJo7z7LmBd0G5jKCsVhj8pBULwd5PdO+ZZ19hf1aw4NM/bwscfQzWeZRMPhAY5D7RIZ24l8VFvJQJcF6SmsZTSYqYRwlIdCO88xIhcaytAx0xaTy1OW1m5hYmz5pR119O3Ed7EtQYEbHacUMKwWh7mYlKr+7G6EXq1G9QZCCY3l2lGR13V/AvmK0jVle1r2hZpGFVou3YfOumGCPAArCgAdp4KSxrEKtU6fs9wXuTKjEz/DwkOFFTYrxltaA9Lp1Jk20iI7Wbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l/KHTn9tto9qBklKUpupLeFI4XG59KoMskH1r9gn2DTkybjXP/HCqxwKNlkY?=
 =?us-ascii?Q?4Kd5iSUKF339a+gwZV58pv8UL2Y4V2dyP41/22OjNoJnD0oM9ZJliRg7MRCi?=
 =?us-ascii?Q?rz8CtAXk2CqZnzg+Gy6/YsDC+Z4i/nMMQtF4q+U/niBOmotomRDRdNMAIU/p?=
 =?us-ascii?Q?DrbhKLfNtWeTUiRemidcbEf+Oh9MMs7UEezocp9iM+iwbPOuuHQkiaAWCRVB?=
 =?us-ascii?Q?+FuZ7NcFlAhM34WLnncD98Ciheo43x1Jscafp1yiWvvwO1RFsJ/C782ENA3k?=
 =?us-ascii?Q?EU17w1zZvYWS9B0vSiw1niXWp2LKGCbycSQ1FKY1vAGvp0lPdC0v6xx722jv?=
 =?us-ascii?Q?SY6Gy3WVwsQ/McFuWpaJFOT7sTgJHD26jr6OCFqhOSn8YV4A2qFDeFBb1ykD?=
 =?us-ascii?Q?2EmMFlmpGU5zkRV81lP9gbZ2q7tKLPMwd03Xq509DlowZvkizQfF8ppaf1c1?=
 =?us-ascii?Q?mjSAlxi43UxkFRoT0ZO7/OicRO0bx82dIjaPUogoq5yDURovepZ/PRFtVwt4?=
 =?us-ascii?Q?WheApqBXmqkrBvewv4QkU0Ui3WS0ABl6mjsxWB/kuO1OJtMJlgaP2O7s4Ar3?=
 =?us-ascii?Q?0pfhpYl2iAUs8HM5xPZZfUFZe59ekf3NQQSZGyGYe/NfqEts+PjQ4EHmxGve?=
 =?us-ascii?Q?1LrHHb9BjOVl6U2C/zn0PXL4ft5KJtLMddRjxeb6f8no9EDwOIJyH0O+OpeV?=
 =?us-ascii?Q?ojS1VAwJkFWCHsjbZfFX0/vlVOK0ytFr/3hRALB9HCAjBA+TvXv57kvm6ZX0?=
 =?us-ascii?Q?ft+wHrmKg9+RGPiYAfXrmcWUaABLSYl1C5/vXQKCuVh5xNwxPnSwv9LHMR4S?=
 =?us-ascii?Q?u6sVHCRZ0gNsfuxf4T/89/h2zV7hDQaRvUn4vm97oOIY9lTK3uTf4cLQSx+q?=
 =?us-ascii?Q?epG3r/caU4xeNT0BOPhTf+q50fSz8b/UxbAkoVXWnx/fef1EhkvjZqy6VxC7?=
 =?us-ascii?Q?o8A7jjW09qnbRZG9c57Lh/jmOnPKyd3PCje+4x9OukoYiZJuTSgzHcFLyEPB?=
 =?us-ascii?Q?EkZJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:02.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c96f561e-3c8f-457e-a180-08d8b2b8bf2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tiuLy6G7/U+QqRLpFcq5eXjLZ+f1Ux3G30Sxuak5uK0PQ4L6UG7bZPfpAPe3+bawoKDm3sg+QOVUiC2Jh2csQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

From: Alex Sierra <alex.sierra@amd.com>

Page table restore implementation in SVM API. This is called from
the fault handler at amdgpu_vm. To update page tables through
the page fault retry IH.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 78 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index ea27c5ed4ef3..7346255f7c27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1629,6 +1629,84 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr)
 	return container_of(node, struct svm_range, it_node);
 }
 
+int
+svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
+			uint64_t addr)
+{
+	int r = 0;
+	int srcu_idx;
+	struct mm_struct *mm = NULL;
+	struct svm_range *prange;
+	struct svm_range_list *svms;
+	struct kfd_process *p;
+
+	p = kfd_lookup_process_by_pasid(pasid);
+	if (!p) {
+		pr_debug("kfd process not founded pasid 0x%x\n", pasid);
+		return -ESRCH;
+	}
+	svms = &p->svms;
+	srcu_idx = srcu_read_lock(&svms->srcu);
+
+	pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms, addr);
+
+	svms_lock(svms);
+	prange = svm_range_from_addr(svms, addr);
+	svms_unlock(svms);
+	if (!prange) {
+		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
+			 svms, addr);
+		r = -EFAULT;
+		goto unlock_out;
+	}
+
+	if (!atomic_read(&prange->invalid)) {
+		pr_debug("svms 0x%p [0x%lx %lx] already restored\n",
+			 svms, prange->it_node.start, prange->it_node.last);
+		goto unlock_out;
+	}
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("svms 0x%p failed to get mm\n", svms);
+		r = -ESRCH;
+		goto unlock_out;
+	}
+
+	mmap_read_lock(mm);
+
+	/*
+	 * If range is migrating, wait for migration is done.
+	 */
+	mutex_lock(&prange->mutex);
+
+	r = svm_range_validate(mm, prange);
+	if (r) {
+		pr_debug("failed %d to validate svms 0x%p [0x%lx 0x%lx]\n", r,
+			 svms, prange->it_node.start, prange->it_node.last);
+
+		goto mmput_out;
+	}
+
+	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping\n",
+		 svms, prange->it_node.start, prange->it_node.last);
+
+	r = svm_range_map_to_gpus(prange, true);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+			 svms, prange->it_node.start, prange->it_node.last);
+
+mmput_out:
+	mutex_unlock(&prange->mutex);
+	mmap_read_unlock(mm);
+	mmput(mm);
+unlock_out:
+	srcu_read_unlock(&svms->srcu, srcu_idx);
+	kfd_unref_process(p);
+
+	return r;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index c67e96f764fe..e546f36ef709 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -121,5 +121,7 @@ int svm_range_vram_node_new(struct amdgpu_device *adev,
 void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, unsigned long addr,
 				   struct list_head *list);
+int svm_range_restore_pages(struct amdgpu_device *adev,
+			    unsigned int pasid, uint64_t addr);
 
 #endif /* KFD_SVM_H_ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
