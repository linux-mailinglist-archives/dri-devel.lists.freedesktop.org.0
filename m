Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1F905311
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1439010E16F;
	Wed, 12 Jun 2024 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CcWQ1xLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C61D10E079;
 Wed, 12 Jun 2024 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/f17xm0OB0dxnf/jfYAL0tFlrsv0miSg/LIWwpYdXLI=; b=CcWQ1xLOEQbeGg4tLlXmjq4B1f
 TbbI7V2/p3KwjLZvvJZzv85vn3DjY6bzhZWaPOJzNOjCpBZlc2vnIq+tQbEOprnKakS4HVmZaSBUJ
 AzNCYWV31rKkis/y4zTrEDzgwTKB4IXum5c7GcWZ7jLNteiIVTRSn1O0o9zNudYh+qurlzLEepbQp
 moqryDHOEVSMNQhWyty8PdmUgCvqh3lPf1paVkVdY5JsWhK0Bm6Hb5xRxozDBVRxdzjT56UaCwbjy
 0i9QJJlUaqMEEnpzDQpDbl0EWHX9Sg5MkkL1fsMu6ixIib1RU204DI6w7U9MDS/PTv0O6gC+DnDiP
 6jTy9DZA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sHNXH-002Ja7-VV; Wed, 12 Jun 2024 14:57:08 +0200
Date: Wed, 12 Jun 2024 12:57:06 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Zmmazub+U9ewH9ts@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Sima,

Here is the main pull request for drm-intel-gt-next targeting 6.11.

First is the new userspace API for allowing upload of custom context
state used for replaying GPU hang error state captures. This will be
used by Mesa (see
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27594) for
debugging GPU hangs captured in the wild on real hardware. So far that
was only possible under simulation and that via some hacks. Also,
simulation in general has certain limitations to what hangs it can
reproduce. As the UAPI it is intended for Mesa developers only, it is
hidden behind a kconfig and runtime enablement switches.

Then there are fixes for hangs on Meteorlake due incorrect reduced CCS
configuration and a missing video engine workaround. Then fixes for a
couple race conditions in multi GT and breadcrumb handling, and a more
robust functional level reset by extending the timeout used.

A couple tiny cleanups here and there and finally one back-merge which
was required to land some display code base refactoring.

Regards,

Tvrtko

drm-intel-gt-next-2024-06-12:
UAPI Changes:

- Support replaying GPU hangs with captured context image (Tvrtko Ursulin)

Driver Changes:

Fixes/improvements/new stuff:

- Automate CCS Mode setting during engine resets [gt] (Andi Shyti)
- Revert "drm/i915: Remove extra multi-gt pm-references" (Janusz Krzysztofik)
- Fix HAS_REGION() usage in intel_gt_probe_lmem() (Ville Syrjälä)
- Disarm breadcrumbs if engines are already idle [gt] (Chris Wilson)
- Shadow default engine context image in the context (Tvrtko Ursulin)
- Support replaying GPU hangs with captured context image (Tvrtko Ursulin)
- avoid FIELD_PREP warning [guc] (Arnd Bergmann)
- Fix CCS id's calculation for CCS mode setting [gt] (Andi Shyti)
- Increase FLR timeout from 3s to 9s (Andi Shyti)
- Update workaround 14018575942 [mtl] (Angus Chen)

Future platform enablement:

- Enable w/a 16021333562 for DG2, MTL and ARL [guc] (John Harrison)

Miscellaneous:

