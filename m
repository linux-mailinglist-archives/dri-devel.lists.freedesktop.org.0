Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6319D4CEF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57D310E925;
	Thu, 21 Nov 2024 12:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hj7zkL/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A8C10E923;
 Thu, 21 Nov 2024 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192557; x=1763728557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l2cUaZi8Ie81OusqbqDDFeoeLYipHVOLAqo560ZSq/U=;
 b=hj7zkL/OaNDMxtkkQMpNGh+0sswuvd9h5FCROGXIDdswMc04mvZqR99I
 DjuzL4/FoaTenhOTt9+riBvFEvbnzp1tGj/0ZsTOHPS7HZ3Sp3WcoTohh
 PcGapopeWOd32zsZN9oWlTuxBZGhFMK6cTB3cy2TIXQQhxHyg4N98DCyA
 QPD4oXoJGRtnBRA3MSLwSCqeINwpN7Zu9QcnGUCSec9Ku/bybjzEKV8bs
 y6evK/Y43gUXo6VBmrVlWraUUUSIAIbJOcshhxjcL0sAZNvU1kTeV51n/
 RI3ApPxuGLI3XV6sUjDqFak88gxYyDVyaExRZjoHxMr+B1B3RaY/XjcAz g==;
X-CSE-ConnectionGUID: CpkKNpY7RlqFd2iOpqZRiw==
X-CSE-MsgGUID: 1hBKVcXJRn2gdx5SvA+bsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32230357"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32230357"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:35:56 -0800
X-CSE-ConnectionGUID: 3QZtKnLcSJaadYFe64Ld0A==
X-CSE-MsgGUID: 0IkGx0YkSomKJOPy8Ikj8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127766028"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 21 Nov 2024 04:35:55 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 8/8] drm/i915/histogram: Enable pipe dithering
Date: Thu, 21 Nov 2024 17:56:03 +0530
Message-Id: <20241121122603.736267-9-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121122603.736267-1-arun.r.murthy@intel.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
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
index db4bc60be557..531df8a712fa 100644
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
@@ -197,6 +204,9 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc)
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

