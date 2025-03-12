Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3F4A5E85C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A510E1C7;
	Wed, 12 Mar 2025 23:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OdIDQoRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4B910E0F6;
 Wed, 12 Mar 2025 23:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UG0QUj+/F5+iHlDvlkjoHha5ViuzaUsXPRlMDLy6Qkw=; b=OdIDQoRSsOqSy4znaL05QmSl2O
 QQ7KC4wBUQwDjcxCFYy21XDHI37n0mJfWY26iRAEui1v7We8u52titD8Y7Zg3H7a6Eq72UNq9iDsq
 OfZb87WI6lbghBG+Lrqf6mN4U4G+m43Bd4C5/SNxeul/7nRGult9mGiERHl/9/gcHBlg2zAZXc70g
 GCBnaCNVplQ4ozz700Fm6uj4P0YqnAO2Vb27K/pryqNeQTXuggd/kmotid0tvnpHYo7YKzfshRwCu
 WqDYnyt4rKfvhD7MkW4P+9BPtdgcbLT4b3iJQPxlB857VDCxNwE1EqKZ1bWqaCOKDEJMwx1RT1sOQ
 b+vFXNkw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsVR8-007plu-Po; Thu, 13 Mar 2025 00:24:36 +0100
Date: Wed, 12 Mar 2025 23:24:35 +0000
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
Message-ID: <Z9IXs5CzHHKScuQn@linux>
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

Here comes the final pull request for 6.15.

Main thing is the bump of the reported mmap ioctl feature level, which
enables Mesa to reliably detect full partial mmap support. Then the DRM
client implementation gains vmap support and the remaining changes are just
some refactors and cleanups.

Regards,

Tvrtko

drm-intel-gt-next-2025-03-12:
UAPI Changes:

- Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps (José Roberto de Souza)

Driver Changes:

Fixes/improvements/new stuff:

- Implement vmap/vunmap GEM object functions (Asbjørn Sloth Tønnesen)

Miscellaneous:

- Various register definition cleanups (Ville Syrjälä)
- Fix typo in a comment [gt/uc] (Yuichiro Tsuji)
The following changes since commit 7ded94bd11d47a8ddef051aef1d1a42d8191e09f:

  drm/i915/gt: add wait on depth stall done bit handling (2025-02-18 12:37:04 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2025-03-12

for you to fetch changes up to bfef148f3680e6b9d28e7fca46d9520f80c5e50e:

  drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps (2025-03-11 07:04:51 -0700)

----------------------------------------------------------------
UAPI Changes:

- Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps (José Roberto de Souza)

Driver Changes:

Fixes/improvements/new stuff:

- Implement vmap/vunmap GEM object functions (Asbjørn Sloth Tønnesen)

Miscellaneous:

- Various register definition cleanups (Ville Syrjälä)
- Fix typo in a comment [gt/uc] (Yuichiro Tsuji)

----------------------------------------------------------------
Asbjørn Sloth Tønnesen (1):
      drm/i915: implement vmap/vunmap GEM object functions

José Roberto de Souza (1):
      drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps

Ville Syrjälä (12):
      drm/i915: Bump RING_FAULT engine ID bits
      drm/i915: Relocate RING_FAULT bits
      drm/i915: Use REG_BIT() & co. for ring fault registers
      drm/i915: Document which RING_FAULT bits apply to which platforms
      drm/i915: Introduce RING_FAULT_VADDR_MASK
      drm/i915: Extract gen8_report_fault()
      drm/i915: Use REG_BIT() & co. for CHV EU/slice fuse bits
      drm/i915: Reoder CHV EU/slice fuse bits
      drm/i915: Use REG_BIT() & co. for BDW+ EU/slice fuse bits
      drm/i915: Reoder BDW+ EU/slice fuse bits
      drm/i915: Use REG_BIT() & co. for gen9+ timestamp freq registers
      drm/i915: Reoder gen9+ timestamp freq register bits

Yuichiro Tsuji (1):
      drm/i915/gt/uc: Fix typo in a comment

 drivers/gpu/drm/i915/gem/i915_gem_mman.c          |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c        |  26 +++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                |  89 ++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c    |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c            |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h           | 136 ++++++++++------------
 drivers/gpu/drm/i915/gt/intel_sseu.c              |  56 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |   9 +-
 9 files changed, 166 insertions(+), 175 deletions(-)
