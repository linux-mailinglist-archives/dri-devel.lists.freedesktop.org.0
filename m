Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629F402071
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 21:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9C589C0A;
	Mon,  6 Sep 2021 19:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A689B38
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:37:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i6so11206488wrv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCTzkZjxAR3yPntjhPl5/v+go5uJQqFyVCtShSMvS8s=;
 b=YIMMT91D2ae2cWaA3DDabg5Ng2o3oNGdbiBeJtAMtFTcowr2RqGkddEEgdiWD70j2q
 t8IQwikt4/3zeSD8FdZCLdGxxnDjEiLBFRFheG/aTfFiyEl144iPkIa5tKxoCGCFHBEP
 TbWgqXemzsVQj1GoJbIRn10IwV0ug0zuO9U4di6cgc4luySp8l380ZfZm3bdQK+fvkJV
 hvFD33kcdrPAWVGJM7D3zye/y7K+L8POB4wlgmCBMueidw6N4K6Dy/WRTuIyu5hOLdwv
 FODQz1E5L0/339wu817YpUwIKI7xrhd3Dv4c8yQ5LXnGfXEr7rohgvhtha3pezxELJ+8
 v+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCTzkZjxAR3yPntjhPl5/v+go5uJQqFyVCtShSMvS8s=;
 b=e/qWdD/PebUFcrqiKuBuIwMZtL8xqAE6JnJVLXil6QiYdPwiQziLQD0B1AUF1cntYn
 tlpplYXPHPeoTBCB4S9BYY79pEyVK2VMlh5BMeuoMarzif6/n+2/fq6T/vN524kYZ3VC
 cWGC95BxQ6F85417riTejfvS+3aSxSA/avvcbJh3bUH8hSrREqBNbfHbP3+oxaSN4W5u
 S/1RBhAASl5Cl06Zww4Jvj07OGWcU4HQ/nS8Bx9ff2Hx5xeLaNbju3HkzDhx6o7GjvLh
 ki8rnz1b9swjCXEE4Ox8gf3+L8ASiyhZkieYexGJtg/Di7zMRjBqavs6Cp/lWkZyuPav
 r3Ug==
X-Gm-Message-State: AOAM530uTj6V85F6vbKZt3v3/6/avQOfZkVuCSR86Cih0NZAp5/I8b11
 XwZko6uDar5KKRXFhz3e3L30jA==
X-Google-Smtp-Source: ABdhPJw+SQEEcIoMtB3u+8hG/+1N90IseBx2tpu8H2Km4BwrrRoywYqOx3e1ukyR1U84aGovNybYIA==
X-Received: by 2002:adf:c449:: with SMTP id a9mr15137691wrg.256.1630957023305; 
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 3/6] drm/edid: Add cea_sad helpers for freq/length
Date: Mon,  6 Sep 2021 21:35:26 +0200
Message-Id: <20210906193529.718845-4-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
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

This patch adds two helper functions that extract the frequency and word
length from a struct cea_sad.

For these helper functions new defines are added that help translate the
'freq' and 'byte2' fields into real numbers.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/gpu/drm/drm_edid.c | 57 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     | 18 ++++++++++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 81d5f2524246..2389d34ce10e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4666,6 +4666,63 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
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
+int drm_cea_sad_get_sample_rate(struct cea_sad *sad)
+{
+	switch (sad->freq) {
+	case CEA_SAD_FREQ_32KHZ:
+		return 32000;
+	case CEA_SAD_FREQ_44KHZ:
+		return 44100;
+	case CEA_SAD_FREQ_48KHZ:
+		return 48000;
+	case CEA_SAD_FREQ_88KHZ:
+		return 88200;
+	case CEA_SAD_FREQ_96KHZ:
+		return 96000;
+	case CEA_SAD_FREQ_176KHZ:
+		return 176400;
+	case CEA_SAD_FREQ_192KHZ:
+		return 192000;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
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
+int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad)
+{
+	switch (sad->byte2) {
+	case CEA_SAD_UNCOMPRESSED_WORD_16BIT:
+		return 16;
+	case CEA_SAD_UNCOMPRESSED_WORD_20BIT:
+		return 20;
+	case CEA_SAD_UNCOMPRESSED_WORD_24BIT:
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
index 759328a5eeb2..bed091a749ef 100644
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
 
+#define CEA_SAD_FREQ_32KHZ  BIT(0)
+#define CEA_SAD_FREQ_44KHZ  BIT(1)
+#define CEA_SAD_FREQ_48KHZ  BIT(2)
+#define CEA_SAD_FREQ_88KHZ  BIT(3)
+#define CEA_SAD_FREQ_96KHZ  BIT(4)
+#define CEA_SAD_FREQ_176KHZ BIT(5)
+#define CEA_SAD_FREQ_192KHZ BIT(6)
+
+#define CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
+#define CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
+#define CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
+
 struct drm_encoder;
 struct drm_connector;
 struct drm_connector_state;
@@ -374,6 +386,8 @@ struct drm_display_mode;
 
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
+int drm_cea_sad_get_sample_rate(struct cea_sad *sad);
+int drm_cea_sad_get_uncompressed_word_length(struct cea_sad *sad);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-- 
2.33.0

