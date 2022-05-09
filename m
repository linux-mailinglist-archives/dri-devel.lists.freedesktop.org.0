Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85DD51F671
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D44710E12F;
	Mon,  9 May 2022 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A92C10E0D1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:16:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BB8091FA06;
 Mon,  9 May 2022 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652084164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jCsAt04STsqGEma53FRIT4pVidG4VWhiwmAHP6R/c2E=;
 b=NzB8WO9Jhy80ZQRtqCB6WyrMgAr22yxyPHE/L6au6TBuNZ2r2BgEbSJ3QUKIUXQICOBmFB
 kf+AMmGi/vP83/VDR92iXunR6gLyo8isO2zd0IDitqIhR1XLnntVVoAiK9SGlPW3xBUwjz
 eFQNfZerX5zZV8W2krRy0LUHMIUr++Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652084164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jCsAt04STsqGEma53FRIT4pVidG4VWhiwmAHP6R/c2E=;
 b=A3p2OsTXT/FUZnoXLqEdq2bRiI5nfbe4iDAVgGT0ciFhffhaIH05Jv2dHinMp+dkPJznIW
 fpzdDlvZqnXpdaDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E6A8132C0;
 Mon,  9 May 2022 08:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VEDRIcTNeGL5OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 08:16:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH 0/4] drm: Ignore non-existing color planes in helpers
Date: Mon,  9 May 2022 10:15:58 +0200
Message-Id: <20220509081602.474-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
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

Some DRM helpers assume that all potential color planes of a framebuffer
are available; even if the color format didn't specify them. Non-existing
planes are silently ignored. This behavior is inconsistent with other
helpers and apparently leads to subtle bugs with uninitialized GEM buffer
mappings. [1]

Change all affected code to look at the framebuffer format's number of
color planes and only process these planes. The update has been discussed
in [2] before.

Tested with GEM SHMEM helpers on simpledrm.

[1] https://lore.kernel.org/dri-devel/20210730183511.20080-1-tzimmermann@suse.de/T/#md0172b10bb588d8f20f4f456e304f08d2a4505f7
[2] https://lore.kernel.org/dri-devel/877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de/

Thomas Zimmermann (4):
  drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
  drm/gem: Ignore color planes that are unused by framebuffer format
  drm/gem-vram: Ignore planes that are unused by framebuffer format
  drm/gem: Warn on trying to use a non-existing framebuffer plane

 drivers/gpu/drm/drm_gem_atomic_helper.c      |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 103 +++++++++----------
 drivers/gpu/drm/drm_gem_vram_helper.c        |  36 ++++---
 include/drm/drm_gem_framebuffer_helper.h     |  10 +-
 4 files changed, 81 insertions(+), 74 deletions(-)


base-commit: b0b93865a24c910fcbfa6e6fa0955fae930a56d3
-- 
2.36.0

