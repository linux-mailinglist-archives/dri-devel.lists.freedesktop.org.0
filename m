Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154E49DF6A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A94D10F09C;
	Thu, 27 Jan 2022 10:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D351710F09C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:28:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 81627218DF;
 Thu, 27 Jan 2022 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643279315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=63YesRJQoVhlsWaAc/OnN2ULPBIK04G437ZoxWhsRyI=;
 b=wMMfSgIOzPPV9xQrvDpAN99ywEmo2R7HfZsqdhgtNTw0BGKibINLchfpMTIybHvv0ty4wj
 zdvcm0YqwbNGJsbps9b6YXpFzTCy8xbxvSm8n7fXKexbu6PR4ybmJiLuYlVNfIwEzKoumu
 Vitfga32PKQrftxSs6DJdazPR87YwCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643279315;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=63YesRJQoVhlsWaAc/OnN2ULPBIK04G437ZoxWhsRyI=;
 b=3X+jaoHYEPfrbr/j55oPU1KXv2dDXeIv9cr+dMjWUiutIHoxt5YLuVnY/16jcKoyLyuFgU
 zWkxWjABOmMIwRBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AA3B13F73;
 Thu, 27 Jan 2022 10:28:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A6khFdNz8mFRQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 10:28:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/2] drm/gem-shmem: Set vm_ops in static initializer
Date: Thu, 27 Jan 2022 11:28:30 +0100
Message-Id: <20220127102831.30094-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize default vm_ops in static initialization of the GEM SHMEM funcs,
instead of the mmap code. It's simply better style. GEM helpers will later
set a VMA's vm_ops from the default automatically.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 621924116eb4..2ced2ca83825 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -25,6 +25,8 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
+static const struct vm_operations_struct drm_gem_shmem_vm_ops;
+
 /**
  * DOC: overview
  *
@@ -46,6 +48,7 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
 static struct drm_gem_shmem_object *
@@ -625,7 +628,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (shmem->map_wc)
 		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vma->vm_ops = &drm_gem_shmem_vm_ops;
 
 	return 0;
 }
-- 
2.34.1

