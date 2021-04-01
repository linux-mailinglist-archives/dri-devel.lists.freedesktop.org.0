Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88E350DC7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D124F6EC49;
	Thu,  1 Apr 2021 04:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4266EC46;
 Thu,  1 Apr 2021 04:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHYDk5g+MxYa6dSVUcqTglKXrdzp2yXnS0tuyZ9PsapgMptViUdiOJ6Bjn8+cchgIFB7n1UVhK1HN6Q6cHJXIY6gxg+SfWcCAeeiH5Et50VE7hJPY6fP0QMW+zH3hM8hzUEnAXfzLO/57KDwRSIouMa8EFs0yxZFa/tJC1spPg99m5eCn5ZAeom29S9Xw70HAXQ3vGwegerQCrle2Ec33lnPxDLXifdidLMpTjK+x55m4obVX+/PArFs1ZiR02I+KUCYMAqTjjbzx5XhyvUTu9ZsOQeR1AeC4sXddTfPuA10wBn40Wh0NrFfoXzEnX+KTNMkCxiRP+GilxNqU68JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b2OrsNqrpfWnQ2TudMvzyN07e0bj3Qi1F+B7ugMPEw=;
 b=bs+nxJImdqmaIfe/5kyijUg9aFn2HkBwsEJ43PWd1HIQr1vGr/kra8WKwGD7XmYtg9OOYq4RMWYZ0g6afz3qDW99bEOWogJOc3V7JNTB4HJio8N7Wz+tIWtVImrEUVuLYM0J9AWONhGmVzcSeF4aWCQhkmUztIk9Zq6FsIV1l6qqwkcORbBYyKTQ9owfC2dUZlhoo3+H5CoCFe3i+kWS/BtQw4y04syFtxg9CJuh3/L4lwG2r9yzoXIcW8JT+d2YZ6FilMGA9SmCtSwHMhvRuCgKCCVBYjpgVfAwjuBKR+piaQgX/bEOuiprL4D9hyBvz5rNm4D9PlHfS4K49GdqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b2OrsNqrpfWnQ2TudMvzyN07e0bj3Qi1F+B7ugMPEw=;
 b=OhbVizMyULHb/Mnj7z4UKe76e4um9Dm5Bk3d4Cfk7GP3nrF4nxIMHNOr4dS+7g/oBO/QjjGamzy3zfPR+EAsE0zAZOgBUDe7gNJZGCkMdHFe37lLEupa/lK3SQr1btRVpietxRh9u73jcKMTiQ2/V2qzHR/nusfyYFnsg/aHvEU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/34] drm/amdkfd: page table restore through svm API
