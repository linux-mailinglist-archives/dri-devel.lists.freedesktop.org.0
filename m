Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBE3676CE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400BF6EA17;
	Thu, 22 Apr 2021 01:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186E6E135;
 Thu, 22 Apr 2021 01:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir7+JoeDXGUpIbf9OtmYqipBbkROSasKJGSjEkqHLspq8uzU9nzlS+ReQ9cepJhYKDk7xmum7EXKm1kl6d/9rDVTog/xler2lZhm4EuZkeYpbnm/kwZC+mL5ArQYq4oVNrzIKDCj9zrMCVp1T75dpJ3jSiOTINQy61xdX8ed38FuwJX48RKLuhRsXcYzCtWd27nj1Sxq1hEEwd9oBp66XHdSksVToIxLODN6Z0SFaRuwwU3NJzoP7XU63HX7ubacLSF/46dtIpGWs/h7HatjSA0yz90YYX3Gb30t3KNP8YljsE0DgivjKkQ/FUydCjWBaf2oPhW1a3t1WTHPEwjslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZgQCeJ+/+U0LFHKWLBcpQ9cqefTDiNUJe36r8rTMCg=;
 b=OzifDq+itdpPBdSz6dhGsy4luN6f18aZ2VMNY9NI0t5eghMXBWid2OkdFWohBOOhYHb2PtUJDMKXQjpsJyzUO3Yj9UGYRtKE1lUznVBa182BzCSWMAXsUqa4Uv1tjG+MeXVe6/szyHZ//bJjMMkVqGJTtTiIBQrlTjPBnweyDSQ6NJkso5X0KcquqKCDELWwbaHnjUxyO0ldg9lpIM/v6t1t1Q1K6raa/EEAnyQiK0ad2nrq/02fF0XDJdDNRtzmI6BiQu6zLwkstl05rUHu6q/cpFkgIztmy2J0MQAGKY9yWus9Zj4M68GqsE2tNlyg1yQXMJLZsZEagqvZe07hCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZgQCeJ+/+U0LFHKWLBcpQ9cqefTDiNUJe36r8rTMCg=;
 b=MxpXEhvmA5KUODLmExUWRKZqc/gsmub4fIlbnYX0ffdRZKZpni9OAMgz6erq8LThR2+SnRj+PgfiGKQ8iJyfsvbCYWUyS0+sNpbd+s3oumgSxbmWVviXz4ljULRpDrEMZd5FxGV4Cnj8WPzbyH6OTAQTJtsmLUhDt7jkTtym150=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:17 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/10] drm/amdgpu: DMA map/unmap when updating GPU mappings
