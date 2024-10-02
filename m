Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1C98D41A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8BB10E726;
	Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IsMlp0nm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+bzN0zDB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dAfY9iKn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="waox0t2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FEC10E71E;
 Wed,  2 Oct 2024 13:13:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C52961FD59;
 Wed,  2 Oct 2024 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z/qF9GxeJmhwfpaxOfOSDbmdc8lDgu3SL5w92kMNpMU=;
 b=IsMlp0nmqL2Ev1D7vNO/nh59l2xxhNMu9RhEuEXrb8yFQlIUmTjLIcDfzy387HOrOSM/xT
 1V5Gc99yXknELib4W4I5qc14MFdOeVABf425cTE6UfTU/euiK8f/92o189GfKWdvFd6FPy
 oPVlL78eNcohH8+DXzNeQfZdEX1bkGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874791;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z/qF9GxeJmhwfpaxOfOSDbmdc8lDgu3SL5w92kMNpMU=;
 b=+bzN0zDBZuCd0Ro0t5YKOSwmVUbLxqB9Gdz7EjSYqhJYTu6flahNKgeho7To6Nn08tUIEn
 0IeyAzx37pvV/fBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dAfY9iKn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=waox0t2T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z/qF9GxeJmhwfpaxOfOSDbmdc8lDgu3SL5w92kMNpMU=;
 b=dAfY9iKnctST2BfCsf0MHi9/8zVnTln+l7dre4hYaVonFx26M/DH1+3rTKihIQrQ7OXLIf
 YREF9nYlga7ZEgDVGAMQESE+LkrA5Zc7kgCdCenUsFouj5OE0hsm+rv+MHWVodytzIWq3e
 DM59WtPuQjOSvBf8DhCVVy7FeVX/tm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874790;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z/qF9GxeJmhwfpaxOfOSDbmdc8lDgu3SL5w92kMNpMU=;
 b=waox0t2TJQdx9oFzb4v2RPleglmX8CRhW7DJFD38K8WuMcMeDzGTevZonxlK39419jUShT
 qs48ivI99GPCEdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7ED8613A6E;
 Wed,  2 Oct 2024 13:13:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oOs4HeZG/Wa/GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 13:13:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/11] drm: Introduce DRM client library
Date: Wed,  2 Oct 2024 15:04:26 +0200
Message-ID: <20241002131306.288618-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C52961FD59
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

With the next DRM client coming soon (drm_log) and most of DRM's
fbdev emulation consolidated in a few places, it's time to provide
a single place for the clients.

The new module drm_client_lib.ko stores most of the in-kernel client
code. It is designed such that drivers can opt into client support,
but the presence of the client module depends on the user's kernel
configuration. Without selected clients, no client module will be
build.

Version 2 of this patchset is a significant rework of the patches,
so there are no R-bs kept. The base client code and client event
handling remains in the DRM core. This simplifies module dependencies.
But suspend and resume are now handled in client helpers instead of
direct calls to fbdev emulation. This breaks a cyclic dependency
among the involved modules. It also allows any client to process
suspend and resume events.

v2:
- rework of the overall design
- keep base client code in DRM core.

Thomas Zimmermann (11):
  drm/i915: Select DRM_CLIENT_SELECTION
  drm/xe: Select DRM_CLIENT_SELECTION
  drm/fbdev: Select fbdev I/O helpers from modules that require them
  drm/fbdev: Store fbdev module parameters in separate file
  drm/client: Move client event handlers to drm_client_event.c
  drm/client: Move suspend/resume into DRM client callbacks
  drm/amdgpu: Suspend and resume internal clients with client helpers
  drm/nouveau: Suspend and resume clients with client helpers
  drm/radeon: Suspend and resume clients with client helpers
  drm/client: Make client support optional
  drm/client: Add client-lib module

 Documentation/gpu/drm-client.rst              |   3 +
 drivers/gpu/drm/Kconfig                       |  39 +++-
 drivers/gpu/drm/Makefile                      |  20 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  22 +-
 drivers/gpu/drm/drm_client.c                  | 121 -----------
 drivers/gpu/drm/drm_client_event.c            | 195 ++++++++++++++++++
 drivers/gpu/drm/drm_client_setup.c            |   3 +
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_fb_helper.c               |  31 ---
 drivers/gpu/drm/drm_fbdev_client.c            |  30 ++-
 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/drm_internal.h                |   7 +
 drivers/gpu/drm/drm_kms_helper_common.c       |  38 ++++
 drivers/gpu/drm/drm_modeset_helper.c          |  14 +-
 drivers/gpu/drm/drm_probe_helper.c            |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 .../drm/i915/display/intel_display_driver.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   8 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  19 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |   6 -
 drivers/gpu/drm/radeon/radeon_mode.h          |   3 -
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 include/drm/drm_client.h                      |  39 +++-
 include/drm/drm_client_event.h                |  27 +++
 26 files changed, 423 insertions(+), 215 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_event.c
 create mode 100644 include/drm/drm_client_event.h

-- 
2.46.0

