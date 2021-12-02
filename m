Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E584667EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB356FB16;
	Thu,  2 Dec 2021 16:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B3E6FB16
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:23 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id j18so659325ljc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=pLQ4GJmoBOJuH7wLOkufv40oGn+6v3Gytz8bM59miPiudq6sFxymrpgus4KfVo/Rgx
 2um5/3RpKDCATnI9f9SoujwYqxlxpSSh1bYp7EU7phmb3XldHo/1H5lKDnlSaWqtGNQn
 WuiFjTv79YtRFAcAtKQtgmHpoxO+GA5jrjgtPdQtSH3kar4oAzrCjWE0BjIZ1aO3iKyu
 jevLCOpllTOA+bHXXOcUfrwtcziyuvKzGU1hRi2XoVpddsMTIJe7JlVC+3lU5lA0g98G
 4bTrwrRxbAsfMZet31PKmGihDNbFS02bDeAlNTDN6sn4XAqCwlNGoorksOYpqZBjS2tc
 u01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=HpxhwiUItZqQsU9luhL3RtSNQAKtGkTTFTYpdYG869Inu0M/rk1ED06b0UfVILGix2
 Ho99GS4u5zIu1RI2lc7vOMTPVsDvvlTVMYqZ4X4PksnLYJj1mTbrrqZamEQv/8qbzSmg
 E/oA0EH9I4oJwNnp7u0oL4bcDMTSV4dc1MERFIlQSKJUkTjOkDcBWd3Kul6jo4J6bOXs
 +tWFNrz5ecYrlL+DWMK+aYjtPgRqEruyCtUvbaRFzg1asj8J83vbLXii9GhTC0JedLdz
 7ZJ3V2ShhxWJc9KFAFuyOw8kJGC7vXn2CbljMI0eLgTaTkuN4MtiO+9v69x7lOijduBy
 P2hw==
X-Gm-Message-State: AOAM531OB+tm+25lRVAFU10EWn2QyoEPYL0qPMlDmxHpUi60zGJGuZzH
 Z6pUJKBEqwfXrtirEwM8l7c=
X-Google-Smtp-Source: ABdhPJxgWCKXWtE9NQnfcQEL8rdvlyRa84HGrFT6R25Bd2ruhzIx24D62gwZG3WFq54S3UptLypkqQ==
X-Received: by 2002:a2e:a378:: with SMTP id i24mr13292701ljn.290.1638462321626; 
 Thu, 02 Dec 2021 08:25:21 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:21 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 06/20] ASoC: tegra20-spdif: stop setting slave_id
Date: Thu,  2 Dec 2021 19:23:27 +0300
Message-Id: <20211202162341.1791-7-digetx@gmail.com>
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

