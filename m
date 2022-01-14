Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354748F0D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D212E10E1DE;
	Fri, 14 Jan 2022 20:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B221F10E1CB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:17:17 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 78so3735712pfu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=10U/YKtex+AND9dtDxjk3FYBvBwLFUl9f2fbhlUXUs0=;
 b=XQy4pyO/wUwsYqGsKtflTgY0GMz4pfjd2qpY31JHWTpxrdp5kycdY6uXSFa3MXVWe6
 wq/hlaXeACBG7Euq/bmzfc3SM6AC4Pu4laUwxAAWlVJsx2bVy0Izg+KtkO5gPiaBeCOw
 LsILH7rVPeqwj+OUGJjnT/KYlOKhVhKT8tdiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10U/YKtex+AND9dtDxjk3FYBvBwLFUl9f2fbhlUXUs0=;
 b=GFDD73gupyPGc8j20olLSIaMe1V9/kV7/e/kf+RdMmXQkGKOiO52D+DMp5hrgVGbgo
 Sesppah/PyWB2RKGqfjl1Up5Zpm5NXOWZrxhoM/zu6sYmsTmhx6M/9yO/vg8Sttu66yU
 QA7EGgUmQbh8XtEu4oVXyCAlCB1eY+lgbp/a6kdv2wRNRb0GkVQbUGPdNg3UiW5R3GB3
 IAx/2JcDcGXZ3eAvtFDpVOArFvxMssa6/iLRg6rsI9uiCE5pxSo35L07+IRHKtqwTvVr
 zUTil0zBACxuGk/O/1U4Q2th/Qj6+sVI9PsSiS1kK22vyN2MAtpwi6VOh9uDH0NoipqR
 sBCA==
X-Gm-Message-State: AOAM533JYz0A+o+O7PFwqTCAdD25R+2sI9NVWfKicvtrTYziRXmmJX6M
 65AoN70vW62wvfnqF2a08C9uxA==
X-Google-Smtp-Source: ABdhPJxqbQOjbira1atGPpNHzh9Q82DXtSjtZWs+75WZcndu3r13+lzxdf+ODqr/TYUZIBqpyhshZg==
X-Received: by 2002:a63:6b81:: with SMTP id g123mr9615156pgc.140.1642191437321; 
 Fri, 14 Jan 2022 12:17:17 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id g15sm2354365pfm.142.2022.01.14.12.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:16 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
Date: Fri, 14 Jan 2022 12:16:52 -0800
Message-Id: <20220114121515.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114201652.3875838-1-briannorris@chromium.org>
References: <20220114201652.3875838-1-briannorris@chromium.org>
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
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the cdn-dp driver supports plug-change callbacks, let's wire it
up.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index e2d52d8d0ff9..eeef3ed70037 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static struct snd_soc_jack cdn_dp_card_jack;
+
+static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	/* Enable jack detection. */
+	ret = snd_soc_card_jack_new(card, "DP Jack", SND_JACK_LINEOUT,
+				    &cdn_dp_card_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't create DP Jack %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(component, &cdn_dp_card_jack, NULL);
+}
+
 static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
@@ -315,6 +334,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
 	[DAILINK_CDNDP] = {
 		.name = "DP",
 		.stream_name = "DP PCM",
+		.init = rockchip_sound_cdndp_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(cdndp),
-- 
2.34.1.703.g22d0c6ccf7-goog

