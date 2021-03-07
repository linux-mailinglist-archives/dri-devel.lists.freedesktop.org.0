Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4E330483
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 21:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626656E048;
	Sun,  7 Mar 2021 20:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373CB6E048
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 20:28:55 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/5] Add option to mmap GEM buffers cached
Date: Sun,  7 Mar 2021 20:28:30 +0000
Message-Id: <20210307202835.253907-1-paul@crapouillou.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework of my previous patchset which added support for GEM buffers
backed by non-coherent memory to the ingenic-drm driver.

Having GEM buffers backed by non-coherent memory is interesting in
the particular case where it is faster to render to a non-coherent
buffer then sync the data cache, than to render to a write-combine
buffer, and (by extension) much faster than using a shadow buffer.
This is true for instance on some Ingenic SoCs, where even simple
blits (e.g. memcpy) are about three times faster using this method.

For the record, the previous patchset was accepted for 5.10 then had
to be reverted, as it conflicted with some changes made to the DMA API.

This new patchset is pretty different as it adds the functionality to
the DRM core. The first three patches add variants to existing functions
but with the "non-coherent memory" twist, exported as GPL symbols. The
fourth patch adds a function to be used with the damage helpers.
Finally, the last patch adds support for non-coherent GEM buffers to the
ingenic-drm driver. The functionality is enabled through a module
parameter, and is disabled by default.

Cheers,
-Paul

Paul Cercueil (5):
  drm: Add and export function drm_gem_cma_create_noncoherent
  drm: Add and export function drm_gem_cma_dumb_create_noncoherent
  drm: Add and export function drm_gem_cma_mmap_noncoherent
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 223 +++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  49 ++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  14 +-
 include/drm/drm_gem_cma_helper.h          |  13 ++
 5 files changed, 273 insertions(+), 30 deletions(-)

-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
