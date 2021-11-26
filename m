Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B946145F1AE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB8E6F963;
	Fri, 26 Nov 2021 16:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CA46F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:54 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m27so25436832lfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhBo+jV3YB73Mp9ZeA7lb5QO9nWQOxbQBa92iKZ/6e0=;
 b=HlrAKhbuyvb8pdna51HltVnBFaB0F3geQuZfnQcUYEFWFQizrXE4lh/3lsBU1sOSCr
 Nb2QWYhkX9qQg6mdg/Dfs/045ZDocL+nmFVZYoMpJOVoZY9sjitYsudn5VTvg4Xe7Ywd
 I6tSRfmoyhFoqyaUAVdv06Mpz/Mp3l0z7AiU82BQmmwb7tTLs2p+blg5ONvBr+6w5+gg
 kzmLHpVTQMmUX+HBFmIQv2oecCR+ynZ5bYWI4Q2YIsUmLEWxR2nTaEyrEpavs+TbZbf6
 uUXu3kZZPDngPDpptiRiaj72IJ1l72M88eqfczBjE+k6xkF6TIDB9mwp5dAuYmM2e0E0
 CFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KhBo+jV3YB73Mp9ZeA7lb5QO9nWQOxbQBa92iKZ/6e0=;
 b=pXFq7FlyDw71kHmOkEP0UPPU9gDFbMJOwvVYqlfI3iwMoCch5mMQmPZjmgujmJz2cP
 oUvQkdoKPWI797NbrqmdHia+4qkD1hGCtdU42Oyl/fM8ggha4AWm63kgQbl7GqVLGehM
 ud9YTedm+cAZ8+pA9YV+MYBwwfKHciZ0s8W/WTlbQRoDnRaesmNSSdx10pDKS8/vy2ho
 NBKS3DesFkBScQBk7IG/fUFWJHGhctueUpCfqgqbsKMrw/CWS+YFcweXXFYoFFs7qoIp
 up4iaY8gLSC8XdtYfs2csM2jUKJ6R5qnG6Lf9wYUxwUMCb22C9Ryg7auVX0+MtqEwxv/
 Prww==
X-Gm-Message-State: AOAM5315O/x0qnbZUrRPYKC6exDttbs8GSo1fPhXqz2uSoLf/NB3NWAB
 3lzKq2JDaVda7xyS5tujFyI=
X-Google-Smtp-Source: ABdhPJyqg0aE9dQ4pKabfAO56PZNA8uIGEm2iF7teqFeNDNfWW8LUoshpDDjHrHx7nCiKJFd+d4Kvg==
X-Received: by 2002:a19:c795:: with SMTP id
 x143mr31768962lff.249.1637943592894; 
 Fri, 26 Nov 2021 08:19:52 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 13/20] ASoC: tegra20: i2s: Filter out unsupported rates
Date: Fri, 26 Nov 2021 19:18:00 +0300
Message-Id: <20211126161807.15776-14-digetx@gmail.com>
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

Support new nvidia,fixed-parent-rate device-tree property which instructs
I2S that board wants parent clock rate to stay at a fixed rate. This allows
to play audio over S/PDIF and I2S simultaneously. The root of the problem
is that audio components on Tegra share the same audio PLL, and thus, only
a subset of rates can be supported if we want to play audio simultaneously.
Filter out audio rates that don't match parent clock rate if device-tree
has the nvidia,fixed-parent-rate property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_i2s.c | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 266d2cab9f49..27365a877e47 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -262,10 +262,59 @@ static int tegra20_i2s_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const unsigned int tegra20_i2s_rates[] = {
+	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000
+};
+
+static int tegra20_i2s_filter_rates(struct snd_pcm_hw_params *params,
+				    struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *r = hw_param_interval(params, rule->var);
+	struct snd_soc_dai *dai = rule->private;
+	struct tegra20_i2s *i2s = dev_get_drvdata(dai->dev);
+	struct clk *parent = clk_get_parent(i2s->clk_i2s);
+	long i, parent_rate, valid_rates = 0;
+
+	parent_rate = clk_get_rate(parent);
+	if (parent_rate <= 0) {
+		dev_err(dai->dev, "Can't get parent clock rate: %ld\n",
+			parent_rate);
+		return parent_rate ?: -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tegra20_i2s_rates); i++) {
+		if (parent_rate % (tegra20_i2s_rates[i] * 128) == 0)
+			valid_rates |= BIT(i);
+	}
+
+	/*
+	 * At least one rate must be valid, otherwise the parent clock isn't
+	 * audio PLL. Nothing should be filtered in this case.
+	 */
+	if (!valid_rates)
+		valid_rates = BIT(ARRAY_SIZE(tegra20_i2s_rates)) - 1;
+
+	return snd_interval_list(r, ARRAY_SIZE(tegra20_i2s_rates),
+				 tegra20_i2s_rates, valid_rates);
+}
+
+static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	if (!device_property_read_bool(dai->dev, "nvidia,fixed-parent-rate"))
+		return 0;
+
+	return snd_pcm_hw_rule_add(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE,
+				   tegra20_i2s_filter_rates, dai,
+				   SNDRV_PCM_HW_PARAM_RATE, -1);
+}
+
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
+	.startup	= tegra20_i2s_startup,
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
-- 
2.33.1

