Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23367FB79B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ECD10E49B;
	Tue, 28 Nov 2023 10:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1910E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:26:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 07691CE193B;
 Tue, 28 Nov 2023 10:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9340C433CA;
 Tue, 28 Nov 2023 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701167179;
 bh=c0jADGC6TjAEj2UIRZa0xYYM+pIDgthxehFYDaZ1tpk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IIEdA55PNmhCheulDzBMd2sY6UaWH7VjNyg5ce7UwwH0X9L9VdnXWHHAODiBPFyLO
 qMUxJ0DUGEUD9vX1+sGre4jRZniTk+fzgdmApQDW1kLlFsxZG9hwymMhAzkzc4SxfE
 QMk3EQhKZk73AZWIkdOphc2M4xofwU/uLie2TRr4/XBkzc93NcOKDM/y4PkN6b5pF+
 TUCG4htx7qsmv7ooxbO6Hawcb3NmoKmdc9J0STAv1RA4qc85xMnnAWiivG5V6NOVht
 UIsdMgntR5Nxkryl9bS3dD+Qv/Caggty0KnB3pJWTr0vh3QIt7bnJmbDN8CSJENvoA
 Jev6I47PRoEWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:52 +0100
Subject: [PATCH v4 41/45] drm/sun4i: hdmi: Convert encoder to atomic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-41-c7602158306e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311; i=mripard@kernel.org;
 h=from:subject:message-id; bh=c0jADGC6TjAEj2UIRZa0xYYM+pIDgthxehFYDaZ1tpk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y87KHwJErVqbnpsNFWhyERp+zTliKxwkXu/NxxrL
 NRlUpDqKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETOZzP8z77gc+b6/Lx2K1Ob
 Jb5rWZs2/v55TH3KG6aQf/dWR3JM52b4p+BzXP9golbWhKMH7zX0Tn7q9v6yj83s9ly9J5nzdLj
 n8QMA
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

The sun4i_hdmi driver still uses the non-atomic variants of the encoder
hooks, so let's convert to their atomic equivalents.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 152375f3de2e..799a26215cc2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -82,7 +82,8 @@ static int sun4i_hdmi_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
-static void sun4i_hdmi_disable(struct drm_encoder *encoder)
+static void sun4i_hdmi_disable(struct drm_encoder *encoder,
+			       struct drm_atomic_state *state)
 {
 	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
 	u32 val;
@@ -96,7 +97,8 @@ static void sun4i_hdmi_disable(struct drm_encoder *encoder)
 	clk_disable_unprepare(hdmi->tmds_clk);
 }
 
-static void sun4i_hdmi_enable(struct drm_encoder *encoder)
+static void sun4i_hdmi_enable(struct drm_encoder *encoder,
+			      struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
@@ -120,9 +122,10 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
 }
 
 static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
 {
+	const struct drm_display_mode *mode = &crtc_state->mode;
 	struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
 	unsigned int x, y;
 	u32 val;
@@ -201,9 +204,9 @@ static enum drm_mode_status sun4i_hdmi_mode_valid(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs sun4i_hdmi_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_atomic_check,
-	.disable	= sun4i_hdmi_disable,
-	.enable		= sun4i_hdmi_enable,
-	.mode_set	= sun4i_hdmi_mode_set,
+	.atomic_disable	= sun4i_hdmi_disable,
+	.atomic_enable	= sun4i_hdmi_enable,
+	.atomic_mode_set	= sun4i_hdmi_mode_set,
 	.mode_valid	= sun4i_hdmi_mode_valid,
 };
 

-- 
2.41.0

