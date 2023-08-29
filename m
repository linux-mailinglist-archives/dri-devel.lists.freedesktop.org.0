Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9F78C924
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F14A10E40E;
	Tue, 29 Aug 2023 15:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B08A10E40A;
 Tue, 29 Aug 2023 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324792; x=1724860792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L496O12+gCB8MunXy6XwdLI99hzyun8QY3tnp7ytVO8=;
 b=bHDBISU1hvC/h5A8/Qp3Jp4c53cmKVtGi5UkHMVQSqxfJblN7srj50Aw
 p6hyiLiyfO59Y8IzDj3+rA+PYpbGQ22NWQPTFpHsLYXTsgVaIy6q3YKx0
 kvgPSFQfeA7LPishAZXaN6X8rIqO/uvIXnp6Lwe/Prom4bc6hUSnzkW47
 Dil43iyRUZ6dSGEqu+xS4EBjWwoFcdReggA1G2ERQ1NA/tgKWRnOfrZql
 DmyeLf7GT8jBByrKbk1PGVY6jpgZIoShdtpx/08zE90rprLhlOAFVQZha
 EfqnD0Ll96pSOKT3R8z73kp8eHUwL3vlZJtS6s2b2eCAwKs5TwNLbUcuM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769421"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555056"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555056"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:24 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 21/33] drm/i915/color: Create and attach set color pipeline
 property
Date: Tue, 29 Aug 2023 21:34:10 +0530
Message-ID: <20230829160422.1251087-22-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Create and attach "SET_COLOR_PIPELINE" property to planes.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 9f5d2cd0f97a..feff8ac45f47 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4066,6 +4066,9 @@ void intel_color_plane_init(struct drm_plane *plane)
 					     sizeof(color_pipeline_sdr));
 
 	drm_plane_attach_get_color_pipeline_property(plane);
+
+	drm_plane_create_set_color_pipeline_property(plane->dev, plane);
+	drm_plane_attach_set_color_pipeline_property(plane);
 }
 
 void intel_color_crtc_init(struct intel_crtc *crtc)
-- 
2.38.1

