Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B496EC9A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 09:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883FC10E946;
	Fri,  6 Sep 2024 07:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B+S4Gv5t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lF2Df/YC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B+S4Gv5t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lF2Df/YC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867E510E927
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 07:54:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C392321A52;
 Fri,  6 Sep 2024 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87fl2MCoeY8QpyfokYMs6ZI0jf6/3K0EdmasNLFFQhY=;
 b=B+S4Gv5t9azQPLm025cJroTFxhjyzv2iUXFcD8RQgls18Td1uHwCbQeAWehGzmMHaoTsfx
 XKDh2CdXqKEDhr/eq/KR4cntk3VdfyStfzBcF/pjbAcGlqIfNt1z3Q68FthtABUEMOdWW2
 W+SuVeeu1YZ9ZqXDHk0y7QyjjR9TNAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87fl2MCoeY8QpyfokYMs6ZI0jf6/3K0EdmasNLFFQhY=;
 b=lF2Df/YCvk05Hk5jEU8izpj0FkWxYX7uVDvCxQb4/tZ55Cs9moLTSP261XIxKLrPmBc8wb
 KTZc65qmHn9DPjCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725609281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87fl2MCoeY8QpyfokYMs6ZI0jf6/3K0EdmasNLFFQhY=;
 b=B+S4Gv5t9azQPLm025cJroTFxhjyzv2iUXFcD8RQgls18Td1uHwCbQeAWehGzmMHaoTsfx
 XKDh2CdXqKEDhr/eq/KR4cntk3VdfyStfzBcF/pjbAcGlqIfNt1z3Q68FthtABUEMOdWW2
 W+SuVeeu1YZ9ZqXDHk0y7QyjjR9TNAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725609281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=87fl2MCoeY8QpyfokYMs6ZI0jf6/3K0EdmasNLFFQhY=;
 b=lF2Df/YCvk05Hk5jEU8izpj0FkWxYX7uVDvCxQb4/tZ55Cs9moLTSP261XIxKLrPmBc8wb
 KTZc65qmHn9DPjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 628B7136A8;
 Fri,  6 Sep 2024 07:54:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e8KqFkG12mbGPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Sep 2024 07:54:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/28] backlight: lcd: Remove fbdev dependencies
Date: Fri,  6 Sep 2024 09:52:14 +0200
Message-ID: <20240906075439.98476-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

This series removes most dependencies on fbdev from the lcd subsystem
and its drivers.

Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
now refer to a dedicated lcd device, and lcd defines constants for
power states. These changes resemble similar changes to the backlight
code.

Patches 4 to 19 update lcd drivers to the new interfaces and perform
minor cleanups during the process. Patches 20 to 24 update fbdev
drivers and patch 25 updates the picolcd driver from the hid subsystem.

Patches 25 to 28 finally clean up various lcd interfaces and files.

This patchset is part of a larger effort to implement the lcd code
without depending on fbdev. Similar patches have been sent out for
the backlight subsystem, such as in [1] and [2].

Hopefully this series can be merged at once through the lcd tree.

v2:
- use guard(mutex) (Daniel)
- fix typos in various commit descriptions (Daniel)

[1] https://patchwork.freedesktop.org/series/129782/
[2] https://patchwork.freedesktop.org/series/134718/

Thomas Zimmermann (28):
  backlight: lcd: Rearrange code in fb_notifier_callback()
  backlight: lcd: Test against struct fb_info.lcd_dev
  backlight: lcd: Add LCD_POWER_ constants for power states
  backlight: corgi_lcd: Use lcd power constants
  backlight: hx8357: Use lcd power constants
  backlight: ili922x: Use lcd power constants
  backlight: ili9320: Use lcd power constants
  backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
  backlight: jornada720_lcd: Use lcd power constants
  backlight: l4f00242t03: Use lcd power constants
  backlight: lms283gf05: Use lcd power constants
  backlight: lms501kf03: Remove unnecessary include of
    <linux/backlight.h>
  backlight: lms501kf03: Use lcd power constants
  backlight: ltv350qv: Use lcd power constants
  backlight: otm3225a: Use lcd power constants
  backlight: platform_lcd: Remove include statement for
    <linux/backlight.h>
  backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
  backlight: platform_lcd: Use lcd power constants
  backlight: tdo24m: Use lcd power constants
  fbdev: clps711x-fb: Replace check_fb in favor of struct
    fb_info.lcd_dev
  fbdev: clps711x-fb: Use lcd power constants
  fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
  fbdev: imxfb: Use lcd power constants
  fbdev: omap: Use lcd power constants
  HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
  backlight: lcd: Replace check_fb with controls_device
  backlight: lcd: Remove struct fb_videomode from set_mode callback
  backlight: lcd: Do not include <linux/fb.h> in lcd header

 drivers/hid/hid-picolcd_fb.c             |  4 ++
 drivers/hid/hid-picolcd_lcd.c            |  6 ---
 drivers/video/backlight/corgi_lcd.c      | 17 ++++----
 drivers/video/backlight/hx8357.c         |  2 +-
 drivers/video/backlight/ili922x.c        |  7 ++--
 drivers/video/backlight/ili9320.c        | 15 ++++---
 drivers/video/backlight/jornada720_lcd.c | 10 ++---
 drivers/video/backlight/l4f00242t03.c    | 32 +++++++--------
 drivers/video/backlight/lcd.c            | 50 ++++++++++++++++++------
 drivers/video/backlight/lms283gf05.c     |  2 +-
 drivers/video/backlight/lms501kf03.c     | 24 ++++++------
 drivers/video/backlight/ltv350qv.c       | 15 ++++---
 drivers/video/backlight/otm3225a.c       |  2 +-
 drivers/video/backlight/platform_lcd.c   | 20 ++++------
 drivers/video/backlight/tdo24m.c         | 19 +++++----
 drivers/video/fbdev/clps711x-fb.c        | 29 ++++++--------
 drivers/video/fbdev/imxfb.c              | 32 ++++++---------
 drivers/video/fbdev/omap/lcd_ams_delta.c |  8 ++--
 include/linux/fb.h                       | 13 ++++++
 include/linux/lcd.h                      | 29 ++++++++++----
 include/video/platform_lcd.h             |  3 --
 21 files changed, 181 insertions(+), 158 deletions(-)

-- 
2.46.0

