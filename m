Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2DA343F3C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7766E11F;
	Mon, 22 Mar 2021 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AA36E185;
 Mon, 22 Mar 2021 11:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQV4PpCK55auiYme0lHr2SvaKnBs9Tw/MP3VXMVy3Q2b9VMQQgc4AhErXj2sElz077+AE6mlq7nj7qfXz7Td6erf4ynQRb3GRuJEkMoqbDAvC/y2gVgHIJEUiBRUdtTjDeEqBNl2KIi/YBY9SJxTZVy1LITHj7DS02mtCZTJrroeJy3fuxQU8pYUcEJE4OgE7lAh0RwoTZLOnrliY30Ote5tgD+gLrSYnHPJkuPX9VXlNEjMGeRWkvC0j8D4d44PrmI4DihdHx3CqeVRABqdjlYj6LrEVN3XX3FHrDehfxfN/rnzL2ffu3JqwOkHB3UfDd9Kb/3fayTW+21mCB1ICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN4tz8cNX6WVe/mLrmsJdfxYKxUfO/5nj+k1b953QSI=;
 b=nlxPGEuKTF6S15wTRZSinrwgrY6wMWFIcbAvc+fZvh6J+aeohdOX28fbOnmmOy85UyP5cxvoD3Pr+fCVsNFMhePNH4IbDwKJRNK61xRuHcNnQkKELTD3shEjB7rwfBYygEd73us+Y1Arr4ti+Vi5iNA3+rvlTwLgJ9eaE1soR3+Jzfh3TqflVu+q+rmlVbLdMlchRwFSKxAg5MsMrLriMVQ6bcoP2DXjxqWci6oznJBmai576goktkYENOCS9rU6oht3hGtgbwUgK7AgJNluvgUIPGB0MKiSauqO5iopdiqzH0SpQdPOH1YjsnDsMEruiae1hlYqX4NNDenVfE6/6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bN4tz8cNX6WVe/mLrmsJdfxYKxUfO/5nj+k1b953QSI=;
 b=QjKbHZTo+lIFdQnk5DRZRsKutmunGR+/wDUMcPQsQpvdjWyaf1Wm7p4dlJqDeomeIma8P6gmMV5ShfHtGzWSARMoOabZFSeGsIulNzSvn28gMKHsTDzioo2OAfwiGzVpAVSO1Hl0R/CKrJWOd6Yg7qU+pLNr8xFTppyVJ2DSUlw=
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
 11:08:20 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 39/44] drm/amdkfd: Point out several race conditions
Date: Mon, 22 Mar 2021 06:58:55 -0400
Message-Id: <20210322105900.14068-40-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4159afca-a365-4632-8646-08d8ed22bb4e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB425533C9E251CE6AB11C350692659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F66uq32gxrIznDpLIhxIr/+A7VXZzo4OLlhCnr4VLmmXL4zTVA9CWkG6YnRBMI46c8gX+TAXsjOHdZoiIMdJ5tMPmXFGrpEzGaoHU3YaseeSGYkeZgdVCyIRzCGpnLoIzxSz0qwC3UnOH1azLFaivnNAr+I9elc/D+APo2exy47AhW5G/leuBpa/5c2J9NMU/OlSphLNaTNQWOSDIMfvOm6lddvtLyiUVzVY9i6wA2rqTFe13cCl/lGAGPoZc+xJ9vdY4whEP0SPO3qMyAh7UkSwrvvWq5ImRCATMG0oYrn3rv505Xe8GFuuAo4kY+pg/Jpk9C+P5CmmHbsCGySuXS8+vRuBXR8CKlxZSuEYzaYFFSrv6iEzdSzUhw4uymDBAm37Zy1Ij2hvG6iG/h4Bsv4IkOUmr/OMgBF7+wMOiU0Mq0MfPQakPQhO2qZjUtoFWwRN7MvtfwA9x1HxTGcLE6NP8lw/g7veusgSLMfXxhd2Xl7tt+f3tB2fyvNn4om78LgNYg0IAyumhvXArqTWwYo8pASE7kKr/SgQyxf4lmq64Hll7ZLfU/3cruz6L2bKwctVoornym6vmZy1Poa68Niht2XKrBGGDzucEekF0Mo99GeeQmK1k7xn3GnQhLGnlYHFeQWqS3nZmMVQANtpdLoZVWqORm5C+/nKJBe5X7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2fUaomc/1LeDdQo3dwCOTq1cXQ9OCJ5qv3XVLD5vcPrFSjRfURweagMdgcTk?=
 =?us-ascii?Q?ProOhg+M+dAgwaXY6IyMCOZaaCjlp6QwuGVbXAAOD8GNyHeq8fvt6PrTg43a?=
 =?us-ascii?Q?2163GeSrw2SKTRSMMcvi9yVeJGxtDJsl+fnCfZGDqROTJRxcinWFpdj72rYf?=
 =?us-ascii?Q?WdoLRVMv9Ut68BTvcQ+/d8U+eon5e9T6hplH3hM0g76GCg7nAeqb00BvdjJz?=
 =?us-ascii?Q?jov7FHliM7Sk49fiWSNzKOIuOgtM6S6FwmGKzOM7S/xpDpgefsMVGenwMyaw?=
 =?us-ascii?Q?+JJW6wEMI3DYo91FTUlArW9nL0EZNiSfvarBwDrecIAmCd5qFbz/LTWxcccr?=
 =?us-ascii?Q?pPELKkXExyEfkhMoztpLrukN1FJFcIVO2Lu+FRSdR0vtL8DZqJEbq6pnJGWf?=
 =?us-ascii?Q?vsu84yTeJAmwvDbLqs9gsagO89rmJZlUyaUdyg7tzAJrrE4PfI4vQxW79Q1l?=
 =?us-ascii?Q?8mg+i7cTrCS/Yg8HCTCEbOepWepmyGZIpeuEHMqM3BImvvkJYBU2DQy1ixrs?=
 =?us-ascii?Q?+xqj8GLMNLkBRlFmnKro4kH/4UxwxZt9Rrya3Id4P2yPXz599B647qJwBuIC?=
 =?us-ascii?Q?MhY3GoNO5F7K/2LTURCoFxaplSRGL8LYjXeJt79lwz+xL7VH9EkWMW+80H/r?=
 =?us-ascii?Q?J+HUETB3wK5i/YjxsjQaGzebUQeeqvWpS9mT6nrjizdAwFKX4azV+RtGexWN?=
 =?us-ascii?Q?07M0M9c2OXjN/Zb7MfFire7ZsR+xL1cbI44trCKsh7mIV4/JjW02KhRVdn3Z?=
 =?us-ascii?Q?cw6Fe05v/AUX1Zy/32dOmzqYsMMJ7LMFLlgU0MOTkn/CQfbuScIXoA7nCVQX?=
 =?us-ascii?Q?loTHswIfGZpEHtuJhCJy7q2C2VFR+7dBhRIIOwBp9bT+sEzsCZCGLRu6XAjn?=
 =?us-ascii?Q?4ro9eS9aJV+UZFxxM1uwsOmjd8rHNv0aklHkTenH+/eeBUZ7etZS7477pbpq?=
 =?us-ascii?Q?dx9fouDT7g5QxaRmxAs+Q4r6hL9JlSr/ND5B2DLZj1J+xdZYv21nhU74agio?=
 =?us-ascii?Q?vP8vDo4YqUltRz8x1qjtHF1qB1szD2ohP1W4IUpGasQ70VczgF3QlWgquSsq?=
 =?us-ascii?Q?L5jDzLvkgwr4eEFZvz2jdUwFZ5WKf9pdlIGGLkmok/EU3s0uagLPY9wqmSLo?=
 =?us-ascii?Q?UOWjeaEcqZgPSbeqi9K2gsXWR3wkwmiFs63mbMnauslmUHfdoLC51h17KpX3?=
 =?us-ascii?Q?/XeGV6WVHs19TdYWaKmMI0a8tTnRaZ7n1HWNNRpRwDIefgEmZo1pDrx9kl7s?=
 =?us-ascii?Q?3PEZVUA1A63DPKdiNjaWKTzoKPD0YlHclz+SUwUOoRenC8XNA2f18vXkNwtR?=
 =?us-ascii?Q?/LrgmDWaCnZRO66pPwp71+x8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4159afca-a365-4632-8646-08d8ed22bb4e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:50.1595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCX5lr1QlcgCzWzBmxWw+2P8J81n1UWmA5+1M8g2vZ5pN0obng4fShfWMZSE8WKYEOHGmYGnpVaNcmfQjlimHQ==
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

