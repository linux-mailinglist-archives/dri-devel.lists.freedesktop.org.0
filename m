Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A236DB14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8D86EB92;
	Wed, 28 Apr 2021 15:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01486EB69;
 Wed, 28 Apr 2021 15:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELMxuyldqXmLpEaQzn5CmeMnESTpBpxRecHpOurLecQnAZV13yMA093UlSR19Ko/KIiy2OuvV2PX4JCCRi1Ltm+JBV0Qfnc19BioE2mjhx4FIAWkJa8ywKS05qdhXCjDCRcGsk1M3mIsaZgwTJ0yCtiIpWQaj3jX60PnwOMMy5Znw5iJxg/Fgj6C1P7QiD1hXcz3XHr84UxEiWjanWZ575zgKH0VWjrMVGZ3gWlW5fNx3CcWly98unM7e25sO1QXznhZ9jHCLYcpfjm+deEfFGeCChtFYGs/hKf4giTJfRj6Y00ceeZloHMgpZkwIFtO15V1nVWivy3V1EAuI1u5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGvjbVIrpRahh6cQMEYqaY7OXbk4P1Q0/vRMuCFVhNM=;
 b=PfsAunDy2OPDyMDsWv6GeIukGL2XMPHB1tlIinwdGe79Rz7tts9Is5uCyO9WPy074zMoLXW2JHXl21tncdUOsFB5rp2fGMJmsY1wmVht0fYweD0DXs+Tkk5UX4DDjbBjajuyVUokiv1mIy8Smh4rZYTr70cSbB6TjoTBJBtg9LQwGNLP4CC2EvruTp9vBa6gFNGkVVm+Vz1mGQoYrGOds33KOVCiwMdN4+eRI1ZKh4ZtYzKw14rOFtY+E20rcr74THHK0OeA0hzhidmhXhZekbnuZmLpLzk0prGCKjJW6BU9nAvsmKFXRlXJPy/ZPa7Oc6QAAqKVOYTiBXJsejPYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGvjbVIrpRahh6cQMEYqaY7OXbk4P1Q0/vRMuCFVhNM=;
 b=3Ao7XekyC9Uyyntktt4bTgH+wyMWFy08CDA8eIQM+WVA8cP3zOBwdmkY5ZKT52Sy8L0yGtvanUbr/ZAh5aaoY1GJHpLXIeb29AgpSE6/VJJGjP798Wjd1ysNEnb6kabWZtaONgDW3I/LqsgVJGIy0LfTGG/bvOlIyLI9Su5Ozms=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:06 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 19/27] drm/amdgpu: Finilise device fences on device remove.
