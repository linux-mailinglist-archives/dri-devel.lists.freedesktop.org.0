Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5386FF30
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEAE10FF87;
	Mon,  4 Mar 2024 10:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Br3bE28p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r9rao9pD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sKxDlXcE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uu7Ext8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148A10FF87
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:38:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECBF64E1B1;
 Mon,  4 Mar 2024 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709548704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7knSlm+Xpz79/wAHVMqO9b7j5pNgWs2u9Mnb/BYTBvw=;
 b=Br3bE28pWqvogHlWf8fRZ8ugTUz7OIFkZdZGP3b8iD287614SGEjWyoY+7l+Klkmt+8mVy
 1xaNYlfeduOyQTKOmV5FVI1+10oxdid/CEoQrfTWQktJRmKOAe2Few8SVcJ1WGReIB3Dm0
 hvglzldjd6VLkRUmjeld1kaEgRwC6sY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709548704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7knSlm+Xpz79/wAHVMqO9b7j5pNgWs2u9Mnb/BYTBvw=;
 b=r9rao9pDfbZfv0nim7tX82CynDya97UVgObySznDvV9Mo4IRlAV39FBRMr2QDBO7LTGU56
 YAwFon53U3myziCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709548702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7knSlm+Xpz79/wAHVMqO9b7j5pNgWs2u9Mnb/BYTBvw=;
 b=sKxDlXcEet3xyZlJ6DgHRdVXZ39rQ6B697kzUbwmr2crMqnUAu66XSY7sznbPFba/J/Yml
 YDJdIvknNAqqH2x7QVPxOEYVSMy7HGDNP+xunGq1goG9KfAIqT4F8P8liksB32VIVLbguX
 I+tGLDdToTv5g9c3UvZrWuWuJvqU/xk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709548702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7knSlm+Xpz79/wAHVMqO9b7j5pNgWs2u9Mnb/BYTBvw=;
 b=Uu7Ext8zCTL2u5ll5E0jWv74v6MycogfTUQ3Fe0AZEzSStXBzLtTSO88a8lzQG/GinPvZh
 FWnByVlaMRExgZDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A19DD13419;
 Mon,  4 Mar 2024 10:38:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id UzjRJZ6k5WUQHAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 10:38:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au, jani.nikula@intel.com, naresh.kamboju@linaro.org,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbdev/chipsfb: Include <linux/backlight.h>
Date: Mon,  4 Mar 2024 11:38:01 +0100
Message-ID: <20240304103820.16708-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [2.80 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,linaro.org:email,suse.de:email,lists.freedesktop.org:email,intel.com:email];
 FREEMAIL_TO(0.00)[ellerman.id.au,intel.com,linaro.org,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-2.10)[95.65%]
X-Spam-Level: **
X-Spam-Score: 2.80
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

Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for
the backlight header has recently been removed from <linux/fb.h>.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/dri-devel/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/chipsfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
index b80711f13df8a..b16a905588fed 100644
--- a/drivers/video/fbdev/chipsfb.c
+++ b/drivers/video/fbdev/chipsfb.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
-- 
2.44.0

