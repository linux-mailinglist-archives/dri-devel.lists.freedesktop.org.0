Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4947A86FB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496BE10E4F0;
	Wed, 20 Sep 2023 14:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A27F897FF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:36:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84EA961CDB;
 Wed, 20 Sep 2023 14:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022C6C433C7;
 Wed, 20 Sep 2023 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695220613;
 bh=+5JYn8V0UryLv4NGrPj7TOsjDrccf86rOvDhC/BodNA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OZ+I9FweOxmoztsNgrZKhkpeT+XT95IbLMipMLu5MJZc0HRbOOUWSF43KXcGkgYUl
 BJrctQwvixE+bhBA2aETCX7R/Ko1ptlgF5eJUfC3skeomdN5cZzNQe0J7QA3g6nPTN
 WaLmnAdaWBPTX1VmtIZkPQxIRZXS2VxctqN8S4dxbo6VjcEe9EWqH/n9Y0S2p5lkEO
 1MfGfTXRPkcln77bnIWBhECU710sRjkqu4uj9kAyE+wTMdl3YckBv0P9+K8mD5ZWy4
 S7EnEOaRB7GGcy0zzkwdB0hrHWisMMI8NsOr2QeY4u4UxbwsDtmiT1kK9O8YPcX33p
 eki/lFY9aXbig==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:40 +0200
Subject: [PATCH RFC v2 25/37] drm/rockchip: inno_hdmi: Remove tmds rate
 from structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-25-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2323; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+5JYn8V0UryLv4NGrPj7TOsjDrccf86rOvDhC/BodNA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFZ/GBMFIp6xPXgu080ROWHOi8nTDJ7sN3Nq6wu7m
 rLGtLato5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPhn8TIcO3Nz8eNgsvVn2U2
 NAVeq/3q9eNyVNKvEwvzU5fNm3J7swzD/zCBMN308Lm/RM3XZjHPe1FsxMTHazipxzph76y83j0
 uDAA=
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

The tmds_rate field in the inno_hdmi structure is used mostly to
configure the internal i2c controller divider through a call to the
inno_hdmi_i2c_init() function.

We can simply make that rate an argument to that function, which also
removes a workaround to initialize the divider at probe time when we
don't have a mode yet.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f05417c6b637..35f44e556fcf 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -50,8 +50,6 @@ struct inno_hdmi {
 
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
-
-	unsigned int tmds_rate;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -155,11 +153,11 @@ static inline void hdmi_modb(struct inno_hdmi *hdmi, u16 offset,
 	hdmi_writeb(hdmi, offset, temp);
 }
 
-static void inno_hdmi_i2c_init(struct inno_hdmi *hdmi)
+static void inno_hdmi_i2c_init(struct inno_hdmi *hdmi, unsigned long long rate)
 {
-	int ddc_bus_freq;
+	unsigned long long ddc_bus_freq = rate >> 2;
 
-	ddc_bus_freq = (hdmi->tmds_rate >> 2) / HDMI_SCL_RATE;
+	do_div(ddc_bus_freq, HDMI_SCL_RATE);
 
 	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
 	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
@@ -389,8 +387,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	hdmi->tmds_rate = mode->clock * 1000;
-	inno_hdmi_i2c_init(hdmi);
+	inno_hdmi_i2c_init(hdmi, mode->clock * 1000);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -768,8 +765,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	 * PCLK_HDMI, so we need to init the TMDS rate to PCLK rate,
 	 * and reconfigure the DDC clock.
 	 */
-	hdmi->tmds_rate = clk_get_rate(hdmi->pclk);
-	inno_hdmi_i2c_init(hdmi);
+	inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)

-- 
2.41.0

