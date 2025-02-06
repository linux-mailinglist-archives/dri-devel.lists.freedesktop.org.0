Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24FA2ACB3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132210E8A2;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DDF10E23C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E5811F44B;
 Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1B0213697;
 Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4PzPOfzXpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/13] backlight: Implement fbdev tracking with blank state
 from event
Date: Thu,  6 Feb 2025 16:30:23 +0100
Message-ID: <20250206154033.697495-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206154033.697495-1-tzimmermann@suse.de>
References: <20250206154033.697495-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3E5811F44B
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Look at the blank state provided by FB_EVENT_BLANK to determine
whether to enable or disable a backlight. Remove the tracking fields
from struct backlight_device.

Tracking requires three variables, fb_on, prev_fb_on and the
backlight's use_count. If fb_on is true, the display has been
unblanked. The backlight needs to be enabled if the display was
blanked before (i.e., prev_fb_on is false) or if use_count is still
at 0. If fb_on is false, the display has been blanked. In this case,
the backlight has to be disabled was unblanked before and the
backlight's use_count is greater than 0.

This change removes fbdev state tracking from blacklight. All the
backlight requires it its own use counter and information about
changes to the display. Removing fbdev internals makes  backlight
drivers easier to integrate into other display drivers, such as DRM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c | 14 +++++++-------
 include/linux/backlight.h           | 10 +---------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index f699e5827ccb..bb01f57c4683 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -98,9 +98,9 @@ static int fb_notifier_callback(struct notifier_block *self,
 	struct backlight_device *bd;
 	struct fb_event *evdata = data;
 	struct fb_info *info = evdata->info;
+	const int *fb_blank = evdata->data;
 	struct backlight_device *fb_bd = fb_bl_device(info);
-	int node = info->node;
-	int fb_blank = 0;
+	bool fb_on, prev_fb_on;
 
 	/* If we aren't interested in this event, skip it immediately ... */
 	if (event != FB_EVENT_BLANK)
@@ -116,15 +116,15 @@ static int fb_notifier_callback(struct notifier_block *self,
 	if (fb_bd && fb_bd != bd)
 		goto out;
 
-	fb_blank = *(int *)evdata->data;
-	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
-		bd->fb_bl_on[node] = true;
+	fb_on = fb_blank[0] == FB_BLANK_UNBLANK;
+	prev_fb_on = fb_blank[1] == FB_BLANK_UNBLANK;
+
+	if (fb_on && (!prev_fb_on || !bd->use_count)) {
 		if (!bd->use_count++) {
 			bd->props.state &= ~BL_CORE_FBBLANK;
 			backlight_update_status(bd);
 		}
-	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
-		bd->fb_bl_on[node] = false;
+	} else if (!fb_on && prev_fb_on && bd->use_count) {
 		if (!(--bd->use_count)) {
 			bd->props.state |= BL_CORE_FBBLANK;
 			backlight_update_status(bd);
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index f5652e5a9060..03723a5478f8 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -294,15 +294,7 @@ struct backlight_device {
 	struct device dev;
 
 	/**
-	 * @fb_bl_on: The state of individual fbdev's.
-	 *
-	 * Multiple fbdev's may share one backlight device. The fb_bl_on
-	 * records the state of the individual fbdev.
-	 */
-	bool fb_bl_on[FB_MAX];
-
-	/**
-	 * @use_count: The number of uses of fb_bl_on.
+	 * @use_count: The number of unblanked displays.
 	 */
 	int use_count;
 };
-- 
2.48.1

