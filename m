Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513ED87911D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37906112887;
	Tue, 12 Mar 2024 09:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jc6uYaHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715A8112758
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:41:36 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 675CADFB;
 Tue, 12 Mar 2024 10:41:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710236473;
 bh=Y20q2GHyYvn4IMCZter81h5YE8yYywNCvuN8kMhR93Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jc6uYaHGU7u2yNC5dKa5YQ1XkiLwVNzQIDUYAuwtx6ntZIwjn65AFWOcj9mWGq5Kr
 e97d1b4D2FYGHfNzTtlwlgGHo2WiBQM1LfzU4KUazirL1kUD6cJbGJWJlQr4ps6LSt
 svkxt/SBF2G0DkqWfrNmq76IjZOpxs4df+hcS4n0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 12 Mar 2024 11:41:02 +0200
Subject: [PATCH 1/4] ASoC: dmaengine_pcm: Allow passing component name via
 config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-xilinx-dp-audio-v1-1-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Y20q2GHyYvn4IMCZter81h5YE8yYywNCvuN8kMhR93Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8CNKmHTvKOCOEEFwtj9jcZSpkgC6g5K4s/BuU
 3XtQVx35ZuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAjSgAKCRD6PaqMvJYe
 9fyiD/41i6r4AfXqSSPLB04IsYhdCuxvfRH3yFul6aSXRkSQEfUXAaskoggc5/Opc4cKTzBav7Z
 RszLw/BN2WmUWZqL2DSQQbIf6qAxFUXEFLsCi3MpyEIOU7cy42NbtI1ffxcwAYnsWxYGNzl30JO
 IlXhcIXjtMIlX4yVSgmDUDsbAHw7q93Ghh4paQ4ngzxWMRaqrTWhnAvfe7evIYJwlrD3MUqegvU
 ol4FV86A6d/939RKEk7VCKmr5dFeiPwfppbZmpGsRLf9GF95Q2NBlm6AxQ5gRU/Wih+cOvNy1Dc
 XbPWNEpLfBopB/rIkFW/bpOOoMa2H3Cf5yEYZeU5VnLt9tQWn9rtQY0uhOUhSx9jeQ5RWAX1C3/
 StQZZaZhgpx0F6SGofJYU50mtbiXNQIdq/WcAU+2fPzCqhRkB5NLkU97rKdepxzWINRjyCGfilC
 DngtbhAq1caIa088k5MidS+1/SIsPPWZvhquL9fFUiUtXQg2+PYabQ10kR3yrOpDoFRKOqAlcLP
 x+SW2FvjhM9FLJk65MVABDLh54XgpnSX2Tt3QdyRSLe/dXjOuxDX4nknZ3MMQZhrhE8Bvkp3ELB
 YWLz+KtotBhkEKy/JFIgnGrjgufGmk4QEtjDwq9bKOWQ4Sl8WdryiXkmcQj0T4doThInY3ZKUX7
 6FettnOo+TSUU+Q==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the moment we cannot instantiate two dmaengine_pcms with the same
parent device, as the components will be named the same, leading to
conflicts.

Add 'name' field to the snd_dmaengine_pcm_config, and use that (if
defined) as the component name instead of deriving the component name
from the device.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/sound/dmaengine_pcm.h         | 2 ++
 sound/soc/soc-core.c                  | 8 +++++---
 sound/soc/soc-generic-dmaengine-pcm.c | 3 +++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index d70c55f17df7..c11aaf8079fb 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -118,6 +118,7 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
  *   which do not use devicetree.
  * @process: Callback used to apply processing on samples transferred from/to
  *   user space.
+ * @name: Component name. If null, dev_name will be used.
  * @compat_filter_fn: Will be used as the filter function when requesting a
  *  channel for platforms which do not use devicetree. The filter parameter
  *  will be the DAI's DMA data.
@@ -143,6 +144,7 @@ struct snd_dmaengine_pcm_config {
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
 		       unsigned long bytes);
+	const char *name;
 	dma_filter_fn compat_filter_fn;
 	struct device *dma_dev;
 	const char *chan_names[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 516350533e73..772d67065611 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2792,10 +2792,12 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
 	if (!component->name) {
-		dev_err(dev, "ASoC: Failed to allocate name\n");
-		return -ENOMEM;
+		component->name = fmt_single_name(dev, &component->id);
+		if (!component->name) {
+			dev_err(dev, "ASoC: Failed to allocate name\n");
+			return -ENOMEM;
+		}
 	}
 
 	component->dev		= dev;
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 092ca09f3631..83db1a83d8ba 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -441,6 +441,9 @@ int snd_dmaengine_pcm_register(struct device *dev,
 	pcm->config = config;
 	pcm->flags = flags;
 
+	if (config->name)
+		pcm->component.name = config->name;
+
 	ret = dmaengine_pcm_request_chan_of(pcm, dev, config);
 	if (ret)
 		goto err_free_dma;

-- 
2.34.1

