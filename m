Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C14AC97F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F0D10E6B3;
	Mon,  7 Feb 2022 19:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440610E49D;
 Mon,  7 Feb 2022 19:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644262137; x=1675798137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tFH0rM7pbt36g1beQ6IMSi+8H19nMs9nOTv9B7HTClw=;
 b=Sky/G2NW7hc65wJdy76SvQcS+duLzWDeVxJc+EUezSnD/sr6ezlvnQ0S
 TdP+tpKzLd/ILUhSQ0vfvfhazF0JbKSCLJdp0rWF7NDaygjj4OOs0QCk7
 oT6/OjNv9TNxhrCT2qOkkctSp9lM36RBaI87ZHjgI4TzmXifovBZ8FFEA
 FgvBCgA9p9gdZyIYIozKybnoCw6mdrwThPMitZQQPG820XTQcGCUAdn74
 TivZR51QvJgWXIwRJ//Z385JfSCnLn5NvgHQVb1sgeE9jCiUZh+yz4/CA
 0Dz0Le1vqyhxazLremrjdj4EkNZRHHV8GS17tiGefFD61c3L9yO+Lldvu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228762592"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="228762592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:28:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="484536967"
Received: from normanma-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.85.164])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 11:28:56 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 0/4] GuC HWCONFIG with documentation
Date: Mon,  7 Feb 2022 11:28:50 -0800
Message-Id: <20220207192854.862959-1-jordan.l.justen@intel.com>
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
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 177 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  23 +++
 include/uapi/drm/i915_drm.h                   |  25 +++
 9 files changed, 259 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

-- 
2.34.1

