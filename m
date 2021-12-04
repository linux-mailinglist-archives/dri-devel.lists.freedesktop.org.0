Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A6469388
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45C873FA5;
	Mon,  6 Dec 2021 10:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DE56E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:36 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id i63so11977287lji.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=MwnAiF1hA8qPui8uBQGdO1QBhwpf9UaaCTkNu4NfLgfurHRoHvhXVPPodgEa3+LnvN
 tx5Ifc0/OMgQPfebiwxigxcDyBqZPGROwr20EmKTJo0G4yYB9ZVYru0NFjdrX1GA++cv
 BpRq9aWv+4fr7g9ZaayBTiTTifjEnswsXS5iHz5wLj2oBmmz4I3p9UuaoYlbcKgD9NJD
 H6ZmEu0gL1cF0UfTPmLKrMmaVxQOde8W6OAoOnFoiZD4o31osb5XXEwJt1gu8ea+1mYy
 bPMVTHQycS8tCBNMKCcqTRAA3AtU09/2jMOTPdc/wQKDEh9d5RfanRRv5svEcYfx/CnC
 L3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=E6m8sunnAfNfRa0C4mKw2HfrH2MTwU9KuV7OjXnwdIVTRGcMPMa+rM8pwaubsCz40l
 zDF0qSulrLkSOVwRtmugernk+zXgPFgm9MxNrRKwmj6N19P+aC/XuxzUBCiNXpe9TSrP
 r2eyGm08PmVNO5aEk+DaX33iSd1/Cg0BrOTPt98Qbh6ScCP82Ht+fuY2kqoHcQjbmZG1
 HuAw7+WhV3jdbv/4S3NNS1u4cnXO8pD/xqoJ1GTMcvoSU56m8NvSPJE91Y0kSkxuwT9r
 cSn2BjjPR/0DsAWHTVO5uCaJcUsVVo8gDm+PjavJxkaWipjqQ84xVVpJCpVx5roiO+Np
 kH6Q==
X-Gm-Message-State: AOAM532YDDODfcpR9+ExkfwsD9R9EskSpfdHaQXkcPJTVyCNX331OJ82
 605iW4FeVJ5FD1BkbvG0WAM=
X-Google-Smtp-Source: ABdhPJxugszshWasYaab4cAMvs2pl1LYI0Q/HrfsQBMp21wQUS0EVtgxwr/15TP8z7dXNiyzZ03jCg==
X-Received: by 2002:a2e:8997:: with SMTP id c23mr24092207lji.530.1638628655314; 
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 05/22] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Sat,  4 Dec 2021 17:37:08 +0300
Message-Id: <20211204143725.31646-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

