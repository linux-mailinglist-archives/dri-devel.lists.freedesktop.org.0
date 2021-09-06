Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE659402070
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 21:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F239E89B38;
	Mon,  6 Sep 2021 19:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF3E89B38
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:37:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b6so11193564wrh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=snUzoDW+5PNPj/ZhnT7gRBZGhyimDcpdvBIKee8Gvik=;
 b=Jom5mQd0Ic3lUJzLQn782DM3DGKd2OI7Gn/gWzXKwSehzPTTwB4DK80bqKePMOq51s
 mgQGb/en0JSIODIe1gZra4mymBT2dCwqP5+4sljtOUlieURD8v2BhRI/2/q7U1xAvjC0
 HBnp7I3+mPvgcKw5Z9kmQrvQ1C30+tqE1vovgA1rHTwY9ejTzUMZ1qQsmRNLc2xG1bQG
 Y1vWbvwZXJckYtkYWJ+wZabfqdNHQYQPeYnTGVBJ+jqgEiLZ4W7o3CW3XBBtgkMtZgA3
 rkNPHiohhMvrPBj+xd9Eo/b/0PiNkfpmP/Q1ShM+5lYJpA1hBuZXYwjY6Fp51P46J4Tx
 amAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=snUzoDW+5PNPj/ZhnT7gRBZGhyimDcpdvBIKee8Gvik=;
 b=h4xhgz/bwcWj27vP50GBeSZtklRW+h2OX0t4T+3u9jT5Px4H+HAmoh6i3zoCY8WTEB
 9ZOYylCNqCEIE9NEKjFmhK9t2yTzYM/gj9BmQh2PPTUy9P7BSepKyjTpBLXR8Fm+RnSa
 G5pgvmo/PVcwZqD1QKOZ1FusbVxUts33n6G0BNEfWlIC5hY5JTUv8GwsxCiTP0mZWl8t
 d3TB/7kLvqzdwf1rMyWonlctmZiBZHRiN/ps+hFyKAuUFR4M1PZn32cCwV80CNcvfpDv
 6BwjbcIUzabZi9zeLzaq/P1wfGRQgywA6X3soo4zVv+kClLrjgcp3gFjqDgZmr5jnyzZ
 Zv4Q==
X-Gm-Message-State: AOAM530in1a2FpjvUvCRofzPNs4ggK3FrYM/KIjn6/pRZEd9vdL1Pr0g
 5ry26yrW3KlZC/xnPr0k0jBoble7qVhd4Q==
X-Google-Smtp-Source: ABdhPJw73Dea6TnP4RirbnbvwG3v+REJRLKH+tErr/30ujbznKQo85kBUSdowHn6Jt6Zn8FECj4/eg==
X-Received: by 2002:adf:f991:: with SMTP id f17mr15199284wrr.56.1630957023909; 
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 4/6] video/hdmi: Add audio_infoframe packing for DP
Date: Mon,  6 Sep 2021 21:35:27 +0200
Message-Id: <20210906193529.718845-5-msp@baylibre.com>
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

Similar to HDMI, DP uses audio infoframes as well which are structured
very similar to the HDMI ones.

This patch adds a helper function to pack the HDMI audio infoframe for
DP, called hdmi_audio_infoframe_pack_for_dp().
hdmi_audio_infoframe_pack_only() is split into two parts. One of them
packs the payload only and can be used for HDMI and DP.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/video/hdmi.c | 87 +++++++++++++++++++++++++++++++++++---------
 include/linux/hdmi.h |  4 ++
 2 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 947be761dfa4..59c4341549e4 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -387,6 +387,28 @@ int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 
