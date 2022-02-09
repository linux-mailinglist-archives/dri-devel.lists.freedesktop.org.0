Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2D4B0087
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AB810E382;
	Wed,  9 Feb 2022 22:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7808C89E50;
 Wed,  9 Feb 2022 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644446712; x=1675982712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Z8toemDZiO6X4sXFdONA4EDy/YayV7C+QHFEvnN46A=;
 b=TJF8EJ4CI79DGQtfw2H8PvYHmQOzmCWbCfXpNiI2ZTboVs2Zz706V5rb
 QktcuRzc6g+OnOQrDRMUXloWIxd0qettsFTyg9JWlMi5/6sA+qT0l0bvN
 MXIsBFJFijCS1AT/wiMgYg76rl09Hcwd0duhTd2PQec/+SnngTCG51+e2
 /KQrAN1Dd9ZKi7iml182PTiFS9C8TKIZFvzgr+FCWIfSpugpppp4ALw5J
 JJo6B5c/DmrRzScqk+w9s8wkAAPvMU3zO/+V6zzADpYQ84imgOKXxtq8h
 2JxXBHb+uFtQVvfwGeoQgQILjCrSWXA2LynHaQ6LZ/lbcg5DLhVP670YC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="246942961"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="246942961"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="773671147"
Received: from unknown (HELO localhost) ([10.212.169.188])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:11 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 0/4] GuC HWCONFIG with documentation
Date: Wed,  9 Feb 2022 14:45:03 -0800
Message-Id: <20220209224507.874751-1-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is John/Rodrigo's 2 patches with some minor changes, and I added
2 patches.

"drm/i915/uapi: Add query for hwconfig blob" was changed:

 * Rename DRM_I915_QUERY_HWCONFIG_TABLE to DRM_I915_QUERY_HWCONFIG_BLOB
   as requested by Joonas.

 * Reword commit message

 * I added Acked-by to this patch, but this only applies in the
   context of this version of the patchset. If my changes are
   rejected, then please *do not* add my Acked-by to the other series.

   In particular, I do not want my Acked-by on the patch if the patch
   mentions the HWCONFIG format, but is not willing to add that to the
   actual uAPI.

   I also do not want my Acked-by on it if it mentions "consolidation"
   of this data. Since we are dealing with open source projects (aside
   from GuC), this doesn't seem appropriate.

"drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item" adds a
struct to the uAPI and documents the return value for
DRM_I915_QUERY_HWCONFIG_BLOB. (Except, keys / values are still
deferred to the PRM.)

"drm/i915/guc: Verify hwconfig blob matches supported format" does the
simple verification of the blob to make sure it matches what the uAPI
documents.

v2:
 * Fix -Werror errors.
 * Rebase to drm-intel/for-linux-next instead of
   drm-intel/for-linux-next-gt, as this seems to be what CI wants.
 * Fix u32 -> __u32.
 * Add commit message for "Verify hwconfig blob" patch as requested by
   Tvrtko.
 * Reword text added to i915_drm.h as requested by Tvrtko. (Attempting
   to indicate the overall blob ends right at the last blob item.)

v3:
 * Add several changes suggested by Tvrtko in the "Verify hwconfig
   blob", along with some tweaks to i915_drm.h from the feedback for
   the same patch.

v4:
 * Rewrite verify_hwconfig_blob() to hopefully be clearer without
   relying on comments so much, and add various suggestions from
   Michal.
 * Michal also had some suggestions in John's "drm/i915/guc: Add fetch
   of hwconfig table" patch. I held off on making any of these changes
   in this version.

John Harrison (1):
  drm/i915/guc: Add fetch of hwconfig table

Jordan Justen (2):
  drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item
  drm/i915/guc: Verify hwconfig blob matches supported format

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig blob

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 193 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  23 +++
 include/uapi/drm/i915_drm.h                   |  36 ++++
 9 files changed, 286 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

-- 
2.34.1

