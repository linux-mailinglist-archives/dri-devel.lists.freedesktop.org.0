Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D45592DC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46034112474;
	Fri, 24 Jun 2022 06:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B7810E281
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:10 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqY015665;
 Thu, 23 Jun 2022 07:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Z4rUFJQC8NApp1mf+grKH2chieKDYOmZYhpQ8q1UBdg=;
 b=aLSraIrWITGiBOcFA6hNe2+W5IL9LQUyRqPKGyzwSuR63Xd5iFYeTEzkV4XR0dJY1pLn
 mUko42c8R5izsTr9RKVa7cxfgXcH4OHd3zk8DYeMGRrpRLaWtgY4Jw/PZ7UNjXuqTmkz
 a82mE/Ij2R5DblmTe5cYFVvbKHmFr8i1qsvFezx0xgdP/SRywqmxPwPNQ+AuL6HqQA2o
 h9N5uSOWsSAsiF/tjFkVbmmC/LFB/s/rwzO2Y9SLvP78gp3ljg50owJh/bhq5/Xf8XXl
 dsIiU6sN18cB2tsvtGmbQ6IFUneQLAptYVXOoabSoVwPYD2i1/6IS6P9e3D3DDkVy4MN og== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:52:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E7B111D3;
 Thu, 23 Jun 2022 12:52:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 09/96] ASoC: bcm: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:23 +0100
Message-ID: <20220623125250.2355471-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oTIhZNeE1i-V1Cle97d6U4QPXI3ihz54
X-Proofpoint-ORIG-GUID: oTIhZNeE1i-V1Cle97d6U4QPXI3ihz54
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
 sound/soc/bcm/bcm2835-i2s.c          | 3 ++-
 sound/soc/bcm/bcm63xx-i2s-whistler.c | 1 +
 sound/soc/bcm/cygnus-ssp.c           | 7 ++++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e39c8d9f40995..f4d84774dac72 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -821,7 +821,8 @@ static const struct regmap_config bcm2835_regmap_config = {
 };
 
 static const struct snd_soc_component_driver bcm2835_i2s_component = {
-	.name		= "bcm2835-i2s-comp",
+	.name			= "bcm2835-i2s-comp",
+	.legacy_dai_naming	= 1,
 };
 
 static int bcm2835_i2s_probe(struct platform_device *pdev)
diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index 527caf430715b..2da1384ffe911 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -218,6 +218,7 @@ static struct snd_soc_dai_driver bcm63xx_i2s_dai = {
 
 static const struct snd_soc_component_driver bcm63xx_i2s_component = {
 	.name = "bcm63xx",
+	.legacy_dai_naming = 1,
 };
 
 static int bcm63xx_i2s_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 4bfa2d715ff4d..8b7a215730707 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1201,9 +1201,10 @@ static const struct snd_soc_dai_driver cygnus_spdif_dai_info = {
 static struct snd_soc_dai_driver cygnus_ssp_dai[CYGNUS_MAX_PORTS];
 
 static const struct snd_soc_component_driver cygnus_ssp_component = {
-	.name		= "cygnus-audio",
-	.suspend	= cygnus_ssp_suspend,
-	.resume		= cygnus_ssp_resume,
+	.name			= "cygnus-audio",
+	.suspend		= cygnus_ssp_suspend,
+	.resume			= cygnus_ssp_resume,
+	.legacy_dai_naming	= 1,
 };
 
 /*
-- 
2.30.2

