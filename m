Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB67AF0CD7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F9510E309;
	Wed,  2 Jul 2025 07:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kJ3mPp/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDDC10E309;
 Wed,  2 Jul 2025 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8iyIlNgoH6KbyeSdt/LTGh+Zpu9lhh48r8BL+R86xp8=; b=kJ3mPp/IOV7QQCHsLo0ZSX0ZOg
 nqgHAxzV/uoLbNA1HK/zW/TckajE7I8lpr/7pTJ+gb1/0kz7gtb6DMUEhyJgmQ8yYV7+P/BRGKg34
 OmsaD3u7MGbbrH/XxtoYJGM6quJ9iv1PgAdGcLTTrYHJ/QPtB1i8xXrOvwsATlx9SilNhnC7I0w28
 XS1ImzUdNT7j7zpmnG27XxNbYKnKBPm3/5Cs0mQp41GNdRD2lNJHROqKRdjt+15RnTsCKrgMXnZwp
 cIbLanEU0RTA84WHinCxwmaofDgHiGLBduEuHvEv2XByxKBi77IzLJFM/xatitSznx14HKmzU2WPA
 nE7ZQdQA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWs8f-00BLgO-S2; Wed, 02 Jul 2025 09:44:17 +0200
Date: Wed, 2 Jul 2025 08:44:16 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <aGTjUBeOQFw26bRT@linux>
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

Here comes the first pull request for 6.17.

Headline feature is that Ville was able to move DG1 out of force probe.
Other than that mostly fixes in the GuC backend.

One cross-merge to fix the build.

Regards,

Tvrtko

drm-intel-gt-next-2025-07-02:
Driver Changes:

Fixes/improvements/new stuff:

- Avoid GuC scheduling stalls [guc] (Julia Filipchuk)
- Remove force_probe requirement for DG1 (Ville Syrjälä)
- Handle errors correctly to avoid losing GuC-2-Host messages [guc] (Jesus Narvaez)
- Avoid double wakeref put if GuC context deregister failed [guc] (Jesus Narvaez)
- Avoid timeline memory leak with signals and legacy platforms [ringbuf] (Janusz Krzysztofik)
- Fix MEI (discrete) interrupt handler on RT kernels [gsc] (Junxiao Chang)

Miscellaneous:

- Allow larger memory allocation [selftest] (Mikolaj Wasiak)
- Use provided dma_fence_is_chain (Tvrtko Ursulin)
- Fix build error with GCOV and AutoFDO enabled [pmu] (Tzung-Bi Shih)
- Fix build error some more (Arnd Bergmann)
- Reduce stack usage in igt_vma_pin1() (Arnd Bergmann)
- Move out engine related macros from i915_drv.h (Krzysztof Karas)
- Move GEM_QUIRK_PIN_SWIZZLED_PAGES to i915_gem.h (Krzysztof Karas)
The following changes since commit f8bb3ed3197966fb60bedcbdc126d2bd5bc0a77f:

  drm/nouveau/tegra: Fix error pointer vs NULL return in nvkm_device_tegra_resource_addr() (2025-05-24 14:36:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-07-02

for you to fetch changes up to dccf655f69002d496a527ba441b4f008aa5bebbf:

  drm/i915/gsc: mei interrupt top half should be in irq disabled context (2025-06-30 14:21:06 -0400)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Avoid GuC scheduling stalls [guc] (Julia Filipchuk)
- Remove force_probe requirement for DG1 (Ville Syrjälä)
- Handle errors correctly to avoid losing GuC-2-Host messages [guc] (Jesus Narvaez)
- Avoid double wakeref put if GuC context deregister failed [guc] (Jesus Narvaez)
- Avoid timeline memory leak with signals and legacy platforms [ringbuf] (Janusz Krzysztofik)
- Fix MEI (discrete) interrupt handler on RT kernels [gsc] (Junxiao Chang)

Miscellaneous:

- Allow larger memory allocation [selftest] (Mikolaj Wasiak)
- Use provided dma_fence_is_chain (Tvrtko Ursulin)
- Fix build error with GCOV and AutoFDO enabled [pmu] (Tzung-Bi Shih)
- Fix build error some more (Arnd Bergmann)
- Reduce stack usage in igt_vma_pin1() (Arnd Bergmann)
- Move out engine related macros from i915_drv.h (Krzysztof Karas)
- Move GEM_QUIRK_PIN_SWIZZLED_PAGES to i915_gem.h (Krzysztof Karas)

----------------------------------------------------------------
Arnd Bergmann (2):
      drm/i915: fix build error some more
      drm/i915: reduce stack usage in igt_vma_pin1()

Janusz Krzysztofik (1):
      drm/i915/gt: Fix timeline left held on VMA alloc error

Jesus Narvaez (2):
      drm/i915/guc: Check if expecting reply before decrementing outstanding_submission_g2h
      drm/i915/guc: Handle race condition where wakeref count drops below 0

Joonas Lahtinen (2):
      Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1"
      Merge drm/drm-next into drm-intel-gt-next

Julia Filipchuk (1):
      drm/i915/guc: Enable DUAL_QUEUE_WA for newer platforms

Junxiao Chang (1):
      drm/i915/gsc: mei interrupt top half should be in irq disabled context

Krzysztof Karas (2):
      drm/i915: Move out engine related macros from i915_drv.h
      drm/i915: move GEM_QUIRK_PIN_SWIZZLED_PAGES to i915_gem.h

Mikolaj Wasiak (1):
      drm/i915/selftest: allow larger memory allocation

Tvrtko Ursulin (1):
      drm/i915: Use provided dma_fence_is_chain

Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Ville Syrjälä (2):
      drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
      drm/i915/pci: Remove force_probe requirement for DG1

 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  7 +----
 drivers/gpu/drm/i915/gt/intel_engine.h             | 31 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gsc.c                |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c    |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  7 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 19 ++++++++++---
 drivers/gpu/drm/i915/i915_drv.h                    | 33 ----------------------
 drivers/gpu/drm/i915/i915_gem.h                    |  2 ++
 drivers/gpu/drm/i915/i915_pci.c                    |  1 -
 drivers/gpu/drm/i915/i915_pmu.c                    |  6 ++--
 drivers/gpu/drm/i915/i915_vma.c                    | 20 +++++++++++++
 drivers/gpu/drm/i915/i915_vma.h                    | 22 ++-------------
 .../gpu/drm/i915/selftests/intel_memory_region.c   | 14 ++-------
 13 files changed, 86 insertions(+), 81 deletions(-)
