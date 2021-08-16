Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CBA3EDDDF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3776E053;
	Mon, 16 Aug 2021 19:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28BB6E045
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:25:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so25204366wrs.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5VYmJK3EyqmfhH+BfVMGjh2lMBLY0y87vkPhxmR1fE=;
 b=Q6VilRTJlXhBTxPwoxK0Dv6DqfrBAtJL/FQWBA78STpBnt892iVD2I/4oC5EvbL7iO
 /EBI9dILWaFxitg2X4FoRtlhvWiH35duYafUVCmLNOQPfu9GKSIyg7pQ4HgE1s5hyfLa
 xVWhhE5UmwzcQbd7WnsDSYZORLXPAELB6UoxxR/XHGRNeMf24mvRwBu7hX6zJTetqKWS
 IE574Y9osIfJpTu4IwEsskjji0q9yhVcb0XuJ23r12L6GMcL+tXsWTa8UXTNBzh3l/42
 Pef5Jx3jW/I2eHHo072AFPHJOhCO70UZBUfiIhnmas4IA9UUYAQyeq26gv7RSoRLW3rp
 fN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5VYmJK3EyqmfhH+BfVMGjh2lMBLY0y87vkPhxmR1fE=;
 b=R+G0I44TBRytKXixfUXIWoBA8SN9QEvOWuJTWAl1LXtMFz2OwU3r7di0ixZgnOHWju
 zp4haZZOXNfr8lISEdBwe4cvhRqVL748JAQEjQ7qr1Wd1jOmW2v15laU3zEJuykiaURg
 4IeEQ9lo+hnq9Gzad5Kv04EqM6TBrcLQRvq3WK1qSXT7M73HVCJz0I7ZspW0Y43msgQa
 733Q9g8SGLh0M9Q2nwk5flIpXTBviOc/oc4nRn5qN3JHWjzRuxS3BXRG/PZoi+2Y1xEh
 sN4GVRHlhOC98thM7xheO7YAvv1XmbahdqFib2xfdnPrWYLjndwNZpkHupQkXQ8Bkg0d
 JmPg==
X-Gm-Message-State: AOAM532/vnz4CqUJHd6gBGZxJzITgtX9502sRHK/MBOrLwFXz7M6Qv0+
 q7TnVzkopuqmy6flxtlkava9nw==
X-Google-Smtp-Source: ABdhPJz2kJKg6ucKnNqvzzNTIcKiPTrBAqNLCYGOzzpwmHkdMqYF9+ht7vmA5ZoTxLxeU2TuNJINGQ==
X-Received: by 2002:adf:ffcb:: with SMTP id x11mr82146wrs.158.1629141949201;
 Mon, 16 Aug 2021 12:25:49 -0700 (PDT)
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
Subject: [RFC PATCH 4/5] video/hdmi: Add audio_infoframe packing for DP
Date: Mon, 16 Aug 2021 21:25:22 +0200
Message-Id: <20210816192523.1739365-5-msp@baylibre.com>
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
2.32.0

