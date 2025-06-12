Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B372AD6A11
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E7910E063;
	Thu, 12 Jun 2025 08:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J5fvHzny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2294110E063
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749716054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kefk+0N0LQM5ub7YS4EGq9meLfOXnPVkh2ZvsWPlkfE=;
 b=J5fvHzny0r7OdxTTQRZfWoq0y6ILQ7p3sZrDEmpzIuVaRRk5ILJSEai6RfpSSG/wZ1MnaH
 p/8ptO6X2eXF/lZq+ZjyvPAqvd90SAWyYqIOHbAqW2QqdqxCi9Qor6VpDPAh7+4PG2YaL9
 GVutNGC4ym24qePbHH5aLPpckumfWro=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-OkC26ATwNmKPaZKZas3vWA-1; Thu,
 12 Jun 2025 04:14:10 -0400
X-MC-Unique: OkC26ATwNmKPaZKZas3vWA-1
X-Mimecast-MFC-AGG-ID: OkC26ATwNmKPaZKZas3vWA_1749716048
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2E45D195608D; Thu, 12 Jun 2025 08:14:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.28])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A619319560A3; Thu, 12 Jun 2025 08:14:01 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 0/9] drm/i915: Add drm_panic support
Date: Thu, 12 Jun 2025 10:00:57 +0200
Message-ID: <20250612081344.225200-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds drm_panic support for i915 and xe driver.

I've tested it on the 4 intel laptops I have at my disposal.
 * Haswell with 128MB of eDRAM.
 * Comet Lake  i7-10850H
 * Raptor Lake i7-1370P (with DPT, and Y-tiling).
 * Lunar Lake Ultra 5 228V (with DPT, and 4-tiling, and using the Xe driver.

I tested panic in both fbdev console and gnome desktop.
I think it won't work yet on discrete GPU, but that can be added later.

Best regards,

v2:
 * Add the proper abstractions to build also for Xe.
 * Fix dim checkpatch issues.

v3:
 * Add support for Y-tiled framebuffer when DPT is enabled.

v4:
 * Add support for Xe driver, which shares most of the code.
 * Add support for 4-tiled framebuffer found in newest GPU.

v5:
 * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
 * Use struct intel_display instead of drm_i915_private.
 * Use iosys_map for intel_bo_panic_map().

v6:
 * Rebase on top of git@gitlab.freedesktop.org:drm/i915/kernel.git drm-intel-next
 * Use struct intel_display instead of drm_i915_private for intel_atomic_plane.c

v7:
 * Fix mismatch {} in intel_panic_flush() (Jani Nikula)
 * Return int for i915_gem_object_panic_map() (Ville Syrjälä)
 * Reword commit message about alignment/size when disabling tiling (Ville Syrjälä)

v8:
 * Use kmap_try_from_panic() instead of vmap, to access the framebuffer.
 * Add ttm_bo_kmap_try_from_panic() for the xe driver, that uses ttm.
 * Replace intel_bo_panic_map() with a setup() and finish() function,
   to allow mapping only one page of teh framebuffer at a time.
 * Configure psr to send the full framebuffer update.

v9:
 * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
   from the panic handler (Christian König)
 * Fix missing kfree() for i915_panic_pages in i915_gem_object_panic_finish()
   Also change i915_panic_pages allocation to kmalloc, as kvmalloc is not
   safe to call from the panic handler.
 * Fix dim checkpatch warnings.

Jocelyn Falempe (9):
  drm/i915/fbdev: Add intel_fbdev_get_map()
  drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
  drm/i915/display: Add a disable_tiling() for skl planes
  drm/ttm: Add ttm_bo_kmap_try_from_panic()
  drm/i915: Add intel_bo_panic_setup and intel_bo_panic_finish
  drm/i915/display: Add drm_panic support
  drm/i915/display: Add drm_panic support for Y-tiling with DPT
  drm/i915/display: Add drm_panic support for 4-tiling with DPT
  drm/i915/psr: Add intel_psr2_panic_force_full_update

 drivers/gpu/drm/i915/display/i9xx_plane.c     |  23 +++
 .../gpu/drm/i915/display/intel_atomic_plane.c | 169 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bo.c       |  12 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |   4 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   5 +
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   2 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  20 +++
 drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
 .../drm/i915/display/skl_universal_plane.c    |  27 +++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 112 ++++++++++++
 drivers/gpu/drm/i915/i915_vma.h               |   5 +
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  27 +++
 drivers/gpu/drm/xe/display/intel_bo.c         |  62 +++++++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +
 include/drm/ttm/ttm_bo.h                      |   1 +
 19 files changed, 492 insertions(+), 2 deletions(-)


base-commit: 7247efca0dcbc8ac6147db9200ed1549c0662465
-- 
2.49.0

