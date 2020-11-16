Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B217D2B51D8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792989C1F;
	Mon, 16 Nov 2020 20:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D5889BC2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:04:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C13CAE39;
 Mon, 16 Nov 2020 20:04:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com
Subject: [PATCH 00/10] drm/fb-helper: Various fixes and cleanups
Date: Mon, 16 Nov 2020 21:04:27 +0100
Message-Id: <20201116200437.17977-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here's a number of fb-helper patches that have been piling up recently.

Patches 1 to 3 fix bugs that I spotted while going through the code.
Because of the way the fbdev code works, they have been avoided so far.

Patches 4 to 7 cleanup damage handling for fbdev's shadow buffer and
fix a few issues.

Specifically, the final patch adds locking to the code that flushes the
shadow framebuffer into BO memory. During the conversion of radeon to
generic fbdev, the question came up about interference with concurrent
modesets. If fbdev has the BO pinned in system memory for flushing while
the modeset wants to pin it to VRAM for scanout, the modeset would
most likely fail. We haven't seen that so far, but it's possible at
least. Acquiring modeset locks during the flush operation prevents
concurrent modesets from taking place.

The code has been tested with SHMEM and TTM BOs; with atomic and non-
atomic modesetting.

[1] https://patchwork.freedesktop.org/patch/400054/?series=83765&rev=1

Thomas Zimmermann (10):
  drm/fb-helper: Call dirty helper after writing to fbdev
  drm/fb-helper: Unmap client buffer during shutdown
  drm/client: Depend on GEM object kmap ref-counting
  drm/fb-helper: Rename dirty worker to damage worker
  drm/fb-helper: Return early in dirty worker
  drm/fb-helper: Separate shadow-buffer flushing and calling dirty
    callback
  drm/fb-helper: Move damage blit code and its setup into separate
    routine
  drm/fb-helper: Restore damage area upon errors
  drm/fb-helper: Copy dma-buf map before flushing shadow fb
  drm/fb-helper: Acquire modeset lock around shadow-buffer flushing

 drivers/gpu/drm/drm_client.c    |   4 -
 drivers/gpu/drm/drm_fb_helper.c | 177 ++++++++++++++++++++++----------
 include/drm/drm_fb_helper.h     |  14 +--
 3 files changed, 130 insertions(+), 65 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
