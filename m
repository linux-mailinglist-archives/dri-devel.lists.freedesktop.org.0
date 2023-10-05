Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482A47B9C05
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5813110E130;
	Thu,  5 Oct 2023 09:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAED210E12E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:05:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4DBE2185C;
 Thu,  5 Oct 2023 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696496726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ou3kdIeFToVcRv4iNdjLwdiN2Um5xKeZk6ZqufjokAs=;
 b=hl4NXN6Hd4J2EPjkDmuvdHglyriajBIkK2NaIOtvOF8K/8r5Bh8ZbEAlLUCaaqdOVua9Kl
 YNMFrAbIwHq0m0vGAs4PQBDYpnBbzTLb6P5oA5sfG7O9obZLR8a3DlaZwHUfdzBV5kVLRD
 YTsFiIkEXrfIM74LBvC3tB25HqqUz8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696496726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ou3kdIeFToVcRv4iNdjLwdiN2Um5xKeZk6ZqufjokAs=;
 b=KcvjOlznNRocuX/DRypCKoRMB/cfxcCH2fFvOWYJF9+Vwaw/rNmtwnxMa/Ed6aOKSj4Z3o
 jQXyU/XiZxKfHqCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AFE9139C2;
 Thu,  5 Oct 2023 09:05:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D3xFGVZ8HmXkcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 09:05:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
Date: Thu,  5 Oct 2023 11:04:20 +0200
Message-ID: <20231005090520.16511-1-tzimmermann@suse.de>
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
buffer from the caller and keep it allocated over several calls. Allow
the caller to preallocate the buffer memory.

The motivation for this patchset is the recent work on a DRM panic
handler. [1] The panic handler requires format conversion to display an
error to the screen. But allocating memory during kernel panics is
fragile. The changes in this patchset enable the DRM panic handler to
preallocate buffer storage before the panic occurs.

As an additonal benefit, drivers can now keep the temporary storage
across multiple updates. Avoiding memory allocation slightly reduces
the CPU overhead of the format helpers.

Patch 1 adds struct drm_format_conv_state, a simple interface to pass
around the buffer storage. Patch 2 adds an instance of the struct to
the shadow-plane state. Patch 3 moves the buffer's memory management
from the format helpers into their callers within the DRM drivers. Most
of the afected drivers use the state instance stored in their shadow-
plane state. The shadow-plane code releases the buffer memory automatically.

Patches 4 to 7 update three drivers to preallocate the format-conversion
buffer in their plane's atomic_check function. The driver thus detects OOM
errors before the display update begins.

Tested with simpledrm.

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

 drivers/gpu/drm/drm_format_helper.c           | 212 +++++++++++++-----
 drivers/gpu/drm/drm_gem_atomic_helper.c       |   9 +
 drivers/gpu/drm/drm_mipi_dbi.c                |  19 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  30 ++-
 drivers/gpu/drm/solomon/ssd130x.c             |  36 ++-
 .../gpu/drm/tests/drm_format_helper_test.c    |  72 +++---
 drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
 drivers/gpu/drm/tiny/ili9225.c                |  10 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |  16 +-
 drivers/gpu/drm/tiny/repaper.c                |   8 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  43 +++-
 drivers/gpu/drm/tiny/st7586.c                 |  19 +-
 include/drm/drm_format_helper.h               |  81 +++++--
 include/drm/drm_gem_atomic_helper.h           |  10 +
 include/drm/drm_mipi_dbi.h                    |   4 +-
 15 files changed, 428 insertions(+), 144 deletions(-)


base-commit: 57d3b83a83c5527325efb5bcaf594da09fe4a41b
-- 
2.42.0

