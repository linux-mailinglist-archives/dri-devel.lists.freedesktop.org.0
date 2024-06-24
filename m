Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342B9151E0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6008610E4B2;
	Mon, 24 Jun 2024 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4C410E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:20:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E03CD219CB;
 Mon, 24 Jun 2024 15:20:37 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F25013ACD;
 Mon, 24 Jun 2024 15:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aBmjIcWOeWbqGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jun 2024 15:20:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org,
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org,
 f.suligoi@asem.it, ukleinek@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/17] backlight: Add BACKLIGHT_POWER_ constants for power
 states
Date: Mon, 24 Jun 2024 17:19:56 +0200
Message-ID: <20240624152033.25016-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
References: <20240624152033.25016-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: E03CD219CB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Duplicate FB_BLANK_ constants as BACKLIGHT_POWER__ constants in the
backlight header file. Allows backlight drivers to avoid including
the fbdev header file and removes a compile-time dependency between
the two subsystems.

The new BACKLIGHT_POWER_ constants have the same values as their
FB_BLANK_ counterparts. Hence UAPI and internal semantics do not
change. The backlight drivers can be converted one by one. Each
instance of FB_BLANK_UNBLANK becomes BACKLIGHT_POWER_ON, each of
FB_BLANK_POWERDOWN becomes BACKLIGHT_POWER_OFF, and FB_BLANK_NORMAL
becomes BACKLIGHT_POWER_REDUCED.

Backlight code or drivers do not use FB_BLANK_VSYNC_SUSPEND and
FB_BLANK_HSYNC_SUSPEND, so no new constants for these are being
added.

The semantics of FB_BLANK_NORMAL appear inconsistent. In fbdev,
NORMAL means display off with sync enabled. In backlight code,
this translates to turn the backlight off, but some drivers
interpret it as backlight on. So we keep the current code as is,
but mark BACKLIGHT_POWER_REDUCED as deprecated. Drivers should be
fixed and the constant removed. This affects ams369fg06 and a few
DRM panel drivers.

v2:
- rename BL_CORE_ power constants to BACKLIGHT_POWER_ (Sam)
- fix documentation

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../ABI/stable/sysfs-class-backlight          |  7 ++++---
 include/linux/backlight.h                     | 20 +++++++++++--------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-class-backlight b/Documentation/ABI/stable/sysfs-class-backlight
index 023fb52645f8..6102d6bebdf9 100644
--- a/Documentation/ABI/stable/sysfs-class-backlight
+++ b/Documentation/ABI/stable/sysfs-class-backlight
@@ -3,10 +3,11 @@ Date:		April 2005
 KernelVersion:	2.6.12
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
-		Control BACKLIGHT power, values are FB_BLANK_* from fb.h
+		Control BACKLIGHT power, values are compatible with
+		FB_BLANK_* from fb.h
 
-		 - FB_BLANK_UNBLANK (0)   : power on.
-		 - FB_BLANK_POWERDOWN (4) : power off
+		 - 0 (FB_BLANK_UNBLANK)   : power on.
+		 - 4 (FB_BLANK_POWERDOWN) : power off
 Users:		HAL
 
 What:		/sys/class/backlight/<backlight>/brightness
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 19a1c0e22629..ea9c1bc8148e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -209,15 +209,19 @@ struct backlight_properties {
 	 * attribute: /sys/class/backlight/<backlight>/bl_power
 	 * When the power property is updated update_status() is called.
 	 *
-	 * The possible values are: (0: full on, 1 to 3: power saving
-	 * modes; 4: full off), see FB_BLANK_XXX.
+	 * The possible values are: (0: full on, 4: full off), see
+	 * BACKLIGHT_POWER constants.
 	 *
-	 * When the backlight device is enabled @power is set
-	 * to FB_BLANK_UNBLANK. When the backlight device is disabled
-	 * @power is set to FB_BLANK_POWERDOWN.
+	 * When the backlight device is enabled, @power is set to
+	 * BACKLIGHT_POWER_ON. When the backlight device is disabled,
+	 * @power is set to BACKLIGHT_POWER_OFF.
 	 */
 	int power;
 
+#define BACKLIGHT_POWER_ON		(0)
+#define BACKLIGHT_POWER_OFF		(4)
+#define BACKLIGHT_POWER_REDUCED		(1) // deprecated; don't use in new code
+
 	/**
 	 * @type: The type of backlight supported.
 	 *
@@ -346,7 +350,7 @@ static inline int backlight_enable(struct backlight_device *bd)
 	if (!bd)
 		return 0;
 
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	bd->props.state &= ~BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -361,7 +365,7 @@ static inline int backlight_disable(struct backlight_device *bd)
 	if (!bd)
 		return 0;
 
-	bd->props.power = FB_BLANK_POWERDOWN;
+	bd->props.power = BACKLIGHT_POWER_OFF;
 	bd->props.state |= BL_CORE_FBBLANK;
 
 	return backlight_update_status(bd);
@@ -380,7 +384,7 @@ static inline int backlight_disable(struct backlight_device *bd)
  */
 static inline bool backlight_is_blank(const struct backlight_device *bd)
 {
-	return bd->props.power != FB_BLANK_UNBLANK ||
+	return bd->props.power != BACKLIGHT_POWER_ON ||
 	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
 }
 
-- 
2.45.2

