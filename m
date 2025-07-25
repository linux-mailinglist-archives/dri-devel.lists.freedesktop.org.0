Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD8FB117A3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C05910E434;
	Fri, 25 Jul 2025 05:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuPR6S+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953F710E42F;
 Fri, 25 Jul 2025 05:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419879; x=1784955879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoajmhakFgk0gEWqrNc9iFSNNndjTSN2XqxcdrNtYPg=;
 b=JuPR6S+C/ctdiPxFbFQ9MIbdh/5Lxk/vQ32SGOeb+ZBzlTQ6pZ5q4aPE
 HtjSfBFG8Q1URjQK4vFTL3jqOvk7OVxOPefnW5C+iyso5b9k6VUiZz++M
 9yjPlYQ9qcDym1xjddDwxW8ptdw/TH79oLRHsIrABsdZhETazVDXrVtMF
 cIcoGm0tcu2i0HMla9zm1Ixe2jK9I2mIRr0qL4vZ6ZH/6UOENjdpiMLmr
 Gpg7+EsELAmaJs4zSB5P12nkMy/ujVBR4d+2MqAeiHEMcD9uaUBt7HvVW
 G36I9mYxqXokcY+AksEYHO9S3pEfzxCSbL42W9PLbPdGYgrnHdfJPS3jf w==;
X-CSE-ConnectionGUID: DCUGgpLSQHyRXMyV/pvsLQ==
X-CSE-MsgGUID: cx6K/1i1Tf6PK7TAe1XYtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299534"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:39 -0700
X-CSE-ConnectionGUID: jbozSNYvSjew0VVI6LtBVw==
X-CSE-MsgGUID: qCDQ0uwkTLiutVyXZEzwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956609"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:37 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/28] drm/i915/writeback: Add hook to check modes
Date: Fri, 25 Jul 2025 10:33:51 +0530
Message-Id: <20250725050409.2687242-11-suraj.kandpal@intel.com>
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

Add connector helper hooks to check if mode is valid or not.
We add this restriction to make sure mode is 3840x2160 60Hz.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 7df99771fd6f..ff5f15ce3f5f 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -75,6 +75,25 @@ intel_writeback_connector_alloc(struct intel_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+intel_writeback_mode_valid(struct drm_connector *_connector,
+			   const struct drm_display_mode *mode)
+{
+	int refresh_rate;
+
+	if (mode->hdisplay > 3840)
+		return MODE_H_ILLEGAL;
+
+	if (mode->vdisplay > 2160)
+		return MODE_V_ILLEGAL;
+
+	refresh_rate = drm_mode_vrefresh(mode);
+	if (refresh_rate > 60)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
 static int intel_writeback_get_modes(struct drm_connector *connector)
 {
 	return drm_add_modes_noedid(connector, 3840, 2160);
@@ -112,6 +131,7 @@ const struct drm_connector_funcs conn_funcs = {
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.get_writeback_connector = intel_get_writeback_connector,
 	.get_modes = intel_writeback_get_modes,
+	.mode_valid = intel_writeback_mode_valid,
 };
 
 static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
-- 
2.34.1

