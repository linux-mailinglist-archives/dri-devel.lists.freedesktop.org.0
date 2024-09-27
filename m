Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB5698874E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75F10ECA3;
	Fri, 27 Sep 2024 14:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="O/RqoMvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FP4CdQvD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O/RqoMvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FP4CdQvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070010ECA3;
 Fri, 27 Sep 2024 14:42:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08C311FB3A;
 Fri, 27 Sep 2024 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEZ2ZzzUnvKMR3bCVJnFIL/xC/BQINSnPKrcufeHb1I=;
 b=O/RqoMvDIXYKiLRjOpeWr2EeF8SnBin6KfkotIUf8fmfSChiWGL6hKEC20Gu+BkGJiS6F6
 C7CpJjiM1hVVUOnlrV270l/aXtDwy3RxFeC4ySAxizHdr40C5npPjrHCT6yytAd/ry6Ymh
 lkhxd2XfFTIiwBPxvlmcXLtTmvtrhak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEZ2ZzzUnvKMR3bCVJnFIL/xC/BQINSnPKrcufeHb1I=;
 b=FP4CdQvD6V6R6rThGpsGplNzLeLB7tEXz2VyzbPERQpTLmwnbC55JKwxHT4FDaqO6dCP+t
 0zNfRyy+UTQc+rCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEZ2ZzzUnvKMR3bCVJnFIL/xC/BQINSnPKrcufeHb1I=;
 b=O/RqoMvDIXYKiLRjOpeWr2EeF8SnBin6KfkotIUf8fmfSChiWGL6hKEC20Gu+BkGJiS6F6
 C7CpJjiM1hVVUOnlrV270l/aXtDwy3RxFeC4ySAxizHdr40C5npPjrHCT6yytAd/ry6Ymh
 lkhxd2XfFTIiwBPxvlmcXLtTmvtrhak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OEZ2ZzzUnvKMR3bCVJnFIL/xC/BQINSnPKrcufeHb1I=;
 b=FP4CdQvD6V6R6rThGpsGplNzLeLB7tEXz2VyzbPERQpTLmwnbC55JKwxHT4FDaqO6dCP+t
 0zNfRyy+UTQc+rCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE6A21386E;
 Fri, 27 Sep 2024 14:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qV44LW/E9mYFKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:42:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm: Introduce DRM client library
Date: Fri, 27 Sep 2024 16:37:25 +0200
Message-ID: <20240927144252.31813-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

With the next DRM client coming soon (drm_log) and most of DRM's
fbdev emulation consolidated in a few places, it's time to provide
a single place for the clients.

The new module drm_client_lib.ko stores most of the common client
code. It's designed such that drivers can opt into client support,
but the presence of the client module depends on the user's kernel
configuration. Without selected clients, no client module will be
build.

Thomas Zimmermann (5):
  drm/i915: Select DRM_CLIENT_SELECTION
  drm/xe: Select DRM_CLIENT_SELECTION
  drm: Move client-device functions in to drm_client_dev.c
  drm: Select fbdev helpers for modules that require them
  drm: Add client-lib module

 Documentation/gpu/drm-client.rst   |   3 +
 drivers/gpu/drm/Kconfig            |  34 +++++--
 drivers/gpu/drm/Makefile           |  20 +++--
 drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
 drivers/gpu/drm/drm_client.c       | 122 +------------------------
 drivers/gpu/drm/drm_client_dev.c   | 138 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_dumb_buffers.c |   2 +
 drivers/gpu/drm/drm_file.c         |   2 +
 drivers/gpu/drm/drm_framebuffer.c  |   2 +
 drivers/gpu/drm/drm_gem.c          |   2 +
 drivers/gpu/drm/i915/Kconfig       |   1 +
 drivers/gpu/drm/xe/Kconfig         |   1 +
 12 files changed, 196 insertions(+), 132 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_dev.c

-- 
2.46.0

