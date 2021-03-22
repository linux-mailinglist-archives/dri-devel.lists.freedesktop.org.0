Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E78343F3B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090966E0C5;
	Mon, 22 Mar 2021 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B06E11F;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW8IEqFehzF6tnete/0TAgXDSg1qU68biCHhpcF1KnRGgppTBHP1/yYyjoNrali4anBrEjNzZ0yJz/wv5Q15s+q0g/XDxoaiEhPIKHEW8nIzugGe8wU5SWpxe/x4+jgqmuCY93XrFI9Ly6W2rlfpzbpmXdLhqOLb+pFR88lNqepWLVrVz247vUQKoCpgl8Dh1S2RuXW2nWaZICXzyTH/d9FWERga08YupQEqlL9zooiIdMvr7bGERJe3ABgfGWFmqLU1k5CLUSae94KkKB2dXzLOX642n0U2YtA4tnr8smSc4ZZP3SJOBefdTR1QUEQK+ZOgplELEgW8mDLLDV0org==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4TUZyjnEs4AAf4tGf2dhJLnXpsdr0sRrv2Mc1wI4A8=;
 b=V0CE/UGTkRCc93fMGfwSmW+op9e2NvVEZ6PJjKxBoMTe+CfO2RMSRUH3LMHtAp96fPvnW9UP7R4aZDTPM4sBu08rL45qpKPocYfpinPMHWjagffm5xGyNF32kTBHcF9QGrzJTdwOkikigiovugK4168pTl9iPprktpwFfMGW68Zzqo+NAojxw87tpWOPWTQj0ioPfMSZtLuL9Q2ywUsiOnNN9ke93t09xiS3HC9w9vojcMwm1CRCXu+KFGMuGya+A3E624SpjtPePnfKwcwei4V11tPjpS5A/VhpxJbLgDwQsb3rjOW7u88DWfV0nbgzNlYncvuZ96zo7kkXKQO20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4TUZyjnEs4AAf4tGf2dhJLnXpsdr0sRrv2Mc1wI4A8=;
 b=z9kdmCTka7V243Uchy/qvcbY3Kl1f0W5+0KbjvaF5Tu6NHnc0nk9E6ibJVr6q7MLkBjhkb8oXDnTzojHgdJwPpSMd2blRNb8lhUbjKIsDG35UZVnwRMknShC0goTa5AkkBR4F7V8TJHl7mDYpQ/9sMDa6b0507ueWEf1R+logX4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:23 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:23 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 42/44] drm/amdkfd: Allow invalid pages in migration.src
Date: Mon, 22 Mar 2021 06:58:58 -0400
Message-Id: <20210322105900.14068-43-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 840e5017-3ff8-4726-ae53-08d8ed22bc1c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255D54C7D7E33F3652A75CF92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8xNFpO93iHYqkdHFcG2Ka9gxVqBcAQqoWE/ymtKL/H6Ia0HqoyZNBVSYWxQZHhIOhngShhvh6BfVe3FEnD6drYKo014UmGqaPrytC7tjR4JM5mgs6J6btVg+IRl5hRxlcj44IsV5DhI9uRjX0CaJgmWck8PFg3wuzckbOcW9um1zKDYRGFqq1Gwk51Yfa259ThT7zzSEOIBSJ8rFvNI1H1fVTcrKxMG11y3LAfGQo/73DE7wKPODXX5L5h4FngOXfUbjHeKTWYOoi2HRSLjCNkHS8HVYA+9XSg+h3HgjjsEV/IQETzpDJ8joaZOUJ/ag2d9iXYj0+2YpDSewosGkKSnODiKMvz8NjCxQEeo+kscjueRNaO6vMquDFSPHwSHhxR7QYODH8TXaZUJqSK8VMNjQ2kQHywoYPOWeuq/ErXWkxFm+TF6CzXjSHR1ex6+IN2Kvvovm8ory16iXk8dgQp4hBdfcT/XifBfuhJidJj/giFEKcQVLd05HkODmB5ZyMYAFI9IRnHY7DKe+W20gvwVj2impnY09Z5I+qFEMt2u3uQZ5HVHgqIhCf9aFFGvJjoAnhXiNx0BNf07c0UyoEL4TEmGFXckr0X04Cf43OGR+pvLGhicML4qmafEMmBG3ewHxo1I3xRetqV1CNc38zmmyiiTLq/VAluZJm2uzIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(450100002)(1076003)(36756003)(38100700001)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(8936002)(498600001)(2616005)(956004)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MSV3yHoLos7uEGP2WbWg2KHnyLrBr2C5Zu9h6+UQXegyqUaa+2w9QaWlxljX?=
 =?us-ascii?Q?pKfmd+wTG1G0MvqP++YrkbznlkNs8RBhSrRHgMXbKrikHGhKjXN7X2bmZCP1?=
 =?us-ascii?Q?SZ+1rDWs2ge4kkT/6sbAXAzgylyIdOeZ6NeuDeSFlAtbviiRf2hGi+foscjM?=
 =?us-ascii?Q?/9Z0o7eD+TiCn0AMzIQOqDVJyeOZ9wgN1D/v0YNDzS7Rfgl+tjGcTRymL1Y3?=
 =?us-ascii?Q?qpoBoKi1Ne8NE3OIOiLgUwEIpaZQBWc7UA8EgFmhsYQZrPvxjP/9OxUDaFr7?=
 =?us-ascii?Q?Z33UdD1NdDbIKq3gKEHAa2TQzG7zmY6i72Ee+0Pepy/DqEdZjQyWdHirXxYM?=
 =?us-ascii?Q?b6I+Vif3f2EV1ZXsTXg74IqZc8ldwvI8s71oDnlJBQ1wd/N7uUsIIY5/fXYq?=
 =?us-ascii?Q?YdaZufKkTdX0d/VIDpdHEHH2Q0E6J3yUwHMWiE9bHRJ/GKMo0yJDXiFBALSh?=
 =?us-ascii?Q?MrtGQv/gjIKQC5l9+CTMYL/I9KxbYnHdce454T70ePNYhIQKOGwuj1tFanoj?=
 =?us-ascii?Q?xLKsYguNKKVyQaB6tQHyJSHoFp8b/Obzf4pk+ZJuBfUpqDwA3K3D9xVwiOim?=
 =?us-ascii?Q?aU8794IGw0lTjh4oWyyLFrdLOOsoh18sAnshiA/fzdYpoetkCKQACoAQDHML?=
 =?us-ascii?Q?/WMgPY30lgd3TZqlRzWTsyFB8ZL9qL6jLlZ6PtCPOApevqLsWzARfu/GT/Z6?=
 =?us-ascii?Q?Hp70/Pks37B8IIs3Xi4yoLGtJgLX8QVPQNb3vjdF9OPZfRXCSGRN+6z8Mupg?=
 =?us-ascii?Q?Icuz7mPKgxsFzoy38ejBKTyJRwSmGJP3zF7MoAH4P+CtPjNRhu+b+5R5uiw6?=
 =?us-ascii?Q?DHuCnKVzD85D9ejMwX3SCTFcy9WJVheMFzV+4tx7UngJT9gBo3pbqAzJ1kre?=
 =?us-ascii?Q?/OAT77brFBJmhXtww/asHTspL+XrJcRFprUn4LyZf7RXDSexXbk6xntbxAEn?=
 =?us-ascii?Q?IyQEVirDDiYA6/k1HYo+4PvmGfWjhZmSHEpIL8oMF5nFL9kCAGdRR8SlihCC?=
 =?us-ascii?Q?7nLyf2B8gZ9COd/g68VU9ZYrGoLeLJeqxP9Lh0dl0JowlRRKkX5S0mUigzW+?=
 =?us-ascii?Q?vVgGBdnt0HgyTp3DTgFtqcesQINKKMlbGRHJOewnXn/0wF1Lm2JXga7Gc+jA?=
 =?us-ascii?Q?OMKDmpFMkRHfCinPtiC1G0mcTTn/043G9RFXVCOB4tNzeVAWBX7QNgKf2i+k?=
 =?us-ascii?Q?WLxLwEtlM1cV5wAK6wMSoGThsitd6OIKsUJdifY8Qg91MCzcH/XfCC0KAdZU?=
 =?us-ascii?Q?SRw18gMsgjkdBy9BcFbluyxyXpZwYh0hp3YnIXXFKbEnAPTTKnvU9pfDaWwI?=
 =?us-ascii?Q?mvrUtPBLD6GC5p7pgPREvBSi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840e5017-3ff8-4726-ae53-08d8ed22bc1c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:51.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgJ1QnFB3iyCWwUqVJdGH2AM033kEvmkpDURnWqXdcTg8aLth3KktTNnxRRwRGpO5idqF2MD479kBX/aQuTqDA==
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

