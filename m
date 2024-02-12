Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9D851081
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6FB10EBCF;
	Mon, 12 Feb 2024 10:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YtF/4tai";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kN0s/vHw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YtF/4tai";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kN0s/vHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73C410E667;
 Mon, 12 Feb 2024 10:17:18 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D60A1FBB2;
 Mon, 12 Feb 2024 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707733037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NTPodXe3vKKtY3GIWahnYIvNq6IfT/2HcGPXH4RaAc=;
 b=YtF/4taimLWy7xtUmo+uA3xJtPj+sp3yddQfgtdsI7SaWipIUbqUDadAbcfw1V+Z6pSSs0
 Nbg/xsanUrUv4FnRe1kVrgSfQfIzhOmo49pb5vit9kiZtj7INIzX4fj5eBC6Fk80Dxe9Sl
 aOOAmGAWpnJ91wek0cMdjzR1GUaHN9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707733037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NTPodXe3vKKtY3GIWahnYIvNq6IfT/2HcGPXH4RaAc=;
 b=kN0s/vHw7wDBNlcB7HiXMnNKS7OHYCXkX/01MPSVB0bIKQoe/OpzW2H1poHZRijKHTF04w
 VUQUjzcfF6Q2oyBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707733037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NTPodXe3vKKtY3GIWahnYIvNq6IfT/2HcGPXH4RaAc=;
 b=YtF/4taimLWy7xtUmo+uA3xJtPj+sp3yddQfgtdsI7SaWipIUbqUDadAbcfw1V+Z6pSSs0
 Nbg/xsanUrUv4FnRe1kVrgSfQfIzhOmo49pb5vit9kiZtj7INIzX4fj5eBC6Fk80Dxe9Sl
 aOOAmGAWpnJ91wek0cMdjzR1GUaHN9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707733037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NTPodXe3vKKtY3GIWahnYIvNq6IfT/2HcGPXH4RaAc=;
 b=kN0s/vHw7wDBNlcB7HiXMnNKS7OHYCXkX/01MPSVB0bIKQoe/OpzW2H1poHZRijKHTF04w
 VUQUjzcfF6Q2oyBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BF7713A2D;
 Mon, 12 Feb 2024 10:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id eJCvAS3wyWVdBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 10:17:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] fbdev: Do not include <linux/fs.h> in header
Date: Mon, 12 Feb 2024 11:13:15 +0100
Message-ID: <20240212101712.23675-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212101712.23675-1-tzimmermann@suse.de>
References: <20240212101712.23675-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Bar: +
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="YtF/4tai";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="kN0s/vHw"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.47 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,ffwll.ch,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.02)[51.59%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 1.47
X-Rspamd-Queue-Id: 5D60A1FBB2
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forward declare struct inode and remove the include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 7380d959c5d53..f269ba5202809 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -8,7 +8,6 @@
 
 #define FBIO_CURSOR            _IOWR('F', 0x08, struct fb_cursor_user)
 
-#include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/workqueue.h>
 #include <linux/notifier.h>
@@ -22,6 +21,7 @@ struct vm_area_struct;
 struct fb_info;
 struct device;
 struct file;
+struct inode;
 struct videomode;
 struct device_node;
 
-- 
2.43.0

