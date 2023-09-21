Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D57A9D29
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4D110E602;
	Thu, 21 Sep 2023 19:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE7F10E5FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:50 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c4586b12feso11087745ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324529; x=1695929329;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yWq/C0tGEFLQw6PZcuzFNMM1hDy2t48whBia8F49Jg=;
 b=AoIiSue3XWZTYqbaDx+xgbyTpQkTu/QPaBojtZ+UGpjBxx9muDoKy2THCzitzxAl8S
 77YyPm+hAtXoQt1OgGSQchdghNvHgsbYXMSINIt46R1XjOGW5QZQ6T2jFS2TpQGIrS/b
 MbOpQ2V1VtismH/4IHHuSkWDzlPfr68BA/O1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324529; x=1695929329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yWq/C0tGEFLQw6PZcuzFNMM1hDy2t48whBia8F49Jg=;
 b=N1RCaZVWi/+o5vDMwqGu9yjSJ2RJBEjHTJhXgPBU2xRbyDONFRFp6bWn8uRFqImkEG
 tn1AIg09epOekpGtJ3UHEGdaP+wTrBM924RxXNx1HXb1C3ym8ikMYezwrziANRCLq4G1
 7IAZ7+2dzA1qGnxCpV8eIjjJbX9V5yW/Y7PssWYbBFWKho6mSQeE3ZoVmIZEKsaRUGb5
 S+PdL+hRFR7TenokQ09zCgNR8vBhYqf3LPwWy5EBZXpjyLdlZdzLYVXo0Mj7Ca9j0CHg
 SiyfTcbbtQMN3lfPjHnc0dmHEKvEKGj13Dkze7EDnkyli/XXPdaYWCKeufnGHh2mVeB6
 YHzA==
X-Gm-Message-State: AOJu0Yy8m1NAaI5EBxAy1mD5JOv2/8iQDKuJ6lo9SiHyFo8faVeejENY
 +LhAs/yPLiYS5aIg1cpEZyA3bpcjx7vLRRU/Ogp13IVs
X-Google-Smtp-Source: AGHT+IG2w0WDLRZHyuJ2LAJ89ZhWzmeDvnFDIDFpOKHgPfnwnQMLnbx8TB6Jh7P+yKBv1bgwE5yOVg==
X-Received: by 2002:a17:902:c409:b0:1c4:4a4d:cda with SMTP id
 k9-20020a170902c40900b001c44a4d0cdamr7404355plk.15.1695324528913; 
 Thu, 21 Sep 2023 12:28:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 12/12] drm/renesas/shmobile: Call
 drm_helper_force_disable_all() at shutdown/remove time
Date: Thu, 21 Sep 2023 12:26:55 -0700
Message-ID: <20230921122641.RFT.v2.12.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid>
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
Cc: paul@crapouillou.net, tzimmermann@suse.de,
 Geert Uytterhoeven <geert+renesas@glider.be>, sam@ravnborg.org,
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

As Geert pointed out in response to v1 [1], this patch conflicts with
the patches doing atomic conversion [2]. Since those patches don't
appear to be landed yet, I'm simply reposting v1. If those patches
land, I'm more than happy to re-post this one. I'm also more than
happy if someone wants to incorporate these changes into a different
patch.

[1] https://lore.kernel.org/r/CAMuHMdWOB7d-KE3F7aeZvVimNuy_U30uk=PND7=tWmPzCd7_eg@mail.gmail.com
[2] https://lore.kernel.org/dri-devel/fd7a6702490bd431f314d6591551bb39e77e3304.1692178020.git.geert+renesas@glider.be/

Changes in v2:
- Rebased and resolved conflicts.

 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index e5db4e0095ba..8c4c9d17a79e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -15,6 +15,7 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -179,10 +180,18 @@ static void shmob_drm_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(ddev);
 	drm_kms_helper_poll_fini(ddev);
+	drm_helper_force_disable_all(ddev);
 	free_irq(sdev->irq, ddev);
 	drm_dev_put(ddev);
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
@@ -287,6 +296,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
 	.remove_new	= shmob_drm_remove,
+	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
 		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
-- 
2.42.0.515.g380fc7ccd1-goog

