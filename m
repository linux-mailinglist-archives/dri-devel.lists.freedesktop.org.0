Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2829D2434
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3513310E613;
	Tue, 19 Nov 2024 10:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBEMuY0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB9010E613;
 Tue, 19 Nov 2024 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013713; x=1763549713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGihdUOmpAd0DYxzZ0fiDVASes6ubJe5BWTbrHydyqw=;
 b=mBEMuY0+jmPHZEU+KZzzW8ZbdP69qdpxVxXHzSkFEYK6gHC+lTIEWGdt
 DYPIApk+1ntkYG1wvVTBWFS6z1wwnMqnGPPprWjaoSN6iijoTnDMYr9hV
 jmj1JNR+cm/QsfdikWtQASMpEEUwQ78VfJHDeAli+Sa2Z58CY+MNLPvDc
 73nOJNZaa9UYIiptneloFJQBLEJiytWB30GlvKWZ/UftYl//h/XLeLsee
 VDVuHqoyrh8wIlgE0zAyQCgA5KSqTEjXaiKeYUj5P+Jvklr8dgDvOtp+a
 byUNcm2qxNBpCI/8z5SOSrGrvBZgqQdCJ17I0nbItki/ln+88fAL77XCZ Q==;
X-CSE-ConnectionGUID: UogpXQScQ4WnFMvLY1ZOBA==
X-CSE-MsgGUID: +/yi10cDQx6WYL8iaGtFNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43075374"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43075374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:55:13 -0800
X-CSE-ConnectionGUID: 8f++x9gMQN6RIpo6cgSB+w==
X-CSE-MsgGUID: mQoRhLgSTuWNwYzWKC6q5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89937461"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 02:55:12 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Date: Tue, 19 Nov 2024 16:15:21 +0530
Message-Id: <20241119104521.575377-9-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
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

Enable pipe dithering while enabling histogram to overcome some
atrifacts seen on the screen.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index beaad9256e01..d3c63da7e491 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -29,6 +29,13 @@ struct intel_histogram {
 	u32 bin_data[HISTOGRAM_BIN_COUNT];
 };
 
+static void intel_histogram_enable_dithering(struct intel_display *display,
+					     enum pipe pipe)
+{
+	intel_de_rmw(display, PIPE_MISC(pipe), PIPE_MISC_DITHER_ENABLE,
+		     PIPE_MISC_DITHER_ENABLE);
+}
+
 static void set_bin_index_0(struct intel_display *display, enum pipe pipe)
 {
 	if (DISPLAY_VER(display) >= 20)
@@ -205,6 +212,9 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
 	if (histogram->enable)
 		return 0;
 
+	/* Pipe Dithering should be enabled with histogram */
+	intel_histogram_enable_dithering(display, pipe);
+
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_rmw(display, DPST_CTL(pipe),
 			     DPST_CTL_IE_HIST_EN |
-- 
2.25.1

