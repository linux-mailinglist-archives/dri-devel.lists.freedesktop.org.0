Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E75592AE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A671121C7;
	Fri, 24 Jun 2022 06:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8104B10E5DC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 12:53:12 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NBNlqd015665;
 Thu, 23 Jun 2022 07:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ZCITtJ1KUhO3m0hQgxKHALQnZSotGGuUuKGm6KuVmmc=;
 b=HZsw3lXE4bHk6wg9RtDkrEwudbBsroBhvZQ6syOT1mSDXvLCZsJm2uICraft12P0JInS
 apyN6NyAnd32ms99eg2IM+mgzawGT0a8Vp26CJLCmqJbk1E+tRJpcRG5p9Pf59NrEXjf
 kcJ/Wf15Bv7VtAzoHL12+47nTdXnTc4TToQJ7H6CA1Vbzda00+JwTDZGvDH+n1WjgksZ
 jMGy0emMkTQs5dXevrPZozXN3BEFjmkMWa32Fs2D3FI8TCLz1frqmKn+Ea7Mf6I5IoHP
 eHkIvK5XzXs1+8a9e1tdhrGESfzYdHFAQ+AbgBDAxFtIbUVmU5uHarzSH7PKPxjCgnRq rg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41fa4j-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 07:53:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 13:52:52 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 13:52:52 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 88E0C11D1;
 Thu, 23 Jun 2022 12:52:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 20/96] ASoC: fsl: Migrate to new style legacy DAI naming
 flag
Date: Thu, 23 Jun 2022 13:51:34 +0100
Message-ID: <20220623125250.2355471-21-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: h9WaDBf4KuGByK_NZWi6uS9FRCjWftDR
X-Proofpoint-ORIG-GUID: h9WaDBf4KuGByK_NZWi6uS9FRCjWftDR
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
 sound/soc/fsl/fsl_aud2htx.c     | 3 ++-
 sound/soc/fsl/fsl_easrc.c       | 7 ++++---
 sound/soc/fsl/fsl_esai.c        | 3 ++-
 sound/soc/fsl/fsl_rpmsg.c       | 3 ++-
 sound/soc/fsl/fsl_sai.c         | 3 ++-
 sound/soc/fsl/fsl_spdif.c       | 3 ++-
 sound/soc/fsl/fsl_ssi.c         | 1 +
 sound/soc/fsl/fsl_xcvr.c        | 3 ++-
 sound/soc/fsl/mpc5200_psc_i2s.c | 3 ++-
 9 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 422922146f2a5..873295f59ad7b 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -103,7 +103,8 @@ static struct snd_soc_dai_driver fsl_aud2htx_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_aud2htx_component = {
-	.name	= "fsl-aud2htx",
+	.name			= "fsl-aud2htx",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct reg_default fsl_aud2htx_reg_defaults[] = {
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index be14f84796cb4..ea96b0fb6b202 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1572,9 +1572,10 @@ static struct snd_soc_dai_driver fsl_easrc_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_easrc_component = {
-	.name		= "fsl-easrc-dai",
-	.controls       = fsl_easrc_snd_controls,
-	.num_controls   = ARRAY_SIZE(fsl_easrc_snd_controls),
+	.name			= "fsl-easrc-dai",
+	.controls		= fsl_easrc_snd_controls,
+	.num_controls		= ARRAY_SIZE(fsl_easrc_snd_controls),
+	.legacy_dai_naming	= 1,
 };
 
 static const struct reg_default fsl_easrc_reg_defaults[] = {
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 75f7807df29af..5c21fc490fce1 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -824,7 +824,8 @@ static struct snd_soc_dai_driver fsl_esai_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_esai_component = {
-	.name		= "fsl-esai",
+	.name			= "fsl-esai",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct reg_default fsl_esai_reg_defaults[] = {
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 19fd312508839..bf94838bdbefe 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -135,7 +135,8 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_component = {
-	.name           = "fsl-rpmsg",
+	.name			= "fsl-rpmsg",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct fsl_rpmsg_soc_data imx7ulp_data = {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 4f5bd9597c746..68b5b488deebd 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -767,7 +767,8 @@ static struct snd_soc_dai_driver fsl_sai_dai_template = {
 };
 
 static const struct snd_soc_component_driver fsl_component = {
-	.name           = "fsl-sai",
+	.name			= "fsl-sai",
+	.legacy_dai_naming	= 1,
 };
 
 static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 42d11aca38a10..0504431792cf9 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1237,7 +1237,8 @@ static struct snd_soc_dai_driver fsl_spdif_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_spdif_component = {
-	.name		= "fsl-spdif",
+	.name			= "fsl-spdif",
+	.legacy_dai_naming	= 1,
 };
 
 /* FSL SPDIF REGMAP */
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 7dd0c48cd9ae4..c9e0e31d5b34d 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1182,6 +1182,7 @@ static struct snd_soc_dai_driver fsl_ssi_dai_template = {
 
 static const struct snd_soc_component_driver fsl_ssi_component = {
 	.name = "fsl-ssi",
+	.legacy_dai_naming = 1,
 };
 
 static struct snd_soc_dai_driver fsl_ssi_ac97_dai = {
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 55e640cba87d0..c043efe4548d1 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -911,7 +911,8 @@ static struct snd_soc_dai_driver fsl_xcvr_dai = {
 };
 
 static const struct snd_soc_component_driver fsl_xcvr_comp = {
-	.name = "fsl-xcvr-dai",
+	.name			= "fsl-xcvr-dai",
+	.legacy_dai_naming	= 1,
 };
 
 static const struct reg_default fsl_xcvr_reg_defaults[] = {
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 3149d59ae968d..73f3e61f208a7 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -148,7 +148,8 @@ static struct snd_soc_dai_driver psc_i2s_dai[] = {{
 } };
 
 static const struct snd_soc_component_driver psc_i2s_component = {
-	.name		= "mpc5200-i2s",
+	.name			= "mpc5200-i2s",
+	.legacy_dai_naming	= 1,
 };
 
 /* ---------------------------------------------------------------------
-- 
2.30.2

