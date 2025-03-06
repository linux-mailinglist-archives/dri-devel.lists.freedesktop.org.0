Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F1A54D2F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFF10E938;
	Thu,  6 Mar 2025 14:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DF910E938
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:13:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 609AD1F785;
 Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19E0113A91;
 Thu,  6 Mar 2025 14:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eOv2BHityWeveQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Mar 2025 14:13:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 09/11] leds: backlight trigger: Move blank-state handling
 into helper
Date: Thu,  6 Mar 2025 15:05:51 +0100
Message-ID: <20250306140947.580324-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
References: <20250306140947.580324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 609AD1F785
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

Move the handling of blank-state updates into a separate helper,
so that is can be called without the fbdev event. No functional
changes.

v2:
- rename helper to avoid renaming in a later patch (Lee)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/leds/trigger/ledtrig-backlight.c | 30 ++++++++++++++----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..8e66d55a6c82 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -25,12 +25,28 @@ struct bl_trig_notifier {
 	unsigned invert;
 };
 
+static void ledtrig_backlight_notify_blank(struct bl_trig_notifier *n, int new_status)
+{
+	struct led_classdev *led = n->led;
+
+	if (new_status == n->old_status)
+		return;
+
+	if ((n->old_status == UNBLANK) ^ n->invert) {
+		n->brightness = led->brightness;
+		led_set_brightness_nosleep(led, LED_OFF);
+	} else {
+		led_set_brightness_nosleep(led, n->brightness);
+	}
+
+	n->old_status = new_status;
+}
+
 static int fb_notifier_callback(struct notifier_block *p,
 				unsigned long event, void *data)
 {
 	struct bl_trig_notifier *n = container_of(p,
 					struct bl_trig_notifier, notifier);
-	struct led_classdev *led = n->led;
 	struct fb_event *fb_event = data;
 	int *blank;
 	int new_status;
@@ -42,17 +58,7 @@ static int fb_notifier_callback(struct notifier_block *p,
 	blank = fb_event->data;
 	new_status = *blank ? BLANK : UNBLANK;
 
-	if (new_status == n->old_status)
-		return 0;
-
-	if ((n->old_status == UNBLANK) ^ n->invert) {
-		n->brightness = led->brightness;
-		led_set_brightness_nosleep(led, LED_OFF);
-	} else {
-		led_set_brightness_nosleep(led, n->brightness);
-	}
-
-	n->old_status = new_status;
+	ledtrig_backlight_notify_blank(n, new_status);
 
 	return 0;
 }
-- 
2.48.1

