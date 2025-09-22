Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA752B8F94C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2B10E3D9;
	Mon, 22 Sep 2025 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ak+elRSQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ck3AlxTG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ak+elRSQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ck3AlxTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899210E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:40:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 677BF1F8C3;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2x/XL7Zv3791btF6VIxJ4Siq23UnhXrum6B4iKNME6M=;
 b=ak+elRSQ68GLxDb642F7tq6qiDda5Ja0ZSP52Mj7jtBVWoHML6s81O+um9TLpc6G+q3aKZ
 RszmxX4KtxYk8C29+1w3hhG5rNWckXK+OAK6kBTLpyc+gPDFM8qef2pyCgNMspoOTocnSW
 7bv8nQ+zZivGAxBFGZK8ieGziNlKC/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2x/XL7Zv3791btF6VIxJ4Siq23UnhXrum6B4iKNME6M=;
 b=Ck3AlxTGeHm5q2QjUIUGlC4JRBghJSl9IiZfMiZyC//R3MTA6fN2lzfPhhM1+L42YScNOz
 bz5nlMryXts2r8BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758530399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2x/XL7Zv3791btF6VIxJ4Siq23UnhXrum6B4iKNME6M=;
 b=ak+elRSQ68GLxDb642F7tq6qiDda5Ja0ZSP52Mj7jtBVWoHML6s81O+um9TLpc6G+q3aKZ
 RszmxX4KtxYk8C29+1w3hhG5rNWckXK+OAK6kBTLpyc+gPDFM8qef2pyCgNMspoOTocnSW
 7bv8nQ+zZivGAxBFGZK8ieGziNlKC/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758530399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2x/XL7Zv3791btF6VIxJ4Siq23UnhXrum6B4iKNME6M=;
 b=Ck3AlxTGeHm5q2QjUIUGlC4JRBghJSl9IiZfMiZyC//R3MTA6fN2lzfPhhM1+L42YScNOz
 bz5nlMryXts2r8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D80A1388C;
 Mon, 22 Sep 2025 08:39:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id S/mqCV8L0WikFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:39:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/12] drm/ast: Split device initialization per HW
 generation
Date: Mon, 22 Sep 2025 10:36:00 +0200
Message-ID: <20250922083708.45564-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

v2:
- clean up the widescreen-detection logic (Jocelyn)

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
 drivers/gpu/drm/ast/ast_2000.c   | 101 ++++++++++++
 drivers/gpu/drm/ast/ast_2100.c   |  85 ++++++++++
 drivers/gpu/drm/ast/ast_2200.c   |  85 ++++++++++
 drivers/gpu/drm/ast/ast_2300.c   | 128 +++++++++++++++
 drivers/gpu/drm/ast/ast_2400.c   |  93 +++++++++++
 drivers/gpu/drm/ast/ast_2500.c   |  98 +++++++++++
 drivers/gpu/drm/ast/ast_2600.c   |  63 ++++++++
 drivers/gpu/drm/ast/ast_drv.c    |  67 +++++++-
 drivers/gpu/drm/ast/ast_drv.h    |  75 ++++++++-
 drivers/gpu/drm/ast/ast_main.c   | 268 -------------------------------
 drivers/gpu/drm/ast/ast_mode.c   |   4 +-
 drivers/gpu/drm/ast/ast_tables.h |  60 -------
 13 files changed, 788 insertions(+), 342 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2200.c
 create mode 100644 drivers/gpu/drm/ast/ast_2400.c
 delete mode 100644 drivers/gpu/drm/ast/ast_main.c

-- 
2.51.0

