Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A56F4478
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D54510E53E;
	Tue,  2 May 2023 13:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235E10E540
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:02:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 06D211F8BE;
 Tue,  2 May 2023 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683032547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6kq3OyRQ9pgzZmJ23ahXTOGr7SsYN4Eh2vl2HKml1g=;
 b=G9BpM2T1Ys/UhuirkBuAKZ73BHSOzRELPkPpCpD4+qTsaySfZPcMwy26FCK4ARx1tk4uW2
 ZTMr6PYHLOTpMIqSBtZ7Poi4zg1XaCv58s5VQQtSQs2osjj04J/Mib7qiW8vqjmmk0wYao
 7bOvRkd/37JeBJU5sQa5zIEyBkqMKpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683032547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6kq3OyRQ9pgzZmJ23ahXTOGr7SsYN4Eh2vl2HKml1g=;
 b=1U5DAyseVohEGfTgif4+9wlGQ0H0TtFCqWRJU/YU1WswUffCwPx9wS14sLN4LEZIGdTph6
 oEiBzdvz98CyOlBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A890139D2;
 Tue,  2 May 2023 13:02:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yKQJJeIJUWRYTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 02 May 2023 13:02:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Subject: [PATCH v3 3/6] fbdev: Include <linux/io.h> in various drivers
Date: Tue,  2 May 2023 15:02:20 +0200
Message-Id: <20230502130223.14719-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
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
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code uses writel() and similar I/O-memory helpers. Include
the header file to get the declarations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/arcfb.c       | 1 +
 drivers/video/fbdev/aty/atyfb.h   | 2 ++
 drivers/video/fbdev/wmt_ge_rops.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..d631d53f42ad 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -41,6 +41,7 @@
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/arcfb.h>
diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
index 465f55beb97f..30da3e82ed3c 100644
--- a/drivers/video/fbdev/aty/atyfb.h
+++ b/drivers/video/fbdev/aty/atyfb.h
@@ -3,8 +3,10 @@
  *  ATI Frame Buffer Device Driver Core Definitions
  */
 
+#include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+
     /*
      *  Elements of the hardware specific atyfb_par structure
      */
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 42255d27a1db..99c7b0aea615 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/fb.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
+
 #include "core/fb_draw.h"
 #include "wmt_ge_rops.h"
 
-- 
2.40.1

