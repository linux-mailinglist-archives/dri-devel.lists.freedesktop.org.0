Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91915933E86
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32810E122;
	Wed, 17 Jul 2024 14:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="urj8wX2S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P+ESAJp7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="urj8wX2S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P+ESAJp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82B10E0D7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:33:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C7F1A21AEB;
 Wed, 17 Jul 2024 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721226807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aGx18Tet+kIVCVxSDSxCfmIiWEvl6N975D7iBa4EjqU=;
 b=urj8wX2S+2XPZruqksFgbHfeMwH0VDwoLPKdg64h9VwcP1A7XwSYbLfFix71b7iB9P6wgk
 UGsanVyl6wfa0DiVEPF0PL5MJtOFxSlqvXwcz9IryfCNAUqCeDSSjNOglxLOvQ9La40Bw4
 bMzY7SiOPYN8wKbPc/pyvjQdLTcg9C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721226807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aGx18Tet+kIVCVxSDSxCfmIiWEvl6N975D7iBa4EjqU=;
 b=P+ESAJp7u36rcbytmsOn8VK0BTa45/ajDfOAtVaz5A+Qn6EBsXETJqZDInsLl+LkCXB6/d
 lofJTv5c98hoKUDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721226807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aGx18Tet+kIVCVxSDSxCfmIiWEvl6N975D7iBa4EjqU=;
 b=urj8wX2S+2XPZruqksFgbHfeMwH0VDwoLPKdg64h9VwcP1A7XwSYbLfFix71b7iB9P6wgk
 UGsanVyl6wfa0DiVEPF0PL5MJtOFxSlqvXwcz9IryfCNAUqCeDSSjNOglxLOvQ9La40Bw4
 bMzY7SiOPYN8wKbPc/pyvjQdLTcg9C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721226807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aGx18Tet+kIVCVxSDSxCfmIiWEvl6N975D7iBa4EjqU=;
 b=P+ESAJp7u36rcbytmsOn8VK0BTa45/ajDfOAtVaz5A+Qn6EBsXETJqZDInsLl+LkCXB6/d
 lofJTv5c98hoKUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F3CE1368F;
 Wed, 17 Jul 2024 14:33:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hCenITfWl2YmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 14:33:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/ast: Fix DP hotplugging and clean up
Date: Wed, 17 Jul 2024 16:24:15 +0200
Message-ID: <20240717143319.104012-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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

Here are a number of updates for ast's ASTDP transmitter code.

So far the ast driver required the DisplayPort to be connected
at boot. Later detection was not supported. Re-connecting the
cable was also not supported. Once atomic_disable powered off
the physical ASTDP connector, there was no way of detecting a
conencted display. Patch 1 makes Hot Plug Detection work. If
ncesessary, the connector's detect helper powers up the physical
connector to read the HPD status.

That's a good oportunity to clean up ast's whole detection code
for ASTDP transmitters. So patch 2 to 4 remove duplicated status
tests throughout the ASTDP code.

Patch 5 simplified the code for reading the display's EDID data
from the firmware.

Tested on AST2600 hardware with an ASTDP transmitter.

Thomas Zimmermann (5):
  drm/ast: astdp: Wake up during connector status detection
  drm/ast: astdp: Test firmware status once during probing
  drm/ast: astdp: Only test HDP state in ast_astdp_is_connected()
  drm/ast: astdp: Perform link training during atomic_enable
  drm/ast: astdp: Clean up EDID reading

 drivers/gpu/drm/ast/ast_dp.c   | 186 +++++++++++++++------------------
 drivers/gpu/drm/ast/ast_drv.h  |   4 +-
 drivers/gpu/drm/ast/ast_main.c |   6 +-
 drivers/gpu/drm/ast/ast_mode.c |  31 +++++-
 drivers/gpu/drm/ast/ast_post.c |   2 +-
 drivers/gpu/drm/ast/ast_reg.h  |  22 ++--
 6 files changed, 126 insertions(+), 125 deletions(-)

-- 
2.45.2

