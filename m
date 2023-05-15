Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14241703326
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5610E1C3;
	Mon, 15 May 2023 16:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D73210E1C3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:33:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CBED6274B;
 Mon, 15 May 2023 16:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC97C433EF;
 Mon, 15 May 2023 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1684168429;
 bh=GnuTKGySGlfr07daI7HAiFk0boCdBF/4zjHSMFSEV+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1aIdYLMOHA1hZ1ACdhSlfahkkVrnJw5/tcISA0f4/g5E7BpAJqL+0lb/EM20GH5Dz
 iufl1rmSfm4upXI4e1ytXJobyFWN6F+lS4Ps9QTgm54XJ3BcQTcwWU8++u1FDMlGp8
 9Dr7ZGOiAJYUwKsv7TZthJ8PM5NJ12sWQzp15amA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.14 046/116] linux/vt_buffer.h: allow either builtin or
 modular for macros
Date: Mon, 15 May 2023 18:25:43 +0200
Message-Id: <20230515161659.786548194@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515161658.228491273@linuxfoundation.org>
References: <20230515161658.228491273@linuxfoundation.org>
User-Agent: quilt/0.67
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 2b76ffe81e32afd6d318dc4547e2ba8c46207b77 ]

Fix build errors on ARCH=alpha when CONFIG_MDA_CONSOLE=m.
This allows the ARCH macros to be the only ones defined.

In file included from ../drivers/video/console/mdacon.c:37:
../arch/alpha/include/asm/vga.h:17:40: error: expected identifier or '(' before 'volatile'
   17 | static inline void scr_writew(u16 val, volatile u16 *addr)
      |                                        ^~~~~~~~
../include/linux/vt_buffer.h:24:34: note: in definition of macro 'scr_writew'
   24 | #define scr_writew(val, addr) (*(addr) = (val))
      |                                  ^~~~
../include/linux/vt_buffer.h:24:40: error: expected ')' before '=' token
   24 | #define scr_writew(val, addr) (*(addr) = (val))
      |                                        ^
../arch/alpha/include/asm/vga.h:17:20: note: in expansion of macro 'scr_writew'
   17 | static inline void scr_writew(u16 val, volatile u16 *addr)
      |                    ^~~~~~~~~~
../arch/alpha/include/asm/vga.h:25:29: error: expected identifier or '(' before 'volatile'
   25 | static inline u16 scr_readw(volatile const u16 *addr)
      |                             ^~~~~~~~

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Link: https://lore.kernel.org/r/20230329021529.16188-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/vt_buffer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/vt_buffer.h b/include/linux/vt_buffer.h
index 848db1b1569ff..919d999a8c1db 100644
--- a/include/linux/vt_buffer.h
+++ b/include/linux/vt_buffer.h
@@ -16,7 +16,7 @@
 
 #include <linux/string.h>
 
-#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_MDA_CONSOLE)
+#if IS_ENABLED(CONFIG_VGA_CONSOLE) || IS_ENABLED(CONFIG_MDA_CONSOLE)
 #include <asm/vga.h>
 #endif
 
-- 
2.39.2



