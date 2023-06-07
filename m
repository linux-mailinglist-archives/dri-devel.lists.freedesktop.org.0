Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6124725441
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07D010E432;
	Wed,  7 Jun 2023 06:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F3810E432
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:31:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30ad99fa586so6798839f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119514; x=1688711514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=oij5WgWkvYYOUtEp7mGMYwADDCD01LfrAmCNgml9W85dFDuFYvvNhkENHGeXh9Cq9u
 3pK6gWcbQ7t2LYbZXgI0BCw/6fRRB5PeqRjLTlBbp+ET9axLadAiZztH4few/0KIz34X
 QJqbD/+9emeAKB44hrtPdlFjhs5oBzK5xrdwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119514; x=1688711514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=cPdOf7fgLYZ/Lfah77ICEghe+nI70rCS1iZnQzBgCccZM178BxZuVz4rUQCqy7e91p
 rZ6pc6LEX+1XAolr3a6alPVj8hQRdMGg/0AwbjlnFIb5JUeC0GUk7ay0BI9LspJ0PcSB
 DEIuuvGge5cyLsCLda1XgAWKJLYeJc2D9JU5v8OHfsJW3h8HT6NKbNzKHCJmlP1/KNiz
 cFMNa6lxEV2/J2mKs9dNDTDFKRLyRCVAciTsJODdl9D8vu1kjXao3yDl/X7sGjj6SCYF
 ISWyNb7JQ0lPgtMaoeQgubMH52cHa2BusQGRYEQsoyMJoCROYxJALjHFAZtMOATNWQLA
 lphQ==
X-Gm-Message-State: AC+VfDxKKiDMl40fMwdldjNFbA4LTOQRsLyii1Wdu5Vm/vcefbTUUfGg
 ornErWE+HRqTeXyqJ7ngqSkO7A==
X-Google-Smtp-Source: ACHHUZ43EByLSLWH1Hp4CJmVlLkzIZdJ1bFJA5cBLjDViBWwpcPQQjpHCIvTkQJTIAxM2+k+COUtcA==
X-Received: by 2002:a5d:420e:0:b0:306:3b78:fe33 with SMTP id
 n14-20020a5d420e000000b003063b78fe33mr3151485wrq.32.1686119514598; 
 Tue, 06 Jun 2023 23:31:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 6/6] drm/stm: add an option to change FB bpp
Date: Wed,  7 Jun 2023 08:31:39 +0200
Message-Id: <20230607063139.621351-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

