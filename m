Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0654098C4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E3C6E1FB;
	Mon, 13 Sep 2021 16:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAB989801;
 Mon, 13 Sep 2021 16:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+aSiqO4FkJXu9XP+Iiw5SmtZkSgEpGPQjV1dNzrohWffpWdaxKTRpAR1//UUK5n4IcSuWqJDg6sxabkGCjXw2E39679RBykmuxvE4pgZEZq6NuTQBRQZnQl5BhbjqQWxO9Q3OzZIzXfIUJqwe+UrNlGDwT+hY78l7MLbTp0j8JD0oRhS50yF1JtSGfKy4jQyflx1P+0RiaD4d4whnrhzSsXtOFG0RSE+z1mHBSb3Nh13GY3kR/N6ZQuLqM3WJbIqIZIExkaQjZGhIfq6O6sG4y/bot4Cc1h9jWwlKS3WLhy36Z2Vzr2Wm5TUbxBnpCyE7kWtIa8YLpav9zb0cMqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=leJttb/LFh2M/wzwUmywQ7bX9zYZjJvBAUyOE4AeRxA=;
 b=UGFSojk5QxzkXgucMAWWP8YBoQVIcuz7rnpBtkG3D46jVuHe8Lgkn+tVuO7LvKqu0NF9ZqvD24pQCpW9I1k4xIjmou0hVb/d+MR7FCmcoW0I1VDFbiaoNCdsEtixHnk9KZ9RYON+HEJJliaiHK5dXkz3Zn/S1g80MeEnfCZBDNzZWMKLZrfC/TNqo8Tm9lQ+g5b2/mqYG0qlNlcyPbLCZzccbhtDwbcuBOaTeHW6BjixfzJ7LTkr2Z9yoi6sqc8nNOgX81ReePzNeUQm/4SvU3uce/yisHiDzWd1WfIBH1Q3fQq+YeP2ODYS4YXZoXltTyAuI8r/M5Ac91pCahq4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leJttb/LFh2M/wzwUmywQ7bX9zYZjJvBAUyOE4AeRxA=;
 b=kFruh0RMEebHvQ3VZr7j+Oh7fbW98q0e7E+6JwgrW32uCnlO93MFOiGBQgM/Lq9SCaJncjalcRT3xUB7hvHMoscCzdXlsIWZVAG5Od5Y41+qQu7aT6Ug7IIom51gBW/qg5/uvKMEz4neVBEli+5qdqY2FtbPoPh2QvD4ZUCDhIg=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:6c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:16:26 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:26 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 10/12] lib: add support for device public type in test_hmm
