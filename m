Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16497FB79A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962BB10E4A9;
	Tue, 28 Nov 2023 10:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CFC10E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE21B61640;
 Tue, 28 Nov 2023 10:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A38C433C9;
 Tue, 28 Nov 2023 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167165;
 bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=q2lgU+wjsjlnljKK6MWooDjLCDxgcpGcRDobDJwZWY4kiE3Zak+fPk+Pf49qm8jiq
 vu7EkrqA4TGKW5Gu85V8Cyd+2E5dEPzgRMKyHjKkXSgihX1/ax6LmQG6wbPdhw7ujl
 QJ79Da3iG9tkuqj0YTdlC7oFAsa2RHP/XUe/AyvqOQGbJuSQBPL2yo39u+8PlaaTkQ
 jSbxZu2PpmzlXeqyJ8WnC2k3dR8wvtsJgv1wcJvN4vTFJMXqpFcAn/7+eFUM9bearS
 kUA8Hj8GL7RWBc1Yh53HTVMSy+NLsANpmlUCh/ehHpdTWtW8CodvYhYTp8HzCISdiT
 1UYO3DNs/EfLw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:47 +0100
Subject: [PATCH v4 36/45] drm/rockchip: inno_hdmi: Move infoframe disable
 to separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-36-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525; i=mripard@kernel.org;
 h=from:subject:message-id; bh=a4BpgPVlN4us8i8ZAKm55WYfRM8D4UzuiG9jC3POA78=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y9Nfv1OZGm5s46o1PJp80zytnjNl/+wsrvSxdKML
 Ua6UFi8o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOp4WP4X1MZpBSj5no/8egH
 5ftXudrOZH6ofXbkTZSkz8bLyZV6HQx/5VnlbUQv7Exc8WvxS9f3Ba8+sLA9mf5n7TvpDdLSJac
 TOAA=
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

The code to upload infoframes to the controller uses a weird construct
which, based on the previous function call return code, will either
disable or enable that infoframe.

In order to get rid of that argument, let's split the function to
disable the infoframe into a separate function and make it obvious what
we are doing in the error path.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 53 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 59b2b676b7b8..e3a421d98dd4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -156,33 +156,38 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index,
-				  u32 mask, u32 disable, u32 enable)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    u32 frame_index,
+				    u32 mask, u32 disable)
 {
 	if (mask)
 		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, disable);
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+}
 
-	if (setup_rc >= 0) {
-		u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-		ssize_t rc, i;
+static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
+				  union hdmi_infoframe *frame, u32 frame_index,
+				  u32 mask, u32 disable, u32 enable)
+{
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t rc, i;
 
-		rc = hdmi_infoframe_pack(frame, packed_frame,
-					 sizeof(packed_frame));
-		if (rc < 0)
-			return rc;
+	inno_hdmi_disable_frame(hdmi, frame_index, mask, disable);
 
-		for (i = 0; i < rc; i++)
-			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-				    packed_frame[i]);
+	rc = hdmi_infoframe_pack(frame, packed_frame,
+				 sizeof(packed_frame));
+	if (rc < 0)
+		return rc;
 
-		if (mask)
-			hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
-	}
+	for (i = 0; i < rc; i++)
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
+			    packed_frame[i]);
 
-	return setup_rc;
+	if (mask)
+		hdmi_modb(hdmi, HDMI_PACKET_SEND_AUTO, mask, enable);
+
+	return 0;
 }
 
 static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
@@ -194,8 +199,13 @@ static int inno_hdmi_config_video_vsi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_vendor_infoframe_from_display_mode(&frame.vendor.hdmi,
 							 &hdmi->connector,
 							 mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_VSI,
+					m_PACKET_VSI_EN, v_PACKET_VSI_EN(0));
+		return rc;
+	}
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_VSI,
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_VSI,
 		m_PACKET_VSI_EN, v_PACKET_VSI_EN(0), v_PACKET_VSI_EN(1));
 }
 
@@ -208,9 +218,14 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector,
 						      mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI, 0, 0);
+		return rc;
+	}
+
 	frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI, 0, 0, 0);
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI, 0, 0, 0);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)

-- 
2.41.0

