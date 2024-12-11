Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E99ED84C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBE510E639;
	Wed, 11 Dec 2024 21:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bgm6ucBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0931510E639
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:19:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBHD4UX015003;
 Wed, 11 Dec 2024 21:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TKK9DAgc0xTYmSj3b/3Uh1BYrxJnWRWY6+Zu4M3Jo1o=; b=bgm6ucBbr+wQ7K5y
 h/++nmrbdHNzf6og8U2+o1T3PIeYBw8xee2PRvcKy7VDSib4nKVtQ6jhQyUiXNi4
 q/IRZOCJe2a2JacvAHzsKeXLgoFFQY8WoL+TFpDplRXOeJx34nT7b3j+5FH7aA7k
 zQGp1CL+fmGPEL/zxfeBmKiZxy9JTJWiUBZ536WqTPgdxvP/CRyAXnJTXEnmfsoX
 8/KBqCBLc1yYecPoIU8vE69kVUPxQ7TvOeOKtaFhaFiiPVRxHKDWkhuBvw1KS8rg
 0NcrJrpX/whDLIij/TyyJgReMoNRjEKRWp1y1NKnXTCNWOPWAVukvqwLm3WYtKGF
 QzwqIQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpj3cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 21:18:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBLIwGl024685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 21:18:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 13:18:58 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 11 Dec 2024 13:18:43 -0800
Subject: [PATCH v3 2/2] drm/tests: Add test for
 drm_atomic_helper_commit_modeset_disables()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-abhinavk-modeset-fix-v3-2-0de4bf3e7c32@quicinc.com>
References: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
In-Reply-To: <20241211-abhinavk-modeset-fix-v3-0-0de4bf3e7c32@quicinc.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733951937; l=9053;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=OubSwpfp7lfF5L2IgmX5LsjYr4bTJ5fMy2aZYhqorwo=;
 b=hdqeNphQ0HMw7QDeckmw30N+0OcEZqYukuCroo8d63GQKSuYKUh7Qfd1yCrMM4SH6PsBxeZzA
 D27f9pYMaGzDPXQZR7IqQXxTssJFL1xD5NwBI4n64fJhIdCsBK4xGsW
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Vf28Ux0EB_100z0Dfqh49-sRq-u9oVBC
X-Proofpoint-ORIG-GUID: Vf28Ux0EB_100z0Dfqh49-sRq-u9oVBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110149
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

Add a subtest to check that modeset is called when the connector is
changed

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v3:
- Use BUILD_BUG_ON to check connectors and encoders array sizes (Dmitry)
- Renamed functions to be more test-specific (Dmitry)
- Added comment description for test (Dmitry)
- Return get_modes_fixed() directly within the encoder get_modes
  function (Dmitry)
- Move drm_connector local variable declaration to top of function
  (Dmitry)
