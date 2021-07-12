Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E643C5C33
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 14:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530789C51;
	Mon, 12 Jul 2021 12:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE6489C49;
 Mon, 12 Jul 2021 12:33:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1752A21CC4;
 Mon, 12 Jul 2021 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626093204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AYKAdLtE/BUTuxBUhEydzXDOdy4Vi7yaFmbOtBvHMO8=;
 b=OVPq7nrtxdxhqVZUdjg0s7EpI7yTWJNyrWXQdajaaz0K2jbhImFfYrZjQhnWfa4UnOrWUg
 g2cuFnWjjeL1bs4LLXVEDp0oyeL3z1Xc4tHudktL75oMd+WVp/kSkdw2dBVVhDOZAJLuqX
 HfKnWD+q4LHVzmF/wek8S7ZjjItFhRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626093204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AYKAdLtE/BUTuxBUhEydzXDOdy4Vi7yaFmbOtBvHMO8=;
 b=tfYAqfkDSqt42WudBMcjBSa0Lk9aOzQgr4HRgB1SU62rp2FVdSj4ZpgHeSmpx73jpNWxVc
 MZ9XSHVuUTTej3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C156A13BAA;
 Mon, 12 Jul 2021 12:33:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PAFTLZM27GCTWQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 12:33:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com, melissa.srw@gmail.com, jgg@ziepe.ca,
 lee.jones@linaro.org, chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v2] drm/vgem: Restore mmap functionality
Date: Mon, 12 Jul 2021 14:33:21 +0200
Message-Id: <20210712123321.3658-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
accidentally removed the actual mmap functionality from vgem. Restore
the original implementation by restoring the vm_pgoff in the mmap code.

Fixes access to unmapped memory:

[  106.591744] BUG: KASAN: vmalloc-out-of-bounds in do_fault+0x38/0x480
[  106.598154] Read of size 8 at addr ffffffffc10c44a8 by task vgem_basic/1514
[  106.605173]
[  106.606678] CPU: 1 PID: 1514 Comm: vgem_basic Tainted: G            E     5.13.0-1-default+ #990
[  106.615535] Hardware name: Dell Inc. OptiPlex 9020/0N4YC8, BIOS A24 10/24/2018
[  106.622818] Call Trace:
[  106.625289]  dump_stack+0xa5/0xdc
[  106.628642]  print_address_description.constprop.0+0x18/0x100
[  106.634439]  ? do_fault+0x38/0x480
[  106.637872]  kasan_report.cold+0x7c/0xd8
[  106.641834]  ? do_fault+0x38/0x480
[  106.645274]  do_fault+0x38/0x480
[  106.648535]  __handle_mm_fault+0x935/0xb00
[  106.652676]  ? vm_iomap_memory+0xe0/0xe0
[  106.656634]  ? __lock_release+0x12f/0x4e0
[  106.660696]  ? count_memcg_event_mm.part.0+0xb9/0x190
[  106.665799]  handle_mm_fault+0xd0/0x370
[  106.669675]  do_user_addr_fault+0x2a0/0x8c0
[  106.673908]  exc_page_fault+0x64/0xf0
[  106.677604]  ? asm_exc_page_fault+0x8/0x30
[  106.681739]  asm_exc_page_fault+0x1e/0x30
[  106.685782] RIP: 0033:0x402e12
...

v2:
	* restore vma.vm_pgoff instead of mapping the pages

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index df634aa52638..e92d1f2e02c4 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -364,8 +364,8 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma
 
 static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	vma_set_file(vma, obj->filp);
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
-- 
2.32.0

