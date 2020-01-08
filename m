Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC58133AD1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA386E170;
	Wed,  8 Jan 2020 05:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E8C6E170
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:24:05 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id ay11so612975plb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXWKPtv3cxE8lSp3PQIY49x0a4P+s/RHd/rRix+wGzg=;
 b=Jfjo+Faggwo7DaWWKVmhC7/00Vvhz+MTRYNmhAKQYX1HCOP3EYR8Lin5NwFPnmhjMY
 4+Fb5Qu0e1wDWqALzow5cVbQpRrmDtK6+s0MWVLSCLeAn/oBigTNqV6pS0G3uvjzNP7g
 ZOYd16bXAfTR+SPI/3E9hzT5bBEzHfFjf0IP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXWKPtv3cxE8lSp3PQIY49x0a4P+s/RHd/rRix+wGzg=;
 b=UHF+igdjs+VmkZIai7SWCrOKYpWAhcnN5kIt52vDDZjwanR030yne6gEKN0ml8rz3h
 x52O7H5NCKZPmkWut1E2moeOPCp4LdUcP71QlTsCyU1eVCkXCMDwEbbjUVziVMpqCzcl
 NKgKyv9W14FOHmtm+3OHH5aSat0LxZ9ZzGd9GgUEzpzJ25NR0pnhdxOhi6jz4AcHw6rH
 pu44+js8rm3Utixq166vTvyue9h2W55t7nSR2NFcLUY78zYY47FFy/05JaonaZf7Fc72
 wQ60fX57XECIa15N5Xs+nS+YOYgVRkrHik24XjuPvRZTxiSfxTZc83XsmKs8/Xeai9rg
 9lTQ==
X-Gm-Message-State: APjAAAX2CGQfljSfe1B9WVh3U2Cu2TXRW0zKNvOW8Viz/PL01WKw/cxw
 v5ckzQ6Ry9F6OfsxrpwyGODpSA==
X-Google-Smtp-Source: APXvYqyHC+8oOSDbkbTqCwSPnXshCUeDVww8reRuLxI2n62N7ExPieyrDCDC2ipIyCqYctUkgXWJYA==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
 b44mr2510426pjc.9.1578461044170; 
 Tue, 07 Jan 2020 21:24:04 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:03 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/7] drm/panfrost: Improve error reporting in
 panfrost_gpu_power_on
Date: Wed,  8 Jan 2020 13:23:33 +0800
Message-Id: <20200108052337.65916-4-drinkcat@chromium.org>
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

It is useful to know which component cannot be powered on.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---

Was useful when trying to probe bifrost GPU, to understand what
issue we are facing.
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 8822ec13a0d619f..ba02bbfcf28c011 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -308,21 +308,26 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == pfdev->features.l2_present, 100, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "error powering up gpu L2");
 
 	gpu_write(pfdev, STACK_PWRON_LO, pfdev->features.stack_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
 		val, val == pfdev->features.stack_present, 100, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "error powering up gpu stack");
 
 	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
 		val, val == pfdev->features.shader_present, 100, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "error powering up gpu shader");
 
 	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
 		val, val == pfdev->features.tiler_present, 100, 1000);
-
 	if (ret)
-		dev_err(pfdev->dev, "error powering up gpu");
+		dev_err(pfdev->dev, "error powering up gpu tiler");
 }
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
