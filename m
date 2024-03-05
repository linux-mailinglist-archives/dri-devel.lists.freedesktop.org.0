Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A48711F2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 01:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645941127AC;
	Tue,  5 Mar 2024 00:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bp5izz3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E411127AC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 00:49:10 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7c76a566218so269115339f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 16:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709599749; x=1710204549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbMkt4JH9fQU1k/SM3hjf0aOsa5Ez6LXN7/VqqW0kvc=;
 b=Bp5izz3tlLatK+bhdSuLX8bp2Df4a7kc95eAFsGa4oKeCzOjq2LidS5C6KRLRyZu4h
 /vgsuyETPu50QyWafEWzpYTBdJQWWf4DUz5GOgQpuJ2N/yF9QDA2LD5tuRQHHU4Ukv4A
 MB6IrE1sG6fD7+8aFSqlYN1u2X4SgXZKeO9Z9pWIHSF0GdwqJuPkc7UISN/2lvnZDjej
 7eQ0Om6AZnzgevwvt8jffXV6jPULvbXCul7EAANx3H1BDYRFMazvwdFK5Rr8zHAyTraq
 khNp6tBKMbcNbVmo3cAde+5rtADfWbA4gYgP5Lf6SpT+hYxBClB6t6/XY8HSf3+aVfHu
 Ocvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709599749; x=1710204549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbMkt4JH9fQU1k/SM3hjf0aOsa5Ez6LXN7/VqqW0kvc=;
 b=STOeMwNB6yDEGC+AUTMmiuQ1FkxUCw/ktS+wXhUQqFtdHWAYEaJPsxwHzgjDa4Ft0D
 frgVhMjbtKK5SC7Lalxs6OkAXd2wHHSZJAzHESTweo1fXozmp//pYfftY37abPVukG2c
 aD2HjqYu/tjbJ8EVU0mFeWtv5A5PMkeawDpfGanydxnNZTp4cyFIB5uMIbMNTWa2Za7v
 4i34k5n5L9pNh5ow980uhgezjVV7kGvGrhDtrniKgfv2cpTBzMkIiF5F520mZZ7dm3q1
 2OMGtPWgZQ1NOJGkKfG9+7zHRQVA4U20lZUUHGHM3TvGQ+THVxI3UdlrtqfCjIFzcDfo
 oCeg==
X-Gm-Message-State: AOJu0Yxq7ZavTtxtjIMVZRv37GOe86LKf1AGUI3NmaNpYsM1MXEp9FMo
 6Gu6DKQOZiS44QDrDzruqdTRIb55ZRY77gkLtyydjynRsIu7sYQoe6cKQz0za4NsLA==
X-Google-Smtp-Source: AGHT+IEw6edKSWyLjziH3r6j5+b+3S3cO5883mFBAzNRhvz6MbZxITGLrOquyH+Wdhvdz/oFR1TNWg==
X-Received: by 2002:a6b:d802:0:b0:7c8:55d8:7f12 with SMTP id
 y2-20020a6bd802000000b007c855d87f12mr4434882iob.10.1709599749414; 
 Mon, 04 Mar 2024 16:49:09 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:8c4f:ad40:e7e2:538])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a02cc54000000b00474d40f8381sm1931209jaq.122.2024.03.04.16.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 16:49:08 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com,
 Adam Ford <aford173@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] drm/bridge: adv7511: Allow IRQ to share GPIO pins
Date: Mon,  4 Mar 2024 18:48:57 -0600
Message-ID: <20240305004859.201085-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The IRQ registration currently assumes that the GPIO is dedicated
to it, but that may not necessarily be the case. If the board has
another device sharing the GPIO, it won't be registered and the
hot-plug detect fails to function.

Currently, the handler reads two registers and blindly
assumes one of them caused the interrupt and returns IRQ_HANDLED
unless there is an error. In order to properly do this, the IRQ
handler needs to check if it needs to handle the IRQ and return
IRQ_NONE if there is nothing to handle.  With the check added
and the return code properly indicating whether or not it there
was an IRQ, the IRQF_SHARED can be set to share a GPIO IRQ.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Add check to see if there is IRQ data to handle

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..f3b4616a8fb6 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -477,6 +477,11 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 	if (ret < 0)
 		return ret;
 
+	/* If there is no IRQ to handle, exit indicating no IRQ data */
+	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
+	    !(irq1 & ADV7511_INT1_DDC_ERROR))
+		return -ENODATA;
+
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
 
@@ -1318,7 +1323,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 		ret = devm_request_threaded_irq(dev, i2c->irq, NULL,
 						adv7511_irq_handler,
-						IRQF_ONESHOT, dev_name(dev),
+						IRQF_ONESHOT | IRQF_SHARED,
+						dev_name(dev),
 						adv7511);
 		if (ret)
 			goto err_unregister_audio;
-- 
2.43.0

