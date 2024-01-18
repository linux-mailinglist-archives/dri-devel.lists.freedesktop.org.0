Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D7831578
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F9E10E71D;
	Thu, 18 Jan 2024 09:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B5610E71D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:07:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91CD01F76E;
 Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQaqcr5hH6CH51DZABXoX3g9p53ULCPq1i1ADmCWCX0=;
 b=XvygUUlrmdfrEKFOb8kLOotF0lelcMsN7S2oZSlHu6QcfhSWXLOYCti5orgC1J8oadKs4e
 iXzpvK6EzWNfV4EDHb64ZFGUKhLCTPD7eymhgYD454CqscE4iwzCdmwPwEGvjvKCkauaEW
 1Dk+ST9SDoKc7YvnnxjwI/JRB9kdgrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705568843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQaqcr5hH6CH51DZABXoX3g9p53ULCPq1i1ADmCWCX0=;
 b=uI6loTc10od7FviretdP8mPHK7bplrWZi+60jj2X0Lk8knDGwT0OSVrr8z+6V3HEyApsF4
 MieCJtC1oGfhY7Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705568843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQaqcr5hH6CH51DZABXoX3g9p53ULCPq1i1ADmCWCX0=;
 b=XvygUUlrmdfrEKFOb8kLOotF0lelcMsN7S2oZSlHu6QcfhSWXLOYCti5orgC1J8oadKs4e
 iXzpvK6EzWNfV4EDHb64ZFGUKhLCTPD7eymhgYD454CqscE4iwzCdmwPwEGvjvKCkauaEW
 1Dk+ST9SDoKc7YvnnxjwI/JRB9kdgrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705568843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQaqcr5hH6CH51DZABXoX3g9p53ULCPq1i1ADmCWCX0=;
 b=uI6loTc10od7FviretdP8mPHK7bplrWZi+60jj2X0Lk8knDGwT0OSVrr8z+6V3HEyApsF4
 MieCJtC1oGfhY7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60A5E13874;
 Thu, 18 Jan 2024 09:07:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sK13FkvqqGWIMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Jan 2024 09:07:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH v2 2/3] video/cmdline: Hide __video_get_options() behind
 CONFIG_FB_CORE
Date: Thu, 18 Jan 2024 10:05:27 +0100
Message-ID: <20240118090721.7995-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118090721.7995-1-tzimmermann@suse.de>
References: <20240118090721.7995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function __video_get_options() only exists for compatibility
with old fbdev drivers that cannot be refactored easily. Hide it
behind CONFIG_FB_CORE.

v2:
	* support CONFIG_FB_CORE=m via IS_ENABLED() (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/cmdline.c | 2 ++
 include/video/cmdline.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/video/cmdline.c b/drivers/video/cmdline.c
index d3d257489c3d..49ee3fb4951a 100644
--- a/drivers/video/cmdline.c
+++ b/drivers/video/cmdline.c
@@ -80,6 +80,7 @@ const char *video_get_options(const char *name)
 }
 EXPORT_SYMBOL(video_get_options);
 
+#if IS_ENABLED(CONFIG_FB_CORE)
 bool __video_get_options(const char *name, const char **options, bool is_of)
 {
 	bool enabled = true;
@@ -96,6 +97,7 @@ bool __video_get_options(const char *name, const char **options, bool is_of)
 	return enabled;
 }
 EXPORT_SYMBOL(__video_get_options);
+#endif
 
 /*
  * Process command line options for video adapters. This function is
diff --git a/include/video/cmdline.h b/include/video/cmdline.h
index 77292d1d6173..76649465bb08 100644
--- a/include/video/cmdline.h
+++ b/include/video/cmdline.h
@@ -3,11 +3,14 @@
 #ifndef VIDEO_CMDLINE_H
 #define VIDEO_CMDLINE_H
 
+#include <linux/kconfig.h>
 #include <linux/types.h>
 
 const char *video_get_options(const char *name);
 
+#if IS_ENABLED(CONFIG_FB_CORE)
 /* exported for compatibility with fbdev; don't use in new code */
 bool __video_get_options(const char *name, const char **option, bool is_of);
+#endif
 
 #endif
-- 
2.43.0