Date: Thu,  1 Apr 2021 00:22:16 -0400
Message-Id: <20210401042228.1423-23-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbefd4fe-684a-415d-96e3-08d8f4c5d7a1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222F10C27BB12B0F1D762EA927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iID634jnZ4uyHrHRXHzPbuJ61FvYkmqqCGfj4HpRE1F/qUCpGH1HKL3ZbvRVXBia8Vn3e5CSFD0UHmgsK8a1STmd3tWESxoQG17hmzrmLPqrBBXOrRiN6jiJIiBVUWaN9xsO05g9i5jg6LSHnLtCQCfmzmBGq208yqBocUs2DFgjuzI9hx6Xim0ouu0lH/KbRO+GBCNI4bU5xQT/ihKjac/3HMsAWepFU2Ab5no5fCBUwGsGaPUbJhfk0h8RlGCWCct7TscVvR0B01p88doEgFy6/2VLV0z4AYHl/zR6mROlL5XClHSKpq9Wl7wkOqJVuT9kiHxBkAyWAT4hXJiCirOUfYLOeDzpMpgu1GAKNKCoNbE+88UnxQwKtc5oP0AM2t8R5PEKN0PeaXYBwx665sC8JlYT3597vByEOyCt0n7MY5UARVP1ubMajpq8bKt1oqfe1ym7rG05UDzZnLUqS9j+TjGpFT3gqpp88tNGbCieyfekmrGnn4+QZNwYrocH3FGzfaexzpFNfJzTpicG3LumMR2tyWio+Pc+XQm5BgH2Jkamhp2uCNuQqVKJcG5u/6g82BX0D5H0IdfhYNUDVynig8Zv9MRzHutf3JANQ+w5tr/CZV5T+98QfuXLGLFcWXPkLdixXznVlYtuYyJ74Ly15Dk+icW0Cx9/zqJ5Sas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(54906003)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N/noncdk1XNtFdMFwco+2Frs6jEY1lVZGyWGwfTMVDfewCNQLnw6bPSSvzkM?=
 =?us-ascii?Q?Ic6GTfkYua2chWd13E6PDMPZPiNs3wvB4QnE9sAMddRQeoXeZxbmK5DLlb1G?=
 =?us-ascii?Q?WV7qI3RZ9fO16JwLneK6Ie12iEHqqddreUFoGC/VUffa31eYQxcYkYTvM2z2?=
 =?us-ascii?Q?n6GlfngY/H6vVK4yWkeC+C45vcWeuKAEIr+ANIKiAv6+gecpwMO+onRaXUMX?=
 =?us-ascii?Q?48UpkrMXjglEZgEurFfIdVGPXBqaMEgJqtASib5ZYUdEX090H/2KgjnYU2w8?=
 =?us-ascii?Q?85Ct2BEj3FWSd6rfyrkAE1WlcG5pM06nk3vrDelzbrcLtYevv733gelju55h?=
 =?us-ascii?Q?S6miR9yLJkzc010QKVFzsrAkt2aSQS9kG2OsGWjU1WvfmwuwK7fJoHqIi6eZ?=
 =?us-ascii?Q?5/fSXeoqI4Gwc9DGpgaunb8i1tG5bTflipw+xuTFPEvD3/b6bx8c6nSEe5fI?=
 =?us-ascii?Q?BAIc4p2GthKWZVnKFvCTn/RJ7wZoC1QKZUm6CwbrAhtboLHke2TU4cEVwvPv?=
 =?us-ascii?Q?ckRMTdsg98hRd4hqVeHm/qwLwVPSfhvEw1jdHaEIa58I1pWdwloqdzpejbh6?=
 =?us-ascii?Q?tzmFfF1WxHwkhdLO+o9J8rGoaEnvQyXGqPFZ+uyahDulAOf6ctrYq1rjWPL6?=
 =?us-ascii?Q?u+7pLA/yxQCiTZGb1om2tZH6QjPEGnEMZP4wEuIsu2t0ejznrrDda7iPAd/W?=
 =?us-ascii?Q?hgpaNsruvOckCsh5Cw+8RmF8q3nsCIzoSJUImD4k+cySWaPKWEfS99tEfbhJ?=
 =?us-ascii?Q?V7DIZNC1YgRsiB1z4ZrWkM9UCK8LEs/MnDfuxPmAjw3BzylExtm7QuzOH8Xk?=
 =?us-ascii?Q?wv0BAMyxbGTLPhuWK+ENmetV76rc54Pl2sSpEDm06K15i9sdyZk4Y+Zwrr9y?=
 =?us-ascii?Q?MVbVVvnO35yppfWCBLyUul79DPQGXnTv5aFwj3Ma8XvZ95078x2PFfcsJrzg?=
 =?us-ascii?Q?sbPJJ/st7unftxvGSHQJbyXR19EHwYob/RhF5E9WEHa+s+EgtwpbB7zL4sGp?=
 =?us-ascii?Q?mibp44AsDD7iW5EQCJk3FllhGUoq41DrzhFkePaC2cHQAkHeyBLojLhbxNY3?=
 =?us-ascii?Q?BznNnpvfdzJOn5tcrmgHE2jenWsiwOeMpfOLZPduFwRXupiPmNgF7EIl0W2s?=
 =?us-ascii?Q?HnZQZqlEMeH/4R4nlj+ggsYAeIBkkQZHTW+8CcMFmSH8gLzetO4jb+6mbv82?=
 =?us-ascii?Q?hfZDxP4zWAZY4qxZeJcXBDmgRxTZXPQZ6y3zEGpVeq9hb11PxXCSgZ7eojpf?=
 =?us-ascii?Q?87FRPipz5G80bDya3r9Iz2W1+XximcuhXU+pYq/VyY39HLYAFa+ur19SoxNC?=
 =?us-ascii?Q?EuGOJN2SRkOunv6V+5bqmFZK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbefd4fe-684a-415d-96e3-08d8f4c5d7a1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:04.1418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMKxRNdtJM+qz3SZ3yxI9ebOHJjMj0WzowvRD+phL+DLkn/IB2r/qjUW0qRksbSWPUlKM6XTdFibr8pN1VJDnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

Page table restore implementation in SVM API. This is called from
the fault handler at amdgpu_vm. To update page tables through
the page fault retry IH.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7da58a4214c0..7b2c97b7f48c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1964,6 +1964,65 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
 	return NULL;
 }
 
+int
+svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
+			uint64_t addr)
+{
+	int r = 0;
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
+	if (!p->xnack_enabled) {
+		pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
+		return -EFAULT;
+	}
+	svms = &p->svms;
+
+	pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms, addr);
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("svms 0x%p failed to get mm\n", svms);
+		r = -ESRCH;
+		goto out;
+	}
+
+	mmap_read_lock(mm);
+	mutex_lock(&svms->lock);
+	prange = svm_range_from_addr(svms, addr, NULL);
+
+	if (!prange) {
+		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
+			 svms, addr);
+		r = -EFAULT;
+		goto out_unlock_svms;
+	}
+
+	mutex_lock(&prange->migrate_mutex);
+
+	r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE, false, false);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+			 svms, prange->start, prange->last);
+
+	mutex_unlock(&prange->migrate_mutex);
+out_unlock_svms:
+	mutex_unlock(&svms->lock);
+	mmap_read_unlock(mm);
+	mmput(mm);
+out:
+	kfd_unref_process(p);
+
+	return r;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	struct svm_range *prange;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 6cc12de8d76a..168c623f4477 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -154,6 +154,8 @@ void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       unsigned long addr, struct svm_range *parent,
 			       struct svm_range *prange);
+int svm_range_restore_pages(struct amdgpu_device *adev,
+			    unsigned int pasid, uint64_t addr);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
