Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKOhBBvvoWlDxQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:23:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE251BCB41
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D73310EC1C;
	Fri, 27 Feb 2026 19:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="cm2umcSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ACF10EC14;
 Fri, 27 Feb 2026 19:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772220172; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MAIlfC7ZqkqNrVnBT0P45cJFungCT3vqfYFVMNCgAvx2XjKF9bzEE7nMuRb+Tinta1XgOfCfHA6NKcivqprR6q/ogd18xWl3tIIuLS3mRITV5iL+0TZbt4DGzdHGj3kgOZHLifcgXaGXj3b4GPMUTj+Epyu0IaplR8QMqqoFdFc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772220172;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q6LewHLgG66mB+cKlrE6Jmde9yR3/vCwSuAKYYuzjYw=; 
 b=L7A7jORPFntLMyXivzluZJv/KUa++f0FMaAMSiUSizEt7q+g9r4nq0T7d0XNAyJuS+574RgxOD3t1D1BVpD1m/0Q8EsPzjaWIP5lu4qM/SW9O9ifgmOojbsSzmHVBCEk0ppHxMVS3KA9KmUUj2bG8cv/piuGDrW5fpQHF+TKgbg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220171; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Q6LewHLgG66mB+cKlrE6Jmde9yR3/vCwSuAKYYuzjYw=;
 b=cm2umcSSbNgoXj9QzCrSg/AQl2lCOfghzJrH0XrJKY7nKwbfTx8woPUzyGBEiONP
 s04BY5GYpUaJVvd0c7akXbNGmWZpgnziuSRo/a1/ralMkvC2Avl2FTsgyLxYBp+aALq
 FnCh1Gl0k0abfjyUpTeXslVlXOjqpqQagPSkwCvU=
Received: by mx.zohomail.com with SMTPS id 177222017032899.09227981845538;
 Fri, 27 Feb 2026 11:22:50 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:23 +0100
Subject: [PATCH v9 18/19] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-18-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6EE251BCB41
X-Rspamd-Action: no action

With the "color format" property, the bridge chain format selection has
gained increased complexity. Instead of simply finding any sequence of
bus formats that works, the bridge chain format selection needs to pick
a sequence that results in the requested color format.

Add KUnit tests for this new logic. These take the form of some pleasant
preprocessor macros to make it less cumbersome to define test bridges
with a set of possible input and output formats.

The input and output formats are defined for bridges in the form of
tuples, where the first member defines the input format, and the second
member defines the output format that can be produced from this input
format. This means the tests can construct scenarios in which not all
inputs can be converted to all outputs.

Some tests are added to test interesting scenarios to exercise the bus
format selection in the presence of a specific color format request.

Furthermore, tests are added to verify that bridge chains that end in an
HDMI connector will always prefer RGB when the color format is
DRM_CONNECTOR_COLOR_FORMAT_AUTO, as is the behaviour in the HDMI state
helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 787 ++++++++++++++++++++++++++++++++
 1 file changed, 787 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index 887020141c7f..cb821c606070 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -2,15 +2,23 @@
 /*
  * Kunit test for drm_bridge functions
  */
+#include <linux/cleanup.h>
+#include <linux/media-bus-format.h>
+
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_bridge_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_kunit_helpers.h>
+#include <drm/drm_managed.h>
 
 #include <kunit/device.h>
 #include <kunit/test.h>
 
+#include "drm_kunit_edid.h"
+
 /*
  * Mimick the typical "private" struct defined by a bridge driver, which
  * embeds a bridge plus other fields.
@@ -37,6 +45,21 @@ struct drm_bridge_init_priv {
 	bool destroyed;
 };
 
+struct drm_bridge_chain_priv {
+	struct drm_device drm;
+	struct drm_encoder encoder;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_connector *connector;
+	unsigned int num_bridges;
+
+	/**
+	 * @test_bridges: array of pointers to &struct drm_bridge_priv entries
+	 *                of which the first @num_bridges entries are valid.
+	 */
+	struct drm_bridge_priv **test_bridges;
+};
+
 static struct drm_bridge_priv *bridge_to_priv(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct drm_bridge_priv, bridge);