Date: Mon, 13 Sep 2021 11:16:02 -0500
Message-Id: <20210913161604.31981-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f12efe75-001d-4a5b-b878-08d976d1d5cd
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2719CDB3B3DB98F9749CCFBCFDD99@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTgQ5l/NOhik3UqQFbw/dM1/2OvedBQTuTrlcp7NU8JarKpKc2ZWWWNCXGDRSFStVnD0LmE0RmWnWjH1ngNgxWDadTOpQ01Con/yegHlzzHpFArduhHSuPa+mWE/NJBgODwMeM9Bf23XufgeMRt2pnTBFKEjLdh9zoaijqHPQ9CUp69FMf8xUugjz0URsULKlEkb967Myx6IDNdkTTQXJw02h/RCiWDz5ZmHfftzpEv5fQaK4K1ZuqTX1uodQawPZF2kZOUtHhBEcN400c8FzHDUNrMtjiO4BLCIyaMytDkrxBGZUwQU2A6pYbfurPNhnz8cp9yuk3LXvoLYsz4+GM8uPF0rdE5wqDxr+AaYkiuuT4IDBlsVC9IJkxNnLe9JXa+0vcrUAvuHAdv228Uy+EdxxUqSqmqht9/TcSmLqGSZALuBCRecAjg5vy+dLaFWYzuV2moGIg9ZSwK4iroz142ehaPEkJoQIITOYi7CSedMvpGVBbSktixcrx+OGqQwmEvvwIgOuuKMV0u0Xt62GjoydcfvCLSy0SiCqMCGzhITYdb8mXIIlm1tmpY57oByoxnENwoBPS75nm/At504lS1CLDpY32L2P/wuaiQLWfu1f2dVhVtvhFcR3wx6z8aoxdhQ8KpT3OPD7/WpWiyYHZMVVxz45kCr7Hm8TBJi4D3bupG/JDovdLaKOOBdwJK1Tp/zIKILHGoN3wAS13inGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(30864003)(6486002)(316002)(4326008)(956004)(2616005)(2906002)(66946007)(5660300002)(7416002)(1076003)(52116002)(26005)(7696005)(186003)(478600001)(38100700002)(6666004)(38350700002)(36756003)(44832011)(8936002)(66476007)(8676002)(66556008)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FbjCKcXzrIroX9/4tvj9ZReZatnpI+OtZlbxoD9Cj2nYoPvxRT47KkoXnkRt?=
 =?us-ascii?Q?AVWKHMq0VKmrOxKtIULdyAKJle5mJx/ZoqIM1UXT5S2aVx42fsrY1zVG9eV/?=
 =?us-ascii?Q?HrKdTHuSPfRiOew/XnrXs+UdoJhRtRepkTG0mWSlx/XtCzxG3EtDJSgcI4is?=
 =?us-ascii?Q?/ru4CsmdJJEmZRVIMbl4NfMq+Yy45Q1jDU+YHWnUNzjDRYN/CMSNvSBzQ3zM?=
 =?us-ascii?Q?onaY1c4KeBj4dXlZaGxmwVPLgJLVpAr3uOYmL49SR7VHLcqFOuix4vj9Hn0m?=
 =?us-ascii?Q?q5J+qm0vnW22flTBgKtH3UxzD82FjdT+D3W3w3TQz/m/wo15DGKjzI65v00p?=
 =?us-ascii?Q?2qeCbne5K2KkqeYqzPNzbK5yFkeBBkTL7imFViOntkKY+2j+syFfZ/ysgtYz?=
 =?us-ascii?Q?YtUk1jGTUW1PsmBexipRPEtlnOkfnDOVLpBge2ejxP9nJyW28Mvyo41B+JP7?=
 =?us-ascii?Q?Yyp3erDGIFRc0vgInTuExqadamZEv1u4q1Vx4/XlyKmHU14r0bw4hcS4Od8M?=
 =?us-ascii?Q?G8byAHcQ+svUGK/O0/zJ4r9HkISYUeI7DkxSuhV2viOHwRntDKHBsaRwFlEs?=
 =?us-ascii?Q?zZQ8V9L4HYbBh9vUVAXqiYGd4MUitJA3XtJgRzbk74MpdZ2ospzP6YDmBsmo?=
 =?us-ascii?Q?TYwTl0+zliyOXJ/hAB29wqIwu3fwedA/iEcu/h5F7ycII7UeFSwWyjHwO7VO?=
 =?us-ascii?Q?FzhN0+bty57TcP6Ku4feSFX7XC6zOGpR++fyZtkjwjVOUNdIguXZQpg6dDR/?=
 =?us-ascii?Q?wjrirgWSxX7CJkVwBBAqq2ueSgjgMK16B6XuAvsYB1npwoFTmKiawD7B8Fa+?=
 =?us-ascii?Q?/EZiC0v+HD35JcBmY3FLkBdbiQZ9c0hlMrsJxWNppQX8c2S2f5ladklefqA1?=
 =?us-ascii?Q?2CjwLvLZqTgPhvDLMsvrpUs4klCAhMrSmQgbUxb/hDAgW9q7yJ5UatfS/Uwy?=
 =?us-ascii?Q?NTHMRs9nKRe62V9VKeVilbjW6Ry12m19ptMNMf+Hs909guMKmTSXSC8IgzkE?=
 =?us-ascii?Q?HvRKAAdIaLiRyLmSy8j2vAU8GWqES5x3w1IQZUahTaQhET6rFcVh1M6HalUu?=
 =?us-ascii?Q?3RuFCg+UATQg9QImUfbC4SUhmmgHfzq1vI/bXSv2kSWo8VQxNOuFcvufOJ+I?=
 =?us-ascii?Q?peFU5hpgW8ip6Vp1NFcmOLxrJSoIetQyfxgD/QC93wSG/TUr7FfOODv3LwWp?=
 =?us-ascii?Q?lwrHWIWrSy1urwSkJMrraVkL1MLOmJ304rns2+kSJUEHbBx+dTlMtDOR9JD0?=
 =?us-ascii?Q?fmgSjOEtrCbJiB/AIx3Yi0j1WhIZNEqcJ5yBUDwLpmJvOuY5uXAN6oZGT0A9?=
 =?us-ascii?Q?Wps51J/dIBrMaKXqnDk5c67F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12efe75-001d-4a5b-b878-08d976d1d5cd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:25.8609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRyimG5ejx3XyLqu0a/k+XfU8+dBDKf9H/fUHyNA8BQjkYl6NnCLQ3PA7fvYI5rHmiH1nJxEzbkcQiJdB+RfVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device Public type uses device memory that is coherently accesible by
