Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22364343F4B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549116E42E;
	Mon, 22 Mar 2021 11:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6055C6E3F2;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9x7E9jYDakQul7ljTTDjf6xsCiwSC/vBdKuKO2WeVaVmzjBfRwYefzSqJQLV7B3h5MVqx6sLn9RrAavpNKmhbCZ2eR3QjHdcq+3z3/rRMBFtxdGqxKT2ZWjwrw++E0G3d7zi7vltJ8n91uTOBhdCsWYqqk4iYXOioRXsM3MkDElxfz0UACZ+qfIzx6cPav/xUet3t5O3dJBvBA7y85HmkYA3R6im5AvuvpNcB2lFg26U/lZ1ajzCit4WZTQZ8i0tYEyknQ+gqro1KuxVTRZTBAJoRZ1pQRXa+DObiws1L3Sxo5fiXAuus38i/xdXBAS2TDHRRc+37vkFBnD9Axi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJ3CIGihgakSrwmqXAIBQ6hwH2KBmZUlO61ZpPl7vOY=;
 b=IwOrl2Vh6f1PsNlak52s6tnqTu2m5uJGgscjWv5j40rgNQpWcC7t5fRM5rs362CEghe8b/hcdktp2DhdX/K/nM3mkrD0pkfDXIMOljvfR+4H55Kf2e2CtlvIJhH+OaOK3H4yIkDSdisiu5dOIbWv4X3HnXcBB2FMoWExePb6lQOA8Ihq1SbEdc3mpIcM2ViRP1W8+AVY73B7RYuw7tPy6M6y5Pp5Yw+a9Ty5/r+iNgbEUGLqTPOVEBItvwvB+bIA/0OjRJpYFVsPsktBdRfq7fv77oQeWapkdTG8hdj0VWcdbv4tTMqDWTIYBw6JICYGpwKAUJqwmpWx13Vge+slXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJ3CIGihgakSrwmqXAIBQ6hwH2KBmZUlO61ZpPl7vOY=;
 b=aPjer/NuzAGFzwKj0M0mwaWIRnZ4hSwb2wknB0wSK1yKrYLH09DpkdFc/99e3ttBBE+LaSMdsW1UDYUD8US3whRhp/7LppY7eFhzWZ4u4VRLKyZ3YjyXvd4cDzj6akVakZInk6cFqdfDAU7wCJkxxbKmJdFvMxODmhp5RpEQh1s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:17 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 34/44] drm/amdkfd: Fix dma unmapping
Date: Mon, 22 Mar 2021 06:58:50 -0400
Message-Id: <20210322105900.14068-35-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 06e571af-ff6c-4bf3-bd48-08d8ed22b9ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255A92EBCEA24BB31AF118392659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUjqJN8Wz/0wH38tLx73FGka3Khe9iExVfSvfQmsR4RprXqM5cZjIlV3Z0+DzuCHZ2cJ1LDR9XpHMoagFJNjKM50O2V5dR2YtgN0hZMDLIcCZzZKW/cRBgbxJbed8j5hMsO/JuHUlh49CwmRtEYS5UKCGMFeILUuwhg1RNxZs0rDEQq86tVKeY9YLO32ha1/LbUnFtG6oqVo+hIIhL9cQTxRWqlOJnNBmpRW31CZXq0y9mZg19PxglVF/PgQ5Kr7cmTkWVU3lC0C0LAl/KrxQDdsb65WNtK+IN5q9t0ytEdzPUYg3D/biNPucvy63FrLC+fE0jha77oZQP2Ge3HUB8mUzlZ+p9hZHNl64KtcODXJbMDfwNrLcJrM0SRkNPzAS9Rpc65x+qLZS86dnBcOlarqn0fBXlJ5nScl77Gb1OPDjUeICRHi23T2Ej2IUOizUYXAf2zLLBQPnLg7hkusypq3EeVSTvnUThXdhHmgyIp/nUAqlyfmbzWOLKUSJVB4zUQke07i7Q7vwjcD6tXvyzvKG3mIsQJ0GQXfZBVxxtHgMu4B71XdHL52ot6AAsJ20baanVRsl6+lH1dKRIxVxYe92YRcrZQ6IAmS7X/pGbOSulownHB935tdNdaMtxMjuhFRWf43xzQgfyS4tPeElf1LARS+CJPbFCkNeZCxz+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(450100002)(1076003)(36756003)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(8936002)(498600001)(2616005)(956004)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Of1Vb7faJ3YYCO0gE+K9iesDrBtRhD1kXe2zr14nnyso62iW34ITI7RG5V+I?=
 =?us-ascii?Q?wSsX5f5HUdB9oCN3PtaT+i/OybmcTCE7NATGQfoW2yB9+m60kOWiR14C2Ypj?=
 =?us-ascii?Q?vVghO0/tCy5OPdsU/g8pNpNSiooZYVHcLp8RwZpTxgYP9XyRSZJuSq64Ropy?=
 =?us-ascii?Q?HWuD7eZqi92Q3XfqaBeLj+2LjG5T2zTLIyw+AhDIqX7e4vb/iCBFg3wvz2DL?=
 =?us-ascii?Q?2hrJx8WRwhTlwwBzlVghdfADl1nBxwLKt72caimEPj7y2fn411UR4R6Bn41o?=
 =?us-ascii?Q?La0J8G+Kc6RdbI3Vp1nKZNyLxdckQzjROrEZpnUpJI4BEuQX6vA1nzGczBQC?=
 =?us-ascii?Q?ST3ZmmZZ7t3yL5bJmjrIHVDpg+4L6bjK4SlxHYgwZ2vq1hZz74H+3fkMyv0Z?=
 =?us-ascii?Q?i+CkA2bEIyIUkC2d66AdcceFhYJYWgCRazTiXVhfJjeX6QiBjRuuKbj2r65R?=
 =?us-ascii?Q?1Ip5ymucMc1T6gZOoyWOC+gLy2b5VUW0ktDSEumk+gJlsygigeVMaS3qt3lR?=
 =?us-ascii?Q?y5sZ33IKvTzJvnZvM1TnP7E/VMlQxl58meSLVlKC3/E4VTbgc7A+AA6Zgyr1?=
 =?us-ascii?Q?TMIUPpLj2TQ4gMvhmeagAom63Onf5F+WzHRS5va0ymrBIArMCrxnQ1ctk5Qx?=
 =?us-ascii?Q?0y/sSpC8Pr/Eo9ZErfTUBpGUGfKGiajgsOH1EP6WwOi/IMuciPidkR9YmRZJ?=
 =?us-ascii?Q?sQ6Gtz3TYNUhQoC+vPlr1m+asuG+lzWSJXsCctHp7VDLKbFhHLbTOAM6tgV7?=
 =?us-ascii?Q?suKlrOmhsLp60jWT07iuxD89ePLfwabFZpDiTKaj7UhDZHs1Xyp7zBcqUAiu?=
 =?us-ascii?Q?5zdSlLDXrHYeku1/izBOm0lNQVd3eayNIKpjfmbOx3ko3o8DWyAisrBjhvXo?=
 =?us-ascii?Q?LIMiALob38C9KFRlZ4Nl4jP0YS6vRjyidn3RoZTT7ZqZuOzCg4UQ523OmYdy?=
 =?us-ascii?Q?HjkIi9xbP2VDnClkLFtx0gyFZtLojAEM/RIMGbVqgfucOyow7vyDK7KhMaef?=
 =?us-ascii?Q?O16B1gZMPOllBzab+w7swA2GfHxGl5hLLYjDnlsxryWmI0k1XKhmYdGDlR/F?=
 =?us-ascii?Q?rLFmlcxH2nCTLPhfAHubVTfRQXQCYWZPfKDdIAfvgYbbtgHefdb882AGR/jF?=
 =?us-ascii?Q?Z3g5AX6VsfbXL27mM6CKjUgZ7+ODXEYZVj74S27TSXtp4vUv6JhzSNK+KmU0?=
 =?us-ascii?Q?+P9apiXmRXKot7CkFmOXUGkUwyH9Y6ATMuSf37XMhXn/9A+hh6YU5337oBtV?=
 =?us-ascii?Q?5z0fuJWpfKs8/Mu9kmJ0RJB1XCLy5cPNfK7L1IZCf5uGlnYo8ampp/9oT+j5?=
 =?us-ascii?Q?ivz7djbJ7i1QhCbuQglZ9xH2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e571af-ff6c-4bf3-bd48-08d8ed22b9ef
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:47.8396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXxXMczbhs0q76qkgjNKgE9idadyivIZBzPTJ9T9PVzNV0+ZsRARTijsXDN9FgLEMaEJk/p+paWifWXrnciEgg==
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

Don't dma_unmap in unmap_from_gpu. The dma_addr arrays are protected
by the migrate_mutex, which we cannot hold when unmapping in MMU
notifiers.

Instead dma_unmap and free dma_addr arrays whenever the pages_array
is invalidated: when migrating to VRAM and when re-validating RAM.

Freeing dma_addr arrays in svm_migrate_vma_to_vram fixes a bug where
the stale system memory pages were mapped instead of VRAM after a
migration.

When freeing dma_addr arrays, ignore the access bitmasks. Those masks
may have changed since the dma_addr arrays were allocated and mapped.

Change-Id: I01a6121c4c9908c1da4f303e87dcafd509fabc86
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 16 +++-------------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  1 +
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index cf71b98303c2..da2ff655812e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -444,6 +444,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	prange->pages_addr = NULL;
 
 	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
+	svm_range_free_dma_mappings(prange);
 
 out_free:
 	kvfree(buf);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 6c46d43bf613..3eea8f87724d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -173,9 +173,8 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 	}
 }
 
-static void svm_range_free_dma_mappings(struct svm_range *prange)
+void svm_range_free_dma_mappings(struct svm_range *prange)
 {
-	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_dev *kfd_dev;
 	dma_addr_t *dma_addr;
 	struct device *dev;
@@ -184,13 +183,8 @@ static void svm_range_free_dma_mappings(struct svm_range *prange)
 	int r;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
-	if (p->xnack_enabled)
-		bitmap_copy(bitmap, prange->bitmap_aip, MAX_GPU_INSTANCE);
-	else
-		bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
-			  MAX_GPU_INSTANCE);
 
-	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+	for (gpuidx = 0; gpuidx < MAX_GPU_INSTANCE; gpuidx++) {
 		dma_addr = prange->dma_addr[gpuidx];
 		if (!dma_addr)
 			continue;
@@ -292,6 +286,7 @@ svm_range_validate_ram(struct mm_struct *mm, struct svm_range *prange)
 	}
 
 	kvfree(prange->pages_addr);
+	svm_range_free_dma_mappings(prange);
 	prange->pages_addr = prange->hmm_range->hmm_pfns;
 	prange->hmm_range->hmm_pfns = NULL;
 
@@ -1192,11 +1187,6 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 			if (r)
 				break;
 		}
-
-		svm_range_dma_unmap(adev->dev, prange->dma_addr[gpuidx],
-				    start - prange->start,
-				    last - start + 1);
-
 		amdgpu_amdkfd_flush_gpu_tlb_pasid((struct kgd_dev *)adev,
 						  p->pasid);
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index fea9c63b5f95..b2ab920ab884 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -175,5 +175,6 @@ void svm_range_add_list_work(struct svm_range_list *svms,
 void schedule_deferred_list_work(struct svm_range_list *svms);
 void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 			 unsigned long offset, unsigned long npages);
+void svm_range_free_dma_mappings(struct svm_range *prange);
 
 #endif /* KFD_SVM_H_ */
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
