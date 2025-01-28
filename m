Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD3A20E01
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2C310E6B4;
	Tue, 28 Jan 2025 16:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfRfzXn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E9310E6B4;
 Tue, 28 Jan 2025 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080389; x=1769616389;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Kjc+4bZ3Mw8Tvc6O58RCdTmBMyon2TLHDsDhCs9PLGs=;
 b=WfRfzXn/W9Obkb5GoJsyg0lFmuhxoH3rap5988sYDxKK9W/EQhpx/YPz
 tZG49SAAJ2BouVm4lXgc055MGv2CXfu2QMmTfAgLmA02Z+4yXxA4/VhRz
 3T6mZ08p39gu4hH6mb0of79oyhcUHgW1ksxMiitjEsZpNWpL5vUIoc8G7
 pF1+4PTAdrJfc+wdAHMJqZnzZeH0+yAU5+LcpxHxUA0sfndAk8xCJQ2N3
 YxV5zjBYCB8mD0EEQfh6Kebpby6h7DNjVo4nY8fPvA4YyWaE6tokrueJC
 4eur8yTBkoIgXcd8jXw62t37Y3+G4cjIAp6yaE25NEMqQhQjmI2qjrQP3 Q==;
X-CSE-ConnectionGUID: Q7jBzVzTTZSmzZjkdgFL8g==
X-CSE-MsgGUID: /mSSAGcHQrObfqPzzlshaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745075"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745075"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:28 -0800
X-CSE-ConnectionGUID: jOvxD+h4RnO/2xexgg6ITg==
X-CSE-MsgGUID: 79PWBcjlQNqsI+R+31p7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145977051"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:26 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:20 +0530
Subject: [PATCH v8 14/14] drm/i915/histogram: Enable pipe dithering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-14-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
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
index f6844449e4bb6167116d223af316e5f3a5e8707c..ead9c2391d460f459dfca8e99ea423a34418e67d 100644
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

