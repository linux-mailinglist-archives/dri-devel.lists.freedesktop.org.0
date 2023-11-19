Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0E7F05BC
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3C510E1D0;
	Sun, 19 Nov 2023 11:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25A210E1C9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:32 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-543923af573so4944280a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393311; x=1700998111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=PhAznhoij6cUKja9tOtbKahq2DDy8w2QWLfhqtohAgVrKyCWnreubwcQqFpelX1tOx
 +OTZ102/0v1aD50YPajPduAWOmmTYyRQPUWP+Hk/WTFGtHEKMe9MB9W9fthSS6iblEWy
 OErm6OqoofK6JePRIMOQFnpD5lI5lO7cxRykPwrtY9XOLV7uVtkH4RLq6RZ8NDOcjFXe
 qH1G1bkgZm2wP7+8zxrQY4AGNx7VT4kqP4hyeyMH6/L37xxhX2gLH/V/dn60AbHPdH0V
 LgbkBh8aQXv6rC/GAzean6tQ2x7nOCzZOSoO1FCiMK6lhxo1Jnk4A/F9V8rTsXDY2mPm
 wH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393311; x=1700998111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=bUQCZBUdjRxIGQ0HG0NBVxwL7T/4F9mVpaOE3HNSE7v9F76VXwyUKZlBQ4dlLWGHES
 VVdhibMGgRd+p+jn/PUWjvqIN4wSi/d50tD9LfZzZeUujF2QJeGA/1EgbBtisKVzDyuF
 oXK5mKOEv+7cSaOxeNlXsbGeG80jwlPe3gD0Q/bnw391z7YIfz9mm8QOvTlz+HRZUoFr
 dIKQo9ZOtTlcLKzuxg8QVBZGB74ZYiKvM5OO65TdBfxC9RrwOQs3BE2QnxJw99qPjvFp
 5hXy90TTfBSZ9M94IZlCavlsrlguCT+oJwXW8/E028LU0MP2i1cHx3Ko/yG/36E1QE2W
 9noA==
X-Gm-Message-State: AOJu0YxYv/oDTknzEgjfLcgCoLeH6GdpWwtVeRJ1sHhvUM3XP8wmH9Wv
 UNceZV3KV2AR4/JTSrn/Mro=
X-Google-Smtp-Source: AGHT+IHPtJDz6Y9TbEJbQOyBB/Oo4sosA/jONsRYvNjJizHcLos8hKdg2Z5bR3z0yhjciXL0cwqKOg==
X-Received: by 2002:a17:906:309a:b0:9df:2fb1:1a83 with SMTP id
 26-20020a170906309a00b009df2fb11a83mr3398055ejv.39.1700393310552; 
 Sun, 19 Nov 2023 03:28:30 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:29 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v3 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 12:28:06 +0100
Message-ID: <20231119112826.5115-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/rockchip/inno_hdmi.c   |    1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 6e5b922a1..a7739b27c 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -793,7 +793,6 @@ static struct i2c_adapter *inno_hdmi_i2c_adapter(struct inno_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fa6e592e0..7a3f71aa2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -725,7 +725,6 @@ static struct i2c_adapter *rk3066_hdmi_i2c_adapter(struct rk3066_hdmi *hdmi)
 	init_completion(&i2c->cmpltn);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->dev.of_node = hdmi->dev->of_node;

