Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6916C46937D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B0F73FB8;
	Mon,  6 Dec 2021 10:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865466E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r26so13772958lfn.8
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=d4JHR4e9Tfq2drgPiQPOEWI/A9kfWJA+tfced71PQBHCRUEfZsydKbZhpd/5ptbv1j
 w+PGcxYbFFThWeum/lgKvwUVn+2Btl6QdzG9ojRhj3jVeqVzY7numyCvU8YBxFh1aec1
 dI7L2o2Io/20kOjxQDwxBdUbHUPOvYJChvySM6hzMlhawgNxNHI96mFcxjnLxaNezIFj
 K3UvzRePyvLb4V7bUsUKIb2PiptOuQglxAVXybFqiUWZljVUA1F0epLPeS2S13Pdcp6Z
 ooo++s9sqkOF6jKlWazC/SzHdD/295aQ54ax40XBjRNqTjb7uzDTQX/Oi8Wlf80W+P+a
 1rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=K7ur38ObY5J2ReCLwcC/AQ1DRSsVvu56WoVnbNDxARRLjdsEsmZmCkUDvytsyuSEKH
 CJ+0bas1hc/Ih9mQzPThGpdBoPr2hDdi07Q4xk/J0USvlssgT46TJSz4RRwh8efOxpqz
 sSPy0MaoQlvbhZnJBmRWTxejzQC63GSm25guPzEhz2YGrw1YnHuxCkVP9YOUfvr/vLPx
 7MMD73LFPPvrs8LZKoupWKjAnxrB7FoPK77sPUzq0LfwX3VUhaz+wWAc8ob3aF7hVmxi
 /IKS2UScpYArC4Df2HD+OMrgCHzEkGfbls8tOmzj80BW66GKT9p2sg1NAIylSS1LTmmg
 VerA==
X-Gm-Message-State: AOAM533sp+T+Nq3nSN0pUPMb8SEpKTXcQIDo2eWsp0fc0vmAOTAWKD8N
 9O1I1T72uemEGCcv1zCQyjo=
X-Google-Smtp-Source: ABdhPJxlgKfJiD7JvMzK1OyvgCUJ5A1miPAL4icM4r9MPzx1Ky/E3f131wx20rQata12xqR1oKlQ9g==
X-Received: by 2002:a05:6512:234c:: with SMTP id
 p12mr23603437lfu.157.1638628662905; 
 Sat, 04 Dec 2021 06:37:42 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 14/22] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Sat,  4 Dec 2021 17:37:17 +0300
Message-Id: <20211204143725.31646-15-digetx@gmail.com>
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

Add missing error unwinding to tegra_hdmi_init(), for consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 3242baddc5e7..cc42476fd023 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1456,22 +1456,31 @@ static int tegra_hdmi_init(struct host1x_client *client)
 	if (err < 0) {
 		dev_err(client->dev, "failed to enable HDMI regulator: %d\n",
 			err);
-		return err;
+		goto output_exit;
 	}
 
 	err = regulator_enable(hdmi->pll);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable PLL regulator: %d\n", err);
-		return err;
+		goto disable_hdmi;
 	}
 
 	err = regulator_enable(hdmi->vdd);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to enable VDD regulator: %d\n", err);
-		return err;
+		goto disable_pll;
 	}
 
 	return 0;
+
+disable_pll:
+	regulator_disable(hdmi->pll);
+disable_hdmi:
+	regulator_disable(hdmi->hdmi);
+output_exit:
+	tegra_output_exit(&hdmi->output);
+
+	return err;
 }
 
 static int tegra_hdmi_exit(struct host1x_client *client)
-- 
2.33.1

