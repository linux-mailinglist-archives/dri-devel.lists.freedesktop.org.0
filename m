Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1BC2FAC0E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF536E595;
	Mon, 18 Jan 2021 21:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A86E59F;
 Mon, 18 Jan 2021 21:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMVEe0RessHdabBffNSuTR86ehksXME9n7dQ3SjpAfnzG8s3zuNWuV9b4ODTKgnUD8L1rDe8LvaQ80r9wfVLFXbQhw5N6ZywLH4ZUsBt/pob5RY1YeasyQ+GeB6oR8Mj5p2YKJ2EV14cjKcRSpj6kMUMFVS1Qe3WBL/qLxWBxqdbFqC1oyUw2caL26Z1sXZ43wbEDVLz3WrFUbKZktJHuNsu5hZpcPsACx5hUax2pYmRHhxg6olZ7Not+9ybLxiXNKgLAwGD3GvcXPA9jdPBSaXsrM14JERyoqW2xXGAqEd9SgwfFACYuqnGCcb25jO/KKbwT/ycBuf5sB8YsMw/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP/54bMQ4sgO6D23Tqmmn+/xWCR7dSOOdaZ01gId4mA=;
 b=S9OiVC7JdtZHknpEQbkuHqVikcqoGr0iVgpzFnf+V5TwyOPhnxjFVWkv5PbubRoKz9RzX5brTrkvldAPFbQV2Yvof+xUVQeHIIZK7fuMyLQtI/KT4ghPJATaA81gZzmxaW1/BVCGjai9RRqovLrz5CI6bYA9yc6Z06RnlYP6TMwUF5A2v/vNWGAVEsMYFjktAoIbHt7qtFB84oO2qXifdsC8ldYXB1Vk870WNEGs4ekwWsJdvNhFW5U4SVzElv8L/4ewCkWAvnMFxPtqzi2sb6pvDXHCMATwhas9wNKE86jatuBnkO64fVKqcD7cUjFleK2WA9+9DS72kUY1LCXZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP/54bMQ4sgO6D23Tqmmn+/xWCR7dSOOdaZ01gId4mA=;
 b=jzXL31G1kgNyQYFjOmZCAvPJD1EfaD095ud7aMufFPVExj3IOPWvzSYE/qDPPZi0F1ItYCYET169bKEipvubcUv78v4B4t8Qcs0/yY8kp8BWpGgHcH/D+DolHCebYxFiz4ytnPHK/yGSPqMVuxIblIN/OfGhwegy9a9O46vuuzA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:20 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:20 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process dummy
 page.
