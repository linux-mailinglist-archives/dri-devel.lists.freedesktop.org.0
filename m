Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485902BBEB7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F11F6E9B1;
	Sat, 21 Nov 2020 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2138.outbound.protection.outlook.com [40.107.244.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2316E8FD
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 01:46:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyNtMSt/b7XvnvTMRtL0POov5R50DjeIKczLik5kRkze3UlkHA0u/qobwb603HrJQB/rOfhu0c+t0QlqGK+9wpBSOSJooKRWcYoFX4NYt/iexY3h0zDlXhXHGGKMnvXLMkhyIJcbCsn77dhjTEB4lj0aeLi4WPqehe+Fjm7J5atZxojtRms10VF6aH8e/07Nq2M8rOoTCbknWYwnF6d+RLubL/E6rjsYYx1mfgm/+gpSKfdjQn8baIUjJo/MBIO0+UFiCXbqeo2BnnYqVnasXLqRrduf8JPfoEX38hCOLlheA5+oEX+iarkGWb6dG7Y2PUi/GIOpfwRVH9g0U5cmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXsa3quB2koGi+J9Gf6VmO9HSCy+g7DFQ47uEjg1pO4=;
 b=l+93/Eh8x5uOowx5v3CtI47+XLo+9V7JbOuL2D20Q6s8+EFC20QBlGgfSFBmSaTwHXKleuV5OR+rGBgDuiAuv8QaY5MJC0u2/0nqw2ig05gvvD8o6fgrSs3rNBDQL1N3zDRpBpXKSFUO73mcMJYPKQ1GTpjiRKsOyiGwNOjRzn8LQS0GOddMdnfhLqyrP2DYtU1E35nN8bQjQ2wUL8axOIg9ExSAWOq8IP6o4C3A/ujOZl/JyadisoYM3KcjiD2/BIYnE0UIlkEmfmbnFXrWYKMKk6YBPg516A6hMP0lEF78pwNdtxzB8BrskVd+RNnmAWBycoz5QwxSEVlsOwg4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXsa3quB2koGi+J9Gf6VmO9HSCy+g7DFQ47uEjg1pO4=;
 b=UCQsp2y3q4woyLe/D0s3El7nvAGC56ufy9KBufPVj8s7G4stHrQuFQJO+VIx1shh1/qj/3uyKFtw2HLYuVLbKN3Jj+4U+ozidDs7iqcibfl9EL8Q19U/r6SA26WssAKdL5cMWZj+fpsyVqUfN+1cEkP3F6Oz3M9/wXrK37sSjyo=
Authentication-Results: microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=none action=none
 header.from=microsoft.com;
Received: from BN6PR21MB0162.namprd21.prod.outlook.com (2603:10b6:404:94::8)
 by BN6PR21MB0770.namprd21.prod.outlook.com (2603:10b6:404:9c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.0; Sat, 21 Nov
 2020 01:46:43 +0000
Received: from BN6PR21MB0162.namprd21.prod.outlook.com
 ([fe80::1557:a785:28fe:ea8e]) by BN6PR21MB0162.namprd21.prod.outlook.com
 ([fe80::1557:a785:28fe:ea8e%8]) with mapi id 15.20.3611.016; Sat, 21 Nov 2020
 01:46:43 +0000
From: Dexuan Cui <decui@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, b.zolnierkie@samsung.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com
Subject: [PATCH] video: hyperv_fb: Directly use the MMIO VRAM
Date: Fri, 20 Nov 2020 17:45:47 -0800
Message-Id: <20201121014547.54890-1-decui@microsoft.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:4898:80e8:9:2d9b:e96d:bb96:751d]
X-ClientProxiedBy: CO2PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:104:5::24) To BN6PR21MB0162.namprd21.prod.outlook.com
 (2603:10b6:404:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from decui-u1804.corp.microsoft.com
 (2001:4898:80e8:9:2d9b:e96d:bb96:751d) by
 CO2PR04CA0194.namprd04.prod.outlook.com (2603:10b6:104:5::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Sat, 21 Nov 2020 01:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44d4fda5-7360-4fd3-137d-08d88dbf4bb3
X-MS-TrafficTypeDiagnostic: BN6PR21MB0770:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR21MB0770377EC8B8BAE0681CE0AABFFE1@BN6PR21MB0770.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIvZS97RbURrxh/Cw9fflWk+JQylwMe64yDiZMuN9FApuFAITlltVzhtlmyxIxd2eCz6dKry5BX0TAFb2IJhJfkazmX/q2hx6sX3DGyKoXwmajRYQuPCI8+nBF0tFX42qt7K4YBe/ssyfUOqcyeMvI+868FayjN7QUobz7cOkcf663XM5rrMVXdPd1bpoozaghUbcN63dc90T1ggNLP/BFelAapSfSdlA3RUbtr2Y3uraKq26hTGT71zJvBKjnSJiPK/5ZGmFe8aaQxNlXpWnNXOfvufN8nl310cGR4xuQat4ATXQntqEbEznHJpsEgwR0ShAks1X7LY9aih9xYBwQ0qxemiCYgEAC+RzV/OnhwIfChx7YDuYqPD4wR17KdBfY9oD2ny20WEbV6z77SlpEw93zx108DCVs/I7KwBVDC0pV/ZXvQRWT6OojQhFmwJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR21MB0162.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(66946007)(10290500003)(3450700001)(36756003)(2906002)(6486002)(4326008)(316002)(107886003)(2616005)(1076003)(5660300002)(30864003)(478600001)(966005)(16526019)(82950400001)(186003)(52116002)(8676002)(66476007)(66556008)(8936002)(7696005)(6636002)(83380400001)(82960400001)(86362001)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eP9UQ+FiyMr1F48bKty/W5x3QHtFLGaMn9wp+UTHsBTekdMerG73+QXx3LvU?=
 =?us-ascii?Q?FgkY5S9Jba8hMIElPhlZ1jBOIAW0CmwZbDsv4iNv8pKhTWfArcsNpwTtVSvc?=
 =?us-ascii?Q?vR/ZxSuV2tfG4yTZxvQ4z7Z6aUphkFZ3cKNnAV5Kv1gCSTjp4wF8Q0lpnLfK?=
 =?us-ascii?Q?x1UUIYK2YTVapYbwbVo/E0FnoPm0XFE7Jx+S4q5xIHcH/IECN06ULurJYt/6?=
 =?us-ascii?Q?hkRY7kTeCphnACf+MHB4ntRh+M1rG2SCPKyrt7viuh8uJGLlKUB6qTugDpq7?=
 =?us-ascii?Q?JPmjUpt2mkSbKHmgzD0PeXntdSNOJnP06ldrWv26xlW/hYZQvz4z39IrWc3v?=
 =?us-ascii?Q?zlps7G7Os1zczuFDicFXBc2PgY911+92QiugqpQmEpAGuEHobghNSXQRp/fj?=
 =?us-ascii?Q?5koXUqyOD2m7GtpBebTHlrwqatpsHjFnFwj4a9/jukzcP18AB3B6koO7eLFC?=
 =?us-ascii?Q?QHRjmm4iA7omjGs3v6ln68foMfLBlYMJFLLEW20Qf8jPJVm1MyiQuugfTCE2?=
 =?us-ascii?Q?Ec2+Nr4z9bW9dw2t2kxC2Z/CFi3X7MWYWQS1i61Z9hP0ml1HPKZi3vgZ79FL?=
 =?us-ascii?Q?IvkUojgul88IQ2D1f6HTDJSuon4Y3kJFAn2HBJUqryV5JGaonFFVwfezPDLy?=
 =?us-ascii?Q?z1CuDzUcUvmB03u+/2z40qFYjYA5cYVvkORL/Loos7LAMZ1bA3+jbmKNKQT/?=
 =?us-ascii?Q?V9+AemRFxIryrqoCoT+3ngIMu1LIPS5b4d3um4RK1HyDhG7jGzBEAHiuXvlX?=
 =?us-ascii?Q?6kmXBK6/b+ANJlkjxXp4RtI+5Tiezc30BWUG7QtdbUXrWPsVR9mBG+8adc1t?=
 =?us-ascii?Q?CYT/DVEWFSpfCchf1IAk+1SeJyabeYHDXWl4BRK0T2qbFXHmG+OlfZl3fcsg?=
 =?us-ascii?Q?4DrXoiVLdHJmqA3nLg3X2h3lBRHWIi8oHAUZmWOhr4dc0NaC2lYMGPOEUl1/?=
 =?us-ascii?Q?+hj0W4iw08Ks+z4o/FnBR6/wZe9rxwsf0uVyy8R73W58z0NejsjGON3LdN71?=
 =?us-ascii?Q?iQb25ltxqy5vZAL//Axri4VCX0eXWUFbkKA43XFcVAJkKWw=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d4fda5-7360-4fd3-137d-08d88dbf4bb3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR21MB0162.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 01:46:42.7179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebdnFC6cCvc7yRsQvYFgGlvS6RcAj9u/3tFF76DZUBLO7OJZjr2Jkfpr8Q/m5jLTNR1xfCPa6hpHkd1fWukmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR21MB0770
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Reply-To: decui@microsoft.com
Cc: Dexuan Cui <decui@microsoft.com>, boqun.feng@gmail.com, weh@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Late in 2019, 2 commits (see the 2 Fixes tags) were introduced to
mitigate the slow framebuffer issue. Now that we have fixed the
slowness issue by correctly mapping the MMIO VRAM (see
commit 5f1251a48c17 ("video: hyperv_fb: Fix the cache type when mapping
the VRAM")), we can remove most of the code introduced by the 2 commits,
i.e. we no longer need to allocate physical memory and use it to back up
the VRAM in Generation-1 VM, and we also no longer need to allocate
physical memory to back up the framebuffer in a Generation-2 VM and copy
the framebuffer to the real VRAM.

synthvid_deferred_io() is kept, because it's still desirable to send the
SYNTHVID_DIRT message only for the exact dirty rectangle, and only when
needed.

Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
Cc: Wei Hu <weh@microsoft.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Dexuan Cui <decui@microsoft.com>
---

This patch changes drivers/video/fbdev/Kconfig, but I hope this can
still go through the Hyper-V tree
https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/log/?h=hyperv-next
because it's unlikely to cause any build issue to other fbdev drivers
(that line was introduced by 3a6fb6c4255c only for hyperv_fb.c)

Note: this patch is based on the Hyper-V tree's hyperv-fixes branch, but
it should also apply cleanly to the branch hyperv-next if the commit
5f1251a48c17 is applied first.  This patch is for v5.11 rather than
v5.10.

 drivers/video/fbdev/Kconfig     |   1 -
 drivers/video/fbdev/hyperv_fb.c | 170 ++------------------------------
 2 files changed, 9 insertions(+), 162 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 402e85450bb5..05b37fb3c6d6 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2205,7 +2205,6 @@ config FB_HYPERV
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_DEFERRED_IO
-	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
 
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 58c74d2356ba..8131f4e66f98 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -31,16 +31,6 @@
  * "set-vmvideo" command. For example
  *     set-vmvideo -vmname name -horizontalresolution:1920 \
  * -verticalresolution:1200 -resolutiontype single
- *
- * Gen 1 VMs also support direct using VM's physical memory for framebuffer.
- * It could improve the efficiency and performance for framebuffer and VM.
- * This requires to allocate contiguous physical memory from Linux kernel's
- * CMA memory allocator. To enable this, supply a kernel parameter to give
- * enough memory space to CMA allocator for framebuffer. For example:
- *    cma=130m
- * This gives 130MB memory to CMA allocator that can be allocated to
- * framebuffer. For reference, 8K resolution (7680x4320) takes about
- * 127MB memory.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -267,16 +257,8 @@ struct hvfb_par {
 	/* If true, the VSC notifies the VSP on every framebuffer change */
 	bool synchronous_fb;
 
-	/* If true, need to copy from deferred IO mem to framebuffer mem */
-	bool need_docopy;
-
 	struct notifier_block hvfb_panic_nb;
 
-	/* Memory for deferred IO and frame buffer itself */
-	unsigned char *dio_vp;
-	unsigned char *mmio_vp;
-	phys_addr_t mmio_pp;
-
 	/* Dirty rectangle, protected by delayed_refresh_lock */
 	int x1, y1, x2, y2;
 	bool delayed_refresh;
@@ -405,21 +387,6 @@ synthvid_update(struct fb_info *info, int x1, int y1, int x2, int y2)
 	return 0;
 }
 
-static void hvfb_docopy(struct hvfb_par *par,
-			unsigned long offset,
-			unsigned long size)
-{
-	if (!par || !par->mmio_vp || !par->dio_vp || !par->fb_ready ||
-	    size == 0 || offset >= dio_fb_size)
-		return;
-
-	if (offset + size > dio_fb_size)
-		size = dio_fb_size - offset;
-
-	memcpy(par->mmio_vp + offset, par->dio_vp + offset, size);
-}
-
-/* Deferred IO callback */
 static void synthvid_deferred_io(struct fb_info *p,
 				 struct list_head *pagelist)
 {
@@ -444,10 +411,6 @@ static void synthvid_deferred_io(struct fb_info *p,
 		y2 = end / p->fix.line_length;
 		miny = min_t(int, miny, y1);
 		maxy = max_t(int, maxy, y2);
-
-		/* Copy from dio space to mmio address */
-		if (par->fb_ready && par->need_docopy)
-			hvfb_docopy(par, start, PAGE_SIZE);
 	}
 
 	if (par->fb_ready && par->update)
@@ -704,7 +667,7 @@ static int synthvid_send_config(struct hv_device *hdev)
 	msg->vid_hdr.type = SYNTHVID_VRAM_LOCATION;
 	msg->vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
 		sizeof(struct synthvid_vram_location);
-	msg->vram.user_ctx = msg->vram.vram_gpa = par->mmio_pp;
+	msg->vram.user_ctx = msg->vram.vram_gpa = info->fix.smem_start;
 	msg->vram.is_vram_gpa_specified = 1;
 	synthvid_send(hdev, msg);
 
@@ -714,7 +677,7 @@ static int synthvid_send_config(struct hv_device *hdev)
 		ret = -ETIMEDOUT;
 		goto out;
 	}
-	if (msg->vram_ack.user_ctx != par->mmio_pp) {
+	if (msg->vram_ack.user_ctx != info->fix.smem_start) {
 		pr_err("Unable to set VRAM location\n");
 		ret = -ENODEV;
 		goto out;
@@ -740,7 +703,6 @@ static void hvfb_update_work(struct work_struct *w)
 	struct fb_info *info = par->info;
 	unsigned long flags;
 	int x1, x2, y1, y2;
-	int j;
 
 	spin_lock_irqsave(&par->delayed_refresh_lock, flags);
 	/* Reset the request flag */
@@ -762,14 +724,6 @@ static void hvfb_update_work(struct work_struct *w)
 	    y1 > info->var.yres || y2 > info->var.yres || x2 <= x1)
 		return;
 
-	/* Copy the dirty rectangle to frame buffer memory */
-	if (par->need_docopy)
-		for (j = y1; j < y2; j++)
-			hvfb_docopy(par,
-				    j * info->fix.line_length +
-				    (x1 * screen_depth / 8),
-				    (x2 - x1) * screen_depth / 8);
-
 	/* Refresh */
 	if (par->fb_ready && par->update)
 		synthvid_update(info, x1, y1, x2, y2);
@@ -813,8 +767,6 @@ static int hvfb_on_panic(struct notifier_block *nb,
 	par = container_of(nb, struct hvfb_par, hvfb_panic_nb);
 	par->synchronous_fb = true;
 	info = par->info;
-	if (par->need_docopy)
-		hvfb_docopy(par, 0, dio_fb_size);
 	synthvid_update(info, 0, 0, INT_MAX, INT_MAX);
 
 	return NOTIFY_DONE;
@@ -953,62 +905,6 @@ static void hvfb_get_option(struct fb_info *info)
 	return;
 }
 
-/*
- * Allocate enough contiguous physical memory.
- * Return physical address if succeeded or -1 if failed.
- */
-static phys_addr_t hvfb_get_phymem(struct hv_device *hdev,
-				   unsigned int request_size)
-{
-	struct page *page = NULL;
-	dma_addr_t dma_handle;
-	void *vmem;
-	phys_addr_t paddr = 0;
-	unsigned int order = get_order(request_size);
-
-	if (request_size == 0)
-		return -1;
-
-	if (order < MAX_ORDER) {
-		/* Call alloc_pages if the size is less than 2^MAX_ORDER */
-		page = alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
-		if (!page)
-			return -1;
-
-		paddr = (page_to_pfn(page) << PAGE_SHIFT);
-	} else {
-		/* Allocate from CMA */
-		hdev->device.coherent_dma_mask = DMA_BIT_MASK(64);
-
-		vmem = dma_alloc_coherent(&hdev->device,
-					  round_up(request_size, PAGE_SIZE),
-					  &dma_handle,
-					  GFP_KERNEL | __GFP_NOWARN);
-
-		if (!vmem)
-			return -1;
-
-		paddr = virt_to_phys(vmem);
-	}
-
-	return paddr;
-}
-
-/* Release contiguous physical memory */
-static void hvfb_release_phymem(struct hv_device *hdev,
-				phys_addr_t paddr, unsigned int size)
-{
-	unsigned int order = get_order(size);
-
-	if (order < MAX_ORDER)
-		__free_pages(pfn_to_page(paddr >> PAGE_SHIFT), order);
-	else
-		dma_free_coherent(&hdev->device,
-				  round_up(size, PAGE_SIZE),
-				  phys_to_virt(paddr),
-				  paddr);
-}
-
 
 /* Get framebuffer memory from Hyper-V video pci space */
 static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
@@ -1018,7 +914,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	void __iomem *fb_virt;
 	int gen2vm = efi_enabled(EFI_BOOT);
 	resource_size_t pot_start, pot_end;
-	phys_addr_t paddr;
 	int ret;
 
 	info->apertures = alloc_apertures(1);
@@ -1036,38 +931,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 
 		info->apertures->ranges[0].base = pci_resource_start(pdev, 0);
 		info->apertures->ranges[0].size = pci_resource_len(pdev, 0);
-
-		/*
-		 * For Gen 1 VM, we can directly use the contiguous memory
-		 * from VM. If we succeed, deferred IO happens directly
-		 * on this allocated framebuffer memory, avoiding extra
-		 * memory copy.
-		 */
-		paddr = hvfb_get_phymem(hdev, screen_fb_size);
-		if (paddr != (phys_addr_t) -1) {
-			par->mmio_pp = paddr;
-			par->mmio_vp = par->dio_vp = __va(paddr);
-
-			info->fix.smem_start = paddr;
-			info->fix.smem_len = screen_fb_size;
-			info->screen_base = par->mmio_vp;
-			info->screen_size = screen_fb_size;
-
-			par->need_docopy = false;
-			goto getmem_done;
-		}
-		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
 	} else {
 		info->apertures->ranges[0].base = screen_info.lfb_base;
 		info->apertures->ranges[0].size = screen_info.lfb_size;
 	}
 
-	/*
-	 * Cannot use the contiguous physical memory.
-	 * Allocate mmio space for framebuffer.
-	 */
-	dio_fb_size =
-		screen_width * screen_height * screen_depth / 8;
+	dio_fb_size = screen_width * screen_height * screen_depth / 8;
 
 	if (gen2vm) {
 		pot_start = 0;
@@ -1101,22 +970,11 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	if (!fb_virt)
 		goto err2;
 
-	/* Allocate memory for deferred IO */
-	par->dio_vp = vzalloc(round_up(dio_fb_size, PAGE_SIZE));
-	if (par->dio_vp == NULL)
-		goto err3;
-
-	/* Physical address of FB device */
-	par->mmio_pp = par->mem->start;
-	/* Virtual address of FB device */
-	par->mmio_vp = (unsigned char *) fb_virt;
-
 	info->fix.smem_start = par->mem->start;
 	info->fix.smem_len = dio_fb_size;
-	info->screen_base = par->dio_vp;
+	info->screen_base = fb_virt;
 	info->screen_size = dio_fb_size;
 
-getmem_done:
 	remove_conflicting_framebuffers(info->apertures,
 					KBUILD_MODNAME, false);
 	if (!gen2vm)
@@ -1125,8 +983,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 
 	return 0;
 
-err3:
-	iounmap(fb_virt);
 err2:
 	vmbus_free_mmio(par->mem->start, screen_fb_size);
 	par->mem = NULL;
@@ -1139,19 +995,12 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 }
 
 /* Release the framebuffer */
-static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
+static void hvfb_putmem(struct fb_info *info)
 {
 	struct hvfb_par *par = info->par;
 
-	if (par->need_docopy) {
-		vfree(par->dio_vp);
-		iounmap(info->screen_base);
-		vmbus_free_mmio(par->mem->start, screen_fb_size);
-	} else {
-		hvfb_release_phymem(hdev, info->fix.smem_start,
-				    screen_fb_size);
-	}
-
+	iounmap(info->screen_base);
+	vmbus_free_mmio(par->mem->start, screen_fb_size);
 	par->mem = NULL;
 }
 
@@ -1170,7 +1019,6 @@ static int hvfb_probe(struct hv_device *hdev,
 	par = info->par;
 	par->info = info;
 	par->fb_ready = false;
-	par->need_docopy = true;
 	init_completion(&par->wait);
 	INIT_DELAYED_WORK(&par->dwork, hvfb_update_work);
 
@@ -1256,7 +1104,7 @@ static int hvfb_probe(struct hv_device *hdev,
 
 error:
 	fb_deferred_io_cleanup(info);
-	hvfb_putmem(hdev, info);
+	hvfb_putmem(info);
 error2:
 	vmbus_close(hdev->channel);
 error1:
@@ -1286,7 +1134,7 @@ static int hvfb_remove(struct hv_device *hdev)
 	vmbus_close(hdev->channel);
 	hv_set_drvdata(hdev, NULL);
 
-	hvfb_putmem(hdev, info);
+	hvfb_putmem(info);
 	framebuffer_release(info);
 
 	return 0;
-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
