Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B444C1DE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E3D6E40A;
	Wed, 10 Nov 2021 13:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9256E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:06:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1681475wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 05:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPDBPrmR0Iq3ngKw0EvBqQA5UwN0K6nnYMPRbJ4cDDg=;
 b=0LeywrAQLxeSJVZea0hYCbG0F5mAqPbTaYutG49q+kdujnkV7KKu+Cuw9PmPIu1ukU
 23Eg1sf4hmYD4qVH0XBqtlZMw3v5vKERPxVUz01c9EBv5OW5zH3He0ovCdiM+Rlec1ZT
 KwhIHPgD43zORBmrHglBEn6GVoE4+MPkdI/LujGuAma2hT5mWJMLldzCX3ygY6DrgeW1
 iqcZ8sUfFKmWVzyTNuVkpLYPdgL1bAeoaiaJuOTjrI37ps9GgSUizoRUOktDoj5nkBFA
 CVVcsfNq+GzaE8Ax+9+fH9dqIrYODJ0IscwJJlZccyl7lucmAHVucZRprrZjgpZ1TrQP
 fHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPDBPrmR0Iq3ngKw0EvBqQA5UwN0K6nnYMPRbJ4cDDg=;
 b=JwcdROvebDqyEh070UdRUcPcIkpl5uWS6hFDlfxbFMFK+KqnV+kNH5tOppdj1sBqeC
 YYTfgcKGVz1uyG8TSHxXqwKA5vmr74W2HM3pAwpJ68tIUFzZbUvUmtV4jEt+CYMl64Ze
 NnkPzk3/zclxq3qTyRd76DhS1JZjBpWHIP7Wnice+DyoO8I/XBhSzcjjUyw0tcN2195f
 2IFv/IgPLHZ5WpqSLsojMR0MS0IN3qwyz7FPa+f9ex+kNTnn1VHqhLeG4T1Z+Teqm13h
 LDbn6+4MZMGMAt0FclFKbP0Lc2mtBlgk/3XtEeCUTKAYqst21bW6C3aKUgbtqPR9JO/V
 08fQ==
X-Gm-Message-State: AOAM5322NenVgc8NAunGAbvGnWYGlgtLfOjiiSJn/khrTetRD3pKIpxQ
 MYypNq9daRDUWYUCEHpYkBodTw==
X-Google-Smtp-Source: ABdhPJwmVQCZTGwUV5/dFTZJZ4xmJG+LfE4ZrS8es9yeIY+l3OgbRhjInJky9t3ezlfOJTWi6GqYkg==
X-Received: by 2002:a05:600c:4f44:: with SMTP id
 m4mr16500447wmq.95.1636549597275; 
 Wed, 10 Nov 2021 05:06:37 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-656-1-151-143.w92-154.abo.wanadoo.fr. [92.154.18.143])
 by smtp.gmail.com with ESMTPSA id i17sm5952175wmq.48.2021.11.10.05.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:06:36 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 3/7] drm/edid: Add cea_sad helpers for freq/length
Date: Wed, 10 Nov 2021 14:06:19 +0100
Message-Id: <20211110130623.20553-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110130623.20553-1-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

This patch adds two helper functions that extract the frequency and word
length from a struct cea_sad.

For these helper functions new defines are added that help translate the
'freq' and 'byte2' fields into real numbers.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 18 ++++++++--
 2 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89bb..500279a82167a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4747,6 +4747,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 }
 EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
 
+/**
+ * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
+ * @sad: Pointer to the cea_sad struct
+ *
+ * Extracts the cea_sad frequency field and returns the sample rate in Hz.
+ *
+ * Return: Sample rate in Hz or a negative errno if parsing failed.
+ */
+int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
+{
+	switch (sad->freq) {
+	case DRM_CEA_SAD_FREQ_32KHZ:
+		return 32000;
+	case DRM_CEA_SAD_FREQ_44KHZ:
+		return 44100;
+	case DRM_CEA_SAD_FREQ_48KHZ:
+		return 48000;
+	case DRM_CEA_SAD_FREQ_88KHZ:
+		return 88200;
+	case DRM_CEA_SAD_FREQ_96KHZ:
+		return 96000;
+	case DRM_CEA_SAD_FREQ_176KHZ:
+		return 176400;
+	case DRM_CEA_SAD_FREQ_192KHZ:
+		return 192000;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
+
+static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
+{
+	switch (sad->format) {
+	case HDMI_AUDIO_CODING_TYPE_STREAM:
+	case HDMI_AUDIO_CODING_TYPE_PCM:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * drm_cea_sad_get_uncompressed_word_length - Extract word length
+ * @sad: Pointer to the cea_sad struct
+ *
+ * Extracts the cea_sad byte2 field and returns the word length for an
+ * uncompressed stream.
+ *
+ * Note: This function may only be called for uncompressed audio.
+ *
+ * Return: Word length in bits or a negative errno if parsing failed.
+ */
+int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
+{
+	if (!drm_cea_sad_is_uncompressed(sad)) {
+		DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
+			 sad->format);
+		return -EINVAL;
+	}
+
+	switch (sad->byte2) {
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
+		return 16;
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
+		return 20;
+	case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
+		return 24;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
+
 /**
  * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
  * @connector: connector associated with the HDMI/DP sink
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 18f6c700f6d02..a30452b313979 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -361,12 +361,24 @@ struct edid {
 
 /* Short Audio Descriptor */
 struct cea_sad {
-	u8 format;
+	u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
 	u8 channels; /* max number of channels - 1 */
-	u8 freq;
+	u8 freq; /* See CEA_SAD_FREQ_* */
 	u8 byte2; /* meaning depends on format */
 };
 
+#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
+#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
+#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
+#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
+#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
+#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
+#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
+
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
+#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
+
 struct drm_encoder;
 struct drm_connector;
 struct drm_connector_state;
@@ -374,6 +386,8 @@ struct drm_display_mode;
 
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
+int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
+int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-- 
2.32.0

