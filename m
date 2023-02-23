Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35976A0870
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8308710EB65;
	Thu, 23 Feb 2023 12:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581A710EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F17BE37B04;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2QsZH7h2zg1bDfDRNor9GC3GxbBZE2UK76MSKa6ihk=;
 b=zj091kx2h7IFHCRfuRExjfnhywkDhT5fBk77D66JkFPz7z1tWSrTs2Bc0fuquGI78aWzul
 upiKS08LuXVph34gGap38Vv4Qd7XJoA5R3HI/tJjcYZQiuwAvHNhcvPS1VzFCJGXHpFeVC
 81Z2RuoVW+9Z2nFE1bt6zt06CS5vOUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2QsZH7h2zg1bDfDRNor9GC3GxbBZE2UK76MSKa6ihk=;
 b=gSLj5W0t0T0PQNYs1gOG8jQjgpZBPJk82VXMEgsqTRWWXBe2LIbgfgLkezfHO9SPZssBXO
 etonzK0vWi6n9TBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFA17139C7;
 Thu, 23 Feb 2023 12:17:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cHG/MWJZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 3/7] drm/gma500: Remove fbdev vma open and close callbacks
Date: Thu, 23 Feb 2023 13:17:29 +0100
Message-Id: <20230223121733.12549-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223121733.12549-1-tzimmermann@suse.de>
References: <20230223121733.12549-1-tzimmermann@suse.de>
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

Remove fbdev emulations' open and close implementaitons for the VM. The
functions are empty. Also update the naming of the VMA code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 9ce76b11d256..6885550f6815 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -18,7 +18,7 @@
  * VM area struct
  */
 
-static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
+static vm_fault_t psb_fbdev_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_framebuffer *fb = vma->vm_private_data;
@@ -49,16 +49,8 @@ static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-static void psbfb_vm_open(struct vm_area_struct *vma)
-{ }
-
-static void psbfb_vm_close(struct vm_area_struct *vma)
-{ }
-
-static const struct vm_operations_struct psbfb_vm_ops = {
-	.fault	= psbfb_vm_fault,
-	.open	= psbfb_vm_open,
-	.close	= psbfb_vm_close
+static const struct vm_operations_struct psb_fbdev_vm_ops = {
+	.fault	= psb_fbdev_vm_fault,
 };
 
 /*
@@ -122,7 +114,7 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	 * kernel remapping of the object. FIXME: Review if this is
 	 * suitable for our mmap work
 	 */
-	vma->vm_ops = &psbfb_vm_ops;
+	vma->vm_ops = &psb_fbdev_vm_ops;
 	vma->vm_private_data = (void *)fb;
 	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
-- 
2.39.2

