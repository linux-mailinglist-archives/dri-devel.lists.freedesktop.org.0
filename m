Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84CE87AAAF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 16:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7D10ECE3;
	Wed, 13 Mar 2024 15:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eG3j+5/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNaFGsgE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eG3j+5/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNaFGsgE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9D910E3FC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 15:49:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DB3721C89;
 Wed, 13 Mar 2024 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710344940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
 b=eG3j+5/Nr6vS3K47JCzsjFu2BkyGcHxuK8qgItdffjBVEkkq9RJwybaBcCUi4StS/p7BAb
 jip8jGJPfRpjLDTaV2T11mc4pc+FOezrylPGVLCS/+S3lrcQNG6o3VVn6u82d23GJO4j9t
 vIIhEGhfrB8bXDU8xLuDDsC/RPhsnnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710344940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
 b=CNaFGsgE3kmyRNK0TSCG7JlQ7n/+iJVKYOF0FmG/eDHnZZLy74J3MsoGTJlJ+ahkFZtJTw
 0Nh/b7wRyRR2h0Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710344940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
 b=eG3j+5/Nr6vS3K47JCzsjFu2BkyGcHxuK8qgItdffjBVEkkq9RJwybaBcCUi4StS/p7BAb
 jip8jGJPfRpjLDTaV2T11mc4pc+FOezrylPGVLCS/+S3lrcQNG6o3VVn6u82d23GJO4j9t
 vIIhEGhfrB8bXDU8xLuDDsC/RPhsnnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710344940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
 b=CNaFGsgE3kmyRNK0TSCG7JlQ7n/+iJVKYOF0FmG/eDHnZZLy74J3MsoGTJlJ+ahkFZtJTw
 0Nh/b7wRyRR2h0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DC911397F;
 Wed, 13 Mar 2024 15:49:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vxUqDezK8WUhfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] backlight: Remove struct backlight_properties.fb_blank
Date: Wed, 13 Mar 2024 16:44:59 +0100
Message-ID: <20240313154857.12949-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [2.96 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.94)[94.70%]
X-Spam-Score: 2.96
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

The field fb_blank in struct backlight_properties has been marked for
removal. Remove it in favor of the power and state fields.

Patches 1 to 5 prepare several backlight drivers. They remove fb_blank
or replace driver code with existing helpers.

Patch 6 removes fb_blank from backlight core and drivers. This resolves
another dependency between backlight nad fbdev.

Thomas Zimmermann (6):
  auxdisplay/ht16k33: Replace use of fb_blank with backlight helper
  backlight/omap1-bl: Remove unused struct
    omap_backlight_config.set_power
  backlight/omap1-bl: Replace FB_BLANK_ states with simple on/off
  fbdev/omap2/omapfb: Replace use of fb_blank with backlight helpers
  staging/fbtft: Remove reference to fb_blank
  backlight: Remove fb_blank from struct backlight_properties

 drivers/auxdisplay/ht16k33.c                  |  7 +--
 drivers/staging/fbtft/fb_ssd1351.c            |  4 +-
 drivers/staging/fbtft/fbtft-core.c            |  5 +-
 drivers/video/backlight/backlight.c           |  2 -
 drivers/video/backlight/mp3309c.c             |  1 -
 drivers/video/backlight/omap1_bl.c            | 50 ++++++++-----------
 drivers/video/fbdev/atmel_lcdfb.c             |  1 -
 .../omap2/omapfb/displays/panel-dsi-cm.c      |  7 +--
 .../omapfb/displays/panel-sony-acx565akm.c    | 10 +---
 include/linux/backlight.h                     | 25 +---------
 include/linux/platform_data/omap1_bl.h        |  1 -
 11 files changed, 29 insertions(+), 84 deletions(-)

-- 
2.44.0

