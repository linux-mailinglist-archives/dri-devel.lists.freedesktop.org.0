Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79058931166
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2D610E315;
	Mon, 15 Jul 2024 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MV6O9gj6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u1x7WTbQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MV6O9gj6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u1x7WTbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7210E195
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:39:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 21F5C1F45A;
 Mon, 15 Jul 2024 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FURU0q142+NZCo0ZcC41flbXW16+mlGFlCCO6L5IUbI=;
 b=MV6O9gj6jl8ssFO5GKGCgr+ccndPL3vaLMlg3wdo7qdqfkeEzLhaFryZFjC0NAaDhHkl83
 cMLLt1ubbdQgbL3zcvgIEonQGlHEt/odOt78/uIw1XOIoXW2GSPt2LDAz1pceRgdHY2EB1
 p/vkX/EY3P/576v42svxs0zhFTrpHfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FURU0q142+NZCo0ZcC41flbXW16+mlGFlCCO6L5IUbI=;
 b=u1x7WTbQWNM08/yssIQ0txUKOcMaEJeLmbX25FXOoSqxKCHStwy94GtYgQQEtpFfF1daGj
 95o3wIai5ih2zEDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MV6O9gj6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u1x7WTbQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721036386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FURU0q142+NZCo0ZcC41flbXW16+mlGFlCCO6L5IUbI=;
 b=MV6O9gj6jl8ssFO5GKGCgr+ccndPL3vaLMlg3wdo7qdqfkeEzLhaFryZFjC0NAaDhHkl83
 cMLLt1ubbdQgbL3zcvgIEonQGlHEt/odOt78/uIw1XOIoXW2GSPt2LDAz1pceRgdHY2EB1
 p/vkX/EY3P/576v42svxs0zhFTrpHfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721036386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FURU0q142+NZCo0ZcC41flbXW16+mlGFlCCO6L5IUbI=;
 b=u1x7WTbQWNM08/yssIQ0txUKOcMaEJeLmbX25FXOoSqxKCHStwy94GtYgQQEtpFfF1daGj
 95o3wIai5ih2zEDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB79E134AB;
 Mon, 15 Jul 2024 09:39:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xFoyNGHulGbTEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jul 2024 09:39:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/probe-helpers: Work around multi-outputs-per-CRTC
 problem
Date: Mon, 15 Jul 2024 11:38:56 +0200
Message-ID: <20240715093936.793552-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 21F5C1F45A
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /
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

Old or simple hardware only supports a single CRTC with multiple
conenctoed outputs. This breaks most userspace compositors, which
only support a single output per CRTC. This currently happens with
ast and mgag200 drivers. The drivers contain a work around that
dynamically disables all but one connected output.

Patches 1 and 2 push the workaround into probe helpers and make it
configurable in the kernel config. For each connector, the driver
needs to specify a bitmask of connectors with higher priority. If
one of them is connected, the connector at hand is always reported
as disconnected. Connectors without priority bitmask as not affected.

Patches 3 to 5 update and simplify the ast drivers. The new workaround
now allows to have multiple physical conenctors in ast. So patch 5
finally allows VGA and DisplayPort on the same device.

Patches 6 and 7 update mgag200.

Any future driver that exposes the same problem as ast and mgag200
can simply hook into the workaround. Hopefully userspace can be fixed
at some point.

Thomas Zimmermann (7):
  drm/probe-helper: Call connector detect functions in single helper
  drm/probe-helper: Optionally report single connected output per CRTC
  drm/ast: Set connector priorities
  drm/ast: Remove struct ast_bmc_connector
  drm/ast: Support ASTDP and VGA at the same time
  drm/mgag200: Set connector priorities
  drm/mgag200: Remove struct mgag200_bmc_connector

 drivers/gpu/drm/Kconfig                   |  15 +++
 drivers/gpu/drm/ast/ast_drv.h             |  17 +--
 drivers/gpu/drm/ast/ast_main.c            |   2 +-
 drivers/gpu/drm/ast/ast_mode.c            |  49 ++------
 drivers/gpu/drm/drm_probe_helper.c        | 137 +++++++++++++++++++---
 drivers/gpu/drm/mgag200/mgag200_bmc.c     |  44 +------
 drivers/gpu/drm/mgag200/mgag200_drv.h     |   9 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +-
 include/drm/drm_connector.h               |   2 +
 include/drm/drm_probe_helper.h            |   2 +
 16 files changed, 177 insertions(+), 128 deletions(-)

-- 
2.45.2

