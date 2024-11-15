Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10D89CF1CA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526310E162;
	Fri, 15 Nov 2024 16:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzikUkuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C735710E035;
 Fri, 15 Nov 2024 16:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731688884; x=1763224884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d7XDXlN75UpjF5Im7vgkgMLjjrDj2TSSEFhkZe8s+/Y=;
 b=nzikUkujNh5xPC9YqP2ELLtMD7NMiHNwSVQgCguy7fpbujYeaY9HWmgl
 xCIR8lKPEO4uADgn9rFrhH9lGaoQ/AfkkL5fY8PFY24d0a9yAjhxaRWzv
 59uVvqzQA8dweajSQqjYtmfa8rxb62QhCIb7gMyYUGoCd0XYVO6Gr4Noe
 9ExUbohvWYpbQkZX3f971ML/uhDuKjz8uTBDn3AVS2nMxur/WilRq8Gjx
 eA1WXk+gW52aV8u5+hTIO+MKFsC6r1V5jF4keY81FZ7S/Mqg8Emxs4N2S
 Sz3WNIWh49z7ao3H/Tun/hee7S1HAK1ZIyg+3+5ZJnJ5bOW46MydliAFa Q==;
X-CSE-ConnectionGUID: +pTDQ2EOSKSQpFHnqgn/Wg==
X-CSE-MsgGUID: 2+xjOI7aRQeTdGas5nszjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31087072"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31087072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:24 -0800
X-CSE-ConnectionGUID: UUxnQnHoQWmzt4otNPxUoA==
X-CSE-MsgGUID: KmFJZw/5T3qYTgpv/e5ayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119554618"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 08:41:23 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
Date: Fri, 15 Nov 2024 18:41:56 +0200
Message-ID: <20241115164159.1081675-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

The connector initialization in intel_dp_add_mst_connector() depends on
the device pointer in connector to be valid, at least by connector
debug printing. The device pointer is initialized by drm_connector_init(),
however that function also exposes the connector to in-kernel users,
which can't be done before the connector is fully initialized. For now
make sure the device pointer is valid before it's used, until a
follow-up change moving this to DRM core.

This issue was revealed by the commit in the Fixes: line below, before
which the above debug printing checked and handled a NULL device pointer
gracefully in DRM core.

Cc: Jani Nikula <jani.nikula@intel.com>
Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index df7edcfe885b6..f058360a26413 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 
 	intel_dp_init_modeset_retry_work(intel_connector);
 
+	/*
+	 * TODO: The following drm_connector specific initialization belongs
+	 * to DRM core, however it happens atm too late in
+	 * drm_connector_init(). That function will also expose the connector
+	 * to in-kernel users, so it can't be called until the connector is
+	 * sufficiently initialized; init the device pointer used by the
+	 * following DSC setup, until a fix moving this to DRM core.
+	 */
+	intel_connector->base.dev = mgr->dev;
+
 	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 	intel_connector->dp.dsc_hblank_expansion_quirk =
-- 
2.44.2