the CPU. This could be shown as SP (special purpose) memory range
at the BIOS-e820 memory enumeration. If no SP memory is supported in
system, this could be faked by setting CONFIG_EFI_FAKE_MEMMAP.

Currently, test_hmm only supports two different SP ranges of at least
256MB size. This could be specified in the kernel parameter variable
efi_fake_mem. Ex. Two SP ranges of 1GB starting at 0x100000000 &
0x140000000 physical address. Ex.
efi_fake_mem=1G@0x100000000:0x40000,1G@0x140000000:0x40000

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 166 +++++++++++++++++++++++++++-----------------
 lib/test_hmm_uapi.h |  10 ++-
 2 files changed, 113 insertions(+), 63 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index ef27e355738a..e346a48e2509 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -469,6 +469,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	unsigned long pfn_first;
 	unsigned long pfn_last;
 	void *ptr;
+	int ret = -ENOMEM;
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
@@ -551,7 +552,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	}
 	spin_unlock(&mdevice->lock);
 
-	return true;
+	return 0;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -560,7 +561,7 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 err_devmem:
 	kfree(devmem);
 
-	return false;
+	return ret;
 }
 
 static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
@@ -569,8 +570,10 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	struct page *rpage;
 
 	/*
-	 * This is a fake device so we alloc real system memory to store
-	 * our device memory.
+	 * For ZONE_DEVICE private type, this is a fake device so we alloc real
+	 * system memory to store our device memory.
+	 * For ZONE_DEVICE public type we use the actual dpage to store the data
+	 * and ignore rpage.
 	 */
 	rpage = alloc_page(GFP_HIGHUSER);
 	if (!rpage)
@@ -603,7 +606,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
 	struct dmirror_device *mdevice = dmirror->mdevice;
-	const unsigned long *src = args->src;
+	unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
@@ -621,12 +624,18 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * unallocated pte_none() or read-only zero page.
 		 */
 		spage = migrate_pfn_to_page(*src);
-
+		if (spage && is_zone_device_page(spage)) {
+			pr_debug("page already in device spage pfn: 0x%lx\n",
+				  page_to_pfn(spage));
+			*src &= ~MIGRATE_PFN_MIGRATE;
+			continue;
+		}
 		dpage = dmirror_devmem_alloc_page(mdevice);
 		if (!dpage)
 			continue;
 
-		rpage = dpage->zone_device_data;
+		rpage = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (spage)
 			copy_highpage(rpage, spage);
 		else
@@ -638,8 +647,10 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 * the simulated device memory and that page holds the pointer
 		 * to the mirror.
 		 */
+		rpage = dpage->zone_device_data;
 		rpage->zone_device_data = dmirror;
-
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
 		*dst = migrate_pfn(page_to_pfn(dpage)) |
 			    MIGRATE_PFN_LOCKED;
 		if ((*src & MIGRATE_PFN_WRITE) ||
@@ -673,10 +684,13 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 			continue;
 
 		/*
-		 * Store the page that holds the data so the page table
-		 * doesn't have to deal with ZONE_DEVICE private pages.
+		 * For ZONE_DEVICE private pages we store the page that
+		 * holds the data so the page table doesn't have to deal it.
+		 * For ZONE_DEVICE public pages we store the actual page, since
+		 * the CPU has coherent access to the page.
 		 */
-		entry = dpage->zone_device_data;
+		entry = is_device_private_page(dpage) ? dpage->zone_device_data :
+							dpage;
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
@@ -690,6 +704,47 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	return 0;
 }
 
