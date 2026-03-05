Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAMJMCvgqWmaGwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73696217DBD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7C10EC75;
	Thu,  5 Mar 2026 19:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2igjCSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822B310EC75
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 19:57:28 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso5221389f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772740647; x=1773345447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8g4jD+lM4KD2+vvthvQvaKxkXysJFhQZ5m0wfrvK+Hg=;
 b=f2igjCStuN/CDSbuUJgzX9Vb8lAOnwcoi6k7G3Zpdl0143iEiXnvg/WAOinH0X7nPF
 4r3usct7+CxHsYXQkaTPvnbUPfT3tbcKX68GBgWJY86bBEC2iGbgYtGO1c2BO0H/XVWn
 SAe7iOIp1FtU+CH7kMU4/gZEbev56E/KXI4BODnjy2nzKfzGYazPRUuQj3nVxXr9TAu3
 VdOw+YeDv2AHPUFr8f36OlsYfCOf9dlSjBdEUbZSTuUOKJUD3Exvqq0hwmRsHXYEUEad
 P1YCUgupabDsDBbCc0Ofzw/u/UOOTS+88uupD4H6sh/K9K56YJQLKYAvwYMOD67qgb3z
 JZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772740647; x=1773345447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8g4jD+lM4KD2+vvthvQvaKxkXysJFhQZ5m0wfrvK+Hg=;
 b=Bl7Z0UJEFg/UK5qe3FunNkTO1EGpp6vN4AVnZyW7zkcI21hEEa1e3ElI5+DtJrsS6X
 tMzlsBoYmubDf9CnTZ4VvZMK7/cau7byw6lG9XHQJ8PZR4VIc/r8eNJIUKJ8p9OBoczV
 UKOLrbbA9k14PtGH0fDt1UL/veWq0Defhjo5EMjM+eKmFny+A1W0uXRMSgz11KifAJ/G
 S93I3IwUswWRQu+h5DEqmm6Ggj+f1ccNZ3GYgeQsmuDr28IvoH4kKjy7uJqfmtVautUe
 lWW+9tPihW/Eelh9AGVwG9N0WUUV1SLdbUBvfOp/2qceDx8qB77A2+aYBJPV7a33OHg0
 H5eA==
X-Gm-Message-State: AOJu0Yxf8EcZ4BjRV9OY2kcmb8PZqgWV6Situm4VpL3J8KhB8N33OpQQ
 jieBTuBHkcH8dAa/mffrHbxBMzT2s9xbuBwHAXHwV34dROYCW+I5IHDI80UX7XnF
X-Gm-Gg: ATEYQzwSMd3Xx1lfOQPUI7AM0nLU3fAaIe1i+ig31QjtSjTlxDrfTJ+sxGv+creQWQL
 zXEdTtlSickFQ25WBeT/YwVqYO3zX+UJK/w1Hky7CUJqX3N5GzESmzZazpf14k/TyJTduGrVE73
 Q9Su0bMy1QOCJKS6E92Qaso2RBMJNN7BE1p6kS8vs+6VDz9lSDDWPIWdhtZPXPbmUS9cTnnOkUN
 2paiPm1HqYxMR7pHvmJQC7KO/KI3aoFZb39YzjQXjy4zFh8s6Jp5Q+6lHWw/o0ZKc88tMxXlxYC
 y4PdDazu1CR5SSFr9NHZCe1TKCO7imaGzm/Ou/uWY5ul7nvVcCkg+Nwrj0rkZl3cgpHqH3Ko8SO
 64V8j61ad9HrwjY0uKlsD2CtMfOQO5ZYvJxxBmUMOtp6DhBpm34ne1c+bsA+zXqM5LnX5laxFh7
 IvoDgrB5kVWjI/y5U6QOrVSq4m/Ob6EQ==
X-Received: by 2002:a05:6000:3112:b0:439:d750:42f6 with SMTP id
 ffacd0b85a97d-439d7504334mr1415838f8f.24.1772740646285; 
 Thu, 05 Mar 2026 11:57:26 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439bb686a32sm26974297f8f.13.2026.03.05.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:57:25 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Marek Vasut <marex@nabladev.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Kael D'Alcamo" <dev@kael-k.io>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: jd9365da: Support for Zhunyi Z40046 panels
Date: Thu,  5 Mar 2026 19:56:31 +0000
Message-ID: <20260305195650.119196-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305195650.119196-1-l.scorcia@gmail.com>
References: <20260305195650.119196-1-l.scorcia@gmail.com>
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
X-Rspamd-Queue-Id: 73696217DBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,edgeble.ai,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,oss.qualcomm.com,nabladev.com,bp.renesas.com,kael-k.io,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses different initialization sequences.

The two initialization sequences for the panel have been extracted from
Android original firmware for the Xiaomi Smart Clock.

