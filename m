Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C57194E9DB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3988410E199;
	Mon, 12 Aug 2024 09:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pgzno2fd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xnTrnngD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+6yVuqZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HxXSF1k4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F4810E18E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D6102224F3;
 Mon, 12 Aug 2024 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m5XPD7Vax69PZwDa3eNFJ4LkIg2lY9cEwe40Ik5OUPU=;
 b=pgzno2fdD1fGEfRtZ214vbjllLf5Toe+ymzRnw78jEbYVFSX8KmhpswYvruV0djKlqQpuV
 foyz3C99quVBty80ABCHeJmuGJROtaX1Xvlj7voghsTtCam4hZ0+hzD+4vndot3p5kq6qi
 wNSgD6Atvsc9mTx1hSfI5mDoMCavi0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m5XPD7Vax69PZwDa3eNFJ4LkIg2lY9cEwe40Ik5OUPU=;
 b=xnTrnngDjm7Uv//GlXKHaX5dZvJjlYF4zIYguIfTQwPatSMLqoyQuvdj3Omzsskik8QL6G
 VlOtbMpfufgXyqDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m5XPD7Vax69PZwDa3eNFJ4LkIg2lY9cEwe40Ik5OUPU=;
 b=X+6yVuqZIJMJ9g8cvvg3tXSeOgyhetjTgvHqxZ4KqcP0eAqqGABXuQpwIgexZEqA7Sosvf
 k14TjMtjUTs9eoAdD/G6S8hhOSCGuc9bk0IMXFaratjVnlOACpZQrTvPyT0xjXS2CNIArT
 NL2RuwnTAl+nK5J0HRG2F55sTOc7o9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m5XPD7Vax69PZwDa3eNFJ4LkIg2lY9cEwe40Ik5OUPU=;
 b=HxXSF1k4u7xdbUxhE5BfKTYs47f1ft5iNV4gyXREzYHjaHW5pYwBm6yMR0wx3fmSb9mwiE
 oEEemgoLvnG6RpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F78B137BA;
 Mon, 12 Aug 2024 09:32:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hzthJaDWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/9] drm/ast: Transparently handle BMC in outputs
Date: Mon, 12 Aug 2024 11:30:34 +0200
Message-ID: <20240812093211.382263-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Add transparent BMC support to all outputs. If the user disconnects
the physical display, each output will now return display modes for
the BMC. Makes the BMC connector obsolete, so remove it.

The benefit of the new approach is that is works with any userspace.
Most userspace compositors have problems configuring the current BMC
connector. The BMC connector is now gone and only a physical connector
is present.

Also clean up some of the EDID handling in preparation. Switching to
struct drm_edid and its helpers simplifies the code for inclusion of
the BMC support.

A similar approach has been taken for mgag200. [1] Here a server's
display hardware also contains an internal BMC that needs to display
even without the presence of a physical display.

v2:
- fix reading EDID data on ASTDP and DP501 chips (Jocelyn)

[1] https://patchwork.freedesktop.org/series/136885/

Thomas Zimmermann (9):
  drm/ast: Move code for physical outputs into separate files
  drm/ast: astdp: Move locking into EDID helper
  drm/ast: astdp: Use struct drm_edid and helpers
  drm/ast: astdp: Transparently handle BMC support
  drm/ast: dp501: Use struct drm_edid and helpers
  drm/ast: dp501: Transparently handle BMC support
  drm/ast: sil164: Transparently handle BMC support
  drm/ast: vga: Transparently handle BMC support
  drm/ast: Remove BMC output

 drivers/gpu/drm/ast/Makefile     |   4 +-
 drivers/gpu/drm/ast/ast_dp.c     | 242 ++++++++++++-
 drivers/gpu/drm/ast/ast_dp501.c  | 179 ++++++++--
 drivers/gpu/drm/ast/ast_drv.h    |  21 +-
 drivers/gpu/drm/ast/ast_mode.c   | 578 -------------------------------
 drivers/gpu/drm/ast/ast_sil164.c | 124 +++++++
 drivers/gpu/drm/ast/ast_vga.c    | 124 +++++++
 7 files changed, 645 insertions(+), 627 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
 create mode 100644 drivers/gpu/drm/ast/ast_vga.c

-- 
2.46.0

