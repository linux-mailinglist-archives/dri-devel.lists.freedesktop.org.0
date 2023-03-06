Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B46AC682
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF29910E392;
	Mon,  6 Mar 2023 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8582B10E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43F5D1FEE3;
 Mon,  6 Mar 2023 16:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GGmlkKUitP/mPaJwo4DVCYrRiGQzK8ly7VqVkEk13o=;
 b=LHeaDUuqcFLT7mvfjL3Oe2/1UgmRJHfKInYcEKlnvYt4gTrcecvGEXnoNnAJqb35G/SlDv
 nPl1lofsiQ/GLHtiJ6rgy5havdpCwU9WJxddivM0PSECOADY2BIrzW1W45EhJu3rDUdSeL
 XkPTWdMb62Vr0KLMHhq8iLyaxGuyRzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GGmlkKUitP/mPaJwo4DVCYrRiGQzK8ly7VqVkEk13o=;
 b=CgsnbGbmnWvItotHj0adFz0sUs6nZ/rNAfneC3yL5yga7kw0lmaeTHogJ5Fs4t7PAfUWVw
 IZvSo6EYQ983jqAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C9EF613513;
 Mon,  6 Mar 2023 16:00:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cNVhMDcOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 83/99] fbdev/tgafb: Parse option string with struct option_iter
Date: Mon,  6 Mar 2023 17:00:00 +0100
Message-Id: <20230306160016.4459-84-tzimmermann@suse.de>
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
 drivers/video/fbdev/tgafb.c | 45 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index a412fdddfd8c..704909edf89d 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -14,6 +14,7 @@
 
 #include <linux/aperture.h>
 #include <linux/bitrev.h>
+#include <linux/cmdline.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1571,35 +1572,31 @@ static void tgafb_exit(void)
 }
 
 #ifndef MODULE
-static int tgafb_setup(char *arg)
+static int tgafb_setup(const char *arg)
 {
-	char *this_opt;
+	struct option_iter iter;
+	const char *this_opt;
 
-	if (arg && *arg) {
-		while ((this_opt = strsep(&arg, ","))) {
-			if (!*this_opt)
+	option_iter_init(&iter, arg);
+
+	while (option_iter_next(&iter, this_opt)) {
+		if (!strncmp(this_opt, "mode:", 5)) {
+			static char mode_option_buf[256];
+			int ret;
+
+			ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s",
+				       this_opt + 5);
+			if (WARN(ret < 0, "tgafb: ignoring invalid option, ret=%d\n", ret))
 				continue;
-			if (!strncmp(this_opt, "mode:", 5)) {
-				static char mode_option_buf[256];
-				int ret;
-
-				ret = snprintf(mode_option_buf, sizeof(mode_option_buf), "%s",
-					       this_opt + 5);
-				if (WARN(ret < 0,
-					 "tgafb: ignoring invalid option, ret=%d\n",
-					 ret))
-					continue;
-				if (WARN(ret >= sizeof(mode_option_buf),
-					 "tgafb: option too long\n"))
-					continue;
-				mode_option = mode_option_buf;
-			} else
-				printk(KERN_ERR
-				       "tgafb: unknown parameter %s\n",
-				       this_opt);
-		}
+			if (WARN(ret >= sizeof(mode_option_buf), "tgafb: option too long\n"))
+				continue;
+			mode_option = mode_option_buf;
+		} else
+			printk(KERN_ERR "tgafb: unknown parameter %s\n", this_opt);
 	}
 
+	option_iter_release(&iter);
+
 	return 0;
 }
 #endif /* !MODULE */
-- 
2.39.2