@@ -95,6 +118,229 @@ static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 };
 
+/**
+ * struct fmt_tuple - a tuple of input/output MEDIA_BUS_FMT_*
+ */
+struct fmt_tuple {
+	u32 in_fmt;
+	u32 out_fmt;
+};
+
+/*
+ * Format mapping that only accepts RGB888, and outputs only RGB888
+ */
+static const struct fmt_tuple rgb8_passthrough[] = {
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+};
+
+/*
+ * Format mapping that only accepts YUV444, and outputs only YUV444
+ */
+static const struct fmt_tuple yuv8_passthrough[] = {
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_YUV8_1X24 },
+};
+
+/*
+ * Format mapping where 8bpc RGB -> 8bpc YUV444, or ID(RGB) or ID(YUV444)
+ */
+static const struct fmt_tuple rgb8_to_yuv8_or_id[] = {
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+};
+
+static const struct fmt_tuple rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420[] = {
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_UYVY8_1X16 },
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_UYYVYY8_0_5X24 },
+};
+
+/*
+ * Format mapping where 8bpc YUV444 -> 8bpc RGB, or ID(YUV444)
+ */
+static const struct fmt_tuple yuv8_to_rgb8_or_id[] = {
+	{ MEDIA_BUS_FMT_YUV8_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_YUV8_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+};
+
+/*
+ * A format mapping that acts like a video processor that generates an RGB signal
+ */
+static const struct fmt_tuple rgb_producer[] = {
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB888_1X24 },
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB101010_1X30 },
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB121212_1X36 },
+};
+
+/*
+ * A format mapping that acts like a video processor that generates an 8-bit RGB,
+ * YUV444 or YUV420 signal
+ */
+static const struct fmt_tuple rgb_yuv444_yuv420_producer[] = {
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB888_1X24 },
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_UYYVYY8_0_5X24 },
+};
+
+static const struct fmt_tuple rgb8_yuv444_yuv422_passthrough[] = {
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16,  MEDIA_BUS_FMT_UYVY8_1X16 },
+};
+
+static const struct fmt_tuple yuv444_yuv422_rgb8_passthrough[] = {
+	{ MEDIA_BUS_FMT_YUV8_1X24,   MEDIA_BUS_FMT_YUV8_1X24 },
+	{ MEDIA_BUS_FMT_UYVY8_1X16,  MEDIA_BUS_FMT_UYVY8_1X16 },
+	{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+};
+
+static bool fmt_in_list(const u32 fmt, const u32 *out_fmts, const size_t num_fmts)
+{
+	size_t i;
+
+	for (i = 0; i < num_fmts; i++)
+		if (out_fmts[i] == fmt)
+			return true;
+
+	return false;
+}
+
+/**
+ * get_tuples_out_fmts - Get unique output formats of a &struct fmt_tuple list
+ * @fmt_tuples: array of &struct fmt_tuple
+ * @num_fmt_tuples: number of entries in @fmt_tuples
+ * @out_fmts: target array to store the unique output bus formats
+ *
+ * Returns the number of unique output formats, i.e. the number of entries in
+ * @out_fmts that were populated with sensible values.
+ */
+static size_t get_tuples_out_fmts(const struct fmt_tuple *fmt_tuples,
+				  const size_t num_fmt_tuples, u32 *out_fmts)
+{
+	size_t num_unique = 0;
+	size_t i;
+
+	for (i = 0; i < num_fmt_tuples; i++)
+		if (!fmt_in_list(fmt_tuples[i].out_fmt, out_fmts, num_unique))
+			out_fmts[num_unique++] = fmt_tuples[i].out_fmt;
+
+	return num_unique;
+}
+
+#define DEFINE_FMT_FUNCS_FROM_TUPLES(name) \
+static u32 *drm_test_bridge_ ## name ## _out_fmts(struct drm_bridge *bridge,			\
+						  struct drm_bridge_state *bridge_state,	\
+						  struct drm_crtc_state *crtc_state,		\
+						  struct drm_connector_state *conn_state,	\
+						  unsigned int *num_output_fmts)		\
+{												\
+	u32 *out_fmts = kcalloc(ARRAY_SIZE((name)), sizeof(u32), GFP_KERNEL);			\
+												\
+	if (out_fmts)										\
+		*num_output_fmts = get_tuples_out_fmts((name), ARRAY_SIZE((name)), out_fmts);	\
+	else											\
+		*num_output_fmts = 0;								\
+												\
+	return out_fmts;									\
+}												\
+												\
+static u32 *drm_test_bridge_ ## name ## _in_fmts(struct drm_bridge *bridge,			\
+						 struct drm_bridge_state *bridge_state,		\
+						 struct drm_crtc_state *crtc_state,		\
+						 struct drm_connector_state *conn_state,	\
+						 u32 output_fmt,				\
+						 unsigned int *num_input_fmts)			\
+{												\
+	u32 *in_fmts = kcalloc(ARRAY_SIZE((name)), sizeof(u32), GFP_KERNEL);			\
+	unsigned int num_fmts = 0;								\
+	size_t i;										\
+												\
+	if (!in_fmts) {										\
+		*num_input_fmts = 0;								\
+		return NULL;									\
+	}											\
+												\
+	for (i = 0; i < ARRAY_SIZE((name)); i++)						\
+		if ((name)[i].out_fmt == output_fmt)						\
+			in_fmts[num_fmts++] = (name)[i].in_fmt;					\
+												\
+	*num_input_fmts = num_fmts;								\
+												\
+	return in_fmts;										\
+}
+
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 hdmi_write_infoframe_func,			\
+						 hdmi_clear_infoframe_func)			\
+static const struct drm_bridge_funcs (ident) = {						\
+	.atomic_enable			= drm_test_bridge_atomic_enable,			\
+	.atomic_disable			= drm_test_bridge_atomic_disable,			\
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,		\
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,		\
+	.atomic_reset			= drm_atomic_helper_bridge_reset,			\
+	.atomic_get_input_bus_fmts	= (input_fmts_func),					\
+	.atomic_get_output_bus_fmts	= (output_fmts_func),					\
+	.hdmi_write_avi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_avi_infoframe	= (hdmi_clear_infoframe_func),				\
+	.hdmi_write_hdmi_infoframe	= (hdmi_write_infoframe_func),				\
+	.hdmi_clear_hdmi_infoframe	= (hdmi_clear_infoframe_func),				\
+}
+
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(ident, input_fmts_func, output_fmts_func)		\
+	DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(ident, input_fmts_func, output_fmts_func,	\
+						 NULL, NULL)
+
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(_name)						\
+	DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_FUNC(_name ## _funcs,				\
+					    drm_test_bridge_ ## _name ## _in_fmts,	\
+					    drm_test_bridge_ ## _name ## _out_fmts)
+
+static int drm_test_bridge_write_infoframe_stub(struct drm_bridge *bridge,
+						const u8 *buffer, size_t len)
+{
+	return 0;
+}
+
+static int drm_test_bridge_clear_infoframe_stub(struct drm_bridge *bridge)
+{
+	return 0;
+}
+
+#define DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(_name)						\
+	DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI_FUNC(_name ## _hdmi ## _funcs,			\
+						 drm_test_bridge_ ## _name ## _in_fmts,		\
+						 drm_test_bridge_ ## _name ## _out_fmts,	\
+						 drm_test_bridge_write_infoframe_stub,		\
+						 drm_test_bridge_clear_infoframe_stub)
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb8_passthrough)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_passthrough);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(yuv8_passthrough)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_passthrough);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb8_to_yuv8_or_id)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_yuv8_or_id);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(yuv8_to_rgb8_or_id)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv8_to_rgb8_or_id);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb_producer)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_producer);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb_yuv444_yuv420_producer)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb_yuv444_yuv420_producer);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(rgb8_yuv444_yuv422_passthrough)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(rgb8_yuv444_yuv422_passthrough);
+
+DEFINE_FMT_FUNCS_FROM_TUPLES(yuv444_yuv422_rgb8_passthrough)
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT(yuv444_yuv422_rgb8_passthrough);
+DRM_BRIDGE_ATOMIC_WITH_BUS_FMT_HDMI(yuv444_yuv422_rgb8_passthrough);
+
 KUNIT_DEFINE_ACTION_WRAPPER(drm_bridge_remove_wrapper,
 			    drm_bridge_remove,
 			    struct drm_bridge *);
