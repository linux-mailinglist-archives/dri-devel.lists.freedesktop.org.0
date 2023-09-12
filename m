Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A608C79D2CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F84010E25E;
	Tue, 12 Sep 2023 13:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816810E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 13:50:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C8EF1F85D;
 Tue, 12 Sep 2023 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694526653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV/rHFCKWKhe5o/Dlji+h0tSxNvEv9pGQp8HF0qfFsw=;
 b=Ew6/ShMt2eLj+cJ80uJN98SHanYPOov+NxTUOhOU2guO/sjidGDeaB2opl7TgIjsFoZos8
 iOlarOI9lXf4fNYAryBRhul5DvdlSagyy+aXg3gIylx9rejm+0l1lebNZd9nDylzoTpDG0
 KnwoLVFIiyCSTzh2hKHA6n2k7Nv7/qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694526653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV/rHFCKWKhe5o/Dlji+h0tSxNvEv9pGQp8HF0qfFsw=;
 b=mCQGGEEqAUZk6FbEVgwGjMaR7bNzYn80/YZJFR4O0MHHOph1X0dtseZydWjo0aeJynBB8b
 GZfd9/6d+QYFB4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF0E913A3B;
 Tue, 12 Sep 2023 13:50:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OMKiNbxsAGVKQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Sep 2023 13:50:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 arnd@arndb.de, deller@gmx.de
Subject: [PATCH v4 5/5] arch/powerpc: Call internal __phys_mem_access_prot()
 in fbdev code
Date: Tue, 12 Sep 2023 15:49:03 +0200
Message-ID: <20230912135050.17155-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912135050.17155-1-tzimmermann@suse.de>
References: <20230912135050.17155-1-tzimmermann@suse.de>
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

Call __phys_mem_access_prot() from the fbdev mmap helper
pgprot_framebuffer(). Allows to avoid the file argument of NULL.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/powerpc/include/asm/fb.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
index 3cecf14d51de8..c0c5d1df7ad1e 100644
--- a/arch/powerpc/include/asm/fb.h
+++ b/arch/powerpc/include/asm/fb.h
@@ -8,12 +8,7 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 					  unsigned long vm_start, unsigned long vm_end,
 					  unsigned long offset)
 {
-	/*
-	 * PowerPC's implementation of phys_mem_access_prot() does
-	 * not use the file argument. Set it to NULL in preparation
-	 * of later updates to the interface.
-	 */
-	return phys_mem_access_prot(NULL, PHYS_PFN(offset), vm_end - vm_start, prot);
+	return __phys_mem_access_prot(PHYS_PFN(offset), vm_end - vm_start, prot);
 }
 #define pgprot_framebuffer pgprot_framebuffer
 
-- 
2.42.0

