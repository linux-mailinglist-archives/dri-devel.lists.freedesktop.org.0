Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E038DC05
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 19:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9589DB5;
	Sun, 23 May 2021 17:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4370789DB5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 17:04:30 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 0/3] Add option to mmap GEM buffers cached
Date: Sun, 23 May 2021 18:04:12 +0100
Message-Id: <20210523170415.90410-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V5 of my patchset which adds the option for having GEM buffers backed by
non-coherent memory.

Changes from V4:

- [2/3]: 
    - Rename to drm_fb_cma_sync_non_coherent
    - Invert loops for better cache locality
    - Only sync BOs that have the non-coherent flag
    - Properly sort includes
    - Move to drm_fb_cma_helper.c to avoid circular dependency

- [3/3]:
    - Fix drm_atomic_get_new_plane_state() used to retrieve the old
      state
    - Use custom drm_gem_fb_create()
    - Only check damage clips and sync DMA buffers if non-coherent
      buffers are used

Cheers,
-Paul

Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_fb_cma_sync_non_coherent
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_fb_cma_helper.c       | 46 ++++++++++++++++++
 drivers/gpu/drm/drm_gem_cma_helper.c      | 38 +++++++++++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59 +++++++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
 include/drm/drm_fb_cma_helper.h           |  4 ++
 include/drm/drm_gem_cma_helper.h          |  3 ++
 7 files changed, 156 insertions(+), 16 deletions(-)

-- 
2.30.2