This can happen when syste memory page were never allocated. Skip them
during the migration. 0-initialize the BO.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 50 ++++++++++++++++++------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 6748c5db64f5..87561b907543 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -310,7 +310,7 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	src = scratch;
 	dst = (uint64_t *)(scratch + npages);
 
-	r = svm_range_vram_node_new(adev, prange, false);
+	r = svm_range_vram_node_new(adev, prange, true);
 	if (r) {
 		pr_debug("failed %d get 0x%llx pages from vram\n", r, npages);
 		goto out;
@@ -328,17 +328,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	for (i = j = 0; i < npages; i++) {
 		struct page *spage;
 
-		spage = migrate_pfn_to_page(migrate->src[i]);
-		src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE, DMA_TO_DEVICE);
-		r = dma_mapping_error(dev, src[i]);
-		if (r) {
-			pr_debug("failed %d dma_map_page\n", r);
-			goto out_free_vram_pages;
-		}
-
-		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
-			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
-
 		dst[i] = vram_addr + (j << PAGE_SHIFT);
 		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
 		svm_migrate_get_vram_page(prange, migrate->dst[i]);
@@ -346,6 +335,43 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
 
+		if (migrate->src[i] & MIGRATE_PFN_VALID) {
+			spage = migrate_pfn_to_page(migrate->src[i]);
+			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
+					      DMA_TO_DEVICE);
+			r = dma_mapping_error(dev, src[i]);
+			if (r) {
+				pr_debug("failed %d dma_map_page\n", r);
+				goto out_free_vram_pages;
+			}
+		} else {
+			if (j) {
+				j--;
+				r = svm_migrate_copy_memory_gart(
+						adev, src + i - j,
+						dst + i - j, j + 1,
+						FROM_RAM_TO_VRAM,
+						mfence);
+				if (r)
+					goto out_free_vram_pages;
+				offset = j;
+				vram_addr = (node->start + offset) << PAGE_SHIFT;
+				j = 0;
+			}
+			offset++;
+			vram_addr += PAGE_SIZE;
+			if (offset >= node->size) {
+				node++;
+				pr_debug("next node size 0x%llx\n", node->size);
+				vram_addr = node->start << PAGE_SHIFT;
+				offset = 0;
+			}
+			continue;
+		}
+
+		pr_debug("dma mapping src to 0x%llx, page_to_pfn 0x%lx\n",
+			 src[i] >> PAGE_SHIFT, page_to_pfn(spage));
+
 		if (j + offset >= node->size - 1 && i < npages - 1) {
 			r = svm_migrate_copy_memory_gart(adev, src + i - j,
 							 dst + i - j, j + 1,
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
