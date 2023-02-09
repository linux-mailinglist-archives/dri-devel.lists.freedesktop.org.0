Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB06690B00
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B810EAEE;
	Thu,  9 Feb 2023 13:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4B10EAE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 754C7229FA;
 Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgQsjwqOWkegEQwhCA0vXxb8H/G8l/Mn0HdB+pT9yi4=;
 b=A72ExH9XqqIvCiwkmXutNdzfBj0p26bIsdTaZbdfhsM4lh6uTXKmCMaBbdigKbFZA+RDsE
 3bxVscHPBVA/pH3axAiRW3zHWgU8Je09kvWxnUHsJSFAvxF2wAP6qGAk9LN0qdDjtbo1il
 U1V+0pD2xaDA11ypPqlRZlEwaJ1Y8hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgQsjwqOWkegEQwhCA0vXxb8H/G8l/Mn0HdB+pT9yi4=;
 b=4+HZO7hfNYIRH3XythLS8e3AYkH7hcjPbL7VrBkz8MVPHSF4mxhok29IxxRuEsDedg62I4
 5MpN3EUbFqxlu8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A06613915;
 Thu,  9 Feb 2023 13:55:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UJdgDUH75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 03/11] fbdev: Support NULL for name in option-string lookup
Date: Thu,  9 Feb 2023 14:55:01 +0100
Message-Id: <20230209135509.7786-4-tzimmermann@suse.de>
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

Ignore the per-driver video options if no driver name has been
specified to fb_get_option(). Return the global options in this
case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_cmdline.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 702b00b71870..cc8a88e8f308 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -39,13 +39,18 @@ int fb_get_options(const char *name, char **option)
 {
 	const char *options = NULL;
 	int retval = 0;
-	int name_len = strlen(name), i;
+	size_t name_len;
 	char *opt;
 
+	if (name)
+		name_len = strlen(name);
+
 	if (name_len && ofonly && strncmp(name, "offb", 4))
 		retval = 1;
 
 	if (name_len && !retval) {
+		unsigned int i;
+
 		for (i = 0; i < FB_MAX; i++) {
 			if (video_options[i] == NULL)
 				continue;
-- 
2.39.1

