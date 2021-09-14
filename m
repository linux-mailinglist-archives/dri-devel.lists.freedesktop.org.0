Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E712E40A59A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071116E3E5;
	Tue, 14 Sep 2021 04:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5098B6E3DA;
 Tue, 14 Sep 2021 04:54:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="220001352"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="220001352"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 21:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="552120050"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 21:54:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 0/5] Enable GuC submission by default on DG1
Date: Mon, 13 Sep 2021 21:49:28 -0700
Message-Id: <20210914044933.22932-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Minimum set of patches to enable GuC submission on DG1 and enable it by
default.

A little difficult to test as IGTs do not work with DG1 due to a bunch
of uAPI features being disabled (e.g. relocations, caching memory
options, etc...) and CI for DG1 isn't all that useful yet. Tested quite
thoroughly locally though.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (2):
  drm/i915/guc: put all guc objects in lmem when available
  drm/i915/guc: Add DG1 GuC / HuC firmware defs

Matthew Brost (2):
  drm/i915/guc: Enable GuC submission by default on DG1
  drm/i915/guc: Use i915_gem_object_is_lmem in i915_gem_object_is_lmem

Venkata Sandeep Dhanalakota (1):
  drm/i915: Do not define vma on stack

 drivers/gpu/drm/i915/gem/i915_gem_lmem.c  | 26 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h  |  4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  9 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 +++-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 14 +++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 90 ++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  |  2 +
 drivers/gpu/drm/i915/i915_gpu_error.c     |  2 +-
 9 files changed, 140 insertions(+), 22 deletions(-)

-- 
2.32.0

