Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B7C5E2D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 17:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779910EAC9;
	Fri, 14 Nov 2025 16:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GjXQU64P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B550910EAC7;
 Fri, 14 Nov 2025 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q7oRAcOcgteATiqqbfYyV4DVbpBrb7vdxWZrPENTc3w=; b=GjXQU64P8bnaekapB8qDWzF/bW
 2/C1hR4MWPJlIJIQRWYhBqA7gXRTSIB1RpgWgj5vGqi1XgDCYinmqYEuosiSXffk9vfduLkBt33cJ
 WbfCRxpBznrcKB8B9udJcmA+Bk3MbE50+8ICO/5zwFQZnor9PJrVD95dePBP76Mz0OO17S8xeFoDa
 0Li5sXkV6VcLPcZ+DATlnp6LZI0BHn71AxkeU0FddOH+BvmymVOeKdHN/gtpuXA1qKQOCTh/dwyKx
 u6SsQ3/MxQjhCC0aIrCF4mkfMhDMYvn19HeEywfVtSTXS3m1SXphViu82jd3r0dMIsbhHdWnRZEY9
 RsMNdUMg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vJwZ0-000WIs-LL; Fri, 14 Nov 2025 17:22:18 +0100
Date: Fri, 14 Nov 2025 16:22:16 +0000
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
Message-ID: <aRdXOAKlTVX_b0en@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Here goes the final drm-intel-gt-next pull request for 6.19. It contains
one locking fix for Cherryview/Broxton with VT-D enabled, one making use
of a more canonical driver API, and a couple of selftest cleanups.

Regards,

Tvrtko

drm-intel-gt-next-2025-11-14:
Driver Changes:

Fixes/improvements/new stuff:

- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD (Janusz Krzysztofik)
- Use standard API for seqcount read in TLB invalidation [gt] (Andi Shyti)

Miscellaneous:

- Wait longer for threads in migrate selftest on CHV/BXT+VTD (Janusz Krzysztofik)
- Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD (Janusz Krzysztofik)
The following changes since commit 2ada9cb1df3f5405a01d013b708b1b0914efccfe:

  drm/i915: Fix conversion between clock ticks and nanoseconds (2025-10-16 14:40:22 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-11-14

for you to fetch changes up to 3bcf7894a93e18bff802088a368c13d86a5987a0:

  drm/i915/gt: Use standard API for seqcount read in TLB invalidation (2025-10-31 10:58:05 +0100)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD (Janusz Krzysztofik)
- Use standard API for seqcount read in TLB invalidation [gt] (Andi Shyti)

Miscellaneous:

- Wait longer for threads in migrate selftest on CHV/BXT+VTD (Janusz Krzysztofik)
- Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD (Janusz Krzysztofik)

----------------------------------------------------------------
Andi Shyti (1):
      drm/i915/gt: Use standard API for seqcount read in TLB invalidation

Janusz Krzysztofik (3):
      drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
      drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
      drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

 drivers/gpu/drm/i915/gt/intel_tlb.h           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  9 ++++++++-
 drivers/gpu/drm/i915/i915_vma.c               | 16 ++++++++++++++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 ++++
 4 files changed, 27 insertions(+), 4 deletions(-)