- Pass the region ID rather than a bitmask to HAS_REGION() (Ville Syrjälä)
- Remove counter productive REGION_* wrappers (Ville Syrjälä)
- Fix typo [gem/i915_gem_ttm_move] (Deming Wang)
- Delete the live_hearbeat_fast selftest [gt] (Krzysztof Niemiec)
The following changes since commit 431c590c3ab0469dfedad3a832fe73556396ee52:

  drm/tests: Add a unit test for range bias allocation (2024-05-16 12:50:14 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-06-12

for you to fetch changes up to 79655e867ad6dfde2734c67c7704c0dd5bf1e777:

  drm/i915/mtl: Update workaround 14018575942 (2024-06-11 16:06:20 +0200)

----------------------------------------------------------------
UAPI Changes:

- Support replaying GPU hangs with captured context image (Tvrtko Ursulin)

Driver Changes:

Fixes/improvements/new stuff:

- Automate CCS Mode setting during engine resets [gt] (Andi Shyti)
- Revert "drm/i915: Remove extra multi-gt pm-references" (Janusz Krzysztofik)
- Fix HAS_REGION() usage in intel_gt_probe_lmem() (Ville Syrjälä)
- Disarm breadcrumbs if engines are already idle [gt] (Chris Wilson)
- Shadow default engine context image in the context (Tvrtko Ursulin)
- Support replaying GPU hangs with captured context image (Tvrtko Ursulin)
- avoid FIELD_PREP warning [guc] (Arnd Bergmann)
- Fix CCS id's calculation for CCS mode setting [gt] (Andi Shyti)
- Increase FLR timeout from 3s to 9s (Andi Shyti)
- Update workaround 14018575942 [mtl] (Angus Chen)

Future platform enablement:

- Enable w/a 16021333562 for DG2, MTL and ARL [guc] (John Harrison)

Miscellaneous:

- Pass the region ID rather than a bitmask to HAS_REGION() (Ville Syrjälä)
- Remove counter productive REGION_* wrappers (Ville Syrjälä)
- Fix typo [gem/i915_gem_ttm_move] (Deming Wang)
- Delete the live_hearbeat_fast selftest [gt] (Krzysztof Niemiec)

----------------------------------------------------------------
Andi Shyti (3):
      drm/i915/gt: Automate CCS Mode setting during engine resets
      drm/i915/gt: Fix CCS id's calculation for CCS mode setting
      drm/i915: Increase FLR timeout from 3s to 9s

Angus Chen (1):
      drm/i915/mtl: Update workaround 14018575942

Arnd Bergmann (1):
      drm/i915/guc: avoid FIELD_PREP warning

Chris Wilson (1):
      drm/i915/gt: Disarm breadcrumbs if engines are already idle

Deming Wang (1):
      drm/i915/gem/i915_gem_ttm_move: Fix typo

Janusz Krzysztofik (1):
      Revert "drm/i915: Remove extra multi-gt pm-references"

John Harrison (1):
      drm/i915/guc: Enable w/a 16021333562 for DG2, MTL and ARL

Niemiec, Krzysztof (1):
      drm/i915/gt: Delete the live_hearbeat_fast selftest

Tvrtko Ursulin (3):
      Merge drm/drm-next into drm-intel-gt-next
      drm/i915: Shadow default engine context image in the context
      drm/i915: Support replaying GPU hangs with captured context image

Ville Syrjälä (3):
      drm/i915: Fix HAS_REGION() usage in intel_gt_probe_lmem()
      drm/i915: Pass the region ID rather than a bitmask to HAS_REGION()
      drm/i915: Remove counter productive REGION_* wrappers

 drivers/gpu/drm/i915/Kconfig.debug                 |  17 ++++
 drivers/gpu/drm/i915/gem/i915_gem_context.c        | 113 +++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  18 ++++
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   2 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  15 ++-
 drivers/gpu/drm/i915/gt/intel_context.c            |   2 +
 drivers/gpu/drm/i915/gt/intel_context.h            |  22 ++++
 drivers/gpu/drm/i915/gt/intel_context_types.h      |   3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |   6 ++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c        |   8 +-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h           |   8 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                |   8 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |   8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  12 ++-
 .../gpu/drm/i915/gt/selftest_engine_heartbeat.c    | 110 --------------------
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h      |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c         |  32 +++---
 drivers/gpu/drm/i915/i915_drv.h                    |   4 +-
 drivers/gpu/drm/i915/i915_params.c                 |   5 +
 drivers/gpu/drm/i915/i915_params.h                 |   3 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   6 +-
 drivers/gpu/drm/i915/intel_memory_region.c         |   2 +-
 drivers/gpu/drm/i915/intel_memory_region.h         |   5 -
 drivers/gpu/drm/i915/intel_uncore.c                |   9 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c   |   2 +-
 include/uapi/drm/i915_drm.h                        |  27 +++++
 27 files changed, 296 insertions(+), 160 deletions(-)
