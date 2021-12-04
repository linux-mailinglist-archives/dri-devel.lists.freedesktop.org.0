Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85304693BE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4A7ACB7;
	Mon,  6 Dec 2021 10:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA26E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:37 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 13so11857766ljj.11
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=o1KGgDtQWGDqmjiOgI5S/+RbDDAWjn7RwxNM6FRu5jsCI6H19PFswt6Opnx+0ODTPy
 hPRduERJtyDeRBrnfWfBGmrnXVCtAETHK85vi8EOrBil26r9K1uYi0YEDaG9Yx7axBQg
 XdmehnDB9warwOcBZ5lCnQessgtSijHJA/3I3NnRp0EOuwd1+hAqOkdWnHjNO3yeqXmO
 njnY06XzGevMbhitj2YiGsUwJwnk6d8R7aQYDcc25dvLI8cmunCmpfI1Ad+8sSHjbyLx
 LP5dGS94RECbctBvsfo86RRnIGvpGGX+7TbM91wof82ITDXGsq1vcVVEbxP5/cwGJJ4U
 JBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAin265JOVL+o94pQxCU+sQvf2Xm5+tMWz8fFEKib7U=;
 b=IUZ+ilSUW4hYXloL8iZmPZjvCbsBT/lYYWonqCZ+QJkbdq0euObzVsrMzigNEzqk7o
 vZxfhTxWNvHB8oVXw9KcwRnPPO6w4iCSwqC1cXMwDPn7IlYkNZa4vBO64iKBvF2ZZLDb
 EkqwW19f3HuPG5cbjU7X4+Ksk/QVKo5TfC/Ty7K+eA3j1p1UQ1Eoh+Z4zczqyJzQ1Y0G
 o26wr+LCCNcS4U8yLlgO/rncbTDVI0LsRHKaanuFy/28dwgJY1UmmT1txt95r53Y96F+
 zu2r7jURrA91AaJSdJ3GLqRYnwsJqJ+Lanj4N3MMGkFi+gvJZN75i7Wp28eAjg9KGiYE
 hYUA==
X-Gm-Message-State: AOAM533k9r8sovNBtrNk/0BEGjkuo/bEg0tRvkW+k47jh07UQAYNlBKV
 VAPdlleBwKUUGuD6MPKADlI=
X-Google-Smtp-Source: ABdhPJzCs7dQD/cZfTQiFvEEynpqpF6ANm/y7mYxAAce2J3VdDbfVr77o//xAPFMjDRP96a9qUFy5w==
X-Received: by 2002:a05:651c:1ab:: with SMTP id
 c11mr24347618ljn.378.1638628656252; 
 Sat, 04 Dec 2021 06:37:36 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:35 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 06/22] ASoC: tegra20-spdif: stop setting slave_id
Date: Sat,  4 Dec 2021 17:37:09 +0300
Message-Id: <20211204143725.31646-7-digetx@gmail.com>
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

