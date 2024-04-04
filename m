Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E4898AB3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 17:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48B112D4A;
	Thu,  4 Apr 2024 15:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dtWC7+Vc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4+CaTmJp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dtWC7+Vc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4+CaTmJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675910E655
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 15:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9918337C68;
 Thu,  4 Apr 2024 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712243340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yjSNRLTcWyNoBOw3nACyII2uvLI4AZCyBjTLqfvbdM8=;
 b=dtWC7+VcufSeRlPqOpMMU8vZrGFvq80tnGymHqWLP4nIH6NI+l2UaMCIgR/4psUMuk7xCm
 QX6UCTpNqfZCOkYdv8LW5KQpIewRMBLDuiQ24+d1hbFiR0ROhzL5PVg1T2RcUmbemOh6/+
 1IKDkbC3Tcde/uzwN0IfzBgEcAjtfdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712243340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yjSNRLTcWyNoBOw3nACyII2uvLI4AZCyBjTLqfvbdM8=;
 b=4+CaTmJprn8JkMenKNMP7rWPzmBgOJ0iWxOS+o84TtoN/zYW1TkWxEJeIUfBNoh6ConBji
 xq9SkRZaxONXqeBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712243340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yjSNRLTcWyNoBOw3nACyII2uvLI4AZCyBjTLqfvbdM8=;
 b=dtWC7+VcufSeRlPqOpMMU8vZrGFvq80tnGymHqWLP4nIH6NI+l2UaMCIgR/4psUMuk7xCm
 QX6UCTpNqfZCOkYdv8LW5KQpIewRMBLDuiQ24+d1hbFiR0ROhzL5PVg1T2RcUmbemOh6/+
 1IKDkbC3Tcde/uzwN0IfzBgEcAjtfdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712243340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yjSNRLTcWyNoBOw3nACyII2uvLI4AZCyBjTLqfvbdM8=;
 b=4+CaTmJprn8JkMenKNMP7rWPzmBgOJ0iWxOS+o84TtoN/zYW1TkWxEJeIUfBNoh6ConBji
 xq9SkRZaxONXqeBg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 665F0139E8;
 Thu,  4 Apr 2024 15:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id h/mTF4zCDmZ2FgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Apr 2024 15:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, airlied@redhat.com,
 sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/udl: Convert to struct drm_edid
Date: Thu,  4 Apr 2024 17:03:17 +0200
Message-ID: <20240404150857.5520-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.17 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-0.03)[57.22%]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.17
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

Patches 1 and 2 add a custom EDID probe function similar to the
existing drm_probe_ddc(). The seconds patch is necessary to make
it useful for udl.

Patch 3 fixes a bug.

Patches 4 to 6 convert the current EDID handling to struct drm_edid
and its helpers. Patch 6 also separates the helpers for .get_modes()
and .detect_ctx() from each other.

Patch 7 removes the obsolete struct udl_connector.

Thomas Zimmermann (7):
  drm/edid: Implement drm_probe_ddc() with drm_edid_probe_custom()
  drm/edid: Test for EDID header in drm_edit_probe_custom()
  drm/udl: Remove DRM_CONNECTOR_POLL_HPD
  drm/udl: Move drm_dev_{enter,exit}() into udl_get_edid_block()
  drm/udl: Clean up Makefile
  drm/udl: Untangle .get_modes() and .detect_ctx()
  drm/udl: Remove struct udl_connector

 drivers/gpu/drm/drm_edid.c        |  62 +++++++++++---
 drivers/gpu/drm/udl/Makefile      |   8 +-
 drivers/gpu/drm/udl/udl_drv.h     |  12 +--
 drivers/gpu/drm/udl/udl_edid.c    |  67 +++++++++++++++
 drivers/gpu/drm/udl/udl_edid.h    |  15 ++++
 drivers/gpu/drm/udl/udl_modeset.c | 136 ++++++------------------------
 include/drm/drm_edid.h            |   3 +
 7 files changed, 173 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/udl/udl_edid.c
 create mode 100644 drivers/gpu/drm/udl/udl_edid.h

-- 
2.44.0

