Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0E393915
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90486F4FF;
	Thu, 27 May 2021 23:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497716F4FF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:21:14 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/11] ingenic-drm cleanups and doublescan feature
Date: Fri, 28 May 2021 00:20:54 +0100
Message-Id: <20210527232104.152577-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here is a set of 11 patches for the ingenic-drm driver.

Patches 1-7 are mostly generic cleanups, which will grease up the way
for bigger changes to be introduced.

Patch 3 adds support for a private state structure, which is then used
to store state-specific information, which was previously stored in the
driver's private structure directly.

Patch 10 is the big one; it adds a double-scan feature emulated with DMA
descriptors. This trick makes it possible to support a handful of boards
which have strange panels with non-square pixels (320x480 4:3).

Patch 11 updates the driver to support one top-level bridge per encoder,
as it seems to be the norm now.

Cheers,
-Paul

Paul Cercueil (11):
  drm/ingenic: Remove dead code
  drm/ingenic: Simplify code by using hwdescs array
  drm/ingenic: Add support for private objects
  drm/ingenic: Move no_vblank to private state
  drm/ingenic: Move IPU scale settings to private state
  drm/ingenic: Set DMA descriptor chain register when starting CRTC
  drm/ingenic: Upload palette before frame
  drm/ingenic: Support custom GEM object
  drm/ingenic: Add ingenic_drm_gem_fb_destroy() function
  drm/ingenic: Add doublescan feature
  drm/ingenic: Attach bridge chain to encoders

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 414 ++++++++++++++++++----
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 127 ++++++-
 2 files changed, 458 insertions(+), 83 deletions(-)

-- 
2.30.2

