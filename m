Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5CA6D7D7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 10:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E63F10E285;
	Mon, 24 Mar 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KyBjpcFL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2q6cSW7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KyBjpcFL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2q6cSW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36A610E285
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:48:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A4052116A;
 Mon, 24 Mar 2025 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gw71OuNgU45nxoYCc0uX4q6Vu8W+9wpF++ZbrnFZkBE=;
 b=KyBjpcFLmh1E8p7jn2BSystZHsO/TWsLYoBDGUOn20YgH+fxDnTFkfiNDfnE5HQBuhHpPn
 br3d5XoVkVx67tapzA1FnHTwrbQAsmjYDB0W8gKYd+hHfK6Rbk5NOpgM71iofBLhUFYO5l
 IO+yRRd4zDCTT37/aEZZ9caZUcDTUZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gw71OuNgU45nxoYCc0uX4q6Vu8W+9wpF++ZbrnFZkBE=;
 b=h2q6cSW7ogjUxPNNhYwtHDO1NDTizsk1xVu/mEvXt3F5e4IYjD+QnAoDVL7wJNHsiJN9FZ
 aFa9Rs7D4wAtvgBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gw71OuNgU45nxoYCc0uX4q6Vu8W+9wpF++ZbrnFZkBE=;
 b=KyBjpcFLmh1E8p7jn2BSystZHsO/TWsLYoBDGUOn20YgH+fxDnTFkfiNDfnE5HQBuhHpPn
 br3d5XoVkVx67tapzA1FnHTwrbQAsmjYDB0W8gKYd+hHfK6Rbk5NOpgM71iofBLhUFYO5l
 IO+yRRd4zDCTT37/aEZZ9caZUcDTUZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gw71OuNgU45nxoYCc0uX4q6Vu8W+9wpF++ZbrnFZkBE=;
 b=h2q6cSW7ogjUxPNNhYwtHDO1NDTizsk1xVu/mEvXt3F5e4IYjD+QnAoDVL7wJNHsiJN9FZ
 aFa9Rs7D4wAtvgBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AC97137AC;
 Mon, 24 Mar 2025 09:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GXjkFIgq4Wf3aAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Mar 2025 09:48:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/ast: Various fixes
Date: Mon, 24 Mar 2025 10:44:08 +0100
Message-ID: <20250324094520.192974-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Three small fixes for ast to resolve a few minor issues. Tested on
AST2600 hardware.

Thomas Zimmermann (3):
  drm/ast: Fix comment on modeset lock
  drm/ast: Remove vaddr field from struct ast_plane
  drm/ast: Validate display modes against framebuffer and format limits

 drivers/gpu/drm/ast/ast_cursor.c |  8 ++----
 drivers/gpu/drm/ast/ast_drv.h    |  4 +--
 drivers/gpu/drm/ast/ast_mode.c   | 49 +++++++++++++++++++-------------
 3 files changed, 35 insertions(+), 26 deletions(-)

-- 
2.48.1

