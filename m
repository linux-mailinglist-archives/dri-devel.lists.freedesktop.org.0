Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D48651F09
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6E710E384;
	Tue, 20 Dec 2022 10:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A439610E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:02:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c17so11854391edj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iaVNFQLQjvu/mR/33Qvn+CT5WA+rfSMQXLgBgZ4bdDM=;
 b=A1Zy6qoRVzqAGOFB96J1pF4ERIgoQXgHOFDmK4xgQnMA9IByu4kjh3dXqg9SDx0768
 9eOIKZvrDVcu1Lr5SDz6I4UX/uAxyFhNWxM+FHxQkA2sCr6dltN3cwp60irQx8HJtWm7
 1sGD1oV7eWyavHo4ijHytLcjchBuWv7EQj5AOSl3BmXFm10kcICy27AaZ+GL395V1wcD
 tRfxLexYrV9XfMDzIUGo6adh4OzxfZ9/V/EQJ+0QUZCnJ3A8IMvwPfAjiNdEh4Q7t6NK
 YxVD+9+UElauhoHi6RnNG91uqksaE0D+JEe1kGZBHjAFGJE/N3MFoTWOig+xWpIqZiXl
 c1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iaVNFQLQjvu/mR/33Qvn+CT5WA+rfSMQXLgBgZ4bdDM=;
 b=fH9xcQgFXSWvhbDBNkwW36zKhry/mn4fLT552ZDYkE5hojaGALCrVce4s7epr5Eb5Z
 Hmz2WC1p1V1/kdWdGE46W04QphqEeh8u4gzVmy6r0d/eAJaUGLe0fZMsDTHmgH6h1UMP
 e31CBNC9bhwyLS3xHqlTYS0w1YZcdNQxR/z5q8RbjghZBzXe+yzWqB8U0gxjC7A6up+i
 ABugQPe1ymecK+BGdwVBCWPsSZizaHX1knNLny5iGxSWWh+nfDFq9+2/oZhiY48B9CPo
 wA6riVNijKGXlVE5+GjdNwO+pgeOBO2e11TztmKebp0A2QCJzKAMr90hVqEIiinCP+f8
 t5DQ==
X-Gm-Message-State: AFqh2kqwY9IU3nAiwWInx24HsZZkNOgCawMWja0jIB6PchE5Y6Q2ALwB
 6rvPzQIOLrZ7L4IkY635HkrDeA==
X-Google-Smtp-Source: AMrXdXvmKZdR1xqWjHm/Mr9GhLjb73U4gYdCZ+DsGSdF0LkhCf8Hqf8o1AVqcBklR1QtE2zrDB9YuA==
X-Received: by 2002:a50:ed81:0:b0:477:ff25:867a with SMTP id
 h1-20020a50ed81000000b00477ff25867amr8453170edr.12.1671440569906; 
 Mon, 19 Dec 2022 01:02:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 01:02:49 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:37 +0100
Subject: [PATCH v4 1/2] drm/tiny: ili9486: Enable driver module autoloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221116-s905x_spi_ili9486-v4-1-f86b4463b9e4@baylibre.com>
References: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Tue, 20 Dec 2022 10:39:50 +0000
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
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
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
index 1bb847466b10..8bf0dca0b05d 100644
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