Date: Wed, 28 Apr 2021 11:11:59 -0400
Message-Id: <20210428151207.1212258-20-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1582cf64-1891-42d5-549c-08d90a582038
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB274979F790C4DB40E317E7CDEA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zBz1a9VD2XnAxFSeD0LOOFbFfEkN387mnxOX6pAEG0369FJt6fT4TW2SaVfSdS15uSFy3fTbccQY0ubVwvN0MSi0EoEKlHW6FXnfysMjoeUNI6MTrD0faL0TDKC325buNN//JqVCmFKloxq9jZX2tGJKjgeQuPJXVxWMT2uXGDPCRe/pypZqvosaiBXNAUGoZmnaFqAB5xWnIxyIG/Ca/IdUxTVoVU8oY9D/C7/7uEgBXQ9DBDTEMBPuCAlZ/gHl8sUL8TKiVQSgsYzGd6A0p/ysNvgFlibglnlrcPMOB4XBEBHwRyYpKVUxATlrWjsHrSHOyonIeUd46My/iD2U5ERcj94VLZ6/S554R/+hMUu0cZp4DsVXS7iijHhZIgxfwwGezdL2+RLlQ85vN8UGf19vM2MsQLauoVkQWruGe9ytWJ8FianFKOBPkpgNIBCAGfCbpZZ1H+L39eA2DQznO+Egd1rwLOS+IKKVTIeUn4eSdBmHu34ZLyuND8rCD3EGvlLHJumaLLIOKCK5Sja5eZmw4vTYKIzPMWbId3b+sFIwJCm8pWfMiqMebF3nBWcYBT9WTNt9LNKtPFo8t83IeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QCtLlIkVtH45As2v4d4JwIe8sxP3HCuzg+Fc5oJMCuhp/us+f9Z9zVU6abaI?=
 =?us-ascii?Q?RJTJIOiyq7XjtHZXhH8tj+BSnazvrhjcaafHtaXJPtb4cdQK60S43g4PvuLR?=
 =?us-ascii?Q?ld6JXaIfLX7IDzNtY8nODoIPq7WlfAe9h6HCslUXwlJfUjw9GUv12KkwNAh+?=
 =?us-ascii?Q?oFqz2bAOQNQ5x8fI9k9+3VmqwYdJJ/6Tm1kaNE75amQvb06AEwg8YySWFoHy?=
 =?us-ascii?Q?Sr4evvZXfPwKz8K51BDN62RzjazzqeDJERvzpscYa0la70uIZocbejuYE57e?=
 =?us-ascii?Q?ebrCP6sf9GkzESnuVSmVam1R1ct8BkrDGCKQ5kallAwqIkTi55UHNHBz/Qgi?=
 =?us-ascii?Q?oi0/TmU81dEMp2WDJ+xbrROYksS61npDRzobycae0JcnrrUEV914NOaF0trg?=
 =?us-ascii?Q?Oap3EgFZgChibOsWjeso3O8kRXGYUOyE42IacMmnSVdWiqsUcDPb4g+i2Jex?=
 =?us-ascii?Q?GCc1Phf7BEOKKKtupuwjWpIdsLhOy1WRosaMY2Z5sQn4GaCl8P1yYv5XwYym?=
 =?us-ascii?Q?yUEnGdoQs5uQyPp/5zi7wp91U2mKnz/Vgs92icBaa/qUVVjezDTHqNXSagSY?=
 =?us-ascii?Q?ig6xgvFjc88DXzKYRZards5uYaDMnVSPVgv6mLPJkZrENTEmuvun6vmCjHif?=
 =?us-ascii?Q?XvKDR1z5yAeRr8ewHgNgYgvcqQvT6Z/pkJNKMoJ/yDAo4qQ4CWYEdA+aGpT+?=
 =?us-ascii?Q?7iIYpkxNtRscxMGHemEkEaHy7nSRZ58/GMT2iYlz/tOh5NGhXPOx2bxdz9lu?=
 =?us-ascii?Q?gcxlivSf3Gj9Ryi0w3+mqLfspkdskEfSHzus9632QfvBlct/XgI+WKBKZXsv?=
 =?us-ascii?Q?moZm13xXN6h3hqca+jGUfD7xBwojCaNhA8oROl22zcxvRB6HC922Mmoj+ijf?=
 =?us-ascii?Q?yHzHJyuOwt34wsp1+wdoywvwxdyWqlrh/u12LtAAXkCv8b+nJQL2zKMdVKr5?=
 =?us-ascii?Q?ytNAMzP5MK27OOL5L4fR1djJmf6PGsWEVvsqwbv//XE9Bzjk8P6owxhikQSo?=
 =?us-ascii?Q?tMkNWBWYPdkpv7huCIVuSDj8iPw7g9Ult60E4FIjJGOoQzWM0H/PLqTyjXuI?=
 =?us-ascii?Q?avH9B6iuLwyHeGXp+vxY5voRril4omsekG9JbIocNhaMed5ZYiE7U341unK3?=
 =?us-ascii?Q?8VUx2bqKWAZR3HQXnNCWcoyE05cyihQBGOnRoLpEUK5v5Tnwrh1lzPAzuLmc?=
 =?us-ascii?Q?+Ctx4QdfWtc6/sGooUrropbD0bBJcJgwvb9QjqwPt2nkRyo4DLZ3aT0h8MO1?=
 =?us-ascii?Q?i3mHi5kC1imI+7/zD+xV9ubPJl7mzRX7tgzGzqNNa793x8/u668vaavelJ8x?=
 =?us-ascii?Q?mgl7dzA5MvSMyKWc4joQdsGqHYBTCvWUD9/UDqyimwjQlb6xBLz5clLDFldj?=
 =?us-ascii?Q?H4Efy01SHVafSbObt2xnhYu18k+O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1582cf64-1891-42d5-549c-08d90a582038
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:06.4757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZYhqjxWnwR8zvB9JI7dnQuAgZ8QSY1Vbj5N50jzcjMBlMELmEHRTK9vczHWRNUgMXh2P4QckgUxmfXmHeYCiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure all fecens dependent on HW present are force signaled
when handling device removal. This helpes later to scope all HW
accesing code such as IOCTLs in drm_dev_enter/exit and use
drm_dev_unplug as synchronization point past which we know HW
will not be accessed anymore outside of pci remove driver callback.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 98 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 12 +--
 4 files changed, 103 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0db0ba4fba89..df6c5ed676b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1374,6 +1374,8 @@ void amdgpu_pci_resume(struct pci_dev *pdev);
 bool amdgpu_device_cache_pci_state(struct pci_dev *pdev);
 bool amdgpu_device_load_pci_state(struct pci_dev *pdev);
 
+void amdgpu_finilize_device_fences(struct drm_device *dev);
+
 #include "amdgpu_object.h"
 
 static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 33e8e9e1d1fe..55afc11c17e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3692,15 +3692,12 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_virt_fini_data_exchange(adev);
 	}
 
-	/* disable all interrupts */
-	amdgpu_irq_disable_all(adev);
 	if (adev->mode_info.mode_config_initialized){
 		if (!amdgpu_device_has_dc_support(adev))
 			drm_helper_force_disable_all(adev_to_drm(adev));
 		else
 			drm_atomic_helper_shutdown(adev_to_drm(adev));
 	}
-	amdgpu_fence_driver_fini_hw(adev);
 
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
@@ -4567,14 +4564,19 @@ static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
 	return true;
 }
 
