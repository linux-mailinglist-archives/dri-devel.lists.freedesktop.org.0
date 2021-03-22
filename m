Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A329343F29
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3216E42F;
	Mon, 22 Mar 2021 11:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8806E0E4;
 Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkCsW0AZEs36lS/7BiEGWEygPMZkxdUOcQ9xvsucB4utMxoV06pf4FenrRh1gy9H5xV61xVI5U8r4FEJNp3a0dpK8JUiRiZCwu14E7FkWwfYj9MrKtkR5UocqFkNn/bNdS/YYofSCcFG25Mk/ljC2ehh8RpqoF9gagS7P8i0qPGt+O30sppikgm9HAYopEoLUqYLnW5E1UGAraFOyDb/+yf2anDUKi0H8C8P6xc1ZMrYhLJ5LnFdyNKMStualmXZEOH+zfmk7U4pzVMJY8PmQb2Egrhym3w7kDtbuChvO+BMRPagEfLwaiIVpgeBUyqsYM0TBJcv5sh5IXU6Cqypvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTZX86J8KK+zx4nIO4Nya5+nWInbDDU47GWX04WnALY=;
 b=f9ahZC+5Msc84jzIKk3a1DAmS+xH1ZoVuOKbHvGkMYJ+mOXs4+T02HqpvvNPc9u+QiPxGpwPQ87V237cQYsLdv1crMCo80y2EAKFMjuCTSdi06/MsX9Qs24aWfWyZ7iCvgUZKw5himp8tB17AN8W98GBLvMQ0/2ERWTSHaUPKKbbdAExaLdjpioaK4T5VkNueTBuYm8HbCNwToK9xpi+bANId8sNiyi/iT1grcbtnQA8Ock4pvJf3LqifsVXn81s8xcQhu3RHtQIArNBLYQWIDD6iodqzMrWw4YckKwtx51MXzrZ3q+Jytst2VxwuPuYbKVMxutyCThNtD+ZFLv+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTZX86J8KK+zx4nIO4Nya5+nWInbDDU47GWX04WnALY=;
 b=j6QrQ6TXJyfg/rwUegJ0sp7W5tlupWVYQ7kunQzsvNoqijey0q/maLZF5b/3qVGyMuKuLkK0M3olmKEsxThJepHfFyGi263f9g06GKdGlE7pkZJcAUPYs4RASiXyUS1JHG4bffN4k84cMO7YksHAXdRv3FFzewkL3C7zCf86ir4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:42 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:42 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 22/44] drm/amdkfd: page table restore through svm API
