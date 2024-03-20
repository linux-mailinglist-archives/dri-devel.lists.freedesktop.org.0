Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88297880EC4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593A210F3A0;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tJt8Zda4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nw6W7oUS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tJt8Zda4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nw6W7oUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D5E10E732
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64D4D20BCE;
 Wed, 20 Mar 2024 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwKKxIAnQ6WXOB11VeNq5+Ogp2NPn/P1yXWunBhQ66U=;
 b=tJt8Zda4gYeMpw13ToD66TrUxwqIaMjB8v4JsJKCZoGe40qtUx7SUABGRmxNjZ93fWJCzN
 7jCUo/3rAulYVVIR9tWRd3IkINyEFwtXt4twrX8qFaoKiM6YeOcYhRj42uCbkmz+CdwlCn
 oR57K4J8tKfUyJyb3CLSH9AANrDyP0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwKKxIAnQ6WXOB11VeNq5+Ogp2NPn/P1yXWunBhQ66U=;
 b=nw6W7oUSnLbfbneGZUw3rO0y+zMOxqzAkTs3uxW1bgbK93sFEKbkKx6N417BlTl0r9d9Rk
 0JFlqKU0PgHY0UAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwKKxIAnQ6WXOB11VeNq5+Ogp2NPn/P1yXWunBhQ66U=;
 b=tJt8Zda4gYeMpw13ToD66TrUxwqIaMjB8v4JsJKCZoGe40qtUx7SUABGRmxNjZ93fWJCzN
 7jCUo/3rAulYVVIR9tWRd3IkINyEFwtXt4twrX8qFaoKiM6YeOcYhRj42uCbkmz+CdwlCn
 oR57K4J8tKfUyJyb3CLSH9AANrDyP0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwKKxIAnQ6WXOB11VeNq5+Ogp2NPn/P1yXWunBhQ66U=;
 b=nw6W7oUSnLbfbneGZUw3rO0y+zMOxqzAkTs3uxW1bgbK93sFEKbkKx6N417BlTl0r9d9Rk
 0JFlqKU0PgHY0UAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26344136CD;
 Wed, 20 Mar 2024 09:37:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Lt0QCGau+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 00/13] drm/ast: Detect connector status for VGA and SIL164
Date: Wed, 20 Mar 2024 10:34:05 +0100
Message-ID: <20240320093738.6341-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tJt8Zda4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nw6W7oUS
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 64D4D20BCE
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

Detect the status of the VGA or SIL164 conenctor by polling the DDC
channel. Update the status at runtime and flip the BMC status as well.

Patches 1 adds a missing include statement that will be required to
make later patches compile.

Patches 2 and 3 simplify the VGA and SIL164 connectors, such that no
additional data structure is required. These patches have been reviewed
before as part of the series at [1].

Patches 4 to 10 improve the I2C code that is used to retrieve the
monitor's EDID data. It's now fully managed, it acquires the necessary
lock automatically and it is called DDC, which better represents its
purpose than I2C.

Patches 11 to 13 finally implement polling. Patch 11 updates ast's
EDID code to be up-to-date. The helper drm_connector_get_modes() reads
the EDID via DDC and updates the property. No driver code is required.
Patch 12 uses a similar pattern to detect the presence of the monitor
and sets the connector status accordingly. As polling also needs to be
cleaned up, patch 13 adds the necessary helpers to do so.

Tested on AST2500 hardware and BMC output. The BMC connector now also
flips its status correctly at runtime.

[1] https://patchwork.freedesktop.org/series/104547/

v5:
- share implementation in drm_connector_helper_detect_ctx() (Maxime)
- test for DDC presence with drm_probe_ddc() (Maxime, Jani)
- perform managed cleanup of poll thread

Thomas Zimmermann (13):
  drm/ast: Include <linux/of.h> where necessary
  drm/ast: Fail probing if DDC channel could not be initialized
  drm/ast: Remove struct ast_{vga,sil165}_connector
  drm/ast: Allocate instance of struct ast_i2c_chan with managed helpers
  drm/ast: Move DDC code to ast_ddc.{c,h}
  drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
  drm/ast: Pass AST device to ast_ddc_create()
  drm/ast: Store AST device in struct ast_ddc
  drm/ast: Rename struct i2c_algo_bit_data callbacks and their
    parameters
  drm/ast: Acquire I/O-register lock in DDC code
  drm/ast: Use drm_connector_helper_get_modes()
  drm/ast: Implement polling for VGA and SIL164 connectors
  drm/ast: Automatically clean up poll helper

 drivers/gpu/drm/ast/Makefile                 |  10 +-
 drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} | 120 +++++++++------
 drivers/gpu/drm/ast/ast_ddc.h                |  20 +++
 drivers/gpu/drm/ast/ast_drv.c                |   1 +
 drivers/gpu/drm/ast/ast_drv.h                |  39 +----
 drivers/gpu/drm/ast/ast_main.c               |   1 +
 drivers/gpu/drm/ast/ast_mode.c               | 147 +++++--------------
 drivers/gpu/drm/drm_probe_helper.c           |  56 +++++++
 include/drm/drm_probe_helper.h               |   5 +
 9 files changed, 206 insertions(+), 193 deletions(-)
 rename drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} (54%)
 create mode 100644 drivers/gpu/drm/ast/ast_ddc.h

-- 
2.44.0

