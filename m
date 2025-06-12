Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2065AD6A60
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A5510E7A6;
	Thu, 12 Jun 2025 08:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="am8tzd0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sJBuITO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="am8tzd0q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5sJBuITO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1510E7A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:21:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 54DF01F7EC;
 Thu, 12 Jun 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
 b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
 a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
 qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
 b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
 /+adl1gTe2+6DpCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=am8tzd0q;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5sJBuITO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
 b=am8tzd0qbejFWyneBMVIjMmmk6jb6Zn7Luf7K/oe+jflha+VeB2yX1WsfrgzmGfJ5OQS2b
 a9ATkzs74vuXpxY+X/lsuX8dSNL2JWVmL1FbYRQ7r2oli30Yc14HxRCgomhCLm1eoQuEXV
 qjpdG7+hu2nXLDR7cyhGWJAcG6AMl1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMbLJupS5OSTa8U/8vbg4Z1Ks0Ank3I8G7D8geSAtv8=;
 b=5sJBuITOmizzL61ZX9azTl1jzzTG5hZvyF1oUPShF6EdIDxWOaiIaqQVw5qGD2iKcCFCbw
 /+adl1gTe2+6DpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 017C913A6D;
 Thu, 12 Jun 2025 08:21:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UPKlOgWOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/14] fbdev/c2p: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:26 +0200
Message-ID: <20250612081738.197826-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 54DF01F7EC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

Fix the compile-time warnings

  drivers/video/fbdev/c2p_iplan2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/c2p_planar.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/c2p_iplan2.c | 1 +
 drivers/video/fbdev/c2p_planar.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/c2p_iplan2.c b/drivers/video/fbdev/c2p_iplan2.c
index cfd2361f24b1..ee4b315d3f40 100644
--- a/drivers/video/fbdev/c2p_iplan2.c
+++ b/drivers/video/fbdev/c2p_iplan2.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
diff --git a/drivers/video/fbdev/c2p_planar.c b/drivers/video/fbdev/c2p_planar.c
index 819c82a98ac0..236aad5137ef 100644
--- a/drivers/video/fbdev/c2p_planar.c
+++ b/drivers/video/fbdev/c2p_planar.c
@@ -8,6 +8,7 @@
  *  for more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
-- 
2.49.0

