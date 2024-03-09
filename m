Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36A8772AF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237851122AF;
	Sat,  9 Mar 2024 18:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MfKqdw6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157E71122A7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D249460ADB;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C0F1C4160E;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008149;
 bh=dta8taxZLznZ73Hm8Vw2wZnNUzwcVcgs3YnHIBVJvwI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MfKqdw6dwQxihsUYTPQNeZi1E+18WOBvaRcVBh4fS75dwCr74aRUCvQFJ3BffuJ/g
 J0KkSiaGt6PztdD+Dqdr/9CEM9Y0a43L6nO/FaoIFpHoJhLYw4cX66Cptc+BbASywq
 B+J+mYaChzKKeKxrLxlT1Q2P9tbyhaKXsuO68GyyP/IHuwfamfNDCEjNClxVtBIy6x
 6U0NTsMOrh6r2d0NS1nYl94YEn8qela542uZAmAx8R/f6uWS7FgsmVfEoWWkhNGpUy
 cub75SDbKh+eyPUx/kokfVfK1FxjoeLI7vL7V22QCt6kL+4lZ5nwC2XwCuanrelHwN
 j/UyDPA5HJCcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF0AC54798;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:34 +0100
Subject: [PATCH v2 13/28] sparc32: Drop unused function
 __get_{phys,iospace}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-13-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=2013;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=Tn9g7LWvCUdTmkYOsbwfYgbrFZxijEwtAJx+7NQeCwU=; =?utf-8?q?b=3DCRwJWH4NIKj2?=
 =?utf-8?q?pUC20cRe3vma4EkIV0gjv4/sxZ+rztoot0a1tI/tYYsFyiCb778ngj915BdBC/xx?=
 H97Jke69DtjYknE/hmBl+iaMQFJP+Pgz8TO+bMrRnn47aDluslMc
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Not used and references stuff that will be dropped later.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/pgtable_32.h | 24 ------------------------
 arch/sparc/include/asm/pgtsrmmu.h   | 11 -----------
 2 files changed, 35 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 9e85d57ac3f2..92b063531d5c 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -368,30 +368,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return __pte(pte_val(pte) & ~SRMMU_SWP_EXCLUSIVE);
 }
 
-static inline unsigned long
-__get_phys (unsigned long addr)
-{
-	switch (sparc_cpu_model){
-	case sun4m:
-	case sun4d:
-		return ((srmmu_get_pte (addr) & 0xffffff00) << 4);
-	default:
-		return 0;
-	}
-}
-
-static inline int
-__get_iospace (unsigned long addr)
-{
-	switch (sparc_cpu_model){
-	case sun4m:
-	case sun4d:
-		return (srmmu_get_pte (addr) >> 28);
-	default:
-		return -1;
-	}
-}
-
 /*
  * For sparc32&64, the pfn in io_remap_pfn_range() carries <iospace> in
  * its high 4 bits.  These macros/functions put it there or get it from there.
diff --git a/arch/sparc/include/asm/pgtsrmmu.h b/arch/sparc/include/asm/pgtsrmmu.h
index 18e68d43f036..7cb5cbc83211 100644
--- a/arch/sparc/include/asm/pgtsrmmu.h
+++ b/arch/sparc/include/asm/pgtsrmmu.h
@@ -125,17 +125,6 @@ static inline void srmmu_flush_whole_tlb(void)
 
 }
 
-static inline int
-srmmu_get_pte (unsigned long addr)
-{
-	register unsigned long entry;
-        
-	__asm__ __volatile__("\n\tlda [%1] %2,%0\n\t" :
-				"=r" (entry):
-				"r" ((addr & 0xfffff000) | 0x400), "i" (ASI_M_FLUSH_PROBE));
-	return entry;
-}
-
 #endif /* !(__ASSEMBLY__) */
 
 #endif /* !(_SPARC_PGTSRMMU_H) */

-- 
2.34.1