-static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
+static void amdgpu_device_unlock_adev_imp(struct amdgpu_device *adev, bool skip_in_gpu_reset)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	atomic_set(&adev->in_gpu_reset, 0);
+	!skip_in_gpu_reset ? atomic_set(&adev->in_gpu_reset, 0) : 0;
 	up_write(&adev->reset_sem);
 }
 
+static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
+{
+	amdgpu_device_unlock_adev_imp(adev, false);
+}
+
 /*
  * to lockup a list of amdgpu devices in a hive safely, if not a hive
  * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
@@ -5321,3 +5323,89 @@ bool amdgpu_device_load_pci_state(struct pci_dev *pdev)
 }
 
 
+static void amdgpu_finilize_schedulded_fences(struct amdgpu_ctx_mgr *mgr)
+{
+	struct amdgpu_ctx *ctx;
+	struct idr *idp;
+	uint32_t id, i, j;
+
+	idp = &mgr->ctx_handles;
+
+	idr_for_each_entry(idp, ctx, id) {
+		for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
+			for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
+				struct drm_sched_entity *entity;
+
+				if (!ctx->entities[i][j])
+					continue;
+
+				entity = &ctx->entities[i][j]->entity;
+				drm_sched_entity_kill_jobs(entity);
+			}
+		}
+	}
+}
+
+/**
+ * amdgpu_finilize_device_fences() - Finilize all device fences
+ * @pdev: pointer to PCI device
+ *
+ * Will disable and finilise ISRs and will signal all fences
+ * that might hang if HW is gone
+ */
+void amdgpu_finilize_device_fences(struct drm_device *dev)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct drm_file *file;
+
+	/*
+	 *  Block TDRs from further execution by setting adev->in_gpu_reset
+	 *  instead of holding full reset lock in order to not deadlock
+	 *  further ahead against any thread locking the reset lock when we
+	 *  wait for it's completion
+	 */
+	while (!amdgpu_device_lock_adev(adev, NULL))
+		amdgpu_cancel_all_tdr(adev);
+	amdgpu_device_unlock_adev_imp(adev, true);
+
+
+	/* disable all HW interrupts */
+	amdgpu_irq_disable_all(adev);
+
+	/* stop and flush all in flight HW interrupts handlers */
+	disable_irq(pci_irq_vector(adev->pdev, 0));
+
+	/*
+	 * Stop SW GPU schedulers and force completion on all HW fences. Since
+	 * in the prev. step all ISRs were disabled and completed the
+	 * HW fence array is idle (no insertions or extractions) and so it's
+	 * safe to iterate it bellow.
+	 * After this step all HW fences in the system are signaled. As a result
+	 * also all the scheduler 'finished' fences are also signaled.
+	 */
+	amdgpu_fence_driver_fini_hw(adev);
+
+	/*
+	 * Reject any further jobs to any scheduler entity queue. After this
+	 * step no new insertions and because schedulers are stopped also no
+	 * new extractions.
+	 */
+	down_read(&adev->sched_fence_completion_sem);
+	adev->stop_job_submissions = true;
+	up_read(&adev->sched_fence_completion_sem);
+
+	/*
+	 * Complete all scheduler 'scheduled' fences currently pending.
+	 * It's OK if new contexts and sched entities are concurrently
+	 * still created as they will fail in pushing jobs to SW queues
+	 * and their schedule fences will be signaled with error
+	 */
+	mutex_lock(&adev->ddev.filelist_mutex);
+	list_for_each_entry(file, &adev->ddev.filelist, lhead) {
+		struct amdgpu_fpriv *fpriv = file->driver_priv;
+		amdgpu_finilize_schedulded_fences(&fpriv->ctx_mgr);
+	}
+	mutex_unlock(&adev->ddev.filelist_mutex);
+}
+
+
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f799c40d7e72..8a19b8dd02ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1249,6 +1249,12 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	/*
+	 * Force completion of all device related fences that might hang us when
+	 * synchronizing SRCU in the following step.
+	 */
+	amdgpu_finilize_device_fences(dev);
+
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2670201e78d3..af592b28cd35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -526,7 +526,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
  */
 void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 {
-	int i, r;
+	int i;
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
@@ -535,18 +535,10 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 			continue;
 
 		/* Stop any new job submissions from sched before flushing the ring */
-		/* TODO Handle amdgpu_job_submit_direct and amdgpu_amdkfd_submit_ib */
 		if (!ring->no_scheduler)
 			drm_sched_fini(&ring->sched);
 
-		/* You can't wait for HW to signal if it's gone */
-		if (!drm_dev_is_unplugged(&adev->ddev))
-			r = amdgpu_fence_wait_empty(ring);
-		else
-			r = -ENODEV;
-		/* no need to trigger GPU reset as we are unloading */
-		if (r)
-			amdgpu_fence_driver_force_completion(ring);
+		amdgpu_fence_driver_force_completion(ring);
 
 		if (ring->fence_drv.irq_src)
 			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
