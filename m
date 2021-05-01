Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E03704CE
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264906F631;
	Sat,  1 May 2021 01:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA3B6F62F;
 Sat,  1 May 2021 01:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxDP3grehusa/NIft52dHEb6RRs0hNtnzAYJEzuli2MENZm4n8ZSJQIGqMxMVFA6D13VuuFcF39gCXqjBvo4t3ufJTT+vN664VtoljnXai3SGCA2B65kSmWKp6mMuUW1m5ByeOdUR0aJmd1Ea4M0tCtz4GzQlITWxbbR/EITx2lToD0supG1q96xRDCbwC+FRrbflXqaEbhJzgB6gISuiuTqGxw89K1JsZJMr5p1Ku4O1kNqsprzDzddJhji/upSW5Y/JvuydxF838WtHOkyEqzuctChIXBDneJbSOo7NVBOdczhzV83iJkws2T0CNaXQVEuKYFOzfn7GH5wrV7Qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BApRosyC1mUCRR3JLigEFegra94STXK/i+Cr8fuWv+o=;
 b=aSS2bRdDCu3KAvjOg46WvhtQayzoUzIs+q8qWBGJaYFph33QfDawvybQMa2xmcDlRBaswddN933ikum0vQrRsxfDKvO+P+U0m6miQqxpND6WQZYKcwaQ4Cz1R9qmJhj//k+sBHl0sGvxhwGGmJOTPY2HWBTP4lGZ2+vY11xWxvyzTEL0U8dNXedXpyXLz2MY1pEaBOGrd5k2vniu6vMbEjYs+5HoSXxpYbGNYG87P33z/oQAWPMXYr9h2Ix74UWEsjl4LIzBs+1p5xUlPViojpvsvzq3CbPMtwTtnLK71bsTL5JZ/2umuSMlWmUe9iKSf7u4h17x+QvPIX2E7afdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BApRosyC1mUCRR3JLigEFegra94STXK/i+Cr8fuWv+o=;
 b=QAVx5v06FUwR+KjQY9QhTF6khZVLkYxdDIsZDSua4SKBeFAqGmYKoI6chTNzlo9ZtIit39dR46yNsdjfB/h8kLwa1+0xb7TjonQV0cDzh1C4yTSMvSG8OwR+mQ9TMkt6/6CBUjRLgOUIek3+oNwe9kecw1MJzuyZ2OyGNmW2fdY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:24 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:24 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 07/17] drm/amdkfd: CRIU Implement KFD resume ioctl
