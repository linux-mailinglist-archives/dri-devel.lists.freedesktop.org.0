Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2428595F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8A96E899;
	Wed,  7 Oct 2020 07:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1C6E21B;
 Tue,  6 Oct 2020 16:30:08 +0000 (UTC)
IronPort-SDR: X2S7Xni4Czr8+Vnj2LGhBiRFbbE9pXIshv1On9yfcnrdb+ia0fGGNcvCwAPf/LMp8McS9ucics
 ImAIErkBH0xA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="151491155"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="151491155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 09:19:45 -0700
IronPort-SDR: rykPb+F00eOIYzeQ87BYpQocUltM8yEEajjSDyj1Nm5O8tCPOAI6GlKp2JR9zlnMJJlExydZMi
 LOsAllcW2TdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="327619123"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 06 Oct 2020 09:19:40 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: tiwai@suse.de, alsa-devel@alsa-project.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH] ALSA: hda/i915 - fix list corruption with concurrent probes
Date: Tue,  6 Oct 2020 19:17:22 +0300
Message-Id: <20201006161722.500256-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Takashi Iwai <tiwai@suse.de>

Current hdac_i915 uses a static completion instance to wait
for i915 driver to complete the component bind.

This design is not safe if multiple HDA controllers are active and
communicating with different i915 instances, and can lead to list
corruption and failed audio driver probe.

Fix the design by moving completion mechanism to common acomp
code and remove the related code from hdac_i915.

Co-developed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/drm/drm_audio_component.h |  4 ++++
 sound/hda/hdac_component.c        |  3 +++
 sound/hda/hdac_i915.c             | 23 +++--------------------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/include/drm/drm_audio_component.h b/include/drm/drm_audio_component.h
index a45f93487039..0d36bfd1a4cd 100644
--- a/include/drm/drm_audio_component.h
+++ b/include/drm/drm_audio_component.h
@@ -117,6 +117,10 @@ struct drm_audio_component {
 	 * @audio_ops: Ops implemented by hda driver, called by DRM driver
 	 */
 	const struct drm_audio_component_audio_ops *audio_ops;
+	/**
+	 * @master_bind_complete: completion held during component master binding
+	 */
+	struct completion master_bind_complete;
 };
 
 #endif /* _DRM_AUDIO_COMPONENT_H_ */
diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index 89126c6fd216..bb37e7e0bd79 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -210,12 +210,14 @@ static int hdac_component_master_bind(struct device *dev)
 			goto module_put;
 	}
 
+	complete_all(&acomp->master_bind_complete);
 	return 0;
 
  module_put:
 	module_put(acomp->ops->owner);
 out_unbind:
 	component_unbind_all(dev, acomp);
+	complete_all(&acomp->master_bind_complete);
 
 	return ret;
 }
@@ -296,6 +298,7 @@ int snd_hdac_acomp_init(struct hdac_bus *bus,
 	if (!acomp)
 		return -ENOMEM;
 	acomp->audio_ops = aops;
+	init_completion(&acomp->master_bind_complete);
 	bus->audio_component = acomp;
 	devres_add(dev, acomp);
 
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 5f0a1aa6ad84..454474ac5716 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,8 +11,6 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
-static struct completion bind_complete;
-
 #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
 				((pci)->device == 0x0c0c) || \
 				((pci)->device == 0x0d0c) || \
@@ -130,19 +128,6 @@ static bool i915_gfx_present(void)
 	return pci_dev_present(ids);
 }
 
-static int i915_master_bind(struct device *dev,
-			    struct drm_audio_component *acomp)
-{
-	complete_all(&bind_complete);
-	/* clear audio_ops here as it was needed only for completion call */
-	acomp->audio_ops = NULL;
-	return 0;
-}
-
-static const struct drm_audio_component_audio_ops i915_init_ops = {
-	.master_bind = i915_master_bind
-};
-
 /**
  * snd_hdac_i915_init - Initialize i915 audio component
  * @bus: HDA core bus
@@ -163,9 +148,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!i915_gfx_present())
 		return -ENODEV;
 
-	init_completion(&bind_complete);
-
-	err = snd_hdac_acomp_init(bus, &i915_init_ops,
+	err = snd_hdac_acomp_init(bus, NULL,
 				  i915_component_master_match,
 				  sizeof(struct i915_audio_component) - sizeof(*acomp));
 	if (err < 0)
@@ -177,8 +160,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
-			wait_for_completion_timeout(&bind_complete,
-						   msecs_to_jiffies(60 * 1000));
+			wait_for_completion_timeout(&acomp->master_bind_complete,
+						    msecs_to_jiffies(60 * 1000));
 		}
 	}
 	if (!acomp->ops) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
