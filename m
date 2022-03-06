Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E94CEE63
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 00:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56E10E038;
	Sun,  6 Mar 2022 23:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEEE10E038;
 Sun,  6 Mar 2022 23:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646608920; x=1678144920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXl2F0A9anAIrMIMO2UxvaGSsL/RPzTykaxYdg4JaL0=;
 b=no12eSN2YPxQ6NRMFdKz8rwItAlTs2I0nIsxdtb0EZPzOa8rb0N1o0fZ
 dg/gFtX9vq9juDcLRmmopayK6ps+xJB513rNzFHXC+AYexrfGuDyWudOB
 pz+JgNnVjHDRLsZF9aQEJ8t1+PcnFBq3I8sRjHo1R+jez7r8St2Wsq4TZ
 MDsjpnPJNIN4WB+tlgCY0byrnYTaCvRdWQpb1kkXXC4n0iHtCm3WiYfac
 LPdPhSfrpNUPsXoxk09Gpsk3/9XcREOT9XgIjTsgPUl19ion2BxnqP6gc
 BUv38yE7UDo5Od49+XxRrmh2Zl794j2kW8PEf2RsLk5xS4i0KjtKCbnCK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="253096851"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="253096851"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:21:59 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="546718495"
Received: from jpdefuri-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.153.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 15:21:59 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v7 0/2] GuC HWCONFIG with documentation
Date: Sun,  6 Mar 2022 15:21:55 -0800
Message-Id: <20220306232157.1174335-1-jordan.l.justen@intel.com>
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

Now with 100% less documentation. (See v7 notes.)

This is John/Rodrigo's 2 patches with some changes. There are various
changes suggested by Michal in John's "fetch" patch. The table
terminology was also changed to "blob" as requested by Joonas.

Dropped these 2 patches (which were in v1-v6):
 * "drm/i915/uapi: Add struct drm_i915_query_hwconfig_blob_item"
 * "drm/i915/guc: Verify hwconfig blob matches supported format"

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

v7:
 * Jon took back his Acked-by for my documentation patches, so I had
   to drop those 2 patches. Jon and John feel very strongly that i915
   should not document or guarantee the format of the blob returned by
   this uapi. They say it should only be documented in the Programmer
   Reference Manuals whenever they are released, and userspace can
   verify it.
 * The "query" patch commit message no longer documents the uapi, and
   refers to the eventual release of PRMs.
 * I changed the "fetch" patch back to reporting drm_err after
   reviewing the discussion between Michal and John on this. (John
   preferred error, and Michal said this was ok.)

John Harrison (1):
  drm/i915/guc: Add fetch of hwconfig blob

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig blob

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   4 +
 drivers/gpu/drm/i915/gt/intel_hwconfig.h      |  21 +++
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 162 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_query.c             |  23 +++
 include/uapi/drm/i915_drm.h                   |   1 +
 9 files changed, 223 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c

-- 
2.34.1