+static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
+						      struct dmirror *dmirror)
+{
+	unsigned long *src = args->src;
+	unsigned long *dst = args->dst;
+	unsigned long start = args->start;
+	unsigned long end = args->end;
+	unsigned long addr;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE,
+				       src++, dst++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(*src);
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
+			continue;
+		if (is_device_private_page(spage)) {
+			spage = spage->zone_device_data;
+		} else {
+			pr_debug("page already in system or SPM spage pfn: 0x%lx\n",
+				  page_to_pfn(spage));
+			*src &= ~MIGRATE_PFN_MIGRATE;
+			continue;
+		}
+		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+		if (!dpage)
+			continue;
+		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
+			 page_to_pfn(spage), page_to_pfn(dpage));
+
+		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+		copy_highpage(dpage, spage);
+		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+	}
+	return 0;
+}
+
+
 static int dmirror_migrate(struct dmirror *dmirror,
 			   struct hmm_dmirror_cmd *cmd)
 {
@@ -731,33 +786,46 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = (!cmd->alloc_to_devmem &&
+			     dmirror->mdevice->zone_device_type ==
+			     HMM_DMIRROR_MEMORY_DEVICE_PRIVATE) ?
+			     MIGRATE_VMA_SELECT_DEVICE_PRIVATE :
+			     MIGRATE_VMA_SELECT_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
 
-		dmirror_migrate_alloc_and_copy(&args, dmirror);
+		if (cmd->alloc_to_devmem) {
+			pr_debug("Migrating from sys mem to device mem\n");
+			dmirror_migrate_alloc_and_copy(&args, dmirror);
+		} else {
+			pr_debug("Migrating from device mem to sys mem\n");
+			dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
+		}
 		migrate_vma_pages(&args);
-		dmirror_migrate_finalize_and_map(&args, dmirror);
+		if (cmd->alloc_to_devmem)
+			dmirror_migrate_finalize_and_map(&args, dmirror);
 		migrate_vma_finalize(&args);
 	}
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	/* Return the migrated data for verification. */
-	ret = dmirror_bounce_init(&bounce, start, size);
-	if (ret)
-		return ret;
-	mutex_lock(&dmirror->mutex);
-	ret = dmirror_do_read(dmirror, start, end, &bounce);
-	mutex_unlock(&dmirror->mutex);
-	if (ret == 0) {
-		if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
-				 bounce.size))
-			ret = -EFAULT;
+	/* Return the migrated data for verification. only for pages in device zone */
+	if (cmd->alloc_to_devmem) {
+		ret = dmirror_bounce_init(&bounce, start, size);
+		if (ret)
+			return ret;
+		mutex_lock(&dmirror->mutex);
+		ret = dmirror_do_read(dmirror, start, end, &bounce);
+		mutex_unlock(&dmirror->mutex);
+		if (ret == 0) {
+			if (copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr,
+					 bounce.size))
+				ret = -EFAULT;
+		}
+		cmd->cpages = bounce.cpages;
+		dmirror_bounce_fini(&bounce);
 	}
-	cmd->cpages = bounce.cpages;
-	dmirror_bounce_fini(&bounce);
 	return ret;
 
 out:
@@ -781,9 +849,15 @@ static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 	}
 
 	page = hmm_pfn_to_page(entry);
-	if (is_device_private_page(page)) {
-		/* Is the page migrated to this device or some other? */
-		if (dmirror->mdevice == dmirror_page_to_device(page))
+	if (is_device_page(page)) {
+		/* Is page ZONE_DEVICE public? */
+		if (!is_device_private_page(page))
+			*perm = HMM_DMIRROR_PROT_DEV_PUBLIC;
+		/*
+		 * Is page ZONE_DEVICE private migrated to
+		 * this device or some other?
+		 */
+		else if (dmirror->mdevice == dmirror_page_to_device(page))
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL;
 		else
 			*perm = HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE;
@@ -1030,38 +1104,6 @@ static void dmirror_devmem_free(struct page *page)
 	spin_unlock(&mdevice->lock);
 }
 
-static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
-						      struct dmirror *dmirror)
-{
-	const unsigned long *src = args->src;
-	unsigned long *dst = args->dst;
-	unsigned long start = args->start;
-	unsigned long end = args->end;
-	unsigned long addr;
-
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
-		struct page *dpage, *spage;
-
-		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
-		spage = spage->zone_device_data;
-
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-	}
-	return 0;
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 00259d994410..b6cb8a7d2470 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -17,8 +17,12 @@
  * @addr: (in) user address the device will read/write
  * @ptr: (in) user address where device data is copied to/from
  * @npages: (in) number of pages to read/write
+ * @alloc_to_devmem: (in) desired allocation destination during migration.
+ * True if allocation is to device memory.
+ * False if allocation is to system memory.
  * @cpages: (out) number of pages copied
  * @faults: (out) number of device page faults seen
+ * @zone_device_type: (out) zone device memory type
  */
 struct hmm_dmirror_cmd {
 	__u64		addr;
@@ -26,7 +30,8 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
-	__u64		zone_device_type;
+	__u32		zone_device_type;
+	__u32		alloc_to_devmem;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -49,6 +54,8 @@ struct hmm_dmirror_cmd {
  *					device the ioctl() is made
  * HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE: Migrated device private page on some
  *					other device
+ * HMM_DMIRROR_PROT_DEV_PUBLIC: Migrate device public page on the device
+ *				 the ioctl() is made
  */
 enum {
 	HMM_DMIRROR_PROT_ERROR			= 0xFF,
@@ -60,6 +67,7 @@ enum {
 	HMM_DMIRROR_PROT_ZERO			= 0x10,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL	= 0x20,
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
+	HMM_DMIRROR_PROT_DEV_PUBLIC		= 0x40,
 };
 
 enum {
-- 
2.32.0

