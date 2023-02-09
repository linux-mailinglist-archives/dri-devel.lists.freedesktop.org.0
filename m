Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571BB690AFF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C331310EAEC;
	Thu,  9 Feb 2023 13:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9575710EAE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35C8C5D031;
 Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRGV1sHWfA7dHKuzbZtPETV56sGZm893xDJqn9cFqAI=;
 b=ysXmUKmdYXeGDvLEm+JQVP6v7SCD19NlPd+F4LIqlZ5CPgmjMdhcaMGivagmFoyJmPkD3X
 fllymK0hneVqsFRNk48x7r79fovNMEuuZHHCWc0IZ66Jy7r3iOvggKFmE9cG2Jani52bMh
 DELoNCZiMwIUkc2gAo4HUoDas3QPwk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRGV1sHWfA7dHKuzbZtPETV56sGZm893xDJqn9cFqAI=;
 b=swXYWmDfLiLpLXZVgBaUGMMoVUFVyi3ll6Vjpk9dJdYBEhGtsxvlSYiq5s+/pkkJWzgV1A
 bmFCfMPDFVn9lTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE117138E4;
 Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UD5MOUD75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
Date: Thu,  9 Feb 2023 14:55:00 +0100
Message-Id: <20230209135509.7786-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209135509.7786-1-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In fb_get_options(), always duplicate the returned option string and
transfer ownership of the memory to the function's caller.

Until now, only the global option string got duplicated and transferred
to the caller; the per-driver options were owned by fb_get_options().
In the end, it was impossible for the function's caller to detect if
it had to release the string's memory buffer. Hence, all calling drivers
leak the memory buffer. The leaks have existed ever since, but drivers
only call fb_get_option() once as part of module initialization. So the
amount of leaked memory is not significant.

Fix the semantics of fb_get_option() by unconditionally transferring
ownership of the memory buffer to the caller. Later patches can resolve
the memory leaks in the fbdev drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 6792010d6716..702b00b71870 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -30,13 +30,17 @@ EXPORT_SYMBOL_GPL(fb_mode_option);
  *          (video=<name>:<options>)
  * @option: the option will be stored here
  *
+ * The caller owns the string returned in @option and is
+ * responsible for releasing the memory.
+ *
  * NOTE: Needed to maintain backwards compatibility
  */
 int fb_get_options(const char *name, char **option)
 {
-	char *opt, *options = NULL;
+	const char *options = NULL;
 	int retval = 0;
 	int name_len = strlen(name), i;
+	char *opt;
 
 	if (name_len && ofonly && strncmp(name, "offb", 4))
 		retval = 1;
@@ -55,12 +59,16 @@ int fb_get_options(const char *name, char **option)
 	}
 	/* No match, pass global option */
 	if (!options && option && fb_mode_option)
-		options = kstrdup(fb_mode_option, GFP_KERNEL);
+		options = fb_mode_option;
 	if (options && !strncmp(options, "off", 3))
 		retval = 1;
 
-	if (option)
-		*option = options;
+	if (option) {
+		if (options)
+			*option = kstrdup(options, GFP_KERNEL);
+		else
+			*option = NULL;
+	}
 
 	return retval;
 }
-- 
2.39.1

