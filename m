Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217C8466802
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592A66FB2F;
	Thu,  2 Dec 2021 16:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140D6FB2F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id k37so72851218lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=I36KU8MZVlIM3GrcPcUk71WextQQmOsKJ8L6PvyMA5NCP5WFFU6uZxN2ZXTVjc0QxY
 BfUMtdl3qwAZ31uIpKXI8Kj3I0AHT2j75uX/LMaZ8D92Pne7S4gUIt2d/yzcyQJBsBzA
 l8/Vdp0b/10Z6SBjsIFNBeylHjzKyJb99EpU5cr6XvuCGzxjU/Zo3gtFEJqL3TUsWezt
 xDeBtIAVLxNQz09hNenjujxy/LC7yybW7UQR2aW4i3UohNhaPPywhbjKuoDgZicqqJ6x
 xHajm9tPwhuQ/t78FZF2KI2dLyjvyqbwNrGr5Ce2yE6abqt7VS3DXBX6uowDzl9ljfnR
 5znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxcYUIueLlQa52jFEvuy/N4e/ZecehjJr4Gk4VLaFrk=;
 b=V4Ac4A/LBdzA9LfBImkqC5xcSRUAFchCdLTBpuT3Rz8DVEqb/oSxlG8/ypP6AloPVy
 i01VbH7CXvrarhZLwysmr6xpHaAwSb36JoRWwJOFyWFsrTiABH3jNeM+3g6VDXzFVTm7
 30+GIq9AfFbAWCM/03XvrP2XnS/Nyt516tG1SK6HRvMFN9wD9aY+bmNaX+RTYeNthOnY
 vtDVqx3qc8dOhzccFwHHx5rThFZk/sN/2BY+gxMIzJVFviOR5+Fa4PfUMYwEnW2SrDvb
 K9MIPaSTmMH1VebRtqZ0SKux+iCKGdXFj0+aljF6EhzlEy9tWCHQmFZgWJLOg+0KXlUg
 +wdw==
X-Gm-Message-State: AOAM533j8WkeyPIQ4hw4UH0mA0zlY10bGZNQNDqUsEvrw7eVh1498X6N
 8woFSXzBPTAlOL7bFB+wWOY=
X-Google-Smtp-Source: ABdhPJy5alaon9JWfGyAgcM+Lp6GPPApvSuwcMDKG9goTRM8TzwT6/nCrJurJ/RP0JtE1gz6hhWriA==
X-Received: by 2002:a05:6512:3251:: with SMTP id
 c17mr12374298lfr.440.1638462328985; 
 Thu, 02 Dec 2021 08:25:28 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:28 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 14/20] drm/tegra: hdmi: Unwind tegra_hdmi_init() errors
Date: Thu,  2 Dec 2021 19:23:35 +0300
Message-Id: <20211202162341.1791-15-digetx@gmail.com>
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

