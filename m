Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB7469392
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63C7A392;
	Mon,  6 Dec 2021 10:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1666E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:41 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b40so13728534lfv.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=COMMbo7ny6O2X7VC2bO3A8YCnuhGGEFEaUha/goMyT5rSXGmnf65P2mapZ5oZzbmG4
 ZEZhwX2qHGjLs/Cn/xlZT5jlT90jNksb6FW/Tz9DNLHNhFMtt/booCU7gU+Jhw+aaNp9
 CJp3S0FM89SUomn8FX5wKwj2yMYh3o/X3wttFD6ip9LWGFaAnmMoh0x6eBtHqHImiRKu
 M8iC+nGIW9lkd4uC4TICm8SNvPpoSBs+C6Q8U4Fxr+xuf7FSoHyB5Yr/xTMEF6ZPN7q3
 RW+5PyoDmQbxH+ezEZdEur+pRt8XQOteoKEeaZAKVaVBt+vlX3nVmax/ugJrEf3G+gtH
 Ot8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4TNl0maOw+qQ0xQdJvO/oCdL3KHkM/Dk/mjk1tn/kI=;
 b=A2RxyBblz/sOCnOtMShTAV9numahO1D5+gMHLyBFwpeaZw74MwoUKFS0FcBxkMVE0D
 FPysfuvzkGbMxJuQYSNwLAOUO60ZKpRaY1ussQdbWfAAu8zSB6uK+rjFuYOQntyudahd
 VnLMt7T8sSb4I7Wbi2sxMPbu9kDbvwPkb49ENeKSWiKzUEk5Is+pWzpzCUmtc+4YUTfk
 2VI63ei6VyPWDh8HHyhCCmb/YmqyEZHxRD4+K2YcHXjVjeXz/VQnMUYezMRyxJWFWcTh
 BsKzq7kE/ddXqkrJWvsb/iVzaR4jnw7Wp2Uw7kFRxX1HNYyqRJL0ffwwOLNphNKBkh7W
 0c/g==
X-Gm-Message-State: AOAM531jpIDCR3SZ5Iul3n9OUjY5myj96crwZGOH+RH+ODf+VHBWRZEI
 t75CWSp0NYxdB+y3Ego1O6JU2p213qc=
X-Google-Smtp-Source: ABdhPJwBGwFZ1VAmA8VX6TtGQ+4nXtKkxDzfgCjkV2ceUAS/H+mhlKQL1kqjfLM7Div+f7+OlDjKAg==
X-Received: by 2002:a05:6512:3d10:: with SMTP id
 d16mr23491738lfv.78.1638628660353; 
 Sat, 04 Dec 2021 06:37:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 11/22] ASoC: tegra20: spdif: Support system suspend
Date: Sat,  4 Dec 2021 17:37:14 +0300
Message-Id: <20211204143725.31646-12-digetx@gmail.com>
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

Support system suspend by enforcing runtime PM suspend/resume.
Now there is no doubt that h/w is indeed stopped during suspend
and that h/w state will be properly restored after resume.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index bc45a0a8afab..a4aa5614aef4 100644
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