Date: Fri, 30 Apr 2021 21:57:42 -0400
Message-Id: <20210501015752.888-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b4b91b-176a-4358-25ad-08d90c449ac1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142C4F069E5A9E8B399D326925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CArZK4gdF4KZ7bibLn4Bpx+NU+LkBNiGg898Qei28O+MxB7pXvYA1GLVBnbLO1A4FkyrNg4q0cCkGdoWAzk0ifkupDsA/U+HtyrKnb0PY1MuGpud7AGioCVz4662e6CORIfh3qElAdnIDBncfZbLgC8hDZsvbDgbccTTivFZoWKAEmNTido/VCxmLqpv7nFn3uHArqzj/2pHaqF509WuwBkc2FI++Mp7syrt2PLFz5Sr1u+3LUtW0BpuA7c0YaNf48+z83FoSfV1Duj7QBIlUxXzzXODFzmnCL1/BfSSeX6AEuEe+NhV6hTp0rPwsCLNvsMzww/1pwC7o7sbWyVMPWcaLXuVac0zHwS2eanaAYwEuBkDJteAZ9R4amUtIHQMP1zrVlF5YMGeLpI591J7byD67uDaMn/RVqGC16XXvsQ4LPAv8uDQyIjewuakYU+fuisud/kP/LuA5rON+R1MnQWf0FIYFJZ6FzVO+0LgZz4gUCV/gE1bJOXnWuRREUcMDVHOdSr5MEyMxE3jKuGlVyY0M6/rQQZUae/Rxy4Gf0DpdhBeUR9Q3b4IaXFkxTShFY2T6ty1CzQLqiMEKQQXLqhMe9O5DPSQq146XUYQ4U++K0Jt1+QtX0DPSPg9kmQwBY4PDzQtPgPoOH3eq+SOUxqBBB/O3e2RyaxMy97fx1LpXwrx7/I8Cg3L/aMd7DNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(54906003)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(30864003)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xGIidgwbudcDHXpbcQrZd1BFBhcmfgxFB3qGT5119ykROGMlCBL5bAldK1Lo?=
 =?us-ascii?Q?BFKhVhB+/ScxPlraCeRxuFD9OhoxgzebpvZINHUIaqN5Cdkq2wOudmb3Ln49?=
 =?us-ascii?Q?/UZUZJilqWzWiHtjfqfGBfCkcGdqY634qw3aXOhGnEmgy+Cmc7HY7l3mtJN1?=
 =?us-ascii?Q?Wpsxt8+EjKct5eFGuh7b0RyEyUOLeHvdaQsBpH75uBnH2U4kgFzFb1Ohzxvw?=
 =?us-ascii?Q?/b+10OthcwYMJyZTq+5bNxr4Ka8GLU3QXy4dMxxbDSI4Pgh5kj9HGTyh+8Ah?=
 =?us-ascii?Q?xoCU8uYtRhdJ9ILRYke/uP/WBvka8VXfNiZ+NhIOZzESVhUYI/TUogB60s0q?=
 =?us-ascii?Q?LZN90KX5pvNO9J7CFgBGVMPe9Z4B8glZAky3QMg/7mX15NKGXfiDZ/GcrUSW?=
 =?us-ascii?Q?tRFYsbMUZ7y+UC5472ie0FiH9Xbq0xiM1sQkCLUeQ/cn63BS8zXbTvQLIDwl?=
 =?us-ascii?Q?ctaVSAHJEeSUiZUXcxZIKK6AZDbdA5TxkztYS7ue4mjsFalaFw9tsfAUlFHN?=
 =?us-ascii?Q?ZYBFABj+nnMKu1paRZuSYpGUmBeaeVgtwXz50wuAGgQ01MrGmf8PvkNFvv+q?=
 =?us-ascii?Q?/79h0/bDKzDnC+t4ZAjSh20DfscEZqQ0Tt37HIylZ0c0mrbao1WMouLs9YKd?=
 =?us-ascii?Q?sd2+0jGJMpCM/KAczjEEZga30T22O7aw587dY0H+WHMLsg+5Qu8Zv8SiI97x?=
 =?us-ascii?Q?mJMAXAwdwIaUGjpAzkVmwlCNWHM0MIieKPF3GHQENoktlBfmG2GUwW4F7tPV?=
 =?us-ascii?Q?N71TQXWIrQKJbqX0dvvHBq583FwaLankyjMx52NDsV6axUdYL6vSb9wA5J48?=
 =?us-ascii?Q?p72N59yyqn4M2V6bLdBn07sO6OKuMeCScUAwgwIfN2MS/cjcWovgqx0g42Ds?=
 =?us-ascii?Q?CQxcuGNXznGQeiiLyCKwDXjepg+3pD0zDiPqDtJmSkxsXqzACe7JmdHDDDdM?=
 =?us-ascii?Q?38uIo8WUCOGm9gcNVmmf1k3jYHd5ujXjPsk/AidmRTrCZ0BMekHyA7cqiGuT?=
 =?us-ascii?Q?dIOrmO798ctJjzKSWoUT557UOEfrdih5rDnN3Sa2TkQ7Dqu96t4ngQMNbAiJ?=
 =?us-ascii?Q?RUkF5d9d8ZhzUrG4tAaR9jSP6Fyp03PV2HVA4MzkmoDoPVxexL7jQfya8osQ?=
 =?us-ascii?Q?zSlDdM7ARTIi24+thtmqAEJMuGFuJb3/fjs10plIf2/53SjN89r9ob/K4xEQ?=
 =?us-ascii?Q?Wu0YlZTGn99u3gEk5vFIzgWqUjsmSHbIiDMNa+9SX6Vgqn3FmLKstGykeaV1?=
 =?us-ascii?Q?udTAwcBhna8V4+SG4BXlYlROSeQWdxAKHyZWi9BUpAGUc2qlG4P/GkmzJhyp?=
 =?us-ascii?Q?EI1DjF9TJwiXn7Az43puE6/H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b4b91b-176a-4358-25ad-08d90c449ac1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:24.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWuieOZmgwr6DToopK6y50YK+ZP1sHdnOI5HqPW7EaBK6cDjgBlbSUcOOCWDAuJLETYLV19V6yr1wG5dDgjlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This adds support to create userptr BOs on restore and introduces a new
