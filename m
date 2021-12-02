Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948564667F1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC006FB21;
	Thu,  2 Dec 2021 16:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7266FB11
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:22 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n12so72862353lfe.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=oR1svtpFFFrX6rnK1/i6hTs3JfvrWzZLGz+BNZ7MGG1iAqeVqZHD5xG5kTrA3u/jSl
 s15Q6dojw39Auj8CN0XO2FI5wmxyYl3p3EKf7mDJAku4r7BNCwqds3yBkDHyAXaGCQxy
 GduQFHq10+2oaKKnx2+2SBJO+ke+fYSB+k1qu7/5ltFxZ0wOj5tcFqTA3sw13+Y24oeg
 94WOSY8quWXzpexYWKXqSJDuZA9AEGEtLlVtS0kFGLiDqnqWh5e497qz21iuFqaj8wAj
 hs+P2RIRIOA5/frljQdARGykDlBwPfTEnDuzJmYOkREs9EkQbmzzXMrUMLl1BArGClaz
 xh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvCc+bauYKKq4pTyZaKz2pCnGZty8ijk6MykhM6LJk=;
 b=c2ZYzhyck7wNfYO1MK8omav0NQA1stJAviRlA/eEmYU+MVbmaYpXP6QpbqrEe2EpCo
 VqQ5IN4/Edx2Ijy0wy9A3XSaCQumt4bGVLyPlYCy+QzaSbRV+IrDEtWugdUHl717UAlI
 jNIDzYJhCh4dDQjSNIOAT7grF/qGUkKJFAE1kdhX7lVtIwpNbtq2lNxTjmdKjDIt+5lC
 ObXvoZ2so9qdXYU/zoAJnqc6Ix01KcEDJ0gsyCG5+fArzB9+N5eRzhcv5pi4nLlP9x7M
 Q959DBRbllmoO4/RqZfh1cF9q9l3c2y2+NDqTJiLT63VhZvAdl+BvTPyd7Zn4DYyWdFO
 Df7Q==
X-Gm-Message-State: AOAM532Ee4inmOlcbeer3+my3x69vHRHlNSQz0cCYX4s4ibrKY3HiJ+C
 rtFtVdAaWpuZ6jWXRvrcibddcvjoRLU=
X-Google-Smtp-Source: ABdhPJzzfGS2ufUUhP2/9TRcFenSN5tQ2vXd3c+kggMycyFqzrFJs422Hi0yfHfkBSOhAXlwwSc3Kg==
X-Received: by 2002:a05:6512:40c:: with SMTP id
 u12mr12933189lfk.473.1638462320726; 
 Thu, 02 Dec 2021 08:25:20 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:20 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 05/20] ASoC: tegra20: spdif: Set FIFO trigger level
Date: Thu,  2 Dec 2021 19:23:26 +0300
Message-Id: <20211202162341.1791-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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

