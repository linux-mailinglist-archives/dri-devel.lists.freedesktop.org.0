Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4618C282B
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B95610EE1C;
	Fri, 10 May 2024 15:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qKOrLZcL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oqzay6jg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Np2PDX2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/32zYFta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6254210E2C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:48:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2F7E67382;
 Fri, 10 May 2024 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=brZYaMq+dkbNagOrmCBmet1YpOZ0xZ6fXkP8RN7yUco=;
 b=qKOrLZcLdZ/lAcXpLefBzKgrdGT7J9eUpZro5v5ogmz1XGMU3y3ER0XPfaZHoLPB1o0tEG
 JhWmB36pNIPfEMZfp+CgMyJElNibhDfO9c2I2YaNPMspnzCtDIbEMWQaa2EfCp5NoWbFAk
 9OantBQytD5Hsaq0bcNWeSgtyAOp7pw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=brZYaMq+dkbNagOrmCBmet1YpOZ0xZ6fXkP8RN7yUco=;
 b=Oqzay6jgIBWvOz1IBbZH6H4euWNdSyibdXTIOpnJUQi4H8NeKbg/F7DPHNRZQqqGA4t58X
 gLFZzRW/48W2IRAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Np2PDX2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/32zYFta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715356123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=brZYaMq+dkbNagOrmCBmet1YpOZ0xZ6fXkP8RN7yUco=;
 b=2Np2PDX2YBuMviDtucAFbO3e990MufgH72XfLvkYJZ8vkyuG0dgkbGk6x8CxtsrTA8lRyr
 8d814acRDFPlWTd6tx/Ct0yWjf7rf9DwAmqeoCIpIRU+Rqxjcw+Sxzuo2LPduEhUIxSHlU
 01j+qZayBkqCvA3byfG+3QsmQJRmiu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715356123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=brZYaMq+dkbNagOrmCBmet1YpOZ0xZ6fXkP8RN7yUco=;
 b=/32zYFtamPO7T0WK4TTTigPWkk0VrF2RE27PDptL0tOWA4JW8ZY+1ub7IRX10udB880sym
 XHNPgMAC22eK1ADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4F61139AA;
 Fri, 10 May 2024 15:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mDD2KttBPma7MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 15:48:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/5] drm/udl: Convert to struct drm_edid
Date: Fri, 10 May 2024 17:47:07 +0200
Message-ID: <20240510154841.11370-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E2F7E67382
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCPT_COUNT_FIVE(0.00)[6]; DKIM_TRACE(0.00)[suse.de:+]
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

Convert udl to use struct drm_edid and its helpers. Also clean up
a few things in the process.

Patch 1 fixes a bug.

Patches 2 to 4 convert the current EDID handling to struct drm_edid
and its helpers. Patch 4 also separates the helpers for .get_modes()
and .detect_ctx() from each other.

Patch 5 removes the obsolete struct udl_connector.

v3:
- implement udl_probe_edid() with memchr_inv() (Jani)
v2:
- drop the generic EDID probing (Jani)
- fixes

Thomas Zimmermann (5):
  drm/udl: Remove DRM_CONNECTOR_POLL_HPD
  drm/udl: Move drm_dev_{enter,exit}() into udl_get_edid_block()
  drm/udl: Clean up Makefile
  drm/udl: Untangle .get_modes() and .detect_ctx()
  drm/udl: Remove struct udl_connector

 drivers/gpu/drm/udl/Makefile      |   8 +-
 drivers/gpu/drm/udl/udl_drv.h     |  12 +--
 drivers/gpu/drm/udl/udl_edid.c    |  80 +++++++++++++++++
 drivers/gpu/drm/udl/udl_edid.h    |  15 ++++
 drivers/gpu/drm/udl/udl_modeset.c | 138 +++++++-----------------------
 5 files changed, 132 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/udl/udl_edid.c
 create mode 100644 drivers/gpu/drm/udl/udl_edid.h

-- 
2.44.0

