Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3D6AC70A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE1910E3EA;
	Mon,  6 Mar 2023 16:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7B10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B04CA2242E;
 Mon,  6 Mar 2023 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pYlnhHsXehvuEXAaE7vZAg0+RcAOHve8GXvNQPf9tw=;
 b=qiEx02SdzApw3jnhZTQdIYKA9xXDDK49JbJWa87PpbhsOYS1FLqtq4IVvlAX7A7bzrnkOy
 KwEjaf67XVJKVYzXjacFtyEd4ZpKmNt+UXX8vy1nkgttGmtfleXA3kJUFGuyQskXvNFbQq
 K+Kom1HqiDvYkR4QjqLj6l3Cz/Bfj0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4pYlnhHsXehvuEXAaE7vZAg0+RcAOHve8GXvNQPf9tw=;
 b=bOA6jqmIa4PpO2pBUmZjmKn6flKLX0KA9+92wC+3LlLVKDgBpMpxkCY7q6gXfsNkxAnscA
 bl/5kOjJYN77+VBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 58E5513A6A;
 Mon,  6 Mar 2023 16:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eKbgFDQOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 74/99] fbdev/skeletonfb: Parse option string with struct
 option_iter
Date: Mon,  6 Mar 2023 16:59:51 +0100
Message-Id: <20230306160016.4459-75-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use struct option_iter to walk over the individual options in the
driver's option string. Replaces the hand-written strsep() loop with
a clean interface. The helpers for struct option_iter handle empty
option strings and empty options transparently. The struct's _init
and _release functions duplicate and release the option string's
memory buffer as needed.

Done in preparation of constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/skeletonfb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index 40c130ab6b38..1e876ad2a261 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -43,6 +43,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/cmdline.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -973,9 +974,19 @@ static struct platform_device *xxxfb_device;
  * Only necessary if your driver takes special options,
  * otherwise we fall back on the generic fb_setup().
  */
-static int __init xxxfb_setup(char *options)
+static int __init xxxfb_setup(const char *options)
 {
-    /* Parse user specified options (`video=xxxfb:') */
+	/* Parse user-specified options (`video=xxxfb:') */
+
+	struct option_iter iter;
+	const char *this_opt;
+
+	option_iter_init(&iter, options);
+
+	while (option_iter_next(&iter, this_opt)) {
+	}
+
+	option_iter_release(&iter);
 }
 #endif /* MODULE */
 
-- 
2.39.2

