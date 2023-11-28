Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E917E7FB797
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4C10E4AC;
	Tue, 28 Nov 2023 10:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97C410E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:26:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E98961640;
 Tue, 28 Nov 2023 10:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B7EC433CC;
 Tue, 28 Nov 2023 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167171;
 bh=TGSMVN8rfPhwS5amDVMAYsc9HM0SUQlWIoXQfpiVcYQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=psFqhaQHVagCx5pxkXEF8PKqJEu5Wwg+RbmyTqYiJWsPDkik3oVDqgLriPzOh0QKE
 4svXDqND2qyaPZ8NDJTrhG52spikxI436hqjU+ZnlgRsDQwtYZ7Qe5p0Fz60zrn6aO
 k/BoN80cL5sh5vtu0+LFeTPEBc7yRtlql9+Kf9W1bxdJGXUMbsCmMdzmBDLUJy2GNH
 X3g2qGtfHCeNE4b76VIqgQaWIRRdwQqMqPgcCZuPCeun3tqliH1pM4L/agvY+/MHOV
 ZziYemX8fXYgL4Igth0zjzEB5uQ8QNZR+9iWsyWrIie8wiDl6AfxNYrQNCv1G7HFIS
 BcyooG6xViJzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:49 +0100
Subject: [PATCH v4 38/45] drm/rockchip: inno_hdmi: Switch to infoframe type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-38-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
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
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y+rFVgEKjwvvvVld9Ad073H2pukD7A96ZVQmcr+0
 n3WphbzjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkVjsjw7VpXZumq+n8nskc
 21qtbn531bSCN7sjG4wF/DzVvque4mVkuMReFlhoyqS5VDjDzk58npTgjFBu31/79FVfFjptnBX
 LAwA=
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

