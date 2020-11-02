Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339012A3E8D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0216EC25;
	Tue,  3 Nov 2020 08:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDCB6E56A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 22:07:15 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] Add option to mmap GEM buffers cached, try 2
Date: Mon,  2 Nov 2020 22:06:46 +0000
Message-Id: <20201102220651.22069-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:24 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework of my previous patchset which added support for GEM buffers
backed by non-coherent memory to the ingenic-drm driver.

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

 drivers/gpu/drm/drm_gem_cma_helper.c      | 190 +++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  58 ++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
 drivers/gpu/drm/ingenic/ingenic-ipu.c     |  12 +-
 include/drm/drm_gem_cma_helper.h          |  13 ++
 5 files changed, 251 insertions(+), 26 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
