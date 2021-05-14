Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0A380F87
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 20:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2A26F3F3;
	Fri, 14 May 2021 18:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CEB6F3F4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621016146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgIOeWWeBEGw8FvntL4UYtsS5CjDmaYe8A67QE4J7Zg=;
 b=aCwdjLGGlOJxkSipTg6Xm33P0d9DZqNSmYAP7onwK7nrFXspfHxkYDSD4vcUVYEPZrSYeP
 RSqbM/DNhUjl/S18kA2yGQKb/53diuFPsRqt4Nou85xU8LBC2GiK57OmG7wcN0v7MvL5z/
 20AGv26PKz9+zwzYnRpjnj4ZXh85I9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-qQ5PDoeOMbOyIzJuviJ-yg-1; Fri, 14 May 2021 14:15:44 -0400
X-MC-Unique: qQ5PDoeOMbOyIzJuviJ-yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7FEA801106;
 Fri, 14 May 2021 18:15:42 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-140.rdu2.redhat.com
 [10.10.118.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 820301A868;
 Fri, 14 May 2021 18:15:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v6 3/9] drm/i915/dpcd_bl: Cleanup
 intel_dp_aux_vesa_enable_backlight() a bit
Date: Fri, 14 May 2021 14:14:57 -0400
Message-Id: <20210514181504.565252-4-lyude@redhat.com>
In-Reply-To: <20210514181504.565252-1-lyude@redhat.com>
References: <20210514181504.565252-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Rajeev Nandan <rajeevny@codeaurora.org>, greg.depoire@gmail.com,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get rid of the extraneous switch case in here, and just open code
edp_backlight_mode as we only ever use it once.

v4:
* Check that backlight mode is DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD, not
  DP_EDP_BACKLIGHT_CONTROL_MODE_MASK - imirkin

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 1dbe38282ebe..1ab82933afb5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -382,7 +382,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	struct intel_panel *panel = &connector->panel;
-	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
+	u8 dpcd_buf, new_dpcd_buf;
 	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
 
 	if (drm_dp_dpcd_readb(&intel_dp->aux,
@@ -393,12 +393,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	}
 
 	new_dpcd_buf = dpcd_buf;
-	edp_backlight_mode = dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 
-	switch (edp_backlight_mode) {
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PWM:
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET:
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
+	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
@@ -406,13 +402,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 				       pwmgen_bit_count) != 1)
 			drm_dbg_kms(&i915->drm,
 				    "Failed to write aux pwmgen bit count\n");
-
-		break;
-
-	/* Do nothing when it is already DPCD mode */
-	case DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD:
-	default:
-		break;
 	}
 
 	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
-- 
2.31.1