Date: Wed, 21 Apr 2021 21:30:54 -0400
Message-Id: <20210422013058.6305-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4efa65e6-c5d3-4819-bade-08d9052e5345
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB443845B428FE00FB0AD3EE7692469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KakXUSc2idtO5i1g24Ue0Sm0AUqCLhZujKpNkVUvMVVJz0iXfTkWJII9ATSBVB3p6NgWyz/pUmFU8fE3RAYMso4Y/3sGfmeiakSjORdBAxtzNvRIgRp08iENLnJ0evZ9GEnnAucAXo9NQxYqZxHvXRSPIVuY0A7prMJX6j7N3wCHhfI+Io5JxbXjYdWu3fX9rBgk3vJ80RO1QUU6ZgFB6SSm3TuvoBYtEbg9eduTHqDYDxF8zT8qbkcHZhKdpKQfo0j7R34VndAP38QsAS24eiS4/X5hWC6rkX4nWnBk2KWnANE2Vc/UClDOgvajNjUfbChgFghoZ6rWQ4PO07peJY31fo4hySjoeolz+jJXADAnDG/IvQJJUjkbi3x5tHXyShZFlFGS4OguFxqmiVdHpRy2a3U0wCKRBujBC1/p9+l/i7aDhnJUS8+GT7nSrFNLdjB24ZsLjg+LjLtksEpekWuKlelmqhp/Sy7SxPKD90owa6trfK/PmVwp4HG5MckGhv5v2iFttjQbFKnT4hnhO7JPiDwPIZO/tIM/0aruI2IS2WThrQ3ylFPaqCRM81k13UEfB2bjnBKn2TCSveTA1EMDM8Y4l5ywAoqOKBqxmY4f+5naWibTiDHgnptZZRc3H7LEXi6t4UkI9PXGi29kulzC6OKe6Ljl60qtVLCG8d0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fsk+YkPSxODgSN5GwAC2UdKRP3T7m/qaR838d4NcxyPJxk/BHCtphfohjRoU?=
 =?us-ascii?Q?mYAMnxX/ctdKDt66ead8ZmHETjbI1e+tv6noP6wCCttyn0bT49BHlayqObpO?=
 =?us-ascii?Q?K3nGxvk+Yh9GG7U+/lCvrsDjlMco2AzwzSOWvJiWMAv1iqrl5+9wdwHKX61M?=
 =?us-ascii?Q?MXR06VRRBmrn9FpA/+Y/oYp9LVs/A/X3qAlxgbZ1jcjM4G6mz3j4mP6KeLmV?=
 =?us-ascii?Q?HvY/Dz2G7hrYEil2vLjuyxxw5ndGlRKTTGy9PmqPlR4TAD9LSEl9lnfTUr4f?=
 =?us-ascii?Q?U34LbQdIsVtf4VcEgZWtTDj1FNVn13eHtZa/OSY/Ee0mTAuyQAnX6hiUBJuf?=
 =?us-ascii?Q?k8+WIXVf8NFinhKQCtV64WWk5H9ovgJO9yJm77aP7HzY/k/2MLxPUnQ6onmb?=
 =?us-ascii?Q?8s3CIq/jwa8vkr1EnS4D0etHiCv3d81OtkakcdPgEH+FB8W5hPxlR9LruNlR?=
 =?us-ascii?Q?w5BhweiUYXbY4WAb2NDIOGYbgGJ64XM9ngDZP+zTdENFPw5feX8QvDvzNjM0?=
 =?us-ascii?Q?HHD5uK5aNrzn15Pu2MmlPCeeprIEFG8jXuGZEFJhluXglYVG2PbnGAyOWAzZ?=
 =?us-ascii?Q?qIIKGuKEacQpOZiLOX+Yd5PBlMYKWDf5lRO+6tBGihDNlCHWovHrfVCHeeiu?=
 =?us-ascii?Q?56ZruSJD6esB6B1NdWUDJQr5OFciTJnaWCjwif3t5BEeiOq0s7O5cFPPLbjV?=
 =?us-ascii?Q?h/MU8OtBKS2hW61XNBCTB+5PS+vuncDg9e2s7KM8OPr34uGxWrxZtjZnb+QF?=
 =?us-ascii?Q?jMQt5X+4Ni+ziU4ftH9JFCu9qhy40xKZFih59oiHaAfHbFLcuV5PpxU+Is5W?=
 =?us-ascii?Q?hVblPN8uyAcIIjWesWrlIVpW0/4vL8g2aYvk5kUIaLmy6JYp/U3SgYREFg5W?=
 =?us-ascii?Q?AcffXKYnLWT9LcFI0mhA+2oFHlg50PUyPp5rCKazYbJarQ3qaRZwFCbzpucW?=
 =?us-ascii?Q?Y6kB8g0svidgjL0KjGrobIgVCVvfym4eNLEX7CW2YvbLogCbKFqP5yCMvAlH?=
 =?us-ascii?Q?jARbj5CJxVVMXGq+32n0IBByAvSyulS9I4n5v+Ff4o2TGiQoVc3hRwi4OTOD?=
 =?us-ascii?Q?aGEefiOzNtwCOLmYPDb5vPBz5le9fgv4sevDRwRU0QZosmfq01QkiGPgtEOD?=
 =?us-ascii?Q?2ySyDbJZRdVMycMpCtJIpi4i9jKiWh3yBTUMgQqRDDnQQLiFxWFd6XmiHH4T?=
 =?us-ascii?Q?AaubnthenDSak18eeYO8f4RsQLcj+a1muHb4wetJZTOA7IySn73snEfb+xvS?=
 =?us-ascii?Q?9g2XXocSQATw26WXG6qUDySvQk3d5IO9OuHauuZvMaiGzmctyuOJc6QxGm2o?=
 =?us-ascii?Q?5TztVmbyEP+iu9J92knRjx+M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efa65e6-c5d3-4819-bade-08d9052e5345
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:17.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PslE1jCIpa9S1g51S8OOk4VJ7UNY5T/mUWZadWsByXBrVW+DZoUhUu3a8SmJdDKBuEMmsdcEn+RilHOPNknyFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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

DMA map kfd_mem_attachments in update_gpuvm_pte. This function is called
with the BO and page tables reserved, so we can safely update the DMA
mapping.

DMA unmap when a BO is unmapped from a GPU and before updating mappings
in restore workers.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 56 ++++++++++---------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 49d1af4aa5f1..7d25d886b98c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -961,11 +961,12 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 	return ret;
 }
 
