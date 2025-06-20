Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC516AE1400
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AA110EB1A;
	Fri, 20 Jun 2025 06:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lh3LkXlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DD410EB0F;
 Fri, 20 Jun 2025 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401345; x=1781937345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5PbLdZJM6NzXJSalCc6Gh6xWN5l1ncgwEvwcjNWxiXk=;
 b=lh3LkXlQadnwGZbNZ5Shs8wq/iq1mUeqMb1A9Cx0llSv6pazwYnhIQ/X
 8P2LHvLvecFhntgVbVxa5Sxq06JwqmWe4S+Mef6mN4dehv40Ng1l+Vu/Q
 W/hpF4QsRHZy/Jwo7BmleGy6i5CMbtzWDBBMoFQcN/SooyzAK1BIWeBp4
 MiyTilNmNoD5asteZUKCGlhGLYrlAmCuNG1rzhGhWfb8Vh5biqKwgLsRT
 2UwBBxkSiEtWvqfJFm9IHml5xgGYROPWgZBV+e6PnuYmPpgFCikKikVDF
 fjwcrHz+UaXgMY3ZCY0v4tOkPtczcRT3pLBM3FbYvxRxDs+Bw0JLf7rgp Q==;
X-CSE-ConnectionGUID: Pm2PgOV3RBO2QyqAFEHsew==
X-CSE-MsgGUID: 6/FS6iFTQFGMMCFZIn1Ziw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701894"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:44 -0700
X-CSE-ConnectionGUID: bqL/7ekvR2eZJ0z6KEKDNg==
X-CSE-MsgGUID: gRNNsIUxTAiFWhcw2gtjDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440404"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:41 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 10/13] drm/dp: Enable backlight control using luminance
Date: Fri, 20 Jun 2025 12:04:42 +0530
Message-Id: <20250620063445.3603086-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620063445.3603086-1-suraj.kandpal@intel.com>
References: <20250620063445.3603086-1-suraj.kandpal@intel.com>
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
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index fc1eb8b7bbc1..db7896c7edb8 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4054,6 +4054,9 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
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

