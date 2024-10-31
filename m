Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B071F9B790B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 11:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE0010E85B;
	Thu, 31 Oct 2024 10:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Bk7yOG8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28FB10E859
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 10:52:26 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5ebc0dbc566so445257eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730371946; x=1730976746;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B0RijCjWMMCWK6RFX8dTzbGJL7F/gEsY8vJbxOz9FOk=;
 b=Bk7yOG8ocNiHDQF4GXmvaDXk7fpegvo70rxsLJSohBaGVLEjNsovM548GCs9KtH0NW
 LRYJYWPBaa2GzZ89EQ/nMp0HRQmXcJ4oWyXs2m4nvXXaQpBO2AXzZendC9i9f5krnleM
 LI9EKyZSbc29LDVOEAZHNorb/iR+OJq8RPM3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730371946; x=1730976746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0RijCjWMMCWK6RFX8dTzbGJL7F/gEsY8vJbxOz9FOk=;
 b=etBCeKpfQAk+UPwSfCs6cmmCHkiDyc0Xsc1G7rzg8I2dIbPFBMvR16rEfb3QsJvz90
 zH7Y0WLGVodxpCy0+icMwt7q1pund0TwLRf3B5jDWaS9WA6gL3Njf1ru4Xt5UUH7Pqh3
 L4DlE/i0RXNzZE6ncQm8f1Rr9apr3y5TIOxn7AV1/bRzVfRQR8xERM3aivn3/6tnWnjU
 NtCg1/0cs13gTeTlFfVd8nqxVow8XdqLGlvNBnqVUEPTquDhAvyr9x2ubWghYklfUH3P
 EVgBcM+q8J749P1w6/cmLa9Ey2sA4Gq9PIekHg4MH6OBveVJazDOBOOcIOpphbipUOIr
 qiKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB9uN8rgN1Dx+nzsSZEQ1rftbZKjdFRB8cI2pA4QmaHCWubg/dLFwxAjLVFkhyDasJe/UcIkarjgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSv4dN0poFWOPAlLQjM43YAQPFRXQ2F9hTpwmKNGrySwSTZAx7
 ZcyTqtJ8edr/7R8rWnmAFtdQOwV1045VOsjSmnQE8e5OMj3r3lZ/kQisHEk38w==
X-Google-Smtp-Source: AGHT+IGhROHzfCHv2jjUciB3ZIms9hOcT9wSKCkXAuoxuowe5h9El6rdUQbUiLuPYvDr7Eadop4lVA==
X-Received: by 2002:a05:6870:9112:b0:277:fe14:e68c with SMTP id
 586e51a60fabf-29051d75b27mr16139023fac.33.1730371945863; 
 Thu, 31 Oct 2024 03:52:25 -0700 (PDT)
Received: from tigerii.tok.corp.google.com
 ([2401:fa00:8f:203:4470:8fa8:957a:6c05])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee459f8fb9sm839099a12.61.2024.10.31.03.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 03:52:25 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
Date: Thu, 31 Oct 2024 19:51:35 +0900
Message-ID: <20241031105145.2140590-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
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

	*** RFC ***

intel_ddi_init() may skip connector initialization, for instance,
both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
are optional.  This leads to situation that ->attached_connector may
be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
and 'DDI TC1/PHY TC1' are not initialized.

However, functions like intel_dp_dual_mode_set_tmds_output() and
friends don't take this into consideration.  This leads to NULL
ptr-derefs:

KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
Call Trace:
<TASK>
i915_driver_shutdown+0x2d8/0x490
pci_device_shutdown+0x83/0x150
device_shutdown+0x4ad/0x660
__se_sys_reboot+0x29c/0x4d0
do_syscall_64+0x60/0x90

Add a new helper to avoid NULL ->attached_connector derefs and
switch some intel_hdmi function to it.  I'm not sure if we need
to switch all or just intel_dp_dual_mode_set_tmds_output() (I
have only seen this one doing NULL derefs so far).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 27 ++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index e1a1351bc94f..c089dd20972b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1256,12 +1256,19 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 			      &crtc_state->infoframes.drm);
 }
 
+static struct i2c_adapter *to_ddc(struct intel_hdmi *hdmi)
+{
+	if (hdmi->attached_connector)
+		return hdmi->attached_connector->base.ddc;
+	return NULL;
+}
+
 void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 {
 	struct intel_display *display = to_intel_display(hdmi);
-	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
+	struct i2c_adapter *ddc = to_ddc(hdmi);
 
-	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
+	if (!ddc || hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
 		return;
 
 	drm_dbg_kms(display->drm, "%s DP dual mode adaptor TMDS output\n",
@@ -1275,7 +1282,7 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 				unsigned int offset, void *buffer, size_t size)
 {
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
+	struct i2c_adapter *ddc = to_ddc(hdmi);
 	int ret;
 	u8 start = offset & 0xff;
 	struct i2c_msg msgs[] = {
@@ -1292,6 +1299,10 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 			.buf = buffer
 		}
 	};
+
+	if (!ddc)
+		return -EINVAL;
+
 	ret = i2c_transfer(ddc, msgs, ARRAY_SIZE(msgs));
 	if (ret == ARRAY_SIZE(msgs))
 		return 0;
@@ -1302,11 +1313,14 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
 				 unsigned int offset, void *buffer, size_t size)
 {
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
+	struct i2c_adapter *ddc = to_ddc(hdmi);
 	int ret;
 	u8 *write_buf;
 	struct i2c_msg msg;
 
+	if (!ddc)
+		return -EINVAL;
+
 	write_buf = kzalloc(size + 1, GFP_KERNEL);
 	if (!write_buf)
 		return -ENOMEM;
@@ -1335,9 +1349,12 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 {
 	struct intel_display *display = to_intel_display(dig_port);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
+	struct i2c_adapter *ddc = to_ddc(hdmi);
 	int ret;
 
+	if (!ddc)
+		return -EINVAL;
+
 	ret = intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
 				    DRM_HDCP_AN_LEN);
 	if (ret) {
-- 
2.47.0.163.g1226f6d8fa-goog

