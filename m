Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AD3563DC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 08:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3716E21A;
	Wed,  7 Apr 2021 06:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 476 seconds by postgrey-1.36 at gabe;
 Wed, 07 Apr 2021 01:36:04 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062789ECB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 01:36:04 +0000 (UTC)
Received: from localhost (unknown [192.168.167.139])
 by lucky1.263xmail.com (Postfix) with ESMTP id 9237DF356A;
 Wed,  7 Apr 2021 09:28:03 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P6247T139731639179008S1617758871505773_; 
 Wed, 07 Apr 2021 09:28:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1bfbef78173915d5cc4e86b5dcb647c6>
X-RL-SENDER: songqiang@uniontech.com
X-SENDER: songqiang@uniontech.com
X-LOGIN-NAME: songqiang@uniontech.com
X-FST-TO: christian.koenig@amd.com
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: songqiang <songqiang@uniontech.com>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drivers/gpu/drm/ttm/ttm_page_allo.c: adjust ttm pages
 refcount fix the bug: Feb 6 17:13:13 aaa-PC kernel: [ 466.271034] BUG: Bad
 page state in process blur_image pfn:7aee2 Feb 6 17:13:13 aaa-PC kernel: [
 466.271037] page:980000025fca4170 count:0 mapcount:0 mapping:980000025a0dca60
 index:0x0 Feb 6 17:13:13 aaa-PC kernel: [ 466.271039] flags:
 0x1e01fff000000() Feb 6 17:13:13 aaa-PC kernel: [ 466.271042] raw:
 0001e01fff000000 0000000000000100 0000000000000200 980000025a0dca60 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271044] raw: 0000000000000000 0000000000000000
 00000000ffffffff Feb 6 17:13:13 aaa-PC kernel: [ 466.271046] page dumped
 because: non-NULL mapping Feb 6 17:13:13 aaa-PC kernel: [ 466.271047] Modules
 linked in: bnep fuse bluetooth ecdh_generic sha256_generic cfg80211 rfkill
 vfat fat serio_raw uio_pdrv_genirq binfmt_misc ip_tables amdgpu chash radeon
 r8168 loongson gpu_sched Feb 6 17:13:13 aaa-PC kernel: [ 466.271059] CPU: 3
 PID: 9554 Comm: 
 blur_image Tainted: G B 4.19.0-loongson-3-desktop #3036 Feb 6 17:13:13 aaa-PC
 kernel: [ 466.271061] Hardware name: Haier
 Kunlun-LS3A4000-LS7A-desktop/Kunlun-LS3A4000-LS7A-desktop,
 BIOS Kunlun-V4.0.12V4.0 LS3A4000 03/19/2020 Feb 6 17:13:13 aaa-PC kernel: [
 466.271063] Stack : 000000000000007b 000000007400cce0 0000000000000000
 0000000000000007 Feb 6 17:13:13 aaa-PC kernel: [ 466.271067] 0000000000000000
 0000000000000000 0000000000002a82 ffffffff8202c910 Feb 6 17:13:13 aaa-PC
 kernel: [ 466.271070] 0000000000000000 0000000000002a82 0000000000000000
 ffffffff81e20000 Feb 6 17:13:13 aaa-PC kernel: [ 466.271074] 0000000000000000
 ffffffff8021301c ffffffff82040000 6e754b20534f4942 Feb 6 17:13:13 aaa-PC
 kernel: [ 466.271078] ffff000000000000 0000000000000000 000000007400cce0
 0000000000000000 Feb 6 17:13:13 aaa-PC kernel: [ 466.271082] 9800000007155d40
 ffffffff81cc5470 0000000000000005 6db6db6db6db0000 Feb 6 17:13:13 
 aaa-PC kernel: [ 466.271086] 0000000000000003 fffffffffffffffb
 0000000000006000 98000002559f4000 Feb 6 17:13:13 aaa-PC kernel: [ 466.271090]
 980000024a448000 980000024a44b7f0 9800000007155d50 ffffffff819f5158 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271094] 0000000000000000 0000000000000000
 0000000000000000 0000000000000000 Feb 6 17:13:13 aaa-PC kernel: [ 466.271097]
 9800000007155d40 ffffffff802310c4 ffffffff81e70000 ffffffff819f5158 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271101] ... Feb 6 17:13:13 aaa-PC kernel: [
 466.271103] Call Trace: Feb 6 17:13:13 aaa-PC kernel: [ 466.271107]
 [<ffffffff802310c4>] show_stack+0x44/0x1c0 Feb 6 17:13:13 aaa-PC kernel: [
 466.271110] [<ffffffff819f5158>] dump_stack+0x1d8/0x240 Feb 6 17:13:13 aaa-PC
 kernel: [ 466.271113] [<ffffffff80491c10>] bad_page+0x210/0x2c0 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271116] [<ffffffff804931c8>]
 free_pcppages_bulk+0x708/0x900 Feb 6 17:13:13 aaa-PC kernel: [ 46
 6.271119] [<ffffffff804980cc>] free_unref_page_list+0x1cc/0x2c0 Feb 6 17:13:13
 aaa-PC kernel: [ 466.271122] [<ffffffff804ad2c8>] release_pages+0x648/0x900
 Feb 6 17:13:13 aaa-PC kernel: [ 466.271125] [<ffffffff804f3b48>]
 tlb_flush_mmu_free+0x88/0x100 Feb 6 17:13:13 aaa-PC kernel: [ 466.271128]
 [<ffffffff804f8a24>] zap_pte_range+0xa24/0x1480 Feb 6 17:13:13 aaa-PC kernel:
 [ 466.271132] [<ffffffff804f98b0>] unmap_page_range+0x1f0/0x500 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271135] [<ffffffff804fa054>]
 unmap_vmas+0x154/0x200 Feb 6 17:13:13 aaa-PC kernel: [ 466.271138]
 [<ffffffff8051190c>] exit_mmap+0x20c/0x380 Feb 6 17:13:13 aaa-PC kernel: [
 466.271142] [<ffffffff802bb9c8>] mmput+0x148/0x300 Feb 6 17:13:13 aaa-PC
 kernel: [ 466.271145] [<ffffffff802c80d8>] do_exit+0x6d8/0x1900 Feb 6
 17:13:13 aaa-PC kernel: [ 466.271148] [<ffffffff802cb288>]
 do_group_exit+0x88/0x1c0 Feb 6 17:13:13 aaa-PC kernel: [ 466.271151]
 [<ffffffff802cb3d8>] sys_exit_group+0x18/0x40 Feb 6 17
 :13:13 aaa-PC kernel: [ 466.271155] [<ffffffff8023f954>]
 syscall_common+0x34/0xa4