ioctl to restart memory notifiers for the restored userptr BOs.
When doing CRIU restore MMU notifications can happen anytime after we call
amdgpu_mn_register. Prevent MMU notifications until we reach stage-4 of the
restore process i.e. criu_resume ioctl is recieved, and the process is ready
to be resumed. This ioctl is different from other KFD CRIU ioctls since
its called by CRIU master restore process for all the target processes
being resumed by CRIU.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit 1f0300f5a4dc12b3c1140b0f0953300b4a6ac81f)
(cherry picked from commit 5c5ae6026ea795ae39acff06db862a7ef2fc6aa9)
Change-Id: I714bbd8bec35feb47e0a1af9c2ce63ea1098fa88
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 51 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 20 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 63 ++++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 36 +++++++++--
 7 files changed, 159 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 313ee49b9f17..158130a4f4cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -117,6 +117,7 @@ struct amdkfd_process_info {
 	atomic_t evicted_bos;
 	struct delayed_work restore_userptr_work;
 	struct pid *pid;
+	bool block_mmu_notifications;
 };
 
 int amdgpu_amdkfd_init(void);
@@ -249,7 +250,9 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
-		uint64_t *offset, uint32_t flags);
+		uint64_t *offset, uint32_t flags, bool criu_resume);
+void amdgpu_amdkfd_block_mmu_notifications(void *p);
+int amdgpu_amdkfd_criu_resume(void *p);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv,
 		uint64_t *size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index dfa025d694f8..ad8818844526 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -597,7 +597,8 @@ static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
  *
  * Returns 0 for success, negative errno for errors.
  */
-static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
+static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
+			   bool criu_resume)
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	struct amdgpu_bo *bo = mem->bo;
@@ -619,6 +620,17 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 		goto out;
 	}
 
+	if (criu_resume) {
+		/*
+		 * During a CRIU restore operation, the userptr buffer objects
+		 * will be validated in the restore_userptr_work worker at a
+		 * later stage when it is scheduled by another ioctl called by
+		 * CRIU master process for the target pid for restore.
+		 */
+		atomic_inc(&mem->invalid);
+		mutex_unlock(&process_info->lock);
+		return 0;
+	}
 	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
 	if (ret) {
 		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
@@ -982,6 +994,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		INIT_DELAYED_WORK(&info->restore_userptr_work,
 				  amdgpu_amdkfd_restore_userptr_worker);
 
+		info->block_mmu_notifications = false;
 		*process_info = info;
 		*ef = dma_fence_get(&info->eviction_fence->base);
 	}
@@ -1139,10 +1152,37 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 	return avm->pd_phys_addr;
 }
 
+void amdgpu_amdkfd_block_mmu_notifications(void *p)
+{
+	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
+
+	pinfo->block_mmu_notifications = true;
+}
+
+int amdgpu_amdkfd_criu_resume(void *p)
+{
+	int ret = 0;
+	struct amdkfd_process_info *pinfo = (struct amdkfd_process_info *)p;
+
+	mutex_lock(&pinfo->lock);
+	pr_debug("scheduling work\n");
+	atomic_inc(&pinfo->evicted_bos);
+	if (!pinfo->block_mmu_notifications) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	pinfo->block_mmu_notifications = false;
+	schedule_delayed_work(&pinfo->restore_userptr_work, 0);
+
+out_unlock:
+	mutex_unlock(&pinfo->lock);
+	return ret;
+}
+
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
 		void *drm_priv, struct kgd_mem **mem,
-		uint64_t *offset, uint32_t flags)
+		uint64_t *offset, uint32_t flags, bool criu_resume)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
@@ -1247,7 +1287,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	add_kgd_mem_to_kfd_bo_list(*mem, avm->process_info, user_addr);
 
 	if (user_addr) {
-		ret = init_user_pages(*mem, user_addr);
+		pr_debug("creating userptr BO for user_addr = %llu\n", user_addr);
+		ret = init_user_pages(*mem, user_addr, criu_resume);
 		if (ret)
 			goto allocate_init_user_pages_failed;
 	}
