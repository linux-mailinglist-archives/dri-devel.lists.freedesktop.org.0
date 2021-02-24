Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E23245FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 22:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E5A6E0B7;
	Wed, 24 Feb 2021 21:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9E66E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 21:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KuWAhJtiZEuqWgaw7j/dWyBKuxamWBVDd55ICgSvMAE=; b=xDdFXRlVY0wF5OacC5EN8xJbnO
 LvAh1dCeRpg7YLz4a9lPEFFAHNylVaV7ymPTk1fcXAXrtjOz9nHpPYMnOpXwlhidmbeE71EDN2bcr
 E9410knr8bMuAkcjK9C6DtNROMdpMOICKU5u91tNuYhYK0MhyhlfGZ/kobrOXNyirFHY4GF+6g2nd
 xaLwE1clTPhIFRRsmYmjh6Ul124YcLxzQM1z/PpDd9s+TCFn2Ah4Zj9r9aDzu/dFYerSIUWart83C
 ehZYspwu25Q/7A8HshMdG0Pobg1XTtRYzZsduoWI0lY+hCpnwwCFWsNpN7D0AlMTODnFwqPKe1H0e
 Vmoi7eaw==;
Received: from [2601:1c0:6280:3f0::d05b] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF286-0002J1-0H; Wed, 24 Feb 2021 21:55:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] fbdev: atyfb: always declare aty_{ld,st}_lcd()
Date: Wed, 24 Feb 2021 13:55:28 -0800
Message-Id: <20210224215528.822-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previously added stubs for aty_{ld,}st_lcd() make it
so that these functions are used regardless of the config
options that were guarding them, so remove the #ifdef/#endif
lines and make their declarations always visible.
This fixes build warnings that were reported by clang:

   drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype for function 'aty_st_lcd' [-Wmissing-prototypes]
   void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
        ^
   drivers/video/fbdev/aty/atyfb_base.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)

   drivers/video/fbdev/aty/atyfb_base.c:183:5: warning: no previous prototype for function 'aty_ld_lcd' [-Wmissing-prototypes]
   u32 aty_ld_lcd(int index, const struct atyfb_par *par)
       ^
   drivers/video/fbdev/aty/atyfb_base.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 aty_ld_lcd(int index, const struct atyfb_par *par)

They should not be marked as static since they are used in
mach64_ct.c.

Fixes: bfa5782b9caa ("fbdev: atyfb: add stubs for aty_{ld,st}_lcd()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/video/fbdev/aty/atyfb.h |    3 ---
 1 file changed, 3 deletions(-)

--- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb.h
+++ linux-next-20210219/drivers/video/fbdev/aty/atyfb.h
@@ -287,11 +287,8 @@ static inline void aty_st_8(int regindex
 #endif
 }
 
-#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
-defined (CONFIG_FB_ATY_BACKLIGHT)
 extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
 extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
-#endif
 
     /*
      *  DAC operations
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
