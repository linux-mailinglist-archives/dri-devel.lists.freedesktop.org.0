Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DD7F1F70
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E0810E1D7;
	Mon, 20 Nov 2023 21:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FBF10E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so3595572f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516789; x=1701121589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=XZ5z0KpD9GZKiS2I5oh0KmwMFDF2KsFhlx48vdnQqzf4ujaw3XsMFIkl1QudlhsMM0
 vfLsR/Msawe/klfgQJdgzjma0wG6KoGhGqFajzxNr4hKaOTFJy4s00FhxDIF2l2LDIFS
 dT5le2r6gSg5PTeu1Q+/+0NzCMSbgHUNA/9i4bkASXit4akYR36MZujyzu3GM57HCq1a
 APzl0Vv8gVRX3Sl4gi92yeAPmkWGKERbpmDYU2zruKIHOEeFGx0QlXI4InheM8H9aaoo
 9aZyGFdEyGJ+aThRBIACg3BxOlz91TyLQe8qaiJfTtO+6bZ5Cs4OPawrI+bEj37HQRes
 g8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516789; x=1701121589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=TcT1o8goTK8jbpEhZnV2idJiWvn0L/qRzX1SCnMS9bksCQQ/R2YX8KbuDzJpZ/p+Lq
 pn7et0hk4N1+KrhEv8KwSzh7877nA8QAPenN5coFXdEP8dtb5fULrslB9Owz16rI6R3K
 u3u+lrQx6u2HlenUZFIrfHkCGht1BFxlYUKGuaZtrcz+ckR8bfLAFpa7UfSTco7khgm8
 NdYW4Y7LZP+2ivMjSExg2ADHuw4TU+52fgd849qIZqKw7JeAilMhQGElZs269crhHAaV
 LOoroCX1Y0H2ohuJx9tFHGn2Kl4LBHsDCvgPIvNmKp4Ae6CKPt1Xm0JANdPmNJq7DS5T
 snqg==
X-Gm-Message-State: AOJu0Yw2MaPtGsQkVxF7frUSweHVAovU8/krKA4pEObfEZekUcKAQa8o
 uysHP2PpTOTWVRuaCTPkttA=
X-Google-Smtp-Source: AGHT+IE5KIoURghYVkvfU5wQxiGM06yHQWDaD6hu7bxfA9LnXbZJ41nQqt1tLyyxToNmpgxikLPPeA==
X-Received: by 2002:a05:6000:156f:b0:332:c432:b7aa with SMTP id
 15-20020a056000156f00b00332c432b7aamr663360wrz.2.1700516788640; 
 Mon, 20 Nov 2023 13:46:28 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:28 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v4 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Mon, 20 Nov 2023 22:46:04 +0100
Message-ID: <20231120214624.9378-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

