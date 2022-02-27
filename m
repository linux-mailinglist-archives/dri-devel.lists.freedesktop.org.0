Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E04C59FA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 09:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56D10E373;
	Sun, 27 Feb 2022 08:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BC310E35E;
 Sun, 27 Feb 2022 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645949913; x=1677485913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zM+ZgmJi62CXkIYmLDv9QmQgGW2X57F9tFxY+XKy5Ug=;
 b=gd6xPf8LmHtTkUm+RPGEVtGgyT56D0Fal4zqhU9ryqZNVG1YlhtzvaOl
 vReeUBY/DLookIwqvPwNLK0GUp8WmUswIubPlrv8wHNbYTDXX85MQq0IU
 nDlHDGX00GHGIteHWozoO/fqDRR+iKLZRQdikCn8wEqZtSURaPz316CyF
 1vQxueq6TdQtsFFJBXowE/lTDStfa/qWyfIGmvp5RBoyamu6bKrvNYVZK
 XXHY0RHvJxSa/BMvBrRvs7pi729ypdAx0W35v+QYKMP2aKPqMSiu26PZN
 iVSrtPiFSYA9jWl/ijOz2Q0etetoWc+uoBY4IN9+QL9vGbM4TQPFPTrsF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252444625"
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; d="scan'208";a="252444625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 00:18:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,140,1643702400"; d="scan'208";a="534073253"
Received: from jingyiji-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.25.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 00:18:32 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 0/4] GuC HWCONFIG with documentation
Date: Sun, 27 Feb 2022 00:18:27 -0800
Message-Id: <20220227081831.1089720-1-jordan.l.justen@intel.com>
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

 * I added Acked-by to this patch, but this Acked-by only applies in
   the context of this version of the patchset.

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

v5:
 * Add many changes suggested by Michal in John's "drm/i915/guc: Add
   fetch of hwconfig table" patch.
 * Fix documenation formatting as suggested by Daniel in
   "drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item"

v6:
 * Updated "drm/i915/guc: Add fetch of hwconfig table" by merging in
   John's v2 patch which saves the hwconfig blob at the GT level. I
   also added a few changes requested by Michal on the v5 posting.
 * Tvrtko requested an example of UMD using the i915 hwconfig
   interface. Mesa support for this interface can be seen in this MR:
   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14511

John Harrison (1):
  drm/i915/guc: Add fetch of hwconfig table

Jordan Justen (2):
  drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item
  drm/i915/guc: Verify hwconfig blob matches supported format

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig blob

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   4 +
 drivers/gpu/drm/i915/gt/intel_hwconfig.h      |  21 ++
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 203 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_query.c             |  23 ++
 include/uapi/drm/i915_drm.h                   |  44 ++++
 9 files changed, 307 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c

-- 
2.34.1

