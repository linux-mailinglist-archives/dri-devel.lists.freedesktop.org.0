Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9883B91438A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531C10E055;
	Mon, 24 Jun 2024 07:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="nlb4VLcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5F310E174
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:37:31 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719192644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeqaJ0p7DgcXGkQ6cX0FMk8XTQjg2wcN+GLdmBNHW60=;
 b=nlb4VLcBKX4e1vMN9pygwn/kWH+gZqybyXr9MFvP44YdHgiyPLg07Hki4eGe5DXNE4yAZJ
 nzaqYp83r3oyQYDpPaSEjg6iyBNkcYaOIRfW9LJ1Rfx9JtPBtftOXh5PP6vtNpknjSuCU/
 Qu8wZrW5IjEWgSoMP/9ORcxiLZZdFHcmVSvjSUrWVw2xyz0tZyAI8G4Js5vBp13zjM4AF6
 eYCO9NUHCg28+cy4ytEwd+cHooY3RRsvS6blafViW2zS8raHvNMAFvxqLdMclZX+QW+Ef8
 7+h+sGP85M4W2exSqdrI66f5wvJN+6I2pfV9vpew/q701QVJQIjR31B1hTvyeg==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:28 +0200
Subject: [PATCH 4/7] drm: mipi: add mipi_dsi_generic_write_multi_type()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-4-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=uqZgAejzAJmglLf3vuECiySKynx+U4pSQ2IgkvC2T8s=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw7xrcvXMW2qdyAND4jHEBHmIkBqtN2pZrTV
 cpjdgAJ9UCJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 tqtNEACAxThOc3SgEwYgzta+GeitozzBDY8L2SVa9dvnxccrvPaJ6YXK5YXiAP1gFS3AF4xPtja
 4iGtnU2Y438jX9KTaBPD83x1j4TeyE8EIkHfACg2qZSbHhxX6MxlbUv2il1qZGWZIyWcIaLE/jC
 hUlYhhpFBQuMDxvg1SMU/EWlf50F+x3QK1MRttS2zV/9tXaZPmjvInimWjods7RKm1RzJLmeIzX
 wv/Ddng2WBRDwTrE2J+pJPeqllN4UTxfgChlYLOCiU4ZD+ji2hrNxrerzXiNc+VflF/3NJd73YZ
 HbwEqM0HZq2CtEEp31vj0pa5rn6ANue7Xb9HabqtJ3B3ZmTw6449kFFvxZG0XFGan9jHZRCBuu3
 NsRIrKnzHQHI2Em2xIppvifZn9LR6sq1mhLdKTDpyNPbdJLE1njXrxZuj0JjUVmr9xcKS9M8T+L
 Owc425djTGxgdI6+1Ydd0LT0AZN5lu0FWCpsdEiELAId8UmNqYEZ4NebxFokU/7W9NwgRhEXhgK
 K1ACM3aS+HVTBF1JUcE9Y0YvyY8iQe8Ziv0+lypb3n/J6nlu0qkKW044TtQVPex+vmlMRtyZtMn
 gERkxWSewSMd+A2ORn9ihosM1hGUUViE+lHg4/BpOlGXFagQZoWODUevH0TlWS9lnE1yoNOrHxH
 jjM+hzdz0R4F2uQ==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

Some panels like the Samsung AMB655X use long write commands for all
non-standard messages and do not work when trying to use the appropriate
command type.

Support these panels by introducing a new helper to send commands of a
specific type, overriding the normal rules.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..d0fee0498d91 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 	}
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_generic_write_type() - transmit data using a generic write packet of
+ * a specific type
+ * @dsi: DSI peripheral device
+ * @type: data type of the packet
+ * @payload: buffer containing the payload
+ * @size: size of payload buffer
+ *
+ * This function will automatically choose the right data type depending on
+ * the payload length.
+ *
+ * Return: The number of bytes transmitted on success or a negative error code
+ * on failure.
+ */
+ssize_t mipi_dsi_generic_write_multi_type(struct mipi_dsi_multi_context *ctx,
+					  u8 type, const void *payload, size_t size)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_msg msg = {
+		.channel = dsi->channel,
+		.tx_buf = payload,
+		.tx_len = size,
+		.type = type,
+	};
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return 0;
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(&dsi->dev, "sending generic data %*ph failed: %zd\n",
+			(int)size, payload, ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(mipi_dsi_generic_write_multi_type);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
  * @params: buffer containing the request parameters
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 71d121aeef24..a5d949e695d4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+ssize_t mipi_dsi_generic_write_multi_type(struct mipi_dsi_multi_context *ctx, u8 type,
+				    const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 
 #define mipi_dsi_msleep(ctx, delay)	\
@@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 		static const u8 d[] = { cmd, seq };                     \
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_long - transmit a DCS long command with payload
+ * @dsi: DSI peripheral device
+ * @cmd: Commands
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_long(ctx, cmd, seq...)                          \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		mipi_dsi_generic_write_multi_type(ctx,                     \
+						  MIPI_DSI_DCS_LONG_WRITE, \
+						  d, ARRAY_SIZE(d));       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
  * @probe: callback for device binding

-- 
2.45.0

