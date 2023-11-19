Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566397F0534
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605EA10E1AB;
	Sun, 19 Nov 2023 10:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6E10E19C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:52 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9d216597f64so461944666b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388891; x=1700993691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=N2OEhs8svYe/1qAqE4n+jPsQMYU63JC1lJGUNi9AxJqFq8lvtJWFMSQjVwNqO2pQlz
 1mzoZ3CkY1C5EgFtJjf6crpxPXimYLHCIp4sHtv5KSbwLvLfSJYp9x90y53UdAYFEnl+
 3qoiDAw9aSzquJBxLtRwG88pVxk/8VX7yFI5CAB5JJusgQ8bcfF9/LSzJMd+8H9iBjhN
 lr+KAJXndDUFniU0WsPlMnANZz7xFSLyfMdbw8yBJDiOndr74pkSMzb2aMI9/3L3QNOF
 xSq1FWXKCLFKA0dYuNbtpbqCLnoa3ZGvBUQyG+MfIF0C95hRHa5cBEz2HJg88UfHB6TH
 E/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388891; x=1700993691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Flg3cjX3M0BMzkNxd6dhw9SgkIHrrzmjyvbrc5ZWO1w=;
 b=SrZNh7taXzNbIB3sYerUQkB/1XG0VCKJ/AtnPxiY8SYA6hj7ipVw4Fqbtksy5l1YOh
 HANf1vSHEUR9EW3AC9EzymnZt8bTKph1MB/YyuclX2tHUiO2mDp4L5X1yuFKzH0JEZfr
 dq3L6ZmHJcb9iaiiZNtnsocvRTktZzv5cbiprRZE8VDUq04eP2kF4U3nkfvdaa3uHCM/
 POyzfczt1mXG0yFpOeuZdjVgIEfDyLXhQr4S180332qHClG6QbYZtPRvdXtVTYsrxv4C
 2bzWTueDe6XdSzjZFzUQKhR1wnB1BUGO1ZxBMlO5wQLCT6ex5sWY3cjt9wpnJVsEMce/
 a9xA==
X-Gm-Message-State: AOJu0YzxTWQlYyvYR6KmbT+zvlrhtN/mRqRql9Ki/VuEJ96mJrdTWW3V
 JCjSPk1bSul7nx7P1rWCBEk=
X-Google-Smtp-Source: AGHT+IEEVozgrh/6Rx9qN+MfKy5rNAZjGHZv+pzm8pL0WUjL9KQQ2Sv26qqyIC1UTM8PRyGpjsraBQ==
X-Received: by 2002:a17:906:7394:b0:9c7:db3:8b31 with SMTP id
 f20-20020a170906739400b009c70db38b31mr3495931ejl.59.1700388890388; 
 Sun, 19 Nov 2023 02:14:50 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:50 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v3 01/20] drivers/gpu/drm/rockchip: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 11:14:26 +0100
Message-ID: <20231119101445.4737-2-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

