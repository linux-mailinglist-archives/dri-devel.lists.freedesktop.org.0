Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EE88B0E6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76E810E428;
	Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XvX7ZiaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IsvmqLVg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CjbCwBcm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rGRmq10R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F6810E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9AA337251;
 Mon, 25 Mar 2024 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2mnjQASwJ7w7rVZX8fOrpd+slb1h4GybHdDcTR0pkqE=;
 b=XvX7ZiaDIyPQ7bs1enOSHuGlPZ1K6YUxiamk8c040jkalawmugbeuFipdoJqYoy2MD6Ex1
 CTrQ5OmTIYMKRTMYgheMdnYoAgrg4skBj5F6PW0Vnd3eJpFEVBY/Bbg/A1BO4o+cVJAQlF
 XA3XhH6UrvVGUJVo2Q4qcIvMelS9YVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2mnjQASwJ7w7rVZX8fOrpd+slb1h4GybHdDcTR0pkqE=;
 b=IsvmqLVgWVFyOu77OpbpSRfuggkJV02ZBPhlO2H82jpDP16LIZGtQZSDcdqS5mVcfiT8NL
 8MJhnAeCzwWdoQDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2mnjQASwJ7w7rVZX8fOrpd+slb1h4GybHdDcTR0pkqE=;
 b=CjbCwBcmkCyxEuNVY37kWDO4vojodDwnLdtBhiEDbxw1NNVgWa5oD4Kaf0N3xwaYIkibuF
 tO18KFKo2Kzmupsdn5GCQKz90fGjhRtjl0DELV08RwsjIb/TQMsO6Mg//C/AcTiWfjiAOA
 uhuAoouGm8ObzwvIkG/nGczYOv3F9B8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397337;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2mnjQASwJ7w7rVZX8fOrpd+slb1h4GybHdDcTR0pkqE=;
 b=rGRmq10RhUSwiZosRotn4J6/xn/aepRsqORHqaytaJWZUQrbCmDeCMOCi8HFF7ugEbyqPZ
 jjWj688f7n0yI1CA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 89E3913A71;
 Mon, 25 Mar 2024 20:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id iS49INnZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 00/13] drm/ast: Detect connector status for VGA and SIL164
Date: Mon, 25 Mar 2024 21:06:45 +0100
Message-ID: <20240325200855.21150-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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

v6:
- rename helper to drm_connector_helper_detect_from_ddc() (Maxime, Sui)
- fix kerneldoc comment
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
 include/drm/drm_probe_helper.h               |   6 +
 9 files changed, 207 insertions(+), 193 deletions(-)
 rename drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} (54%)
 create mode 100644 drivers/gpu/drm/ast/ast_ddc.h

-- 
2.44.0

