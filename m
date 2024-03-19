Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6C87F974
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345A210F653;
	Tue, 19 Mar 2024 08:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MyxzSqcm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5F10F667
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:23:04 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E34BF02;
 Tue, 19 Mar 2024 09:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710836556;
 bh=Y20q2GHyYvn4IMCZter81h5YE8yYywNCvuN8kMhR93Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MyxzSqcmR6qWovAz2vOF/UbYife19XvsVm3v2VaXcIn+KYyRJjQLJaN9lsXDzPxdH
 Z5fs4+On4CmF/IjGDFYgmdARjFfuVLmGAKE29eJsx0YJSubR4fjj7D7jdFhrj4YIRG
 4l3nGujjKIkbmTcWpykcJ/t4V/fHj2E/656B1OBQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 19 Mar 2024 10:22:36 +0200
Subject: [PATCH v2 1/4] ASoC: dmaengine_pcm: Allow passing component name
 via config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-xilinx-dp-audio-v2-1-92d6d3a7ca7e@ideasonboard.com>
References: <20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com>
In-Reply-To: <20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl+UtjA+8oLhjSQdDPHr7s6W03wf3N/YpzrdJyI
 +e2tV+oL7OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZflLYwAKCRD6PaqMvJYe
 9ZWzEACPDfWu9op5uJk4JnWgaNyIJ788N19lyXWlUf2ELP1hJj0ZJUjWH/lO5ZioS5mObonPr9L
 a81T1YNRnkETFyrBfC7RBGX2Aw9OdIo3si9/K45xy4u/JSgLrYaNdO/t2GVRy3lyd9sPuxJCo+I
 Ngt7xEmo/kNkp5LB5SlWmzxvAw7/TZo1QfCkyW0Meu/3dnTjYi4+QyGcUJt18VuCjOatNVYHasW
 Ni85iys+0DGOaszpNWxy7jFqLHhcPCs3BMsXLrcK5i0v6Ne/VFsZHEruhdtlI6PLLqEUxDhKcNJ
 uBvLHj5RRyytN3qqwcYRibalo8omj4Dun4HE2q7nOhr9/XzFFY4nxSvCMvE0gJLvHi1uGX374yK
 ANzfxPZnxdYs5dUcpAfo5arYtt6SN3AKI0A/zYVwhnijsdLIObqsz9Yq7o8cAxZu+yqQxIm0uy1
 xN7DoUZ1k43TXyZ2haV/PZq6GzRNVls5sC36XACMFngCsDPLviiclk2osEJCnMFadf3QOrD63+T
 VDc6Le/fgn61gSMUJu/CZ0b/fWFoS15xneyZahFiqZMpU3j4xGkU2M+bJN+XgaB9MxGUbFLspJ8
 FQUjvOO5AY1kpb0vgTJiJbtvouu/yQjQfYc1ihMOzGeUAiRATOhj5+Xo21GJ15rmKlF2bEWvzCK
 Axhf6ZdYpQHKwdw==
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

