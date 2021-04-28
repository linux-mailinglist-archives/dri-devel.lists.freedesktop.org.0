Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97936DAE3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A716E0F2;
	Wed, 28 Apr 2021 15:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481ED6E0F5;
 Wed, 28 Apr 2021 15:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gax63yzIUwXNj82rbF84YS5Q2yE46NM4ZIIZgaFW4J53P02vOUvEQrLtSqkm6vQpyS0T+fsBznjFzKaCk4FKaNyWkEdqixaicqSqFVw8nUJRUi2QVpdryeWF48n2yqGZW6MUpNsEzJi2THLOSfHGJqXrrrSuRpS7WUwvbsO73lT0JbP+KVgVAH5jo5gGOB6GAElP4kFFac3mkYrFSMPGQnwjqwscs0f2cUfvHuQkU51K5/XGOOjgeS0KV8C1PeXKDM3P7Tnf06mhSo9d//HJocMBGd5HVZDSZCytuUtk4UV7t/y/1/45CEoh/SX+pcEqtXeZm67YLoELvNBPDAKgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlP3Nu2/Ly3UoGYGggWI0PsQaIUgQbOHVqqtihMisbw=;
 b=j3BllWKmgC1OlrBbzsJFFBA4f/eBz1K8aVVnXWnyoh5bjCjjdiMest2+bA7ubAIzjfOFZZCqS1IcUB7Z4mSty9KMf4hvZYNC/BMcz/NLW82Uk4umCx/WRDCervut5mpB3BzTFxoXWOoeD5mEHehz8BGsDRtzy3Bd5KnToI6SSjw8rD7371IKLw8UIp0BcI+9wP9z2khfRAjpEqFqg+7Ysb2IUaCgNmqh8IPZqQadVVT3w4dPOvyvEWgfyNj8N9biVUUK2JF8UvIWwF61IZ8KXa8fMO4/s9PctVRkJapuPjvXonRg16GKJyfPO7NlZIR0a1dncQAexeT1B9zfek++dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlP3Nu2/Ly3UoGYGggWI0PsQaIUgQbOHVqqtihMisbw=;
 b=a59HyWdIx1cCYB0nIS8oXzO2GArsUZDvPiO9n6DWXtRxeYUPmowYYGdTs56z7of1VuU9QCI7aJBCLE8Z9N9eqa6pd0pRsCdvWYWnEYM1xtNCm/veXudR9ei9A+zqY75brl2tCL+x10YmuTuldIfbGbwg3wg4wl6ivgxUU4H+hWo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2799.namprd12.prod.outlook.com (2603:10b6:805:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 15:12:30 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:30 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 01/27] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Wed, 28 Apr 2021 11:11:41 -0400
