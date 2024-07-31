Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD3942E2D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8278010E5DE;
	Wed, 31 Jul 2024 12:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Okph50EC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C7VbdpuF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Okph50EC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C7VbdpuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857110E32A;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3468F21A9D;
 Wed, 31 Jul 2024 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iv/v3rDFX5Y6K5N1mVa64k/6WJC6JWbEPNQkYIZsFeI=;
 b=Okph50ECxiItZRyo7tcqBRAG9DHmj1pOvZFwQ18Dx0ENSVxIGeH/dn4LPbwRGnO/504Oy/
 zFENs/W9//Dlm03al3TO17f/d1QnedaaegRSKE/yBOgaWllP71gc3fFMlE5OwrGFtogIXX
 emcwtxiqrZgxMl3wIJmzOW2PxUhocew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iv/v3rDFX5Y6K5N1mVa64k/6WJC6JWbEPNQkYIZsFeI=;
 b=C7VbdpuFdne24sfayl0IX1m2GjfOM15O0asJZxZgtxaAwZZ4scIRSogWTC2ryXp6qvnXtO
 phGngi5UBVK06jBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Okph50EC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C7VbdpuF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iv/v3rDFX5Y6K5N1mVa64k/6WJC6JWbEPNQkYIZsFeI=;
 b=Okph50ECxiItZRyo7tcqBRAG9DHmj1pOvZFwQ18Dx0ENSVxIGeH/dn4LPbwRGnO/504Oy/
 zFENs/W9//Dlm03al3TO17f/d1QnedaaegRSKE/yBOgaWllP71gc3fFMlE5OwrGFtogIXX
 emcwtxiqrZgxMl3wIJmzOW2PxUhocew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iv/v3rDFX5Y6K5N1mVa64k/6WJC6JWbEPNQkYIZsFeI=;
 b=C7VbdpuFdne24sfayl0IX1m2GjfOM15O0asJZxZgtxaAwZZ4scIRSogWTC2ryXp6qvnXtO
 phGngi5UBVK06jBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DDD0813297;
 Wed, 31 Jul 2024 12:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id naXbNLQsqmacTQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:23:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm: Use backlight power constants
Date: Wed, 31 Jul 2024 14:17:12 +0200
Message-ID: <20240731122311.1143153-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.31 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.31
X-Rspamd-Queue-Id: 3468F21A9D
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

Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
power states") introduced dedicated constants for backlight power states.
Convert DRM drivers to the new constants.

Some of the DRM panel drivers use BACKLIGHT_POWER_REDUCED, which is
deprecated. The drivers should later be converted to BACKLIGHT_POWER_ON
and BACKLIGHT_POWER_OFF.

The new constants replace the fbdev constants. This is part of a larger
effort to make kernel subsystems more independent from fbdev code and
headers.

Thomas Zimmermann (9):
  drm/amdgpu: Use backlight power constants
  drm/i915: Use backlight power constants
  drm/panel: panel-novatak-nt35510: Use backlight power constants
  drm/panel: panel-orisetech-otm8009a: Use backlight power constants
  drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
  drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
  drm/panel: panel-sony-acx565akm: Use backlight power constants
  drm/radeon: Use backlight power constants
  drm/tilcdc: Use backlight power constants

 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_backlight.c   | 12 ++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c    |  2 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c |  4 ++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 10 +++++-----
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 10 +++++-----
 drivers/gpu/drm/panel/panel-sony-acx565akm.c     |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c  |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c            |  2 +-
 10 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.45.2

