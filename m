Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F2A83F6E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155210E872;
	Thu, 10 Apr 2025 09:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yMDmLcys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mscf8TS/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N5t3gfO+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7aYNUrP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4712410E872
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:53:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9EC72116A;
 Thu, 10 Apr 2025 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744278790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3IJiph+bTJ00Jh4JLqEiEekCcgJQvl2w+P2i2KAdz+U=;
 b=yMDmLcysvYtfSXnwrwKbWiBacKWR8CevyiEIVuA/qt2v5M5u1Y0xEKMv0kD0/d7rOp/4S0
 E/9Uh58beFzWfmrzSIRGq8vm+pYT+l9fepApRQPaqFWsQlPVkeSgSbfO4ccr5T40WS/lSc
 Kfbl6mk7N+IEnFoa3MLWPVxZnYbAdps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744278790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3IJiph+bTJ00Jh4JLqEiEekCcgJQvl2w+P2i2KAdz+U=;
 b=Mscf8TS/szwxhafEGJufAXBKxiSIZAUrycN/5zIyUKsyRztQp9p9FNWTAktNeN3l06PSyH
 Sp7vQ1mc5j2D+5CA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N5t3gfO+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7aYNUrP7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744278788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3IJiph+bTJ00Jh4JLqEiEekCcgJQvl2w+P2i2KAdz+U=;
 b=N5t3gfO+FtDXic0e0ughu33OKRFOwJKz17Gt7zq+B9Kph9B39jhIUOuTf1hWEEm2+9qI5e
 vbi03r/eebl8YCjWekcC/CkeX/P4ApOQoFYHpE+lKJ+B9kkZeDldf4Yg6JdVX2cFvefk+Z
 hPwLoP/hwWT//RBLD3AaUL6X/CPvpIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744278788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3IJiph+bTJ00Jh4JLqEiEekCcgJQvl2w+P2i2KAdz+U=;
 b=7aYNUrP7wE2yzzhGpBCibVassYuY0i1tB1jg/1SrV36SLcaxafz6G8ZIq+EbCRUFbIhoY+
 M7/o+mOnyJc7DzCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8C2E132D8;
 Thu, 10 Apr 2025 09:53:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DJzBKwSV92fcIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 09:53:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: Mark CONFIG_DRM_HEADER_TEST as BROKEN
Date: Thu, 10 Apr 2025 11:50:03 +0200
Message-ID: <20250410095014.20471-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E9EC72116A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

The flag got lost during a merge. Add it back.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Simona Vetter <simona@ffwll.ch>
Closes: https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&highlight_names=&date=2025-04-10&show_html=true
Fixes: 1afba39f9305 ("Merge drm/drm-next into drm-misc-next")
Acked-by: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index c493743e8aca0..fa6ee76f4d3c5 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -27,7 +27,7 @@ config DRM_WERROR
 
 config DRM_HEADER_TEST
 	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT
+	depends on DRM && EXPERT && BROKEN
 	default n
 	help
 	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
-- 
2.49.0

