Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA2808C73
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566610E8FA;
	Thu,  7 Dec 2023 15:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA110E8EB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:50:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 52641CE1D03;
 Thu,  7 Dec 2023 15:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03B4C433AD;
 Thu,  7 Dec 2023 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964249;
 bh=6Qw4iLH/F2FcU5c/z9vvLxUq+OTnYrPseK/QX6rHEgg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NHqm3bJyNCcxD+W/rJS6ll92pIGyo56Ab0+qJWrPG1jpdp/T8JfKFwVIg7zMkQLxN
 p3DGpMbj92H/3WKPYgEyckfhFIWd/5w/BLxrWj5NpXuxD/E3szfpW94cY3GQsi0HfL
 KLtWvna3VBKlSpsCrbi/lNeJuik6MtqQyBZJRUL3GkvOYs13AMFYltEcfMT15cYDwN
 ZJYI5zFPL2viLiwjbs/VwlUehjLiWID/NkHi1CJGbcCD4AT9FhpC5r1dhJ5TJZNT/N
 jerOfrIwsqx+7DmYktfHaTdFP5c5+PeunLodXLvZzqfn5+KZaXrB8vRvo7zeE3/AdY
 HJ8GC8joHIo7w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:50 +0100
Subject: [PATCH v5 27/44] drm/rockchip: inno_hdmi: Remove unneeded has
 audio flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-27-6538e19d634d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6Qw4iLH/F2FcU5c/z9vvLxUq+OTnYrPseK/QX6rHEgg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL9t0lQwOppzSObi0RPhCGLeHqe8SmQq7a4vlD0Z1f
 BKdn5LQUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIksT2RkeMdQn2r290Nx0xV3
 lzOOcj+D6qzls9a66ESeU5vc5bywnpHhktJqh43+DAUb3TWLBW7c9vgz89opkY+GL+20/qTnZMU
 xAQA=
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
2.43.0

