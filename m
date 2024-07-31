Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B6942E87
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD9610E2C4;
	Wed, 31 Jul 2024 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vxk3HdSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UlQxfpIs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vxk3HdSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UlQxfpIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B8810E2C4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 425051F849;
 Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
 b=vxk3HdSORz0X1ezizYKWXo0WtELsfy8iP7JttYBoHw/dufZrJxMByZYVfRkRcvgLa2vt+o
 Yv4n2WPkmErPOMQwfjzCwG3vmqMVHOon7T4nFF1rTHqosqYZlt2B818r6HeWtY4fxaVH7X
 PM0b0W0VhkeETDNKiJseL8tYUjQ+IkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
 b=UlQxfpIsb+BmDVkUpo4O+UUYSfzbAKOs2xWrum+nOvsLIzThSjbz7SSAfVu/OR0aG974GD
 Jq7G6gtd8CkX4oAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
 b=vxk3HdSORz0X1ezizYKWXo0WtELsfy8iP7JttYBoHw/dufZrJxMByZYVfRkRcvgLa2vt+o
 Yv4n2WPkmErPOMQwfjzCwG3vmqMVHOon7T4nFF1rTHqosqYZlt2B818r6HeWtY4fxaVH7X
 PM0b0W0VhkeETDNKiJseL8tYUjQ+IkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429306;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkS9ADi9HZeN39Q9QY9EU8mRvpo150KmCobaHcVZbHY=;
 b=UlQxfpIsb+BmDVkUpo4O+UUYSfzbAKOs2xWrum+nOvsLIzThSjbz7SSAfVu/OR0aG974GD
 Jq7G6gtd8CkX4oAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1320513AD8;
 Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uNZeA3ovqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/9] fbdev: atyfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:44 +0200
Message-ID: <20240731123502.1145082-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmx.de]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/aty/atyfb_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index a6dd1cd27125..210fd3ac18a4 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2272,7 +2272,7 @@ static void aty_bl_init(struct atyfb_par *par)
 			    0xFF * FB_BACKLIGHT_MAX / MAX_LEVEL);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("aty: Backlight initialized (%s)\n", name);
-- 
2.45.2

