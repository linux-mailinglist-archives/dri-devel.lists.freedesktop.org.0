Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7147A86E5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8E010E4E3;
	Wed, 20 Sep 2023 14:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3CF10E4DF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:36:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FDC761CD3;
 Wed, 20 Sep 2023 14:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10151C433C8;
 Wed, 20 Sep 2023 14:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695220599;
 bh=612NFeh5NOImp0JEmAQppe78uklCbIwDoN+fmJSIsz0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RmjQJGqHnwXWN/LOAwR+eZGFjPd6bbcva2EllOuLaYiXTetvvaJe+LOzWUmXP/VnA
 SEuOKCf1G/Sfh74r5f6g4G/yUxxzcBfQlmhjPzL77qbEddnzkuCogLuajdZhkjc6pY
 6BG0Cdg8aUt9HyeDo1kb53hgHb6Gow9yS+sKcM434Xlwvb2Njm7fntYRvyR5ZsXKf9
 nWbKnmtNkBK9efIjDEhjMEzGkZsrR7ipzLjrk3bRBQSreQv9ynasJyoMKi0RMsUKg8
 WKIW6b9APj0KDuAXlrwzI6L2oDiA8NEaLcdp5kIMg3AYuYKccaRIpsxga3u2pn4sFe
 GiVnkGAVuET1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 20 Sep 2023 16:35:35 +0200
Subject: [PATCH RFC v2 20/37] drm/rockchip: inno_hdmi: Remove unneeded has
 audio flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kms-hdmi-connector-state-v2-20-17932daddd7d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=mripard@kernel.org;
 h=from:subject:message-id; bh=612NFeh5NOImp0JEmAQppe78uklCbIwDoN+fmJSIsz0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnczFZR9Ty6coK/5XpP97q+EqvfHCPlGxNcrL3KsHPex
 FNPurZ0lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCKCuxn+V9028rcIen2m74zr
 mkOP5G/wRd6SfOBSe8L+qVt+5vnvRxkZttiLL5jVucPle1XjvxuW2yWDvRt0jutJOc6/PXPunAO
 CvAA=
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

The sink_has_audio flag is not used anywhere in the driver so let's get
rid of it. It's redundant with drm_display_info.has_audio anyway.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 294f0d442c0c..3908dc09d85f 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	bool sink_has_audio;
 	unsigned int enc_in_format;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
@@ -554,7 +553,6 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);

-- 
2.41.0

