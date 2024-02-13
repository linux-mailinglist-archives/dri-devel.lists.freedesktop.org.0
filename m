Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE0852B70
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB310E3B5;
	Tue, 13 Feb 2024 08:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E7dwzeGl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l5EL0dJN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7dwzeGl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l5EL0dJN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6AA10E0E9;
 Tue, 13 Feb 2024 08:44:09 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E10B522177;
 Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707813847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H1rBmEPcJ9Jdg4FfafBNA2u6jHLRBEjb0k9CCbIMo8=;
 b=E7dwzeGlJ0ySYN9ACEycNdb08IEYz7JUMaSBYHWWxpIyCzKTigXFogAgMOkkoC+37AfvPZ
 tcTEnvE/7Gb+FLDfZ6fwC8ixEV8jL3vd3TK5N1sfPBXViTPNdjGNXTrFA2/8/14XwPUFGt
 7KyQln11YSqNLrSpBHcAwfQKbOYzb0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707813847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H1rBmEPcJ9Jdg4FfafBNA2u6jHLRBEjb0k9CCbIMo8=;
 b=l5EL0dJNSoVbJ0/G2bSf0ekZHpdai8hQ/jQxtveqC8iTUseWG/OhPbsnju2gH+t10hHwcg
 +oChvrkwlyOJURCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707813847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H1rBmEPcJ9Jdg4FfafBNA2u6jHLRBEjb0k9CCbIMo8=;
 b=E7dwzeGlJ0ySYN9ACEycNdb08IEYz7JUMaSBYHWWxpIyCzKTigXFogAgMOkkoC+37AfvPZ
 tcTEnvE/7Gb+FLDfZ6fwC8ixEV8jL3vd3TK5N1sfPBXViTPNdjGNXTrFA2/8/14XwPUFGt
 7KyQln11YSqNLrSpBHcAwfQKbOYzb0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707813847;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+H1rBmEPcJ9Jdg4FfafBNA2u6jHLRBEjb0k9CCbIMo8=;
 b=l5EL0dJNSoVbJ0/G2bSf0ekZHpdai8hQ/jQxtveqC8iTUseWG/OhPbsnju2gH+t10hHwcg
 +oChvrkwlyOJURCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BBA91329E;
 Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kPjdINcry2VOFwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Feb 2024 08:44:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 4/8] fbdev: Do not include <linux/fs.h> in header
Date: Tue, 13 Feb 2024 09:42:22 +0100
Message-ID: <20240213084403.20995-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213084403.20995-1-tzimmermann@suse.de>
References: <20240213084403.20995-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[14];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[20.64%]
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
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

