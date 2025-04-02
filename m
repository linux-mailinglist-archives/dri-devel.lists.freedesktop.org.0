Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80AA78F5E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AE110E787;
	Wed,  2 Apr 2025 13:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwXHUDfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19F10E7A3;
 Wed,  2 Apr 2025 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598923; x=1775134923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4gOMO6rpY6CMt3MA7XA8ztCWF9C5RSMzEA64wCaK7no=;
 b=cwXHUDfvKTNGfIGs5zDSL/NxFvtY5J1/CphhSQ3y/L8dR9ficynnVXfI
 AVAfQZ+f0pFYG4+/9uGjblnAgGMypwbfLlSarNNvZRfZ+B1U97lI/2qog
 U0aY2WLOaJylz9CTpkWMJO57dmCbXKfP3Lf0HcpSd/KS2D07e1wDGi5vL
 iXEnmaZ21URQqoe5EZGyxbmF6d/jaS78ImN6P1Hf/0CEBgdjPxIO6noOw
 8oUrJhA6PJWFLvXUipAOH7iTfhEq4tJq1oJw423YiRirB7jN7NGcRlTc8
 z3l+rAKdWz2YkjRK4Dfjq8PPFVEc8HtvhxoZ7PVgHbo3YGJRWNeZirEOv A==;
X-CSE-ConnectionGUID: x7Tx7bbTQ/m+1kYxhvZLBg==
X-CSE-MsgGUID: ftcQ2F45SseZN3LJMtJUHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44219074"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44219074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 06:02:03 -0700
X-CSE-ConnectionGUID: HsN73TjkRzKO4wjAERQClg==
X-CSE-MsgGUID: zt3gKCyjR/qsCSnCMqufeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127528376"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 06:02:01 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Wed,  2 Apr 2025 18:26:47 +0530
Message-Id: <20250402125647.361295-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402125647.361295-1-nemesa.garg@intel.com>
References: <20250402125647.361295-1-nemesa.garg@intel.com>
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

Expose the drm crtc sharpness strength property which will enable
or disable the sharpness/casf based on user input. With this user
can set/update the strength of the sharpness or casf filter.

v2: Update subject[Ankit]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 5b2603ef2ff7..b8bd255e9555 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -391,6 +391,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(dev_priv))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.25.1

