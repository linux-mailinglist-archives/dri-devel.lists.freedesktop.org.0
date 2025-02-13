Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E2A34A25
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7C010EB27;
	Thu, 13 Feb 2025 16:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CAgd8Q/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LpuydLyH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAgd8Q/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LpuydLyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2955510EB26
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E172622114;
 Thu, 13 Feb 2025 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hDyrS870Qoq2DZ7/SBgwl9qdJEBNy6yJnIHujv3GVow=;
 b=CAgd8Q/k9S0lfsooNeVPDCkMYM8+tEjuwzg/jBL41qxOcJvKKKG00UdnUnVJXRaJ7syCVo
 6d5GCTnpXL86i4L0lNQsUwGoAwurp64flRYXuMKnOnZO6FVgLgjGPV/JfDbMRvw9bpSYWx
 7MFZUOWyFuR0hRgXwaYw7kqwrrhd/n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hDyrS870Qoq2DZ7/SBgwl9qdJEBNy6yJnIHujv3GVow=;
 b=LpuydLyHkS9+env1nlNV5TQQSXwwTdrEeb8tqFTMTcZTEOETDs6m18wImDuxGDy3Fcx9Gp
 DDJoYz37rfuQU/BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739464730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hDyrS870Qoq2DZ7/SBgwl9qdJEBNy6yJnIHujv3GVow=;
 b=CAgd8Q/k9S0lfsooNeVPDCkMYM8+tEjuwzg/jBL41qxOcJvKKKG00UdnUnVJXRaJ7syCVo
 6d5GCTnpXL86i4L0lNQsUwGoAwurp64flRYXuMKnOnZO6FVgLgjGPV/JfDbMRvw9bpSYWx
 7MFZUOWyFuR0hRgXwaYw7kqwrrhd/n8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739464730;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hDyrS870Qoq2DZ7/SBgwl9qdJEBNy6yJnIHujv3GVow=;
 b=LpuydLyHkS9+env1nlNV5TQQSXwwTdrEeb8tqFTMTcZTEOETDs6m18wImDuxGDy3Fcx9Gp
 DDJoYz37rfuQU/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB832137DB;
 Thu, 13 Feb 2025 16:38:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NeooKBogrmfpFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 16:38:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/ast: cursor: Improve format handling
Date: Thu, 13 Feb 2025 17:25:45 +0100
Message-ID: <20250213163845.118207-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
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

Thomas Zimmermann (4):
  drm/ast: cursor: Calculate checksum in helper
  drm/ast: cursor: Move format conversion to shared helper
  drm/ast: cursor: Add support for ARGB4444
  drm/ast: cursor: Move implementation to separate source file

 drivers/gpu/drm/ast/Makefile        |   1 +
 drivers/gpu/drm/ast/ast_cursor.c    | 306 ++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h       |  41 ++--
 drivers/gpu/drm/ast/ast_mode.c      | 273 +------------------------
 drivers/gpu/drm/drm_format_helper.c |  69 +++++++
 include/drm/drm_format_helper.h     |   3 +
 6 files changed, 415 insertions(+), 278 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_cursor.c

-- 
2.48.1

