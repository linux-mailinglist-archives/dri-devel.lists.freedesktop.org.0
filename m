Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACEA08117
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418BF10EFDD;
	Thu,  9 Jan 2025 20:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGygw4F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F74D10EFDF;
 Thu,  9 Jan 2025 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452895; x=1767988895;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=haH/tpCk/kiuvNoxP8HB0QRRmdK7UWqNY0Z0pwkap7c=;
 b=HGygw4F3CJwlyMs7KRPIptXEt2LF2NK0CDf7c7jDlV0pO+NUKYClpZmR
 VRwXBiul8wk28QeydtJDt3IGsrJtu7MEWjfRceDJAZ0MwGuA6QQk8maKV
 pWYbwzjX+u2evwSskHyFpt+3bm5Mcj7RjLej6vuXEZe+oAHiB4wUzKlZQ
 qimOQg/FfuHI1kBQjdxzZwuG+PTzvha9IdCf9oIFIMEDsc+5/GpfILz+u
 +B/c0wOV14LOrOOEEWh0flyFbw9EnKxqG6eANjSeBwwNddQQyOltl8Sgr
 TxURdvOik0caYdYbdneCPz0dhFBp7t+SbtWLz5MHbXx/v8Ys98LRM+sI0 A==;
X-CSE-ConnectionGUID: zkjmpzf8SXaiCMY6hi0nfw==
X-CSE-MsgGUID: ZimlQ+8NQUymHix0E8gNhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619323"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:35 -0800
X-CSE-ConnectionGUID: WETVTEL6SGWJPgribsx6bQ==
X-CSE-MsgGUID: 0g4UtPVdSDGgCgTp7dQerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798707"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:32 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:42 +0530
Subject: [PATCH v7 14/14] drm/i915/histogram: Enable pipe dithering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-14-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
 drivers/gpu/drm/i915/display/intel_histogram.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index d015350b57ed5c8e9aaab71311159bf51e15e9c7..7d0c5d07042c5eb0e33c95e7cadac5c0d1fda379 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -22,6 +22,13 @@
 #define HISTOGRAM_BIN_READ_RETRY_COUNT 5
 #define IET_SAMPLE_FORMAT_1_INT_9_FRACT 0x1000009
 
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
@@ -200,6 +207,10 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc, u8 mode)
 
 	if (histogram->enable)
 		return 0;
+
+	/* Pipe Dithering should be enabled with histogram */
+	intel_histogram_enable_dithering(display, pipe);
+
 	 /* enable histogram, clear DPST_BIN reg and select TC function */
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_rmw(display, DPST_CTL(pipe),

-- 
2.25.1

