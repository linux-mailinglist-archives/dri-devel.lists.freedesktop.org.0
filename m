Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9914FE8B7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 21:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4710E661;
	Tue, 12 Apr 2022 19:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE7110E375;
 Tue, 12 Apr 2022 19:38:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 641A21F418E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649792313;
 bh=NalZT/qBKgg47jg5Qm3PH1LbLq0F55KPYN27R/tTp1s=;
 h=From:To:Cc:Subject:Date:From;
 b=cUeCkUJQYIFdCloVb+wxhz3Ao7FUIuB6daRk/2CiX4Nmy9HO2QTENs+T0d9FF2L/8
 obzdTX8BvLrQ/OG77Rg+LoKXj/H/YWmSD6DtHD/JQg63uDFTxvCyNTFsIvUi38dMtC
 iBZL1ZJoZnUc0OuDl7LHA+nmSp4SKS/QKqQnxIhJv1gICOj2C4gfWkNZWsqp4rnikQ
 rdEPgM6vv6ir8UD7Ch7Mgbd/CKCKN2NftS7npGVrNDd4HpAoX66tKsv1j9SxXRqIA2
 5qCwMGwT2jDBcFFQ6ZYraYLtbiNW1C/Teh396gH4SpNQwP4p/X8frHOEY1lkelTC2F
 iaTqbyFya1ARQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/i915: ttm for stolen region
Date: Tue, 12 Apr 2022 19:38:11 +0000
Message-Id: <20220412193817.2098308-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series refactors i915's stolen memory region to use ttm.

v2:	handle disabled stolen similar to legacy version.
	relying on ttm to fail allocs works fine, but is dmesg noisy and causes testing
	dmesg warning regressions.

v3:	rebase to latest drm-tip.
	fix v2 code refactor which could leave a buffer pinned.
	locally passes fftl again now.

Robert Beckett (5):
  drm/i915: instantiate ttm ranger manager for stolen memory
  drm/i915: sanitize mem_flags for stolen buffers
  drm/i915: ttm move/clear logic fix
  drm/i915: ttm backend dont provide mmap_offset for kernel buffers
  drm/i915: stolen memory use ttm backend

 drivers/gpu/drm/i915/display/intel_fbc.c      |  78 ++--
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 416 ++++++------------
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h    |  21 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  32 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.h       |   7 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  33 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  16 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   5 -
 drivers/gpu/drm/i915/intel_region_ttm.c       |  67 ++-
 drivers/gpu/drm/i915/intel_region_ttm.h       |   8 +-
 drivers/gpu/drm/i915/selftests/mock_region.c  |   3 +-
 14 files changed, 325 insertions(+), 374 deletions(-)

-- 
2.25.1

