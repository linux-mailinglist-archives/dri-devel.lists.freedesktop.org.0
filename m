Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E2522BFF
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E5410E3F1;
	Wed, 11 May 2022 06:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167710E32F;
 Wed, 11 May 2022 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652248958; x=1683784958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oQzbK8TqUts8IB/KcKB6Ki4mYYT/M9Awwfggm7/XvnY=;
 b=LwfA7ZemABeq/+a5bYKGUhuXGYzagvqnJtu3oZ8spG/YgZARLOP/JsoM
 mi37jNgKh71fG8z9xlxscAceHKNqBHtEA20NstTGNhPjN9tebZfcJ9U6W
 wB0dMWsqyyOI6QWBLndjrNc6nriXuQFCLpbF1EJ+Okleg8HU+in+kuK8A
 05XMota5rN8uN5xdan5M9AFeD/5ah8FEGgZYR1tCTTo16/xM6sxq4fRso
 1bu7OH3jAme2KqbkIJq3nPBJ6vcaDk1mF/fvgNTj3+PV5HXOK9tP3mzJU
 M2nxjh8EK6RxBcsoK0bCP2Jt9Ubm09ULHDoFEm6oKKZQd7RgzYpL//mpQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332633555"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="332633555"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520375202"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/5] i915: Introduce Ponte Vecchio
Date: Tue, 10 May 2022 23:02:23 -0700
Message-Id: <20220511060228.1179450-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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

Ponte Vecchio (PVC) is a new GPU based on the Xe_HPC architecture.  As a
compute-focused platform, PVC has compute engines and enhanced copy
engines, but no render engine (there is no geometry pipeline) and no
display.

This is just a handful of early enablement patches, including some
initial support for the new copy engines (although we're not yet adding
those to the platform's engine list or exposing them to userspace just
yet).

v2:
 - Drop replicated comment from forcewake patch completely and add an
   additional commit to provide better documentation for forcewake and
   shadowed register tables in a way that's clear for all platforms.
 - Move gvt build fix to its own patch.
 - Address various minor review feedback from Lucas, Tvrtko, and
   Prathap.

v3:
 - Flip the feature flag in the PIPE_CONTROL patch.  (Lucas)
 - Add two additional GuC-related patches.


Daniele Ceraolo Spurio (1):
  drm/i915/guc: XEHPSDV and PVC do not use HuC

Matt Roper (3):
  drm/i915/uncore: Reorganize and document shadow and forcewake tables
  drm/i915/pvc: Add forcewake support
  drm/i915/pvc: Add new BCS engines to GuC engine list

Stuart Summers (1):
  drm/i915/pvc: Remove additional 3D flags from PIPE_CONTROL

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  18 +-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  15 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_pci.c               |  10 +
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 drivers/gpu/drm/i915/intel_uncore.c           | 267 +++++++++++++++---
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
 9 files changed, 268 insertions(+), 55 deletions(-)

-- 
2.35.1

