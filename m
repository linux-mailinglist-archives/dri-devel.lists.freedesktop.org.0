Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420D637E84
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 18:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5255510E1DD;
	Thu, 24 Nov 2022 17:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B02D10E6B5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 08:54:55 +0000 (UTC)
X-UUID: 5a1697d7b01a49778e007fc4272136c7-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vz32to7zdlLJ3qNpyb8VnolqTMd0LD/XvVaG+ohQNDo=; 
 b=sup8TiFduXrY0r4zf8XjEecKkTbuO+vMjjII35GMGEZmZ/GPJm1+mboYnNuLrWMhAY+WLUM8swuBkTGoB/KcGvj/PTZujBkLE3crIcchlw5vU51QTsiS/RBzda2osf7NoT1CFG2ZFcgQ/ExU1Uayg30siMrKuNqmH1C8wkd1Omw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:a4eda33b-4abd-4ed3-9487-fd23bb665f5c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:826420dc-6ad4-42ff-91f3-18e0272db660,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5a1697d7b01a49778e007fc4272136c7-20221124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 449839032; Thu, 24 Nov 2022 16:54:42 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 16:54:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 24 Nov 2022 16:54:39 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
 <angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
Subject: [PATCH 2/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Date: Thu, 24 Nov 2022 16:54:35 +0800
Message-ID: <20221124085436.24900-3-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
References: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 24 Nov 2022 17:47:02 +0000
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
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the speaker and hdmi are connect to the same port of I2S,
when try to switch to speaker playback, we will find that hdmi
is always turned on automatically. The way of switching is
through SOC_DAPM_PIN_SWITCH, however, such events can not be
handled in hdmi-codec driver.

So add event handler for hdmi TX to solve the above issue.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 include/sound/hdmi-codec.h    |  6 ++++++
 sound/soc/codecs/hdmi-codec.c | 37 +++++++++++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 48ad33aba393..dcbc09254144 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -81,6 +81,12 @@ struct hdmi_codec_ops {
 		       struct hdmi_codec_daifmt *fmt,
 		       struct hdmi_codec_params *hparms);
 
+	/*
+	 * PCM trigger callback.
+	 * Mandatory
+	 */
+	int (*trigger)(struct device *dev, int cmd);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 0b1cdb2d6049..cb4479372e09 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -276,7 +276,31 @@ struct hdmi_codec_priv {
 	u8 iec_status[AES_IEC958_STATUS_SIZE];
 };
 
+static int hdmi_tx_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (hcp->hcd.ops->trigger)
+			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_START);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (hcp->hcd.ops->trigger)
+			hcp->hcd.ops->trigger(component->dev->parent, SNDRV_PCM_TRIGGER_STOP);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
+	SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0, hdmi_tx_event,
+			       SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_OUTPUT("TX"),
 	SND_SOC_DAPM_OUTPUT("RX"),
 };
@@ -808,18 +832,23 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	struct hdmi_codec_daifmt *daifmt;
 	struct snd_soc_dapm_route route[] = {
 		{
-			.sink = "TX",
+			.sink = dai->driver->capture.stream_name,
+			.source = "RX",
+		},
+		{
+			.sink = "SDB",
 			.source = dai->driver->playback.stream_name,
 		},
 		{
-			.sink = dai->driver->capture.stream_name,
-			.source = "RX",
+			.sink = "TX",
+			.source = "SDB",
 		},
+
 	};
 	int ret;
 
 	dapm = snd_soc_component_get_dapm(dai->component);
-	ret = snd_soc_dapm_add_routes(dapm, route, 2);
+	ret = snd_soc_dapm_add_routes(dapm, route, ARRAY_SIZE(route));
 	if (ret)
 		return ret;
 
-- 
2.18.0

