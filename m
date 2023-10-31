Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4E7DD2D0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D132F10E583;
	Tue, 31 Oct 2023 16:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E3F10E577
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:48:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E70660FA7;
 Tue, 31 Oct 2023 16:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD124C433C8;
 Tue, 31 Oct 2023 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770935;
 bh=QJmVeePAcx7pV7co2N1PaJoFmnt45FQ/oBA2SPqfG3E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TTnDbqzhaIZg6xykK+YYO26NzZCUZMkdG8Br5D4Lk8NxtADtnJ9Uowhm3PfXBkU4C
 gbujt0UanSQidnvTFs24pqjQeBdELmyKqURFDxpgxOanSkXLr718VZ4+lM4z2xOMgy
 hVEz5fLz+x0UXuz7Ps4NJft92xCXXySTm/6F/mLkf5+AKy3TWvdOTySraxI2TAgvxp
 gS6RxGBC/nS07mop/Vq4Gj5lJldO4V0JdqL0fR3p0F1CMZ1NCfrj0y7WNj3lkquY2S
 ZsjIadQaCvXu5eZvgN5jX8AS2qde8oGY7fZFFD4pSoFIOm8Yun52QuDN1YumZAZU6Y
 ROcC4tn5XgRzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:20 +0100
Subject: [PATCH RFC v3 07/37] drm/connector: hdmi: Add HDMI compute clock
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-7-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QJmVeePAcx7pV7co2N1PaJoFmnt45FQ/oBA2SPqfG3E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vcq10fZy/qFds8/VsejM0/550uf07ZtzVzNh9pui
 Z4sDnvRUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgImUazIy/N5akXL99KLSiWw3
 zwowKq6+9b/6i4igwd1FgRdyDY7k5TP800zRq7p5/dS7rXXHd345tm76HctLIjxTtDTYp5/5smS
 1ByMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A lot of HDMI drivers have some variation of the formula to calculate
the TMDS character rate from a mode, but few of them actually take all
parameters into account.

Let's create a helper to provide that rate taking all parameters into
account.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  5 +++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 9037e1b1b383..a96c9b54c554 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2955,6 +2955,40 @@ void drm_connector_update_privacy_screen(const struct drm_connector_state *conne
 }
 EXPORT_SYMBOL(drm_connector_update_privacy_screen);
 
+/**
+ * drm_connector_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
+ * @mode: Display mode to compute the clock for
+ * @bpc: Bits per character
+ * @fmt: Output Pixel Format used
+ *
+ * Returns the TMDS Character Rate for a given mode, bpc count and output format.
+ *
+ * RETURNS:
+ * The TMDS Character Rate, in Hertz
+ */
+unsigned long long
+drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+				      unsigned int bpc,
+				      enum hdmi_colorspace fmt)
+{
+	unsigned long long clock = mode->clock * 1000ULL;
+
+	if (fmt == HDMI_COLORSPACE_YUV420)
+		clock = clock / 2;
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		clock = clock * 2;
+
+	if (fmt == HDMI_COLORSPACE_YUV422)
+		bpc = 8;
+
+	clock = clock * bpc;
+	do_div(clock, 8);
+
+	return clock;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_compute_mode_clock);
+
 int drm_connector_set_obj_prop(struct drm_mode_object *obj,
 				    struct drm_property *property,
 				    uint64_t value)
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 32f0b3b7383e..781a5726a26a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -38,6 +38,7 @@ struct drm_connector_helper_funcs;
 struct drm_modeset_acquire_ctx;
 struct drm_device;
 struct drm_crtc;
+struct drm_display_mode;
 struct drm_encoder;
 struct drm_panel;
 struct drm_property;
@@ -2118,6 +2119,10 @@ void drm_connector_attach_privacy_screen_properties(struct drm_connector *conn);
 void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
+unsigned long long
+drm_connector_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
+				      unsigned int bpc,
+				      enum hdmi_colorspace fmt);
 
 /**
  * struct drm_tile_group - Tile group metadata

-- 
2.41.0

