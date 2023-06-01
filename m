Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBE71FAEE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8AA10E629;
	Fri,  2 Jun 2023 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777310E585
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:03:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso164980266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639034; x=1688231034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ftjev7ny28lvJRfWKN2KXX1gaG/LDneackQ782m2++c=;
 b=RXpREj32QF9glE5vpN59wgL/+UV12KKLNYA9IA5/BKkN5MgZGAFTz0Twq/Y4ZK8Udq
 3MKAomKMltBYpKajAE7tTaJq0jTEmWFCGs2ZhQaB1L+TuroGqIzUDmhiCBh2XBcq0rQR
 wyY6MJzAzVQZ1h79fJtF4m08kX4kf4xEXSOBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639034; x=1688231034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ftjev7ny28lvJRfWKN2KXX1gaG/LDneackQ782m2++c=;
 b=IHqLI6yG4G7rXKTDXZ80PL+RLOqbsDoaUHjMPa2sLfD4nBBDNeLQbqVm1VKYkENRk3
 LnJMY5r8FxJYMmEMWMJdfNQjuCZGQuYgAYVdfr3KJgSPaHY9GkhBCSoa8ZcH9git6KoJ
 +6uDFkHsEwQebSatNxyjBSlY/G5YUDmyXuVtnsFSEm4Y6qYDncSYEGdVjR4rtpP7kbFP
 WmJ0PTRkCMrkbqGvoTJ8J0YXEY/S05kOD1LHFOIU8qh3SN/ZUlx/20WjmEGDbDFNAnBu
 Vz5FuIftGha8S6VrPC7rdhOsLNKu2tOUlx+RnyELQlkLcAxMzKW5VI6tu50z2GvRjywV
 +yuA==
X-Gm-Message-State: AC+VfDwAVfJF3+docjbAeL8mfiFM1J3nan24YoBxKiG/4jtLgOUbHhK8
 rSl1jjzCixGiKOG7AOCqBnqy2w==
X-Google-Smtp-Source: ACHHUZ5oUVMAwFD6jXFbU87iuAQJMHlHZ+OpaWeKz6pu4pcRR1a2Pb6wyFg0KLbejd0vnRuywS3xIQ==
X-Received: by 2002:a17:907:da3:b0:973:d2b6:f536 with SMTP id
 go35-20020a1709070da300b00973d2b6f536mr9135641ejc.21.1685639034375; 
 Thu, 01 Jun 2023 10:03:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] drm/stm: add an option to change FB bpp
Date: Thu,  1 Jun 2023 19:03:20 +0200
Message-Id: <20230601170320.2845218-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
References: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Jun 2023 07:26:38 +0000
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

