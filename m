Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FD438A77
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 17:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2586E160;
	Sun, 24 Oct 2021 15:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED46E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635090632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bfLfimrUvqbu/6ah4vDLzD9ejhn1HthsyzwipdT3dvI=;
 b=NcHqGz+bMIC9nGkK+8xfjESrt7GQsLrIqUWbJQyE3OQPm5EAnN4fB+C6zK66pLIS8rvNNz
 xFves7X1dnfiA6jKS93XEdqCGVn+T1CG9Ndv0CyRzXp3Kbrre1FxU09+4Crth3/ribUaoS
 UHzjXKFXtEgVTtC3CNORNeyu4mOYtqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-981J1C4XMROBq5PU68ZtjA-1; Sun, 24 Oct 2021 11:50:26 -0400
X-MC-Unique: 981J1C4XMROBq5PU68ZtjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5124510A8E02;
 Sun, 24 Oct 2021 15:50:25 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C55717CDB;
 Sun, 24 Oct 2021 15:50:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Subject: [PATCH] drm/i915/vlv_dsi: Double pixelclock on read-back for
 dual-link panels
Date: Sun, 24 Oct 2021 17:50:20 +0200
Message-Id: <20211024155020.126328-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

In intel_dsi_get_config() double the pclk returned by foo_dsi_get_pclk()
for dual-link panels. This fixes the following WARN triggering:

 i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in pixel_rate (expected 235710, found 118056)
 i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in hw.pipe_mode.crtc_clock (expected 235710, found 118056)
 i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in hw.adjusted_mode.crtc_clock (expected 235710, found 118056)
 i915 0000:00:02.0: [drm] *ERROR* [CRTC:51:pipe A] mismatch in port_clock (expected 235710, found 118056)
 ------------[ cut here ]------------
 pipe state doesn't match!
 WARNING: CPU: 3 PID: 136 at drivers/gpu/drm/i915/display/intel_display.c:9125 intel_display_finish_reset+0x1bd3/0x2050 [i915]
 ...

This has been tested on a Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC) tablet,
with a 1536x2048 dual-link DSI panel.

Note this fix was taken from icl_dsi.c which does the same in
its get_config().

Cc: Tsuchiya Yuto <kitakar@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 3e646a58b38a..2b7909bc52ff 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1265,7 +1265,9 @@ static void intel_dsi_get_config(struct intel_encoder *encoder,
 				 struct intel_crtc_state *pipe_config)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	u32 pclk;
+
 	drm_dbg_kms(&dev_priv->drm, "\n");
 
 	pipe_config->output_types |= BIT(INTEL_OUTPUT_DSI);
@@ -1277,6 +1279,9 @@ static void intel_dsi_get_config(struct intel_encoder *encoder,
 		pclk = vlv_dsi_get_pclk(encoder, pipe_config);
 	}
 
+	if (intel_dsi->dual_link)
+		pclk *= 2;
+
 	if (pclk) {
 		pipe_config->hw.adjusted_mode.crtc_clock = pclk;
 		pipe_config->port_clock = pclk;
-- 
2.31.1

