Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ED886AD93
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D93F10E51D;
	Wed, 28 Feb 2024 11:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YqfgNl19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5210E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:37:47 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7bade847536so298840339f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709120266; x=1709725066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hFtrXUgWnMJ9NQ2PU+2dtB8bMmOfzlQTR6EQYNPIXm0=;
 b=YqfgNl190h/pX1bTo80iHs3pSOtb61Hdm7HUGEPjpKrGKiPb+bw+NH96RtJOLnZQJs
 739GJKO5ASCSMX2Y7RX06swvddqtNqK/3DWCGGOGehqNNU8TToNOTyjTXT+OS20Dn9kH
 DW+mbreY0nhq+9NBeZjKat83oNrIWpj/mC8DF602pfvGeW8OYT0Rkz9Tic3rvaIhdUU2
 Zy1apaxYxorvpTFPvZv2Nxj7wRZH6YC/vlo806WKy/jDYdAj7isz/KWlzCZJcrTKP2gW
 7+D+ei62ohSM0JulfI275bmh3ci6xGZIcTX/nWuc/V1s9loQ/NqIGxh7Kht0DG8/j6DM
 5vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709120266; x=1709725066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFtrXUgWnMJ9NQ2PU+2dtB8bMmOfzlQTR6EQYNPIXm0=;
 b=ifkAhRZu22oql3qQP/9PAxy1JFEmJmLwDtnwG2zGgG180X81XRRFXMw9+K4YdL09OT
 w83OYzMvkyuHKt7i8OvxuvzxR55zdtX1zl9kLccc312/6R600SOVcANBzLOAVbROP0ta
 mPJdZgHBL4RpfmnDOc9uxfrQ2gnVNryvoNA5UtSNgHwXLXDbWDyhVoCihwyXHgvPUEj6
 jWmGQtlZbEZDOA9HM9rakEzBoszYwJH9ik/3HZveTsxN4qE47FxyRCTYowky8StTS9eD
 pdj40HjHLKPDNw1UJn/EGXbbWdw3EZRGHeJ207F2cFL4Aa2H+tEU2VY2CM6LpPnzBag8
 gwcA==
X-Gm-Message-State: AOJu0YzGrjhEUqMmZigvwd/MgZL+t3UP5WPYyfwZPl9C6Y4jC9wPSUws
 oqq32SarVRTG7RIiSlii+rOBfrtN8i1hgAr6dpL/ebAyNIdx5OAqvNlos4O7tGECCyhU
X-Google-Smtp-Source: AGHT+IEwYOiAlwhhDwfp6MFMf8Kh9Xrgrs548zAUc51dykwi25IhwwwaKGbQtiBKAvrlGS0wowxSjQ==
X-Received: by 2002:a5e:8f01:0:b0:7c7:fc3e:6f1b with SMTP id
 c1-20020a5e8f01000000b007c7fc3e6f1bmr967586iok.7.1709120266374; 
 Wed, 28 Feb 2024 03:37:46 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:abe6:89f4:1061:8343])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a02c646000000b004747d876aefsm1833147jan.6.2024.02.28.03.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 03:37:45 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Rob Herring <robh@kernel.org>,
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
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/bridge: adv7511:  Allow IRQ to share GPIO pins
Date: Wed, 28 Feb 2024 05:37:35 -0600
Message-ID: <20240228113737.43434-1-aford173@gmail.com>
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

The IRQ registration currently assumes that the GPIO is
dedicated to it, but that may not necessarily be the case.
If the board has another device sharing the IRQ, it won't be
registered and the hot-plug detect fails.  This is easily
fixed by add the IRQF_SHARED flag.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..21f08b2ae265 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1318,7 +1318,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 
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

