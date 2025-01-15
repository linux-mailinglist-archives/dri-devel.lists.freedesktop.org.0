Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE870A11B78
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5D910E525;
	Wed, 15 Jan 2025 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1966 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jan 2025 06:52:00 UTC
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDE510E057
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 06:51:59 +0000 (UTC)
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 50F6JE4H042829
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 14:19:14 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 50F6IOuR038057;
 Wed, 15 Jan 2025 14:18:24 +0800 (+08)
 (envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YXwhc5Zz4z2PwgWJ;
 Wed, 15 Jan 2025 14:15:12 +0800 (CST)
Received: from bj03382pcu01.spreadtrum.com (10.0.73.40) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 15 Jan 2025 14:18:21 +0800
From: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, "moderated
 list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>,
 Zhaoyang Huang <huangzhaoyang@gmail.com>, <steve.kang@unisoc.com>
Subject: [RFC PATCH] driver: dma-buf: use vmf_insert_page for cma_heap_vm_fault
Date: Wed, 15 Jan 2025 14:18:05 +0800
Message-ID: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.40]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 50F6IOuR038057
X-Mailman-Approved-At: Wed, 15 Jan 2025 08:04:57 +0000
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

From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>

When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
return NULL. This commit would like to suggest to replace
vmf_insert_pfn by vmf_insert_page.

[  103.402787] kvm [5276]: gfn(ipa)=0x80000 hva=0x7d4a400000 write_fault=0
[  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140000f43 pmd:8000000c1ca0003
[  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000000000000 mapping:ffffff8085163df0 index:0
[  103.406536] file:dmabuf fault:cma_heap_vm_fault [cma_heap] mmap:dma_buf_mmap_internal read_folio:0x0
[  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W  OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba3a911f3b744176a5d2d
[  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
[  103.410613] Call trace:
[  103.411038] dump_backtrace+0xf4/0x140
[  103.411641] show_stack+0x20/0x30
[  103.412184] dump_stack_lvl+0x60/0x84
[  103.412766] dump_stack+0x18/0x24
[  103.413304] print_bad_pte+0x1b8/0x1cc
[  103.413909] vm_normal_page+0xc8/0xd0
[  103.414491] follow_page_pte+0xb0/0x304
[  103.415096] follow_page_mask+0x108/0x240
[  103.415721] __get_user_pages+0x168/0x4ac
[  103.416342] __gup_longterm_locked+0x15c/0x864
[  103.417023] pin_user_pages+0x70/0xcc
[  103.417609] pkvm_mem_abort+0xf8/0x5c0
[  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
[  103.418906] handle_exit+0xac/0x33c
[  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
[  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
[  103.420785] __arm64_sys_ioctl+0xb0/0xec
[  103.421401] invoke_syscall+0x60/0x11c
[  103.422000] el0_svc_common+0xb4/0xe8
[  103.422590] do_el0_svc+0x24/0x30
[  103.423131] el0_svc+0x3c/0x70
[  103.423640] el0t_64_sync_handler+0x68/0xbc
[  103.424288] el0t_64_sync+0x1a8/0x1ac

Signed-off-by: Xiwei Wang <xiwei.wang1@unisoc.com>
Signed-off-by: Aijun Sun <aijun.sun@unisoc.com>
Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..b301fb63f16b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
 	if (vmf->pgoff > buffer->pagecount)
 		return VM_FAULT_SIGBUS;
 
-	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
+	return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgoff]);
 }
 
 static const struct vm_operations_struct dma_heap_vm_ops = {
-- 
2.25.1

