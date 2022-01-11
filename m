Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32D48B4C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B6010E1B2;
	Tue, 11 Jan 2022 18:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB9910E173;
 Tue, 11 Jan 2022 18:03:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id F08381F445D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641924195;
 bh=JGn+3J3kMfaPfFbwy/txo2c2ywoDnBosK+U4R4T+hzg=;
 h=From:To:Cc:Subject:Date:From;
 b=c53K/ZwsWBAvC2LADwI2Er+IyruIOqqhOeim+UDHYkLQ19Q7g5pEsuXTIPPSj6LCz
 1QMdBrZwDmipZ6he2WGebdwPOwPqjinjEMpuyS7sJrVL2gz44Lg6dJpLubT8ivuT0e
 zov14jtQkQv5Ru76IRX4TQpzy74gUa4I6C4T0ZY5w4a6OZ7xalP/oy+HCzU4UbccqK
 gdpXFJlxO9XFgK4jhRx/DiDlDCCRUztUOLyTuAvdkJ/o2m3mfD0OK5g/pf0lEbEgRN
 dIETtWr2JRrRLlGj/3PQ70mnVnCMbYpYAQWiEMzJz2c3WMtS3J8Y79wkY3bXvKsBd4
 7q5JpZWunLi5g==
From: Robert Beckett <bob.beckett@collabora.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] dicsrete card 64K page support
Date: Tue, 11 Jan 2022 18:02:34 +0000
Message-Id: <20220111180238.1370631-1-bob.beckett@collabora.com>
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


Matthew Auld (3):
  drm/i915: enforce min GTT alignment for discrete cards
  drm/i915: support 64K GTT pages for discrete cards
  drm/i915/uapi: document behaviour for DG2 64K support

Robert Beckett (1):
  drm/i915: add gtt misalignment test

 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 +++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 109 ++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  14 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  12 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  14 ++
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 226 +++++++++++++++---
 include/uapi/drm/i915_drm.h                   |  44 +++-
 9 files changed, 454 insertions(+), 49 deletions(-)

-- 
2.25.1

