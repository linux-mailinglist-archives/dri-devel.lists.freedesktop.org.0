Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2579042F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED51310E839;
	Fri,  1 Sep 2023 23:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E0810E838
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:50 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5733d431209so1506288eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611769; x=1694216569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uOG7orqF4actDsz25kkoaGcb+oSREvVrWkgMBMJJLo=;
 b=D5CV0B0Mo/BpErlWx0TwiKC/tX37o3N9VATZnnvAmVtxxvLOU2MC4G9xKQms8aChx9
 e5BPS0/zoStWApBSngoHUu4zF+Sd/R87eChQtO2PzZO2AH8Tr3iyJY8gO3vkq+FnRCHD
 6Yu6/P7zRh2u1FIQbzCe+uGmDrfZdsfUgL8R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611769; x=1694216569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uOG7orqF4actDsz25kkoaGcb+oSREvVrWkgMBMJJLo=;
 b=Q/3wOdqvcUUAvoIC8X6QVVMjUabYka0CL7uma25eWEYSqeWAcjRTM8B8uCgS+4yLNa
 QdP3fPSiPvM6Y++XtiG2d3wFoCMMXG7E2aTJ8j1PxDOzN2Rn9IDrY6rckyoM+BoxkoSe
 eBXrgR37263sUeZBnPd3ErDyy37YppyoFmnbsc86LaKqwX0pMfHNDvOYG8BxKe4lanD2
 Q3vXHXuFke9nqmEZxj6WPl2HarUx8JmFSZHSHvFd6nmSRb8ML4Yuui+bzk6su8wFMPmO
 3yGSXO5GDLJRjBb9ell1YLRxzNXXdG4tjgF78CZ2oP5zDjv05V3bMXqXsre6KTCbdZ5A
 rQIw==
X-Gm-Message-State: AOJu0YwB8SsjU4ZN4NMXpUECg6EsBI2+UpPmIwL/ocZuUc+rHaO1HyjB
 s35i2lYJvJ0RFEsKia7ZVmBh50VOOWBaCwi3SCS03rtr
X-Google-Smtp-Source: AGHT+IEtno2sAZxUeLfldTVuC/n8wvbt8r9p0WUGoKpJ49IMbd/DsuhRqnZWTnQHfwEPIadZyumfcA==
X-Received: by 2002:a05:6358:7e03:b0:127:f2fb:d103 with SMTP id
 o3-20020a0563587e0300b00127f2fbd103mr3928386rwm.16.1693611769417; 
 Fri, 01 Sep 2023 16:42:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 11/15] drm/exynos: Call drm_atomic_helper_shutdown() at
 shutdown/unbind time
Date: Fri,  1 Sep 2023 16:41:22 -0700
Message-ID: <20230901164111.RFT.11.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
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
Cc: linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
 sw0312.kim@samsung.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
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

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 8399256cb5c9..5380fb6c55ae 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
 	drm_mode_config_cleanup(drm);
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
+	dev_set_drvdata(dev, NULL);
 err_free_drm:
 	drm_dev_put(drm);
 
@@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
 	drm_mode_config_cleanup(drm);
@@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void exynos_drm_platform_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (drm)
+		drm_atomic_helper_shutdown(drm);
+}
+
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe	= exynos_drm_platform_probe,
 	.remove	= exynos_drm_platform_remove,
+	.shutdown = exynos_drm_platform_shutdown,
 	.driver	= {
 		.name	= "exynos-drm",
 		.pm	= &exynos_drm_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog

