Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DF78C91D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DB810E407;
	Tue, 29 Aug 2023 15:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FE510E3FE;
 Tue, 29 Aug 2023 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324758; x=1724860758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqt8nZVfkTLVOlfw6Y6F3d3wLOYoZSyIo9m9VYPPAKk=;
 b=bKHzAe+r5HfJPqFYmwxn5SgMkAww/C9f9t5ZPULlCZoO4u1nZsDPHw/5
 M9s7FbGmwxbd1QEqW0H8n1mm+0e39Qg1oM+Y0i/nHURvZS6djDsX3SBdR
 i9suFpE6ur7Jp1L2gxB5V18cphI1KHF/Y6dmJ5D3bCFcCuUib7OydDkPo
 hkkpxNOhFAFzS+6l32RgJ1gHyCLkkrtdiJ4arHux/dMwNtpBfeCaI25cr
 NPfF2VKg1uaJyXnb8GeMX9HAhMYOEPODZw6qNq7mF0iMLvuixfWoLZsua
 hfWQsrgO7TB/E3keqc2cFC+cPx8U+jy74k7VT9aPIKLhB5HLPtO3G3+Gb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769365"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769365"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555038"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555038"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:16 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 17/33] drm/i915/color: Add color pipeline for SDR planes
Date: Tue, 29 Aug 2023 21:34:06 +0530
Message-ID: <20230829160422.1251087-18-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SDR planes provides programmable color hardware blocks for
Pre-CSC and Post-CSC operations. Add a color pipeline to
expose these capabilities.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 8c2a858fc452..09e50659befd 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3941,6 +3941,23 @@ static const struct drm_color_lut_range xelpd_post_csc_hdr[] = {
 	},
 };
 
+struct drm_color_op color_pipeline_sdr[] = {
+	{
+		.name = DRM_CB_PRE_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0, /* To be updated during plane initialization */
+	},
+	/*
+	 * SDR planes have fixed function CSC capabilities.
+	 * TODO: Add support for it
+	 */
+	{
+		.name = DRM_CB_POST_CSC,
+		.type = CURVE_1D,
+		.blob_id = 0,
+	},
+};
+
 struct drm_color_op color_pipeline_hdr[] = {
 	{
 		.name = DRM_CB_PRE_CSC,
-- 
2.38.1

