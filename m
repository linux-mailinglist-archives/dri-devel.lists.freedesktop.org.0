Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39EB354CE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4659210E5CF;
	Tue, 26 Aug 2025 06:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vm5Q4C3k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V+BqTXdZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHWHBLbr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u99dD7aO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B04710E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:53:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5F5221A26;
 Tue, 26 Aug 2025 06:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o0I8uRpe7ThNQdE3Eux89Iknpgb6a33SQPW6r4Oq/FQ=;
 b=vm5Q4C3kVvyo3l+s7ZauDFSyA4UtxLzOgKUfuyYQnfae8VOl8V35fjmAt/VfSXz5L+n5/M
 PJCXadLmSdOzlgxOMOixuGJlLZlMk3MCPC/kQC7BBCvQDpQutxxm97Qy0bGbQbW6G5w8SF
 GSZCiUQ70PyRU5JJIRagPZkSClNs16E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o0I8uRpe7ThNQdE3Eux89Iknpgb6a33SQPW6r4Oq/FQ=;
 b=V+BqTXdZOASNtj78qEcUrdtmQknxoz7s+/naGhL1nYu4mX//to/Yedkp8Lf3MjRIJSTh9s
 +vbQqa7qnhyyTYDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OHWHBLbr;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u99dD7aO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o0I8uRpe7ThNQdE3Eux89Iknpgb6a33SQPW6r4Oq/FQ=;
 b=OHWHBLbr69A/HHQ6UzhrzAAFwLE3bagGjgcGyA4xYjd2F3e8AFsNgbDTCkv80QhacNXGod
 K5sc5RT8xU5r2IC/+08YtnzGIJQSFCTgCM+CisWHxDMd4mCDTxW1NUpEIUoaYsXnA3lOob
 nucA7tpk7TNiYZ0ACC7cgzrFJpUrH/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o0I8uRpe7ThNQdE3Eux89Iknpgb6a33SQPW6r4Oq/FQ=;
 b=u99dD7aOxsdzZ0l1PYYs1M5J5uRyrLJsdy6x/1rdgZkJd8+WeaTYs0Q8OD8TW4szs0mYqw
 6VinDcpaa1kvHIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8450D13A31;
 Tue, 26 Aug 2025 06:53:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BP9/HuJZrWhtMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 06:53:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/6] ast: Replace DRAM info code
Date: Tue, 26 Aug 2025 08:49:19 +0200
Message-ID: <20250826065032.344412-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C5F5221A26
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The ast driver's ast_get_dram_info() helper is supposed to return
information about the hardware's memory setup. It depends on the
various types of configurations and the chipset model. The problem
is that most of this is not needed or outright wrong.

Really needed is only the bank layout of the memory for posting Gen2
and Gen3 systems with P2A configuration.

This series removes ast_gem_dram_info(). The code for retrieving the
bank layout goes into the Gen2 source code and runs when required.

Tested on AST2100 and AST2600 hardware.

Thomas Zimmermann (6):
  drm/ast: Do not print DRAM info
  drm/ast: Remove unused dram_bus_width field
  drm/ast: Remove unused mclk field
  drm/ast: Remove unused SCU-MPLL and SCU-STRAP values
  drm/ast: Move DRAM info next to its only user
  drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout

 drivers/gpu/drm/ast/ast_2100.c |  46 +++++++++++-
 drivers/gpu/drm/ast/ast_drv.h  |  20 +++---
 drivers/gpu/drm/ast/ast_main.c | 126 ---------------------------------
 3 files changed, 52 insertions(+), 140 deletions(-)

-- 
2.50.1

