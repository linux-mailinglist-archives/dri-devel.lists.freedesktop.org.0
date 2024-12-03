Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F09E1324
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 07:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3075D10E910;
	Tue,  3 Dec 2024 06:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqvXsYF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750110E90D;
 Tue,  3 Dec 2024 06:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733205922; x=1764741922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/arm92ZRfFfGNwDdUyFCh/ax0mL7M5jiATGXpYhvp0=;
 b=dqvXsYF6Juorhf/cxtoqJ6okLSiLWy4L2c8Unh9RLik4fKCNaHxcRz0e
 +8A61FuXAALYkXTvCC3qyqduVZkkfP/znYQJoY+dVqCbodXJ15c9Rq+jz
 T4Wsc2jJMdDSebBhRMIPNzQB+Mmqqq9vhGItVgpmPrd4/7qzWXP/y+36n
 pBkuZi6+oHYW3XVa11+R9/qTL+BrAZSQe1cA5XfBCWTWx4Zx9fAcVv/sk
 xLzgQBPgxEdWorbauSIrJpEbZ1CQU6Ro3XqHtzva8n1el54Sb/HTnb+cq
 fO1yEagZVlkOnnp8JH4QmAA5htlsIW51x+1cZpOc8sGge7Gv2v09hc+59 A==;
X-CSE-ConnectionGUID: yOTSuZYRQiahQTnAXvTAgw==
X-CSE-MsgGUID: nGfloqtARUuhXYpBlySSCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37058879"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37058879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:05:22 -0800
X-CSE-ConnectionGUID: YdTJ5rNxTbm90dHDc0H64w==
X-CSE-MsgGUID: cj+TL1vQSYKAeDeFlrFHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="124163912"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 22:05:21 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 10/10] drm/i915/histogram: Enable pipe dithering
Date: Tue,  3 Dec 2024 11:25:20 +0530
Message-Id: <20241203055520.1704661-11-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203055520.1704661-1-arun.r.murthy@intel.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
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
index 48495480107e..53d0c42049d8 100644
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
@@ -209,6 +216,9 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
 	if (histogram->enable)
 		return 0;
 
+	/* Pipe Dithering should be enabled with histogram */
+	intel_histogram_enable_dithering(display, pipe);
+
 	 /* enable histogram, clear DPST_BIN reg and select TC function */
 	if (DISPLAY_VER(display) >= 20)
 		intel_de_rmw(display, DPST_CTL(pipe),
-- 
2.25.1

