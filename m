Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B2B2C2F3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 14:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD64E10E5C5;
	Tue, 19 Aug 2025 12:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y8Id9G3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AC210E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 12:16:55 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so873899966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755605814; x=1756210614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
 b=Y8Id9G3PAW7/li9URFHoKoiUxRKoHNkdLJ2IO+H/35wTgkjfMwFWIVOqKopPUdSPW/
 I+9Qe7JAd3yxRYPQ6i+w7Yc/+MBgMz+tHu1up+zfBnW60hySHvnBeMxjkp4Y5O0JMUW9
 nvTDW7spohFf5Ni3FSdh1xQCAkRMApiD2B9qVL10F9xlPUQ1J7TFc4t40U1MFLfZSBna
 LoelB+FoYO3wRkjJJLL70P6+gOVn3lS/Q9+h94S2LGRVLslXu9rlN0a1wJURzQz2UbUL
 XSL7wN0Mqq3lLzlV6oci215fRsVRAds0z8IkZBJo0VHjHD3OTdJogdWvteFCAT8eLXvd
 MTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755605814; x=1756210614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
 b=KLau2wTitEpP+dQgC0Xf20FNXI6aeZex7mxxto+0RZtoZyFsqybjePeMWUpu6GaNm+
 itbHpJUJvBlmIrUVgjDsgQKSxoxr/1CandifECybgGq0dN+PxEnkhZk64S6gSXEGYSuh
 cc7tWUQl9/jVTjQ2wN3qKo7YPpq3vGSj4li8+wnHZY4fmT683pebQypmD8qAN+dZ8f1j
 qwCdAxpAi/RHTj7rXHadPCsMnQdV3Jumc5K840ItV5LD2taU+gsub5HhcJI3spTvSiSB
 6//X/3ZCNQoh59XwLWBj9QRI3BRnv7FUmiVo8iiClJ1Fe2KGPmNLBmlOT+JcTGRWcV+s
 ULEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6S7BleI5+n2pqcfPSY+NsRBa64EXQTwkGKpg4ZBfMaJ9Yu/zmZ8iFqBqTMvjzttCyfP1BnfIZb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3TsgfWle/9wxWRR1xI25ogtJ09zTvhICU+9Yln/Bv9aQYgl6Q
 8SVh0ZPLfkYW+PshK0HEG/vp6Wr8olTZRPEQ2iHmHy6um6C4ZXtyee2h
X-Gm-Gg: ASbGncvYlxaLwWgNkWbyYFsaiYDfNNVNe2olonWMhePx+1QsdltY9smY2iKxpv7YX2/
 qYxEliLNV/a97cA1Kiy1hwu9OzTq+hc1LCzFMyeX6943y0c9GERm1I/9Or1NHxqrgTFGAZqrtL4
 DeMAejb4A8lupvLNkibhWTu3mJdAJCSkGWZJIF9WdbBUo8YG/SlFIviP+sO/AlWqVwx8YSUzGTj
 wsosrZK08Mhl17zGHtCUjYIKRwAEae/KGnndVlzMA8wqfk5qH9O8UAllHfbN6cNwfclq0Z3pPaZ
 q7EErJmEnESSuLSmycKuavkezvd8Gxh/+Yc6wO4NQNEEtaFk8rSMr4Ff2j1AZrFyjHyuHDRD/Y5
 mzhu7r62W2nAndQ==
X-Google-Smtp-Source: AGHT+IHoW7cmlDSj4FeLC0Y6L5fKUHnHWGAThm5Gw2ojTL8jZq6/7sTeg99ABpe7CZ+VwcMWcDndRA==
X-Received: by 2002:a17:907:3d43:b0:ae3:bd96:78cd with SMTP id
 a640c23a62f3a-afddc95d9cemr232522666b.7.1755605814133; 
 Tue, 19 Aug 2025 05:16:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 05:16:53 -0700 (PDT)
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
Subject: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize MIPI
 calibration device presence
Date: Tue, 19 Aug 2025 15:16:19 +0300
Message-ID: <20250819121631.84280-8-clamor95@gmail.com>
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

Dedicated MIPI calibration block appears only in Tegra114, before Tegra114
all MIPI calibration pads were part of VI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
 drivers/staging/media/tegra-video/csi.h      |  1 +
 drivers/staging/media/tegra-video/tegra210.c |  1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 74c92db1032f..2f9907a20db1 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
-	chan->mipi = tegra_mipi_request(csi->dev, node);
-	if (IS_ERR(chan->mipi)) {
-		ret = PTR_ERR(chan->mipi);
-		chan->mipi = NULL;
-		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	if (csi->soc->has_mipi_calibration) {
+		chan->mipi = tegra_mipi_request(csi->dev, node);
+		if (IS_ERR(chan->mipi)) {
+			ret = PTR_ERR(chan->mipi);
+			chan->mipi = NULL;
+			dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+		}
 	}
 
 	return ret;
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3ed2dbc73ce9..400b913bb1cb 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -128,6 +128,7 @@ struct tegra_csi_soc {
 	unsigned int num_clks;
 	const struct tpg_framerate *tpg_frmrate_table;
 	unsigned int tpg_frmrate_table_size;
+	bool has_mipi_calibration;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..305472e94af4 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc = {
 	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
 	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
 	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+	.has_mipi_calibration = true,
 };
-- 
2.48.1