Date: Wed,  7 Apr 2021 09:27:46 +0800
Message-Id: <20210407012746.16082-1-songqiang@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Apr 2021 06:23:45 +0000
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
Cc: songqiang <songqiang@uniontech.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: songqiang <songqiang@uniontech.com>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 14660f723f71..f3698f0ad4d7 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -736,8 +736,16 @@ static void ttm_put_pages(struct page **pages, unsigned npages, int flags,
 					if (++p != pages[i + j])
 					    break;
 
-				if (j == HPAGE_PMD_NR)
+				if (j == HPAGE_PMD_NR) {
 					order = HPAGE_PMD_ORDER;
+					for (j = 1; j < HPAGE_PMD_NR; ++j)
+						page_ref_dec(pages[i+j]);
+				}
 			}
 #endif
 
@@ -868,10 +876,12 @@ static int ttm_get_pages(struct page **pages, unsigned npages, int flags,
 				p = alloc_pages(huge_flags, HPAGE_PMD_ORDER);
 				if (!p)
 					break;
-
-				for (j = 0; j < HPAGE_PMD_NR; ++j)
+				for (j = 0; j < HPAGE_PMD_NR; ++j) {
 					pages[i++] = p++;
-
+					if (j > 0)
+						page_ref_inc(pages[i-1]);
+				}
 				npages -= HPAGE_PMD_NR;
 			}
 		}



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
