Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7F96EC9B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B345310E927;
	Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="h2b86UdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mmJzGQv8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h2b86UdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mmJzGQv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E2010E946
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 354AA1F897;
 Fri,  6 Sep 2024 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5hFfKM54JOQ1P0mNCga3j3GfvB8G75ey7d8hLrAjXc=;
 b=h2b86UdCjZ/J5Ubhmuicp6WzaxNxfOSuElqmr42oCUBSUcK79DHhzoOxqg/voV8epWrjxG
 FpPM4PPG17y92wt3if/x3l/fbjO6kGdQfzIbBJUwF5YUWNlAkkdnYOXxd+ymIOtjrXda6E
 yuHS/SOQFTJDkGbPDInBFpcrmc4PDOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5hFfKM54JOQ1P0mNCga3j3GfvB8G75ey7d8hLrAjXc=;
 b=mmJzGQv8igMouypk0nVDMp6fJKXCp8s0uS8FeJ2l4WWlLaDoNH2gS02GnbSIjZ8ro2NRLz
 LcRMphk1L7ZsgYAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5hFfKM54JOQ1P0mNCga3j3GfvB8G75ey7d8hLrAjXc=;
 b=h2b86UdCjZ/J5Ubhmuicp6WzaxNxfOSuElqmr42oCUBSUcK79DHhzoOxqg/voV8epWrjxG
 FpPM4PPG17y92wt3if/x3l/fbjO6kGdQfzIbBJUwF5YUWNlAkkdnYOXxd+ymIOtjrXda6E
 yuHS/SOQFTJDkGbPDInBFpcrmc4PDOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5hFfKM54JOQ1P0mNCga3j3GfvB8G75ey7d8hLrAjXc=;
 b=mmJzGQv8igMouypk0nVDMp6fJKXCp8s0uS8FeJ2l4WWlLaDoNH2gS02GnbSIjZ8ro2NRLz
 LcRMphk1L7ZsgYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C99BA13A7A;
 Fri,  6 Sep 2024 07:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cGP3L0G12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/28] backlight: lcd: Rearrange code in
 fb_notifier_callback()
Date: Fri,  6 Sep 2024 09:52:15 +0200
Message-ID: <20240906075439.98476-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -6.80
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

First acquire the ops_lock and do all tests while holding it. Rearranges
the code in lcd's fb_notifier_callback() to resemble the callback in
the backlight module. This will simplify later changes to these tests.

v2:
- avoid gotos by using guard(mutex) (Daniel)
- fix typos in commit description (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/lcd.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index ceec90ca758b..2f57d6867d42 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -27,24 +27,25 @@
 static int fb_notifier_callback(struct notifier_block *self,
 				 unsigned long event, void *data)
 {
-	struct lcd_device *ld;
+	struct lcd_device *ld = container_of(self, struct lcd_device, fb_notif);
 	struct fb_event *evdata = data;
+	struct fb_info *info = evdata->info;
+
+	guard(mutex)(&ld->ops_lock);
 
-	ld = container_of(self, struct lcd_device, fb_notif);
 	if (!ld->ops)
 		return 0;
+	if (ld->ops->check_fb && !ld->ops->check_fb(ld, info))
+		return 0;
 
-	mutex_lock(&ld->ops_lock);
-	if (!ld->ops->check_fb || ld->ops->check_fb(ld, evdata->info)) {
-		if (event == FB_EVENT_BLANK) {
-			if (ld->ops->set_power)
-				ld->ops->set_power(ld, *(int *)evdata->data);
-		} else {
-			if (ld->ops->set_mode)
-				ld->ops->set_mode(ld, evdata->data);
-		}
+	if (event == FB_EVENT_BLANK) {
+		if (ld->ops->set_power)
+			ld->ops->set_power(ld, *(int *)evdata->data);
+	} else {
+		if (ld->ops->set_mode)
+			ld->ops->set_mode(ld, evdata->data);
 	}
-	mutex_unlock(&ld->ops_lock);
+
 	return 0;
 }
 
-- 
2.46.0

