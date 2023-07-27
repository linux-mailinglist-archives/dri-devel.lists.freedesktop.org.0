Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7A765E94
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B59F10E60C;
	Thu, 27 Jul 2023 21:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01080501.me.com (qs51p00im-qukt01080501.me.com
 [17.57.155.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFBF10E60C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494770; bh=KmnZ+NHz7PM0U1A/IX51H2Bjow4KLdppH5jj9uz/ocI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=HfaFosewupSVW4LocN+Fh45yv/yOk7DM9vl1uPwvbMH+nnbcnyarbV9vT40J2YooV
 UYMrQFw1oPX8FyWjC4KfhWDMT1KtcbCydp+3dKYrphHGkml97N29HcFeTPMiZTld/X
 89F2gfJZ2zapirmPqwaGu2ww6kZ5RvNlTwSRo5ll5x/T4vjkF19qNs9OHlmossenC2
 R607BIJEEV44c0Qg1g2sy27AQFbd4zC1ZbNH8dzq5IQuAPlvuxFAkxIVR1Rl5xxJ0v
 CB1NZXHlgHphrtEdk0ICdE8UKPEYMRiQ0O0P9W3U8nVvq5bPjwbd3NNcOgirSqZxuG
 0qXkjFvsyO5dQ==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01080501.me.com (Postfix) with ESMTPSA id
 0D14B1980373; Thu, 27 Jul 2023 21:52:49 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 10/14] drm/sti: add compositor support for stih418 platform
Date: Thu, 27 Jul 2023 21:51:34 +0000
Message-Id: <20230727215141.53910-11-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: caJkhSSYKcGWfwaRe3kL8KLlbXUXZNhq
X-Proofpoint-ORIG-GUID: caJkhSSYKcGWfwaRe3kL8KLlbXUXZNhq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270198
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the STiH418, a new clock (proc_mixer) must be enabled in order
to have the plane mixers properly behaving.  Add a new
st,stih418-compositor in order to describe the planes/mixers
available on this platform.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/sti_compositor.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/sti/sti_compositor.h |  2 ++
 drivers/gpu/drm/sti/sti_crtc.c       | 11 +++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 4bd7e305ab75..dfea3c1191a6 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -43,6 +43,23 @@ static const struct sti_compositor_data stih407_compositor_data = {
 	},
 };
 
+/*
+ * stiH418 compositor properties
+ */
+static const struct sti_compositor_data stih418_compositor_data = {
+	.nb_subdev = 8,
+	.subdev_desc = {
+			{STI_GPDPLUS_SUBDEV, (int)STI_GDP_0, 0x00000},
+			{STI_GPDPLUS_SUBDEV, (int)STI_GDP_1, 0x10000},
+			{STI_GPDPLUS_SUBDEV, (int)STI_GDP_2, 0x20000},
+			{STI_GPDPLUS_SUBDEV, (int)STI_GDP_3, 0x30000},
+			{STI_GPD_SUBDEV, (int)STI_GDP_4, 0x40000},
+			{STI_GPD_SUBDEV, (int)STI_GDP_5, 0x50000},
+			{STI_MIXER_MAIN_SUBDEV, STI_MIXER_MAIN, 0x100000},
+			{STI_MIXER_AUX_SUBDEV, STI_MIXER_AUX, 0x110000},
+	},
+};
+
 void sti_compositor_debugfs_init(struct sti_compositor *compo,
 				 struct drm_minor *minor)
 {
@@ -169,6 +186,9 @@ static const struct of_device_id compositor_of_match[] = {
 	{
 		.compatible = "st,stih407-compositor",
 		.data = &stih407_compositor_data,
+	}, {
+		.compatible = "st,stih418-compositor",
+		.data = &stih418_compositor_data,
 	}, {
 		/* end node */
 	}
@@ -236,6 +256,12 @@ static int sti_compositor_probe(struct platform_device *pdev)
 		return PTR_ERR(compo->clk_pix_aux);
 	}
 
+	compo->clk_proc_mixer = devm_clk_get_optional(dev, "proc_mixer");
+	if (IS_ERR(compo->clk_proc_mixer)) {
+		DRM_ERROR("Cannot get proc_mixer clock\n");
+		return PTR_ERR(compo->clk_proc_mixer);
+	}
+
 	/* Get reset resources */
 	compo->rst_main = devm_reset_control_get_shared(dev, "compo-main");
 	/* Take compo main out of reset */
diff --git a/drivers/gpu/drm/sti/sti_compositor.h b/drivers/gpu/drm/sti/sti_compositor.h
index 62545210b96d..fdc655f78579 100644
--- a/drivers/gpu/drm/sti/sti_compositor.h
+++ b/drivers/gpu/drm/sti/sti_compositor.h
@@ -57,6 +57,7 @@ struct sti_compositor_data {
  * @clk_compo_aux: clock for aux compo
  * @clk_pix_main: pixel clock for main path
  * @clk_pix_aux: pixel clock for aux path
+ * @clk_proc_mixer: clock for the mixers
  * @rst_main: reset control of the main path
  * @rst_aux: reset control of the aux path
  * @mixer: array of mixers
@@ -72,6 +73,7 @@ struct sti_compositor {
 	struct clk *clk_compo_aux;
 	struct clk *clk_pix_main;
 	struct clk *clk_pix_aux;
+	struct clk *clk_proc_mixer;
 	struct reset_control *rst_main;
 	struct reset_control *rst_aux;
 	struct sti_mixer *mixer[STI_MAX_MIXER];
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..d93764e99b0e 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -67,6 +67,12 @@ sti_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode)
 		pix_clk = compo->clk_pix_aux;
 	}
 
+	/* Enable the mixer processing clock (if applicable) */
+	if (clk_prepare_enable(compo->clk_proc_mixer)) {
+		DRM_INFO("Failed to prepare/enable processing mixer clk\n");
+		goto proc_mixer_error;
+	}
+
 	/* Prepare and enable the compo IP clock */
 	if (clk_prepare_enable(compo_clk)) {
 		DRM_INFO("Failed to prepare/enable compositor clk\n");
@@ -97,6 +103,8 @@ sti_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode)
 pix_error:
 	clk_disable_unprepare(compo_clk);
 compo_error:
+	clk_disable_unprepare(compo->clk_proc_mixer);
+proc_mixer_error:
 	return -EINVAL;
 }
 
@@ -122,6 +130,9 @@ static void sti_crtc_disable(struct drm_crtc *crtc)
 		clk_disable_unprepare(compo->clk_compo_aux);
 	}
 
+	/* Disable the mixer clock (if applicable) */
+	clk_disable_unprepare(compo->clk_proc_mixer);
+
 	mixer->status = STI_MIXER_DISABLED;
 }
 
-- 
2.34.1

