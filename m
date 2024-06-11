Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA01904263
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 19:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EAA10E0F3;
	Tue, 11 Jun 2024 17:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="N9vgHkYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00210E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 17:28:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f692d6e990so55634105ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718126905; x=1718731705;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ek9nYHCEplYURM/7b1b2h5qMkLqR/eL+WowxP0vSWY4=;
 b=N9vgHkYxNrfp2Ifj7tT3CaOug88DHigsXd/CrJyJgOP0FY+13R2ihm/2hPfuwdQfcb
 bl1eQka/EmoLHpkBNcORVMfqCbKAPnqhPsLivA0KxK2MarzMOIO+Ft4sY+gFsnBO3L/n
 YbO6GX3TXpWglnrtsKxkW4bs46dc+FYdfV7n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718126905; x=1718731705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ek9nYHCEplYURM/7b1b2h5qMkLqR/eL+WowxP0vSWY4=;
 b=Jvp68DQ2/lb49zcG4DTqEpuBl62Ir8OmYRvYJfMwFBjkhvtccQ9cwTcQ9bJISWEu5v
 Il5jsMqdFqHAPfd6WAYYKXDQb3fIY62sri+wh66KN2MY3Dd7jCYmWuy5Wym48whuQjjj
 IW8D61TusJiFcE//N5gvYKn1CEmptgttVDdnYGt0SeKpla3hr4doOgDKbbuOCyGeAPAQ
 ogEfHym1fy7eXaLcLCzKqhWSerU3qJ5Mkq6+leJbMwOwvF9c5qfNF/7081KWfV4WqOnG
 mbt17sF3w7XBedB5EDNo8aFzdn5UZ43vB3TGhewy3bNQ6gqycMFTE3nAHIc/gGMwl5HK
 +Pnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHFCoBbEirlf6elzLwEoVLGVmFLk6i+QFiylh+xOPXddgkaPKazeynGMz5v1UuMB84shZ7/i1G6VgN4gTSAnUZJZFNCZkkrXHCgRBVaBeh
X-Gm-Message-State: AOJu0YwbVuLB6jJn2zenZz8cCf2O19tVav0sadHtGMMqY5/FK8IORtAi
 nZi5Yp+1famhThpPcbc1NNxgJ1/JX7kLLsUp3iyLs78B+kMB50NFXfd6tfoZKQ==
X-Google-Smtp-Source: AGHT+IFJ4n9j/I8+bwf5nby7cNuNSwpvL75gc72i3EraZAd14f2XpX1hujkn20i8r/RxoP3yzvg2rg==
X-Received: by 2002:a17:903:244d:b0:1f7:eb9:947e with SMTP id
 d9443c01a7336-1f70eb99809mr68387405ad.63.1718126904826; 
 Tue, 11 Jun 2024 10:28:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f410:2f13:37e2:37d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6e7858544sm75714375ad.75.2024.06.11.10.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 10:28:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Fei Shao <fshao@chromium.org>,
 Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Tue, 11 Jun 2024 10:27:44 -0700
Message-ID: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
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
shutdown() is called and as of commit 2a073968289d
("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
noop") we don't need to confirm that "drm" is non-NULL.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1 of this patch was part of a series [1]. It got tested and reviewed
but never landed. Reposting separately in the hopes that Mediatek DRM
folks will land it. If, instead, Mediatek DRM folks want to Ack it I'm
happy to land through drm-misc.

I noticed that this was missing when I failed to add "mediatek" to my
patch series IDing which DRM modeset drivers did this properly [2].
Assuming my patch lands, that means that Mediatek devices will start
getting more warnings printed.

[1] https://lore.kernel.org/r/20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid
[2] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid

Changes in v2:
- Removed NULL check since it's not needed since 6.7
- Rebased on ToT.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b5f605751b0a..de811e2265da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -952,6 +952,13 @@ static void mtk_drm_remove(struct platform_device *pdev)
 		of_node_put(private->comp_node[i]);
 }
 
+static void mtk_drm_shutdown(struct platform_device *pdev)
+{
+	struct mtk_drm_private *private = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(private->drm);
+}
+
 static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
@@ -983,6 +990,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove_new = mtk_drm_remove,
+	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
 		.pm     = &mtk_drm_pm_ops,
-- 
2.45.2.505.gda0bf45e8d-goog

