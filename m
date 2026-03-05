Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G6vMquRqWmvAAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:22:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866C2133C5
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03210EC25;
	Thu,  5 Mar 2026 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dpkUk2bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E858810EC24;
 Thu,  5 Mar 2026 14:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772720543; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dhHotrpJ9KqRJ151GRidbQ7O7I8Zii4tdeRy5KEp7UCf2z+kCGRo5uKmvdMfZkNjGAK+QYYLDGfJoTGn4P5FNPFEK+1y2sC3vr2wbIwdOkRbbRiwW37s3APiC3pCtTzgYAiPjbf0M+tN4Zx1jRb7BQIB5vFKIpSEIRCqZYW3OKg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772720543;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Nt62OO2AP7f+cfOhlF2MV/RbDyVdkbuWQbRENaudCYk=; 
 b=mwXiC9Awy1qz2tezdUrKDjuHtxeaMxt3bkqi4h8mp1/PDPWt6USZ8NDuWHFB/6jSfYoGd3a4XcrCM9q3zay/+xe+b5GllZnUTjxCLyBAFCjWJRfcm66LPGRc0MaxGJ3cGVABu8FQqZsU2/ymMiet1LZBkXHd7dzD8t6q/1db3Lg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772720543; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Nt62OO2AP7f+cfOhlF2MV/RbDyVdkbuWQbRENaudCYk=;
 b=dpkUk2bl2HdHYvkA68Qkosm8mXHd7icpgM2YWGs3yQbwYuCL4M8occftf8xgdo/c
 /n9tBEU0Q8T5rJ8gozDuppEkGRUF+6G/tXd7OlwZct8eqsbWIeJBDjwDuCsC80Aa7kD
 IIpKVDbNuchA80uTkKgYACqKQZJbJI65+TgzkOqo=
Received: by mx.zohomail.com with SMTPS id 1772720542547564.5488591235232;
 Thu, 5 Mar 2026 06:22:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 05 Mar 2026 15:19:45 +0100
Subject: [PATCH v10 19/22] drm/tests: hdmi: Add tests for HDMI helper's
 mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-color-format-v10-19-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
In-Reply-To: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
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
X-Rspamd-Queue-Id: 7866C2133C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add some KUnit tests to verify that the HDMI state helper's mode_valid
implementation does not improperly reject chroma subsampled modes on the
basis of their clock rate not being satisfiable in RGB.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 3444c93c615f..74c9933eabfc 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -77,6 +77,23 @@ static struct drm_display_mode *find_420_only_mode(struct drm_connector *connect
 	return NULL;
 }
 
+static struct drm_display_mode *find_420_also_mode(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+
+	mutex_lock(&drm->mode_config.mutex);
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (drm_mode_is_420_also(&connector->display_info, mode)) {
+			mutex_unlock(&drm->mode_config.mutex);
+			return mode;
+		}
+	}
+	mutex_unlock(&drm->mode_config.mutex);
+
+	return NULL;
+}
+
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
 			      const void *edid, size_t edid_len)
 {
@@ -2745,11 +2762,103 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
 }
 
+/*
+ * Test that drm_hdmi_connector_mode_valid() will accept modes that require a
+ * 4:2:0 chroma subsampling, even if said mode would violate maximum clock
+ * constraints if it used RGB 4:4:4.
+ */
+static void drm_test_check_mode_valid_yuv420_only_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *dank;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 200 * 1000);
+
+	dank = find_420_only_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, dank);
+	KUNIT_EXPECT_EQ(test, dank->hdisplay, 3840);
+	KUNIT_EXPECT_EQ(test, dank->vdisplay, 2160);
+
+	/*
+	 * Note: The mode's "clock" here is not accurate to the actual TMDS
+	 * clock that HDMI will use for a subsampled mode. Hence, why the mode's
+	 * clock is above the .max_tmds_clock of 200MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, dank->clock, 297000);
+}
+
+/*
+ * Test that drm_hdmi_connector_mode_valid() will reject modes that require
+ * 4:2:0 chroma subsampling, if the connector does not support 4:2:0.
+ */
+static void
+drm_test_check_mode_valid_reject_yuv420_only_connector(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *dank;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 200 * 1000);
+
+	dank = find_420_only_mode(conn);
+	KUNIT_EXPECT_NULL(test, dank);
+}
+
+/*
+ * Test that drm_hdmi_connector_mode_valid() will accept modes that allow (among
+ * other color formats) 4:2:0 chroma subsampling, even if the connector does not
+ * support 4:2:0, but the mode's clock works for RGB 4:4:4.
+ */
+static void
+drm_test_check_mode_valid_accept_yuv420_also_connector_rgb(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 340 * 1000);
+
+	mode = find_420_also_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+	KUNIT_EXPECT_EQ(test, mode->hdisplay, 3840);
+	KUNIT_EXPECT_EQ(test, mode->vdisplay, 2160);
+	KUNIT_EXPECT_EQ(test, mode->clock, 297000);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
 	KUNIT_CASE(drm_test_check_mode_valid),
 	KUNIT_CASE(drm_test_check_mode_valid_reject),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_yuv420_only_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_yuv420_only_connector),
+	KUNIT_CASE(drm_test_check_mode_valid_accept_yuv420_also_connector_rgb),
 	{ }
 };
 

-- 
2.53.0

