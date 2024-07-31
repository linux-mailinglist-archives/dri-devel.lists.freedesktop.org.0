Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF3942E83
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036B710E5FF;
	Wed, 31 Jul 2024 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BU59HBNI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dSQa3CFW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BU59HBNI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dSQa3CFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0331010E2C4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 94EC71F82F;
 Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
 b=BU59HBNIDNXWVCguaR4/NHuA4jI/Thi7zv04Z09PhPLx0stsaKVL4vDyUfS9Y4Q5694xIf
 yG96i7fJ4F3yTnNW9m+egYTCBucpYX+m+nGGEsF/HHNhYda9KqVRt8cdreojV8EStlb7Cu
 CMGA4wwuX2ZAO+QaByK/NuFyNhyuIRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
 b=dSQa3CFWWZT4kXd2ZVc+LP5emjTzF9h9g/WODYhFHgEOvOaIKyvWrAELxgtbT5GdvlKhYy
 wfNIkA7lewpNUABw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BU59HBNI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dSQa3CFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722429305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
 b=BU59HBNIDNXWVCguaR4/NHuA4jI/Thi7zv04Z09PhPLx0stsaKVL4vDyUfS9Y4Q5694xIf
 yG96i7fJ4F3yTnNW9m+egYTCBucpYX+m+nGGEsF/HHNhYda9KqVRt8cdreojV8EStlb7Cu
 CMGA4wwuX2ZAO+QaByK/NuFyNhyuIRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722429305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9gF6UC7GyZES1sywXW1iqfz+JjY6OfayYy0kTi8bYSQ=;
 b=dSQa3CFWWZT4kXd2ZVc+LP5emjTzF9h9g/WODYhFHgEOvOaIKyvWrAELxgtbT5GdvlKhYy
 wfNIkA7lewpNUABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5393313297;
 Wed, 31 Jul 2024 12:35:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id do+LEnkvqmYiUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] fbdev: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:41 +0200
Message-ID: <20240731123502.1145082-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.81 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmx.de]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_TRACE(0.00)[suse.de:+]; FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 94EC71F82F
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

Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
power states") introduced dedicated constants for backlight power states.
Convert fbdev drivers to the new constants.

The new constants replace the fbdev constants. This is part of a larger
effort to make kernel subsystems more independent from fbdev code and
headers.

Thomas Zimmermann (9):
  fbdev: atmel_lcdfb: Use backlight power constants
  fbdev: aty128fb: Use backlight power constants
  fbdev: atyfb: Use backlight power constants
  fbdev: chipsfb: Use backlight power constants
  fbdev: nvidiafb: Use backlight power constants
  fbdev: omapfb: Use backlight power constants
  fbdev: radeonfb: Use backlight power constants
  fbdev: rivafb: Use backlight power constants
  fbdev: sh_mobile_lcdc_fb: Use backlight power constants

 drivers/video/fbdev/atmel_lcdfb.c                           | 4 ++--
 drivers/video/fbdev/aty/aty128fb.c                          | 6 +++---
 drivers/video/fbdev/aty/atyfb_base.c                        | 2 +-
 drivers/video/fbdev/aty/radeon_backlight.c                  | 2 +-
 drivers/video/fbdev/chipsfb.c                               | 2 +-
 drivers/video/fbdev/nvidia/nv_backlight.c                   | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c    | 4 ++--
 .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c      | 2 +-
 drivers/video/fbdev/riva/fbdev.c                            | 2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c                      | 6 +++---
 10 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.45.2

