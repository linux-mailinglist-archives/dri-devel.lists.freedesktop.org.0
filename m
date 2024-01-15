Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08582D6CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F83F10E24F;
	Mon, 15 Jan 2024 10:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0708A10E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:09:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 990A221DBB;
 Mon, 15 Jan 2024 10:09:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 68240132FA;
 Mon, 15 Jan 2024 10:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YBY6GGUEpWWeJAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jan 2024 10:09:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 2/3] video/cmdline: Hide __video_get_options() behind
 CONFIG_FB_CORE
Date: Mon, 15 Jan 2024 10:54:04 +0100
Message-ID: <20240115100939.21562-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115100939.21562-1-tzimmermann@suse.de>
References: <20240115100939.21562-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 990A221DBB
X-Spam-Level: 
X-Spam-Score: -4.00
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/cmdline.c | 2 ++
 include/video/cmdline.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/video/cmdline.c b/drivers/video/cmdline.c
index d3d257489c3d..4eeafe7f5943 100644
--- a/drivers/video/cmdline.c
+++ b/drivers/video/cmdline.c
@@ -80,6 +80,7 @@ const char *video_get_options(const char *name)
 }
 EXPORT_SYMBOL(video_get_options);
 
+#if defined(CONFIG_FB_CORE)
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
index 77292d1d6173..e0712deb842c 100644
--- a/include/video/cmdline.h
+++ b/include/video/cmdline.h
@@ -7,7 +7,9 @@
 
 const char *video_get_options(const char *name);
 
+#if defined(CONFIG_FB_CORE)
 /* exported for compatibility with fbdev; don't use in new code */
 bool __video_get_options(const char *name, const char **option, bool is_of);
+#endif
 
 #endif
-- 
2.43.0