Message-Id: <20210428151207.1212258-2-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414672ba-0f1c-48ae-4d27-08d90a580add
X-MS-TrafficTypeDiagnostic: SN6PR12MB2799:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2799E63D23506DF182B12512EA409@SN6PR12MB2799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ADg1QtPNE3XzaVlhQ924t6MA6L34ecz5daDp7YorUjaSGFtPfT2NjphYv5SW8S+UANI9tqcExVKxuQEGQ0jdTXwlSz2jTStT4DgJed4WWy5pBNlvo/d/2eKZDVPG8EyAQhnx5STp7eratQHCQAkqPZtxEhUITCOG6MkplQNuUwiVmufJGGtPIdiT4uAK77hR9t6paXe1WfBXytgDQYpOBoTRV1Rens+m1kRGWGICt+zK3zqK0ElKSLV2kbvlumluNCkUb4YQrbyFCJqrpl25Ox0SOPIOv9PD6PpSP405OAcRGXiTN032f5EzTQzJlZHnlgKAYOSZSq1/Aj5EofaE5XUuodVzLxHBUdrib9s3XzgRTdd7Dqs/UVgGICEtoTnax5J/oWoMFA3yOB9dyOh6Zc19UdgjQJLryWJA4Pg7dnN5JW37FmQSYmFEthqbOqvdpDnuPRfdjLWkpzClVU7+5R599oFITddt1CcLtbqlHr4w5ovXl8EpDnVkm91BPp/sjqHMhKrP8Ddd4FCsb92KDs5Z1u1Dhf9GXcy9uw0XkefbNwPkOwqx8gKmc5HGayZXg8/2deuNIpch3SKfkMKT2auYh7JAdjkD2OGE2QQUmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(16526019)(8676002)(4326008)(478600001)(66556008)(66476007)(2616005)(66946007)(86362001)(44832011)(186003)(83380400001)(36756003)(8936002)(316002)(6666004)(1076003)(6636002)(6506007)(52116002)(38100700002)(6512007)(5660300002)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9eI4x7Io/+A1yXNTjMa/I0SywTfCyRY7tc3XoHBTgeQxChfh42koAwI3hqAI?=
 =?us-ascii?Q?CuJz1IqhM3sEWGcsgyiPkQfE4J3hYjhdfR23ZDTPiU81Dha30F1B8UIgQvNp?=
 =?us-ascii?Q?PXeZ7geNfoNkrdDdqAdFsLcioMpEgUCIv74Ug8wpyJSCkjM9wV+LqGz2l/a5?=
 =?us-ascii?Q?kk2T18qzDaNcsrpz5yjD8uGe4lPl+IVxHvdz3Ey15KyNmLnz2rnI/eKiqc0I?=
 =?us-ascii?Q?wGSncpzb6Wadg9BNiggcW2fa14aZA5etkPTFXDoM0EpXTEo82zAB+ZW3kIcA?=
 =?us-ascii?Q?mF+zTdDp/TAZvLLZRTSJM7ijpgL3e2kpnojYqPtLtJzdXko6lmT699wAMFs+?=
 =?us-ascii?Q?4hWfIfgDna1Bk9HcDvo1yoG/PjsztAgKjLgBSx+GTIMWVpqsUN6VFPdvlGTh?=
 =?us-ascii?Q?RsfV6/SqRrLjeaalEfDrit6uGUFt/MXWrDDsDK6b32R2LoKG3ZELqfCkx22I?=
 =?us-ascii?Q?sLyRdze6RIjrQaNPtPHhSYUZlqeoswtC9exRuytNUORYkM4DyTfKOYvvygxu?=
 =?us-ascii?Q?NCbpGeOQbsVCr3X9UpYsGOKIew676SBwxRZMxNmUPl7jeYVDfWuuRh6u9jyU?=
 =?us-ascii?Q?HxdLMLICcGi1A9KbP01AmOf7jkrm+y1Vb/i4DIMF4CO21ouIgM0JVD8+LDTO?=
 =?us-ascii?Q?ATMIS9lI2d/HKQ2gqRoVoLLAiRkYS3kNbFJIbsr+z/AJYFNZZAsk+ZGsYl1W?=
 =?us-ascii?Q?xiHz3PUqIBWEMKM9ADGRyJdwNy4G1u8vqeIzpUjAAV/fBO9HiWTpvi63ollS?=
 =?us-ascii?Q?wb1kOrsUylGStiq/+pBz7HGDEhTjWGIA3sH9PCxRehXIjqfiyVsgL767OwsF?=
 =?us-ascii?Q?egX16t7ZVwHNw3Drk9BxFT3BTaQJoOtTARDSz0F+JmbzJU14Dv+QEDfbWHJW?=
 =?us-ascii?Q?foHgI04hqxMIiJpeGIk/TFxEdwRAtUfdzsV1io6ZjzNii8cUud49I+oAaKzL?=
 =?us-ascii?Q?MSMUq4D+L7whCGgr/oBiySb71zT6Ezi6QfcXq+cJoFOwBex52pl1AtpHWQTv?=
 =?us-ascii?Q?1xqzMKjnhESELzxzvRvJZqyWs8ACFR5XM2h97ks7VdEh61KadAzBh/yDaIto?=
 =?us-ascii?Q?nAgZCCIFKHPMlWdhkMjvFPpDERiyH3ckBXILOGDDEk6DYI+O5Ja1ZEWzaZ1A?=
 =?us-ascii?Q?kCq7a9odFFNQOfmv/3fkA6MjM8yoXASfn5vR7qZ2GoGodNhDXfA3JgHbS83t?=
 =?us-ascii?Q?bxrMCrtX2bCEA0MpprltyvkAIcYBNSwTMLrmLwf5ho/avQau7/1h8LJy0f4Q?=
 =?us-ascii?Q?S3VRm5o1gZGZbHI/zPOQEpRcAEQ8sQxfx0aeX83W2NTNY2Q6CCMRZ7/RG9Ps?=
 =?us-ascii?Q?TpprYl/7z+NpGSeJcYe7ZdrpPYEUsMmutZB6QOtkG0FA2qoYupYjH5xlCIR0?=
 =?us-ascii?Q?n0J9KemLw3liwGs7SUVDUdTSSzGf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414672ba-0f1c-48ae-4d27-08d90a580add
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:30.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMd9UMXpoWBl4rCsAPw1xZLOM1J6Vg0nrI4hh0OLmfUHc8d/fjBsl0QNwz5NsTIqlTie3IgsacFYsN43ByOkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2799
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