- Changed drm_test_modeset() to a more descriptive name
---
 drivers/gpu/drm/tests/Makefile                |   1 +
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 244 ++++++++++++++++++++++++++
 2 files changed, 245 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 56dab563abd7a7ee7c147bd6b4927e2436b82e1d..0109bcf7faa54993cce337f522eae78f0fa6ffcb 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
 	drm_kunit_helpers.o
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
+	drm_atomic_state_test.o \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
 	drm_connector_test.o \
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..be1f780249450ead7fbfd19ea98c96b442a94478
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test cases for the drm_atomic_state helpers
+ *
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_uapi.h>
+#include <drm/drm_kunit_helpers.h>
+#include <drm/drm_probe_helper.h>
+
+#define DRM_TEST_ENC_0 BIT(0)
+#define DRM_TEST_ENC_1 BIT(1)
+#define DRM_TEST_ENC_2 BIT(2)
+
+#define DRM_TEST_CONN_0 BIT(0)
+
+static const struct drm_display_mode drm_atomic_test_mode = {
+	DRM_MODE("1024x768", 0, 65000, 1024, 1048,
+		 1184, 1344, 0, 768, 771, 777, 806, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
+};
+
+struct drm_atomic_test_priv {
+	struct drm_device drm;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder encoders[3];
+	struct drm_connector connectors[2];
+};
+
+static int modeset_counter;
+
+static void drm_test_encoder_mode_set(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	modeset_counter++;
+}
+
+static const struct drm_encoder_helper_funcs drm_atomic_test_encoder_funcs = {
+	.atomic_mode_set	= drm_test_encoder_mode_set,
+};
+
+static const struct drm_connector_funcs dummy_connector_funcs = {
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.reset			= drm_atomic_helper_connector_reset,
+};
+
+static int drm_atomic_test_dummy_get_modes(struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector,
+						    &drm_atomic_test_mode);
+}
+
+static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
+	.get_modes	= drm_atomic_test_dummy_get_modes,
+};
+
+static struct drm_atomic_test_priv *
+drm_atomic_test_init_drm_components(struct kunit *test, bool has_connectors)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_encoder *enc;
+	struct drm_connector *conn;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_atomic_test_priv,
+						 drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+	test->priv = priv;
+
+	drm = &priv->drm;
+	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
+							    NULL,
+							    NULL,
+							    NULL, 0,
+							    NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
+
+	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
+						  priv->plane, NULL,
+						  NULL,
+						  NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
+
+	for (int i = 0; i < ARRAY_SIZE(priv->encoders); i++) {
+		enc = &priv->encoders[i];
+
+		ret = drmm_encoder_init(drm, enc, NULL,
+					DRM_MODE_ENCODER_DSI, NULL);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		enc->possible_crtcs = drm_crtc_mask(priv->crtc);
+	}
+
+	priv->encoders[0].possible_clones = DRM_TEST_ENC_0 | DRM_TEST_ENC_1;
+	priv->encoders[1].possible_clones = DRM_TEST_ENC_0 | DRM_TEST_ENC_1;
+	priv->encoders[2].possible_clones = DRM_TEST_ENC_2;
+
+	if (!has_connectors)
+		goto done;
+
+	BUILD_BUG_ON(ARRAY_SIZE(priv->connectors) > ARRAY_SIZE(priv->encoders));
+
+	for (int i = 0; i < ARRAY_SIZE(priv->connectors); i++) {
+		conn = &priv->connectors[i];
+
+		ret = drmm_connector_init(drm, conn, &dummy_connector_funcs,
+					  DRM_MODE_CONNECTOR_DSI, NULL);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+
+		drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
+		drm_encoder_helper_add(&priv->encoders[i],
+				       &drm_atomic_test_encoder_funcs);
+
+		drm_connector_attach_encoder(conn, &priv->encoders[i]);
+	}
+
+done:
+	drm_mode_config_reset(drm);
+
+	return priv;
+}
+
+static int set_up_atomic_state(struct kunit *test,
+			       struct drm_atomic_test_priv *priv,
+			       struct drm_connector *connector,
+			       struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *drm = &priv->drm;
+	struct drm_crtc *crtc = priv->crtc;
+	struct drm_atomic_state *state;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	if (connector) {
+		conn_state = drm_atomic_get_connector_state(state, connector);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+		ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
+		KUNIT_EXPECT_EQ(test, ret, 0);
+	}
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, &drm_atomic_test_mode);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	if (connector) {
+		ret = drm_atomic_commit(state);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	} else {
+		// dummy connector mask
+		crtc_state->connector_mask = DRM_TEST_CONN_0;
+	}
+
+	return 0;
+}
+
+/*
+ * Test that the DRM encoder mode_set() is called when the atomic state
+ * connectors are changed but the CRTC mode is not.
+ */
+static void drm_test_check_connector_changed_modeset(struct kunit *test)
+{
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_connector *old_conn, *new_conn;
+	struct drm_atomic_state *state;
+	struct drm_device *drm;
+	struct drm_connector_state *new_conn_state, *old_conn_state;
+	int ret, initial_modeset_count;
+
+	priv = drm_atomic_test_init_drm_components(test, true);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+	old_conn = &priv->connectors[0];
+	new_conn = &priv->connectors[1];
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	// first modeset to enable
+	ret = set_up_atomic_state(test, priv, old_conn, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	new_conn_state = drm_atomic_get_connector_state(state, new_conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
+
+	old_conn_state = drm_atomic_get_connector_state(state, old_conn);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
+
+	ret = drm_atomic_set_crtc_for_connector(old_conn_state, NULL);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	ret = drm_atomic_set_crtc_for_connector(new_conn_state, priv->crtc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	initial_modeset_count = modeset_counter;
+
+	// modeset_disables is called as part of the atomic commit tail
+	ret = drm_atomic_commit(state);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, modeset_counter, initial_modeset_count + 1);
+}
+
+static struct kunit_case drm_test_check_modeset_test[] = {
+	KUNIT_CASE(drm_test_check_connector_changed_modeset),
+	{}
+};
+
+static struct kunit_suite drm_test_check_modeset_test_suite = {
+	.name = "drm_validate_modeset",
+	.test_cases = drm_test_check_modeset_test,
+};
+
+kunit_test_suite(drm_test_check_modeset_test_suite);
+
+MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com");
+MODULE_DESCRIPTION("Test cases for the drm_atomic_helper functions");
+MODULE_LICENSE("GPL");

-- 
2.34.1