Variant v1 tested on device. Variant v2 not tested.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 308 ++++++++++++++++++
 1 file changed, 308 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 5386a06fcd08..9bcf846684e4 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -46,11 +46,22 @@ struct jadard {
 	struct gpio_desc *reset;
 };
 
+#define JD9161Z_DCS_SWITCH_PAGE		0xde
+
+#define jd9161z_switch_page(dsi_ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9161Z_DCS_SWITCH_PAGE, (page))
+
 #define JD9365DA_DCS_SWITCH_PAGE	0xe0
 
 #define jd9365da_switch_page(dsi_ctx, page) \
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9365DA_DCS_SWITCH_PAGE, (page))
 
+static void jd9161z_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	// Enable access to DCS and internal commands
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x91, 0x62, 0xf3);
+}
+
 static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
@@ -1366,6 +1377,295 @@ static const struct jadard_panel_desc anbernic_rgds_display_desc = {
 		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
 };
 
+// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
+static int zhunyi_z40046_init_cmds_v1(struct jadard *jadard_data)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
+
+	// Init configuration sequence
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+	jd9161z_enable_standard_cmds(&dsi_ctx);
+
+	// GAMMA_SET (pos/neg voltage of gamma power)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
+		0x10, 0x04, 0x86, 0x00, 0x1b, 0x35);
+
+	// DCDC_SEL (power mode and charge pump settings)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
+		0x69, 0x0b, 0x30, 0xb2, 0xb2, 0xc0, 0xe0, 0x20,
+		0xf0, 0x50, 0x60,
+	);
+
+	// VDDD_CTRL (control logic voltage setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
+		0x73, 0x14);
+
+	// SETRGBCYC (display waveform cycle of RGB mode)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
+		0x74, 0x04, 0x08, 0x0e, 0x00, 0x0e, 0x0c, 0x08,
+		0x0e, 0x00, 0x0e, 0x82, 0x0a, 0x82,
+	);
+
+	// SET_TCON (timing control setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+		0x10, 0x90, 0x92, 0x0e, 0x0b, 0x04);
+
+	// SET_R_GAMMA (set red gamma output voltage)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
+		0x7e, 0x76, 0x68, 0x57, 0x4c, 0x39, 0x3a, 0x23,
+		0x3d, 0x3d, 0x40, 0x61, 0x54, 0x64, 0x5d, 0x62,
+		0x5a, 0x50, 0x32, 0x7e, 0x76, 0x68, 0x57, 0x4c,
+		0x39, 0x3a, 0x23, 0x3d, 0x3d, 0x40, 0x61, 0x54,
+		0x64, 0x5d, 0x62, 0x5a, 0x50, 0x32,
+	);
+
+	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
+		0x1f, 0x0a, 0x08, 0x06, 0x04, 0x1f, 0x00, 0x1f,
+		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
+		0x1f, 0x0b, 0x09, 0x07, 0x05, 0x1f, 0x01, 0x1f,
+		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SETGIP1 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
+		0x10, 0x00, 0x00, 0x03, 0x60, 0x05, 0x10, 0x00,
+		0x02, 0x06, 0x68, 0x00, 0x6c, 0x00, 0x00, 0x00,
+		0x00, 0x06, 0x78, 0x71, 0x07, 0x06, 0x68, 0x0c,
+		0x25, 0x00, 0x63, 0x03, 0x00,
+	);
+
+	// SETGIP2 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
+		0x20, 0x10, 0x8c, 0x18, 0x00, 0x80, 0x00, 0x08,
+		0x00, 0x00, 0x06, 0x60, 0x00, 0x81, 0x70, 0x02,
+		0x30, 0x01, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00,
+		0x03, 0x60, 0x83, 0x90, 0x00, 0x00, 0x03, 0x4f,
+		0x03, 0x00, 0x1f, 0x3f, 0x00, 0x00, 0x00, 0x00,
+	);
+
+	jd9161z_switch_page(&dsi_ctx, 0x04);
+
+	// ?
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0,
+		0x24, 0x01);
+
+	jd9161z_switch_page(&dsi_ctx, 0x02);
+
+	// SETRGBCYC2 (RGB IF source switch control timing)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+		0x71);
+
+	// ?
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7,
+	);
+
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc zhunyi_z40046v1_desc = {
+	.mode = {
+		.clock		= 26700,
+
+		.hdisplay	= 480,
+		.hsync_start	= 480 + 20,
+		.hsync_end	= 480 + 20 + 20,
+		.htotal		= 480 + 20 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 12,
+		.vsync_end	= 800 + 12 + 4,
+		.vtotal		= 800 + 12 + 4 + 8,
+
+		.width_mm	= 52,
+		.height_mm	= 86,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		MIPI_DSI_MODE_LPM,
+	.lp11_before_reset = true,
+	.reset_before_power_off_vcioo = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 10,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+	.init = zhunyi_z40046_init_cmds_v1,
+};
+
+// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
+static int zhunyi_z40046_init_cmds_v2(struct jadard *jadard_data)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
+
+	// Init configuration sequence
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+	jd9161z_enable_standard_cmds(&dsi_ctx);
+
+	// GAMMA_SET (pos/neg voltage of gamma power)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
+		0x10, 0x08, 0x42, 0x00, 0x56, 0x42,
+	);
+
+	// DCDC_SEL (power mode and charge pump settings)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
+		0x52, 0x0f, 0xb2, 0xb2, 0xb2, 0xc0, 0xd0, 0x50,
+		0xf0, 0x40, 0x50,
+	);
+
+	// VDDD_CTRL (control logic voltage setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
+		0x73, 0x14);
+
+	// SETRGBCYC (display waveform cycle of RGB mode)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
+		0x04, 0x07, 0x0b, 0x17, 0x00, 0x17, 0x04, 0x17,
+		0x17, 0x00, 0x17, 0x82, 0x0b, 0x82,
+	);
+
+	// SET_TCON (timing control setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+		0x10, 0x90, 0x92, 0x0e, 0x06,
+	);
+
+	// SET_R_GAMMA (set red gamma output voltage)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
+		0x7f, 0x78, 0x69, 0x56, 0x47, 0x33, 0x34, 0x1e,
+		0x3b, 0x3e, 0x43, 0x67, 0x5d, 0x6f, 0x68, 0x70,
+		0x6a, 0x61, 0x3c, 0x7f, 0x78, 0x69, 0x56, 0x47,
+		0x33, 0x34, 0x1e, 0x3b, 0x3e, 0x43, 0x67, 0x5d,
+		0x6f, 0x68, 0x70, 0x6a, 0x61, 0x3c,
+	);
+
+	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
+		0x1f, 0x1e, 0x07, 0x05, 0x01, 0x1f, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
+		0x1f, 0x1e, 0x06, 0x04, 0x00, 0x1f, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SET_GIP_L_GS (CGOUTx_L signal mapping, gs_panel = 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2,
+		0x1f, 0x1f, 0x04, 0x06, 0x00, 0x1e, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SET_GIP_R_GS (CGOUTx_R signal mapping, gs_panel = 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
+		0x1f, 0x1f, 0x05, 0x07, 0x01, 0x1e, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
+	);
+
+	// SETGIP1 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
+		0x30, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x00,
+		0x03, 0x03, 0x68, 0x03, 0x40, 0x05, 0x00, 0x00,
+		0x00, 0xcc, 0x2d, 0x31, 0x02, 0x03, 0x68, 0x0c,
+		0x25, 0x00, 0x63, 0x03, 0x00,
+	);
+
+	// SETGIP2 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
+		0x30, 0x08, 0x80, 0x18, 0x00, 0x00, 0x00, 0x18,
+		0x00, 0x00, 0x06, 0x60, 0x00, 0x07, 0x50, 0x00,
+		0x33, 0xc0, 0x00, 0x60, 0xc0, 0x00, 0x00, 0x00,
+		0x03, 0x60, 0x06, 0x10, 0x00, 0x00, 0x0f, 0x4f,
+		0x00, 0x10, 0x1f, 0x3f,
+	);
+
+	jd9161z_switch_page(&dsi_ctx, 0x02);
+
+	// SETRGBCYC2 (RGB IF source switch control timing)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+		0x60);
+
+	// ?
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7,
+	);
+
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+
+	// GAS_CTRL (GAS function control)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe,
+		0x4e,
+	);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc zhunyi_z40046v2_desc = {
+	.mode = {
+		.clock		= 26700,
+
+		.hdisplay	= 480,
+		.hsync_start	= 480 + 20,
+		.hsync_end	= 480 + 20 + 20,
+		.htotal		= 480 + 20 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 12,
+		.vsync_end	= 800 + 12 + 4,
+		.vtotal		= 800 + 12 + 4 + 8,
+
+		.width_mm	= 52,
+		.height_mm	= 86,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		MIPI_DSI_MODE_LPM,
+	.lp11_before_reset = true,
+	.reset_before_power_off_vcioo = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 10,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+	.init = zhunyi_z40046_init_cmds_v2,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -1463,6 +1763,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "radxa,display-8hd-ad002",
 		.data = &radxa_display_8hd_ad002_desc
 	},
+	{
+		.compatible = "zhunyi,z40046v1",
+		.data = &zhunyi_z40046v1_desc
+	},
+	{
+		.compatible = "zhunyi,z40046v2",
+		.data = &zhunyi_z40046v2_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);
-- 
2.43.0

