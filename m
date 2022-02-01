Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BE4A63AE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 19:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD07989FFD;
	Tue,  1 Feb 2022 18:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FA510E121;
 Tue,  1 Feb 2022 18:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 3F17A1F42EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643739879;
 bh=4+hKWA4YAKUXsom/hfKW6Q91eTaTH3kRu9F4yWOpXTY=;
 h=From:To:Cc:Subject:Date:From;
 b=aQcwRIya7H1pijCYK18fPgB9e/mOMMi8t3/PGRyyGbU9t5Cs42XLNWt30G2N7Dzj+
 QI6IuqLPQZMSc1pxVoKdTi7e3MGas2ZLKLFtK9qFned4TvS5jocko8zQsmavQBYv6g
 tmqXJAk2HVthnoxBMzkObwujaf24YiiFSa9gL7aFvmf1XVynQ66HniENlUBIvlGW6r
 bDwQGu3PnhiYphU+bYtOcnz/TMdO2yJ9tX4xxHq9vSQw+d7gGJw7Fjty12iics3MmA
 hUu21SFHRfpe5BCK2/VNDlaMdSvkx/XJWGQ0KWneh/awk30Pnj0rDLgYjl897xVm7i
 W5K5WpNoDE6fw==
From: Robert Beckett <bob.beckett@collabora.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/5] discrete card 64K page support
Date: Tue,  1 Feb 2022 18:24:16 +0000
Message-Id: <20220201182422.1548863-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series continues support for 64K pages for discrete cards.
It supersedes the 64K patches from https://patchwork.freedesktop.org/series/95686/#rev4
Changes since that series:

- set min alignment for DG2 to 2MB in i915_address_space_init
- replace coloring with simpler 2MB VA alignment for lmem buffers
        - enforce alignment to 2MB for lmem objects on DG2 in i915_vma_insert
        - expand vma reservation to round up to 2MB on DG2 in i915_vma_insert
- add alignment test

v2: rebase and fix for async vma that landed
v3:
	* fix uapi doc typos
	* add needs_compact_pt flag patch
	* cleanup vma expansion to use vm->min_alignment instead of hard coding
v4:
	* fix err return in igt_ppgtt_compact test
	* placate ci robot with explicit enum conversion in misaligned_pin
	* remove some blank lines
v5:
	* fix obj alignment requirements querying for internal buffers that
	  have no memory region associated. (fixes v3 bug)
v6:
	* use NEEDS_COMPACT_PT inead of hard coding in misalignment test
	* tiled_blits_create correctly pick largest required alignment
	* minor doc formatting
v7:
	* use i915_vma_unbind_unlocked in misalignment test

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Matthew Auld (3):
  drm/i915: enforce min GTT alignment for discrete cards
  drm/i915: support 64K GTT pages for discrete cards
  drm/i915/uapi: document behaviour for DG2 64K support

Ramalingam C (1):
  drm/i915: add needs_compact_pt flag

Robert Beckett (1):
  drm/i915: add gtt misalignment test

 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 +++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  21 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 108 ++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  21 ++
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 drivers/gpu/drm/i915/i915_drv.h               |  11 +-
 drivers/gpu/drm/i915/i915_pci.c               |   2 +
 drivers/gpu/drm/i915/i915_vma.c               |   9 +
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 224 +++++++++++++++---
 include/uapi/drm/i915_drm.h                   |  44 +++-
 12 files changed, 462 insertions(+), 52 deletions(-)

-- 
2.25.1

