Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D35A382DF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 13:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77A410E44B;
	Mon, 17 Feb 2025 12:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IKvrZVn4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vgZ6iME";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IKvrZVn4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vgZ6iME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156810E443
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:23:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BAC01F769;
 Mon, 17 Feb 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vGpHu3NU2Qvpde0cVUFzUB48wpNUMWnt70ZU4p5x0E=;
 b=IKvrZVn41TMX9+O/vU3iwYdL4dHmrQlpCDJDP/CCLUpZZ8BGlo6sYcJ5xx/hIvW+WfHAmo
 GfauKOkn1FKbHL4Q5NuJ+SxdVczn7KqACgF9DljASHlBwXVWe8SaEG4n99SkG9IX4L/lTn
 9+lWuUXH1GnDEBEItfcBHkaB/CgUAXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vGpHu3NU2Qvpde0cVUFzUB48wpNUMWnt70ZU4p5x0E=;
 b=+vgZ6iMEeU+gAERm2dCHn4cLiw5mnmBoulzgDbOUSZ+L94Y7wvnELPynNJTkE10q/AM2g5
 uCBVPaHBp4OVosBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IKvrZVn4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+vgZ6iME
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vGpHu3NU2Qvpde0cVUFzUB48wpNUMWnt70ZU4p5x0E=;
 b=IKvrZVn41TMX9+O/vU3iwYdL4dHmrQlpCDJDP/CCLUpZZ8BGlo6sYcJ5xx/hIvW+WfHAmo
 GfauKOkn1FKbHL4Q5NuJ+SxdVczn7KqACgF9DljASHlBwXVWe8SaEG4n99SkG9IX4L/lTn
 9+lWuUXH1GnDEBEItfcBHkaB/CgUAXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vGpHu3NU2Qvpde0cVUFzUB48wpNUMWnt70ZU4p5x0E=;
 b=+vgZ6iMEeU+gAERm2dCHn4cLiw5mnmBoulzgDbOUSZ+L94Y7wvnELPynNJTkE10q/AM2g5
 uCBVPaHBp4OVosBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 558AB133F9;
 Mon, 17 Feb 2025 12:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Df6JE00qs2cwdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Feb 2025 12:23:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] drm/ast: cursor: Improve format handling
Date: Mon, 17 Feb 2025 13:22:03 +0100
Message-ID: <20250217122336.230067-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BAC01F769
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[4];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

A number of generally useful updates to the cursor code.

The cursor code performs format conversion to the hardware's ARGB444
format and calculation of a checksum in a single function. Patch 1
splits this into two steps. Patch 2 then implements the format
conversion with DRM's format helpers. Other drivers can now reuse
the code.

With the format handling separated, patch 3 adds support for
ARGB4444, which is the hardware's native format.

Patch 4 moves cursor handling into a separate source file.

Tested on AST2600.

v2:
- only minor style changes

Thomas Zimmermann (4):
  drm/ast: cursor: Calculate checksum in helper
  drm/ast: cursor: Move format conversion to shared helper
  drm/ast: cursor: Add support for ARGB4444
  drm/ast: cursor: Move implementation to separate source file

 drivers/gpu/drm/ast/Makefile        |   1 +
 drivers/gpu/drm/ast/ast_cursor.c    | 309 ++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h       |  41 ++--
 drivers/gpu/drm/ast/ast_mode.c      | 273 +-----------------------
 drivers/gpu/drm/drm_format_helper.c |  69 +++++++
 include/drm/drm_format_helper.h     |   3 +
 6 files changed, 418 insertions(+), 278 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c

-- 
2.48.1

