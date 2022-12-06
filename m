Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0F645526
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D862710E360;
	Wed,  7 Dec 2022 08:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D184010E302
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 08:34:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id vv4so4444131ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 00:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3BPaUYtbAIV1BLKNgYdAozqHw0R4+q9lV2NZg2CpgKo=;
 b=H2H7JKYXXvAfClM3nA4go1vg+3MHl1e/2zDDCysrg3tEabCsIvKnRzv0Wvtb2s10VN
 304O8iUaaCjy+dnUF4jp5tvxQ7MKMC2YGkV23TPpDOStSB2Upw0HDsdfWJMs2ioAEOrO
 fhKRJupDAIl1fLdC4rmrOPBhagh95bOmoINpnJ0Zam1PJQYxiVWiFMx4uAO8/VhJige/
 q5RIt7kTTdZLXfDSogK4wYnAWCRuJIegjkPjFnq6DxnHXIQKAcCVC2EWQgKtVEUTgRU7
 MuUyGBNerPFdl7BnbM83N10a7qTIxPVwG7X9BJpk4AcHrfhY18IPOxuXDtofPfhLSKvV
 XlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3BPaUYtbAIV1BLKNgYdAozqHw0R4+q9lV2NZg2CpgKo=;
 b=6yUfWmmzQ22HTO/1HW40gFy3kMygSA5SAdeP1a2gO0YoLt54tY89iwo/2xL6zeX3x0
 UC+0omh7RDyCiOJN48P94mEV5+0oByn4T8HgG6vX91EyRCbp1zhVjITIe6lp2jqtlA0x
 IN6sGW0nd3tx4qfJswZQVJWYO13L1X0m7G0b6jMP309yvp+NmilWv95mtyUjY+7m8zcb
 425pLEk+WXiykD+bONUxs1sPvxqHWlL5eynRfA3JvJxfieHDLuXbThfGF1WoGt9bxYK0
 zOE09oL7g9Ozy5WN0mpYX0Yc1lj5T6DaV6gWnj3snKv5VlA3iZOX/J7YxBUjUPyWhrqW
 SJCg==
X-Gm-Message-State: ANoB5pnnhMOlT1uZPUTvH7fhKJBy8bTKohVilUaQq/3NVKc3EVwMx9d7
 ryx7hQOj7QO6GQ/xYlmupMrkMQ==
X-Google-Smtp-Source: AA0mqf5Pz039HsSECacZv7n6SegwyteVoV+SG8Cjh+HO/AU52+pi8GERHDDdw5tp9McDI8DIbvAY2w==
X-Received: by 2002:a17:907:2c75:b0:7c0:bbab:a550 with SMTP id
 ib21-20020a1709072c7500b007c0bbaba550mr14397235ejc.168.1670315649259; 
 Tue, 06 Dec 2022 00:34:09 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 00:34:08 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:01 +0100
Subject: [PATCH v3 1/3] drm/tiny: ili9486: Enable driver module autoloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v3-1-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
Display (rpi-lcd-35 and piscreen).

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index c80028bb1d11..2ca7c59771f3 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,8 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
+	{ "piscreen", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1
