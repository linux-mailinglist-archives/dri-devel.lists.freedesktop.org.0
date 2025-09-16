Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69855B59C29
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC7F10E380;
	Tue, 16 Sep 2025 15:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mImRsTv4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAZ8V7oY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mImRsTv4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UAZ8V7oY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613910E385
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C36F62282F;
 Tue, 16 Sep 2025 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPF96jvtW7cytFeaRZGdg1y3ZuYmtxvbMx7nznLd4C8=;
 b=mImRsTv4o3nJKI6LOA3HauTRGaXLWbJNdYDdWbfONS6JF/AauLQ0BkL/CquE6vBuizpZYE
 81pV3x8QEDqW3nOCmlUC6ryDYSMiKA7idMA6IcO3DeLnenAufiUa7HWrJutHuShtRSf9Iq
 CsadnqJq8c6xHXcL/wNO2Yh2h5J++jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPF96jvtW7cytFeaRZGdg1y3ZuYmtxvbMx7nznLd4C8=;
 b=UAZ8V7oYfthRiJG7JeE/QTcZQQoo9LtNoVpLuSjOl/D1e3WLOMlpA+8+Ix2Pw2jgbZ7V7h
 bVvy+WYVxyq/ECDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mImRsTv4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UAZ8V7oY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPF96jvtW7cytFeaRZGdg1y3ZuYmtxvbMx7nznLd4C8=;
 b=mImRsTv4o3nJKI6LOA3HauTRGaXLWbJNdYDdWbfONS6JF/AauLQ0BkL/CquE6vBuizpZYE
 81pV3x8QEDqW3nOCmlUC6ryDYSMiKA7idMA6IcO3DeLnenAufiUa7HWrJutHuShtRSf9Iq
 CsadnqJq8c6xHXcL/wNO2Yh2h5J++jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XPF96jvtW7cytFeaRZGdg1y3ZuYmtxvbMx7nznLd4C8=;
 b=UAZ8V7oYfthRiJG7JeE/QTcZQQoo9LtNoVpLuSjOl/D1e3WLOMlpA+8+Ix2Pw2jgbZ7V7h
 bVvy+WYVxyq/ECDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8753A139CB;
 Tue, 16 Sep 2025 15:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mk+jH8GDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/12] drm/ast: Split device initialization per HW generation
Date: Tue, 16 Sep 2025 17:26:10 +0200
Message-ID: <20250916153239.308027-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C36F62282F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Split ast_device_create() and its helpers into individual helpers
for each supported hardware generation. Adds some duplicated code,
but simplifies maintenance and support of additional hardware.

Patches 1 to 4 move some code around and prepare for the split.

Patches 5 to 11 each add device initialization for a hardware
generation. The code is duplicated from existing code and stripped
from unnecesary calls. More specialization is possible in later
patches.

Patch 12 removes the original, now unused, code.

Tested on AST2100, AST2300, AST2500 and AST2600.

Thomas Zimmermann (12):
  drm/ast: Move display-clock tables to per-Gen source files
  drm/ast: Move mode-detection helpers to Gen2 source files
  drm/ast: Split ast_detect_tx_chip() per chip generation
  drm/ast: Prepare per-Gen device initialization
  drm/ast: Move Gen1 device initialization into separate helper
  drm/ast: Move Gen2 device initialization into separate helper
  drm/ast: Move Gen3 device initialization into separate helper
  drm/ast: Move Gen4 device initialization into separate helper
  drm/ast: Move Gen5 device initialization into separate helper
  drm/ast: Move Gen6 device initialization into separate helper
  drm/ast: Move Gen7 device initialization into separate helper
  drm/ast: Remove generic device initialization

 drivers/gpu/drm/ast/Makefile     |   3 +-
 drivers/gpu/drm/ast/ast_2000.c   | 110 +++++++++++++
 drivers/gpu/drm/ast/ast_2100.c   |  86 ++++++++++
 drivers/gpu/drm/ast/ast_2200.c   |  86 ++++++++++
 drivers/gpu/drm/ast/ast_2300.c   | 130 +++++++++++++++
 drivers/gpu/drm/ast/ast_2400.c   |  95 +++++++++++
 drivers/gpu/drm/ast/ast_2500.c   | 100 ++++++++++++
 drivers/gpu/drm/ast/ast_2600.c   |  63 ++++++++
 drivers/gpu/drm/ast/ast_drv.c    |  67 +++++++-
 drivers/gpu/drm/ast/ast_drv.h    |  75 ++++++++-
 drivers/gpu/drm/ast/ast_main.c   | 268 -------------------------------
 drivers/gpu/drm/ast/ast_mode.c   |   4 +-
 drivers/gpu/drm/ast/ast_tables.h |  60 -------
 13 files changed, 805 insertions(+), 342 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2200.c
 create mode 100644 drivers/gpu/drm/ast/ast_2400.c
 delete mode 100644 drivers/gpu/drm/ast/ast_main.c

-- 
2.51.0

