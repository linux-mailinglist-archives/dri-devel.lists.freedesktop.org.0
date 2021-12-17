Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19527478F2B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 16:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B448112AE7;
	Fri, 17 Dec 2021 15:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66982112AEB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 15:09:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso2880679wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Up09Yp1cAkGEwJVvJMibaaAPFlik/zZFWIRClXIemi8=;
 b=w1dCitzgFM18nBrWvxwAhiWQ2U9K9or8m5bXF+xrx8B4orBEu+MDVMlipV9lMKbH9r
 ZXD2HeINf75jbH87ufUzqy/pYJbvK9F68/+WMi4lJBxPhxAyjQ8bX7rZClyM8mol/lwF
 4DuCgcjx23j+iHeZnH108XPldhLkQZFnidbJASG16jhpDlnB6hF9t2nnbNQC7v4z3i3g
 10D11aoEOEsrnz46b17+mohy452A9cBeTMm+QT0NQ42fR+ai1f0ApfyikTSzMRFdQS2N
 eSLIuz+x8rECkbGfXOtJf/ZBeBsxU0mm/5N8RHqXQYrRtXvypvkEsWU0Eay0MHTCXL2R
 60GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Up09Yp1cAkGEwJVvJMibaaAPFlik/zZFWIRClXIemi8=;
 b=IPbAmbJDT6lvgcii48FG5TdTVRzlDeHQmm5zCBASYqXz8NhRoWyJBuxKrq3bjVDUtW
 RExw0jGKRT97Qq0vbdbQKk5t7Bf71S+rBJSV1xAui84xFWna/TMZpJya4RffCc5W/klD
 UgQKeXrs0Ggco4Q7rEB0Iu7JzFeu9SbMgymDXW0I50m25hqMF98fyHOtgrlO7ALo0dhp
 l3WeDfMtIfp4jQnfSOz51FPubLNJ3wr7ZXskOWEssIGw8bZR4yNZWCS2fH/SgkkfScjr
 sVprQeNEIzvKTTTis2zHK4KTyHd+CeP7l/ePBW/D3mvIr6dRxvbsNwTkMeD14ylDabod
 gKPg==
X-Gm-Message-State: AOAM531rTJjW6kNpAfhd7D/zg3Yj1q5LdGQAODh1j4MxR5Oiz3EPRAc3
 KH56hQjX8nrV3SCufa0bVTLIsg==
X-Google-Smtp-Source: ABdhPJx/CmzTz4hfWlCf7wkrnjgSBJqWjHMqIudgkLYddUXKt9Cg3ApJBHWUwURuJ4AYzvLYDbWqvw==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr9764050wms.123.1639753763957; 
 Fri, 17 Dec 2021 07:09:23 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6441-43a4-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6441:43a4:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id g18sm12655132wmq.4.2021.12.17.07.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:09:23 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 4/8] video/hdmi: Add audio_infoframe packing for DP
Date: Fri, 17 Dec 2021 16:08:50 +0100
Message-Id: <20211217150854.2081-5-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211217150854.2081-1-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Schneider-Pargmann <msp@baylibre.com>

Similar to HDMI, DP uses audio infoframes as well which are structured
very similar to the HDMI ones.

This patch adds a helper function to pack the HDMI audio infoframe for
DP, called hdmi_audio_infoframe_pack_for_dp().
hdmi_audio_infoframe_pack_only() is split into two parts. One of them
packs the payload only and can be used for HDMI and DP.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/video/hdmi.c        | 83 ++++++++++++++++++++++++++++---------
 include/drm/drm_dp_helper.h |  2 +
 include/linux/hdmi.h        |  7 +++-
 3 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
index 947be761dfa40..63e74d9fd210e 100644
--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <drm/drm_dp_helper.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
@@ -381,12 +382,34 @@ static int hdmi_audio_infoframe_check_only(const struct hdmi_audio_infoframe *fr
  *
  * Returns 0 on success or a negative error code on failure.
  */
-int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame)
+int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame)
 {
 	return hdmi_audio_infoframe_check_only(frame);
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
@@ -404,7 +427,6 @@ EXPORT_SYMBOL(hdmi_audio_infoframe_check);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size)
 {
-	unsigned char channels;
 	u8 *ptr = buffer;
 	size_t length;
 	int ret;
@@ -420,28 +442,13 @@ ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 
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
 
@@ -479,6 +486,44 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 }
 EXPORT_SYMBOL(hdmi_audio_infoframe_pack);
 
+/**
+ * hdmi_audio_infoframe_pack_for_dp - Pack a HDMI Audio infoframe for
+ *                                    displayport
+ *
+ * @frame HDMI Audio infoframe
+ * @sdp secondary data packet for display port. This is filled with the
+ * appropriate data
+ * @dp_version Display Port version to be encoded in the header
+ *
+ * Packs a HDMI Audio Infoframe to be sent over Display Port. This function
+ * fills the secondary data packet to be used for Display Port.
+ *
+ * Return: Number of total written bytes or a negative errno on failure.
+ */
+ssize_t
+hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
+				 struct dp_sdp *sdp, u8 dp_version)
+{
+	int ret;
+
+	ret = hdmi_audio_infoframe_check(frame);
+	if (ret)
+		return ret;
+
+	memset(sdp->db, 0, sizeof(sdp->db));
+
+	// Secondary-data packet header
+	sdp->sdp_header.HB0 = 0;
+	sdp->sdp_header.HB1 = frame->type;
+	sdp->sdp_header.HB2 = DP_SDP_AUDIO_INFOFRAME_HB2;
+	sdp->sdp_header.HB3 = (dp_version & 0x3f) << 2;
+
+	hdmi_audio_infoframe_pack_payload(frame, sdp->db);
+
+	return frame->length + 4;
+}
+EXPORT_SYMBOL(hdmi_audio_infoframe_pack_for_dp);
+
 /**
  * hdmi_vendor_infoframe_init() - initialize an HDMI vendor infoframe
  * @frame: HDMI vendor infoframe
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b52df4db3e8fe..d1527175716aa 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1550,6 +1550,8 @@ int drm_dp_bw_code_to_link_rate(u8 link_bw);
 #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
 /* 0x80+ CEA-861 infoframe types */
 
+#define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
+
 /**
  * struct dp_sdp_header - DP secondary data packet header
  * @HB0: Secondary Data Packet ID
diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index c8ec982ff4984..2f4dcc8d060e3 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -336,7 +336,12 @@ ssize_t hdmi_audio_infoframe_pack(struct hdmi_audio_infoframe *frame,
 				  void *buffer, size_t size);
 ssize_t hdmi_audio_infoframe_pack_only(const struct hdmi_audio_infoframe *frame,
 				       void *buffer, size_t size);
-int hdmi_audio_infoframe_check(struct hdmi_audio_infoframe *frame);
+int hdmi_audio_infoframe_check(const struct hdmi_audio_infoframe *frame);
+
+struct dp_sdp;
+ssize_t
+hdmi_audio_infoframe_pack_for_dp(const struct hdmi_audio_infoframe *frame,
+				 struct dp_sdp *sdp, u8 dp_version);
 
 enum hdmi_3d_structure {
 	HDMI_3D_STRUCTURE_INVALID = -1,
-- 
2.32.0

