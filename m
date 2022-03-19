Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AD24DEA53
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633E110E320;
	Sat, 19 Mar 2022 19:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1184010E5E9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 14:59:47 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r13so22082880ejd.5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WEyYaX3ss9r/kr8FOOJcJqvmK49fnSer+w8wsSytnGc=;
 b=PH5S2GGLYXu8h65gw2tBfffBCVYm+EawPOnQKKB7cfw6gbdSnGBzcw0pBegBMS2jH8
 pcTVrj15bEBoiDGLHOFeYNSv/qpvtBWx3Fo75MGP2yHVL++9QrhvPcCkpkD7tZgPdLJH
 BVulMoBVp1n4k5DfEu4eZiyoJStVTE5ghlhE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEyYaX3ss9r/kr8FOOJcJqvmK49fnSer+w8wsSytnGc=;
 b=lPCWuUnT2BGodViTvbFpvcMpOTQ0+R67qLXrGDwc2N4qbgJf1MLwMGItxuGDsry4HP
 2wHKpkwAReuMfYETzBzl3rbUooC2880l9D79wg3fVO6z/c9eyXRn0VtU/Y8Br0GYeMxf
 BKiS3ZGpVEeGn8lv8ZIQE7C6wuNb26QzjIf/WA+g8a2dOMSoX9mEgzOkeKMo1YUC4KeO
 PopslhIhFCRz6ts4DXb1VbiPYvULZ03eWtJfi+5fDAM7NiUe6R5Otw/zVn6iu/tSVrg4
 RnXZHzsLClNePrAgJ5MFLY8GqFTN1USROTcsBi/NxDhWc5GegVvQV2QYUUPoGRKtE+w4
 h1GA==
X-Gm-Message-State: AOAM530/rb7VPKeaHt6GZxj2BudpZKwuHDlvrSubhkeW1ga1iwDAlnKn
 cHIiCkxKAAlEeKSzvkdFNhlFxw==
X-Google-Smtp-Source: ABdhPJyAIRg+IHtOqAPn/Pvh3MaMvaYOEtrnwfOy+2azy5QQsr5c3FRifBkBizPn4h+pBjijahzpzA==
X-Received: by 2002:a17:906:2991:b0:6cf:1fd4:39a3 with SMTP id
 x17-20020a170906299100b006cf1fd439a3mr13474185eje.21.1647701985578; 
 Sat, 19 Mar 2022 07:59:45 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm4923329ejd.118.2022.03.19.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 07:59:45 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Archit Taneja <architt@codeaurora.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 1/2] drm: bridge: adv7511: fix CEC power down control register
 offset
Date: Sat, 19 Mar 2022 15:59:38 +0100
Message-Id: <20220319145939.978087-2-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319145939.978087-1-alvin@pqrs.dk>
References: <20220319145939.978087-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The ADV7511_REG_CEC_CTRL = 0xE2 register is part of the main register
map - not the CEC register map. As such, we shouldn't apply an offset to
the register address. Doing so will cause us to address a bogus register
for chips with a CEC register map offset (e.g. ADV7533).

Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     | 5 +----
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 592ecfcf00ca..4e7cbaa9204f 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -386,10 +386,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
 static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
-	unsigned int offset = adv7511->type == ADV7533 ?
-						ADV7533_REG_CEC_OFFSET : 0;
-
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 28d9becc939c..4ee7f2e911e3 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -303,7 +303,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		goto err_cec_alloc;
 	}
 
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset, 0);
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL, 0);
 	/* cec soft reset */
 	regmap_write(adv7511->regmap_cec,
 		     ADV7511_REG_CEC_SOFT_RESET + offset, 0x01);
@@ -330,7 +330,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
 		 ret);
 err_cec_parse_dt:
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
 	return ret == -EPROBE_DEFER ? ret : 0;
 }
-- 
2.35.1

