Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF4133AD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FEB6E171;
	Wed,  8 Jan 2020 05:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B1D6E174
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:24:07 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id m13so560588pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZPi5S7C9JBOvDvG9rs8XlkVI4VOHpLwCsMiOaYI8o4=;
 b=KZ2Fr1SIWZOlOI/MInwohmz1Hb6Xx7Tq+QTxkCat51I7DcfFdbynSqAxDlo/ZrmAzy
 bzYx04hvPnPCCny7HlSE8qtcQ54XXy3skRRoKWw/srh/+NPKZBDJmkfK0r32EhMKP8As
 Ki1O01CCcGhKnBDTGVZ2lIeuDq9nZ6XwreZMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZPi5S7C9JBOvDvG9rs8XlkVI4VOHpLwCsMiOaYI8o4=;
 b=JUQsC7umP8fc1JsXXxR7OChZs6kj/BiQfFaTwNSDAPxOeZ5H7hTgh0xOew2dtx2xUq
 gkLIb663bavt0u0hfOPzuFd4xJpHZsfHvb1HQpNX2gagQI1+6Lju7HMCSgfyKxQKmCzN
 ZJqwMz1t07WF7TMIT1HtswK/6YsFR9jVpCp8BV74FKVu/FDedg5jQQd8vHnHridsfJAe
 JQXt/NW0m7KlSoTcdLRLEsba6VQHjGPW0/9wFBwzpzE6Snj5olR+bvXc7bj8VDqE0s56
 WQ+9sALoCL+mJ4JOk9/GJ2Z6JZeXZ7cbxOSRiX4yZPHovgD/bmlofLE+RSrFmpUXMYZa
 wDOg==
X-Gm-Message-State: APjAAAUKvz0xfWC4Ju4TiiyWhr8mwAKmnOJdoNfM3IBoYNzo5AjUwFDD
 lbZOonmExoVl2GiUed2FePH4oA==
X-Google-Smtp-Source: APXvYqyXscgEKtXSz2fpP6ePSqF6Ze4O7OI5VBeA+RFqRdvOMivOeOELOfMM09JM7WNsSJ6itelcsA==
X-Received: by 2002:a17:90a:d789:: with SMTP id z9mr2508178pju.5.1578461047043; 
 Tue, 07 Jan 2020 21:24:07 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:06 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator for
 the GPU
Date: Wed,  8 Jan 2020 13:23:34 +0800
Message-Id: <20200108052337.65916-5-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs, namely, the bifrost/g72 part on MT8183, have a second
regulator for their SRAM, let's add support for that.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 238fb6d54df4732..a0b0a6fef8b4e63 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -102,12 +102,33 @@ static int panfrost_regulator_init(struct panfrost_device *pfdev)
 		return ret;
 	}
 
+	pfdev->regulator_sram = devm_regulator_get_optional(pfdev->dev, "sram");
+	if (IS_ERR(pfdev->regulator_sram)) {
+		ret = PTR_ERR(pfdev->regulator_sram);
+		dev_err(pfdev->dev, "failed to get SRAM regulator: %d\n", ret);
+		goto err;
+	}
+
+	if (pfdev->regulator_sram) {
+		ret = regulator_enable(pfdev->regulator_sram);
+		if (ret < 0) {
+			dev_err(pfdev->dev,
+				"failed to enable SRAM regulator: %d\n", ret);
+			goto err;
+		}
+	}
+
 	return 0;
+
+err:
+	regulator_disable(pfdev->regulator);
+	return ret;
 }
 
 static void panfrost_regulator_fini(struct panfrost_device *pfdev)
 {
 	regulator_disable(pfdev->regulator);
+	regulator_disable(pfdev->regulator_sram);
 }
 
 int panfrost_device_init(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 06713811b92cdf7..a124334d69e7e93 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -60,6 +60,7 @@ struct panfrost_device {
 	struct clk *clock;
 	struct clk *bus_clock;
 	struct regulator *regulator;
+	struct regulator *regulator_sram;
 	struct reset_control *rstc;
 
 	struct panfrost_features features;
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
