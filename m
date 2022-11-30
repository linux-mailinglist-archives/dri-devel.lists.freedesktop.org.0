Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF263DFD9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8AC10E13B;
	Wed, 30 Nov 2022 18:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCFE10E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:50:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FDF1B81C9F;
 Wed, 30 Nov 2022 18:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3515C4347C;
 Wed, 30 Nov 2022 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669834253;
 bh=8Amv3BiRIQsJsuMKSJUB87S4sbytnWriFe8iKtcfyQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLaZjh5eCUYh0b0ZToCLumJmUMQBkyHRF0gycvcMAdKAyvuMWbRcPUukscJZjS/xT
 kGjZN3L7/NvnBrNEKuM1RHGOxTferqXvrYvlmB2X837zM/kj5DcekUMC0RwNx2gcvT
 reKvNBu1WowJ11gAv0KVvWhqYwICgdjjqidFAvp0YnmYThT4v+7J5kj5xXEmAgo9R6
 1rKVMgcUrxZRISLhANJtm10z6RHVXiywcTpdXdv6b8FhMknq/AQexO8Pgbg+zCqJ44
 17tuD6QnjBKaUxSEClv62wX/m1sOk5aDoCnvFrZg1CYBp+/YFfmmfIB9jid9PaNU1S
 0+km9nbWlUGxA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH v1 1/2] ASoC: hdmi-codec: Allow playback and capture to be
 disabled
Date: Wed, 30 Nov 2022 18:46:43 +0000
Message-Id: <20221130184644.464820-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130184644.464820-1-broonie@kernel.org>
References: <20221130184644.464820-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=broonie@kernel.org;
 h=from:subject; bh=8Amv3BiRIQsJsuMKSJUB87S4sbytnWriFe8iKtcfyQY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjh6USRCj27LG4VK4AFBuBIpYwKB1RilyDcu0MDylK
 j0uFVtKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4elEgAKCRAk1otyXVSH0C0ZB/
 4+u+qN1SxBo/UNM+zwkkwx34xgWF5H1siTs0CKcCDjQJvKdKqhMh+neU8MD+pPe//cbEJEBvnw1m6L
 OtoJHvSDm37VcAa1UWebxDcAV9Go1OK/ruLtFtDRdDY34AT1hoDxZp6NGBFz9PBF9mw1OOn6hAC7uS
 Xb/5aAhvtpeunV64mHi5omxbc+rqFnSREG+5S3lCGzhdDBmkOji7+IB+JKiegbKZhbuP0CReVp2AIr
 6PgE4UqRFHapZ3rRA0WBtcvuvvOJIL9LjCt1YKva+JCXfD/9LY/2mKj3xHDE6lR3Qp1rpRZ5kMuj7Z
 Ju48p5PUYtXqE1TsV9SuGnDkyY5gAj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the hdmi-codec driver always registers both playback and capture
capabilities but for most systems there's no actual capture capability,
usually HDMI is transmit only. Provide platform data which allows the users
to indicate what is supported so that we don't end up advertising things
to userspace that we can't actually support.

In order to avoid breaking existing users the flags in platform data are
a bit awkward and specify what should be disabled rather than doing the
perhaps more expected thing and defaulting to not supporting capture.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/hdmi-codec.h    |  4 ++++
 sound/soc/codecs/hdmi-codec.c | 30 +++++++++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 48ad33aba393..9b162ac1e08e 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -124,7 +124,11 @@ struct hdmi_codec_ops {
 struct hdmi_codec_pdata {
 	const struct hdmi_codec_ops *ops;
 	uint i2s:1;
+	uint no_i2s_playback:1;
+	uint no_i2s_capture:1;
 	uint spdif:1;
+	uint no_spdif_playback:1;
+	uint no_spdif_capture:1;
 	int max_i2s_channels;
 	void *data;
 };
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 0b1cdb2d6049..74cbbe16f9ae 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -816,12 +816,19 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 			.source = "RX",
 		},
 	};
-	int ret;
+	int ret, i;
 
 	dapm = snd_soc_component_get_dapm(dai->component);
-	ret = snd_soc_dapm_add_routes(dapm, route, 2);
-	if (ret)
-		return ret;
+
+	/* One of the directions might be omitted for unidirectional DAIs */
+	for (i = 0; i < ARRAY_SIZE(route); i++) {
+		if (!route[i].source || !route[i].sink)
+			continue;
+
+		ret = snd_soc_dapm_add_routes(dapm, &route[i], 1);
+		if (ret)
+			return ret;
+	}
 
 	daifmt = devm_kzalloc(dai->dev, sizeof(*daifmt), GFP_KERNEL);
 	if (!daifmt)
@@ -1009,11 +1016,24 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	if (hcd->i2s) {
 		daidrv[i] = hdmi_i2s_dai;
 		daidrv[i].playback.channels_max = hcd->max_i2s_channels;
+		if (hcd->no_i2s_playback)
+			memset(&daidrv[i].playback, 0,
+			       sizeof(daidrv[i].playback));
+		if (hcd->no_i2s_capture)
+			memset(&daidrv[i].capture, 0,
+			       sizeof(daidrv[i].capture));
 		i++;
 	}
 
-	if (hcd->spdif)
+	if (hcd->spdif) {
 		daidrv[i] = hdmi_spdif_dai;
+		if (hcd->no_spdif_playback)
+			memset(&daidrv[i].playback, 0,
+			       sizeof(daidrv[i].playback));
+		if (hcd->no_spdif_capture)
+			memset(&daidrv[i].capture, 0,
+			       sizeof(daidrv[i].capture));
+	}
 
 	dev_set_drvdata(dev, hcp);
 
-- 
2.30.2

