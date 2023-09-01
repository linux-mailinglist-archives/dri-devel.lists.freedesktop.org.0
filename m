Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11405790431
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C6C10E83C;
	Fri,  1 Sep 2023 23:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784A810E83C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:54 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-34e12396f6fso4575125ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611773; x=1694216573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzZMfYrc4MS7Ddrskta252Gk/vbJZVRLTsLEIZtE5Vw=;
 b=GJd7eER/L7IAJXH04mokh23kTh4307Yzhb7gNUDZw6KCgaV1hXvNfif8FARlQ9CEvE
 14Mi/gUQCJoLgP703UCe4fk4K5l9rP0ipxqUyneIVGRO9sRdgqSa8rtOvBwC2098F52u
 yexIT9nFrPac4ByNRO5pS9JQs+f3IovOndVh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611773; x=1694216573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzZMfYrc4MS7Ddrskta252Gk/vbJZVRLTsLEIZtE5Vw=;
 b=Zl9TNocWAmIo9jlh7xjIW5ZL1Lbbuf8Pb59Rzi8KYLtyT6WvrDqqDgtCNzqdGpBShB
 mdmivgSRSfi7Cw/sDje4AGGvFjaBC74xqWw90sK3OP81q+ouus72CQY1C4q4YzzvOT/z
 FGE/Lh4e1mGBxtLXnP/b4bnRpBNrGFC8eso2NlHdoElXEu/y3rKeKtjVikJxGers6UUw
 Mt5AtCDvrhsAcQ5XpMgJUsjUlWPjT/zWpeHlWxFZeOJLpOrHD9pRBsm7J9YLgXSqa9uZ
 tKnloujUuiQGsS8g/ByIZfsyJJUibXp8DCbcdP3dhu6ZBAHdUOONwEWI06Aqcl8/uCVP
 4vTQ==
X-Gm-Message-State: AOJu0Yz+El9gzu3PavmRxDDw+JFrWOA69qtJaKO1rErZm6a9fpndt1n7
 wdw8+HqQy/6ww7W6hp/jZ1ciBHEsdk3sIRg+ZRtitqwu
X-Google-Smtp-Source: AGHT+IFvdRCJwMr99Yb1JrwpTHYD/RaTUnsuipwnbiYPCDCcEBVC17WQxgviFC4gHISPtQjZ2Wly3g==
X-Received: by 2002:a05:6e02:1a21:b0:348:fe3b:c8b with SMTP id
 g1-20020a056e021a2100b00348fe3b0c8bmr5295836ile.1.1693611773002; 
 Fri, 01 Sep 2023 16:42:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 13/15] drm/imx/ipuv3: Call drm_atomic_helper_shutdown() at
 shutdown/unbind time
Date: Fri,  1 Sep 2023 16:41:24 -0700
Message-ID: <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
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
 Douglas Anderson <dianders@chromium.org>, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown time
and at driver unbind time. Among other things, this means that if a
panel is in use that it won't be cleanly powered off at system
shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart and at driver remove (or unbind) time comes
straight out of the kernel doc "driver instance overview" in
drm_drv.c.

A few notes about this fix:
- When adding drm_atomic_helper_shutdown() to the unbind path, I added
  it after drm_kms_helper_poll_fini() since that's when other drivers
  seemed to have it.
- Technically with a previous patch, ("drm/atomic-helper:
  drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
  actually need to check to see if our "drm" pointer is NULL before
  calling drm_atomic_helper_shutdown(). We'll leave the "if" test in,
  though, so that this patch can land without any dependencies. It
  could potentially be removed later.
- This patch also makes sure to set the drvdata to NULL in the case of
  bind errors to make sure that shutdown can't access freed data.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4a866ac60fff..4c8bc49758a7 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -257,6 +257,7 @@ static int imx_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 	component_unbind_all(drm->dev, drm);
 err_kms:
+	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
 
 	return ret;
@@ -269,6 +270,7 @@ static void imx_drm_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
 
@@ -298,6 +300,14 @@ static int imx_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void imx_drm_platform_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (drm)
+		drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int imx_drm_suspend(struct device *dev)
 {
@@ -325,6 +335,7 @@ MODULE_DEVICE_TABLE(of, imx_drm_dt_ids);
 static struct platform_driver imx_drm_pdrv = {
 	.probe		= imx_drm_platform_probe,
 	.remove		= imx_drm_platform_remove,
+	.shutdown	= imx_drm_platform_shutdown,
 	.driver		= {
 		.name	= "imx-drm",
 		.pm	= &imx_drm_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog

