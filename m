Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647788AC837
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 10:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0971128ED;
	Mon, 22 Apr 2024 08:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dfm+sy++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F96C1128ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713776341; x=1745312341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m4yua6SrFY3YlHpyq5Z/v7TMFpqgNaYvrMBWCDiS6J0=;
 b=Dfm+sy++iFWOj1t8ouepO3fmcf/N7tWfs6nIYekju4qT5TwDX/5qYScZ
 MxOEZFs+CNhU+ylZXX2xzsm08rW4Yo+gRLiAFMKfHltwh1Cx/WqYZDE5Q
 l+h4aSQ4bx3u2nRX11NrbuUPCG+j5EXnM+QVI3EZDamLQjZA49fvxWH6v
 wVcfEUw6MtBe2HlkUPvu8oiEBZ6IHroymV5cX5afNwA38oAzQWYjS6Z7D
 rVOa3KegprqnBrUWQaE8strgDxErPfdPsOvjSH8ZLfDd6CyWBZbROqwlY
 Qk+H7BAkTTGxMzJLnUzki3EhgsxDNzkjDvWG2vpOl/6/6UYxNR4fx1RCu A==;
X-CSE-ConnectionGUID: ZDPszVhQQTiMR4RAg2aN3w==
X-CSE-MsgGUID: 03mzYg8ZQHWqHqtyvfm8ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20705138"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20705138"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:59:01 -0700
X-CSE-ConnectionGUID: 9hRwtDIxQ3203nrZDkRHOQ==
X-CSE-MsgGUID: YXuiFbouTum6O9ayzFHCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24028504"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Apr 2024 01:58:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Apr 2024 11:58:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Joshua Ashton <joshua@froggi.es>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
Date: Mon, 22 Apr 2024 11:58:57 +0300
Message-ID: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

drm_color_ctm_3x4 is some undocumented amgdpu private
uapi and thus has no business being in drm_mode.h.
At least move it to some amdgpu specific header, albeit
with the wrong namespace as maybe something somewhere
is using this already?

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: 6872a189be50 ("drm/amd/display: Add 3x4 CTM support for plane CTM")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/amdgpu_drm.h | 9 +++++++++
 include/uapi/drm/drm_mode.h   | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 96e32dafd4f0..d5ebafacdd70 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1269,6 +1269,15 @@ struct drm_amdgpu_info_gpuvm_fault {
 #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 
+/* FIXME wrong namespace! */
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 */
+	__u64 matrix[12];
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1ca5c7e418fd..d390011b89b4 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -846,14 +846,6 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
-- 
2.43.2

