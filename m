Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705263EDDDC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751AF6E045;
	Mon, 16 Aug 2021 19:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2BC89819
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k8so6148554wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GQZcK6R0BkYHGP9eubs/dRk+ABz3Z6fvnc3XZsSEy8=;
 b=qswMkmAu9bvSVVAU5bWeCnVdJT1Xtnk8Vj9Ey3kptbC3XhmPW77Dfm1zVC9qm7vHsb
 cFWqnPtkV3X9dss5MkTxth9Jnb/vLDe3gFa0vGkJV3EkXh4JcTzyvD7Qv8J1nnWU0lcL
 julwMf+kHajNnxxAXdqK3J3dilfUlCqiJk9aOjOOlF9Pc4N6NwTNhsPBjeEJjK7pHniJ
 QLWRQMSWHGMKRLRs7M+ObckE0hKA7BVvdLeHiR/tf/D9BRdMYHD9qSTg0ZUwxzNe5PPd
 cBPPx1BwQ3rSLM6Rcka0MVtjYjKFgN2DLq0zaykYxaAvCYGtClsXkrwQdjOZ7wZd0av/
 uDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GQZcK6R0BkYHGP9eubs/dRk+ABz3Z6fvnc3XZsSEy8=;
 b=rncUcl9HlkRzHvkeSQ0I0MEE7edyLnwQZf3C454IFRS+wU6VF/BmFmsXTfIPD62qEh
 fookpad7CVNAVxA2LosQYkvfmj4NVktoh++0b+Dkg1aG73bO/+aEaCqJveMTiW7J0sQQ
 Md6GvOB/KRuXV4jeyrgi1KkbGwKrsXXrevHADRTjgZ//LYP75AbQDsHr6qQhqGrKw6r8
 ETWs4Or8Tr0XFY5a5CD9lVkRLpdcIp8Gk8KwidlSsem6c6aDARPCq2rX0SUMirLW9sgv
 nsEYXQWvgt729WrUblILBAdKeSZqxSzyzL1UHXNE7D02QUmfUsnF6Zps2rtmz5kKrPp4
 Nizg==
X-Gm-Message-State: AOAM533ga8b/a7e+MCJHuzlrce/+BTkOUPiQKRIk4V73Wf3t8xQoY0ql
 wsDHF6+prueAX0PkosXnZ8JgAQ==
X-Google-Smtp-Source: ABdhPJwITFVfElVNGgxJw2RutXnkGSR5NyNK8EdadYD0hJjotYhAoS2uhBbK/P2u4IKKms4iL/Ne9w==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr45265wrs.161.1629141948597;
 Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 3/5] drm/edid: Add cea_sad helpers for freq/length
Date: Mon, 16 Aug 2021 21:25:21 +0200
Message-Id: <20210816192523.1739365-4-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
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
2.32.0

