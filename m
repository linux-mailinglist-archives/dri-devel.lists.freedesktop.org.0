Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87911A876D1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5887410E48D;
	Mon, 14 Apr 2025 04:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZINEB2yW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FA910E49C;
 Mon, 14 Apr 2025 04:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744604257; x=1776140257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1DSYqLvhL71Dq1J5FVsP3c+LzX+lWgw669dEtaICXU8=;
 b=ZINEB2yW0qKiWMm2eBi9T6+QJb5EQEH1PggjkMsLNuyo04zWvlqbUgZv
 /SdIoT7iiJYKl6N6hW4N5RaGQ7zb4C05U8tyBDZP9SOvbTRF43N7slUdW
 77FleMGW124L3qwkrq2sjeCZPv7mpi71MxLh4GR7K47bsHKx+V6Ca84CP
 aYtauZjve4O/yFQeCEROpvakb5U6fOxhxmy3Qp1GeOkMAri+m8AhTiruF
 usDT4JsKpYqtWjwRb3MSkPdmPFxmtpqy/ZiPsXbp7n3YOBCAWkoO8Ru2u
 NvqlRZZdNtFc2mx9kmM8g7sdU9JLBHlFl9mLnT7ZyIjOoV/xiEMJtKml/ Q==;
X-CSE-ConnectionGUID: egJDZZB0TSK5gTOL8+m+dA==
X-CSE-MsgGUID: 7OgZvlYrQDqTvRSQSw5VQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46070053"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46070053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2025 21:17:37 -0700
X-CSE-ConnectionGUID: ut9deEPxQeKEQh4xBbxWcg==
X-CSE-MsgGUID: V5Dw65RESqaXNPqCLuTX0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="160658110"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Apr 2025 21:17:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 10/13] drm/dp: Enable backlight control using luminance
Date: Mon, 14 Apr 2025 09:46:34 +0530
Message-Id: <20250414041637.128039-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414041637.128039-1-suraj.kandpal@intel.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
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

Add flag to enable brightness control via luminance value
when enabling edp backlight.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 0421b2ed9bd4..4e2caba8311a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4030,6 +4030,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	else
 		dpcd_buf = DP_EDP_BACKLIGHT_CONTROL_MODE_PWM;
 
+	if (bl->luminance_set)
+		dpcd_buf |= DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE;
+
 	if (bl->pwmgen_bit_count) {
 		ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
 		if (ret < 0)
-- 
2.34.1

