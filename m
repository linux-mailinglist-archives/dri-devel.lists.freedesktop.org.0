Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EBE89F1B7
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 14:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16DC112022;
	Wed, 10 Apr 2024 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="c31va0EB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1qvPvPO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c31va0EB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1qvPvPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A610E519
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 12:09:32 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79C0D350C0;
 Wed, 10 Apr 2024 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712750970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lRR4bFBNBJBkbus/oAEV35u3uBhhJWEvwaL6F7PNE7k=;
 b=c31va0EBKBqTUE9uXSBoXPmU0+N6+H7o9l7BqC6aoA9VGGsnUDH+8/sf6Rs+v9NkDigQeg
 ozC0aRvO0UZuFgeoxa68v9zGtE5/t0JNHcKQ4dq0IyI17JmiM9ff5l9oi2qIl/gjVDyrv0
 6evcBAQRyFEWBq6Z/BEJbdBzKORx3wU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712750970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lRR4bFBNBJBkbus/oAEV35u3uBhhJWEvwaL6F7PNE7k=;
 b=T1qvPvPORV2LXgVl5ROYIVUlDD9q6OstLmg7eU7L5q2zjafj7tzHCrezY2UOPRBnwfYbwU
 0qALlFkuEgkxwEDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712750970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lRR4bFBNBJBkbus/oAEV35u3uBhhJWEvwaL6F7PNE7k=;
 b=c31va0EBKBqTUE9uXSBoXPmU0+N6+H7o9l7BqC6aoA9VGGsnUDH+8/sf6Rs+v9NkDigQeg
 ozC0aRvO0UZuFgeoxa68v9zGtE5/t0JNHcKQ4dq0IyI17JmiM9ff5l9oi2qIl/gjVDyrv0
 6evcBAQRyFEWBq6Z/BEJbdBzKORx3wU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712750970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lRR4bFBNBJBkbus/oAEV35u3uBhhJWEvwaL6F7PNE7k=;
 b=T1qvPvPORV2LXgVl5ROYIVUlDD9q6OstLmg7eU7L5q2zjafj7tzHCrezY2UOPRBnwfYbwU
 0qALlFkuEgkxwEDw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 482E913A92;
 Wed, 10 Apr 2024 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YGITEHqBFmY8BQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/5] drm/udl: Convert to struct drm_edid
Date: Wed, 10 Apr 2024 14:07:49 +0200
Message-ID: <20240410120928.26487-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
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
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
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

Convert udl to use struct drm_edid and its helpers. Also clean up
a few things in the process.

Patch 1 fixes a bug.

Patches 2 to 4 convert the current EDID handling to struct drm_edid
and its helpers. Patch 4 also separates the helpers for .get_modes()
and .detect_ctx() from each other.

Patch 5 removes the obsolete struct udl_connector.

v2:
- drop the generic EDID probing (Jani)
- fixes

Thomas Zimmermann (5):
  drm/udl: Remove DRM_CONNECTOR_POLL_HPD
  drm/udl: Move drm_dev_{enter,exit}() into udl_get_edid_block()
  drm/udl: Clean up Makefile
  drm/udl: Untangle .get_modes() and .detect_ctx()
  drm/udl: Remove struct udl_connector

 drivers/gpu/drm/udl/Makefile      |   8 +-
 drivers/gpu/drm/udl/udl_drv.h     |  12 +--
 drivers/gpu/drm/udl/udl_edid.c    |  79 +++++++++++++++++
 drivers/gpu/drm/udl/udl_edid.h    |  15 ++++
 drivers/gpu/drm/udl/udl_modeset.c | 138 +++++++-----------------------
 5 files changed, 131 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/udl/udl_edid.c
 create mode 100644 drivers/gpu/drm/udl/udl_edid.h

-- 
2.44.0

