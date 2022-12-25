Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D593656114
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 09:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9610E1B9;
	Mon, 26 Dec 2022 08:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Sun, 25 Dec 2022 19:03:20 UTC
Received: from forward104o.mail.yandex.net (forward104o.mail.yandex.net
 [37.140.190.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04CE10E0A4;
 Sun, 25 Dec 2022 19:03:20 +0000 (UTC)
Received: from iva2-656890eaceb5.qloud-c.yandex.net
 (iva2-656890eaceb5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:6902:0:640:6568:90ea])
 by forward104o.mail.yandex.net (Yandex) with ESMTP id 3FF3965D364D;
 Sun, 25 Dec 2022 21:55:28 +0300 (MSK)
Received: by iva2-656890eaceb5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id PtSiBVLYnSw1-ulrl9j4Y; Sun, 25 Dec 2022 21:55:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skif-web.ru; s=mail;
 t=1671994527; bh=iy4Od4RVHqYXYNH+uE4Skx6pnQbptFi0CvgCUrJzDyU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=cce3df4d7VmoYXdrsOIu7YTdL0tcUTTQphxLJY1ocSMGEwsSMh2CInXYMUWe/9MCL
 TzR7Tk2hAl5E5r1FTH5AqPAGnAi14fwmXMINmfUguLnZtGS6vXbKNE/3OfYp0063QJ
 w8jiktL+fpKnBGq22vs25hjaaD91gaNSZBRPKAI4=
Authentication-Results: iva2-656890eaceb5.qloud-c.yandex.net;
 dkim=pass header.i=@skif-web.ru
From: Alexey Lukyanchuk <skif@skif-web.ru>
To: tvrtko.ursulin@linux.intel.com
Subject: [PATCH v2] drm/i915: dell wyse 3040 shutdown fix
Date: Sun, 25 Dec 2022 21:55:08 +0300
Message-Id: <20221225185507.149677-1-skif@skif-web.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221225184413.146916-1-skif@skif-web.ru>
References: <20221225184413.146916-1-skif@skif-web.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Dec 2022 08:19:37 +0000
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
Cc: dri-devel@lists.freedesktop.org, Alexey Lukyanchuk <skif@skif-web.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dell wyse 3040 doesn't peform poweroff properly, but instead remains in 
turned power on state. Additional mutex_lock and 
intel_crtc_wait_for_next_vblank 
feature 6.2 kernel resolve this trouble.

cc: stable@vger.kernel.org
original commit Link: https://patchwork.freedesktop.org/patch/508926/
fixes: fe0f1e3bfdfeb53e18f1206aea4f40b9bd1f291c
Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
I got some troubles with this device (dell wyse 3040) since kernel 5.11
started to use i915_driver_shutdown function. I found solution here:

https://lore.kernel.org/dri-devel/Y1wd6ZJ8LdJpCfZL@intel.com/#r

---
 drivers/gpu/drm/i915/display/intel_audio.c | 37 +++++++++++++++-------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index aacbc6da8..44344ecdf 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -336,6 +336,7 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct drm_connector_state *old_conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	u32 eldv, tmp;
 
 	tmp = intel_de_read(dev_priv, G4X_AUD_VID_DID);
@@ -348,6 +349,9 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
 	tmp = intel_de_read(dev_priv, G4X_AUD_CNTL_ST);
 	tmp &= ~eldv;
 	intel_de_write(dev_priv, G4X_AUD_CNTL_ST, tmp);
+
+	intel_crtc_wait_for_next_vblank(crtc);
+	intel_crtc_wait_for_next_vblank(crtc);
 }
 
 static void g4x_audio_codec_enable(struct intel_encoder *encoder,
@@ -355,12 +359,15 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
 	const u8 *eld = connector->eld;
 	u32 eldv;
 	u32 tmp;
 	int len, i;
 
+	intel_crtc_wait_for_next_vblank(crtc);
+
 	tmp = intel_de_read(dev_priv, G4X_AUD_VID_DID);
 	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
 		eldv = G4X_ELDV_DEVCL_DEVBLC;
@@ -493,6 +500,7 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 				    const struct drm_connector_state *old_conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	u32 tmp;
 
@@ -508,6 +516,10 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
 		tmp |= AUD_CONFIG_N_VALUE_INDEX;
 	intel_de_write(dev_priv, HSW_AUD_CFG(cpu_transcoder), tmp);
 
+
+	intel_crtc_wait_for_next_vblank(crtc);
+	intel_crtc_wait_for_next_vblank(crtc);
+
 	/* Invalidate ELD */
 	tmp = intel_de_read(dev_priv, HSW_AUD_PIN_ELD_CP_VLD);
 	tmp &= ~AUDIO_ELD_VALID(cpu_transcoder);
@@ -633,6 +645,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 				   const struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_connector *connector = conn_state->connector;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	const u8 *eld = connector->eld;
@@ -651,12 +664,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
 	tmp &= ~AUDIO_ELD_VALID(cpu_transcoder);
 	intel_de_write(dev_priv, HSW_AUD_PIN_ELD_CP_VLD, tmp);
 
-	/*
-	 * FIXME: We're supposed to wait for vblank here, but we have vblanks
-	 * disabled during the mode set. The proper fix would be to push the
-	 * rest of the setup into a vblank work item, queued here, but the
-	 * infrastructure is not there yet.
-	 */
+	intel_crtc_wait_for_next_vblank(crtc);
 
 	/* Reset ELD write address */
 	tmp = intel_de_read(dev_priv, HSW_AUD_DIP_ELD_CTRL(cpu_transcoder));
@@ -705,6 +713,8 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 		aud_cntrl_st2 = CPT_AUD_CNTRL_ST2;
 	}
 
+	mutex_lock(&dev_priv->display.audio.mutex);
+
 	/* Disable timestamps */
 	tmp = intel_de_read(dev_priv, aud_config);
 	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
@@ -721,6 +731,10 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
 	tmp = intel_de_read(dev_priv, aud_cntrl_st2);
 	tmp &= ~eldv;
 	intel_de_write(dev_priv, aud_cntrl_st2, tmp);
+	mutex_unlock(&dev_priv->display.audio.mutex);
+
+	intel_crtc_wait_for_next_vblank(crtc);
+	intel_crtc_wait_for_next_vblank(crtc);
 }
 
 static void ilk_audio_codec_enable(struct intel_encoder *encoder,
@@ -740,12 +754,7 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 	if (drm_WARN_ON(&dev_priv->drm, port == PORT_A))
 		return;
 
-	/*
-	 * FIXME: We're supposed to wait for vblank here, but we have vblanks
-	 * disabled during the mode set. The proper fix would be to push the
-	 * rest of the setup into a vblank work item, queued here, but the
-	 * infrastructure is not there yet.
-	 */
+	intel_crtc_wait_for_next_vblank(crtc);
 
 	if (HAS_PCH_IBX(dev_priv)) {
 		hdmiw_hdmiedid = IBX_HDMIW_HDMIEDID(pipe);
@@ -767,6 +776,8 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 
 	eldv = IBX_ELD_VALID(port);
 
+	mutex_lock(&dev_priv->display.audio.mutex);
+
 	/* Invalidate ELD */
 	tmp = intel_de_read(dev_priv, aud_cntrl_st2);
 	tmp &= ~eldv;
@@ -798,6 +809,8 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
 	else
 		tmp |= audio_config_hdmi_pixel_clock(crtc_state);
 	intel_de_write(dev_priv, aud_config, tmp);
+
+	mutex_unlock(&dev_priv->display.audio.mutex);
 }
 
 /**
-- 
2.25.1