Date: Mon, 18 Jan 2021 16:01:10 -0500
Message-Id: <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab8e0dd2-61bc-439b-407c-08d8bbf45881
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767A604B4C0B4A50A024265EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: deM01CxxidvlgVQHRVklo1QG6scbCkldLLXyvcgjZmbSTRxRSft1rHYq6e3QwPKZjuoR2Ys2UDDIRGz6DSYFN+zF8nwlOnPhhE6vXN0jjlaQV9tv/l8D1WQ/Uk8O37nDHEVLDN0MnyhhGDRCGdxQgTuWx0R58Vy8VLOj+m8VIiL6C5D5Ncxysmf+Hu4hEK/CXxDa3HyG/4oGDIYIjZ5SGfuRzsUI9rJlPAwJcRXJ7RxWwvVo88QK9xOU9e3U+G0oSsHUm5ieaTpDdh8z/cAR7N+LrCfmldfL9cX505geUAEz6ytFenDgH168yDAAX2WlcwFc95Cq67oxjvNX2nzEpY4EfQ1EXDt/qfSkysCqDBy7NbM/wmvqMDn4OBc5d3D54eEgPznxvvXf8OgK4Prq7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Lp7C78WlsbpW+7kcchh39gKKIBCCMK51KAcmEKzew69qPt/n9Hh9+/ivTpOs?=
 =?us-ascii?Q?/0tak89twzYG1Up/1iz++3254KIsw2ByTTa1ZcEKXs9ta/NvImXZuPNpr8np?=
 =?us-ascii?Q?Ll6/ty77k07iNT0V5dR78xFc3kCML3cjUC6BOkZ2Utlo0S6i0jFUeXpPbyVg?=
 =?us-ascii?Q?abzO5YFAiu68UmJpemw3HnXRmvY2jKTfxLZ8L+j4EVMn4dmplxVxn+f2enis?=
 =?us-ascii?Q?49GEY0uFSaUH1V09i9aWo7ewf5QJw3kH5fUIpva2WgmR0Kbp2Nh8ZJwywkAr?=
 =?us-ascii?Q?wcgmm7vwRXLT934WGjbHZurC1Dqn6GzrYaGxpjRXr2V0qgi8sYDu7dbUcQWJ?=
 =?us-ascii?Q?UloSyCBEVRqryXh7Be+yyP6vNMLVUP0Vkeawj6fisqSLE8JMgEkWCWuZ72ly?=
 =?us-ascii?Q?BZ0sxSbtTpJPgURJzLfEV8ZwDje24RL8hTA6GYJwFLKPdGW+lU32cBJZsDnx?=
 =?us-ascii?Q?dfLK1AGjjKRMiAyuyfL123vmi1s2Jqb+b1myAkWcVjM6NIzKmAsyAAKzeTmv?=
 =?us-ascii?Q?frALZt+j7SKIXxGIyiLMWzR9oaCg34Vk1ZR5WvOFRo0DELVJRXOAwNIvoYrN?=
 =?us-ascii?Q?ckQ1Gw8jJFn9AOjd/V728F27V2HVCNkZ0C/VTo6sJjP3RcximJD+oRxO0jDN?=
 =?us-ascii?Q?03RRb5dVbHDgeshIutEuSwq34a+Jb7rAbGxisdMRvd225SOfrCex9c3CZJ5a?=
 =?us-ascii?Q?Io+vAmoeWt+ou++3X3dFXNulcQ14z2Me3oJVT5JwdjACJ42YLpYrK4GtR7Gv?=
 =?us-ascii?Q?fuR3KYfRGSfsMMStKh5gANh0clRgzbwFyb1uD5NQRCkMk39t5cTApsmn/ao5?=
 =?us-ascii?Q?ZhNk6BFWUMsbNqglR2O5vtnbnSzGclgdIIt79vhLy5/EBYRw3d93P2tIYvTK?=
 =?us-ascii?Q?10rv8F7HGEXRu0CC88lvLwnV/aCMX3mTUWtQz7QJYdX7DZrKaWfRFkP7qhNG?=
 =?us-ascii?Q?MhzEh75MU6nT2dcRgYqP1MgCV4VCQbDJ/Y2tbJcf2wswzWa38TQcec6AjpPr?=
 =?us-ascii?Q?RojhaERLzi6LB4yLUuk+EnJIJZCtv7OXbZGCxlqrZyx7fCmvnlJRNZ4FdI9f?=
 =?us-ascii?Q?ha4bKf9R3aCQeA5qUn3IZfzmiwSQvVxNnCpLfV8kXWERR2T13QOvl/aTrsI7?=
 =?us-ascii?Q?IPU2M5lwHr++aiK3oXpoLMpAfSWNcKMoQQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8e0dd2-61bc-439b-407c-08d8bbf45881
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:20.5894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swFV+ztCJshTvpFlYIgt6kSx2Kq6Sf7ZkMrCFNFY+4uwKsSCHrZL1rjOImuDh0WTGDbAzPmNNCnqjbok+MOi2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
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

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 82 ++++++++++++++++++++++++++++++++++++++++-
 include/drm/ttm/ttm_bo_api.h    |  2 +
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 6dc96cf..ed89da3 100644
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
@@ -380,25 +382,103 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
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
+	struct ttm_bo_device *bdev = bo->bdev;
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
 
 	dma_resv_unlock(bo->base.resv);
 
 	return ret;
+
+	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault);
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index e17be32..12fb240 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -643,4 +643,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 
+vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
+
 #endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
