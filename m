Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0289F86FD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C436B10E340;
	Thu, 19 Dec 2024 21:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJaWPy5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E3910E34B;
 Thu, 19 Dec 2024 21:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644072; x=1766180072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JS34CxpUH0VntzIm/vmO+AgNKJEPTSr5XiaL/RF2M0I=;
 b=CJaWPy5uwj4RNeoDEREg/Mt7ekuNPgQ4YYOgI7JunivQ/IVqP7/lkiML
 7R9RdBqVkuHdObGDEmdFmXigz7ILtktSEwZWn7PbDby59KfOfEOKhaYmq
 BED5hMkDxB4EqWSrkcS/V2YJ+oni8XYq3Ya8RO3WgR/58blA5d8hvBw0i
 T4ILSzHy6PR/xM9t6v0TS6G0PIdxwsI+JS7bosJLCQr+LtPSKpG8fGnR0
 ZXuSA8qhIWGZamDChz7rYy5siyXk+3gpfZoXLo/r2Cn5+Zdgfyzo6mPEn
 PBUIW3FO1EctBLR9SC5a/FxRsRJ9Rl04+kQBuxg3aT+Nt2tkMfKIh47Fx Q==;
X-CSE-ConnectionGUID: 10tCVM4+RAaHGmJ38N4WeA==
X-CSE-MsgGUID: uZxHDoKpSoy4UWZVcBTKdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34900121"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34900121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:32 -0800
X-CSE-ConnectionGUID: K3bO9qIBTnqj5Bbzryb5yw==
X-CSE-MsgGUID: COlU6MlASVi6KxTenb74rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99140768"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 03/16] drm/i915/mst: drop connector parameter from
 intel_dp_mst_compute_m_n()
Date: Thu, 19 Dec 2024 23:33:52 +0200
Message-Id: <d775bd84208f4739ff178305162fc9b32f165acc.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

intel_dp_mst_compute_m_n() doesn't need the connector. Remove the
parameter.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 50426ba5bdeb..f52f9c968adb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -167,7 +167,6 @@ static int intel_dp_mst_bw_overhead(const struct intel_crtc_state *crtc_state,
 }
 
 static void intel_dp_mst_compute_m_n(const struct intel_crtc_state *crtc_state,
-				     const struct intel_connector *connector,
 				     int overhead,
 				     int bpp_x16,
 				     struct intel_link_m_n *m_n)
@@ -282,7 +281,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
 		remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
 							      true, dsc_slice_count, link_bpp_x16);
 
-		intel_dp_mst_compute_m_n(crtc_state, connector,
+		intel_dp_mst_compute_m_n(crtc_state,
 					 local_bw_overhead,
 					 link_bpp_x16,
 					 &crtc_state->dp_m_n);
-- 
2.39.5

