Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937E343F37
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B2F6E417;
	Mon, 22 Mar 2021 11:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41FF6E0C5;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu7ukDqIuGb794u8Lub0ij7Ft1rHYCVHEGMRI5EVgrliKgBD600FsF1k8mU1QPVRJfi5GsF/zoPwclhyZh11ZGFJ8vq9mKV6cOJbLRSLVoKAe8rFAgShRr6Om50eLrKg2CyUryhGtvHHEaG7RmtWqrZ6VQE4BnCwL2A2j+7GZ8oGSRq7OQ9pwZHPFi+f9tyH5UKnhxuA2jUYVNrErm1YA/dR57NTYGF7uRh7E+x37JmNH9dbGsjAUv+pAJycLk2rJ2WDTS6WWMZ8sX6Czu/1/qI/ENAHFI/ePLqIZH4pEyUjaVYCESMhK/q+DrVZlmatGy0YnitFixGklRJj0It/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RIXm+RcZ99c0tX2BZ7PVXMjpQmls35a4G/yPgBRk1I=;
 b=UA+fPFa3l0pn+ts+y3sW+9AipHwESOtOQVF9/PB67edbsTjqNmE96CsCugpqY2lngCOmZMHtn7ZO67bNR3UZ8zlcn5S1gZ1GKbL0iOhW9L1KLUBmmnRvf8Hjbpx8Nx7WjoCJhkoPbNfofQW/GLLa5ChUMQC65/+sznNfm2QaJ4rDeVWfrilGPwtXn3D7Un+3Qaxk8mn+GPH0lpAgm2KfXeoYSwL6cAh/YuuO7hUfoAQfKsQXIMbPY5tW2oiuPZM2SJg2p0ZpwEmltjWFpJzsXTHqe9tcncc8J1pe08iZ5Kb3eSOHtzbmzlT9eLDwv5tUmZmzJXu/HkVH4uSnq1hA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RIXm+RcZ99c0tX2BZ7PVXMjpQmls35a4G/yPgBRk1I=;
 b=aNkd6q2/RB5kV9Gb7Gj3ywGuMl1UiQeW2AzNZ3hEiZOvdRUeDLeEeUgz9EXsmQ5+g1SeFulcB5arTA4Cu2gJFOykTKoaSZC76C8h4Qu7GFlYWtDGgVtkknXM0zYceHdcNMSoEc8U81CpibbDELBhy9kWNqWJGEl0ksSU+8YzAgY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:21 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:21 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 40/44] drm/amdkfd: Return pdd from
 kfd_process_device_from_gduid
