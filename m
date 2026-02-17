Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKhUDYQSlGlB/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:02:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924611491AD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F18510E44F;
	Tue, 17 Feb 2026 07:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="UF2/6JUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6634D10E44F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:02:24 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1771311742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrJL52H3P+sZw3D88DjO+0Dvn3Xt8fjuAIAZXJfqjlQ=;
 b=UF2/6JUtQCxjTjQrY0QVkbwMgVrmbiwJNhqfvZqyK+Uj92p+neG1hqb8EK+U7CGhqRlSL5
 sSbt+Jf3m7VVk8Ih6ElF8d9bnz8Gasrf46lCsizmipOXJhl7H/3zaXPZvUC5ibEl5mIA3G
 zZAUWrjDaNJ3fyWEfAI336Jkhkqk2CHB+snVaa7edhu++/QLfO1oCHhNV/2VC+VKb9d1KY
 BvPBxcnz0/HQ+OyaVCs2rCz3hQzKzQ0o2Qz61ECd8H+ZroAH9PVu7Bzk+DlmWY4YD6Sa4t
 QIRfSiBCuVxXAVQiAjqjwe2cgRzJEIUuKgaxDhGmUByENs1Jm26foCBWeQf3iQ==
From: Val Packett <val@packett.cool>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: [PATCH 3/4] drm/panel: himax-hx83102: Add support for Holitech
 HTF065H045
Date: Tue, 17 Feb 2026 04:00:11 -0300
Message-ID: <20260217070121.190108-4-val@packett.cool>
In-Reply-To: <20260217070121.190108-1-val@packett.cool>
References: <20260217070121.190108-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:phone-devel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:linux-kernel@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,packett.cool:mid,packett.cool:dkim,packett.cool:email]
X-Rspamd-Queue-Id: 924611491AD
X-Rspamd-Action: no action

This 720x1600 panel is found in several Motorola/Lenovo smartphones like
the Moto G9 Play (guamp). The initialization sequence is based on the
datasheet. Add it to the existing HX83102 panel driver.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 86 +++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 1d3bb5dca559..34e0e956db48 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -701,6 +701,67 @@ static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
 	return dsi_ctx.accum_err;
 }
 
+static int holitech_htf065h045_init(struct hx83102 *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	msleep(50);
+
+	hx83102_enable_extended_cmds(&dsi_ctx, true);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x22, 0x44, 0x27, 0x27, 0x32,
+				     0x52, 0x57, 0x39, 0x08, 0x08, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x00, 0x06, 0x40, 0x00,
+				     0x0e, 0xae, 0x38, 0x00, 0x00, 0x00, 0x00, 0xf4, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x01, 0x58, 0x01, 0x58, 0x01,
+				     0x58, 0x03, 0x58, 0x03, 0xff, 0x01, 0x20, 0x00, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x10, 0x00, 0x17, 0x00, 0x63, 0x37, 0x0e, 0x0e, 0x00, 0x00,
+				     0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x16, 0x4e, 0x06, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x04, 0x0c, 0xb2, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x24, 0x25, 0x18, 0x18, 0x19,
+				     0x19, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x06, 0x07, 0x04, 0x05, 0x18, 0x18, 0x18,
+				     0x18, 0x02, 0x03, 0x00, 0x01, 0x20, 0x21, 0x18, 0x18, 0x18,
+				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2, 0x00, 0x09, 0x16, 0x1f, 0x28,
+				     0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d, 0x91, 0xa0, 0x9e,
+				     0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78, 0x7f, 0x00, 0x09,
+				     0x16, 0x1f, 0x28, 0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d,
+				     0x91, 0xa0, 0x9e, 0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78,
+				     0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xff, 0x14, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xff,
+				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+				     0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa,
+				     0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x70, 0x23, 0xa8, 0x93, 0xb2,
+				     0xc0, 0xc0, 0x01, 0x10, 0x00, 0x00, 0x00, 0x0d, 0x3d, 0x82,
+				     0x77, 0x04, 0x01, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x00, 0x53, 0x00, 0x02, 0x59);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x00, 0x04, 0x9e, 0xf6,
+				     0x00, 0x5d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x42, 0x00, 0x33, 0x00, 0x33,
+				     0x88, 0xb3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x7f, 0x03, 0xf5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
+
+	return dsi_ctx.accum_err;
+}
+
 static const struct drm_display_mode starry_mode = {
 	.clock = 162680,
 	.hdisplay = 1200,
@@ -833,6 +894,28 @@ static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
 	.init = starry_2082109qfh040022_50e_init,
 };
 
+static const struct drm_display_mode holitech_htf065h045_default_mode = {
+	.clock = 90720,
+	.hdisplay = 720,
+	.hsync_start = 720 + 40,
+	.hsync_end = 720 + 40 + 40,
+	.htotal = 720 + 40 + 40 + 40,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 186,
+	.vsync_end = 1600 + 186 + 2,
+	.vtotal = 1600 + 186 + 2 + 12,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct hx83102_panel_desc holitech_htf065h045_desc = {
+	.modes = &holitech_htf065h045_default_mode,
+	.size = {
+		.width_mm = 68,
+		.height_mm = 151,
+	},
+	.init = holitech_htf065h045_init,
+};
+
 static int hx83102_enable(struct drm_panel *panel)
 {
 	msleep(130);
@@ -1069,6 +1152,9 @@ static const struct of_device_id hx83102_of_match[] = {
 	{ .compatible = "starry,himax83102-j02",
 	  .data = &starry_desc
 	},
+	{ .compatible = "holitech,htf065h045",
+	  .data = &holitech_htf065h045_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx83102_of_match);
-- 
2.52.0

