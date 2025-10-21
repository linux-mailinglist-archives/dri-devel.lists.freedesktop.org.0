Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F6BF84B1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEE910E332;
	Tue, 21 Oct 2025 19:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtyzFL+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A31410E331;
 Tue, 21 Oct 2025 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075910; x=1792611910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AO6nbyiDseY00c52yWLQjUFj+EaW3s/3Shr5a/eeI2Y=;
 b=OtyzFL+7hi8BmZvme/Xob3t2HQXL8Hntp+BM4fh0MRC91eCUgvUfGVRH
 MC0EVCwZrXieEhxbSVfZTFdpt85/D7FQDPGawXysn0a3ZWq3Ns1fef5Zv
 DRSd5+5Cy60Xe7tX5fMufoSHPdDJwZJh2P/yV1txzbo6x7uCWXOBmRhsm
 vyWmS83ujhkoQ+iDEGyEWVemHVUyEqaNTxRO95Pziq6BA2CrU+aUhlvQA
 hY35DDPKjkmlzMFgS6fMgJKSO4DqQ9kQ7luHAX3+sfUaOyvFK8F8V4taJ
 KSp3Z3h5Ce4fLdpk1ZPNasV/nL6CAjLl6mE2pEaSlxC3DisOlvtNAcB97 Q==;
X-CSE-ConnectionGUID: aZW001zNQGitpKkJR+Xhcg==
X-CSE-MsgGUID: m6kP9Be5QX+aAJ6QebNYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67049537"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67049537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:10 -0700
X-CSE-ConnectionGUID: lkz/tRNjRdeY8mWFxoBQRg==
X-CSE-MsgGUID: Lc5Oog/mSbKdwLCCd3aVKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="187714966"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:08 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 2/5] drm/uapi: Introduce the DRM_MODE_DUMB_CURSOR flag
Date: Tue, 21 Oct 2025 22:44:52 +0300
Message-ID: <20251021194455.24297-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

On certain hardware (eg. all Intel GPUs) normal planes vs. cursor
planes have wildly different hardware capabilities. Currently
DRM_IOCTL_MODE_CREATE_DUMB is only really suitable for allocating
buffers for normal planes.

Introduce a new DRM_MODE_DUMB_CURSOR flag for DRM_IOCTL_MODE_CREATE_DUMB
so that the driver can attempt to make sure the dumb buffer will
be actually suitable for cursor planes.

Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 2 +-
 include/uapi/drm/drm_mode.h        | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index fdc249198022..e4a9692c099d 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -197,7 +197,7 @@ int drm_mode_create_dumb(struct drm_device *dev,
 		return -ENOSYS;
 	if (!args->width || !args->height || !args->bpp)
 		return -EINVAL;
-	if (args->flags)
+	if (args->flags & ~DRM_MODE_DUMB_CURSOR)
 		return -EINVAL;
 
 	/* overflow checks for 32bit size calculations */
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1e0e02a79b5c..3b7e13a29244 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1062,12 +1062,14 @@ struct drm_mode_crtc_page_flip_target {
 	__u64 user_data;
 };
 
+#define DRM_MODE_DUMB_CURSOR	(1<<0) /* dumb buffer is intended for a cursor */
+
 /**
  * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
  * @height: buffer height in pixels
  * @width: buffer width in pixels
  * @bpp: color mode
- * @flags: must be zero
+ * @flags: bitmask of flags, see DRM_MODE_DUMB_* defines
  * @handle: buffer object handle
  * @pitch: number of bytes between two consecutive lines
  * @size: size of the whole buffer in bytes
-- 
2.49.1

