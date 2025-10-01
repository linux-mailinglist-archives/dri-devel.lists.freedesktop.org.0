Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B82BAF44D
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45B610E68E;
	Wed,  1 Oct 2025 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC/TSz1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6910E697;
 Wed,  1 Oct 2025 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300787; x=1790836787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=11uOjgqCwp8kLjluv7ozUJJlSlNnyn2vnFgDC3Bw3FA=;
 b=gC/TSz1+T2l+OgWOq2735X267OML70kS+oUPRq6Ip+OKq+AniInZ3Ire
 fy82m8BJ9td4/gxPX+s3O5IPItgQXfuYVjaDBiowW2yPfMeTzX8OVwr2C
 8piXf7Ex0hZ2dgbiAO9mcndZcbdHOH+zJD31rh6EqaIUODlf5mXp8PP51
 /yx5reYrSOV30KdtV7nCv2/q5/nMz2dEkHVkfR9ltr2iQ2lfgiKbCaL/H
 jiqx7XqrbeCaGsH7+k3csAocNhVuUB+4zuz5jPvORocDLlq5++aK2lDbe
 3Ga2AuRgzehqaB84em+IEdPxZKDzQYytdG84arj392xz3Q1QMQQQ3KCnq A==;
X-CSE-ConnectionGUID: bomkqYvVS/qH7iUL6sYYDA==
X-CSE-MsgGUID: azfCowBmQI+khxZwY7X+LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65422515"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65422515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:39:47 -0700
X-CSE-ConnectionGUID: jnqZKEcCT++FGpJP40+GLQ==
X-CSE-MsgGUID: EorvZ/+3QxOTT2UUN3A3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177841942"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 30 Sep 2025 23:39:46 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose sharpness strength property
Date: Wed,  1 Oct 2025 12:05:00 +0530
Message-Id: <20251001063500.1259687-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251001063500.1259687-1-nemesa.garg@intel.com>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
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
index a187db6df2d3..4102087aee62 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -390,6 +390,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
 
+	if (HAS_CASF(display))
+		drm_crtc_create_sharpness_strength_property(&crtc->base);
+
 	return 0;
 
 fail:
-- 
2.25.1

