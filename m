Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34E91D31F
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586B710E2B7;
	Sun, 30 Jun 2024 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="oMd6pq90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EE110E2B7
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:47 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7U98KFw2NBX8USOS8/v/gKpgMdmoWOHtCL2sTlkgOQ=;
 b=oMd6pq90R6z9R8S8wRou/U0vlye457KJuG6u8Okxu3tzpZPqHbx61UW906oOJSy3Af+k1F
 9VDUMTPfir8LDjJH081jifohQVivb8WQ9NXgOdxwdmOooBhEAx/Lu8+8pnnvBn09fXkOZ1
 vaKWM2KQy1di+XC4qujCHA697fi8AegHngIZ43zcc4B7gdSG+cmkDmQvRQ8D5kqs34HuqW
 r7OsmYy6aq24AwkvdI2fg8NLr5ed4SAENntzQEkvcU1u1poVXclIu6p6z9EHOSChy9zHG0
 qfI28w0fzp95hs8Y5KJorSw1NezH+vYiC2scffD7dVX8Ui5pox2hYRexYA+uPg==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:27 +0200
Subject: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=3936;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=dxKUN9O3IfKfVKdznJW7pHdoyiaNKC3n5pN/k8clVHk=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzNRPFIJh0bhLcxkkzB3Hv+G99oFLCmk2QF
 ftsdylqLDaJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tvJLD/41mBLa1W4xZy39T0eQ+94M6vb2BH9D9K78hE3xcpPHY6Y+IQi7LldueaOLFp+pIR59kO2
 SgVhGEYWHGUTsut31X0mcGUAhrAFDxB3/FaJk17BJXXS4IGbLb98jhT0KZJpdl/YaLmX7GyEWpS
 0H4yPzZxRokDuEUHlPMj6S+wJtViAkAtYzf7pTGXIvFFcl3Bh/OkHbwBjvuWc25Sh2ZJ5qB0KVh
 xB2jV1rycXZOZZW/fDpRf12CMkInjqXPrmwuvYEDUQnhEMkScJX100T4T7UfTQ9sPz/QUL/dUnY
 fA0SCfw3BkcwLIXIBpDLK59dlsq1M39ORX1R1sCci1sw3W0DXLtYmctzGUxLagMjrhjUDB3PREI
 +duFie3R4uf5bclPaoJM+1XV5FP9epdBMPHqL0/u/UR1bfmZPjgLsX0PV+XQeRt+Fsbe46ITidg
 wM8u4uCSf/lX5Bc7X7uxsQ1eG/ZEptRC5csSHcNTeDjLyamBYnxDscZ75DwPDcRUxO/vv6iCqhx
 CpwkKUAOTdf7UvdVvErSVAllDHYXSyFbefol/K4hbjirMmb93b96tt2lEAunf9hHYGYWsxp6Oto
 +P1nkdX92p9Il+KvaOs+lUHfECfTVgD9uj1uWskwcF1YHkeIr2+LNYRGDCHr7i70Jg1JIpNftiC
 QFNukbotVqG7eGw==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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
index a471c46f5ca6..f2c7f3f23a6e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 	}
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_generic_write_raw_multi() - transmit data using a generic write packet of
+ * a specific type
+ * @ctx: Context for multiple DSI transactions
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
+ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx,
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
+EXPORT_SYMBOL(mipi_dsi_generic_write_raw_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
  * @params: buffer containing the request parameters
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 71d121aeef24..fb23f4e3b94e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx, u8 type,
+				    const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 
 #define mipi_dsi_msleep(ctx, delay)	\
@@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 		static const u8 d[] = { cmd, seq };                     \
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_long_multi - transmit a DCS long command with payload
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: Commands
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_long_multi(ctx, cmd, seq...)                    \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		mipi_dsi_generic_write_raw_multi(ctx,                      \
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

