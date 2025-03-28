Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A1A7463C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2894110E9AB;
	Fri, 28 Mar 2025 09:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DtvWmD85";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BNHDjuox";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtvWmD85";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BNHDjuox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EA510E9AB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:22:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B1221F388;
 Fri, 28 Mar 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m7ymwg0zFsVDnm4IDbw4ACKQH9ffKncZgyFWho0KzEE=;
 b=DtvWmD85oK5COLHW/4bcQiDbs2QwXrAfmao0gKd/qw+1z/iUlGiTwHBOnPN5m5qXHRWzgK
 Hv8YJWcsw1st1eN5UUH3CFt7llbovtIZwOxRyOC8hAao05R3qPyBUkx8lRz/ztZ2me16Io
 Bp5sQjzfczxgMUU+wduoxvy2ShbICms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m7ymwg0zFsVDnm4IDbw4ACKQH9ffKncZgyFWho0KzEE=;
 b=BNHDjuoxalwWC7S167s4GipOv/GhQ1uYqRk4QKHOwnqjgDz6WPTyR/v/qx+imYvrJ2DGVV
 GoWJ9ZNGt34z8gBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743153712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m7ymwg0zFsVDnm4IDbw4ACKQH9ffKncZgyFWho0KzEE=;
 b=DtvWmD85oK5COLHW/4bcQiDbs2QwXrAfmao0gKd/qw+1z/iUlGiTwHBOnPN5m5qXHRWzgK
 Hv8YJWcsw1st1eN5UUH3CFt7llbovtIZwOxRyOC8hAao05R3qPyBUkx8lRz/ztZ2me16Io
 Bp5sQjzfczxgMUU+wduoxvy2ShbICms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743153712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m7ymwg0zFsVDnm4IDbw4ACKQH9ffKncZgyFWho0KzEE=;
 b=BNHDjuoxalwWC7S167s4GipOv/GhQ1uYqRk4QKHOwnqjgDz6WPTyR/v/qx+imYvrJ2DGVV
 GoWJ9ZNGt34z8gBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47315139D4;
 Fri, 28 Mar 2025 09:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6rYVEDBq5mciEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 09:21:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] drm/cirrus-qemu: Various fixes
Date: Fri, 28 Mar 2025 10:17:04 +0100
Message-ID: <20250328091821.195061-1-tzimmermann@suse.de>
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
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
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

Fix various issues in cirrus-qemu and clean up.

Patch 1 fixes a long-standing, but apparently harmless, bug. Patches
2 and 3 make mode programming more reliable. Patch 4 cleans up after
patch 3.

This series makes cirrus-qemu more reliable at the cost of some higher
resolutions.

Testeded on qemu-i368.

v2:
- expand commit message (Gerd)

Thomas Zimmermann (4):
  drm/cirrus-qemu: Fix pitch programming
  drm/cirrus-qemu: Stricter mode validation
  drm/cirrus-qemu: Use framebuffer format as-is, drop adjustments
  drm/cirrus-qemu: Remove custom plane state

 drivers/gpu/drm/tiny/cirrus-qemu.c | 143 ++++-------------------------
 1 file changed, 20 insertions(+), 123 deletions(-)

-- 
2.48.1

