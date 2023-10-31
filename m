Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3D7DD2E1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555310E585;
	Tue, 31 Oct 2023 16:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E7210E586
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:49:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E4C36102A;
 Tue, 31 Oct 2023 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7200C433D9;
 Tue, 31 Oct 2023 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698770961;
 bh=hjO1thsBtNWKgoDt95oSE/97xbheY9O5MXtc459uiLk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eO8w93dpaAwkGijK5tNBw//6sqqm8PohRQimWd7JyU27VhGzpEE3T5i9hG+55fYbh
 Al1BQqBsSkPmmrdBSfjgx/Abzdpnwm+IJpk0jh3Nnxi+nDaEiU+1ocymPTdzndUr5S
 cJY0x0erIvwHqVRv/0erjStDz8zasg3DsJ8PMs5q3kz53AymJgOSpcClaKQtVwSJOJ
 D91qYMpfaVH+5gQtJbsa+KNtG89KzvA8WCOkeGnOC55RoZ+SxzJusUis1ET5+aksJ1
 FFiLrTVWXAl18eR3jFG2z5LeZpJnmy8l2S0RXrimnv167HyU3NkSYNVpFAkqSPhwRm
 GdaOSs700Sk6g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:29 +0100
Subject: [PATCH RFC v3 16/37] drm/rockchip: inno_hdmi: Remove useless copy
 of drm_display_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-16-328b0fae43a7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hjO1thsBtNWKgoDt95oSE/97xbheY9O5MXtc459uiLk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+vf27E3KXeoamlw1xXTrpl0b3YrvWKvzh+mvux63a
 vs1g+9JHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIeTaGPzwn2hKSjk74L1Hc
 WZoVVr6yoGHbpaYUqcXdEx5PlrTfvp7hv4fm589cBwUPcemYJGxW/7/N8NVD5TkCzdtsfsS01O6
 LZwYA
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

The driver maintains a copy of the adjusted mode but doesn't use it
anywhere. Remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index cc48cbf85f31..4f5844fc115a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -62,7 +62,6 @@ struct inno_hdmi {
 	unsigned int tmds_rate;
 
 	struct hdmi_data_info	hdmi_data;
-	struct drm_display_mode previous_mode;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -498,9 +497,6 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_setup(hdmi, adj_mode);
-
-	/* Store the display mode for plugin/DPMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, adj_mode);
 }
 
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)

-- 
2.41.0

