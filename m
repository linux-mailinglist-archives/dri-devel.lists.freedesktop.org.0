Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D79D4CE5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3544510E910;
	Thu, 21 Nov 2024 12:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQQgT66J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F022010E910;
 Thu, 21 Nov 2024 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192547; x=1763728547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qim44bhfEGeu7lxNe5mva5J8SPeY19zU/HcooOnW4uo=;
 b=ZQQgT66JN4cu2aNLiwkXBqtX15SKTV+r6uVrYIV45oKbkIiK5jP6NfpR
 a6F4flumS+2zigUIQOoYs21ticBjYUi3GdKFxIHVpz7aEnmqFpaSNnNXf
 HXnHLd51AmYQ6c8TQ92IHJ7LRrMuKiKwTA8DV78skHBQ3FfLrGHzBfnEI
 oK6gV390IdwiNl0YSPbWckw+zdKZ+21n4NLATQ1FVOBy18Yvl5VhB/0ev
 Lc6dkbn9kZROo7Jbp8KIxCysiahjL9QYpfBijdhRIb9S9HJd2PXa2EI3D
 SSyhvmiH9Vb/bNVlvxO5dNpYNuHFxt56+ebQJw5qPi8/gUGoBq3FWCg7t w==;
X-CSE-ConnectionGUID: URiMRAC3SsWvE32vMPd84w==
X-CSE-MsgGUID: JJKESuqsQGWjkPLZyypChg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32230326"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32230326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:35:47 -0800
X-CSE-ConnectionGUID: zEm/ZvfaTq+N+74LSQtVNQ==
X-CSE-MsgGUID: 9iSoKpM2QU2oFP3oIGwpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127765980"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 21 Nov 2024 04:35:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/8] drm/xe: Add histogram support to Xe builds
Date: Thu, 21 Nov 2024 17:55:58 +0530
Message-Id: <20241121122603.736267-4-arun.r.murthy@intel.com>
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

Histogram added as part of i915/display driver. Adding the same for xe
as well.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..d383b0d35d8e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -245,6 +245,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \
-- 
2.25.1

