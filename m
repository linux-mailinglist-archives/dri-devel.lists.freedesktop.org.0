Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27FD381182
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABEF6F459;
	Fri, 14 May 2021 20:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC706F459
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:11:49 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/3] Add option to mmap GEM buffers cached
Date: Fri, 14 May 2021 21:11:35 +0100
Message-Id: <20210514201138.162230-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

oRework of my previous patchset which added support for GEM buffers
backed by non-coherent memory to the ingenic-drm driver.

Having GEM buffers backed by non-coherent memory is interesting in
the particular case where it is faster to render to a non-coherent
buffer then sync the data cache, than to render to a write-combine
buffer, and (by extension) much faster than using a shadow buffer.
This is true for instance on some Ingenic SoCs, where even simple
blits (e.g. memcpy) are about three times faster using this method.

For the record, a previous patchset was accepted for 5.10 then had
to be reverted, as it conflicted with some changes made to the DMA API.

The first two patches add support for cached GEM buffers in the DRM
core, the third patch adds support for this functionality in the
ingenic-drm driver for the JZ4770 SoC.

Cheers,
-Paul


Paul Cercueil (3):
  drm: Add support for GEM buffers backed by non-coherent memory
  drm: Add and export function drm_gem_cma_sync_data
  drm/ingenic: Add option to alloc cached GEM buffers

 drivers/gpu/drm/drm_gem_cma_helper.c      | 96 ++++++++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 ++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++-
 include/drm/drm_gem_cma_helper.h          | 12 ++-
 4 files changed, 171 insertions(+), 11 deletions(-)

-- 
2.30.2

