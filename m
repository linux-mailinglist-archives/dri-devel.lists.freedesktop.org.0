Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40599B117A2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B004E10E42B;
	Fri, 25 Jul 2025 05:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpqgAROz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208D910E429;
 Fri, 25 Jul 2025 05:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419873; x=1784955873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4WHYzHj8kpYNB+A6uXs2t6ODOYc+39lw/W9q72f5BI=;
 b=lpqgAROzDl1P11M3B0cAp5fat1NgGtYeuzb314rUrB7nVeIVDfP/fKsX
 ZhOtWo6m6TnmnfKcui//CQ8HwQE55kcPGY5C5bRR9XUXo7Yi6mNfPMnbG
 SkmtgvF19ZIku/HDT+u0Y+EAnqJqI7GNEVvsYU62au2YXeK4h/+mgNE96
 8zNvK+kN32aw8f+t1RttfgcBmPAtvkbljcgliE81yEkdwiZPqecaozws/
 xA9TM3L6ww0G4pmEA+p1VPXWI9MIqHUZk8R+zmNk7cBAmNvBf/NNATC47
 5v5FP1PZ9BI9pZioStXYxLuMcLfHZjL3mwjjSm+YtFkFsEX3Cx89H1PLH A==;
X-CSE-ConnectionGUID: HC3YwisiTnu77SgDhlh+mQ==
X-CSE-MsgGUID: 3gClJAZuSUm0YWfChYxLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299524"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:33 -0700
X-CSE-ConnectionGUID: Ppl8guanQm2BdHeTdjGptg==
X-CSE-MsgGUID: UMgQGaTvS5uFzYShw0xsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956549"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:30 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 07/28] drm/i915/writeback: Add function for
 get_writeback_connector
Date: Fri, 25 Jul 2025 10:33:48 +0530
Message-Id: <20250725050409.2687242-8-suraj.kandpal@intel.com>
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

Define function to get_writeback_connector which returns the
drm_writeback_connector given the drm_connector.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index f3843ac9b026..1ff078a191df 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -36,6 +36,13 @@ static const u32 writeback_formats[] = {
 	DRM_FORMAT_XBGR2101010,
 };
 
+static struct intel_writeback_connector
+*conn_to_intel_writeback_connector(struct intel_connector *connector)
+{
+	return container_of(connector, struct intel_writeback_connector,
+			    connector);
+}
+
 static int intel_writeback_connector_init(struct intel_connector *connector)
 {
 	struct intel_digital_connector_state *conn_state;
@@ -60,6 +67,16 @@ intel_writeback_connector_alloc(struct intel_connector *connector)
 	return 0;
 }
 
+static struct drm_writeback_connector *
+intel_get_writeback_connector(struct drm_connector *connector)
+{
+	struct intel_connector *conn = to_intel_connector(connector);
+	struct intel_writeback_connector *wb_conn =
+		conn_to_intel_writeback_connector(conn);
+
+	return &wb_conn->base;
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -71,6 +88,7 @@ const struct drm_connector_funcs conn_funcs = {
 };
 
 static const struct drm_connector_helper_funcs conn_helper_funcs = {
+	.get_writeback_connector = intel_get_writeback_connector,
 };
 
 static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
-- 
2.34.1

