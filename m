Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DD720E5A
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9600010E205;
	Sat,  3 Jun 2023 07:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7C10E647
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:21:44 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so2011206e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701302; x=1688293302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=GsIwW50OWWABkFl4+MuMJVsJnIxd4RnUEQwdl1LBq+pD8w0HebLB/EDl2doqWRzJ8d
 FUc1iu7tzIbfsEjTdGKjveBeIhM3zz7X0KyRVROnmgYdIZH/WJXnskct5oE9wQHVFSwh
 lNzJ/DZ81S3JWUisdMUcVi1iR/gQGgqeymMQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701302; x=1688293302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=CjkrYllgdexXwW+WHd4AINgy8aXzpE/dAVu22fZn4mp+2CRvfmyigNF+ELIIOcybYA
 cOFHA3yn8TbZDJmogmcC6emP/63L/UeoiPP9G25dL+j2kCelII4V7vw0ZQJx2OtLiE3z
 VpNBRIJDujCQpctQDJASu1g+qfbN14BH2rqSbpmxFMQTobI8kNPUQvKNGRVxD9bHxlGT
 3ZJ0y1Ajzz9/VwYL9cEkxbnL6wFt/JYhEpnNgprzVNDgdXoE0v4UMxJ0x2T8hcH1bI77
 cFjif6aF10icZ3D+nu0DskCa5rkwzn9IX48F953gt0dP+ngGnCoCUTNb0kKBmzY/lIHB
 zC2A==
X-Gm-Message-State: AC+VfDwKzmk/sSmIt29dk5mIZwy1dVjacUA8sVneXZh9eh8vASyTwRNv
 6N/eI5wZR+GmHgPmP028kIjV0Pd+mpXQrTrX25SEww==
X-Google-Smtp-Source: ACHHUZ4v/QjfVIurcf6EcYp74yUStSbnTwORv45UFzpMUVWYQmmjYWbUpX5dFUE23r1qClGmatwwkg==
X-Received: by 2002:a2e:9216:0:b0:2a7:7d70:6bb with SMTP id
 k22-20020a2e9216000000b002a77d7006bbmr1425706ljg.2.1685701302702; 
 Fri, 02 Jun 2023 03:21:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/stm: add an option to change FB bpp
Date: Fri,  2 Jun 2023 12:21:22 +0200
Message-Id: <20230602102123.3345587-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jun 2023 07:02:50 +0000
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 michael@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boards that use the STM32F{4,7} series have limited amounts of RAM. The
added parameter allows users to size, within certain limits, the memory
footprint required by the framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 drivers/gpu/drm/stm/drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..65be2b442a6a 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -30,6 +30,11 @@
 #define STM_MAX_FB_WIDTH	2048
 #define STM_MAX_FB_HEIGHT	2048 /* same as width to handle orientation */
 
+static uint stm_bpp = 16;
+
+MODULE_PARM_DESC(bpp, "bits-per-pixel (default: 16)");
+module_param_named(bpp, stm_bpp, uint, 0644);
+
 static const struct drm_mode_config_funcs drv_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -93,6 +98,7 @@ static int drv_load(struct drm_device *ddev)
 	ddev->mode_config.min_height = 0;
 	ddev->mode_config.max_width = STM_MAX_FB_WIDTH;
 	ddev->mode_config.max_height = STM_MAX_FB_HEIGHT;
+	ddev->mode_config.preferred_depth = stm_bpp;
 	ddev->mode_config.funcs = &drv_mode_config_funcs;
 	ddev->mode_config.normalize_zpos = true;
 
@@ -203,7 +209,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put;
 
-	drm_fbdev_dma_setup(ddev, 16);
+	drm_fbdev_dma_setup(ddev, stm_bpp);
 
 	return 0;
 
-- 
2.32.0

