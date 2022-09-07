Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B55AFA30
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 04:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E907510E07E;
	Wed,  7 Sep 2022 02:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7208D10E083
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 02:48:36 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id o4so13161708pjp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 19:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=RoF1CV1/FDlGjquDTn+jQNgtnbmrB2Kz6MNhqh8OtKjTjn4r+qf1BxNPbGqhBRWtu0
 WZuVMUCA6BozXhvEL75qyx9Cdr5P+qMsTMuwOxtHeH4pmSfWaTpMJJ+KK+WVj8o7WXyb
 dyahRlDOvTN49JQ55G2pF/BrBJ6CJM8xKlr7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=8QtL5eivkFbVGkjTuCMxjMTP0dDVO5OhcSzW7Ff1fveoyzBoLiLT1kSnr9pyCc38T2
 w4nc9441zLVZzqDTR4MVaUq10xOGXjMs0ZLtANhDHdLHKsEgyUqTxWfBl4W/qwl70pFz
 bMJ4GUHEXWYxVdI1X3kwApHUYqWwBwOD6HU9/IzohwrR5V6SL5dbmpg7tFCDm589lfOk
 isFPirgDwlxiUSaJKLifmHhP3p2b3/8akoRRDVW/zR3TDkWgrqNnfyv/wJZj7+b4Q2HY
 7nXXDBd8TM8BdQ8w4KNPFd7RWlU/Ogvbue4pefL42hc0iCVrxMtxNTYsHtOaCJsNmEiP
 Jw0g==
X-Gm-Message-State: ACgBeo2gMnM8crPwjclVes/m1BYsSdGSxn1mk+znND9QUPIJXtbWcSkq
 lPLQmuSJzpnNOUWhKjo0oY5DYw==
X-Google-Smtp-Source: AA6agR4GnHfEJS+HU39qEO/3oIsN/YuUFcteTgpJsuT+GWwfZqvY3rzDq+0mQfXG9jkWq1Nz5gdKow==
X-Received: by 2002:a17:903:244f:b0:175:34d6:97a8 with SMTP id
 l15-20020a170903244f00b0017534d697a8mr1647977pls.100.1662518915965; 
 Tue, 06 Sep 2022 19:48:35 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a170902f55000b001754064ac31sm10733963plf.280.2022.09.06.19.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 19:48:35 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/etnaviv: add missing quirks for GC300
Date: Tue,  6 Sep 2022 19:47:18 -0700
Message-Id: <20220907024719.36478-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220907024719.36478-1-doug@schmorgal.com>
References: <20220907024719.36478-1-doug@schmorgal.com>
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
Cc: Doug Brown <doug@schmorgal.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GC300's features register doesn't specify that a 2D pipe is
available, and like the GC600, its idle register reports zero bits where
modules aren't present.

Signed-off-by: Doug Brown <doug@schmorgal.com>
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..f667e7906d1f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -416,6 +416,12 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 	if (gpu->identity.model == chipModel_GC700)
 		gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
 
+	/* These models/revisions don't have the 2D pipe bit */
+	if ((gpu->identity.model == chipModel_GC500 &&
+	     gpu->identity.revision <= 2) ||
+	    gpu->identity.model == chipModel_GC300)
+		gpu->identity.features |= chipFeatures_PIPE_2D;
+
 	if ((gpu->identity.model == chipModel_GC500 &&
 	     gpu->identity.revision < 2) ||
 	    (gpu->identity.model == chipModel_GC300 &&
@@ -449,8 +455,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 				gpu_read(gpu, VIVS_HI_CHIP_MINOR_FEATURE_5);
 	}
 
-	/* GC600 idle register reports zero bits where modules aren't present */
-	if (gpu->identity.model == chipModel_GC600)
+	/* GC600/300 idle register reports zero bits where modules aren't present */
+	if (gpu->identity.model == chipModel_GC600 ||
+	    gpu->identity.model == chipModel_GC300)
 		gpu->idle_mask = VIVS_HI_IDLE_STATE_TX |
 				 VIVS_HI_IDLE_STATE_RA |
 				 VIVS_HI_IDLE_STATE_SE |
-- 
2.25.1

