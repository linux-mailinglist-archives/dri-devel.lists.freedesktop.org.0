Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E887145F1A8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27E06F910;
	Fri, 26 Nov 2021 16:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B8C6F910
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id k23so19799997lje.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=F1IsN1lNqFntYo6bCbHB9CPRZvvY/nTXdJo+Us3PXxM0NkiSnU7nUaMk/j/ma8/fAX
 1eWdx4wrvVz0g9/srkBaAayU0zUTkrtWurvknhUJJwI6+JLMw5hfEEaI7yBcyE+zTU60
 3VvyVvlOfs3coaF5eRyiLMvstMebJYewwg03H5v1b1VaezeZX1hIsjLvGa36vN92WmmT
 ilMDoNkp7il0KAGRyZEGqJcEUunJhDUVlXyCu3mOmwn9g8ZVhnOOFk0JL+fKc0B4ExAZ
 21A54gVXgh3tsqJcaqHD+taoAkT4yqz3/MTCXhgDmOwAeOglSsVhQWTw1vJZ8lgPJVJg
 D2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQZdihin90lA7efVTDzu3CsDg/xeb8H7EeSD4A6ITqg=;
 b=TCfa3NAbHIR8PKFoQM6jkfYMEFXwb0QhdQ1ZiYQW/cAJsf4Nvmar3yFWGMbhlGTVqo
 ILePATYX+V4mO/db9Bl2RlsewnQncqmCXxkl6nBil5ZF1eQruhtIsQVP0gnXhwnbm79m
 Yz7LgulCTJhguxYEziy759rsCgq2rbC2+RQQmYRm3yFFZBapNC1KuQbGSgg1Wxr3r5nq
 r3SVRY/fblHJfvAHQ1rSa9s+t0UIb3OJyoLR5cbAIChZeSl2g/zR4XQ8URbmyjnAtXcV
 OmJDGD5pvGMX0dW/03sRJfAy2v7pEFN7IfGSC0RAxsIceBZP0QgBi4XuHG/ZA1/coSoQ
 lbQQ==
X-Gm-Message-State: AOAM530ZG45xji2qV0Nib9ujjrBVa0ERbvT8tomrbc8g60eEv12qu/nb
 h3979zoaGxD38CBmuulqUpg=
X-Google-Smtp-Source: ABdhPJyeY+DJa2sflfc3Mxo+CLSNCZ8db8o1DJ/F5GgZWoSelxfLa5+6d4xFyI0nij43neTNk1WsoA==
X-Received: by 2002:a2e:a279:: with SMTP id k25mr32248372ljm.37.1637943590529; 
 Fri, 26 Nov 2021 08:19:50 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 11/20] ASoC: tegra20: spdif: Support system suspend
Date: Fri, 26 Nov 2021 19:17:58 +0300
Message-Id: <20211126161807.15776-12-digetx@gmail.com>
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

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 8b9bac30d5cd..89f7fc5c8aad 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -345,6 +345,8 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 static const struct dev_pm_ops tegra20_spdif_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra20_spdif_runtime_suspend,
 			   tegra20_spdif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id tegra20_spdif_of_match[] = {
-- 
2.33.1

