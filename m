Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14FA45A4A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B80C10E8A7;
	Wed, 26 Feb 2025 09:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B+BUDvuX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HWz6BnZK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hYR2VjD3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2ogy1WY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D8D10E8A7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:38:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA8211F769;
 Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740562668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XoDLtPCKWt6ClEJ9Qt53YfMlYcjc8fJHXBVL4z+6UQ=;
 b=B+BUDvuXdKXqUbdGvd90ZLB1d0LHyl/hWwOCOM7G6s3Q7/QN55FlWAa/c760y52c1QeLUk
 cE2CHkEJfkBnGE4VNAwwQprz8RVNPbO5t9KexvKtINNZJfV+aa4fFEYMDFRQJbYatqgasu
 AEubSl7uF47wTXjkMzEjQ7yF9IR6uPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740562668;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XoDLtPCKWt6ClEJ9Qt53YfMlYcjc8fJHXBVL4z+6UQ=;
 b=HWz6BnZKGaJhHuUpHX0HvS8PiL2Vytbd6VtlKmYBgYfMx4wK97JJziVgexTn3LUxB2pw05
 6LkAnwaYuN280KDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740562667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XoDLtPCKWt6ClEJ9Qt53YfMlYcjc8fJHXBVL4z+6UQ=;
 b=hYR2VjD3/3uzQcF0hzXQ9s2wh2+WWvoBUA16oNugkFBpNEkMduDb0yklCHnHKhUTCTVOgE
 SqFGbo0e2o8o5c1I6MOxocssStzY1bBMKRzZLG8PoO7h4+73WREjUMEXzuiYl0TWVFx6H9
 TvKbRotaEQNI14jULorVzyUyFtW7izU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740562667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XoDLtPCKWt6ClEJ9Qt53YfMlYcjc8fJHXBVL4z+6UQ=;
 b=f2ogy1WYRR4bUfxE4l71+e5Es4DIPLr+dSCekrmI/eO/FsvDTIWEljdWi6lloKwDUp9ARl
 480AAXVIwHzBSYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A349213A82;
 Wed, 26 Feb 2025 09:37:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCuRJuvgvmezXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 09:37:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/11] leds: backlight trigger: Move blank-state handling
 into helper
Date: Wed, 26 Feb 2025 10:31:58 +0100
Message-ID: <20250226093456.147402-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226093456.147402-1-tzimmermann@suse.de>
References: <20250226093456.147402-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

