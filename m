Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B021790427
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8F710E81C;
	Fri,  1 Sep 2023 23:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F33610E819
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:37 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a7aedc57ffso1704384b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611756; x=1694216556;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vomcb5R4YlkPi6yAEBTRSlkjqsgpX/8uar7hs/ep3QM=;
 b=mDz9IOv+b06KHrBmsYrjcszffq3UkqKl6OAYb0LY5auelRo4BP4QrfZkCSBty5PRJI
 bKKxgNMl/ex/AlkIHPTPe2/3hccdGVDRuYuyXAz6326LGzf0hC9MqEbAOhuYJVYVjyIy
 rPBsA2oKHfT1R78xmN7bjPZtkl0Qrs5U0ZFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611756; x=1694216556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vomcb5R4YlkPi6yAEBTRSlkjqsgpX/8uar7hs/ep3QM=;
 b=lxtirFTOZ7TVeBKvO0xC2ypdedvcjYAkzi1FYb6icneSsfixFgo4vUDSlYLnX2DBPv
 u41N9snprZT4PzHI7OwhbI728UlWf9LHozolwYOVClHFqfk+lAKv5ferJYoFZ/bt1FYQ
 NC8ddWirQ0JUEHQKhmtUO4B1E3rixISexpIOD+X5VCss5P7LWWLywLG8fGUA/7hzR+ei
 qwBqMmlk3QbQ3XUtOpw6qNdGet4w9g5iG0H4lG3vi9/9FBx73qcTy3rM57TtlYE9S/B8
 od5NmstE9ZACWc2/7EoSZSlj06Vce0+z2JmEi91hhBs20zlf42H6euBRivLBdK+5d1wZ
 Z00g==
X-Gm-Message-State: AOJu0YzdIJr6GDcMEb0UMvSCmS3zGM6ATYyWuzrUAyYrz6bvtvHJQgF+
 bdEhhgqY8KeXPLzpW/DKw4w35Gbx/UOJ99r8Kr1psiKi
X-Google-Smtp-Source: AGHT+IH161FDJO4p2lz9ilVRETKBQ5UyI7NChHl4VMZC9iScfWTxID2/lUEJl6hXY/byI5CWz2ElFA==
X-Received: by 2002:a05:6808:28e:b0:3a7:a299:1201 with SMTP id
 z14-20020a056808028e00b003a7a2991201mr4034449oic.23.1693611755813; 
 Fri, 01 Sep 2023 16:42:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 05/15] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:16 -0700
Message-ID: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
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
Cc: chunkuang.hu@kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

This driver users the component model and shutdown happens in the base
driver. The "drvdata" for this driver will always be valid if
shutdown() is called and we know that if the "drm" pointer in our
private data is non-NULL then we need to call
drm_atomic_helper_shutdown(). Technically with a previous patch,
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop"), we don't actually need to check to see if our "drm" pointer is
NULL before calling drm_atomic_helper_shutdown(). We'll leave the "if"
test in, though, so that this patch can land without any
dependencies. It could potentially be removed later.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 961715dd5b11..8b1c9c992ca8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -921,6 +921,14 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	if (private->drm)
+		drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -952,6 +960,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove	= mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.42.0.283.g2d96d420d3-goog

