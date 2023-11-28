Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C07FB791
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAE710E4A2;
	Tue, 28 Nov 2023 10:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9854810E495
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:25:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2E91EB839FC;
 Tue, 28 Nov 2023 10:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3045BC433CB;
 Tue, 28 Nov 2023 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167151;
 bh=XYcftkSLjd/7MG53JZE43R8v3MnE5w+0sf3V4jSByaM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BvCgIlidubEErhDB077O2nB/RqbBLQodAsy+8igR0K3DD+mWaAeF580o+wf3eeXvy
 BmQClUznVHa+DYsOWuqtzbNFzLqfLMwirSvFnh4TbCTCwTmEtXv39XmnBhC6mqFcYv
 uDDSsHKUUMDukGlk2P0fKo2ji0LbWwXfAyFgbkJ2KIdXX8iqFzn3fKg/BQBfnn0DgZ
 vMyG6FH0RxV3ZFVLUh7djyvFo+jH22ZSOMKsJmTwMFR0+o0DffCosIoP20mtx+3Osg
 J5FynXFdjzmxKDpSx0BEzVXKlgniMI7klmQzaVWHPC+P2IOwT9ICfhNnWoQD9N6lxu
 U604w87npq5VQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:42 +0100
Subject: [PATCH v4 31/45] drm/rockchip: inno_hdmi: Remove useless colorimetry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-31-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XYcftkSLjd/7MG53JZE43R8v3MnE5w+0sf3V4jSByaM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y/ZCqg/f8q9pN0rTk9129fHczoOWu+ymhmi80gt+
 xhfgNTEjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEt5yR4fz7C99L9jqni+7K
 +eTw5cVSR9dT8o1mzvMNPipsP7g605XhfyR3pMd650cvZrEtuXNvXxiLY8xbgzNzKi9HrnlkLt2
 TywoA
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

The colorimetry field of hdmi_data_info is not used anywhere so we can
get rid of it. This was the last field left in that structure so we can
get rid of it too.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 0c6c550e0ce7..c342bc8b3a23 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -27,10 +27,6 @@
 
 #include "inno_hdmi.h"
 
-struct hdmi_data_info {
-	unsigned int colorimetry;
-};
-
 struct inno_hdmi_i2c {
 	struct i2c_adapter adap;
 
@@ -56,8 +52,6 @@ struct inno_hdmi {
 	struct i2c_adapter *ddc;
 
 	unsigned int tmds_rate;
-
-	struct hdmi_data_info	hdmi_data;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -380,15 +374,6 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_display_mode *mode)
 {
 	struct drm_display_info *display = &hdmi->connector.display_info;
-	u8 vic = drm_match_cea_mode(mode);
-
-	if ((vic == 6) || (vic == 7) ||
-	    (vic == 21) || (vic == 22) ||
-	    (vic == 2) || (vic == 3) ||
-	    (vic == 17) || (vic == 18))
-		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
-	else
-		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;
 
 	/* Mute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,

-- 
2.41.0

