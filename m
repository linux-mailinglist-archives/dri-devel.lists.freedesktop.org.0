Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EAEAE13ED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435510EAF4;
	Fri, 20 Jun 2025 06:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPUzbzFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39DC10EAFA;
 Fri, 20 Jun 2025 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750401322; x=1781937322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O0ZYIQTMlsBn4R2CFWsKzgTqN+tlmtJ0lK1HCME9Ves=;
 b=lPUzbzFWSsmwl9WHQA++8gbiMRpVpgIYj201ZuIR1IM9yrnDj9KxuPwl
 5eMmd1zsD6vWmF202ZNqlK9l00gEolS9r/6JRj6/W3qj3erlP5Y2gPeU7
 l3su6nM8cvujHdQaXAvDy+CCijThi92H4EQB+vJZLuamyq5uYFqjLNKP1
 e2tMP7mCC9Wwvv94Jgy/cB55hK5ER88c59ljdISkRoUO/yQVRCnhiKT/l
 Dcy4/wTxmjsz8WQX2W4DVG6QEC1At/RX7TjSsV/0E/pW9a0FUJ1cmHFFw
 i1zJ9Cow1gKnMtnLu+BRu86D2kIxfW0njhFPKjU7tKOh3x5ikC25H6qes g==;
X-CSE-ConnectionGUID: RyeUyOMAS2q1qiOnt+DFoQ==
X-CSE-MsgGUID: TWT1bX/QSz2bjBeNJXEFeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63701844"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="63701844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:35:22 -0700
X-CSE-ConnectionGUID: bgwe5nWMTqS27RoTrPOTHg==
X-CSE-MsgGUID: y+POU4UOR3egMXHyA4m9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174440306"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 23:35:19 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 04/13] drm/dp: Move from u16 to u32 for max in
 drm_edp_backlight_info
Date: Fri, 20 Jun 2025 12:04:36 +0530
Message-Id: <20250620063445.3603086-5-suraj.kandpal@intel.com>
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

Use u32 instead of u16 for max variable in drm_edp_backlight_info
since it can now hold max luminance range value which is u32.
We will set this max with max_luminance value when luminance_set is
true.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 10 +++++++---
 include/drm/display/drm_dp_helper.h     |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 9df95776d1cb..90b23f78a12d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4293,9 +4293,13 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		return -EINVAL;
 	}
 
-	ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
-	if (ret < 0)
-		return ret;
+	if (bl->luminance_set) {
+		bl->max = max_luminance;
+	} else {
+		ret = drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_dpcd);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = drm_edp_backlight_probe_state(aux, bl, current_mode);
 	if (ret < 0)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 91094a38594c..6176e0b5ea1a 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -850,7 +850,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
 struct drm_edp_backlight_info {
 	u8 pwmgen_bit_count;
 	u8 pwm_freq_pre_divider;
-	u16 max;
+	u32 max;
 
 	bool lsb_reg_used : 1;
 	bool aux_enable : 1;
-- 
2.34.1

