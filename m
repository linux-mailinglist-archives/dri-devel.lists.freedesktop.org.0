Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCA9F3F0F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C1610E808;
	Tue, 17 Dec 2024 00:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dtL6YqKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB2410E807;
 Tue, 17 Dec 2024 00:43:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIcKLA011335;
 Tue, 17 Dec 2024 00:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oXp8uooo7O1PH3mPolaSjyJa1LhHR2iSlMq7cXgj13k=; b=dtL6YqKhNYLfEZo8
 ZzHDtgttJDHIyR8QC6HDvfv+9FLpck3ikErYvq+aRrCFZGbw1jcmS7NNJn8nMzbJ
 Hx20CmiPY84NdU8VKuWPNMQtCmdVP6pfMWDpLKrN4bdefuKb9f2qDFgqzq8CdBlH
 NFIqb1fy8/fEzZ/rpRrAM9LsxKzbAj6xZLZ7vwr+XajSNkEsQpwA9RHxdu5yjIN6
 bb7uENKDSsOQxnHc3g9hEVSyey9AOzKz3EBy2Gs15hgyTDAf8Zhol4biXvGhGuSN
 lqTBl7lW8aprLq9fo9W7VUkHOFWNJszqTx7Ekk/k1S0dceS0QePwFgtFbh9OS/tg
 2AMNmQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9gph4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hQ0d030593
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:15 -0800
Subject: [PATCH v4 04/25] drm/tests: Add test for
 drm_atomic_helper_check_modeset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-4-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=3664;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=MTKvcQ6cG+S8dlXwn6nuWdwi3hJ12QM+PxKwG3Jdzbg=;
 b=FuZGosISjNBUo+SOeESkrZwXoBl+GGbpxPxZ8VrSQtYKoTQI8yVStGD8LPhtykuQ9fYpHOIAl
 YTERivNP1/VBLiNgRIKBskfw+8dNlCLIg9FcUKOf9YSsJNohxjTYmjL
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C6TRIZUxl4sRdlFN2OEEk-6dlcQE4PGD
X-Proofpoint-ORIG-GUID: C6TRIZUxl4sRdlFN2OEEk-6dlcQE4PGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004
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

Add a test for drm_atomic_check_modeset() specifically to validate
drm_atomic_check_valid_clones() helper

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 71 +++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
index 79bc5a9aedbf77aaf4b369a5fe62b6344e6859cf..0ab5d9ec4a7503d0a96cd21d40817c35fdbcea24 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -253,12 +253,59 @@ static void drm_test_check_in_clone_mode(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, ret, param->expected_result);
 }
 
+/*
+ * Test that the atomic commit path will succeed for valid clones (or non-cloned
+ * states) and fail for states where the cloned encoders are not possible_clones
+ * of each other.
+ */
+static void drm_test_check_valid_clones(struct kunit *test)
+{
+	int ret;
+	const struct drm_clone_mode_test *param = test->param_value;
+	struct drm_atomic_test_priv *priv;
+	struct drm_modeset_acquire_ctx *ctx;
+	struct drm_device *drm;
+	struct drm_atomic_state *state;
+	struct drm_crtc_state *crtc_state;
+
+	priv = drm_atomic_test_init_drm_components(test, false);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	drm = &priv->drm;
+
+	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ret = set_up_atomic_state(test, priv, NULL, ctx);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
+
+	crtc_state->encoder_mask = param->encoder_mask;
+
+	// force modeset
+	crtc_state->mode_changed = true;
+
+	ret = drm_atomic_helper_check_modeset(drm, state);
+	KUNIT_ASSERT_EQ(test, ret, param->expected_result);
+}
+
 static void drm_check_in_clone_mode_desc(const struct drm_clone_mode_test *t,
 				      char *desc)
 {
 	sprintf(desc, "%s", t->name);
 }
 
+static void drm_check_valid_clones_desc(const struct drm_clone_mode_test *t,
+				      char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+
 static const struct drm_clone_mode_test drm_clone_mode_tests[] = {
 	{
 		.name = "in_clone_mode",
@@ -272,9 +319,31 @@ static const struct drm_clone_mode_test drm_clone_mode_tests[] = {
 	},
 };
 
+static const struct drm_clone_mode_test drm_valid_clone_mode_tests[] = {
+	{
+		.name = "not_in_clone_mode",
+		.encoder_mask = DRM_TEST_ENC_0,
+		.expected_result = 0,
+	},
+
+	{
+		.name = "valid_clone",
+		.encoder_mask = DRM_TEST_ENC_0 | DRM_TEST_ENC_1,
+		.expected_result = 0,
+	},
+	{
+		.name = "invalid_clone",
+		.encoder_mask = DRM_TEST_ENC_0 | DRM_TEST_ENC_2,
+		.expected_result = -EINVAL,
+	},
+};
+
 KUNIT_ARRAY_PARAM(drm_check_in_clone_mode, drm_clone_mode_tests,
 		  drm_check_in_clone_mode_desc);
 
+KUNIT_ARRAY_PARAM(drm_check_valid_clones, drm_valid_clone_mode_tests,
+		  drm_check_valid_clones_desc);
+
 static struct kunit_case drm_test_check_modeset_test[] = {
 	KUNIT_CASE(drm_test_check_connector_changed_modeset),
 	{}
@@ -283,6 +352,8 @@ static struct kunit_case drm_test_check_modeset_test[] = {
 static struct kunit_case drm_in_clone_mode_check_test[] = {
 	KUNIT_CASE_PARAM(drm_test_check_in_clone_mode,
 			 drm_check_in_clone_mode_gen_params),
+	KUNIT_CASE_PARAM(drm_test_check_valid_clones,
+			 drm_check_valid_clones_gen_params),
 	{}
 };
 

-- 
2.34.1

