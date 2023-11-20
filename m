Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD67F1F9D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1959210E1F3;
	Mon, 20 Nov 2023 21:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49510E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-331733acbacso2126129f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516799; x=1701121599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
 b=F4vraOWgEaNZjYu18ZuG5SogdIvOrQjUixCAyxo+/Q4kVSfh0iwRgGGaLClmE/lXo9
 6MLEAXW2bPOBqPNCyK0sKtkH9cfNqlV5O4b7DsC+zqvpWZ0ltBEVXcBVTTgWH0wXsz8u
 MkBqepBZeE4ksTZNTrK8HZMZe/6isiRKccI05Ns0RDeFVmo3XunJDUBKq3d0Sx8lBjgP
 1PqVgXRy0uSeTv6tLMBB+jcSZlXPhFGU7bJ9HeBEKqDJIeMMrGmZydfF1mOhUTmhEnIW
 kcQmwVqJPknABPTCbBcaqfcYPmOLBV4AwDhcaH1x51bMjnCqTpCqNcLNhGwW21o7g22B
 HXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516799; x=1701121599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
 b=Y1t3aKgn0m98Z7CtNcFtkI5c78p+kfpkzt+pBKGyoXESWwdraqh6Dh8DNE5UQnSsvj
 NvOc1ufamzFFUcFbeS9ibrSHTe5YaFWHwkN3iNc4pg894EQeJ3LId0V1ZpCey/WPAm4q
 ItbtcyFzZwCZoAA5/MLm0Sz6aius2gyhqn4MPlZ13Ykn+E+m+ZehCfvpNpxSSJIfQe9m
 4jKsc6KZokdiQEguis8QB2Q174WgY43+670uQXY+EvOLuHG7ipY44WJbRn12izZG5Xr/
 XlL8wMHofVzLQYZyA6KaZtZf5YvxUfoyAfeWuIUiObkIFA53NixOJOwJH311HBLiJldc
 dTWg==
X-Gm-Message-State: AOJu0YwcqUIIgbHucFW4MH0wxXpWPEhRjuYC53tqLBNqAQsGVh6PvIYU
 PmcUMBkzWEtDEf5LZPRi+Nw=
X-Google-Smtp-Source: AGHT+IEPEt13Bi9UDLuM7ucKuA1EJUrPpC7p/7AqpQmlWfFXaZtyMu7XxxZkwo1OTgJaGb+DXzLqfg==
X-Received: by 2002:a5d:4531:0:b0:331:6df2:3603 with SMTP id
 j17-20020a5d4531000000b003316df23603mr4725750wra.61.1700516798842; 
 Mon, 20 Nov 2023 13:46:38 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:38 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:15 +0100
Message-ID: <20231120214624.9378-13-hkallweit1@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;

