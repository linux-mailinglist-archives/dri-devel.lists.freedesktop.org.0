Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF87958258
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A7510E58A;
	Tue, 20 Aug 2024 09:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tLf/Y8Lu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u2OFS3Sn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tLf/Y8Lu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u2OFS3Sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEAE10E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 178451FFC8;
 Tue, 20 Aug 2024 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
 b=tLf/Y8Luu1c0nMqYb7IT8+MAc3LbQALDPqTH6gsOMvC9qLfMUWjtO995BgvyTZ8djJcWDn
 ilFP4DtDFL3Axa+OhtudXlURoMytFu0VMbYTvGqPhjyT+4SavWGhI0KSPzcBZwRHyR7RYi
 sE+sUBarzR9lIE9jw75ffXwysZ4Q7nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
 b=u2OFS3SnWkU8dy1WFlB/8tIon03NpjGoe7IWousttdZ1IpLcVKnc1K7R3vxANOAi+0uy3e
 808N9UxrehAjs9CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
 b=tLf/Y8Luu1c0nMqYb7IT8+MAc3LbQALDPqTH6gsOMvC9qLfMUWjtO995BgvyTZ8djJcWDn
 ilFP4DtDFL3Axa+OhtudXlURoMytFu0VMbYTvGqPhjyT+4SavWGhI0KSPzcBZwRHyR7RYi
 sE+sUBarzR9lIE9jw75ffXwysZ4Q7nQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdYJKJBzIuJjmmFlZR1srYPPFdL6Wytap1BTJ9bD9YE=;
 b=u2OFS3SnWkU8dy1WFlB/8tIon03NpjGoe7IWousttdZ1IpLcVKnc1K7R3vxANOAi+0uy3e
 808N9UxrehAjs9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 926BA13AFE;
 Tue, 20 Aug 2024 09:34:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iKvxIENjxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:34:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/28] backlight: lcd: Rearrange code in fb_notifier_callback()
Date: Tue, 20 Aug 2024 11:22:39 +0200
Message-ID: <20240820093452.68270-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_TWELVE(0.00)[16];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
X-Spam-Flag: NO
X-Spam-Level: 
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

First aqcuire the ops_lock and do al tests while holing it. Rearranges
the code in lcd's fb_notifier_callback() to resemble the callback in
the backlight module. This will simplify later changes to these tests.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/lcd.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
index ceec90ca758b..0cd0fa1b24f9 100644
--- a/drivers/video/backlight/lcd.c
+++ b/drivers/video/backlight/lcd.c
@@ -29,21 +29,25 @@ static int fb_notifier_callback(struct notifier_block *self,
 {
 	struct lcd_device *ld;
 	struct fb_event *evdata = data;
+	struct fb_info *info = evdata->info;
 
 	ld = container_of(self, struct lcd_device, fb_notif);
+	mutex_lock(&ld->ops_lock);
+
 	if (!ld->ops)
-		return 0;
+		goto out;
+	if (ld->ops->check_fb && !ld->ops->check_fb(ld, evdata->info))
+		goto out;
 
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
+
+out:
 	mutex_unlock(&ld->ops_lock);
 	return 0;
 }
-- 
2.46.0

