Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB417A9D26
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05FF10E5FF;
	Thu, 21 Sep 2023 19:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117E10E5FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:42 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so11227875ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324521; x=1695929321;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iA2li7ELqa/hnFznycO86SuLFz051HXi1UIFyEU+SsY=;
 b=Lc29iVe+2y7h3ODTW3MChqgAI/Pnj9IkWZFZXAbG/huQ1B854wD18rvOL67JxvhM66
 0hxC37ibtZeC2Qp0c57YwYXwScoUf4Z6ImSw5mOoheuGxqXInniJ634VyrOno5rcNv+0
 kuktwpbUI7Vl1aKmvDyjbezKDZtVO/kW4Zdfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324521; x=1695929321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iA2li7ELqa/hnFznycO86SuLFz051HXi1UIFyEU+SsY=;
 b=LbbGazbPKAAGe/lUnZJV8YQufSexfn0pHt8EqILkl3VvIW5mVpp8u/pZiNU4FMjxZ0
 hiN0+S4hhq6urhYKFVKHV2D6vAKPUCllZgY6UaLsJAfq5e0tiuUn0YqDmJQcVmFU4L6v
 exk0YCwhDb5GUdDUeTHdkl07PHasDeDcOX8Ai/edjQlbtKvJAmS6LuBcXQu608VmSX/f
 h/eN17UslXgAUoKyCfpy1DADNXg6ZCdESyxkiq7Syy0OpIbpkmLt9BQvKaG7+Cgf0fwC
 P9fj4J7cmxeZlhc8EHKwsO21s9QqNVTyUPTDeuCNlFoKcsB+JWasJOkxEfKZ6ZZjaSF8
 Vafg==
X-Gm-Message-State: AOJu0Yz5xa7VnngNZRhwieqi8Q9akH/FKZDMaBame590kbyeQrpOJLpB
 KsaGprAJ7zMxRXVy6CO+KEnjiztXcnq46ZTJLzJ0DXfX
X-Google-Smtp-Source: AGHT+IGqiH8+93CjsgTzwhYDRPl823KLkGG4+0EgU7Nds+tbBUgFbUmFj98SJgfl8Opc5kzECLW4aw==
X-Received: by 2002:a17:903:1205:b0:1c4:638:fff4 with SMTP id
 l5-20020a170903120500b001c40638fff4mr6441686plh.17.1695324521206; 
 Thu, 21 Sep 2023 12:28:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown() at
 shutdown/unbind time
Date: Thu, 21 Sep 2023 12:26:52 -0700
Message-ID: <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

(no changes since v1)

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
2.42.0.515.g380fc7ccd1-goog