-static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
+static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
 				struct kfd_mem_attachment *entry,
 				struct amdgpu_sync *sync)
 {
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
+	struct amdgpu_device *adev = entry->adev;
 	struct amdgpu_vm *vm = bo_va->base.vm;
 
 	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
@@ -974,15 +975,20 @@ static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
 
 	amdgpu_sync_fence(sync, bo_va->last_pt_update);
 
-	return 0;
+	kfd_mem_dmaunmap_attachment(mem, entry);
 }
 
-static int update_gpuvm_pte(struct amdgpu_device *adev,
-		struct kfd_mem_attachment *entry,
-		struct amdgpu_sync *sync)
+static int update_gpuvm_pte(struct kgd_mem *mem,
+			    struct kfd_mem_attachment *entry,
+			    struct amdgpu_sync *sync)
 {
-	int ret;
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
+	struct amdgpu_device *adev = entry->adev;
+	int ret;
+
+	ret = kfd_mem_dmamap_attachment(mem, entry);
+	if (ret)
+		return ret;
 
 	/* Update the page tables  */
 	ret = amdgpu_vm_bo_update(adev, bo_va, false);
@@ -994,14 +1000,15 @@ static int update_gpuvm_pte(struct amdgpu_device *adev,
 	return amdgpu_sync_fence(sync, bo_va->last_pt_update);
 }
 
-static int map_bo_to_gpuvm(struct amdgpu_device *adev,
-		struct kfd_mem_attachment *entry, struct amdgpu_sync *sync,
-		bool no_update_pte)
+static int map_bo_to_gpuvm(struct kgd_mem *mem,
+			   struct kfd_mem_attachment *entry,
+			   struct amdgpu_sync *sync,
+			   bool no_update_pte)
 {
 	int ret;
 
 	/* Set virtual address for the allocation */
-	ret = amdgpu_vm_bo_map(adev, entry->bo_va, entry->va, 0,
+	ret = amdgpu_vm_bo_map(entry->adev, entry->bo_va, entry->va, 0,
 			       amdgpu_bo_size(entry->bo_va->base.bo),
 			       entry->pte_flags);
 	if (ret) {
@@ -1013,7 +1020,7 @@ static int map_bo_to_gpuvm(struct amdgpu_device *adev,
 	if (no_update_pte)
 		return 0;
 
-	ret = update_gpuvm_pte(adev, entry, sync);
+	ret = update_gpuvm_pte(mem, entry, sync);
 	if (ret) {
 		pr_err("update_gpuvm_pte() failed\n");
 		goto update_gpuvm_pte_failed;
@@ -1022,7 +1029,7 @@ static int map_bo_to_gpuvm(struct amdgpu_device *adev,
 	return 0;
 
 update_gpuvm_pte_failed:
-	unmap_bo_from_gpuvm(adev, entry, sync);
+	unmap_bo_from_gpuvm(mem, entry, sync);
 	return ret;
 }
 
@@ -1596,7 +1603,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
 			 entry->va, entry->va + bo_size, entry);
 
-		ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
+		ret = map_bo_to_gpuvm(mem, entry, ctx.sync,
 				      is_invalid_userptr);
 		if (ret) {
 			pr_err("Failed to map bo to gpuvm\n");
@@ -1635,7 +1642,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
@@ -1670,13 +1676,8 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
 			 entry->va, entry->va + bo_size, entry);
 
-		ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
-		if (ret == 0) {
-			entry->is_mapped = false;
-		} else {
-			pr_err("failed to unmap VA 0x%llx\n", mem->va);
-			goto unreserve_out;
-		}
+		unmap_bo_from_gpuvm(mem, entry, ctx.sync);
+		entry->is_mapped = false;
 
 		mem->mapped_to_gpu_memory--;
 		pr_debug("\t DEC mapping count %d\n",
@@ -2053,9 +2054,8 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 			if (!attachment->is_mapped)
 				continue;
 
-			ret = update_gpuvm_pte((struct amdgpu_device *)
-					       attachment->adev,
-					       attachment, &sync);
+			kfd_mem_dmaunmap_attachment(mem, attachment);
+			ret = update_gpuvm_pte(mem, attachment, &sync);
 			if (ret) {
 				pr_err("%s: update PTE failed\n", __func__);
 				/* make sure this gets validated again */
@@ -2257,9 +2257,11 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 			goto validate_map_fail;
 		}
 		list_for_each_entry(attachment, &mem->attachments, list) {
-			ret = update_gpuvm_pte((struct amdgpu_device *)
-					      attachment->adev, attachment,
-					      &sync_obj);
+			if (!attachment->is_mapped)
+				continue;
+
+			kfd_mem_dmaunmap_attachment(mem, attachment);
+			ret = update_gpuvm_pte(mem, attachment, &sync_obj);
 			if (ret) {
 				pr_debug("Memory eviction: update PTE failed. Try again\n");
 				goto validate_map_fail;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
