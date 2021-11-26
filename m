Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F045F1A3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D7B6F906;
	Fri, 26 Nov 2021 16:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338B56F901
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:45 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so25487142lfb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=BvKSZeYoEu1pJJt+n6o+vj50x1ldkP551fdVZxAJJQLdVUFGwPBzAIrF5H+7esXwHx
 n8own3qM05XoxI0sjPD064mGbDJYgQsXfUbZ5MIO05z8iIYjmtRdkKT5j0qD5Z2az0Jk
 UgsVHrgG2+MvETMaNKhRvVnkXunohyLJVeytrxOcNVoFj9pd8wQ3SQv8v/ibUtmgacPy
 ks0GJc1FIuDh3ZKQoL4cs4vQxpaDcGcq87T6G6fqBvQzUszhXwvpYZXNRvM4dS7oRSp1
 a4rK+JOdqWuQE1Dhk/XVLpE7/zREWJ2zqRHV9yeoavSk6IclxwhKhMj46sTIj3eb5Cbc
 PU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=2i17a1k9586/Z61pfF+01v/iMCCiGBhMIEd1pBZ7U9l9smNxBzqzCP9BQERY81kTIu
 uUbeTNl7SSln6jUydOS239j4ev6WPXHZWkzCLABBHTt33723eiETEAqjPjPuAf1m7cKJ
 wfyffcAXLvp/lR8mt2+ZoVh7hvHNwQvZIqmx+YA2BwayXIPhzM2Mq+WSjQgHdBpWzUjU
 24UXbPVD0XH74/2KywOdqYRjEPbomNAIsDC6A030c/I3vw1jPF7I438lq7FeKJ6pSedt
 U1YDWEVMrzprxNvK5he4U22IP6lsahmsCeNRZINOkGDu+c851kJ8ixKH/SqC9hkEhcb7
 uT0w==
X-Gm-Message-State: AOAM530eowNdYVyTFBEMnK2xDHsiKGpapJn8hf9x3Mi75y1qPkqiI6nB
 8/aFgIgXhCoXWxffOJHGPS4=
X-Google-Smtp-Source: ABdhPJw+O1sqA1AEApn4w0e8LsIJFSmfr+1YbfviViPwQQyCT2nco+0hcMYFnmfPveS50cbky2WMkg==
X-Received: by 2002:a19:4312:: with SMTP id q18mr30933828lfa.299.1637943583577; 
 Fri, 26 Nov 2021 08:19:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 05/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Fri, 26 Nov 2021 19:17:52 +0300
Message-Id: <20211126161807.15776-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FIFO trigger level must be not less than the size of DMA burst, otherwise
audio will be played x4 faster that it should be because part of the DMA
data will be dropped on FIFO input buffer overflow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7751575cd6d6..6f0570cde964 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -69,6 +69,14 @@ static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_CTRL, mask, val);
 
+	/*
+	 * FIFO trigger level must be bigger than DMA burst or equal to it,
+	 * otherwise data is discarded on overflow.
+	 */
+	regmap_update_bits(spdif->regmap, TEGRA20_SPDIF_DATA_FIFO_CSR,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_MASK,
+			   TEGRA20_SPDIF_DATA_FIFO_CSR_TX_ATN_LVL_TU4_WORD_FULL);
+
 	switch (params_rate(params)) {
 	case 32000:
 		spdifclock = 4096000;
-- 
2.33.1

