Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EE975125
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C010E9C3;
	Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ezx3nKJd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5Ns+7O4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ezx3nKJd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5Ns+7O4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59A10E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3774B219CE;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ab9jTX5DYsB3fexShu2GlytARGwOx6NjVMVBEXETxrQ=;
 b=Ezx3nKJdig/VLDlictP4wQjslgEs/G/MQ/M5QXMt22h6AKYEaqRaFMwvDxkfO7+wkubjfy
 LI59hYR4kpaH0G+IC80TuysEC7LZMQyCmjRhqM4RwluUbcbyDi+AKTnGZtYAHsI0ABntTd
 b1u3L1RYmHUKWWTsdfujoefAWkrrP1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ab9jTX5DYsB3fexShu2GlytARGwOx6NjVMVBEXETxrQ=;
 b=V5Ns+7O4zjtbXaQbLemAtal111jOfJAqXXD4yyMB1G2gqUBJOysMwfNrwDtuTopZ05JD3c
 5HY9IgATvuQK48Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ab9jTX5DYsB3fexShu2GlytARGwOx6NjVMVBEXETxrQ=;
 b=Ezx3nKJdig/VLDlictP4wQjslgEs/G/MQ/M5QXMt22h6AKYEaqRaFMwvDxkfO7+wkubjfy
 LI59hYR4kpaH0G+IC80TuysEC7LZMQyCmjRhqM4RwluUbcbyDi+AKTnGZtYAHsI0ABntTd
 b1u3L1RYmHUKWWTsdfujoefAWkrrP1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ab9jTX5DYsB3fexShu2GlytARGwOx6NjVMVBEXETxrQ=;
 b=V5Ns+7O4zjtbXaQbLemAtal111jOfJAqXXD4yyMB1G2gqUBJOysMwfNrwDtuTopZ05JD3c
 5HY9IgATvuQK48Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FF7113A7C;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KZaEAs+E4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/10] drm/ast: Various cleanups
Date: Wed, 11 Sep 2024 13:51:18 +0200
Message-ID: <20240911115347.899148-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
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

Here are various cleanups for the ast driver. Most of the patches
inline functions or avoid upcasting. Some internal helpers of the
astdp support are now easier to understand.

Tested on AST2600 HW.

Thomas Zimmermann (10):
  drm/ast: astdp: Inline ast_astdp_connector_init()
  drm/ast: astdp: Avoid upcasting to struct ast_device
  drm/ast: astdp: Replace power_on helpers
  drm/ast: astdp: Replace ast_dp_set_on_off()
  drm/ast: dp501: Inline ast_dp501_connector_init()
  drm/ast: dp501: Avoid upcasting to struct ast_device
  drm/ast: sil164: Inline ast_sil164_connector_init()
  drm/ast: vga: Inline ast_vga_connector_init()
  drm/ast: Respect return value from CRTC init
  drm/ast: Avoid upcasting to struct ast_device

 drivers/gpu/drm/ast/ast_dp.c     | 141 ++++++++++++++++---------------
 drivers/gpu/drm/ast/ast_dp501.c  |  96 ++++++++++-----------
 drivers/gpu/drm/ast/ast_drv.c    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h    |   9 +-
 drivers/gpu/drm/ast/ast_main.c   |  10 +--
 drivers/gpu/drm/ast/ast_mode.c   |   8 +-
 drivers/gpu/drm/ast/ast_post.c   |  32 +++----
 drivers/gpu/drm/ast/ast_reg.h    |  15 +---
 drivers/gpu/drm/ast/ast_sil164.c |  55 ++++++------
 drivers/gpu/drm/ast/ast_vga.c    |  55 ++++++------
 10 files changed, 200 insertions(+), 223 deletions(-)

-- 
2.46.0

