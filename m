Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E962EA5E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901910E6D0;
	Fri, 18 Nov 2022 00:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1580010E581
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 08:47:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i21so1509552edj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 00:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
 b=JJZviyNTe3aoLaHC8gnS2B6ZcTQTNzqCo1CNL5fhLhh/Q21pISItv3OuImIZPearuW
 bcPv8/v3zDuo0hQF1Lxl2dF61VnCzkP4spsZMx9z8F5hpwlR6u9zM/SndG3dLHBBLnY0
 k6htMUas9GgLlqwNVv8haDJ1k1sKtjozX77I+aljOtKJKGPtB+BuHZSWCo+mN29Ll9Qi
 CRzV4Z8IPLuKuq3E4NgPh9PssxWg2C/4fGnvj7vEgj1k5ujzzy4ewWa9SM19CUNImdn/
 LvG4iiIh9BzZTOLPVDG0udI2RexERIauevvSdRle0EGIrUaKj+OeJ5HOXjqL5Qsc/vat
 CR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kplxU2lR5aG0mBiBv43tp2KK14DvgQ3747TCEeV3JMg=;
 b=Xo4QqRYOM7rv7NtDJz2OF6mQfc5bNbLlqKtDOMuY7XheldvXZDgVv/+UI96HPLKiGF
 oQb6X4R6oH/9V27lA2PoPwFTiR3T9yMv5/IV+/PR4OZKim3mumTGtxeVqTommaH5ueh2
 D3TVtf+lC7VFo34ndZ5ACfmqgL3REn18i8NybHf8MC29P3oLDauZ4dHE1ogL/WAoaxNE
 N2ux27bamF7s49SFVGPANDAZvc2X9HQtVBh2R/vq1le48blE/guhL1dyNkKRv9xqQMQ7
 zqZNyx1GyDA35d70lOIj4bchWGZCXe/L+zMbOxqUucj7D4fcNA6lK8NSWhEg3+etWiCB
 q7qw==
X-Gm-Message-State: ANoB5pmqnPCASu3IYdjAWXFSvn3R+xM5sYcD9Kn3n908kq7bBosCa7AK
 jM8SLApl7mNGSSc3Tm14A80czw==
X-Google-Smtp-Source: AA0mqf6g15i8zsDuyqA55ZoKaief9KDXNvdMbq3LIDvKdQEDkFEbkFvIVViVnfvYrya19LRO4KeNXQ==
X-Received: by 2002:a05:6402:4d6:b0:458:789b:c1b0 with SMTP id
 n22-20020a05640204d600b00458789bc1b0mr1277535edw.89.1668674872601; 
 Thu, 17 Nov 2022 00:47:52 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 00:47:52 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:39 +0100
Subject: [PATCH 1/3] drm/tiny: rpi-lcd-35: Enable driver module autoloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v1-1-630401cb62d5@baylibre.com>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Fri, 18 Nov 2022 00:32:52 +0000
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
Cc: Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SPI devices use the spi_device_id for module autoloading even on
systems using device tree.

Add the spi_device_id entry to enable autoloading for the 3.5inch RPi
Display (rpi-lcd-35).

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1bb847466b10..bd37dfe8dd05 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -183,6 +183,7 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);

-- 
b4 0.10.1
