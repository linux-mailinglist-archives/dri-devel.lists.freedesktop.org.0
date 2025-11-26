Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56478C890D0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45010E588;
	Wed, 26 Nov 2025 09:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ew/o95lm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ixZjdw5N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ew/o95lm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ixZjdw5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514EF10E588
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:46:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 253D622CE2;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764150397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=neT5Hdgi1bDkV8uvt5cp9WWpQAh8ukWX3DZpC657diI=;
 b=Ew/o95lmWhXJuJCl7gNlj/MyBmt+96ZAlVhaC4I/48lDU1AB5KLLRIBTLKauT9aXz0wct7
 TBypbF4v6Tp/BCk8BtERHLcV1fnO6U7QaTjmrpGpS/oQ2XbUD4B/is0ZquyENtJeyZhWEE
 5G0yfkt4JaPX/hg9/jMFVl1xLWDF7fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764150397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=neT5Hdgi1bDkV8uvt5cp9WWpQAh8ukWX3DZpC657diI=;
 b=ixZjdw5NIL4vM/fTvLQyl8lhpuURXbE6LAKM2lnbdohX/8RwzcCFSNusI4BqK0Y9sc5Qqu
 UFNNzuX78sYnwdCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764150397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=neT5Hdgi1bDkV8uvt5cp9WWpQAh8ukWX3DZpC657diI=;
 b=Ew/o95lmWhXJuJCl7gNlj/MyBmt+96ZAlVhaC4I/48lDU1AB5KLLRIBTLKauT9aXz0wct7
 TBypbF4v6Tp/BCk8BtERHLcV1fnO6U7QaTjmrpGpS/oQ2XbUD4B/is0ZquyENtJeyZhWEE
 5G0yfkt4JaPX/hg9/jMFVl1xLWDF7fc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764150397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=neT5Hdgi1bDkV8uvt5cp9WWpQAh8ukWX3DZpC657diI=;
 b=ixZjdw5NIL4vM/fTvLQyl8lhpuURXbE6LAKM2lnbdohX/8RwzcCFSNusI4BqK0Y9sc5Qqu
 UFNNzuX78sYnwdCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0223A3EA65;
 Wed, 26 Nov 2025 09:46:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eATvOnzMJmnQJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 09:46:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/ast: Support imported cursor buffers
Date: Wed, 26 Nov 2025 10:40:07 +0100
Message-ID: <20251126094626.41985-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
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

Support cursor framebuffers with imported GEM objects. Also handle
corner cases where imported buffers are not readily available. The
common case of native cursor buffers in XRGB8888 format is not
affected by these changes.

This series is a follow-up to commit 3dd0be7a301b ("drm/ast: Handle
framebuffer from dma-buf"), which implemented such support for primary
planes. While unlikely, imported cursor buffers is possible and can
be supported by the ast driver easily.

Tested on AST2600 hardware.

Thomas Zimmermann (3):
  drm/ast: Move cursor format conversion into helper function
  drm/ast: Support cursor buffers objects in I/O memory
  drm/ast: Wrap cursor framebuffer access in
    drm_gem_fb_begin/end_cpu_access()

 drivers/gpu/drm/ast/ast_cursor.c | 83 ++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 21 deletions(-)


base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
-- 
2.51.1

