Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DEB7C9C78
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 00:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33410E108;
	Sun, 15 Oct 2023 22:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2610E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 18:46:15 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so517997666b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pqrs.dk; s=google; t=1697309174; x=1697913974; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tIlXDMVoyF2wOerT2pUZ66SV7AxP60ec1UuPn6vb9Es=;
 b=Bou8BrKk2Bp7SdOP+H1iuj1Z7GS+LjxCS1OxsSqamDZDlt1jlUGDzpfzOt1ab408HZ
 o+dH0YnMd8Y/rF262pOzOacI0GeV9ku+amUkxjRdT6LPVT9OKslPpsnitkIHW+hEcspF
 7RGYgBQsuZ/Q7yIKumBIzF1HSuYvP5ICM61QRSuldabDkD3r1WLv8OCjD03rxcUVHppL
 YxuBUywgwElxTPhKmFlaGz6xCsIDtacSEZAzc9sw3IhgxOLZHyvODu74YFz6QcubzDYT
 W0kRoSRVlIj2i8UpYZdli1Vmo+knrMftw+cp33pn4+qj9O6iQ17ZBE/W3Pg/YmXGv2DP
 qmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697309174; x=1697913974;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIlXDMVoyF2wOerT2pUZ66SV7AxP60ec1UuPn6vb9Es=;
 b=Aow2Mcoh3rNjerMtNO19HakVqkhERTvCI1SYjpNVKSGb9KCXzJ0AhCc4wT1N9zY0mF
 7Fk3mZDSG8NFbiumzIsGHFkbQZmFsaEdm6YduJ6UgZ9kPndlEhuhHfGbAN1e12eGKSua
 n5fo+s0XZCkm4nLXZO68E7x6ZvjuZOaZhTT82YAdezfldwzfW3waZ0dIytDwcF9Kj7Ds
 Er3AfoqoayDqGcbiYmZ1YzlM3CN1jOACAs79qX0MOJSgoz1eLpJgGk0tHTB1To1TL7nH
 gtozZGnLpPlGUHE6uChnNMQ2KUO1JiVYb7yfd/l6oT/mU8h3XoUlTCW6wOJ7MpMjTLis
 h/bA==
X-Gm-Message-State: AOJu0YyA5nw1VviRSrLJgiSmsZx15//Te+4/9dsX4zdTgTtkzIjckazt
 aKniOMIenF1oM68jeg57fA1ZGg==
X-Google-Smtp-Source: AGHT+IF+7WIY16A5/2sv3aIp1+eguS3ta+rt4Qb673/yL+hg4WTNOXpRq6ByJp4xrL7dhwv9TdBY1g==
X-Received: by 2002:a17:906:478a:b0:9be:7de2:927a with SMTP id
 cw10-20020a170906478a00b009be7de2927amr2183584ejc.74.1697309174209; 
 Sat, 14 Oct 2023 11:46:14 -0700 (PDT)
Received: from capella.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18]) by smtp.gmail.com with ESMTPSA id
 hz14-20020a1709072cee00b009b654ba498csm1235222ejc.90.2023.10.14.11.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 11:46:13 -0700 (PDT)
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Sat, 14 Oct 2023 20:46:12 +0200
Subject: [PATCH] drm/bridge: adv7511: fix crash on irq during probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231014-adv7511-cec-irq-crash-fix-v1-1-3389486c8373@bang-olufsen.dk>
X-B4-Tracking: v=1; b=H4sIAPPhKmUC/x2MSQqEQAwAvyI5T6Djin5l8NAkUXNxSYMI4t9tP
 FZB1Q1J3TTBUNzgelqybc1AvwJ4ieusaJIZylBWFKjGKGfXECEro/mB7DEtONmF7STSh74S7iL
 kfnfN+nv/x+d5AS+DayNrAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Archit Taneja <architt@codeaurora.org>, 
 Hans Verkuil <hans.verkuil@cisco.com>
X-Mailer: b4 0.12.3
X-Mailman-Approved-At: Sun, 15 Oct 2023 22:39:59 +0000
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
Cc: Mads Bligaard Nielsen <bli@bang-olufsen.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mads Bligaard Nielsen <bli@bang-olufsen.dk>

Moved IRQ registration down to end of adv7511_probe().

If an IRQ already is pending during adv7511_probe
(before adv7511_cec_init) then cec_received_msg_ts
could crash using uninitialized data:

    Unable to handle kernel read from unreadable memory at virtual address 00000000000003d5
    Internal error: Oops: 96000004 [#1] PREEMPT_RT SMP
    Call trace:
     cec_received_msg_ts+0x48/0x990 [cec]
     adv7511_cec_irq_process+0x1cc/0x308 [adv7511]
     adv7511_irq_process+0xd8/0x120 [adv7511]
     adv7511_irq_handler+0x1c/0x30 [adv7511]
     irq_thread_fn+0x30/0xa0
     irq_thread+0x14c/0x238
     kthread+0x190/0x1a8

Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
Signed-off-by: Mads Bligaard Nielsen <bli@bang-olufsen.dk>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index d518de88b5c3..71022cb8abe4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1291,17 +1291,6 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
 
-	if (i2c->irq) {
-		init_waitqueue_head(&adv7511->wq);
-
-		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
-						adv7511_irq_handler,
-						IRQF_ONESHOT, dev_name(dev),
-						adv7511);
-		if (ret)
-			goto err_unregister_cec;
-	}
-
 	adv7511_power_off(adv7511);
 
 	i2c_set_clientdata(i2c, adv7511);
@@ -1325,6 +1314,17 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511_audio_init(dev, adv7511);
 
+	if (i2c->irq) {
+		init_waitqueue_head(&adv7511->wq);
+
+		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
+						adv7511_irq_handler,
+						IRQF_ONESHOT, dev_name(dev),
+						adv7511);
+		if (ret)
+			goto err_unregister_audio;
+	}
+
 	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
 		ret = adv7533_attach_dsi(adv7511);
 		if (ret)

---
base-commit: a48e2cc92835fa1d9b373b804b2173c779387b8e
change-id: 20231014-adv7511-cec-irq-crash-fix-6fdd9093dc7a

