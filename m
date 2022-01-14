Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150248F2BE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jan 2022 00:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1635410E303;
	Fri, 14 Jan 2022 23:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF6110E2FF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 23:02:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id w204so4059860pfc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 15:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2v+tf3/coBADjHlh/X456ouYdTDi9mxyKcdvb4sAww=;
 b=VoKx/O+RdQ97dNYCMkBu/pvrz+/Fne9QTD5/ufOzQc2tIbl2VwuKirYICxRUmOaxU7
 bzMP9wvZcj0rii2XVRaGz2CB77+ByOkbDWFdmqSt03chP8478o1isqsZ72dK5ERh1qCg
 ZD1l5mA8b+oYH1T/dEcNRmhZAhXZfQvq12+jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2v+tf3/coBADjHlh/X456ouYdTDi9mxyKcdvb4sAww=;
 b=zzu3nEFHQvzBRJf3rbPBsoaX1hXuASgB1mDYNSYgo8CFqoHZV4PeSfNLbcOQOqnuM7
 GZrdrFpQjRg6B08H/FOv8cQapR+WADfNGc/Yl4+Pe7D2AHBo5j6WYdEFQqtrAf58JcAd
 VBGiyC2GPfhmgh1DuFfkxXdP+4tg9bFLQMwkQwRTch6EZn1fSrMr9FNxMnW3AEoO4KPQ
 M/RyRdSlaD/kzZ/QGNHAP6M6lvTxp11b5YGYqyw8RGI0yepwRlA0Gk2okr4/KkSxTUA+
 6+PmrjLHzQkAD8hdFKdXnXa1el5dseIPeVT3LYpg8p4B0S4g+jA9qpH++9HbOD8yHKRE
 XQ7Q==
X-Gm-Message-State: AOAM5323jMyTu1inoLQsATgtf89i8agsWZj28JOWe1NkhzrhrsM911HS
 WRa4glsYo4VVxWEKsNNYyEgayqCuT9SXjw==
X-Google-Smtp-Source: ABdhPJyJxad9FH/It6rpaHOKDPCSlkdbKW/X7HtmB2tbRUwLIpcP+QTk8BQyjl2RIOc9OttHVlG6qw==
X-Received: by 2002:a05:6a00:1413:b0:4bf:a0d7:1f55 with SMTP id
 l19-20020a056a00141300b004bfa0d71f55mr10925475pfu.13.1642201353019; 
 Fri, 14 Jan 2022 15:02:33 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id l27sm5307598pgb.0.2022.01.14.15.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:32 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
Date: Fri, 14 Jan 2022 15:02:09 -0800
Message-Id: <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
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

(no changes since v1)

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

