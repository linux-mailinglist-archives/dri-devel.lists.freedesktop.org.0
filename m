Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F4308941
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 14:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539506EB2B;
	Fri, 29 Jan 2021 13:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346216EB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611926176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OAofktsrFP0xScpqpAabOLpfXYAA9LxgN1Scg+ni6F0=;
 b=Pz4umklNgB2HRkGfbJbRyg2rvr2qkD+s/nuqBpDqICPUvcfKHtO2807PkQB3y5OFmytX54
 6J/wz7eI7AayPoTN9AheLnVOVbdPNUk7/8iefBElLPU6vayAzvvmM/RJPZ35jNLdoRq6jb
 J8hrLAH5MjdHG+CWvamQmVkHmZAl6IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-1CPcMhPGPhuMt3b0jzh95g-1; Fri, 29 Jan 2021 08:16:14 -0500
X-MC-Unique: 1CPcMhPGPhuMt3b0jzh95g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B26911E4;
 Fri, 29 Jan 2021 13:16:05 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-174.ams2.redhat.com [10.36.115.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08E0A5D9C0;
 Fri, 29 Jan 2021 13:16:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/2] drm/i915/display: Add a intel_pipe_is_enabled() helper
Date: Fri, 29 Jan 2021 14:16:02 +0100
Message-Id: <20210129131603.94380-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Factor the code to check if a pipe is currently enabled out of
assert_pipe() and put it in a new intel_pipe_is_enabled() helper,
so that it can be re-used without copy-pasting it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 20 ++++++++++++++------
 drivers/gpu/drm/i915/display/intel_display.h |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 24520f062ff9..f83caceb901b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1263,17 +1263,13 @@ void assert_panel_unlocked(struct drm_i915_private *dev_priv, enum pipe pipe)
 	     pipe_name(pipe));
 }
 
-void assert_pipe(struct drm_i915_private *dev_priv,
-		 enum transcoder cpu_transcoder, bool state)
+bool intel_pipe_is_enabled(struct drm_i915_private *dev_priv,
+			   enum transcoder cpu_transcoder)
 {
 	bool cur_state;
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 
-	/* we keep both pipes enabled on 830 */
-	if (IS_I830(dev_priv))
-		state = true;
-
 	power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
 	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
 	if (wakeref) {
@@ -1285,6 +1281,18 @@ void assert_pipe(struct drm_i915_private *dev_priv,
 		cur_state = false;
 	}
 
+	return cur_state;
+}
+
+void assert_pipe(struct drm_i915_private *dev_priv,
+		 enum transcoder cpu_transcoder, bool state)
+{
+	bool cur_state = intel_pipe_is_enabled(dev_priv, cpu_transcoder);
+
+	/* we keep both pipes enabled on 830 */
+	if (IS_I830(dev_priv))
+		state = true;
+
 	I915_STATE_WARN(cur_state != state,
 			"transcoder %s assertion failure (expected %s, current %s)\n",
 			transcoder_name(cpu_transcoder),
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 5e0d42d82c11..be28d9570038 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -523,6 +523,8 @@ void intel_enable_pipe(const struct intel_crtc_state *new_crtc_state);
 void intel_disable_pipe(const struct intel_crtc_state *old_crtc_state);
 void i830_enable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe);
 void i830_disable_pipe(struct drm_i915_private *dev_priv, enum pipe pipe);
+bool intel_pipe_is_enabled(struct drm_i915_private *dev_priv,
+			   enum transcoder cpu_transcoder);
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
 int vlv_get_hpll_vco(struct drm_i915_private *dev_priv);
 int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