@@ -1742,6 +1783,10 @@ int amdgpu_amdkfd_evict_userptr(struct kgd_mem *mem,
 	int evicted_bos;
 	int r = 0;
 
+	/* Do not process MMU notifications until stage-4 IOCTL is received */
+	if (process_info->block_mmu_notifications)
+		return 0;
+
 	atomic_inc(&mem->invalid);
 	evicted_bos = atomic_inc_return(&process_info->evicted_bos);
 	if (evicted_bos == 1) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7e7d8330d64b..99ea29fd12bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1181,6 +1181,26 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
 }
 
+/**
+ * amdgpu_ttm_tt_get_userptr - Return the userptr GTT ttm_tt for the current
+ * task
+ *
+ * @tbo: The ttm_buffer_object that contains the userptr
+ * @user_addr:  The returned value
+ */
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr)
+{
+	struct amdgpu_ttm_tt *gtt;
+
+	if (!tbo->ttm)
+		return -EINVAL;
+
+	gtt = (void *)tbo->ttm;
+	*user_addr = gtt->userptr;
+	return 0;
+}
+
 /**
  * amdgpu_ttm_tt_set_userptr - Initialize userptr GTT ttm_tt for the current
  * task
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 9e38475e0f8d..dddd76f7a92e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -168,6 +168,8 @@ static inline bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 #endif
 
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages);
+int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
+			      uint64_t *user_addr);
 int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
 			      uint64_t addr, uint32_t flags);
 bool amdgpu_ttm_tt_has_userptr(struct ttm_tt *ttm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 95d81d00daa9..788baee2a025 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1301,7 +1301,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		dev->kgd, args->va_addr, args->size,
 		pdd->drm_priv, (struct kgd_mem **) &mem, &offset,
-		flags);
+		flags, false);
 
 	if (err)
 		goto err_unlock;
@@ -1959,6 +1959,14 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 				bo_bucket[i].gpu_id = pdd->dev->id;
 				bo_bucket[i].bo_alloc_flags = (uint32_t)kgd_mem->alloc_flags;
 				bo_bucket[i].idr_handle = id;
+				if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+					ret = amdgpu_ttm_tt_get_userptr(&dumper_bo->tbo,
+									&bo_bucket[i].user_addr);
+					if (ret) {
+						pr_err("Failed to obtain user address for user-pointer bo\n");
+						goto err_unlock;
+					}
+				}
 
 				if (bo_bucket[i].bo_alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
 					bo_bucket[i].bo_offset = KFD_MMAP_TYPE_DOORBELL |
@@ -2004,6 +2012,7 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 	struct kfd_criu_devinfo_bucket *devinfos = NULL;
 	uint64_t *restored_bo_offsets_arr = NULL;
 	struct kfd_criu_bo_buckets *bo_bucket = NULL;
+	const bool criu_resume = true;
 	long err = 0;
 	int ret, i, j = 0;
 
@@ -2052,6 +2061,9 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 		goto err_unlock;
 	}
 
+	/* Prevent MMU notifications until stage-4 IOCTL is received */
+	amdgpu_amdkfd_block_mmu_notifications(p->kgd_process_info);
+
 	/* Create and map new BOs */
 	for (i = 0; i < args->num_of_bos; i++) {
 		struct kfd_dev *dev;
@@ -2108,8 +2120,12 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 				err = -ENOMEM;
 				goto err_unlock;
 			}
+		} else if (bo_bucket[i].bo_alloc_flags &
+			   KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
+			offset = bo_bucket[i].user_addr;
 		}
 
+
 		/* Create the BO */
 		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->kgd,
 						bo_bucket[i].bo_addr,
@@ -2117,7 +2133,8 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 						pdd->drm_priv,
 						(struct kgd_mem **) &mem,
 						&offset,
-						bo_bucket[i].bo_alloc_flags);
+						bo_bucket[i].bo_alloc_flags,
+						criu_resume);
 		if (ret) {
 			pr_err("Could not create the BO\n");
 			err = -ENOMEM;
@@ -2230,6 +2247,40 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 	return err;
 }
 