+static void
+hdmi_audio_infoframe_pack_payload(const struct hdmi_audio_infoframe *frame,
+				  u8 *buffer)
+{
+	u8 channels;
+
+	if (frame->channels >= 2)
+		channels = frame->channels - 1;
+	else
+		channels = 0;
+
+	buffer[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
+	buffer[1] = ((frame->sample_frequency & 0x7) << 2) |
+		 (frame->sample_size & 0x3);
+	buffer[2] = frame->coding_type_ext & 0x1f;
+	buffer[3] = frame->channel_allocation;
+	buffer[4] = (frame->level_shift_value & 0xf) << 3;
+
+	if (frame->downmix_inhibit)
+		buffer[4] |= BIT(7);
+}
+
 /**
  * hdmi_audio_infoframe_pack_only() - write HDMI audio infoframe to binary buffer
  * @frame: HDMI audio infoframe
@@ -404,7 +426,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size)
 {
-	unsigned char channels;
 	u8 *ptr = buffer;
 	size_t length;
 	int ret;
@@ -420,28 +441,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 
 	memset(buffer, 0, size);
 
-	if (frame->channels >= 2)
-		channels = frame->channels - 1;
-	else
-		channels = 0;
-
 	ptr[0] = frame->type;
 	ptr[1] = frame->version;
 	ptr[2] = frame->length;
 	ptr[3] = 0; /* checksum */
 
-	/* start infoframe payload */
-	ptr += HDMI_INFOFRAME_HEADER_SIZE;
-
-	ptr[0] = ((frame->coding_type & 0xf) << 4) | (channels & 0x7);
-	ptr[1] = ((frame->sample_frequency & 0x7) << 2) |
-		 (frame->sample_size & 0x3);
-	ptr[2] = frame->coding_type_ext & 0x1f;
-	ptr[3] = frame->channel_allocation;
-	ptr[4] = (frame->level_shift_value & 0xf) << 3;
-
-	if (frame->downmix_inhibit)
-		ptr[4] |= BIT(7);
+	hdmi_audio_infoframe_pack_payload(frame,
+					  ptr + HDMI_INFOFRAME_HEADER_SIZE);
 
 	hdmi_infoframe_set_checksum(buffer, length);
 
@@ -479,6 +485,51 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
 
+/**
+ * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
+ *                                    displayport
+ *
+ * @frame HDMI Audio infoframe
+ * @header Header buffer to be used
+ * @header_size Size of header buffer
+ * @data Data buffer to be used
+ * @data_size Size of data buffer
+ * @dp_version Display Port version to be encoded in the header
+ *
+ * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
+ * fills both header and data buffer with the required data.
+ *
+ * Return: Number of total written bytes or a negative errno on failure.
+ */
+ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
+					 void *header, size_t header_size,
+					 void *data, size_t data_size,
+					 u8 dp_version)
+{
+	int ret;
+	u8 *hdr_ptr = header;
+
+	ret = hdmi_audio_infoframe_check(frame);
+	if (ret)
+		return ret;
+
+	if (header_size < 4 || data_size < frame->length)
+		return -ENOSPC;
+
+	memset(header, 0, header_size);
+	memset(data, 0, data_size);
+
+	// Secondary-data packet header
+	hdr_ptr[1] = frame->type;
+	hdr_ptr[2] = 0x1B;  // As documented by DP spec for Secondary-data Packets
+	hdr_ptr[3] = (dp_version & 0x3f) << 2;
+
+	hdmi_audio_infoframe_pack_payload(frame, data);
+
+	return frame->length + 4;
+}
+EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
+
 /**
  * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
  * @frame: HDMI vendor infoframe
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index c8ec982ff498..f576a0b08c85 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -334,6 +334,10 @@ struct hdmi_audio_infoframe {
 int hdmi_audio_infoframe_init(struct hdmi_audio_infoframe *frame);
 ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 				  void *buffer, size_t size);
+ssize_t hdmi_audio_infoframe_pack_for_dp(struct hdmi_audio_infoframe *frame,
+					 void *header, size_t header_size,
+					 void *data, size_t data_size,
+					 u8 dp_version);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size);
 int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
-- 
2.33.0

