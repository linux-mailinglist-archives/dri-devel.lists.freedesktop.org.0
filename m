Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EF4640742
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3679610E6E8;
	Fri,  2 Dec 2022 12:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D836310E6E5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:56:47 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 125361F88C;
 Fri,  2 Dec 2022 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669985806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fAKthM6/5EMGleHV7ZW4XH97O3jNSq8hOzGKbprDnVY=;
 b=uQ4CfnZESqZnk+/xVIr6Co1YHFPpHq2DYc0ME+tyR0AiKITblkMSV5JK3eLOfdP++7l8dO
 aAseq0861R1UcXFtxuBiyjoGQwqreN3aME7U/i9vGa4X68KA/OnsfvqdSvYR3jzGTwcLUu
 j6SW4UnyC1wDQb2o8iYcSDjhz/42SKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669985806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fAKthM6/5EMGleHV7ZW4XH97O3jNSq8hOzGKbprDnVY=;
 b=T9xh/K46N7jP5bdidhb+2jB4S6cfEOAg8qAGYsoz5F0RQuBd8EgDbiS4DbAT61n2jimYUJ
 y7px3PIcYf5/XkAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CA37B133DE;
 Fri,  2 Dec 2022 12:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id rAmKMA32iWOhOwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Dec 2022 12:56:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH v2 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
Date: Fri,  2 Dec 2022 13:56:36 +0100
Message-Id: <20221202125644.7917-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
drivers vmap/vunmap GEM buffer memory during the atomic commit.
Shadow-plane helpers automate this process.

Patches 1 to 4 prepare the MIPI code for the change and simplify
the rest of the patchset.

Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
shadow-plane helpers. Most of the affected drivers call MIPI-DBI
helpers and get the update automatically. Only ili9225 and st7586
require changes to their source code.

Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
needed, but streamlines the driver code and make sense overall.

Testing is welcome, as I don't have any hardware to test these
changes myself.

v2:
	* fix vmap()/vaddr confusion (Noralf)
	* drop struct mipi_dbi_plane_state (Noralf)

Thomas Zimmermann (8):
  drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()
  drm/ili9225: Call MIPI DBI mode_valid helper
  drm/st7586: Call MIPI DBI mode_valid helper
  drm/mipi-dbi: Initialize default driver functions with macro
  drm/mipi-dbi: Prepare framebuffer copy operation in pipe-update
    helpers
  drm/mipi-dbi: Support shadow-plane state
  drm/mipi-dbi: Use shadow-plane mappings
  drm/mipi-dbi: Move drm_dev_{enter,exit}() out from fb_dirty functions

 drivers/gpu/drm/drm_gem_atomic_helper.c      |  31 +---
 drivers/gpu/drm/drm_mipi_dbi.c               | 144 ++++++++++++++-----
 drivers/gpu/drm/drm_simple_kms_helper.c      |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c |   6 +-
 drivers/gpu/drm/tiny/hx8357d.c               |   5 +-
 drivers/gpu/drm/tiny/ili9163.c               |   6 +-
 drivers/gpu/drm/tiny/ili9225.c               |  36 +++--
 drivers/gpu/drm/tiny/ili9341.c               |   5 +-
 drivers/gpu/drm/tiny/ili9486.c               |   5 +-
 drivers/gpu/drm/tiny/mi0283qt.c              |   5 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c        |   5 +-
 drivers/gpu/drm/tiny/st7586.c                |  39 +++--
 drivers/gpu/drm/tiny/st7735r.c               |   5 +-
 include/drm/drm_gem_atomic_helper.h          |   2 -
 include/drm/drm_mipi_dbi.h                   |  36 ++++-
 include/drm/drm_plane.h                      |   4 +-
 include/drm/drm_simple_kms_helper.h          |   4 +-
 17 files changed, 205 insertions(+), 135 deletions(-)


base-commit: ad232f8a0287b805a7a167eddad30fe33fbec9d5
-- 
2.38.1

