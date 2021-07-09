Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB43C2705
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 17:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADEE6EA3F;
	Fri,  9 Jul 2021 15:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B546EA3F;
 Fri,  9 Jul 2021 15:42:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78DE31FD82;
 Fri,  9 Jul 2021 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625845378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mmgIzdgfyMu4ThUIjpayeTSBv68QO84Olz3jNi34ylk=;
 b=kSKLS/Ev5OJ5+J4IFpdMJI/vD/7IeyqbyoD7gRlBZhWk2Q99CE9/tPkMccIIShR9wUzpMk
 QUC+p570sz+CPyvsF8Vrt9AseM8nRY6eCfw8wjMsp+zMQCHGH2ldqUehttm0N86xlweuVH
 KLW/YiHXqgcfBPudfwdhNfieoN/gR/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625845378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mmgIzdgfyMu4ThUIjpayeTSBv68QO84Olz3jNi34ylk=;
 b=UslZprxKTVr4kxQV2GaqrDwKZwfmLEC2b+vGH3Hz7x8vlsFbEN4vNZv3K+iJSjdK/q8BfV
 HejQSzLXEYwKTvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3054B13A3D;
 Fri,  9 Jul 2021 15:42:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rI5+CYJu6GALRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jul 2021 15:42:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 ville.syrjala@linux.intel.com, melissa.srw@gmail.com, jgg@ziepe.ca,
 lee.jones@linaro.org, chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH] drm/vgem: Restore mmap functionality
Date: Fri,  9 Jul 2021 17:42:56 +0200
Message-Id: <20210709154256.12005-1-tzimmermann@suse.de>
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
the original implementation and VMA flags.

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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 375cca1cfeb5 ("drm/vgem: Implement mmap as GEM object function")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index df634aa52638..f50fd10c4fad 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -364,8 +364,17 @@ static void vgem_prime_vunmap(struct drm_gem_object *obj, struct dma_buf_map *ma

 static int vgem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
+	int ret;
+
+	if (!obj->filp)
+		return -ENODEV;
+
+	ret = call_mmap(obj->filp, vma);
+	if (ret)
+		return ret;
+
 	vma_set_file(vma, obj->filp);
-	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);

--
2.32.0