There are several race conditions with XNACK enabled. For now just some
FIXME comments with ideas how to fix it.

Change-Id: If0abab6dcb8f4e95c9d8820f6c569263eda29a89
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  5 +++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 5c8b32873086..101d1f71db84 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -539,6 +539,11 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	src = (uint64_t *)(scratch + npages);
 	dst = scratch;
 
+	/* FIXME: Is it legal to hold on to this page array? We don't have
+	 * proper references to the pages and we may not have an MMU notifier
+	 * set up for the range at this point that could invalidate it (if
+	 * it's a child range).
+	 */
 	prange->pages_addr = kvmalloc_array(npages, sizeof(*prange->pages_addr),
 					    GFP_KERNEL | __GFP_ZERO);
 	if (!prange->pages_addr) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index fbcb1491e987..c48fe2f276b9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1727,7 +1727,7 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 		pr_debug("update and map 0x%p prange 0x%p [0x%lx 0x%lx]\n",
 			 svms, prange, prange->start, prange->last);
 		svm_range_update_notifier_and_interval_tree(mm, prange);
-
+		/* FIXME: need to validate somewhere */
 		r = svm_range_map_to_gpus(prange, true);
 		if (r)
 			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
@@ -1744,6 +1744,7 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 			 prange, prange->start, prange->last);
 		svm_range_add_to_svms(prange);
 		svm_range_add_notifier_locked(mm, prange);
+		/* FIXME: need to validate somewhere */
 		r = svm_range_map_to_gpus(prange, true);
 		if (r)
 			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
@@ -2068,6 +2069,14 @@ svm_range_best_restore_location(struct svm_range *prange,
 	return -1;
 }
 
+/* FIXME: This function can race with MMU notifiers. MMU notifiers can
+ * invalidate the page addresses concurrently, so we may end up mapping
+ * invalid addresses here. We cannot hold the prange->lock (held in MMU
+ * notifier) while updating page tables because of lock dependencies,
+ * as SDMA page table updates need reservation locks. Only unmapping
+ * works without reservations. May need to hold the mmap_write_lock to
+ * prevent concurrent MMU notifiers.
+ */
 int
 svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 			uint64_t addr)
@@ -2592,6 +2601,16 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			continue;
 		}
 
+		/* FIXME: With xnack on, this can race with MMU notifiers.
+		 * They may invalidate page addresses before we map them.
+		 * Then we end up mapping invalid addresses in the GPU page
+		 * table. May need to find a way to still hold the mmap write
+		 * for map_to_gpus but drop it for validate to allow
+		 * concurrent evictions. This will lead to some retry logic
+		 * and the need to protect the update list differently.
+		 * Maybe factor migration and validation into a common helper
+		 * function shared with the GPU page fault handler.
+		 */
 		r = svm_range_validate(mm, prange);
 		if (r) {
 			pr_debug("failed %d to validate svm range\n", r);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
