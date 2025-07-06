Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AEAFA67D
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 18:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168A10E2C3;
	Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E7fig+7K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LgoZnYl7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7fig+7K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LgoZnYl7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B4D10E2C3
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 16:28:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 988B521196;
 Sun,  6 Jul 2025 16:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XXkg5K7U371+KfTLCwmD7g2KdkhmGJupWByNIMFu5+s=;
 b=E7fig+7KWmEUjEKs7/rU9QIcQ6w3eP0ibpD2TH0tYlwQaP/+QDhf3KtoLXIlsXJgb9lSPA
 zBYklhl2skdDDiiErjNheS/jicvvzFarXNsvk8bDGU2x7vXz0QbGavm3SeWGwskV0XRxfL
 1ELrKQbhEEOxK5O0Adq7fv0UaEURWCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XXkg5K7U371+KfTLCwmD7g2KdkhmGJupWByNIMFu5+s=;
 b=LgoZnYl7ESaT5kWe9k1raLTkraMPc9K90Eg03Ro/viLluSRq3r5UzmgIZ7Pbf+dxoCssVf
 QJKseJWVGEiow8CA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E7fig+7K;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LgoZnYl7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751819299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XXkg5K7U371+KfTLCwmD7g2KdkhmGJupWByNIMFu5+s=;
 b=E7fig+7KWmEUjEKs7/rU9QIcQ6w3eP0ibpD2TH0tYlwQaP/+QDhf3KtoLXIlsXJgb9lSPA
 zBYklhl2skdDDiiErjNheS/jicvvzFarXNsvk8bDGU2x7vXz0QbGavm3SeWGwskV0XRxfL
 1ELrKQbhEEOxK5O0Adq7fv0UaEURWCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751819299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XXkg5K7U371+KfTLCwmD7g2KdkhmGJupWByNIMFu5+s=;
 b=LgoZnYl7ESaT5kWe9k1raLTkraMPc9K90Eg03Ro/viLluSRq3r5UzmgIZ7Pbf+dxoCssVf
 QJKseJWVGEiow8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B3DB13A29;
 Sun,  6 Jul 2025 16:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nQ5eGCOkamjJSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Jul 2025 16:28:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] drm/ast: Split POST code per hardware gen
Date: Sun,  6 Jul 2025 18:26:35 +0200
Message-ID: <20250706162816.211552-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 988B521196
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Move the POST code for each hardware generation into a separate source
file. Split some functions per gen, as necessary. Makes the code more
maintainable. Support for future hardware generations can now be added
easily in a new source file without interfering with existing code.

Gen3 and Gen5 share their POST code with earlier hardware generations.
The other generations have individual POST. Patch 1 makes the few
shared cross-gen helpers available.

Patches 2 to 5 move individual POST functionality into separate files,
split by hardware generation and addresses some coding-style issues.

Patches 6 and 7 fix the use of struct ast_dramstruct to be less of a
blackbox. It's used for DRAM initialization in Gen1 and Gen2 hardware.

Patch 8 splits up default settings for various registers. This brings
up an issue with Gen7, which likely uses outdated values from Gen1.

Patches 9 and 10 attempt to fix the default settings for Gen7. It's
done separately from the rest, so it can be bisected and reverted
easily, if necessary.

Tested on AST2600 (Gen7) and AST2500 (Gen6).

v2:
- gen7: simplify logic (Jocelyn)

Thomas Zimmermann (10):
  drm/ast: Declare helpers for POST in header
  drm/ast: Move Gen7+ POST code to separate source file
  drm/ast: Move Gen6+ POST code to separate source file
  drm/ast: Move Gen4+ POST code to separate source file
  drm/ast: Move Gen2+ and Gen1 POST code to separate source files
  drm/ast: Move struct ast_dramstruct to ast_post.h
  drm/ast: Handle known struct ast_dramstruct with helpers
  drm/ast: Split ast_set_def_ext_reg() by chip generation
  drm/ast: Gen7: Disable VGASR0[1] as on Gen4+
  drm/ast: Gen7: Switch default registers to gen4+ state

 drivers/gpu/drm/ast/Makefile          |    5 +
 drivers/gpu/drm/ast/ast_2000.c        |  149 ++
 drivers/gpu/drm/ast/ast_2100.c        |  348 +++++
 drivers/gpu/drm/ast/ast_2300.c        | 1328 ++++++++++++++++
 drivers/gpu/drm/ast/ast_2500.c        |  569 +++++++
 drivers/gpu/drm/ast/ast_2600.c        |   44 +
 drivers/gpu/drm/ast/ast_dram_tables.h |  207 ---
 drivers/gpu/drm/ast/ast_drv.c         |    2 +-
 drivers/gpu/drm/ast/ast_drv.h         |   17 +-
 drivers/gpu/drm/ast/ast_post.c        | 2027 +------------------------
 drivers/gpu/drm/ast/ast_post.h        |   50 +
 11 files changed, 2531 insertions(+), 2215 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_2000.c
 create mode 100644 drivers/gpu/drm/ast/ast_2100.c
 create mode 100644 drivers/gpu/drm/ast/ast_2300.c
 create mode 100644 drivers/gpu/drm/ast/ast_2500.c
 create mode 100644 drivers/gpu/drm/ast/ast_2600.c
 delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h
 create mode 100644 drivers/gpu/drm/ast/ast_post.h

-- 
2.50.0

