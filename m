Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8377DD2F3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E149710E588;
	Tue, 31 Oct 2023 16:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AC310E588
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:49:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0D4361043;
 Tue, 31 Oct 2023 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD9C433CA;
 Tue, 31 Oct 2023 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770997;
 bh=j0kuHfqXTtY8F7hrGO9Pbcf8nYj5w/LWDfi3cdsMJFw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nSePuuJ7pKpbnQM088odLzOJALTEwMndAMSpMI/yAgaAV6SPnW7UXiHDDHz3tpCnn
 f9Njo1BLgympq8GVoux1g27ZvjorCv7MAe8z6NVTc7guddnbcL6CLhuQkEeQBAFO/x
 1pRal4ICjNBFSxI/IzHseVX+B5MvZDSu1j1PVGH0o9PLzd/CD5inD4K/5v4JPVeMMr
 jVAkb+lN/GraHwWZ0EcZ4rVAfcKwCB56TztX8Copagsxmcp8VJbB1U4m2aPkqz52h5
 nwqVEmJkf6QyLumhLz9868CjMgS1KmhjiQYu9s0FiNmTvA8IXLz3KFcwH1tUt4SJUo
 ziu/crrPHDdiw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:42 +0100
Subject: [PATCH RFC v3 29/37] drm/rockchip: inno_hdmi: Create mask
 retrieval functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-29-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4130; i=mripard@kernel.org;
 h=from:subject:message-id; bh=j0kuHfqXTtY8F7hrGO9Pbcf8nYj5w/LWDfi3cdsMJFw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+venb7pnF7/346NTer1r9xZtLepnX75j/Z39s0PVH
 T76hYgrdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiLayMDJ9K1/MFbHZXSzzE
 tzjpu/pU07mGys6JrMeY21/8ue7b3MLwP//FiVWbRZ69sw7JOlxp/9x+HuuNDWH2LWmNdyvOMj0
 LYAUA
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

The register mask and bits to enable or disable a given infoframe
depends on its type.

This is currently passed as an argument to the function that writes an
infoframe, but let's create a helper function to retrieve them based on
the type to make further reworks easier.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 75 ++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e3a421d98dd4..bc7fb1278cb2 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,10 +156,62 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
-				    u32 frame_index,
-				    u32 mask, u32 disable)
+static u32 inno_hdmi_get_frame_mask(struct inno_hdmi *hdmi,
+				    u32 frame_index)
 {
+	struct drm_device *drm = hdmi->connector.dev;
+
+	switch (frame_index) {
+	case INFOFRAME_VSI:
+		return m_PACKET_VSI_EN;
+	case INFOFRAME_AVI:
+		return 0;
+	default:
+		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+	}
+
+	return 0;
+}
+
+static u32 inno_hdmi_get_frame_disable(struct inno_hdmi *hdmi,
+				       u32 frame_index)
+{
+	struct drm_device *drm = hdmi->connector.dev;
+
+	switch (frame_index) {
+	case INFOFRAME_VSI:
+		return v_PACKET_VSI_EN(0);
+	case INFOFRAME_AVI:
+		return 0;
+	default:
+		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+	}
+
+	return 0;
+}
+
+static u32 inno_hdmi_get_frame_enable(struct inno_hdmi *hdmi,
+				      u32 frame_index)
+{
+	struct drm_device *drm = hdmi->connector.dev;
+
+	switch (frame_index) {
+	case INFOFRAME_VSI:
+		return v_PACKET_VSI_EN(1);
+	case INFOFRAME_AVI:
+		return 0;
+	default:
+		drm_err(drm, "Unknown infoframe type: %u\n", frame_index);
+	}
+
+	return 0;
+}
+
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
+{
+	u32 disable = inno_hdmi_get_frame_disable(hdmi, frame_index);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
+
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
 
@@ -167,13 +219,14 @@ static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+				  union hdmi_infoframe *frame, u32 frame_index)
 {
+	u32 enable = inno_hdmi_get_frame_enable(hdmi, frame_index);
+	u32 mask = inno_hdmi_get_frame_mask(hdmi, frame_index);
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t rc, i;
 
-	inno_hdmi_disable_frame(hdmi, frame_index, mask, disable);
+	inno_hdmi_disable_frame(hdmi, frame_index);
 
 	rc = hdmi_infoframe_pack(frame, packed_frame,
 				 sizeof(packed_frame));
@@ -200,13 +253,11 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 							 &hdmi->connector,
 							 mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI,
-					m_PACKET_VSI_EN, v_PACKET_VSI_EN(0));
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI);
 		return rc;
 	}
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI,
-		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI);
 }
 
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
@@ -219,13 +270,13 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      &hdmi->connector,
 						      mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI, 0, 0);
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
 		return rc;
 	}
 
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0