+static int kfd_ioctl_criu_resume(struct file *filep,
+				struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_criu_resume_args *args = data;
+	struct kfd_process *target = NULL;
+	struct pid *pid = NULL;
+	int ret = 0;
+
+	pr_debug("Inside %s, target pid for criu restore: %d\n", __func__,
+		 args->pid);
+
+	pid = find_get_pid(args->pid);
+	if (!pid) {
+		pr_err("Cannot find pid info for %i\n", args->pid);
+		return -ESRCH;
+	}
+
+	pr_debug("calling kfd_lookup_process_by_pid\n");
+	target = kfd_lookup_process_by_pid(pid);
+	if (!target) {
+		pr_debug("Cannot find process info for %i\n", args->pid);
+		put_pid(pid);
+		return -ESRCH;
+	}
+
+	mutex_lock(&target->mutex);
+	ret =  amdgpu_amdkfd_criu_resume(target->kgd_process_info);
+	mutex_unlock(&target->mutex);
+
+	put_pid(pid);
+	kfd_unref_process(target);
+	return ret;
+}
+
 static int kfd_ioctl_criu_helper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
@@ -2276,14 +2327,6 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 	return ret;
 }
 
-static int kfd_ioctl_criu_resume(struct file *filep,
-				struct kfd_process *p, void *data)
-{
-	pr_info("Inside %s\n",__func__);
-
-	return 0;
-}
-
 #define AMDKFD_IOCTL_DEF(ioctl, _func, _flags) \
 	[_IOC_NR(ioctl)] = {.cmd = ioctl, .func = _func, .flags = _flags, \
 			    .cmd_drv = 0, .name = #ioctl}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9c675755369a..8278c43f4e50 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -937,6 +937,7 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 					int handle);
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
+struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid);
 
 bool kfd_has_process_device_data(struct kfd_process *p);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index bc133c3789d8..bbf21395fb06 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -65,7 +65,8 @@ static struct workqueue_struct *kfd_process_wq;
  */
 static struct workqueue_struct *kfd_restore_wq;
 
-static struct kfd_process *find_process(const struct task_struct *thread);
+static struct kfd_process *find_process(const struct task_struct *thread,
+					bool ref);
 static void kfd_process_ref_release(struct kref *ref);
 static struct kfd_process *create_process(const struct task_struct *thread);
 static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep);
@@ -670,7 +671,8 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->kgd, gpu_va, size,
-						 pdd->drm_priv, &mem, NULL, flags);
+						 pdd->drm_priv, &mem, NULL, flags,
+						 false);
 	if (err)
 		goto err_alloc_mem;
 
@@ -773,7 +775,7 @@ struct kfd_process *kfd_create_process(struct file *filep)
 	mutex_lock(&kfd_processes_mutex);
 
 	/* A prior open of /dev/kfd could have already created the process. */
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (process) {
 		pr_debug("Process already found\n");
 	} else {
@@ -852,7 +854,7 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
 	if (thread->group_leader->mm != thread->mm)
 		return ERR_PTR(-EINVAL);
 
-	process = find_process(thread);
+	process = find_process(thread, false);
 	if (!process)
 		return ERR_PTR(-EINVAL);
 
@@ -871,13 +873,16 @@ static struct kfd_process *find_process_by_mm(const struct mm_struct *mm)
 	return NULL;
 }
 
-static struct kfd_process *find_process(const struct task_struct *thread)
+static struct kfd_process *find_process(const struct task_struct *thread,
+					bool ref)
 {
 	struct kfd_process *p;
 	int idx;
 
 	idx = srcu_read_lock(&kfd_processes_srcu);
 	p = find_process_by_mm(thread->mm);
+	if (p && ref)
+		kref_get(&p->ref);
 	srcu_read_unlock(&kfd_processes_srcu, idx);
 
 	return p;
@@ -1578,6 +1583,27 @@ void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 		idr_remove(&pdd->alloc_idr, handle);
 }
 
+/* This increments the process->ref counter. */
+struct kfd_process *kfd_lookup_process_by_pid(struct pid *pid)
+{
+	struct task_struct *task = NULL;
+	struct kfd_process *p    = NULL;
+
+	if (!pid) {
+		task = current;
+		get_task_struct(task);
+	} else {
+		task = get_pid_task(pid, PIDTYPE_PID);
+	}
+
+	if (task) {
+		p = find_process(task, true);
+		put_task_struct(task);
+	}
+
+	return p;
+}
+
 /* This increments the process->ref counter. */
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid)
 {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
