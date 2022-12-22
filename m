Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D8654885
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD810E5BD;
	Thu, 22 Dec 2022 22:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8110E59D;
 Thu, 22 Dec 2022 22:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748122; x=1703284122;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=otK0c2JmYgFQI4ojlU9upqH81B6bAxq56Y9OEdnxASs=;
 b=n1Jas8VOuImjhZzUU8Yixq7SOJWBmisxeYhD5f/OdxcDTtQsRX0QANp/
 r1bYh5xIVMnXHeIP6sRKJySFke84ljVHKq29yscUE178FlJikbJ9tsXMM
 JBJTXGsGKuMY0YulJpD+4FF5viBMRwYRfUuAEro3phoeoWgIXeF2aGf4Z
 RrHzQOsC2Brr4qP2InuMeNj+zpUAyuZLAsV+9FigMYHso1FoJlfrn5e+X
 Z3vDA/gzsOD6mkOkr1RgAnwzCUY0c9HMBzSblUlcF3oYC9NBcVNVF1+wu
 ctDXyNan1rz6NyJpq2qo9N4NqPiUdRbpDrz3TpI57Cn2e4Zyu1UjRnhRC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472867"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472867"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412335"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412335"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 19/20] sound/hda: Allow XE as i915 replacement for sound
Date: Thu, 22 Dec 2022 14:21:26 -0800
Message-Id: <20221222222127.34560-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Xe, is a new driver for Intel GPUs that supports both integrated
and discrete platforms starting with Tiger Lake. Let's ensure
sound can accept xe instead of i915 whenever that is in use.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 sound/hda/hdac_i915.c      | 17 +++---------
 sound/pci/hda/hda_intel.c  | 56 ++++++++++++++++++++------------------
 sound/soc/intel/avs/core.c | 13 ++++++---
 sound/soc/sof/intel/hda.c  |  7 +++--
 4 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 161a9711cd63..39c548b34fcd 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -108,7 +108,8 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 	hdac_pci = to_pci_dev(bus->dev);
 	i915_pci = to_pci_dev(dev);
 
-	if (!strcmp(dev->driver->name, "i915") &&
+	if ((!strcmp(dev->driver->name, "i915") ||
+	     !strcmp(dev->driver->name, "xe")) &&
 	    subcomponent == I915_COMPONENT_AUDIO &&
 	    connectivity_check(i915_pci, hdac_pci))
 		return 1;
@@ -159,20 +160,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (err < 0)
 		return err;
 	acomp = bus->audio_component;
-	if (!acomp)
-		return -ENODEV;
-	if (!acomp->ops) {
-		if (!IS_ENABLED(CONFIG_MODULES) ||
-		    !request_module("i915")) {
-			/* 60s timeout */
-			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
-							     msecs_to_jiffies(60 * 1000));
-		}
-	}
-	if (!acomp->ops) {
+	if (!acomp || !acomp->ops) {
 		dev_info(bus->dev, "couldn't bind with audio component\n");
 		snd_hdac_acomp_exit(bus);
-		return -ENODEV;
+		return -EPROBE_DEFER;
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 87002670c0c9..481887903f75 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -209,6 +209,7 @@ MODULE_DESCRIPTION("Intel HDA driver");
 #endif
 #endif
 
+static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
 
 /*
  */
@@ -1829,6 +1830,35 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	/* continue probing in work context as may trigger request module */
 	INIT_DELAYED_WORK(&hda->probe_work, azx_probe_work);
 
+	/* bind with i915 if needed */
+	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
+		err = snd_hdac_i915_init(azx_bus(chip));
+		if (err < 0) {
+			/* if the controller is bound only with HDMI/DP
+			 * (for HSW and BDW), we need to abort the probe;
+			 * for other chips, still continue probing as other
+			 * codecs can be on the same link.
+			 */
+			if (CONTROLLER_IN_GPU(pci)) {
+				if (err != -EPROBE_DEFER)
+					dev_err(card->dev,
+						"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
+
+				clear_bit(chip->dev_index, probed_devs);
+				pci_set_drvdata(pci, NULL);
+				snd_device_free(card, chip);
+				return err;
+			} else {
+				/* don't bother any longer */
+				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
+			}
+		}
+
+		/* HSW/BDW controllers need this power */
+		if (CONTROLLER_IN_GPU(pci))
+			hda->need_i915_power = true;
+	}
+
 	*rchip = chip;
 
 	return 0;
@@ -2059,8 +2089,6 @@ static const struct hda_controller_ops pci_hda_ops = {
 	.position_check = azx_position_check,
 };
 
-static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
-
 static int azx_probe(struct pci_dev *pci,
 		     const struct pci_device_id *pci_id)
 {
@@ -2239,30 +2267,6 @@ static int azx_probe_continue(struct azx *chip)
 	to_hda_bus(bus)->bus_probing = 1;
 	hda->probe_continued = 1;
 
-	/* bind with i915 if needed */
-	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(bus);
-		if (err < 0) {
-			/* if the controller is bound only with HDMI/DP
-			 * (for HSW and BDW), we need to abort the probe;
-			 * for other chips, still continue probing as other
-			 * codecs can be on the same link.
-			 */
-			if (CONTROLLER_IN_GPU(pci)) {
-				dev_err(chip->card->dev,
-					"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
-				goto out_free;
-			} else {
-				/* don't bother any longer */
-				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
-			}
-		}
-
-		/* HSW/BDW controllers need this power */
-		if (CONTROLLER_IN_GPU(pci))
-			hda->need_i915_power = true;
-	}
-
 	/* Request display power well for the HDA controller or codec. For
 	 * Haswell/Broadwell, both the display HDA controller and codec need
 	 * this power. For other platforms, like Baytrail/Braswell, only the
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index bb0719c58ca4..353aa40eb6dc 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -187,10 +187,6 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
 
-	ret = snd_hdac_i915_init(bus);
-	if (ret < 0)
-		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
-
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 	avs_hdac_bus_init_chip(bus, true);
 	avs_hdac_bus_probe_codecs(bus);
@@ -460,10 +456,19 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pci_set_drvdata(pci, bus);
 	device_disable_async_suspend(dev);
 
+	ret = snd_hdac_i915_init(bus);
+	if (ret == -EPROBE_DEFER)
+		goto err_unmaster;
+	else if (ret < 0)
+		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
+
 	schedule_work(&adev->probe_work);
 
 	return 0;
 
+err_unmaster:
+	pci_clear_master(pci);
+	pci_set_drvdata(pci, NULL);
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1188ec51816b..671291838b8e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -719,8 +719,11 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* init i915 and HDMI codecs */
 	ret = hda_codec_i915_init(sdev);
-	if (ret < 0)
-		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_warn(sdev->dev, "init of i915 and HDMI codec failed: %i\n", ret);
+		return ret;
+	}
 
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
-- 
2.37.3

