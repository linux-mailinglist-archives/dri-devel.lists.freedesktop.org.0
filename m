Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6B7B2C2F4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4B010E5C8;
	Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QG0FBKAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECF710E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso744816966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605811; x=1756210611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
 b=QG0FBKAtq+cJqO6GFNrnE8jHgxyjqYZVVTGpi7xSr5eDi9JLYyGxda2sHHHb8EOznW
 qNXt3RgigNT7RIArC5QPel1Oibk+RQMGwGyx+cbryfgEdykfLboOnRlGrMyziqt00gs9
 SKy84jkYUbAlctqnELFuPkKn0wVw9UZaI9rtu/kL3+0IDwYLR4vL3Pj3aAE1XKvtD7C/
 54ZNFPaL4zCnYCiK5FSZwhn+AqQedULjTN+tqLg/QdtdVqM8qd9Sud42K1ujDk1q0VNs
 PsDug+shOsoa1Qqk0s7Cpx60BevGg4P1/j2Gyi2f7jB2++Hzhx8Qz8rvONK2wg2AN1aJ
 dlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605811; x=1756210611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flb6InEp+Rhz/Z2grT5FKfpHtbQ47S/+b9t1ySuxxnA=;
 b=uVIbH/mbxcwRDLv7cu2+37V94t/IoeufCLLTy4ap2KP0dQ/jJK6vTlsiPBVIcLV5Lc
 LPLkxnHppOLETvxXGKNRAtiDW2V/e1ZpQ2sXAconlQCjXQOpzGz1G8mdPUSDEKbbXaQ4
 eA6gX3SFEDztxszOMrd32P67pnnGgtTkV4jX/wdhMSka0S3iMaUJvhbOIY/Yk4b9HoMa
 vBqxcti/hCXDe04syhaklXUDv2XAzFENlbaU3s51CbmLVFZNMILRzWWemGiXIqBiT+aC
 8phmDFuM8GrI8weehu8ZP8ezKGzA3KV2J+8KeYE02GFPoz8XeLquZvaVBeS1zBeWnMvu
 l8HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWeW1ZYrVfY5EwzlmavunEDDRp5y3l0vB3eI7O+eSKw17zMJV7emF6wtYLFqPFIgKyBGn2m80gpwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1LjwZXqP24mLgl4ia/EkaCUAxRGsg4Jsj9kpBQpJXpeBVxNB4
 teTeOxOH+RfzFchc6GAkr8bGzspcNq0KRowAMuik5ytIZ45ODNBsonLc
X-Gm-Gg: ASbGncuXjr84Wn3FfTLuzKT1PVgupwWWsif5DyboyQz4e95NKMaoeSa/SRqBbqjoA3s
 Aav332P86YJpHdqlqQYIyNzrc1dVW5zGIInVXeeosv1fgHmN0nbKTL89pp/aw3dcIcz/GP9HpGe
 jGyJCG50+UgkyO9lzWE5lMS4ad1rxx0Adt0nnj7hV3TYHgUckRROCrhLlZtlDGvohT0OKlj1Ljx
 XLB2Kw4DvnuNzIpM/g/Q8bwlbjrwtFqopbCTY8GdzaetYasejdmDk00eOzWC3j0yyeN+6t5hSrw
 Ld33tsZsA329npIS3/lpg2PR3PWeNHWD2naMFPVc4RRNnUx+hEVPBIVIVoHWW8vN0/IrFB2ERor
 8s5vpVjZ/zS8P1A==
X-Google-Smtp-Source: AGHT+IEXOXhJ0hiodB5SHvqbo00ALrsk+5peNPZ+NBwXvS3HlKGWuLTRmhWK5ct+hfcLkurIUQXNKg==
X-Received: by 2002:a17:907:3e9e:b0:afd:d9e4:51e6 with SMTP id
 a640c23a62f3a-afddd25a827mr222294066b.62.1755605810477; 
 Tue, 19 Aug 2025 05:16:50 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v1 05/19] staging: media: tegra-video: expand VI and VIP
 support to Tegra30
Date: Tue, 19 Aug 2025 15:16:17 +0300
Message-ID: <20250819121631.84280-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exisitng VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 3 +++
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 4 ++++
 drivers/staging/media/tegra-video/vip.c    | 5 ++++-
 5 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..71be205cacb5 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,6 +1959,9 @@ static const struct of_device_id tegra_vi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra20_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..a25885f93cd7 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -127,6 +127,10 @@ static const struct of_device_id host1x_video_subdevs[] = {
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", },
+	{ .compatible = "nvidia,tegra30-vi", },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..00e08a9971d5 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,13 +263,16 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
+#endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
 };
-- 
2.48.1

