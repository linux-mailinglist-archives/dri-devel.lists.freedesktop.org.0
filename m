Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A16B117A0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A56110E41D;
	Fri, 25 Jul 2025 05:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewiC+339";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72210E43B;
 Fri, 25 Jul 2025 05:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419877; x=1784955877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wTbQqTQ4780wPxB15+Gvbvqkp1btMS/1ws93v/cqVc=;
 b=ewiC+3391NjGSOcCxyn6k1y/nXhqLKrHA/FkmJ8JahoDBovr39qZOE87
 jHy1YhBhzHJBV9R8Bltxs6hqJbE91I4Om6ImWRDpEcW8RC9OwGr+JflTe
 c0/2GAcvPESuKLyIjir30NrfbH1K+oedp0+qQE/nfQrfrNyc1EQmEhaXK
 DHo+npvWuu2jnCU/6k32XHvUFPFDqrXMSEtlB+rl3SpnWPSfEVb7UUNkJ
 7D/eWL6v5ETWRBIrgU4t1U9Md2uBFW0xgBnoDHMnYQuJsTxsX4DDI9YF6
 4n65ua4olx77vxE3cSPVSSsb00Iz0F7680OgSG8LvwZBD7WEEZ9rxAqF5 A==;
X-CSE-ConnectionGUID: 5yd6GvjDSdesgTLhNiHVqA==
X-CSE-MsgGUID: F9ZNVYYqRW6BL+vtJ5maoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299531"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299531"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:37 -0700
X-CSE-ConnectionGUID: p3S05d0ZTa2BpLDVilvZyw==
X-CSE-MsgGUID: l9DU19myRCu/q2rnhV0Gqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956596"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 09/28] drm/i915/writeback: Add function to get modes
Date: Fri, 25 Jul 2025 10:33:50 +0530
Message-Id: <20250725050409.2687242-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Add a function that get modes for writeback connector.
Since we have a restriction on supporting only 3840x2160 60Hz modes
at max we will create modes only up until that point.

Bspec: 49275
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 02f4910d7797..7df99771fd6f 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -10,6 +10,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_edid.h>
 
 #include "i915_drv.h"
 #include "intel_atomic.h"
@@ -74,6 +75,11 @@ intel_writeback_connector_alloc(struct intel_connector *connector)
 	return 0;
 }
 
+static int intel_writeback_get_modes(struct drm_connector *connector)
+{
+	return drm_add_modes_noedid(connector, 3840, 2160);
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -105,6 +111,7 @@ const struct drm_connector_funcs conn_funcs = {
 
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.get_writeback_connector = intel_get_writeback_connector,
+	.get_modes = intel_writeback_get_modes,
 };
 
 static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
-- 
2.34.1

