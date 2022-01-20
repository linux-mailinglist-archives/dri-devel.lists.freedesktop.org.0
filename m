Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F449557C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 21:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000D10E3C4;
	Thu, 20 Jan 2022 20:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0442A10E39E;
 Thu, 20 Jan 2022 20:40:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 613D71F4181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642711243;
 bh=8SRMF1fwYlwSKpj4wE4r+WBUa8jwNdVOhpRGjytDYrg=;
 h=From:To:Cc:Subject:Date:From;
 b=Ki0+aa5wsXNj9KwySeT3/pha67pGALJwzQ4imoDXMVmHAxZkO+gUt5CdQSGelz7mJ
 EznopHlYWnMOdRzP+F09VAQ236XkBbtrETCKZehsUGd1oRrKd1JVuj7T7dJ2mZ5rK3
 NURoXHvBk77H2p5WSPC2G0II99No3YFTJ711qEsI51R5TDqtOUa85V8ROyQnWjiYdv
 cv7Cte5PZqWzTGvywj3ljTGqhImlIHmZhGhcfQgwq3QNyJ+6hsUTBE5uTC+L2JkMe8
 ROVcjToiV3TtX1S0jRGyWgaS8qQ4iYDcgyYvQHKKWet8mnrgY1BAO7848WsWHUIfoj
 PdjvDrSkeRWCQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] discrete card 64K page support
Date: Thu, 20 Jan 2022 20:37:15 +0000
Message-Id: <20220120203721.632424-1-bob.beckett@collabora.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
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

Matthew Auld (3):
  drm/i915: enforce min GTT alignment for discrete cards
  drm/i915: support 64K GTT pages for discrete cards
  drm/i915/uapi: document behaviour for DG2 64K support

Ramalingam C (1):
  drm/i915: add needs_compact_pt flag

Robert Beckett (1):
  drm/i915: add gtt misalignment test

 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 +++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 108 ++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  12 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  18 ++
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 drivers/gpu/drm/i915/i915_drv.h               |  10 +-
 drivers/gpu/drm/i915/i915_pci.c               |   2 +
 drivers/gpu/drm/i915/i915_vma.c               |   9 +
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 226 +++++++++++++++---
 include/uapi/drm/i915_drm.h                   |  44 +++-
 12 files changed, 462 insertions(+), 52 deletions(-)

-- 
2.25.1

