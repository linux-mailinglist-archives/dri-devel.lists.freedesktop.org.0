Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3379808C7F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C3810E903;
	Thu,  7 Dec 2023 15:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494510E905
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:51:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EE9AFB826AC;
 Thu,  7 Dec 2023 15:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB55C433C8;
 Thu,  7 Dec 2023 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964265;
 bh=qznHkDob5xif2U6ALClDkLNlMhqUUoLAqy8NPCFOlCo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=C+mXiOz0cLMJ8D7x9vBVUWKVpfRxV8VVJxKzokbrouwEC2heMtdfMg5qQ8zouXSoq
 OaYxwTUtX6QT9qr/17C2e/sqW7Kk0MhSlswvWhZ1IRYNwEl+ljCFIHXeu/izA5LSW+
 0bPGk1UaqIYWUsXT9equfT7QEcSbt+V3YywZqklDQFMv8R65/Q4oSNs2EFl2XuSp+2
 uI4b+hlgbVhkHU8cCssR6o37SwIpFcCyA4QEmyCpj8u5LZCBTA/mXp5aTfqr+t2coD
 ioKWvAKaEOdBEPbHBM1YdgWXC+XPuriamYyycRd/ny61avCPpl1so79e0zNTRmUDg3
 aztt0E5ddJRMA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:56 +0100
Subject: [PATCH v5 33/44] drm/rockchip: inno_hdmi: Remove useless coeff_csc
 matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-33-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qznHkDob5xif2U6ALClDkLNlMhqUUoLAqy8NPCFOlCo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9u0slrmCu4tajm/IrGV+2oR75xPs1tl2vfFl2f2V
 xVOZc3uKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwESW2jMynF7ptXyWsQfz1jrx
 fCG2XSWZQkreXzgq5qdeKD1lxJpyieG/O9eBHRdb63w2JC3a4z7vWEmY6fnchQV5wg+uHvlm8M2
 NAQA=
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

The coeff_csc matrix isn't used anymore, let's remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 70 ------------------------------------
 1 file changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 35f44e556fcf..e4fe02b79a98 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -64,76 +64,6 @@ static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
 	return container_of(connector, struct inno_hdmi, connector);
 }
 
-static const char coeff_csc[][24] = {
-	/*
-	 * YUV2RGB:601 SD mode(Y[16:235], UV[16:240], RGB[0:255]):
-	 *   R = 1.164*Y + 1.596*V - 204
-	 *   G = 1.164*Y - 0.391*U - 0.813*V + 154
-	 *   B = 1.164*Y + 2.018*U - 258
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x06, 0x62, 0x02, 0xcc,
-		0x04, 0xa7, 0x11, 0x90, 0x13, 0x40, 0x00, 0x9a,
-		0x04, 0xa7, 0x08, 0x12, 0x00, 0x00, 0x03, 0x02
-	},
-	/*
-	 * YUV2RGB:601 SD mode(YUV[0:255],RGB[0:255]):
-	 *   R = Y + 1.402*V - 248
-	 *   G = Y - 0.344*U - 0.714*V + 135
-	 *   B = Y + 1.772*U - 227
-	 */
-	{
-		0x04, 0x00, 0x00, 0x00, 0x05, 0x9b, 0x02, 0xf8,
-		0x04, 0x00, 0x11, 0x60, 0x12, 0xdb, 0x00, 0x87,
-		0x04, 0x00, 0x07, 0x16, 0x00, 0x00, 0x02, 0xe3
-	},
-	/*
-	 * YUV2RGB:709 HD mode(Y[16:235],UV[16:240],RGB[0:255]):
-	 *   R = 1.164*Y + 1.793*V - 248
-	 *   G = 1.164*Y - 0.213*U - 0.534*V + 77
-	 *   B = 1.164*Y + 2.115*U - 289
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x07, 0x2c, 0x02, 0xf8,
-		0x04, 0xa7, 0x10, 0xda, 0x12, 0x22, 0x00, 0x4d,
-		0x04, 0xa7, 0x08, 0x74, 0x00, 0x00, 0x03, 0x21
-	},
-
-	/*
-	 * RGB2YUV:601 SD mode:
-	 *   Cb = -0.291G - 0.148R + 0.439B + 128
-	 *   Y  = 0.504G  + 0.257R + 0.098B + 16
-	 *   Cr = -0.368G + 0.439R - 0.071B + 128
-	 */
-	{
-		0x11, 0x5f, 0x01, 0x82, 0x10, 0x23, 0x00, 0x80,
-		0x02, 0x1c, 0x00, 0xa1, 0x00, 0x36, 0x00, 0x1e,
-		0x11, 0x29, 0x10, 0x59, 0x01, 0x82, 0x00, 0x80
-	},
-	/*
-	 * RGB2YUV:709 HD mode:
-	 *   Cb = - 0.338G - 0.101R + 0.439B + 128
-	 *   Y  = 0.614G   + 0.183R + 0.062B + 16
-	 *   Cr = - 0.399G + 0.439R - 0.040B + 128
-	 */
-	{
-		0x11, 0x98, 0x01, 0xc1, 0x10, 0x28, 0x00, 0x80,
-		0x02, 0x74, 0x00, 0xbb, 0x00, 0x3f, 0x00, 0x10,
-		0x11, 0x5a, 0x10, 0x67, 0x01, 0xc1, 0x00, 0x80
-	},
-	/*
-	 * RGB[0:255]2RGB[16:235]:
-	 *   R' = R x (235-16)/255 + 16;
-	 *   G' = G x (235-16)/255 + 16;
-	 *   B' = B x (235-16)/255 + 16;
-	 */
-	{
-		0x00, 0x00, 0x03, 0x6F, 0x00, 0x00, 0x00, 0x10,
-		0x03, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,
-		0x00, 0x00, 0x00, 0x00, 0x03, 0x6F, 0x00, 0x10
-	},
-};
-
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
 	return readl_relaxed(hdmi->regs + (offset) * 0x04);

-- 
2.43.0

