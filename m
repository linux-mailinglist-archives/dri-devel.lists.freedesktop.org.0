Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A026135B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF036E86A;
	Tue,  8 Sep 2020 15:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B054B6E86A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:19:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so19583255wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjvSHXG3RI2RmufIBrYIZQgGCbPKahWO302cZe4SW9Q=;
 b=1fRpOHn2lUTg/rLqc5FK572t6QTaVx2cYu+zLDiJpPqs8Msd6mxRGNwuQj7o/RemeB
 lp9id7bzG8bubb29ko3iwRYgZzddu8jc1z5ySmEpJQbi81n/gngRijw8+0G4Hmtjajt3
 VkvFnYnB70FT/9x3O7OLKvsN8UDOhKP5dcVjqfmkLO3lasTdS+d5yCZZxHw7Ga9Zja2n
 1y6vyBkEwXn/0qvCvQTQjk71wPIDCn2g6OnC0vEEUSS8gU1hzC2FE/iYN4+XkIbnAbOg
 otF3YD6EqWDUDKMsSqkb8xASmC62YkldJ00uUh8OxuTRQbumbWBoRkx7YxQGBkWdFmmm
 Szvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjvSHXG3RI2RmufIBrYIZQgGCbPKahWO302cZe4SW9Q=;
 b=WaIoTiXnQuNchxssJa7EjJKXqUSb1U+HY28+0hPTf9uyaMKrZPWELPBeJyDjP161l8
 7ybYGYrCIMxJl0/S+H2Wlg1zjm9TafQTq+NcGv2QNkm31pNafjSk2pB2fxJwDtUmGTkv
 /MXvOMmUTT5szBFroY7i14nyy8sc2QbifYwLq5JCFeA3Le+meVos4xuq4kPvciCTf9Hp
 IThpS3B7KhLW6tV5nRPsLjEj3rPFVFts2zr0RLCLKSqkQu42+tXNaydhBeS/6uWAAaTb
 g4PegaT8nzXC+rD591MckebE1tzEfc/gSGvguqf49WzeH1BAeamSMsuU0eWjbszSwIeH
 d7JA==
X-Gm-Message-State: AOAM531s0N2RKUjEPcQ5lCXiTEqeQoywg4DR4TR+tAaIwVZBLdsL/OLX
 qOeHCqAiOFdxiQOv79AWVzaJVw==
X-Google-Smtp-Source: ABdhPJyN+wVgZwcIGrsQVVJMowKAn9fgE7m5lBvFEuTQvke5O9KsubvDObKWcbTu0XD7mkbW64TA/Q==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr110043wro.319.1599578342220; 
 Tue, 08 Sep 2020 08:19:02 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 3/5] drm/panfrost: add support for reset quirk
Date: Tue,  8 Sep 2020 17:18:51 +0200
Message-Id: <20200908151853.4837-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

This adds a callback in the device compatible struct of permit this.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 2cf1a6a13af8..4c9cd5452ba5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -73,6 +73,9 @@ struct panfrost_compatible {
 
 	/* IOMMU quirks flags */
 	unsigned long pgtbl_quirks;
+
+	/* Vendor implementation quirks at reset time callback */
+	void (*vendor_reset_quirk)(struct panfrost_device *pfdev);
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index e0f190e43813..c129aaf77790 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -62,6 +62,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
 	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 
+	/* The Amlogic GPU integration needs quirks at this stage */
+	if (pfdev->comp->vendor_reset_quirk)
+		pfdev->comp->vendor_reset_quirk(pfdev);
+
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
 		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
