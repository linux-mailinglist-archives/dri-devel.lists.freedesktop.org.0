Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68B790424
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8683210E7F4;
	Fri,  1 Sep 2023 23:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8850510E80D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:31 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68a3ced3ec6so2216838b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611750; x=1694216550;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T/+h1ksZof8y/lEEP6nhkNB4pCHzfTPQtm4LO74Tft4=;
 b=S2jl1jKoQU213s8T6A12rmEdEwcMyGNngqWlKFGv9FBtQAhzV7t0Ov5RMt2QICACA6
 rEjxJ3dahCRADqafXmpK1vSQx3XWOUwGQjQEv8t8VK3I07y1Xs1sXQY3My0lEDY8dYZq
 MDPOuyFdqbSdCeiPXkcmTC3WQ7OOoIV+UFs94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611750; x=1694216550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T/+h1ksZof8y/lEEP6nhkNB4pCHzfTPQtm4LO74Tft4=;
 b=QB7Y2U63g2thHV/pA36ZlFVtqCQ9NdgqX/tM58Q68bmQoyOldB4fr85Ghq1McyAPPS
 tCj0jdCALG1JwOYwsPhn0TbLIo6fBWYscnelM+RhBv7tcjACzbfBduTts3JFt2P0C6Ev
 dp9TTxy5fRTZwy3B37GYCvKo2xhfK23uMviIkZNhsn0vagZbRb9mg0hCWxLk89wcMRcv
 deyfi3qgHLn4LwGrD7DkzfgKTlN0mfbL9NmZiUuPc/n0cSkwcEnPlO77dlB19g5AmTWH
 APcH+qOaGdMc3X00B0pETma04DzguRQBrx66xGubdWkOhiAfPmLcGDSj1ZcP3MPLCs+9
 o13w==
X-Gm-Message-State: AOJu0YxL8RpQ1II/kVV5p4MuezG/qDKZuLjSHdec+AR4gr235DgqH9OO
 9uT6SgW1qyrZAhG6lj4vGpcHJNZebUgttNKIr3dprRpV
X-Google-Smtp-Source: AGHT+IEo8+vhlzHuiA7kt4gie7hkc/892ETxj7IzgIvbEImTbdys6UWMlOfB4tKXF+g1dIUU86Genw==
X-Received: by 2002:a05:6a00:139c:b0:68a:5449:7436 with SMTP id
 t28-20020a056a00139c00b0068a54497436mr4995293pfg.32.1693611750394; 
 Fri, 01 Sep 2023 16:42:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 02/15] drm/imx/dcss: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:13 -0700
Message-ID: <20230901164111.RFT.2.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/imx/dcss/dcss-drv.c | 8 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 7 +++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h | 1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index c68b0d93ae9e..b61cec0cc79d 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -92,6 +92,13 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void dcss_drv_platform_shutdown(struct platform_device *pdev)
+{
+	struct dcss_drv *mdrv = dev_get_drvdata(&pdev->dev);
+
+	dcss_kms_shutdown(mdrv->kms);
+}
+
 static struct dcss_type_data dcss_types[] = {
 	[DCSS_IMX8MQ] = {
 		.name = "DCSS_IMX8MQ",
@@ -114,6 +121,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
 	.remove	= dcss_drv_platform_remove,
+	.shutdown = dcss_drv_platform_shutdown,
 	.driver	= {
 		.name = "imx-dcss",
 		.of_match_table	= dcss_of_match,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 896de946f8df..d0ea4e97cded 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -172,3 +172,10 @@ void dcss_kms_detach(struct dcss_kms_dev *kms)
 	dcss_crtc_deinit(&kms->crtc, drm);
 	drm->dev_private = NULL;
 }
+
+void dcss_kms_shutdown(struct dcss_kms_dev *kms)
+{
+	struct drm_device *drm = &kms->base;
+
+	drm_atomic_helper_shutdown(drm);
+}
diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.h b/drivers/gpu/drm/imx/dcss/dcss-kms.h
index dfe5dd99eea3..62521c1fd6d2 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.h
@@ -34,6 +34,7 @@ struct dcss_kms_dev {
 
 struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss);
 void dcss_kms_detach(struct dcss_kms_dev *kms);
+void dcss_kms_shutdown(struct dcss_kms_dev *kms);
 int dcss_crtc_init(struct dcss_crtc *crtc, struct drm_device *drm);
 void dcss_crtc_deinit(struct dcss_crtc *crtc, struct drm_device *drm);
 struct dcss_plane *dcss_plane_init(struct drm_device *drm,
-- 
2.42.0.283.g2d96d420d3-goog

