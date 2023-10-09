Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CEC7BE222
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6C10E267;
	Mon,  9 Oct 2023 14:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C0510E265
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D18D021889;
 Mon,  9 Oct 2023 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=py+i8YBfj6VM/YKfFhOOf0y/2OhBSanmXdXqlAVydBc=;
 b=AqZABEF2ysG8d8zcuppETEWCyAAR4rLv4xxL7XcGzYE3HGyUaQt+aV2Oe+z4lgxpA0npFH
 YBA2aJ7ir56IEvuaGuzM8g2ItukPp5lD1u5WSfeoIE1m0+gJOCXHG8XJSlyh1GUunAknWw
 YM8RCdZhW8SojK4xjn7sP14mza/rlvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=py+i8YBfj6VM/YKfFhOOf0y/2OhBSanmXdXqlAVydBc=;
 b=93QgChoJagl20twQJ+XINY2v51oIMI/m4u0jCb1UU3bjSf4vfcdi4GAqv5rY8EZtOPgBKM
 xmo3oByFog+AOVCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9779E13905;
 Mon,  9 Oct 2023 14:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SbgSJMwJJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 0/7] drm: Reuse temporary memory for format conversion
Date: Mon,  9 Oct 2023 16:06:29 +0200
Message-ID: <20231009141018.11291-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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

DRM's format-conversion helpers require temporary memory. Pass the
buffer from the caller to allow the caller to preallocate the buffer
memory.

The motivation for this patchset is the recent work on a DRM panic
handler. [1] The panic handler requires format conversion to display an
error to the screen. But allocating memory during a kernel panic is
fragile. The changes in this patchset enable the DRM panic handler to
preallocate buffer storage before the panic occurs.

Patch 1 adds struct drm_format_conv_state, a simple interface to pass
around the buffer storage. Patch 2 adds an instance of the struct to
the shadow-plane state. Patch 3 moves the buffer's memory management
from the format helpers into their callers within the DRM drivers. Most
of the affected drivers use the state instance stored in their shadow-
plane state. The shadow-plane code releases the buffer memory automatically.

Patches 4 to 7 update three drivers to pre-allocate the format-conversion
buffer in their plane's atomic_check function. The drivers thus detect OOM
errors before the display update begins.

Tested with simpledrm.

v5:
	* fix repaper patch (Noralf)
	* fix documentation (Javier, Noralf, kernel test robot)
v4:
	* rename struct to drm_format_conv_state (Javier)
	* replace ARRAY_SIZE() with sizeof() (Jani)
	* store buffer in shadow-plane state (Javier, Maxime)
	* prealloc in atomic_check in several drivers
v3:
	* no changes
v2:
	* reserve storage during probing in the drivers

[1] https://patchwork.freedesktop.org/series/122244/

Thomas Zimmermann (7):
  drm/format-helper: Cache buffers with struct drm_format_conv_state
  drm/atomic-helper: Add format-conversion state to shadow-plane state
  drm/format-helper: Pass format-conversion state to helpers
  drm/ofdrm: Preallocate format-conversion buffer in atomic_check
  drm/simpledrm: Preallocate format-conversion buffer in atomic_check
  drm/ssd130x: Fix atomic_check for disabled planes
  drm/ssd130x: Preallocate format-conversion buffer in atomic_check

 drivers/gpu/drm/drm_format_helper.c           | 215 +++++++++++++-----
 drivers/gpu/drm/drm_gem_atomic_helper.c       |   9 +
 drivers/gpu/drm/drm_mipi_dbi.c                |  19 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  30 ++-
 drivers/gpu/drm/solomon/ssd130x.c             |  36 ++-
 .../gpu/drm/tests/drm_format_helper_test.c    |  72 +++---
 drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
 drivers/gpu/drm/tiny/ili9225.c                |  10 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  16 +-
 drivers/gpu/drm/tiny/repaper.c                |  10 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  43 +++-
 drivers/gpu/drm/tiny/st7586.c                 |  19 +-
 include/drm/drm_format_helper.h               |  81 +++++--
 include/drm/drm_gem_atomic_helper.h           |  10 +
 include/drm/drm_mipi_dbi.h                    |   4 +-
 15 files changed, 433 insertions(+), 144 deletions(-)


base-commit: fe09b9f4c1435d9ce59b4729994b86a856db852f
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.42.0

