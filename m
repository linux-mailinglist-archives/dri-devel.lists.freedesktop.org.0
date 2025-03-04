Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC60A4DAB5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9BA10E58E;
	Tue,  4 Mar 2025 10:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiSbfp+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920B10E58E;
 Tue,  4 Mar 2025 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084433; x=1772620433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8FXP/vWbgokGtYchHtCRR7Gk1Sx/Oheb/nhTY+0YG0A=;
 b=DiSbfp+GOUOQRKHPRH3HciGIoRj95DtUGBB5REh7w28S6n5dVeo17zlt
 dz1lXnTF0o6loy+dYZJkBkHbgTEAWEEKEBgSD8MbOacweteulWEuRMALe
 dQ+74YqlRln43uwOL0D30DBGzCJ6NxYsbLjnBLMc6540Oz6gj9o1FxDWr
 JwRwtFW3l9zDFGUe8+NVIwyehTIH+gLbkeF3L0v3sbUMxZXoklSGxDgHN
 q0TkEJ0mUSnK96K6eLwN7DrOPz5bbW5UcC6mH8n4nVEWKJncD/EdOBhnq
 jomocpdaD9y+5ISni1I9vLHSRo29K2k0X8p+JDHX2Vem6vo4HNXob2C0E g==;
X-CSE-ConnectionGUID: Wm4X3irGQlWofzzd3RopZQ==
X-CSE-MsgGUID: JQLfjKUERk2U0af3gJJqdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584102"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:53 -0800
X-CSE-ConnectionGUID: dp56xFxUR4OsjJ1kURIofQ==
X-CSE-MsgGUID: 5fGIONzIQyGTdiiTWDec0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118064073"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:52 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 10/10] drm/i915/display: Expose casf property
Date: Tue,  4 Mar 2025 15:58:57 +0530
Message-Id: <20250304102857.326544-11-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Expose the drm crtc sharpness property
which will ultimately enable the sharpness.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
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

