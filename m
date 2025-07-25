Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6E2B117AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D6010E44B;
	Fri, 25 Jul 2025 05:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At9Zix7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4C510E447;
 Fri, 25 Jul 2025 05:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419893; x=1784955893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aMqnQp39adZ5U6riy9urJUZyDEnBmYcw+8h+VwmNY7Y=;
 b=At9Zix7AahBJk8GWBKRl+rJCOptPN5ga8v0AtnplrqpUumiCAGpR7aYp
 Cbv2RWblambc/giiG0n/l+KDju06oLMs74LZ2qENNhgI9z5way5tQlk8H
 h1tFC5Na97hB/W9pjyO2HGkF1n4KC3Jna4TCD7IZmkEwJ9/WIKA4YY99Y
 VNGkJZTF2wi4H6Ko0DNdTPL6gznpOco6LI2P83oXgRtToyFQPKx6/dZGb
 XMyES9dw4iEAPk9yIq9uJY0Ppdk93lQTxTZk/NXl8uFx2/xtvjm53TCTc
 E/0ClnwO8Iq6LNRzVIL71j0vJxPbqDrzzIr/vo+9QoVdZrvELIeBORWOV Q==;
X-CSE-ConnectionGUID: 9S5oCODaQXmo4ITECo9Kng==
X-CSE-MsgGUID: l7G+5drjS8SniyrPyr2Zvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299549"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:53 -0700
X-CSE-ConnectionGUID: dh2DC3BSSM6w4Bv9K4LIaA==
X-CSE-MsgGUID: 5iVbYGTcR8qa+eIQMo3JuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956637"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:50 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 16/28] drm/i915/writeback: Define function for connector
 function detect
Date: Fri, 25 Jul 2025 10:33:57 +0530
Message-Id: <20250725050409.2687242-17-suraj.kandpal@intel.com>
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

detect function always returns connector_status_connected if
writeback connector has been initialized.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 3ea09587c4c2..def33191a89e 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -173,6 +173,13 @@ static void intel_writeback_cleanup_job(struct drm_writeback_connector *connecto
 	job->priv = NULL;
 }
 
+static enum drm_connector_status
+intel_writeback_detect(struct drm_connector *connector,
+		       bool force)
+{
+	return connector_status_connected;
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -197,6 +204,7 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 };
 
 const struct drm_connector_funcs conn_funcs = {
+	.detect = intel_writeback_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-- 
2.34.1

