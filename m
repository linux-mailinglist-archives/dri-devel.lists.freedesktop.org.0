Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4865808C7D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69310E904;
	Thu,  7 Dec 2023 15:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD510E903
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 04E51CE1D04;
 Thu,  7 Dec 2023 15:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58FFC433C7;
 Thu,  7 Dec 2023 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964257;
 bh=1gyDO0Ub+FFM7woxg35ZPgg7AJCC7fJ3SbEpd7YB97w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TyVW/q6VgOeUf2SuU4pGNTDUCt6fuhwDRnhu8bdEqgEqDxKmF0hUbVbCWuaYCaH5H
 +nJs0vR2/fc9Uoj3YHm69HlPD8R6yocpwcJYS6GUQ8Vmxc7xF7zSki08PMwbTbE6dH
 I7LN9VdNvlOwWEF8T7VuTVqQErZZY5w60QovoelprswXfv1DSCIsOMCjakB7W6WoiK
 EFJICB3XBsEpVE4S/763hUfU+9p2VLv5L44JzW7Ddx6wnQ4a59Cvfn9CfJT+440ux9
 PCI84HhEhL0in8omJX00DhPB03DQoueHcZZDBoaHa/PDrp4EAKO6X2mnN/4Y/qxtsw
 VmsnWi+5he6nw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:53 +0100
Subject: [PATCH v5 30/44] drm/rockchip: inno_hdmi: Remove useless colorimetry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-30-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1gyDO0Ub+FFM7woxg35ZPgg7AJCC7fJ3SbEpd7YB97w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9uqJPm3c6et9XBKeZcx72T0cft6HVulbO1va6pST
 P537zXoKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERk6hkZjuwwyTcqnXJ/2xSP
 S2d6rim/8l7R0/97YVCU3HvVrB8uyYwMz2tDZ6s9b3wX4iu2dNu0ANHoXTY83U9+7LD0EghO/tX
 MAAA=
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
2.43.0