@@ -180,6 +426,119 @@ drm_test_bridge_init(struct kunit *test, const struct drm_bridge_funcs *funcs)
 	return priv;
 }
 
+static struct drm_bridge_chain_priv *
+drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
+			   const struct drm_bridge_funcs **funcs)
+{
+	struct drm_bridge_chain_priv *priv;
+	const struct drm_edid *edid;
+	struct drm_bridge *prev;
+	struct drm_encoder *enc;
+	struct drm_bridge *bridge;
+	struct drm_device *drm;
+	bool has_hdmi = false;
+	struct device *dev;
+	unsigned int i;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev, struct drm_bridge_chain_priv,
+						 drm, DRIVER_MODESET | DRIVER_ATOMIC);
+	if (IS_ERR(priv))
+		return ERR_CAST(priv);
+
+	drm = &priv->drm;
+
+	priv->test_bridges = drmm_kmalloc_array(drm, num_bridges, sizeof(*priv->test_bridges),
+						GFP_KERNEL);
+	if (!priv->test_bridges)
+		return ERR_PTR(-ENOMEM);
+
+	priv->num_bridges = num_bridges;
+
+	for (i = 0; i < num_bridges; i++) {
+		priv->test_bridges[i] = devm_drm_bridge_alloc(dev, struct drm_bridge_priv,
+							      bridge, funcs[i]);
+		if (IS_ERR(priv->test_bridges[i]))
+			return ERR_CAST(priv->test_bridges[i]);
+
+		priv->test_bridges[i]->data = priv;
+	}
+
+	priv->plane = drm_kunit_helper_create_primary_plane(test, drm, NULL, NULL,
+							    NULL, 0, NULL);
+	if (IS_ERR(priv->plane))
+		return ERR_CAST(priv->plane);
+
+	priv->crtc = drm_kunit_helper_create_crtc(test, drm, priv->plane, NULL,
+						  NULL, NULL);
+	if (IS_ERR(priv->crtc))
+		return ERR_CAST(priv->crtc);
+
+	enc = &priv->encoder;
+	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
+
+	prev = NULL;
+	for (i = 0; i < num_bridges; i++) {
+		bridge = &priv->test_bridges[i]->bridge;
+		bridge->type = DRM_MODE_CONNECTOR_VIRTUAL;
+
+		if (bridge->funcs->hdmi_write_hdmi_infoframe) {
+			has_hdmi = true;
+			bridge->ops |= DRM_BRIDGE_OP_HDMI;
+			bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+			bridge->vendor = "LNX";
+			bridge->product = "KUnit";
+			bridge->supported_formats = (BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420));
+		}
+
+		ret = drm_kunit_bridge_add(test, bridge);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_attach(enc, bridge, prev, 0);
+		if (ret)
+			return ERR_PTR(ret);
+
+		prev = bridge;
+	}
+
+	priv->connector = drm_bridge_connector_init(drm, enc);
+	if (IS_ERR(priv->connector))
+		return ERR_CAST(priv->connector);
+
+	drm_connector_attach_encoder(priv->connector, enc);
+
+	drm_mode_config_reset(drm);
+
+	if (!has_hdmi)
+		return priv;
+
+	scoped_guard(mutex, &drm->mode_config.mutex) {
+		edid = drm_edid_alloc(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz,
+				ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz));
+		if (!edid)
+			return ERR_PTR(-EINVAL);
+
+		drm_edid_connector_update(priv->connector, edid);
+		KUNIT_ASSERT_GT(test, drm_edid_connector_add_modes(priv->connector), 0);
+
+		ret = priv->connector->funcs->fill_modes(priv->connector, 4096, 4096);
+	}
+
+	return priv;
+}
+
 /*
  * Test that drm_bridge_get_current_state() returns the last committed
  * state for an atomic bridge.
@@ -508,14 +867,442 @@ static struct kunit_suite drm_bridge_alloc_test_suite = {
 	.test_cases = drm_bridge_alloc_tests,
 };
 
+/**
+ * drm_test_bridge_chain_verify_fmt - Verify bridge chain format selection
+ * @test: pointer to KUnit test object
+ * @priv: pointer to a &struct drm_bridge_chain_priv for this chain
+ * @expected: constant array of &struct fmt_tuple describing the expected
+ *            input and output bus formats
+ * @num_expected: number of entries in @expected
+ *
+ * Runs the KUNIT_EXPECT clauses to verify the bridge chain format selection
+ * resulted in the expected formats. If %0 is given as a format in a
+ * &struct fmt_tuple, then it is understood to mean "any".
+ *
+ * Must be called with the modeset lock held.
+ */
+static void drm_test_bridge_chain_verify_fmt(struct kunit *test,
+					     struct drm_bridge_chain_priv *priv,
+					     const struct fmt_tuple *const expected,
+					     const unsigned int num_expected)
+{
+	struct drm_bridge_state *bstate;
+	unsigned int i = 0;
+
+	drm_for_each_bridge_in_chain_scoped(&priv->encoder, bridge) {
+		KUNIT_ASSERT_LT(test, i, num_expected);
+
+		bstate = drm_bridge_get_current_state(bridge);
+		if (expected[i].in_fmt)
+			KUNIT_EXPECT_EQ(test, bstate->input_bus_cfg.format,
+					expected[i].in_fmt);
+		if (expected[i].out_fmt)
+			KUNIT_EXPECT_EQ(test, bstate->output_bus_cfg.format,
+					expected[i].out_fmt);
+
+		i++;
+	}
+
+	KUNIT_ASSERT_EQ_MSG(test, i, num_expected,
+			    "Fewer bridges (%u) than expected (%u)\n", i, num_expected);
+}
+
+/*
+ * Test that constructs a bridge chain in which an RGB888 producer is chained to
+ * two bridges that will convert from RGB to YUV and from YUV to RGB respectively.
+ *
+ * The test requests an output color_format of RGB using the color_format property,
+ * so to satisfy this request, the bridge chain must take a detour over YUV.
+ */
+static void drm_test_bridge_rgb_yuv_rgb(struct kunit *test)
+{
+	static const struct drm_bridge_funcs *funcs[] = {
+		&rgb_producer_funcs,
+		&rgb8_to_yuv8_or_id_funcs,
+		&yuv8_to_rgb8_or_id_funcs,
+	};
+	static const struct fmt_tuple expected[] = {
+		{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB888_1X24 },
+		{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+		{ MEDIA_BUS_FMT_YUV8_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+	};
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	conn_state->color_format = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_test_bridge_chain_verify_fmt(test, priv, expected, ARRAY_SIZE(expected));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test in which a bridge capable of producing RGB, YUV444 and YUV420 has to
+ * produce RGB and convert with a downstream bridge in the chain to reach the
+ * requested YUV444 color format, as no direct path exists between its YUV444
+ * and the last bridge.
+ *
+ * The rationale behind this test is to devise a scenario in which naively
+ * assuming any format the video processor can output, and the connector
+ * requests, is the right format to pick, does not work.
+ */
+static void drm_test_bridge_must_convert_to_yuv444(struct kunit *test)
+{
+	static const struct drm_bridge_funcs *funcs[] = {
+		&rgb_yuv444_yuv420_producer_funcs,
+		&rgb8_passthrough_funcs,
+		&rgb8_to_id_yuv8_or_yuv8_to_yuv422_yuv420_funcs,
+		&rgb8_yuv444_yuv422_passthrough_funcs,
+	};
+	static const struct fmt_tuple expected[] = {
+		{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB888_1X24 },
+		{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+		{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+		{ MEDIA_BUS_FMT_YUV8_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+	};
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	conn_state->color_format = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_test_bridge_chain_verify_fmt(test, priv, expected, ARRAY_SIZE(expected));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test which checks that no matter the order of bus formats returned by an
+ * HDMI bridge, RGB is preferred on DRM_CONNECTOR_COLOR_FORMAT_AUTO if it's
+ * available.
+ */
+static void drm_test_bridge_hdmi_auto_rgb(struct kunit *test)
+{
+	static const struct drm_bridge_funcs *funcs[] = {
+		&rgb_yuv444_yuv420_producer_funcs,
+		&yuv444_yuv422_rgb8_passthrough_hdmi_funcs,
+	};
+	static const struct fmt_tuple expected[] = {
+		{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_RGB888_1X24 },
+		{ MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_1X24 },
+	};
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	KUNIT_ASSERT_EQ(test, conn_state->color_format, DRM_CONNECTOR_COLOR_FORMAT_AUTO);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, DRM_OUTPUT_COLOR_FORMAT_RGB444);
+
+	drm_test_bridge_chain_verify_fmt(test, priv, expected, ARRAY_SIZE(expected));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test which checks that DRM_CONNECTOR_COLOR_FORMAT_AUTO on non-HDMI connectors
+ * will result in the first bus format on the output to be picked.
+ */
+static void drm_test_bridge_auto_first(struct kunit *test)
+{
+	static const struct drm_bridge_funcs *funcs[] = {
+		&rgb_yuv444_yuv420_producer_funcs,
+		&yuv444_yuv422_rgb8_passthrough_funcs,
+	};
+	static const struct fmt_tuple expected[] = {
+		{ MEDIA_BUS_FMT_FIXED, MEDIA_BUS_FMT_YUV8_1X24 },
+		{ MEDIA_BUS_FMT_YUV8_1X24, MEDIA_BUS_FMT_YUV8_1X24 },
+	};
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	KUNIT_ASSERT_EQ(test, conn_state->color_format, DRM_CONNECTOR_COLOR_FORMAT_AUTO);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	drm_test_bridge_chain_verify_fmt(test, priv, expected, ARRAY_SIZE(expected));
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/*
+ * Test which checks that in a configuration of bridge chains where an RGB
+ * producer is hooked to a YUV444-only pass-through, the atomic commit fails as
+ * the bridge format selection cannot find a valid sequence of bus formats.
+ */
+static void drm_test_bridge_rgb_yuv_no_path(struct kunit *test)
+{
+	static const struct drm_bridge_funcs *funcs[] = {
+		&rgb_producer_funcs,
+		&yuv8_passthrough_funcs,
+		&rgb8_yuv444_yuv422_passthrough_funcs,
+	};
+	struct drm_connector_state *conn_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_chain_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	struct drm_display_mode *mode;
+	int ret;
+
+	priv = drm_test_bridge_chain_init(test, ARRAY_SIZE(funcs), funcs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_EXPECT_EQ(test, ret, -ENOTSUPP);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+static struct kunit_case drm_bridge_bus_fmt_tests[] = {
+	KUNIT_CASE(drm_test_bridge_rgb_yuv_rgb),
+	KUNIT_CASE(drm_test_bridge_must_convert_to_yuv444),
+	KUNIT_CASE(drm_test_bridge_hdmi_auto_rgb),
+	KUNIT_CASE(drm_test_bridge_auto_first),
+	KUNIT_CASE(drm_test_bridge_rgb_yuv_no_path),
+	{ }
+};
+
+static struct kunit_suite drm_bridge_bus_fmt_test_suite = {
+	.name = "drm_bridge_bus_fmt",
+	.test_cases = drm_bridge_bus_fmt_tests,
+};
+
 kunit_test_suites(
 	&drm_bridge_get_current_state_test_suite,
 	&drm_bridge_helper_reset_crtc_test_suite,
 	&drm_bridge_alloc_test_suite,
+	&drm_bridge_bus_fmt_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
 MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
 
 MODULE_DESCRIPTION("Kunit test for drm_bridge functions");
 MODULE_LICENSE("GPL");

-- 
2.53.0

