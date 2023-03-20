Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104C6C169D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9810E00C;
	Mon, 20 Mar 2023 15:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA610E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A5641F88F;
 Mon, 20 Mar 2023 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/F3Uv+gDIJaQ28jjNA4mJ3c4Lr8XCJ5cTNG7r+OmCu0=;
 b=gbzEeQ5v14FqgVm1HEPPWosuLRuJSkL0wAelyZ+0LVzJefDQJMl/Wj0hPL+FRas8ZRiuWv
 k2ha10IOh4Ce0I3/ijDt2q7zEglcrj2j/fnDmG/VWG3UV0QoBS5pHFLxBqFGY3Rmsoc9gb
 zQlULcrVcMGgMJpARDgMHs70k8A4SI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/F3Uv+gDIJaQ28jjNA4mJ3c4Lr8XCJ5cTNG7r+OmCu0=;
 b=QisLF+tDZ9Skilm0JjkO5y3wOQ9h8e5opDbdLDzNxayB6pw4XnT4646MlQohtc4Ujq+7jn
 UneD23GV0HU9mJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDA513A00;
 Mon, 20 Mar 2023 15:07:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B+/hDcl2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 0/8] drm/fbdev-generic: Mandatory shadow buffering
Date: Mon, 20 Mar 2023 16:07:43 +0100
Message-Id: <20230320150751.20399-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After adding fbdev-dma and converting drivers, all users of
fbdev-generic require shadow buffering. Make it mandatory and
remove all other codepaths. This change greatly simplifies the
code for generic fbdev emulation. It will work with any driver
that supports GEM's vmap and vunmap.

The change further allows for a number of cleanups and fixes. The
flag prefer_shadow_fbdev is unused and to be removed. Probing in
fbdev-generic is now simple enough to roll back if it fails. Further
simplify the code for exporting the framebuffer's physical address.
Finally rename the symbols to follow other fbdev emulation.

v2:
	* handle screen_size in separate patches (Javier)

Thomas Zimmermann (8):
  drm/fbdev-generic: Always use shadow buffering
  drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
  drm/fb-helper: Export drm_fb_helper_release_info()
  drm/fb-helper: Support smem_len in deferred I/O
  drm/fbdev-generic: Set screen size to size of GEM buffer
  drm/fbdev-generic: Clean up after failed probing
  drm/fb-helper: Consolidate CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
  drm/fbdev-generic: Rename symbols

 drivers/gpu/drm/drm_fb_helper.c     |  63 ++++---
 drivers/gpu/drm/drm_fbdev_dma.c     |   9 +-
 drivers/gpu/drm/drm_fbdev_generic.c | 279 +++++++++-------------------
 drivers/gpu/drm/tiny/bochs.c        |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c |   1 -
 include/drm/drm_fb_helper.h         |  14 +-
 include/drm/drm_mode_config.h       |   7 -
 7 files changed, 130 insertions(+), 244 deletions(-)


base-commit: 3333280906872bb8c2dff02666c7a8e46f085b24
-- 
2.40.0

