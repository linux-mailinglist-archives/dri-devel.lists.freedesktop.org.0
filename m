Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4465592EF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506891124FF;
	Fri, 24 Jun 2022 06:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02B810EFFF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:23 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqW015665;
 Thu, 23 Jun 2022 07:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7CFQF1uFAN//bgNV90FI/dawvD8nMJvY6YyL1sfuCCA=;
 b=hTvCkTctoB8k3nSHbx0yrVaXNZz4KF5MAVBjrCciLTAKtreM5UQdVEe+g+FyH4r0kLha
 gkT4oqY+7pAIXRyPWd+SYLAyv4DCU9Q5GdvB28Ac0TTnBBqp+GnG4fNjuYOQShTgIoJX
 OPFp7/rClMaqR9RMi9EodduqlGlC6hwD5bibL1is9fc5h0IkQjq0UBIx4mc1SbuUPILX
 exEgqzhf26F0oCWl0uejGJSXi63RIi+MsFK2UJz/fZw7jMSFTWviiw+ZV4JrSVmAgede
 INLRWd2tA/L7mP18Qb23SECPgZSlhn3GMTWfY+fV9DFOjk+6VC4A3K/kINxZcHiKIQ0c vg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5B4A0475;
 Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 07/96] ASoC: ep93xx: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:21 +0100
Message-ID: <20220623125250.2355471-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nKEG7KdTd89wZa_3SXZboRX6UT22s3cd
X-Proofpoint-ORIG-GUID: nKEG7KdTd89wZa_3SXZboRX6UT22s3cd
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 24 Jun 2022 06:01:35 +0000
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
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 frattaroli.nicolas@gmail.com, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, shawnguo@kernel.org, daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/cirrus/ep93xx-ac97.c | 3 ++-
 sound/soc/cirrus/ep93xx-i2s.c  | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 16f9bb283b5cb..37593abe60532 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -355,7 +355,8 @@ static struct snd_soc_dai_driver ep93xx_ac97_dai = {
 };
 
 static const struct snd_soc_component_driver ep93xx_ac97_component = {
-	.name		= "ep93xx-ac97",
+	.name			= "ep93xx-ac97",
+	.legacy_dai_naming	= 1,
 };
 
 static int ep93xx_ac97_probe(struct platform_device *pdev)
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 47959794353a7..982151330c896 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -422,9 +422,10 @@ static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 };
 
 static const struct snd_soc_component_driver ep93xx_i2s_component = {
-	.name		= "ep93xx-i2s",
-	.suspend	= ep93xx_i2s_suspend,
-	.resume		= ep93xx_i2s_resume,
+	.name			= "ep93xx-i2s",
+	.suspend		= ep93xx_i2s_suspend,
+	.resume			= ep93xx_i2s_resume,
+	.legacy_dai_naming	= 1,
 };
 
 static int ep93xx_i2s_probe(struct platform_device *pdev)
-- 
2.30.2