On device removal reroute all CPU mappings to dummy page.

v3:
Remove loop to find DRM file and instead access it
by vma->vm_file->private_data. Move dummy page installation
into a separate function.

v4:
Map the entire BOs VA space into on demand allocated dummy page
on the first fault for that BO.

v5: Remove duplicate return.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 79 ++++++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h    |  2 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b31b18058965..8b8300551a7f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -34,6 +34,8 @@
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/drm_vma_manager.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 #include <linux/mm.h>
 #include <linux/pfn_t.h>
 #include <linux/rbtree.h>
@@ -380,19 +382,94 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
 
+static void ttm_bo_release_dummy_page(struct drm_device *dev, void *res)
+{
+	struct page *dummy_page = (struct page *)res;
+
+	__free_page(dummy_page);
+}
+
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	unsigned long address = vma->vm_start;
+	unsigned long num_prefault = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
+	unsigned long pfn;
+	struct page *page;
+	int i;
+
+	/*
+	 * Wait for buffer data in transit, due to a pipelined
+	 * move.
+	 */
+	ret = ttm_bo_vm_fault_idle(bo, vmf);
+	if (unlikely(ret != 0))
+		return ret;
+
+	/* Allocate new dummy page to map all the VA range in this VMA to it*/
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
+		return VM_FAULT_OOM;
+
+	pfn = page_to_pfn(page);
+
+	/*
+	 * Prefault the entire VMA range right away to avoid further faults
+	 */
+	for (i = 0; i < num_prefault; ++i) {
+
+		if (unlikely(address >= vma->vm_end))
+			break;
+
+		if (vma->vm_flags & VM_MIXEDMAP)
+			ret = vmf_insert_mixed_prot(vma, address,
+						    __pfn_to_pfn_t(pfn, PFN_DEV),
+						    prot);
+		else
+			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
+
+		/* Never error on prefaulted PTEs */
+		if (unlikely((ret & VM_FAULT_ERROR))) {
+			if (i == 0)
+				return VM_FAULT_NOPAGE;
+			else
+				break;
+		}
+
+		address += PAGE_SIZE;
+	}
+
+	/* Set the page to be freed using drmm release action */
+	if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
+		return VM_FAULT_OOM;
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_vm_dummy_page);
+
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret;
+	int idx;
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
 	if (ret)
 		return ret;
 
 	prot = vma->vm_page_prot;
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	if (drm_dev_enter(ddev, &idx)) {
+		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+		drm_dev_exit(idx);
+	} else {
+		ret = ttm_bo_vm_dummy_page(vmf, prot);
+	}
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 3587f660e8f4..dbb00e495cb4 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -635,4 +635,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
 
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
+
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