Date: Mon, 22 Mar 2021 06:58:38 -0400
Message-Id: <20210322105900.14068-23-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d8c01f7-b266-4cd2-f22e-08d8ed22b64a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899BD5D0229A64B83E9CF9A92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoTcdT9LaDdlFX6JGLZVgeWfl7AAj0BrD/ZK0Li56glhne20L079eEiXhSCMdWmCUY6MGRRD9+NHMoUbFTJ2WHxH7aP9dkvlQ+9e7ESTVoLyy0SLGmTB/JAd5xQr5datydr5d+Dl4DuNuulhXQ9VNNxuhyRCcibdFy1mj/98ZaCrJrzDj5n6LVH6XLhaU1g5wbSajT0N5JvOHM5FAsFvb+/HIvZphXhQ1itD7/zwbaAKoh24QXg3Xs4/xpghhcAP2xPN9q2OT0d45z058mXUvyYREFmCDzXHZQm8MQxBju3C7cs6ET/LWK8/MiBOBgkcXaAMCg+pktmI25eVJJQ8eTTyeci4WeOsEq9qch6sqPaUxwPaOFKlr98awEBUOXqwi7ZhGTj+v7ipnhrOm64mk6Ay/PiWh1ixTrmBGWEHa3hQAJ1RgjFHkBsaQhuz5YGG7UtjC2Pr3BqnsuEl/Vc0UTQSEC4/MypKXqWjWmcDqrfzTYzomRQmoYmdtxnpDSivM2Tpc6pOzF48Ic12BkICQeMvBS3jCOYhfPEZ874Yrvnb3Ca7/TBzWrKPyD9WBWScK1/H+L4jnPTaV8nglKnzif/iUO0gRnlO89ZtZ2Ac4PD+3Pkzr2yvfzOuK/XXSHN6OGXtZaN3bNvEvBiP6qiPFsOnb+fA2eH4RRLuc2T724Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(54906003)(7696005)(1076003)(52116002)(38100700001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fClwDJLeFMK3afbtIN9+MnhQm9QBWu//osCHRYooaSlD9dUHRYT04UIS2GZA?=
 =?us-ascii?Q?W4jgnQ3w4nq1K9UYAz7zcoOTf3B1LcxoKDFoTTok3yGXk59IyEYMpAyx5tOR?=
 =?us-ascii?Q?KKbYwJOyf80+LRA8c8L8RTwE23z5Y6KUT/O4E5sZgBEr3DOjX1SMhDpL1Uom?=
 =?us-ascii?Q?/NSY1MppdCgwHojVN0px6/II4h3Ee5BIB4WgNihngig0a+NwobASVu1C125k?=
 =?us-ascii?Q?rraxBPLPjKL9FJl8VJx1fsnIFSHvTDLE2w49wARQTG2gkn8sHilG9Eih913L?=
 =?us-ascii?Q?36hHNDXbelQxRoSJt3N/IuYWgcKuxPYFiAM3TIZ5oDpLYcpUC8zN5rpcTmK8?=
 =?us-ascii?Q?QOusZvdhpg9uLtAGu/5LK20SsFNR3PIolnf+Nk5BQe9TgqapoLnegNSQU1fx?=
 =?us-ascii?Q?36MolQdUsYJ4u1romvm47nRN7sE63y+ubcVIe/1pTkFS3S9NVl5JijNDPAU+?=
 =?us-ascii?Q?fpmcoPEE3CuM0DhkmeL+zqTvw6LdUHN4u+Fj88GjPlv+PNI9n8PER+ZxLNp5?=
 =?us-ascii?Q?AOF11eUBuT8p4mNRp8ROnfh6Sr6/fj356lskvZmFc1MAE2auTyjSxeqdR1sK?=
 =?us-ascii?Q?XiFcmgLOGmZoVucWiHvj7LGiqb3TbgwxPSqKXvcFgu1V4G8pLHJ6KE/AvaTu?=
 =?us-ascii?Q?KPUgeGmtgC9s55lxV7tNGpgNVR5v4SsRJF5aVkLGoAvM+Tse7pwfZ1unZZ2c?=
 =?us-ascii?Q?dTkplAqQxI0weDHqZZ9Gwpr+wwbGDa/tG9pn2nWtJus0bRBhY/q6zh0hJPRs?=
 =?us-ascii?Q?dEIAKJV7jCrQ/BCuXrpeZw0PzIy7aVE1cK1HI5HJfHPzC/uMtmjWBCsmarqD?=
 =?us-ascii?Q?0HbDBAHJFPXHigPaIBdBu4wk1PxDXRr+4VaPnRdygMuaE/9ytisSCd2aZ+0G?=
 =?us-ascii?Q?mDybcnjEQtcfV/f5o1WC6MseGf6Lqrcz+Ssw8p0vURGCE9ivmn8x/3COhUBZ?=
 =?us-ascii?Q?v9KrialZFJ6dh6h3EGSpGOHjHn4PYIIZpbo50PSbXW+DKsanRmiidgRboI59?=
 =?us-ascii?Q?FcFlv8AD1hFja9uUgLgOs8gHexIpRzMnUw7DVdWdC84Q57f2gydmWEiVnDGs?=
 =?us-ascii?Q?Fn8CCzqaruUvMApwENFeMwqQVSFSYslMYY6HdXf1Ep0buuRiTc6zpxaYwz5I?=
 =?us-ascii?Q?c1AbdgEpeDaTIhFpZ7IFZ/zwudqT9+w33P5HMJseNmdVYY4AUf7jqN/wRPJw?=
 =?us-ascii?Q?G3JNJbLp0hlCaiea2M/P4Udaga7kRma8v8LHc4N/Hul13l8h9WsyxPcwCA/b?=
 =?us-ascii?Q?Q5cGWE/ZrNYlNfqMkij+6sMJJxKoguDiINz9z6yuc9oyumWnkQNw+CJIKGm8?=
 =?us-ascii?Q?lfL7AHIW5721BlRCZ4Mn4eEq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8c01f7-b266-4cd2-f22e-08d8ed22b64a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:41.7683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6JlTyrnbNHhqDrlILN5VxOhiPUz479ovUYGn/YwX4xCTe3LPHqcFu9StbYbug2gmb4cBv4PlJKpPx6vNjjghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 69 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index fb8ca844d9bd..c791d91cb45d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1946,6 +1946,75 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
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
+	svm_range_list_lock_and_flush_work(svms, mm);
+	mutex_lock(&svms->lock);
+	prange = svm_range_from_addr(svms, addr, NULL);
+
+	mmap_write_downgrade(mm);
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
+	r = svm_range_validate(mm, prange);
+	if (r) {
+		pr_debug("failed %d to validate svms 0x%p [0x%lx 0x%lx]\n", r,
+			 svms, prange->start, prange->last);
+
+		goto out_unlock_range;
+	}
+
+	pr_debug("restoring svms 0x%p [0x%lx %lx] mapping\n",
+		 svms, prange->start, prange->last);
+
+	r = svm_range_map_to_gpus(prange, true);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+			 svms, prange->start, prange->last);
+
+out_unlock_range:
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
index 3f945a601546..3aa6f6b97481 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -159,6 +159,8 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       struct svm_range *prange,
 			       struct svm_range **pmigrate,
 			       struct list_head *deferred_update_list);
+int svm_range_restore_pages(struct amdgpu_device *adev,
+			    unsigned int pasid, uint64_t addr);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
