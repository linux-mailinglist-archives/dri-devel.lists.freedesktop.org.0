Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84722CB935E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 17:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C477E10E8EF;
	Fri, 12 Dec 2025 16:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qCy/k+Te";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6ApaMlh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qCy/k+Te";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6ApaMlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39110E8EF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 16:03:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA0AD5BD04;
 Fri, 12 Dec 2025 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765555401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv0UPcs1BHBZYIhmF5NlnaSGFy6VLSfulyBjBxxIEHo=;
 b=qCy/k+Teb/mcyd46VZW8g3J3AGgqXC5f/1hHe4cZ86Q6Fyc3jZIN01fBmXvMYYSJSw66IE
 PGhfq7LRcIJlvGvMp+e+LDcvo0G6z1yhCsX/0w/G3AGoAa+lrQvnPfXt9EhTPKgaYLO+gi
 IRoF/9RSGXJC0vrBjolF/j+e7YCXHVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765555401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv0UPcs1BHBZYIhmF5NlnaSGFy6VLSfulyBjBxxIEHo=;
 b=E6ApaMlhbpU8QjugYgzdl/3rWPyHbx/rvMHKJ4tnd82Hd7zx6FZkAqAwklO+uoegbYpeFM
 D+s6WUm+RTLi7rAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765555401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv0UPcs1BHBZYIhmF5NlnaSGFy6VLSfulyBjBxxIEHo=;
 b=qCy/k+Teb/mcyd46VZW8g3J3AGgqXC5f/1hHe4cZ86Q6Fyc3jZIN01fBmXvMYYSJSw66IE
 PGhfq7LRcIJlvGvMp+e+LDcvo0G6z1yhCsX/0w/G3AGoAa+lrQvnPfXt9EhTPKgaYLO+gi
 IRoF/9RSGXJC0vrBjolF/j+e7YCXHVY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765555401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kv0UPcs1BHBZYIhmF5NlnaSGFy6VLSfulyBjBxxIEHo=;
 b=E6ApaMlhbpU8QjugYgzdl/3rWPyHbx/rvMHKJ4tnd82Hd7zx6FZkAqAwklO+uoegbYpeFM
 D+s6WUm+RTLi7rAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 621DC3EA63;
 Fri, 12 Dec 2025 16:03:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 19GNFsk8PGlnGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Dec 2025 16:03:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/tests: Fix tests for GEM SHMEM
Date: Fri, 12 Dec 2025 17:00:31 +0100
Message-ID: <20251212160317.287409-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

As a result some refactoring of the GEM SHMEM code, most of the
tests for GEM SHMEM currently fail. Fix all of that.

Also fix the names of some of the test functions to match what
they test.

Thomas Zimmermann (5):
  drm/tests: shmem: Swap names of export tests
  drm/tests: shmem: Add clean-up action to unpin pages
  drm/tests: shmem: Hold reservation lock around vmap/vunmap
  drm/tests: shmem: Hold reservation lock around madvise
  drm/tests: shmem: Hold reservation lock around purge

 drivers/gpu/drm/drm_gem_shmem_helper.c     | 63 ++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 30 +++++++----
 include/drm/drm_gem_shmem_helper.h         | 11 ++++
 3 files changed, 94 insertions(+), 10 deletions(-)

-- 
2.52.0

