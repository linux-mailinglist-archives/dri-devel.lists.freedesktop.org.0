Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F655A0934
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 08:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CB6D84C9;
	Thu, 25 Aug 2022 06:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC47DD848C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 06:54:42 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915: Remove frontbuffer tracking from gem.
Date: Thu, 25 Aug 2022 08:46:59 +0200
Message-Id: <20220825064701.768595-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Frontbuffer tracking in gem is used in old drivers, but nowadays everyone
calls dirtyfb explicitly. Remove frontbuffer tracking from gem, and
isolate it to display only.

Maarten Lankhorst (2):
  drm/i915: Remove gem and overlay frontbuffer tracking
  drm/i915: Remove special frontbuffer type

 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 ++----------------
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  65 ++---------
 drivers/gpu/drm/i915/display/intel_overlay.c  |  14 ---
 .../drm/i915/display/intel_plane_initial.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 --
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 -----
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 ----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_drv.h               |   1 -
 drivers/gpu/drm/i915/i915_gem.c               |   8 --
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
 drivers/gpu/drm/i915/i915_vma.c               |  12 --
 21 files changed, 35 insertions(+), 274 deletions(-)

-- 
2.34.1

