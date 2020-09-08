Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A311626135F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 17:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774356E865;
	Tue,  8 Sep 2020 15:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171D6E862
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 15:19:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t10so19589767wrv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2h5/f7B8UduwNBWvSzemM2vuVc1bCQBvZ08jf0eflQ=;
 b=QClkfBuh7zRtKPZhArDNelPuXMie1hFY7FPB3XsPbRlBLzS1TUzcRStoDJaFj+3aVZ
 yTZZExlief7f9/Iaz2xUvIL7RcWsHwZQ+dr9MfSesaQgo3huHMHVokyq2FXgZ8GVlJDl
 1TS2E9clRVHW910paXbN65GvZZV+smkSMxbGfjOBBa0lyhHQztUhkmg7Dmm1Hfq2NVE6
 BmH23sbtkUVAVWuPHKhgTjjrX7RT936M3DSZzYqPmz+fKNSG9gOdKuHoLkvh0mK0u0G7
 awgJf92IvgOMOaHm6N4flJkgsHxhNKL/LKSivxXNIt9SKPgp9zu4AtvEo76gxXM6ojik
 zlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2h5/f7B8UduwNBWvSzemM2vuVc1bCQBvZ08jf0eflQ=;
 b=T3qEkWw3jGzuRrHp5/Klbn8jXGVKfXrWVa2OpSdoc0R5T0yRIrGGsMM+YvuG86xSQp
 VAM97re53dh0y3/NFZTIiqc0g3keG26U7aBkdKh7s9pvQ44ICBuBtMDMvxdtEmBR3jnO
 WNTl7zHNOnGuQDNoyjKpH6t8+IQKVU/qcXjLPC1/Opsmb0XP6OYvmZUApZJ9Zig3QTrR
 uqw77qCHm5S/0HGPq9Q5Wdx4PeyfA+DG3YQIhq9A9GCNoqHLngoLgf0sv6omaz+oMxBy
 08D7Skf2G0HdesfXMq9RGkZEfm8rrzmmKTh4UZHJRnmXfGpdvHWldHv85jO8+qKiHEbm
 FWJA==
X-Gm-Message-State: AOAM530FIVABSEpkC6KwmgeU1yE08IF8WqaC8b8tSdj4ZYGersU6IPe9
 j4k6DobSAzT7Q3foZfXa07v4Iw==
X-Google-Smtp-Source: ABdhPJy2ANgwewAvMtdvyK0S7iJLntLssA/HK+zsOS39X389rZIqUtFcfuRkd6xLxKT6uQiYWITGiA==
X-Received: by 2002:adf:e690:: with SMTP id r16mr135272wrm.15.1599578345135;
 Tue, 08 Sep 2020 08:19:05 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 5/5] drm/panfrost: add Amlogic GPU integration quirks
Date: Tue,  8 Sep 2020 17:18:53 +0200
Message-Id: <20200908151853.4837-6-narmstrong@baylibre.com>
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

This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 36463c89e966..efde5e2acc35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -656,7 +656,25 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible amlogic_gxm_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_reset_quirk = panfrost_gpu_amlogic_reset_quirk,
+};
+
+static const struct panfrost_compatible amlogic_g12a_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_reset_quirk = panfrost_gpu_amlogic_reset_quirk,
+	.pgtbl_quirks = IO_PGTABLE_QUIRK_ARM_BROKEN_SH,
+};
+
 static const struct of_device_id dt_match[] = {
+	/* Set first to probe before the generic compatibles */
+	{ .compatible = "amlogic,meson-gxm-mali",
+	  .data = &amlogic_gxm_data, },
+	{ .compatible = "amlogic,meson-g12a-mali",
+	  .data = &amlogic_g12a_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
