Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609557A8700
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4EE10E4EF;
	Wed, 20 Sep 2023 14:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3F110E4EF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:37:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90D4BB81D88;
 Wed, 20 Sep 2023 14:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC105C433CB;
 Wed, 20 Sep 2023 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695220627;
 bh=TGSMVN8rfPhwS5amDVMAYsc9HM0SUQlWIoXQfpiVcYQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OrPevwjvY7nCca+nEY+ZoXHY2KLWmgoGSwcemuq07e6T6K3nCIJRL76f5Tx3fG1Q+
 IFVR1BV3roZYB05WzpTtYOcemKrR8HytpJTnKd4ilnzwBndtWNytCEPM1gnygBOWUX
 PNgndcKT28BNCNlLCUTt2nD3CZY64rb3egVb0uYStWxS1EyQ9zxjP1/lyT+D5r2H/Y
 B5AMW0Z5vrC07ajos6GWkzHiNcj/bonVNBw2PQu+T7ZfIM7ptRhirQh4X/NkHWqs8r
 Q2cBeZAfcUnqMpYLWVr71sazcVA64rFi9/LfYQp6vJQ5qFo+WzqSAkPqS58tfR9vyl
 xnDTbIhLP7XMQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:45 +0200
Subject: [PATCH RFC v2 30/37] drm/rockchip: inno_hdmi: Switch to infoframe type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-30-17932daddd7d@kernel.org>
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5167; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TGSMVN8rfPhwS5amDVMAYsc9HM0SUQlWIoXQfpiVcYQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFbRLrt2//i3u7ThVGGtpDST/LXeczP+XxeV/LNRX
 0Ql1n9hRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbyvpHhf4ajutzefXMuLTsT
 s/D56eMcrutkMjet2ePXod1k9O/kMzWGvxIat3iyPilPczWf+2ap5Gn2BdelvzpaNz14wmC3Y+b
 h91wA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inno_hdmi driver relies on its own internal infoframe type matching
the hardware.

This works fine, but in order to make further reworks easier, let's
switch to the HDMI spec definition of those types.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 71 +++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index bc7fb1278cb2..ed1d10efbef4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,61 +156,80 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
+static u32 inno_hdmi_get_frame_index(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
+{
+	struct drm_device *drm = hdmi->connector.dev;
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return INFOFRAME_VSI;
+	case HDMI_INFOFRAME_TYPE_AVI:
+		return INFOFRAME_AVI;
+	default:
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
+	}
+
+	return 0;
+}
+
 static u32 inno_hdmi_get_frame_mask(struct inno_hdmi *hdmi,
-				    u32 frame_index)
+				    enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return m_PACKET_VSI_EN;
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
 static u32 inno_hdmi_get_frame_disable(struct inno_hdmi *hdmi,
-				       u32 frame_index)
+				       enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return v_PACKET_VSI_EN(0);
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
 static u32 inno_hdmi_get_frame_enable(struct inno_hdmi *hdmi,
-				      u32 frame_index)
+				      enum hdmi_infoframe_type type)
 {
 	struct drm_device *drm = hdmi->connector.dev;
 
-	switch (frame_index) {
-	case INFOFRAME_VSI:
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return v_PACKET_VSI_EN(1);
-	case INFOFRAME_AVI:
+	case HDMI_INFOFRAME_TYPE_AVI:
 		return 0;
 	default:
-		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+		drm_err(drm, "Unknown infoframe type: %u\n", type);
 	}
 
 	return 0;
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
 {
-	u32 disable = inno_hdmi_get_frame_disable(hdmi, frame_index);
-	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
+	u32 frame_index = inno_hdmi_get_frame_index(hdmi, type);
+	u32 disable = inno_hdmi_get_frame_disable(hdmi, type);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
 
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
@@ -219,14 +238,14 @@ static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, u32 frame_index)
+				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
 {
-	u32 enable = inno_hdmi_get_frame_enable(hdmi, frame_index);
-	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
+	u32 enable = inno_hdmi_get_frame_enable(hdmi, type);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, type);
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t rc, i;
 
-	inno_hdmi_disable_frame(hdmi, frame_index);
+	inno_hdmi_disable_frame(hdmi, type);
 
 	rc = hdmi_infoframe_pack(frame, packed_frame,
 				 sizeof(packed_frame));
@@ -253,11 +272,11 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 							 &hdmi->connector,
 							 mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_VENDOR);
 		return rc;
 	}
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_VENDOR);
 }
 
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
@@ -270,13 +289,13 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      &hdmi->connector,
 						      mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
 		return rc;
 	}
 
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0

