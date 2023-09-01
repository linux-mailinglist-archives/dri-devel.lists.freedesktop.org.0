Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480078FF21
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4D210E7F0;
	Fri,  1 Sep 2023 14:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32C810E7EA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:27:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C3E31F891;
 Fri,  1 Sep 2023 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693578423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FP9MTa3lLW880Bb2/na3VAZdvGvajU0vpltsEnzM4sM=;
 b=vTpdS3rQ3UOgZy1x6pB0L41dVuV+YumTOGAdvRWzqxQZyFujlp7sYR2G+/bKrQh6tRm36d
 4zv6MPMR0elLbxuHC7k2VrXGE7+ekoD8TF5SCKD5j0+ZdK9PTsFPSF/vespDt/MDWNgsf+
 SxYUdmRXPVAFeWOQD/oGaNGyE/DXjOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693578423;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FP9MTa3lLW880Bb2/na3VAZdvGvajU0vpltsEnzM4sM=;
 b=Ti46tYWOY1N8/A5C8iV7rjiIpfHLsh3WRDZmzHUuzKjTYNAC4iPi7upuQvuh7FVuJd1u/Q
 UlhUxHNq6nuLOoBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D81713A12;
 Fri,  1 Sep 2023 14:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kGYsCrf08WQGYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Sep 2023 14:27:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Subject: [PATCH 3/4] arch/powerpc: Call internal __phys_mem_access_prot() in
 fbdev code
Date: Fri,  1 Sep 2023 16:16:35 +0200
Message-ID: <20230901142659.31787-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901142659.31787-1-tzimmermann@suse.de>
References: <20230901142659.31787-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call __phys_mem_access_prot() from the fbdev mmap helper fb_pgprotect().
Allows us to avoid the file argument, which can then be removed from
fB_pgprotect() entirely. No other architecture uses the parameter.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/fb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
index 5f1a2e5f7654..0f1fe1310924 100644
--- a/arch/powerpc/include/asm/fb.h
+++ b/arch/powerpc/include/asm/fb.h
@@ -9,9 +9,9 @@
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
-	vma->vm_page_prot = phys_mem_access_prot(file, off >> PAGE_SHIFT,
-						 vma->vm_end - vma->vm_start,
-						 vma->vm_page_prot);
+	vma->vm_page_prot = __phys_mem_access_prot(PHYS_PFN(off),
+						   vma->vm_end - vma->vm_start,
+						   vma->vm_page_prot);
 }
 #define fb_pgprotect fb_pgprotect
 
-- 
2.41.0

