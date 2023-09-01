Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F328790434
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DF410E840;
	Fri,  1 Sep 2023 23:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEBD10E83F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:58 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a8614fe8c4so1603446b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611777; x=1694216577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IdM+lGT73cjSOBSP8IlsC1l9xDfQI2J1yvb0n4/3ZvY=;
 b=bd/48yII4/iHlNgmq7YYVcix0dLpIO7UhlkkMh2BIWqidhEmvICMtFcmL7wuM/ab3b
 IXNUarvhYl6fAgnbOlrzySYCUfgOLSE9LZ8MkSOeyA/lYDT7riK3qbIqz8uMqAFolKpC
 7JlrdxAPGMRyHlpt6i9vHsW9NjDMSEgKYNydc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611777; x=1694216577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdM+lGT73cjSOBSP8IlsC1l9xDfQI2J1yvb0n4/3ZvY=;
 b=MpW9R/9SNdu4MKk0KcSQ4CXhva9jBo5KAI2bxPEvM0kKzjw6dbnjizhxOFM/AYZYW7
 4xlbe+z/8dXKZyP23Lv6iQS7kz2tFemsq5Td6T7V1KjCch7gSZfuEUE9F8n2azd3RYXW
 Ov4h0/V8LTXW3g1I6133+iI1go374UvYyDBglBHNVl4i7z2d9bgvEDUT0xT4XmvwmnEh
 gOaYOp/lM5d6ygTSZJCvqC1Nqbxq5MaoT1lCnmT2Bt8RrrnpsoT+Re5Xze/Y1xEUD9Zl
 Mn2CMUSD2dfS+WC4ISsoGsyZWwEigjhkRnvPzqPHCRqzHnKCrhixJ1qqFqvXJ0vM7zy3
 rFLA==
X-Gm-Message-State: AOJu0YyddyHQvSz+MpThELGkkPR+HRKBhf6QpqcEGIE/kV/PPYvHgbTQ
 7UDN5PM+YFtelLwgYJGLD0z5YtL908D4GvyyABbf2tb3
X-Google-Smtp-Source: AGHT+IFcdBjJJQwlyQ5ZEP5yP3QLZHGZAWqiXZ/QhDSapWZmB7jAL9+asxO5XakvnmAO3TBkPL5opA==
X-Received: by 2002:a05:6808:919:b0:3a7:46d2:5203 with SMTP id
 w25-20020a056808091900b003a746d25203mr4110653oih.51.1693611776821; 
 Fri, 01 Sep 2023 16:42:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 15/15] drm/renesas/shmobile: Call
 drm_helper_force_disable_all() at shutdown/remove time
Date: Fri,  1 Sep 2023 16:41:26 -0700
Message-ID: <20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
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
Cc: paul@crapouillou.net, tzimmermann@suse.de, geert+renesas@glider.be,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown(), or in this case the
non-atomic equivalent drm_helper_force_disable_all(), at system
shutdown time and at driver remove time. This is important because
drm_helper_force_disable_all() will cause panels to get disabled
cleanly which may be important for their power sequencing. Future
changes will remove any custom powering off in individual panel
drivers so the DRM drivers need to start getting this right.

The fact that we should call drm_atomic_helper_shutdown(), or in this
case the non-atomic equivalent drm_helper_force_disable_all(), in the
case of OS shutdown/restart comes straight out of the kernel doc
"driver instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 30493ce87419..d6dd46c925c5 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -15,6 +15,7 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -179,12 +180,20 @@ static int shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
+	drm_helper_force_disable_all(ddev);
 	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
 
 	return 0;
 }
 
+static void shmob_drm_shutdown(struct platform_device *pdev)
+{
+	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
+
+	drm_helper_force_disable_all(sdev->ddev);
+}
+
 static int shmob_drm_probe(struct platform_device *pdev)
 {
 	struct shmob_drm_platform_data *pdata = pdev->dev.platform_data;
@@ -289,6 +298,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove		= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
-- 
2.42.0.283.g2d96d420d3-goog

