Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10907E9AE1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFB610E066;
	Mon, 13 Nov 2023 11:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EC510E066
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507a55302e0so5970096e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874641; x=1700479441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Opo2n1kgRGyqTe3TRkg8x+CZ1bdNAAuwb0HOdaOfFW0=;
 b=J5QlwjHifa9svUjoAPJwig6b3KGr/+omst0g2nYUYQkjgtqljadJu9lqb+MOVSJWZp
 SDnN0cl8kJSBHFhyXUgQAXarxiwZPLLMNvQETU5BwBpRa9jMf3qSnF77JhPK7xcZIq2h
 QgZknk8nVp0mKXyHhWdJ5U0blpUB9ENI1U2Jnm7NVKDv2iuqGsu4QdPT7FhyEP8C8ZE4
 GCZD7ktYdluEkqoUtEKrbm1XLXviY+XkfcnzGvwbsEsbemJqov7SV5YR2NrRXEfMjWB9
 sNbCIhlKM2ZEMP8p0oZs87Z+krQVidqVT0SiunBFZPgrbDQIwmPb4ZkrBkKYeK6sWGBA
 +QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874641; x=1700479441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Opo2n1kgRGyqTe3TRkg8x+CZ1bdNAAuwb0HOdaOfFW0=;
 b=f/CkfWFggVcg0+pfV/wlb5IHGaxf5Gzma3Cxa9nwD1xSL+Hgrsv6Sbit+6VSTRSNZd
 moZT5/m31X8R2vzZ4RNioc+wD8RHu3GcYJUzZBBj+spmToScXKzc3yyi6d7tsJ4hPR+K
 60SWOLZD5A0FefGhft9dgZHOpVXsRohBn1sFSfKEvsSvX8DuB2U/+1LzqTyw4E+Nt81T
 CxUA1HqxkKtIQq2c/DwlEKbrTptu4XUuvRgPCpkn6afVQLo6OM0+yDfoNUpBtZdc/N5f
 xGcET3uZZoHOXh5VKoI9WmhATs59Dz38eX8JEgXal3KUDVpb0knPlOXLCajUhiJ0olYP
 PSOg==
X-Gm-Message-State: AOJu0YxOIMRc1Y/DldlTSl1dnlT+SuYmzi0ueXGpBGtB0dax4AhfBNbA
 5vVO++Qx6mLtu+piQjPGja8=
X-Google-Smtp-Source: AGHT+IEC4bNxMxVLe61hoEBoRm/P4z68EeACSaOaY2P2h8vmjgRJS7MeWj+M0EXY9PL6tHaJ0DbGAg==
X-Received: by 2002:a05:6512:3e0f:b0:507:9628:afb with SMTP id
 i15-20020a0565123e0f00b0050796280afbmr5515817lfv.68.1699874641249; 
 Mon, 13 Nov 2023 03:24:01 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:00 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC support
Date: Mon, 13 Nov 2023 12:23:25 +0100
Message-ID: <20231113112344.719-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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

