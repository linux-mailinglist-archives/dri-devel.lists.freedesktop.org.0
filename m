Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54C343F35
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCDD6E416;
	Mon, 22 Mar 2021 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9C86E239;
 Mon, 22 Mar 2021 11:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncSTnM87+PbktwphdecS1YO1rh3Yxnp9WDAVeef9utxq3hVFq6yyj83hKuLeuvtlZxJXymSiGHIFUe6iXA0OlaBQSMy4eyH0VVTPK9iNU5nirpdVQfiCF+3BcahMIRv9pUExY/L0g+F+L+Wp7NkmJFbpT9tfXAGh4iHQ4ouwsSdYT4FmmrdwbpFVALNfCJlI0EsZWD4XYghPAvskww23YaIk9cfpO+GSqzIMDjW4IpFn9TrZVz45R2+xZHCOip2aAItN8z6PZ7YjKvdHU2JrkSj7J9qjlq01zuzPR5eNmc5GXmvjGLxNxr6NrOCpHZgdLityTxYvCY4+ORu1LQNdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73WwPGFnb6tZhN5DiEHDt8iZDiauT7Uyyo0XfI2bg8U=;
 b=OW4yuAT3SOiA88LTN9TRwLqXStYhzuWvuPwYHpolhHDBkuSa4R9rnx0IWdRYfRSVwRGrMLpw3OVdSXcdm5OayCSFwsH/Ow75bQwPsSms1AW9n5E9363RNLnOE/P5jtjxNSD4bom+dHrKF7J6aqccQ6DNaR44YUXB9o7mDZae0fDIHJxXTaQybtRaomknasa/EYtr5hBmChpaw2gHV2xoEgsnsKLHYRu4maFOt06eq26EOo/iWK7Edy9XhV4YCMTZdx0xGjCu+Yq5mwj+u43nkvNi4XGJ9QahxnM/kQtDSbeVk1hOq0/JeW1y5iIHGqhnGH1pRImzT5i6t0bOsl2dMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73WwPGFnb6tZhN5DiEHDt8iZDiauT7Uyyo0XfI2bg8U=;
 b=U8LJfkw/4UCGfufi9Zbxg6tXRsfAea6nVf2/1GDiViWnOyZB9VlL2H9kIzIX11flUAqMAxBb/C0KkreOWKHfdxxTFoFNs/ckwGMLCn1jfMNry447gaKtpYQBLQqWThwXadvmglHhuJ+Ebt7xe28y7N6rzL3Zk1SxA8MzEptdva4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/44] drm/amdkfd: Fix svm_bo_list locking in eviction worker
