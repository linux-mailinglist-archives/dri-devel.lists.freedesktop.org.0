Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8DA7BDCA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1458A10EBBD;
	Fri,  4 Apr 2025 13:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="081fEHsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m6zlacOa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="081fEHsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m6zlacOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8B10EBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:30:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3812E2118A;
 Fri,  4 Apr 2025 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h05Z/+UuNngp+cs43OC/uw9lA6u3d38O/GiuWQBpZ38=;
 b=081fEHsrBFEBCJAkL98zqKeA9+ShFb0Ah+tGVfKkSHr2iS7nlZKwYf9rJGtWEY2SJJqS85
 xC+6p4N47Va7QQYix0voTXbZOwn/+8OBpk95DmM6FGsU+sekWTYrYygFhUu5h0L+eVbfsj
 kN8QNZjiyNkSEtz4f9jSd/czJu1zeBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h05Z/+UuNngp+cs43OC/uw9lA6u3d38O/GiuWQBpZ38=;
 b=m6zlacOazddTA1OMxqrKDW6fKXugr9Qy7otiFPMYL8jG5ffBmCwrQZVXcXzxBOnS5OqgS7
 KGuP7tG6GsD9sbBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h05Z/+UuNngp+cs43OC/uw9lA6u3d38O/GiuWQBpZ38=;
 b=081fEHsrBFEBCJAkL98zqKeA9+ShFb0Ah+tGVfKkSHr2iS7nlZKwYf9rJGtWEY2SJJqS85
 xC+6p4N47Va7QQYix0voTXbZOwn/+8OBpk95DmM6FGsU+sekWTYrYygFhUu5h0L+eVbfsj
 kN8QNZjiyNkSEtz4f9jSd/czJu1zeBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h05Z/+UuNngp+cs43OC/uw9lA6u3d38O/GiuWQBpZ38=;
 b=m6zlacOazddTA1OMxqrKDW6fKXugr9Qy7otiFPMYL8jG5ffBmCwrQZVXcXzxBOnS5OqgS7
 KGuP7tG6GsD9sbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1D6013691;
 Fri,  4 Apr 2025 13:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uz+vOdne72eYXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 13:30:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm: Restrict GEM's pin/unpin to PRIME
Date: Fri,  4 Apr 2025 15:23:30 +0200
Message-ID: <20250404132907.225803-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The pin and unpin callbacks in struct drm_gem_object_funcs are
for PRIME exported dma-bufs. Remove the pin calls in the client
code, drop the unnecessary pin callbacks from gem-vram and inline
drm_gem_pin() into the only remaining caller. Do the equivalent
for drm_gem_unpin().

AFAICT the long-term plan is to switch to dynamic dma-buf imports
and remove pin/unpin from GEM object functions.

Thomas Zimmermann (4):
  drm/client: Do not pin in drm_client_buffer_vmap()
  drm/gem-vram: Do not set pin and unpin callbacks
  drm/gem-vram: Un-export pin helpers
  drm/gem: Inline drm_gem_pin() into PRIME helpers

 drivers/gpu/drm/drm_client.c          | 22 ++------
 drivers/gpu/drm/drm_gem.c             | 32 -----------
 drivers/gpu/drm/drm_gem_vram_helper.c | 79 +--------------------------
 drivers/gpu/drm/drm_internal.h        |  4 --
 drivers/gpu/drm/drm_prime.c           | 22 +++++++-
 include/drm/drm_gem.h                 |  3 +-
 include/drm/drm_gem_vram_helper.h     |  2 -
 7 files changed, 29 insertions(+), 135 deletions(-)

-- 
2.49.0

