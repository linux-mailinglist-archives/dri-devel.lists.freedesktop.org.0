Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89D4AE2C6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E40010E26F;
	Tue,  8 Feb 2022 21:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDD510E201;
 Tue,  8 Feb 2022 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644354308; x=1675890308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3iBhu8H2eNSgz3z29cqFEJ7bY2i1lhSLmCdt61aQPOc=;
 b=hxHEcJLIANa6cMtll9f6BvaY6xhZ7iq0qo3xaE+3mGySzlHuLLtvYWmj
 g7F1rkRBA/zzE5a7X082veFTfg9YZcp+lOnHLousjNTmFTNCQrlOdjcjO
 q5N3OlRUpDcjbOhkxy2uEJO17Zu2WS6w2n9btCh9e/TKhu7tahtJ35UCr
 yC5zTsiy+hW4N4EgPC0O/PSg+sHmz6VxCsJ+Bc66NQzbKKeVES4zDd4LJ
 tNpp+ZhKqhxL5Nj9zfhcMizaW9XAyJM3PRjXZGnavT36Mt5gUPgBXzG30
 8nd7s7B0xRid8V3UaG0OKcIkqePzyuAB5xZDPs56qMvtkaRxiRYku4Rlv Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273585606"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="273585606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="540784478"
Received: from fpaillet-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.65.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:07 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 0/4] GuC HWCONFIG with documentation
Date: Tue,  8 Feb 2022 13:04:59 -0800
Message-Id: <20220208210503.869491-1-jordan.l.justen@intel.com>
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
 * Fix u32 -> __u32. (Sorry, I was first testing in Mesa tree.)
 * Add commit message for "Verify hwconfig blob" patch as requested by
   Tvrtko.
 * Reword text added to i915_drm.h as requested by Tvrtko. (Attempting
   to indicate the overall blob ends right at the last blob item.)

v3:
 * Add several changes suggested by Tvrtko in the "Verify hwconfig
   blob", along with some tweaks to i915_drm.h from the feedback for
   the same patch.

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
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 201 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  23 ++
 include/uapi/drm/i915_drm.h                   |  33 +++
 9 files changed, 291 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

-- 
2.34.1

