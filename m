Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9DC7F0180
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 18:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05D510E177;
	Sat, 18 Nov 2023 17:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C515910E332
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 17:42:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so5042755e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700329347; x=1700934147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=kCzK5+Yi0WurqgQ8KVft9a20/Ea5nE//cDKjyodUFA3eW81mdeIS/bV+7kvGLfyMBC
 7ZHCJ/K8IyS74L/ZqN+2WkszYkSHeXQ85u3FOLllcg9wkso6Fv8PcoRV843ZIOwwbq98
 Q5lzTDKL8es8k3n7v+GPq9JYLKP8xTT1nq2/k4pie8CrtxvVEB3RG58uZvBtEdcTsOFv
 3u06iN6Xu6Dr+Z2/xMDbBfJgDXRDR4P/IabpceTvfydfNQfqnGcb73ANSQhqgH2kKOf8
 edHuSxM3QZ9e5SXVlN7W/d6b4O16n97JCKN5y9ksJvaxJtc5inkwa2pW5Pi6TF3YvI1B
 Wotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700329347; x=1700934147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=YzJaVeB3O4d2r3dTSlFllFSXNaDNed4ND+u/pkxygAR8F9AVrmXV72Ue6HZf2Xj3tW
 EAw7l7CxQXQEwvvyPf6Z6vsPNNbagbtdWTC6+r25foWqAEQvU2IUX4uu9r2Dc1c7bRfF
 tfRk7u6rTll9guWKp2OTb+vd3Qegd5Wp0p/6lKNhMGXLwvHAG1KEvuVK5BolBOJh7cNk
 KLR1DqrDmAgJ39afB/Y4HR3eCsSjfYd7bkIEl+n6wxMk66Em9mPMXwDxldzwPFuqR/Xm
 7E+ew0H1SCswzYHtb6fXwgmY3myOk9yehq5kTFVULvnpb7ubRPnUo49xw5230Q5DVC5F
 9kkQ==
X-Gm-Message-State: AOJu0YxVruTEHDxtnwD8WmbU6Vk7bS9bL2ZMdJsuDLLFJybGc4K/Vb+w
 DCz5quj3lVyiuvT41xXPTwc=
X-Google-Smtp-Source: AGHT+IGchLGNn/UTh+TSPBum/ynhaPI5RIfSnYeSODGRmp9mYu+xtswabBOKG8QD70Eu929TNCd0ww==
X-Received: by 2002:a05:600c:358d:b0:406:849f:f3cd with SMTP id
 p13-20020a05600c358d00b00406849ff3cdmr2461814wmq.29.1700329346812; 
 Sat, 18 Nov 2023 09:42:26 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:77bf:8300:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 09:42:26 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v2 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Sat, 18 Nov 2023 18:42:01 +0100
Message-ID: <20231118174221.851-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
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

