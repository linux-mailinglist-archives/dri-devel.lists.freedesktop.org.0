Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3457A9D19
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1710E5F6;
	Thu, 21 Sep 2023 19:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF0C10E5F0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:25 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c44c0f9138so11042705ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324503; x=1695929303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhFda07Eo+JhAQAACXr7n7to50ItTosGgo10Du+RGvo=;
 b=Sd3LS6zmQwgBdodFIU2oAG6h4c/v2Fvipe2O1CS7oJ+h3eiWnoAOBE3BB8r8CKpy/L
 N25USdgaR8sYJewdxQKY0TV4rxJ/+Reyi0G6i6c5UCG2RgorfnACAl+T4upUzFhJmbm4
 oXIc4z7Ut1vnR9qxZUpfqREvHN3utC84E9CEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324503; x=1695929303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhFda07Eo+JhAQAACXr7n7to50ItTosGgo10Du+RGvo=;
 b=pKs/ugWsULOWq9Zb5ZTe/j5A52DXcyL1heol0W683iwEF/YyXuIcQn2+sVa7HnEdPz
 0mEYgYEOhfTLXuOcYXnM6Kw2wsj/nXxrnoGXT3hJQzzIs30TsKQ5pEFbojtQ5H6ok5bp
 tofQ6AdTbUGUzRZQGmF8XHvjjaiB4H4mbae1d6p1Eu1zQbnj20SiMQVfVE9kj/mNnn4K
 f2MAzFaTOC2Ir9dbPkpVGZJkGzXLaRCoPUxH2C6V7J2SKzKFfadvh5Fw5GnO70AF4ilI
 yYs9tfFT46wjfGC2/G0IJ6rwMQ9ULBvSmZEumM6jWJW2nzP79OqgEl9G9NcoZtPwi6Zf
 kDIQ==
X-Gm-Message-State: AOJu0Yxvku5VHAe9XUyuVtIeg9zNE7OzvL4FE6doHKr5DGrM7dZMxS3c
 9sPm7R7L+VRsJAEAvBdQ/XVA6ahk3ftTdPJkOXk/qzJu
X-Google-Smtp-Source: AGHT+IH0nh1V6SVusdyeEYE29qugLYksEX+ehkYFjSjdH7aYyfOGlzf+vImX/ZKutU0AaIJ59ga9tA==
X-Received: by 2002:a17:902:f80a:b0:1c5:deaa:d72e with SMTP id
 ix10-20020a170902f80a00b001c5deaad72emr1042601plb.30.1695324503552; 
 Thu, 21 Sep 2023 12:28:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 03/12] drm/mediatek: Call drm_atomic_helper_shutdown()
 at shutdown time
Date: Thu, 21 Sep 2023 12:26:46 -0700
Message-ID: <20230921122641.RFT.v2.3.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
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
Cc: chunkuang.hu@kernel.org, Fei Shao <fshao@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Rebased and resolved conflicts.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d16cc8219105..6bab360c0c1a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -919,6 +919,14 @@ static void mtk_drm_remove(struct platform_device *pdev)
 		of_node_put(private->comp_node[i]);
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
@@ -950,6 +958,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove_new = mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.42.0.515.g380fc7ccd1-goog

