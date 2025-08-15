Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53AB28293
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 17:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52410E970;
	Fri, 15 Aug 2025 15:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="vMoisADC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com
 [203.205.221.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255B410E35F;
 Fri, 15 Aug 2025 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1755247225; bh=bHWE4AORGxV5tQB74wROjNY5YvD7d9GgkwOBcOZ8ZC4=;
 h=From:To:Cc:Subject:Date;
 b=vMoisADCMUarjtUdwQ3kZtNHTmDlw5sdPEMwpghOPR72BBMo68l0TstM9je6Ywcmj
 SsrYBh4x6b+AzzzMKKwbp/L6o4M9/JeHoZlhTqLeyAHUy1df4hODr25iIt4AdCSDXA
 xh/er3OnaICpTpXC9Va4d0Gtud9mGvO6dvonPqGo=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszb23-0.qq.com (NewEsmtp) with SMTP
 id 9B72EA7A; Fri, 15 Aug 2025 16:38:55 +0800
X-QQ-mid: xmsmtpt1755247135timb70iz3
Message-ID: <tencent_E5B1CAABB0320691EB730CDB19E55EA85E05@qq.com>
X-QQ-XMAILINFO: Nr4sKL92GIu+vW/ICYMcGdH9uS9e6ADBfUWXi1HsqoqwfNXlNmPVV8tTT6tNHT
 a75U8BkZvsrfRFH7JpUHvdSfnI6+uf9NDv3Bz+MOpv94QKUBiS8+KVJPmcbuX/SXGlwDUuK5QVSV
 Q+R6e/Kw9ab3JAOIhzzJWuxl6VO55dvaPRWSC7G1Th0aJ03kWyftqmvqcO2fruaBCDqCz+TBtlXM
 PhvNMKoTr0lGgbYYNSQvPOEUPQzU3xNOTvVwAkGLF17eluRPpQdtf5IftMc1Ha+jC0HTgpVZnol3
 xt2QQ0e1OLJ9kbw8P0O7ZfcsK2npv+UswTG6HGypTEFn3RRveN8pp5XMTUCR4ig1RnSsKWNuamPR
 i2zzCZ/wP7e9uq4Ovxz/qC0+G89y+f1XqCqQYcJ6xvWcgSIQgU1U/w6S7VZOrWKFZSVzV49hV60y
 WV8b50uEvoR/djJH2voqdb71t54DuEKoBE0yflNR8L7tXBf9Oc3iOZIAHIJG8VypZS/tWw8Vgw6B
 aEfjKpltwSXyUkiHUrX8TzFRr3hbSlN7IflwtaglL8iJaRag/N7x5o9aqYyarJRW7fStE8BkB0PB
 OFSBsqwKMLyQbn7CFlQYed74axx1v4hNCv7pNA48D8GAgbVgStYAiBJtbFqc7Mq01JEdR2JUQIrk
 o6Pn62Pn59cSpd+Gb6qJMrDP6DvXYMbWKgBQAPrGfVFMRy614Ua4lKjfs6P2dvh0jiwXce3Jmmt+
 sjGyie+idrWmPWOKOfAMEUNa/ee8geljug5bIipLsRiF4FhHhYT3+X7eRn1xE4GCUFO5SsrPFJKp
 kK4jdPVX+uWOPCG7rEW6nOVTb67b+DVMGA2znTNSAjfxa+uPsFInujZqwjy6RWcOl6p10ZL8Htt4
 Ywd6Iij/HmuiRdU072fH6wdQtQWPNzzk1XbpH7WWSeNOjCPXRwtz+PjK6u5j/Wwdkp4amDkE9fQp
 AzDCN/IKAhlkZLjU13W1dBdN1XIxkJVF49aogkwhg=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: 2564278112@qq.com
To: alex.williamson@redhat.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, alexandre.f.demers@gmail.com, boyuan.zhang@amd.com,
 jiangwang@kylinos.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fixed an issue where audio did not turn off
 properly after unplugging HDMI
Date: Fri, 15 Aug 2025 16:38:51 +0800
X-OQ-MSGID: <20250815083851.1417451-1-2564278112@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Aug 2025 15:04:06 +0000
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

From: Wang Jiang <jiangwang@kylinos.cn>

In commit 3c021931023a ("drm/amdgpu: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi")',
the method for determining connector types has been modified.
After the modification, when disconnecting the monitor, the information from the previous connection cannot be retrieved,
because display_info.is_hdmi has been reset, resulting in the connector type returned as dvi.
On AMD Oland and other cards, the audio driver determines whether to turn off audio based on connector type
However, when the monitor is disconnected, the information from the previous connection cannot be obtained, resulting in the inability to turn off the audio.
I don't understand why this is being done, I think the right thing to do is to decide whether or not to enable audio based on whether the connector has audio.
This commit modifies the code to retrieve audio information from the connected EDID.
Now, the decision to turn audio on/off is based on the audio information in the EDID.

Signed-off-by: Wang Jiang <jiangwang@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 276c025c4c03..c56b2027d53e 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -3253,17 +3253,22 @@ static void dce_v6_0_encoder_mode_set(struct drm_encoder *encoder,
 			  struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
-	int em = amdgpu_atombios_encoder_get_encoder_mode(encoder);
-
+	struct drm_connector *connector;
+	struct amdgpu_connector *amdgpu_connector = NULL;
 	amdgpu_encoder->pixel_clock = adjusted_mode->clock;
 
 	/* need to call this here rather than in prepare() since we need some crtc info */
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
+	connector = amdgpu_get_connector_for_encoder_init(encoder);
+	amdgpu_connector = to_amdgpu_connector(connector);
+	if (!amdgpu_connector) {
+		DRM_ERROR("Couldn't find encoder's connector\n");
+	}
 
 	/* set scaler clears this on some chips */
 	dce_v6_0_set_interleave(encoder->crtc, mode);
 
-	if (em == ATOM_ENCODER_MODE_HDMI || ENCODER_MODE_IS_DP(em)) {
+	if (drm_detect_monitor_audio(amdgpu_connector_edid(connector))) {
 		dce_v6_0_afmt_enable(encoder, true);
 		dce_v6_0_afmt_setmode(encoder, adjusted_mode);
 	}
@@ -3322,12 +3327,18 @@ static void dce_v6_0_encoder_disable(struct drm_encoder *encoder)
 {
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
 	struct amdgpu_encoder_atom_dig *dig;
-	int em = amdgpu_atombios_encoder_get_encoder_mode(encoder);
+	struct drm_connector *connector;
+	struct amdgpu_connector *amdgpu_connector = NULL;
 
 	amdgpu_atombios_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
+	connector = amdgpu_get_connector_for_encoder_init(encoder);
+	amdgpu_connector = to_amdgpu_connector(connector);
+	if (!amdgpu_connector) {
+		DRM_ERROR("Couldn't find encoder's connector\n");
+	}
 
 	if (amdgpu_atombios_encoder_is_digital(encoder)) {
-		if (em == ATOM_ENCODER_MODE_HDMI || ENCODER_MODE_IS_DP(em))
+		if (drm_detect_monitor_audio(amdgpu_connector_edid(connector)))
 			dce_v6_0_afmt_enable(encoder, false);
 		dig = amdgpu_encoder->enc_priv;
 		dig->dig_encoder = -1;
-- 
2.25.1

