Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EAC54810C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C24410E486;
	Mon, 13 Jun 2022 08:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44D10E957
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 14:49:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v19so4258518edd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZZYegJLBLKIFYA6731P7rWnnXUer1l3FN0VMP5JguwY=;
 b=FPXLILWZPGq7+yE5oU94gYNFh96HzpsKl+xzWHN+uwWHd4VyxnXpwpo/mj4VuZBrtD
 Tvg7JahnzUPnuHNGsBIpXKvCXDzm/3Vp7SaM9xq49uRA4P1vbNCzJkK9chsIpN2uL1qM
 01+U5br4Xj3mvf1+QtPT++Musa0/OhMj07HLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZZYegJLBLKIFYA6731P7rWnnXUer1l3FN0VMP5JguwY=;
 b=54ovQafGRxnIzy18/37y09lfqI0MZslNBzrl9z8Ih+HEDJW6F2QB32AuMoL7VhdqCG
 JGmLdWIT8i7DcQ9I0wY2jbRIxnaKQuYn8EZ3UJ3IyPvHhS216B9dJjMXpTSHOUxC5Frs
 e3f7pl/OBae0REMuOvWQk2KVg/rJm1DmYc8yRsW5kR9lBlSGnVmIf71Z+p6uuWfwHjF2
 suS+TiXGPgx36r2qRuUnkkz28KRcDMzLE2Vnsyg+l2pkCpKM+oC2q2/iQhRt5xj9J9DZ
 QI/NPHG6PHWkx9xKP/QuCT5lNTcb5yvGSHmr1uwMyMR722HU37h7mPoxwXH6dqvYDpNj
 P1ww==
X-Gm-Message-State: AOAM5306If60HvYfqH4Se9GL/3RXsKeRy/5Yks8mZNSdBPAX5+9qJHH6
 QkGXkQw6TORIzCVWNvuucM5Q/w==
X-Google-Smtp-Source: ABdhPJwrwWudy5n1gSRNpA4pV8YgeBNu8lNs+Ynkn3H26f6GqvaWiOLkI+WUyJSGNv4YS8RPuMGgdg==
X-Received: by 2002:a50:fb99:0:b0:42d:e4fd:c368 with SMTP id
 e25-20020a50fb99000000b0042de4fdc368mr60703009edq.138.1655045355718; 
 Sun, 12 Jun 2022 07:49:15 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a0564020c9400b004316f94ec4esm3257076edb.66.2022.06.12.07.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 07:49:15 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Archit Taneja <architt@codeaurora.org>
Subject: [PATCH RESEND 1/2] drm: bridge: adv7511: fix CEC power down control
 register offset
Date: Sun, 12 Jun 2022 16:48:53 +0200
Message-Id: <20220612144854.2223873-2-alvin@pqrs.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612144854.2223873-1-alvin@pqrs.dk>
References: <20220612144854.2223873-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Jun 2022 08:00:14 +0000
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
index 9e3bb8a8ee40..46ae6c0d9aa5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -406,10 +406,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
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
index 399f625a50c8..6d067fa54bea 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -347,7 +347,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 		goto err_cec_alloc;
 	}
 
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset, 0);
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL, 0);
 	/* cec soft reset */
 	regmap_write(adv7511->regmap_cec,
 		     ADV7511_REG_CEC_SOFT_RESET + offset, 0x01);
@@ -374,7 +374,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
 		 ret);
 err_cec_parse_dt:
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
+	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL,
 		     ADV7511_CEC_CTRL_POWER_DOWN);
 	return ret == -EPROBE_DEFER ? ret : 0;
 }
-- 
2.36.1

