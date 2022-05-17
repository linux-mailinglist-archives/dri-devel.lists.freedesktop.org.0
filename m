Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5486552A078
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972F710E06D;
	Tue, 17 May 2022 11:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9A10E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:33:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84CAE21D10;
 Tue, 17 May 2022 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652787208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zaRLafDvmI/p/YLtIJxXq476N0+FUHCcoiWfL0N8nPA=;
 b=IZUnLXGhjwtZKxDMrITiyFZbFCkqz6m7juOCghDfyuBK4F5qARH4ee0dK/sZO01KlKCkEX
 9h4xmJC5gzPp3oawH28+fE0QuWastDrGkgP8yq5YHBesCa50bswZZksyuOOtl1ntTzU3Ik
 Jc/E/rqgEDTo83wXB/smXj+MChdFJTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652787208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zaRLafDvmI/p/YLtIJxXq476N0+FUHCcoiWfL0N8nPA=;
 b=S291lPA+wokidy9y8OExmxSvDFNVBoaXrSsRN9HpjCTMRHuiTXGu3BS7VaaLXfjpvfQ0LG
 CjRQnXICwY/I0cAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 489E913AA2;
 Tue, 17 May 2022 11:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nTLMEAiIg2KqdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 11:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH v2 0/5] drm: Ignore non-existing color planes in helpers
Date: Tue, 17 May 2022 13:33:22 +0200
Message-Id: <20220517113327.26919-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

Some DRM helpers assume that all potential color planes of a framebuffer
are available; even if the color format didn't specify them. Non-existing
planes are silently ignored. This behavior is inconsistent with other
helpers and apparently leads to subtle bugs with uninitialized GEM buffer
mappings. [1]

Change all affected code to look at the framebuffer format's number of
color planes and only process these planes. The update has been discussed
in [2] before.

Tested with GEM SHMEM helpers on simpledrm and with GEM VRAM helpers on
ast.

v2:
	* refactor GEM VRAM code before fixing it (Javier)
	* print more error information in #1 (Javier)
	* commit-message fixes (Javier)

[1] https://lore.kernel.org/dri-devel/20210730183511.20080-1-tzimmermann@suse.de/T/#md0172b10bb588d8f20f4f456e304f08d2a4505f7
[2] https://lore.kernel.org/dri-devel/877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de/

Thomas Zimmermann (5):
  drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
  drm/gem: Ignore color planes that are unused by framebuffer format
  drm/gem-vram: Share code between GEM VRAM's _{prepare,cleanup}_fb()
  drm/gem-vram: Ignore planes that are unused by framebuffer format
  drm/gem: Warn on trying to use a non-existing framebuffer plane

 drivers/gpu/drm/drm_gem_atomic_helper.c      |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 104 +++++++++----------
 drivers/gpu/drm/drm_gem_vram_helper.c        |  54 ++++++----
 include/drm/drm_gem_framebuffer_helper.h     |  10 +-
 4 files changed, 92 insertions(+), 82 deletions(-)

-- 
2.36.1