Date: Mon, 22 Mar 2021 06:58:53 -0400
Message-Id: <20210322105900.14068-38-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcf6a082-16ce-4a33-8e2b-08d8ed22bac6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255CA3D0E4A9D09404C973F92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bfZl8k6eHWmKUktqLbWqAdLj9rKpDkBj7Jn+nLxA4bXR2YYF8h6XnRuEDkFSOa4pmqGf0qWWEJ/Kj0teK4Uoc9AgKxkysI+62xl3AmRF6L1bBe7msk8TuWeS4vAGrMqTUD/0Ipzt42b/5Ox5rQzjttc4QIraJpClFNBLcc71jK7NMPElqkWB0vUJKd5fwW2tPJuhbVngDwjEjd6YX0tz9obI6tWwD1v5/quikTrvFvyCRJHXoVFmpI7jH49RIR+Gw+2IVPUCOLazciiXk50j/ffIa4c+Szkz/tUGTGKboE3HNJry+Gwf3Nu6JNtTBx8kaaY2KAg/mJdrlUGBzUBgE/i7ak8gF3qYPTrVFp4MV0UWrbBEfVoWO23vMq95Z1p+PLLanIlUmnRZM5WYazNiXBGDsWeuhuX8iiVqS5zrBRG1cW1tZOJxstzbHxlxB3fwL5Dd474JfRztGJQT5sHnyUnY5phCm18aH4xfkWHZhZ3b1xWODmRTjWu5KgjPXTi0IavAe3IXBLIPbQ+Yaq36LrHma/gC2iqPd0L2asiaZVxs4l3MUZr1h3L5i1vsXezW/rX+2DBCoCrC0XDm32OLdZvfBcmt+/YOOm3JybuCoWk0Usa1hmooUsk4mfpxKruV/mv8sgfcQNzSHl7mJ1YJQs81uqHrqZwYP1TZMaso0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nNO8T2Vb3mwrqcRDhyGsQFC4cuy2axJuz9Xn4AzgtGV+AfBb2sBdgNEwbf1T?=
 =?us-ascii?Q?5Q0ioTr6U/gSD8z8WTQSewxWm2kFcLOhjI+bQTJ9ySTnVhqt1nc3sJynYu3A?=
 =?us-ascii?Q?SYXii676UVoITEz7771O+FuOf+JYktlzEt5tHko+meGx2Oi6Fv+of7y3FIaH?=
 =?us-ascii?Q?kRVQvYFyV7/NM/FBydg+j4AGf9MgOhy0VD0nbVRSJWpgV3yn28OfnS3OJazA?=
 =?us-ascii?Q?vc2HalMxGpQ1xfZ2HmlJ+oKM56+DJIW4KW3Q6cQdEwZ+6AhvgSq4GJivPSuH?=
 =?us-ascii?Q?9jds9L6M8zmfDfirJOqv6rgIlrBqSZ0UMj8BqLPJGQYhBfC3cN71zjO7aHt6?=
 =?us-ascii?Q?CfvV2rbF9Zt5AsIYB0u7cAH/2xke9jlkx97n8LOLvKnoptDYjKqQUJJVk6aZ?=
 =?us-ascii?Q?2xeFRrXT6HJ/VqbHAYdcXQmD2v3uRT6F2f221+ekUTYNqPqtGsSX+wSc3pqB?=
 =?us-ascii?Q?ZVF5GaaOSzgUCtnaKRDfAvDZdpAyMbJyFJRCFW1eg2kZ2kcLeoaAZnkm8waE?=
 =?us-ascii?Q?dB422GDPmvtEvbt9KkM+V6m6x9dtZzlhJxt+p/ln/Fi1S9JKx3toeUU+PnVM?=
 =?us-ascii?Q?y0ArNPOgDP+U6BhcLVIOuZTwuCD+QPahhDN+RwqqdKSw0sCwzcHrKc5L6Enu?=
 =?us-ascii?Q?QiandhqfGbRDy2FaMjvPPTuK6k72khS5aadUcejX74M3LG5QjjeGP4VN7ydh?=
 =?us-ascii?Q?5rXk/SMF9OqbixeqxUX8d+SMmni6VHaoMsNNYBblaQf1kLLsA+AxuchtMy5b?=
 =?us-ascii?Q?yoLy47mVvO6Wd7qoROcke3Y/7pLvY7bHaqw7g0IZuYREG8GjTNOBg0DeSM2W?=
 =?us-ascii?Q?y/B1zpMOgA3ajHIJKTTWL9oUXilJIvjSF1qEuAV3AXqxVi96t6eM0hSaG8RI?=
 =?us-ascii?Q?BhBMqyzE5BbXi7DlMrMogkvOck3yYP2/k/dIQF2rJZsZbTk+CPDt3yTWwRp2?=
 =?us-ascii?Q?jfxXbU+yUVHUTABewzZF3FXbuCORJUIkllKY07l2mJuUYFbxDFT8x7UJsffd?=
 =?us-ascii?Q?xUHl97CKYPyU9ld1xlHtXy8s48LOeRN4q2SfG7MYBmxXkhOkG6BbWlNmJBvq?=
 =?us-ascii?Q?qh8MCQeqUDXqAFOtozo6FK5elJEKFTC0+Izs1+zuFwmUUJ7uvYmQuA1TkCkn?=
 =?us-ascii?Q?SlKzc/kbxQRL5h/XUXz7ueVk8Tdsl+j4ow0zA39IByn9iaWhdXaJHisBm1I4?=
 =?us-ascii?Q?d8iXBoTDseDDyoJNBcdbRKs2ISAQNyKYroUDWNeEd5XQ0XRW4K9v4/pA6D7w?=
 =?us-ascii?Q?6zAPDSG03FuoVuYQptxvp9K6PpIMnswoNGpRsPkm/iO5X2iIFeYibZoly8R9?=
 =?us-ascii?Q?tJUXWDQoaLmldO3NmSBHxdAw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf6a082-16ce-4a33-8e2b-08d8ed22bac6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:49.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjpoN8B9qS8NqYcFS3gGlGZQ0EOX2gmyxliEY4Eo3R0a86sl//zNPSghVIPRTkO72hQcwIwpRT7dBywjkQHZMQ==
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

Take the svm_bo_list spin lock when iterating of the range list during
eviction.

Change-Id: I979d959e06c32e114cea8d151933b8ee7455627e
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 49aca4664411..3a7030d9f331 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2494,7 +2494,6 @@ int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence)
 static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 {
 	struct svm_range_bo *svm_bo;
-	struct svm_range *prange;
 	struct kfd_process *p;
 	struct mm_struct *mm;
 
@@ -2511,13 +2510,29 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 		return;
 
 	mmap_read_lock(mm);
-	list_for_each_entry(prange, &svm_bo->range_list, svm_bo_list) {
+	spin_lock(&svm_bo->list_lock);
+	while (!list_empty(&svm_bo->range_list)) {
+		struct svm_range *prange =
+				list_first_entry(&svm_bo->range_list,
+						struct svm_range, svm_bo_list);
+		list_del_init(&prange->svm_bo_list);
+		spin_unlock(&svm_bo->list_lock);
+
 		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
 			 prange->start, prange->last);
+
 		mutex_lock(&prange->migrate_mutex);
 		svm_migrate_vram_to_ram(prange, svm_bo->eviction_fence->mm);
+
+		mutex_lock(&prange->lock);
+		prange->svm_bo = NULL;
+		mutex_unlock(&prange->lock);
+
 		mutex_unlock(&prange->migrate_mutex);
+
+		spin_lock(&svm_bo->list_lock);
 	}
+	spin_unlock(&svm_bo->list_lock);
 	mmap_read_unlock(mm);
 
 	dma_fence_signal(&svm_bo->eviction_fence->base);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