Date: Mon, 22 Mar 2021 06:58:56 -0400
Message-Id: <20210322105900.14068-41-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e570be07-e5ad-4a40-6211-08d8ed22bb96
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255DEBD7682A9E72C057FA792659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPzVK1Do7DHcMoEyneqSeFtizynbkLyDt7lZfjQ+c7WHkgxbp56QEFCF0iOxlhSxTMCt26Lkizty84K3G9L6JuKCvRBNON8EK8B9UKnEwcP2dWhjbC8uZMj28FD4Z8J9Xjdia9a5m71YXwJZWiZampEHieVRzdkh0YsCPkaUFeF9l0lgcz4854WpH/c20IrAsJBGDB98HrhbH9eSjphtnYrFgLNhFOdx31ViZgcwbmo3zyc1B8n3ugFeCbfxXzpj60QvMj8vReqVoR859JU2SbA+r8yyY7aPz60AbRiz6n2WtQY08422F9QlwpN7WNVVIhy/1D/CfOz0uvVYKQdXgXeGTqJaAnYRhDJhL85XSNsVblkEej0RPsWasqze64ttjD+nOC9j/Q4SmnOYNBdM/qdkwd1gc1/n9KYOClHxRiGJsVFjt3uFRCJcyhtqa6Y7eKs+R53vKafr62wkBlbj1O21DpWTzwVqf9qs2wzHqn+OVp+6aAHX0tj8eo88WF5YqLqjryI3KDhrcAbHLeojbwBtfzpweCeK3kXxxYWJE5FlAkpmMS7suDH+ApiXpiHerY3ECqMB29K7fmjH2xdk+9NRpLJcHhmYw/6xmmPRADtoYG068sLvpiyMVlELxV4E+XvLyTn8aOorIzXArAaG5wjyZqxA7lxbqhUzFs0YPMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qt0kbarHi0vItPtMJo0b3HkntJ+HFBjEUCllWK/C1edyTQFADq2vR2o9QNmX?=
 =?us-ascii?Q?cihq/3EcnZh6sdk5JudT90Xwo9eg+3JcqDmhpb4ePFaJSZrqJMmUvU1bDmm8?=
 =?us-ascii?Q?o5/D/RcbSR2Q75u8ESMd18APuL5ITZujjdi1th1a4C9ZJP/WAsNosxhX8Ftp?=
 =?us-ascii?Q?Y6b/BnZEAfU5HMO4Krr4mU/JdgojineYd40rZyRuJQ1S1n8+yQwZ7CUWwrVn?=
 =?us-ascii?Q?nyipCpIxXYagpZ6E4OA+rFenq4agZieTneU4dULhML4t+OsYa/MFDOEILd+8?=
 =?us-ascii?Q?FFpsd77MPJsyhGsYAWAfJ8cNUtwlSPh71boieRMi8vWnDVvQOpkm0Hqo89ip?=
 =?us-ascii?Q?JMnNRAYE8MyjgRYZC0/mYBeC+mQe7ktWV5k6GczymDUJ/Tx57JZPKUbje7qA?=
 =?us-ascii?Q?yBC34eZCeP9tW584ML3fYuNg7NmQp8id+vTNps13nZ375WjYDD15q3p6HD1/?=
 =?us-ascii?Q?rxy5Dge0f3vZexUVLFfL8AWsVTBf6Ui53VOpPmSOJl3s4WAh4jhepZBBkDTX?=
 =?us-ascii?Q?E15roPpTLbfygkwfMD0tw8ltRjoiJqzTpdwY4Xqh5p5e/eL8IKVAe+nixJ8X?=
 =?us-ascii?Q?TAlPBsUcddFU9aPL5URAW8hmbevrZa/T3b6Eururidkmrld8tlrQ68i7HaY4?=
 =?us-ascii?Q?qru9BA1LdWimjY84/U5+tuTEEulr8serwI8pDnMWu+2A1XOayxg12ToC47Sr?=
 =?us-ascii?Q?1SexgRN6CxBQAvau5/ETQzXe5rwt0WfGXquQ9VHz5xJkBky9QzK0ODdzAMqO?=
 =?us-ascii?Q?NvzPxOknMlitPqy/99+No8iWJHx205t29bolJKLipIeKonq0mYCoAbs5j+/Q?=
 =?us-ascii?Q?r810fBp5zZuCF+b2zSgn/PdEToS3vu2V6bmOOA0qZs04ZIMEwpOKYnbQ7mQT?=
 =?us-ascii?Q?POdaeNKfeftst3dJnrIobGOsrTyh58lEZudZTlQK4eJHEeVksHBE71beFFSW?=
 =?us-ascii?Q?oyAzzgnFurgFazSc0wKkMJdej2FPAoZuesqcanK4MrPxNAI/c2oKALylPV1L?=
 =?us-ascii?Q?83AxMCYxr9htoybbimv5xJB9hDKNUegFp87O4zRyV8Nzzl7xBGriXSheveSS?=
 =?us-ascii?Q?J8xQT8GAR1TkPvdabIF7Fn2HRlR29vvs3RH8vE+spm8aLdX9hOp9hJZCKhQj?=
 =?us-ascii?Q?9kk6LOYR7O+hR7AeMQ23MvRv4dZT2XFxTQxCCgLWHjHbk88OXr295zYdNhMk?=
 =?us-ascii?Q?Dhi6yKu4+Uo5rQVOJCbjYoY/bwN+p5g1SKVnPrZ+hp/hWRl1+AzIO+AJ0MX2?=
 =?us-ascii?Q?eVt0ZjFeYRyJDPdv+xNMbhE60m85kxjWxvwHIjD/tqR+uWv+hCHUsQvhIDD+?=
 =?us-ascii?Q?GA0LaJPvGQvSbsV+bjhQqKiG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e570be07-e5ad-4a40-6211-08d8ed22bb96
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:50.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fap9uQqL86cWeeYavP67JR/8n/VUev9R3IOUC/8Ph/UMV7Jtlio8Ab8rVhTtax+wmr0qh96vWO5oPqlzEcGuzA==
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

This saves callers from looking up the pdd with a linear search later.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  8 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 -----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 51 +++++++++++-------------
 3 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 2ccfdb218198..ca44547c46a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -865,11 +865,15 @@ struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
 int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
 					uint32_t gpu_idx, uint32_t *gpuid);
 int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
-int kfd_process_device_from_gpuidx(struct kfd_process *p,
-					uint32_t gpu_idx, struct kfd_dev **gpu);
 int kfd_process_gpuid_from_kgd(struct kfd_process *p,
 			       struct amdgpu_device *adev, uint32_t *gpuid,
 			       uint32_t *gpuidx);
+
+static inline struct kfd_process_device *kfd_process_device_from_gpuidx(
+				struct kfd_process *p, uint32_t gpuidx) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx] : NULL;
+}
+
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 48ea6f393353..cc988bf6057d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1674,16 +1674,6 @@ int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
 	return -EINVAL;
 }
 
