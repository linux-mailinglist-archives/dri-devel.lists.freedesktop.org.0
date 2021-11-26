Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C645F1B1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09996F96A;
	Fri, 26 Nov 2021 16:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E126F90F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t26so25465452lfk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=BJbfUBs27vN/BXdrfZVLl+mcJlwxpt03ZG4BcmkKKYWyfYJy4vev3auqKaPv6mPLXq
 sCQksErcwYoAayxWRm2Fu8khU3NBW4ciWpcYxtaOAU1bBo2TT/sdHvtcOmqRlEpEM0Qy
 cXZnwb29eLcWAJc4cKYTreTbQ0TBZ7SSjP8Bw1fIYr2bOg86wtvJ++7OrAFCPfVNO1Lc
 GNOscG8hx+Ctx4DqIOM9dMx18cRwBS2kTsf0qAFQDs7ksTgB73o+LstacLuJI/RHCsLr
 m6TYv2sSM8TQwO1xrrIfgIlP0d1HbGQfH3+2DKxyAorsM2rpA6yYn2fovZ+lr3Um2+zC
 WznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=2HLOBiwPXHRJNTEFpAGcRlhjDuPGfbkPiK6ta72qf/N8X8QL4FQfboBpxel6iPkwJr
 /bq9q+TOuiJpAp8TNaDExKK1d0UhVgTXZ4zE+r98cBmzXjet12TjoPL3oJE3Ab5S7bo4
 b74ZQRJAywfdjLixKT9ZAoGhiLLkxQzN92weLjn/XTlxU9hRkx6mTYTWUnln682bIaSw
 /xlP2jaLL9fnVVvHhvyDfTR49Q0UHIK3BY/QvXHhFiXLeKA7UXrxwmaErcjtFUW3hJAF
 v5dcD2CZn6IL1nnbSv+y5Yf/gmJ50IJqDuaxg5kKSdtMhNhdre8ynkW1wQVaWvPdTZyi
 xl1Q==
X-Gm-Message-State: AOAM531vARaHny9ZULeGmRbsHkQjmmSaLb/aksJh+QFaXOTGaAHrsKgb
 aGutIrNWxXcJSCfbDF5EBxM=
X-Google-Smtp-Source: ABdhPJxyXEvKVmf7LUHm7Bq10BUL0d0eGbpP6e98npXd/QQMkZcwI8MdZNl5vLC50uFeRYPW04jNlQ==
X-Received: by 2002:a05:6512:3da2:: with SMTP id
 k34mr30230293lfv.605.1637943584717; 
 Fri, 26 Nov 2021 08:19:44 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 06/20] ASoC: tegra20-spdif: stop setting slave_id
Date: Fri, 26 Nov 2021 19:17:53 +0300
Message-Id: <20211126161807.15776-7-digetx@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The DMA resource is never set up anywhere, and passing this as slave_id
has not been the proper procedure in a long time.

As a preparation for removing all slave_id references from the ALSA code,
remove this one.

According to Dmitry Osipenko, this driver has never been used and
the mechanism for configuring DMA would not work as it is implemented,
so this part will get rewritten when the driver gets put into use
again in the future.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 6f0570cde964..e45e371edc42 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -298,7 +298,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.33.1

