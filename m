Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96367A9D14
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D994B10E5F3;
	Thu, 21 Sep 2023 19:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269610E5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:17 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c46b30a1ceso11386835ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324497; x=1695929297;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NI6y381yNrtia6QcCIC7z4DDn4lzJBG1Oz9c+agvn3E=;
 b=Ee0HTb1RsY1m4W/L4lJN5wV5Mi01d8HR4oRNkwHwOR73sJrLyet5HyQxI6w5dz1BLQ
 Ro2SJwbrSZ0DIJhpy0ExYmhzqmCHRsXp8q6hfWHIyOmvv7SF6+Z0Un4bGWJAUtYFBp6a
 hFGriRtaK26LLNg2UTDtQmHHIprCckBVYtqro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324497; x=1695929297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NI6y381yNrtia6QcCIC7z4DDn4lzJBG1Oz9c+agvn3E=;
 b=SuYPz3cdf/F0255jYxTPaaTndoxg9wMJNgBmuVVecGmtsCBF6fZ5JieThD3J0Q0lJ1
 OdBooA1LQNCbjEU7+C7iLOz+V9pBHLf4dV3FsRMXsA0oC6Ghbak58WTO4yx5rwu6VeAq
 DRplxsGbzQjmG+ZoepPsfwF6wGGOtKZ2CWhGVsnmAiKYjHzx4L90hd9Esm4vUhAUp1rg
 3JocxiSv9XDPkqLdpRVXfgVDGO1f+mflzjFsL8Asr/wOhaNJOBGBMVGD43tHl5y5lsWZ
 x+AMm23r2DcxJjlQdaj8j2Jv8gTIiZGIe0jfGqYQ200gYX/LDN787SFIo8v70MXK11yQ
 1L5g==
X-Gm-Message-State: AOJu0YwIQRWAB4LXZuVzdCWyf0hJwe6Q1KdBKnIyfvBVlADq1A7J1h8r
 HEZeZJvdTwqhpEn3kOiWUrKtkfl/o5/Mu1+Tu/wQuu1U
X-Google-Smtp-Source: AGHT+IEwO0wT0IFYtUWxf8dEr+TXDKdYpZSldG17COiUXE+UPVFkQVI7f6AGosPMSTOkM8sO3JyqHw==
X-Received: by 2002:a17:902:ab17:b0:1c4:4efc:90a6 with SMTP id
 ik23-20020a170902ab1700b001c44efc90a6mr6250166plb.38.1695324496702; 
 Thu, 21 Sep 2023 12:28:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 01/12] drm/imx/dcss: Call drm_atomic_helper_shutdown()
 at shutdown time
Date: Thu, 21 Sep 2023 12:26:44 -0700
Message-ID: <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

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
2.42.0.515.g380fc7ccd1-goog