-int kfd_process_device_from_gpuidx(struct kfd_process *p,
-					uint32_t gpu_idx, struct kfd_dev **gpu)
-{
-	if (gpu_idx < p->n_pdds) {
-		*gpu = p->pdds[gpu_idx]->dev;
-		return 0;
-	}
-	return -EINVAL;
-}
-
 int
 kfd_process_gpuid_from_kgd(struct kfd_process *p, struct amdgpu_device *adev,
 			   uint32_t *gpuid, uint32_t *gpuidx)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c48fe2f276b9..081d6bb75b09 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -175,12 +175,11 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 
 void svm_range_free_dma_mappings(struct svm_range *prange)
 {
-	struct kfd_dev *kfd_dev;
+	struct kfd_process_device *pdd;
 	dma_addr_t *dma_addr;
 	struct device *dev;
 	struct kfd_process *p;
 	uint32_t gpuidx;
-	int r;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 
@@ -189,12 +188,12 @@ void svm_range_free_dma_mappings(struct svm_range *prange)
 		if (!dma_addr)
 			continue;
 
-		r = kfd_process_device_from_gpuidx(p, gpuidx, &kfd_dev);
-		if (r) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
-			return;
+			continue;
 		}
-		dev = &kfd_dev->pdev->dev;
+		dev = &pdd->dev->pdev->dev;
 		svm_range_dma_unmap(dev, dma_addr, 0, prange->npages);
 		kvfree(dma_addr);
 		prange->dma_addr[gpuidx] = NULL;
@@ -549,10 +548,9 @@ void svm_range_vram_node_free(struct svm_range *prange)
 struct amdgpu_device *
 svm_range_get_adev_by_id(struct svm_range *prange, uint32_t gpu_id)
 {
+	struct kfd_process_device *pdd;
 	struct kfd_process *p;
-	struct kfd_dev *dev;
 	int32_t gpu_idx;
-	int r;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 
@@ -561,13 +559,13 @@ svm_range_get_adev_by_id(struct svm_range *prange, uint32_t gpu_id)
 		pr_debug("failed to get device by id 0x%x\n", gpu_id);
 		return NULL;
 	}
-	r = kfd_process_device_from_gpuidx(p, gpu_idx, &dev);
-	if (r < 0) {
+	pdd = kfd_process_device_from_gpuidx(p, gpu_idx);
+	if (!pdd) {
 		pr_debug("failed to get device by idx 0x%x\n", gpu_idx);
 		return NULL;
 	}
 
-	return (struct amdgpu_device *)dev->kgd;
+	return (struct amdgpu_device *)pdd->dev->kgd;
 }
 
 static int svm_range_validate_vram(struct svm_range *prange)
@@ -1120,7 +1118,6 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 	struct dma_fence *fence = NULL;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
-	struct kfd_dev *dev;
 	uint32_t gpuidx;
 	int r = 0;
 
@@ -1130,17 +1127,12 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		pr_debug("unmap from gpu idx 0x%x\n", gpuidx);
-		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
-		if (r) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
 			return -EINVAL;
 		}
-
-		pdd = kfd_get_process_device_data(dev, p);
-		if (!pdd)
-			return -EINVAL;
-
-		adev = (struct amdgpu_device *)dev->kgd;
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
 
 		r = svm_range_unmap_from_gpu(adev, pdd->vm, start, last,
 					     &fence);
@@ -1260,7 +1252,6 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
-	struct kfd_dev *dev;
 	struct dma_fence *fence = NULL;
 	uint32_t gpuidx;
 	int r = 0;
@@ -1296,16 +1287,16 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
-		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
-		if (r) {
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
 			return -EINVAL;
 		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
 
-		pdd = kfd_bind_process_to_device(dev, p);
+		pdd = kfd_bind_process_to_device(pdd->dev, p);
 		if (IS_ERR(pdd))
 			return -EINVAL;
-		adev = (struct amdgpu_device *)dev->kgd;
 
 		if (bo_adev && adev != bo_adev &&
 		    !amdgpu_xgmi_same_hive(adev, bo_adev)) {
@@ -2334,9 +2325,9 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	uint32_t best_loc = prange->prefetch_loc;
+	struct kfd_process_device *pdd;
 	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
-	struct kfd_dev *kfd_dev;
 	struct kfd_process *p;
 	uint32_t gpuidx;
 
@@ -2360,8 +2351,12 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		  MAX_GPU_INSTANCE);
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
-		kfd_process_device_from_gpuidx(p, gpuidx, &kfd_dev);
-		adev = (struct amdgpu_device *)kfd_dev->kgd;
+		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
+		if (!pdd) {
+			pr_debug("failed to get device by idx 0x%x\n", gpuidx);
+			continue;
+		}
+		adev = (struct amdgpu_device *)pdd->dev->kgd;
 
 		if (adev == bo_adev)
 			continue;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
