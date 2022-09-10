Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFC5B48CE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 22:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA5B10E2C4;
	Sat, 10 Sep 2022 20:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAFD10E2C5
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 20:30:17 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id l10so4896561plb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=Rf4gLgZs0TJmmTOOtjDDZx+tIifNxAbZNtBhCdXRBTekUHDiJszS/5UyvgZMerFM1f
 Rt9fnsHB+5DKDorWMYCVhWNjtm/vv0LVVngbmR/MCRPgZqm1if6QymRM4str9dSnEXYv
 fe5DE2TFW7cj6L87eYTiFgptXdj4jCFBCasSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z9jxByzVkMoMNaDlz07fE7aVRK3JIOG/ZFD9GTYnd5A=;
 b=RzLm6/30wv1HfrMqyQO4yDVTRmAXxwSwc6nYwGGFw2z8BNNWHxbXjtUX3SD5XNTtRt
 wbkwKpLBtHH4z/l98TsqpCF4EoNahdajxEk4koXx2cEE35ptLJ+6ss+K6wF6TNUaCEt0
 K+mGzDMNLYh7Tz5R9MvJJmMnGK3VPHm44RFkaYHy/oOxO80mydttZM/J/I2jKnA3gQZN
 7K/YLNhHJe2Yzb6VOTV+rRkX7PN4yHftbGnSIgjBWQHWhd22Jk6YrTxvEh8+P893flgh
 bUBAspwKXfPlhlvLOuoqvhWqPGP4XMl4iDJYSPjpa55NtcnXdI/HO11gDcwAIbdlqBVW
 cX9Q==
X-Gm-Message-State: ACgBeo2r1c2MvWVhHuhv6K9OVdIXmA7NI/7IFZJcOPWi29mU4UrcJ0fw
 T77un19l0DOaDz+zvR7S264yQg==
X-Google-Smtp-Source: AA6agR5QHm1l5nuhm8GSF3lx0whdh3DtLL6pScGNtufe6t8U65MusH0f844h1caDQPtwym+qmmDnYg==
X-Received: by 2002:a17:902:a409:b0:176:a717:4d5d with SMTP id
 p9-20020a170902a40900b00176a7174d5dmr19350119plq.148.1662841817237; 
 Sat, 10 Sep 2022 13:30:17 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a655382000000b00412a708f38asm2641313pgq.35.2022.09.10.13.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 13:30:16 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/etnaviv: add missing quirks for GC300
Date: Sat, 10 Sep 2022 13:29:38 -0700
Message-Id: <20220910202939.31010-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910202939.31010-1-doug@schmorgal.com>
References: <20220910202939.31010-1-doug@schmorgal.com>
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

