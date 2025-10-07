Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7EBC1DBD
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C267710E6C9;
	Tue,  7 Oct 2025 15:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hXOWE5CL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nQexImio";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hXOWE5CL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nQexImio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D0210E6CA
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B81E033717;
 Tue,  7 Oct 2025 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=18uBbTxZnbM/gSRZJ4T2jShyQzswKvXfGCXzkN10udY=;
 b=hXOWE5CLBrZYRHbOkWmKPmjTpNGZPWhq0ybYdeDNTdGGZg1FWhb8gMAhS5eXFejQHyqSrR
 5YjlInthpy4Z2pC4YYeZRU9di3DmnN4ctYC86kP5IncktPjPynvyhvuVYkKamwRMb3eMc4
 qC8XXg5I6UBpv5qlXm8S0d+ZUiFrIYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=18uBbTxZnbM/gSRZJ4T2jShyQzswKvXfGCXzkN10udY=;
 b=nQexImioYViuyW8duNP1cDFHUjLOvUHZXCC7AEFcZX4/yvQtDAe8Drz4gsPut/E9vL54wH
 L+VmcHzt+rGQV8Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hXOWE5CL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nQexImio
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=18uBbTxZnbM/gSRZJ4T2jShyQzswKvXfGCXzkN10udY=;
 b=hXOWE5CLBrZYRHbOkWmKPmjTpNGZPWhq0ybYdeDNTdGGZg1FWhb8gMAhS5eXFejQHyqSrR
 5YjlInthpy4Z2pC4YYeZRU9di3DmnN4ctYC86kP5IncktPjPynvyhvuVYkKamwRMb3eMc4
 qC8XXg5I6UBpv5qlXm8S0d+ZUiFrIYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=18uBbTxZnbM/gSRZJ4T2jShyQzswKvXfGCXzkN10udY=;
 b=nQexImioYViuyW8duNP1cDFHUjLOvUHZXCC7AEFcZX4/yvQtDAe8Drz4gsPut/E9vL54wH
 L+VmcHzt+rGQV8Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 949B613693;
 Tue,  7 Oct 2025 15:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GJfaInUs5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/ast: Remove model-specific branches from mode-setting
 pipeline
Date: Tue,  7 Oct 2025 16:54:41 +0200
Message-ID: <20251007150343.273718-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B81E033717
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
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

Store additional information in struct ast_device and struct
ast_device_quirk to describe each model. Replace the per-Gen
branching in the mode-setting code with the new data. Makes mode
setting more flexible and puts more of the per-Gen information
in a single source file per model.

Tested on AST2600 hardware.

Next to address will be the remaining per-Gen cases in the POST and
in the DP501 code. After that there will be a single specific source
file per hardware generation.

Thomas Zimmermann (5):
  drm/ast: Store DRAM clock table in struct ast_device
  drm/ast: Support device quirks
  drm/ast: Store CRTC memory request threshold in device quirks
  drm/ast: Store precatch settings in struct ast_device_quirks
  drm/ast: Store HSync adjustment in device quirks

 drivers/gpu/drm/ast/ast_2000.c |  9 ++++++-
 drivers/gpu/drm/ast/ast_2100.c |  9 ++++++-
 drivers/gpu/drm/ast/ast_2200.c |  9 ++++++-
 drivers/gpu/drm/ast/ast_2300.c |  9 ++++++-
 drivers/gpu/drm/ast/ast_2400.c |  9 ++++++-
 drivers/gpu/drm/ast/ast_2500.c | 10 +++++++-
 drivers/gpu/drm/ast/ast_2600.c | 11 +++++++-
 drivers/gpu/drm/ast/ast_drv.c  |  4 ++-
 drivers/gpu/drm/ast/ast_drv.h  | 27 +++++++++++++++++++-
 drivers/gpu/drm/ast/ast_mode.c | 46 +++++++++++-----------------------
 10 files changed, 103 insertions(+), 40 deletions(-)

-- 
2.51.0

